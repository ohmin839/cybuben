.PHONY: clean
clean:
	test -d ./bin || mkdir ./bin
	rm -fR ./bin/*

bin/mapping.o: src/mapping.c src/mapping.h
	gcc -I./src \
		-fPIC \
		./src/mapping.c \
		-c -o./bin/mapping.o

bin/parser.o: src/parser.y
	bison src/parser.y -osrc/parser.c -d
	gcc \
		-I./src \
		-fPIC \
		./src/parser.c \
		-c -o./bin/parser.o

bin/lexer.o: src/lexer.l src/parser.h
	flex -osrc/lexer.c src/lexer.l
	gcc \
		-I./src \
		-fPIC \
		./src/lexer.c \
		-c -o./bin/lexer.o

bin/cybubenconv: bin/parser.o bin/lexer.o bin/mapping.o
	gcc -I./src \
		-fPIC \
		./bin/parser.o \
		./bin/lexer.o \
		./bin/mapping.o \
		-o./bin/cybubenconv \
		-lfl -ly

.PHONY: build
build: bin/cybubenconv

.PHONY: test
test: build
	cat anthem_ascii.txt | bin/cybubenconv

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubenconv ${INSTALL_DIR}/bin/
