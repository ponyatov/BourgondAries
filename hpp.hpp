#ifndef _H_HPP
#define _H_HPP

#include <iostream>
using namespace std;

#define YYSTYPE string

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval = yytext; return X; }
extern int yyparse();
extern void yyerror(string);
#include "parser.tab.hpp"

#endif // _H_HPP
