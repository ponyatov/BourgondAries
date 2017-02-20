#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
TCCState *tcc=nullptr;
typedef void (*TCC)(void);
int main() {
	tcc=tcc_new();								// \ create TCC state
	if (!tcc) yyerror("no TCC state created");	// / check TCC exists
#ifdef JIT
	tcc_set_output_type(tcc, TCC_OUTPUT_MEMORY);// force JIT compile to RAM
#else
	tcc_set_output_type(tcc, TCC_OUTPUT_EXE);	// force compile to .exe
	tcc_compile_string(tcc,"int main(){enter();}");// entry call
#endif
	yyparse();									// parser calls compiler itself
#ifdef JIT
	if (tcc_relocate(tcc, TCC_RELOCATE_AUTO)<0)	// \ run JIT relocation
		yyerror("bad JIT relocation");			// /
    void (*entry)(void);						// \ get entry symbol
	entry = (TCC)tcc_get_symbol(tcc, "enter");
	if (!entry) yyerror("no <enter> symbol");	// /
	cout << "\n\n======== JIT =========\n\n";	// \ go compiled program
	entry();									// /
#else
	tcc_output_file(tcc, "jitcompiled.exe");	// write compiled file
#endif
	tcc_delete(tcc);							// JIT cleanup
	return 0;
}

