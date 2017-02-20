#ifndef _H_HPP
#define _H_HPP

#include <iostream>
using namespace std;

extern int yylex(void);
extern void yyerror(string);
#include "parser.tab.hpp"

#endif // _H_HPP
