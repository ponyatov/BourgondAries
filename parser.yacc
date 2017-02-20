%{
#include "hpp.hpp" 
%}
%defines
%token NAME COLON ARROW LBRACE RBRACE SEMICOLON	/* name : -> { } ; */
%%
REPL : { cout << "#include <stdlib.h>\n#include <stdio.h>\n\n"; } | REPL input
input:
	NAME COLON ARROW LBRACE statements RBRACE
{ cout << "int " << $1 << "() {\n" << $5 << "}\n\n"; }
statements : statements statement { $$=$1+'\t'+$2; }| empty
statement : NAME SEMICOLON { $$="printf(\""+$1+"\\n\");\n"; }
empty :;

