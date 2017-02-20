%{
#include "hpp.hpp" 
%}
%option noyywrap main
%%
\s	{}
\n	++yylineno;

