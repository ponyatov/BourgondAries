#ifndef _H_HPP
#define _H_HPP

#include <iostream>
using namespace std;

extern int yylex();
extern int yylineno;
extern int yyparse();
extern void yyerror(string);
#include "parser.tab.hpp"

#endif // _H_HPP
