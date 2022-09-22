.PHONY: init
init:
	test -d ./bin || mkdir ./bin
    
.PHONY: clean
clean:
	rm -fR ./bin/*

bin/mapping.o: src/mapping.c src/mapping.h
	gcc -I./src \
		-fPIC \
		./src/mapping.c \
		-c -o./bin/mapping.o

src/parser.c: src/parser.leg
	leg src/parser.leg -osrc/parser.c

bin/cli.o: src/parser.c src/cli.c
	gcc \
		-fPIC \
		./src/cli.c \
		-c -o./bin/cli.o

bin/cybubenconv: bin/mapping.o bin/cli.o
	gcc -I./src \
		-fPIC \
		./bin/mapping.o \
		./bin/cli.o \
		-o./bin/cybubenconv

.PHONY: build
build: init bin/cybubenconv

.PHONY: test
test: build
	cat anthem_ascii.txt | bin/cybubenconv

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubenconv ${INSTALL_DIR}/bin/

