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

bin/parser.o: src/parser.leg
	leg -osrc/parser.c src/parser.leg
	gcc \
		-I./src \
		-fPIC \
		./src/parser.c \
		-c -o./bin/parser.o

bin/cybubencoll: bin/action.o bin/parser.o
	gcc -I./src \
		-fPIC \
		./bin/action.o \
		./bin/parser.o \
		-o./bin/cybubencoll

.PHONY: build
build: init bin/cybubencoll

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubencoll ${INSTALL_DIR}/bin/
