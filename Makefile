log.log: enter.code ./exe.exe Makefile
	./exe.exe < $< > $@ && tail $(TAIL) $@
#	cat $@ | tcc/tcc -run - 

JIT ?= -DJIT
TCC =  -Ilibtcc libtcc.dll
tcc: libtcc.dll lib/libtcc1.a

C = cpp.cpp parser.tab.cpp lex.yy.c 
H = hpp.hpp parser.tab.hpp
CXXFLAGS = -std=gnu++11
./exe.exe: $(C) $(H) tcc Makefile
	$(CXX) $(CXXFLAGS) -o $@ $(JIT) $(C) $(TCC)
lex.yy.c: lexer.lex
	flex $<
parser.tab.cpp: parser.yacc
	bison -o $@ $<

