%{
#include "hpp.hpp" 
%}
%defines
%token NAME
%%
input: 
%%

void yyerror(string msg) { cerr<<endl<<msg<<endl; exit(-1); }

