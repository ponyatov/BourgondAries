%{
#include "hpp.hpp" 
%}
%defines %union { AST*o; }
%token <o> NAME 
%token COLON ARROW LBRACE RBRACE SEMICOLON	/* name : -> { } ; */
%%
input:
	NAME COLON ARROW LBRACE statements RBRACE
statements : statements statement | empty
statement : NAME SEMICOLON { cout << $1->cpp() << endl; }
empty :;
%%

#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

