log.log: enter.code ./exe.exe
	./exe.exe < $< > $@ && tail $(TAIL) $@
C = cpp.cpp parser.tab.cpp lex.yy.c 
H = hpp.hpp parser.tab.hpp
CXXFLAGS = -std=gnu++11
./exe.exe: $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)
lex.yy.c: lexer.lex
	flex $<
parser.tab.cpp: parser.yacc
	bison -o $@ $<
