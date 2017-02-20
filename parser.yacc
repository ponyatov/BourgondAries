%{
#include "hpp.hpp" 
%}
%defines
%token NAME COLON ARROW LBRACE RBRACE	/* name : -> { } */
%%
input:
	NAME COLON ARROW LBRACE RBRACE
%%

void yyerror(string msg) { cerr<<endl<<msg<<endl; exit(-1); }

