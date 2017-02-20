#ifndef _H_HPP
#define _H_HPP

#include <iostream>
using namespace std;

struct AST {
	string tag,val;
	AST(string);
	virtual string cpp();	// return C++ code
};

extern int yylex();
extern int yylineno;
extern char* yytext;
extern int yyparse();
extern void yyerror(string);
#include "parser.tab.hpp"

#endif // _H_HPP
