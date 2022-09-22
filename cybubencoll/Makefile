.PHONY: init
init:
	test -d ./bin || mkdir ./bin

.PHONY: clean
clean:
	rm -fR ./bin/*

bin/action.o: src/action.c
	gcc \
		-I./src \
		-fPIC \
		./src/action.c \
		-c -o./bin/action.o

src/parser.c: src/parser.leg
	leg -osrc/parser.c src/parser.leg

bin/cli.o: src/parser.c src/cli.c
	gcc \
		-I./src \
		-fPIC \
		./src/cli.c \
		-c -o./bin/cli.o

bin/cybubencoll: bin/action.o bin/cli.o
	gcc -I./src \
		-fPIC \
		./bin/action.o \
		./bin/cli.o \
		-o./bin/cybubencoll

.PHONY: build
build: init bin/cybubencoll

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubencoll ${INSTALL_DIR}/bin/
