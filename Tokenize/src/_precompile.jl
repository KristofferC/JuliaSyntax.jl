import Base: GenericIOBuffer

function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tokenize.Tokens.iskeyword, (Tokenize.Tokens.Kind,))
    precompile(Tokenize.Tokens.isliteral, (Tokenize.Tokens.Kind,))
    precompile(Tokenize.Tokens.isoperator, (Tokenize.Tokens.Kind,))
    precompile(Tokenize.Tokens.Token, (Tokenize.Tokens.Kind,Tuple{Int,Int},Tuple{Int,Int},Int,Int,String))
    precompile(Tokenize.Tokens.Token, ())
    precompile(Tokenize.Tokens.kind, (Tokenize.Tokens.Token,))
    precompile(Tokenize.Tokens.startpos, (Tokenize.Tokens.Token,))
    precompile(Tokenize.Tokens.endpos, (Tokenize.Tokens.Token,))
    precompile(Tokenize.Tokens.untokenize, (Tokenize.Tokens.Token,))
    precompile(Tokenize.Tokens.untokenize, (Tokenize.Tokens.RawToken,String))
    precompile(Tokenize.Tokens.untokenize, (Array{Tokenize.Tokens.Token, 1},))
    precompile(Tokenize.Tokens.untokenize, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))

    precompile(Tokenize.Lexers.is_cat_id_start, (Char, Int32,))
    precompile(Tokenize.Lexers.is_identifier_char, (Char,))
    precompile(Tokenize.Lexers.is_identifier_start_char, (Char,))
    precompile(Tokenize.Lexers.peekchar, (GenericIOBuffer{Array{UInt8, 1}},))
    precompile(Tokenize.Lexers.dpeekchar, (GenericIOBuffer{Array{UInt8, 1}},))
    precompile(Tokenize.Lexers.readchar, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.readchar, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken},))
    precompile(Tokenize.Lexers.next_token, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))

    precompile(Tokenize.Lexers.ishex, (Char,))
    precompile(Tokenize.Lexers.isbinary, (Char,))
    precompile(Tokenize.Lexers.isoctal, (Char,))
    precompile(Tokenize.Lexers.iswhitespace, (Char,))
    precompile(Tokenize.Lexers.Lexer, (String,))
    precompile(Tokenize.Lexers.Lexer, (String,Type{Tokenize.Tokens.Token}))
    precompile(Tokenize.Lexers.Lexer, (String,Type{Tokenize.Tokens.RawToken}))
    precompile(Tokenize.Lexers.Lexer, (GenericIOBuffer{Array{UInt8, 1}},Type{Tokenize.Tokens.Token}))
    precompile(Tokenize.Lexers.Lexer, (GenericIOBuffer{Array{UInt8, 1}},Type{Tokenize.Tokens.RawToken}))
    precompile(Tokenize.Lexers.tokenize, (String,))

    precompile(Tokenize.Lexers.iterate, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.iterate, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken},))
    precompile(Tokenize.Lexers.iterate, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, Bool,))
    precompile(Tokenize.Lexers.iterate, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken}, Bool,))
    precompile(Tokenize.Lexers.iterate, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, Bool,))
    precompile(Tokenize.Lexers.iterate, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken}, Bool,))
    precompile(Tokenize.Lexers.startpos, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.startpos, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken},))
    precompile(Tokenize.Lexers.startpos!, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},Int))
    precompile(Tokenize.Lexers.startpos!, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken},Int))
    precompile(Tokenize.Lexers.start_token!, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.start_token!, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken},))



    precompile(Tokenize.Lexers.lex_greater, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_prime, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_digit, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},Tokenize.Tokens.Kind))
    precompile(Tokenize.Lexers.lex_identifier, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, Char,))
    precompile(Tokenize.Lexers.lex_less, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_forwardslash, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_minus, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_xor, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_equal, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_bar, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_quote, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_plus, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_dot, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_exclaim, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_colon, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_percent, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_comment, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_comment, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},Bool))
    precompile(Tokenize.Lexers.lex_division, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_circumflex, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_backslash, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_star, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))
    precompile(Tokenize.Lexers.lex_amper, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))

    precompile(Tokenize.Lexers.lex_whitespace, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},))

    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, Char,))
    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, String,))
    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},typeof( Base.isdigit),))
    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},typeof( Tokenize.Lexers.iswhitespace),))
    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},typeof( Tokenize.Lexers.is_identifier_char),))
    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token},typeof(Tokenize.Lexers.ishex),))
    precompile(Tokenize.Lexers.accept_batch, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, typeof(Tokenize.Lexers.iswhitespace),))
    precompile(Tokenize.Lexers.accept_batch, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.Token}, typeof(Tokenize.Lexers.isdigit),))

    precompile(Tokenize.Lexers.accept_batch, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken}, typeof(Tokenize.Lexers.iswhitespace),))
    precompile(Tokenize.Lexers.accept_batch, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken}, typeof(Tokenize.Lexers.isdigit),))
    precompile(Tokenize.Lexers.accept, (Tokenize.Lexers.Lexer{GenericIOBuffer{Array{UInt8, 1}},Tokenize.Tokens.RawToken}, Char,))


    precompile(Tokenize.Lexers.readchar, (GenericIOBuffer{Array{UInt8, 1}},))    
end
