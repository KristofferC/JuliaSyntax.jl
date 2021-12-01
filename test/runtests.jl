using JuliaSyntax
using Test

#@testset "JuliaSyntax.jl" begin
    # Write your tests here.
#end


using JuliaSyntax: SourceFile
using JuliaSyntax: RawSyntaxNode, SyntaxNode, raw_flags
using JuliaSyntax: Kind, @K_str, children, child, setchild!
using JuliaSyntax: highlight

#-------------------------------------------------------------------------------
# Raw syntax tree and AST layering

# Trivia nodes
T(k, s) = RawSyntaxNode(k, s, raw_flags(trivia=true))
# Non-trivia nodes
N(k, s) = RawSyntaxNode(k, s)
N(k, args::RawSyntaxNode...) = RawSyntaxNode(k, args...)
# Non-trivia, infix form
NI(k, args::RawSyntaxNode...) = RawSyntaxNode(k, raw_flags(infix=true), args...)

# For this code:
code = """
for i = 1:10
    a + 2
    # hi
    c
end
"""

source = SourceFile(code, filename="none.jl")

# We'd like to produce something the following raw tree
t =
N(K"for",
  T(K"for", 3),
  T(K" ", 1),
  N(K"=",
    N(K"Identifier", 1),
    T(K" ", 1),
    T(K"=", 1),
    T(K" ", 1),
    NI(K"call",
      N(K"Integer", 1),
      N(K":", 1),
      N(K"Integer", 2))),
  N(K"block", 
    T(K"\n", 5),
    NI(K"call",
      N(K"Identifier", 1),
      T(K" ", 1),
      N(K"+", 1),
      T(K" ", 1),
      N(K"Integer", 1)),
    T(K"\n", 5),
    T(K"Comment", 4),
    T(K"\n", 5),
    N(K"Identifier", 1),
    T(K"\n", 1)),
  T(K"end", 3))

# And the following AST
s = SyntaxNode(source, t)

println("\nRawSyntaxNode")
show(stdout, MIME"text/plain"(), t, code, show_trivia=true)

println("\nSyntaxNode")
show(stdout, MIME"text/plain"(), s)

#code = "42"
#SyntaxNode(N(K"Integer", 2), 1, code)

#-------------------------------------------------------------------------------
# # Macros and expression interpolation

# The following shows that SyntaxNode works nicely for simple macros based on
# interpolating expressions into one another. In particular it shows how
# precise source information from multiple files can coexist within the same
# syntax tree.

# First, here's the functionality that we're going to implement as a normal
# Julia macro. It's similar to the standard @show macro.
macro show2(ex)
    name = sprint(Base.show_unquoted, ex)
    quote
        value = $(esc(ex))
        println($name, " = ", value)
        value
    end
end

# Now, how would this be implemented if we were to do it with SyntaxNode?
# We don't have a parser which is capable of producing our tree structures yet,
# so we need to hand construct all our trees.
function at_show2(ex::SyntaxNode)
    code = String(read(@__FILE__))
    name = sprint(JuliaSyntax._show_syntax_node_compact, ex)
    # The following quote block is not used directly, but the text for it is
    # re-read from `code`.
    quote_begin = (@__LINE__) + 1
    quote
        value = $ex
        println($name, " = ", value)
        value
    end
    raw = N(K"block",
            T(K"quote", 5),
            T(K"\n", 9),
            N(K"=",
              N(K"Identifier", 5),
              T(K" ", 1),
              T(K"=", 1),
              T(K" ", 1),
              N(K"$",
                T(K"$", 1),
                N(K"Identifier", 2)),
              T(K"\n", 9)),
            N(K"call",
              N(K"Identifier", 7),
              T(K"(", 1),
              N(K"$",
                T(K"$", 1),
                N(K"Identifier", 4)),
              T(K",", 1),
              T(K" ", 1),
              N(K"String", 5),
              T(K",", 1),
              T(K" ", 1),
              N(K"Identifier", 5),
              T(K")", 1)),
            T(K"\n", 9),
            N(K"Identifier", 5),
            T(K"\n", 5),
            T(K"end", 3))
    source = SourceFile(code, filename=@__FILE__)
    block = SyntaxNode(source, raw, source.line_starts[quote_begin]+4)
    # Now that we have the block, we need to interpolate into it.

    # Interpolating a SyntaxNode `ex` is simple:
    setchild!(block, (1, 2), ex)
    # The interpolation of a Julia *value* should inherit the source location
    # of the $ interpolation expression. This is different to the
    # interpolation of a SyntaxNode, which should just be inserted as-is.
    setchild!(block, (2, 2),
              JuliaSyntax.interpolate_literal(block.val[2].val[2], name))
    block
end

# Usage of at_show2()

# Let's have some simple expression to pass to at_show2. This will be
# attributed to a different file foo.jl
code2 = "foo + 42"
source2 = SourceFile(code2, filename="foo.jl")
s2 = SyntaxNode(source2, NI(K"call",
                            N(K"Identifier", 3),
                            T(K" ", 1),
                            N(K"+", 1),
                            T(K" ", 1),
                            N(K"Integer", 2)))

# Calling at_show2, we see that the precise source information is preserved for
# both the surrounding expression and the interpolated fragments.
println("\nInterpolation example")
show(stdout, MIME"text/plain"(), at_show2(s2))


#-------------------------------------------------------------------------------
# # Formatting


