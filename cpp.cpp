#include "hpp.hpp"

AST::AST(string V) { tag="AST"; val=V; }
string AST::cpp() { return tag+":"+val; }
