#ifndef _H_HPP
#define _H_HPP

#include <iostream>
using namespace std;

#include "libtcc.h"		// Use Fabrice Bellard's Tiny C Compiler as backend

#define YYSTYPE string

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval = yytext; return X; }
extern int yyparse();
extern void yyerror(string);
#include "parser.tab.hpp"

extern TCCState *tcc;	// TCC state

#endif // _H_HPP
