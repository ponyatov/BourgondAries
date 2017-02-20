%{
#include "hpp.hpp" 
%}
%defines
%token NAME COLON ARROW LBRACE RBRACE SEMICOLON	/* name : -> { } ; */
%%
// REPL : { cout << "#include <stdlib.h>\n#include <stdio.h>\n\n"; } 
REPL : | input REPL
input:
	NAME COLON ARROW LBRACE statements RBRACE
{ string program = "void "+$1+"(void) {\n"+$5+"return 0; }\n"; cout<<program;
tcc_compile_string(tcc,program.c_str()); }
statements : statements statement { $$=$1+'\t'+$2; }| empty
statement : NAME SEMICOLON { $$="printf(\""+$1+"\\n\");\n"; }
empty :;

