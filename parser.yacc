%{
#include "hpp.hpp" 
%}
%token NAME
%%
input: 
%%

void yyerror(string msg) { cerr<<endl<<msg<<endl; exit(-1); }

