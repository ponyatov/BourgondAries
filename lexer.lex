%option noyywrap
%{
#include "hpp.hpp" 		// token defines
%}

%%
[a-zA-Z][a-zA-Z0-9]*	TOC(Name,NAME)
":"						{ return COLON; }
";"						{ return SEMICOLON; }
"->"					{ return ARROW; }
"{"						{ return LBRACE; }
"}"						{ return RBRACE; }
[ \t\r]					{}					// drop spaces
\n						++yylineno;			// count line no

