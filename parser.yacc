%{
#include "hpp.hpp" 
%}
%defines
%token NAME COLON ARROW LBRACE RBRACE	/* name : -> { } */
%%
input: 
%%

void yyerror(string msg) { cerr<<endl<<msg<<endl; exit(-1); }

