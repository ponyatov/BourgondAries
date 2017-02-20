log.log: enter.code ./exe.exe
	./exe.exe < $< > $@ && tail $(TAIL) $@
C = cpp.cpp parser.tab.cpp lex.yy.c 
H = hpp.hpp parser.tab.hpp
./exe.exe: $(C) $(H)
	$(CXX) -o $@ $(C)
lex.yy.c: lexer.lex
	flex $<
parser.tab.cpp: parser.yacc
	bison -o $@ $<
