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

bin/parser.o: src/parser.peg
	leg src/parser.peg -osrc/parser.c
	gcc \
		-I./src \
		-fPIC \
		./src/parser.c \
		-c -o./bin/parser.o

bin/cybubenconv: bin/parser.o bin/mapping.o
	gcc -I./src \
		-fPIC \
		./bin/parser.o \
		./bin/mapping.o \
		-o./bin/cybubenconv

.PHONY: build
build: init bin/cybubenconv

.PHONY: test
test: build
	cat anthem_ascii.txt | bin/cybubenconv

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubenconv ${INSTALL_DIR}/bin/
