log.log: enter.code ./exe.exe
	./exe.exe < $< > $@ && tail $(TAIL) $@
C = lex.yy.c parser.tab.cpp
H = hpp.hpp
./exe.exe: $(C) $(H)
	$(CXX) -o $@ $(C)
lex.yy.c: lexer.lex
	flex $<
parser.tab.cpp: parser.yacc
	bison -o $@ $<
