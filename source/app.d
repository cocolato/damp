import std.stdio;
import lexer : Lexer;


void main() {
    auto lexer = new Lexer("if a > 5 { b = 10; }");
    auto tokens = lexer.tokenize();
    foreach (token; tokens) {
        writeln("Type: ", token.type, ", Value: ", token.value);
    }
}
