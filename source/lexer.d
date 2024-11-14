module lexer;

import std.stdio : writeln;
import std.regex : regex, matchAll;
import std.array : array;
import std.string : strip;

enum TokenType {
    Identifier,
    Keyword,
    IntegerLiteral,
    StringLiteral,
    Operator,
    Delimiter,
    Invalid
    
}

struct Token {
    TokenType type;
    string value;
    size_t line;
    size_t column;
}

class Lexer {
    private string source;
    private size_t line;
    private size_t column;

    this(string source) {
        this.source = source;
        this.line = 1;
        this.column = 1;
    }

    Token[] tokenize() {
        Token[] tokens;
        
        
        auto tokenPatterns = [
            regex(r"\bif\b|\belse\b"),              
            regex(r"[A-Za-z_]\w*"),                
            regex(r"[0-9]+"),                      
            regex(r"==|!=|<=|>=|\+|\-|\*|\/"),     
            regex(r"\s+"),                         
            
        ];

        foreach (pattern; tokenPatterns) {
            foreach (m; matchAll(this.source, pattern)) {
                
                string tokenValue = strip(m.hit);
                auto tokenType = determineTokenType(m.hit);

                if (tokenType != TokenType.Invalid) { 
                    auto token = Token(tokenType, tokenValue, line, column);
                    tokens ~= token;
                }
            }
        }

        return tokens;
    }

    private TokenType determineTokenType(string token) {
        
        
        return TokenType.Identifier; 
    }
}
