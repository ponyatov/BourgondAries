#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <vector>
using namespace std;

struct AST {
	string tag,val;
	AST(string);
	virtual ~AST();
	virtual string cpp();	// return C++ code
	vector<AST*> child;
};

struct Name:AST { Name(string); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "parser.tab.hpp"

#endif // _H_HPP
