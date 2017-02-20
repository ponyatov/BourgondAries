log.log: enter.code ./exe.exe
	./exe.exe < $< > $@ && tail $(TAIL) $@
C = parser.tab.cpp lex.yy.c main.cpp
H = parser.tab.hpp hpp.hpp 
./exe.exe: $(C) $(H)
	$(CXX) -o $@ $(C)
lex.yy.c: lexer.lex
	flex $<
parser.tab.cpp: parser.yacc
	bison -o $@ $<
