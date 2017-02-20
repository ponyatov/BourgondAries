#include "hpp.hpp"

AST::AST(string V) { tag="AST"; val=V; }
AST::~AST() { for (auto item:child) delete item; }

string AST::cpp() { return tag+":"+val; }

Name::Name(string V):AST(V){}

