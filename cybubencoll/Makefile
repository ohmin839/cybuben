.PHONY: clean
clean:
	test -d ./bin || mkdir ./bin
	rm -fR ./bin/*

bin/action.o: src/action.c
	gcc \
		-I./src \
		-fPIC \
		./src/action.c \
		-c -o./bin/action.o

bin/lexer.o: src/lexer.l
	flex -osrc/lexer.c src/lexer.l
	gcc \
		-I./src \
		-fPIC \
		./src/lexer.c \
		-c -o./bin/lexer.o

bin/utf8conv: src/utf8conv.c
	gcc -I./src \
		-fPIC \
		./src/utf8conv.c \
		-o./bin/utf8conv

bin/cybubencoll: bin/action.o bin/lexer.o
	gcc -I./src \
		-fPIC \
		./bin/action.o \
		./bin/lexer.o \
		-o./bin/cybubencoll \
		-lfl

.PHONY: build
build: bin/cybubencoll

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubencoll ${INSTALL_DIR}/bin/
