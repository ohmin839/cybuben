.PHONY: init
init:
	test -d ./bin || mkdir ./bin
    
.PHONY: clean
clean:
	rm -fR ./bin/*
	test -n src/converter.leg.c || rm src/converter.leg.c

bin/util.o: src/util.c src/util.h
	gcc -I./src \
		-fPIC \
		./src/util.c \
		-c -o./bin/util.o

src/converter.leg.c: src/converter.leg
	leg src/converter.leg -osrc/converter.leg.c

bin/cybubenconv: bin/util.o src/converter.leg.c src/converter_cli.c
	gcc -I./src \
		-fPIC \
		./bin/util.o \
		./src/converter_cli.c \
		-o./bin/cybubenconv

bin/converter_api.o: src/converter.c src/converter_api.c
	gcc -I./src \
		-fPIC \
		./src/converter_api.c \
		-c -o./bin/converter_api.o

bin/test_converter: src/converter.c test/test_converter.c bin/util.o
	gcc -I./src \
		-fPIC \
		./bin/util.o \
		./test/test_converter.c \
		-o./bin/test_converter

.PHONY: cybubenconv
cybubenconv: bin/cybubenconv

.PHONY: build
build: init cybubenconv

.PHONY: test
test: build
	cat anthem_ascii.txt | bin/cybubenconv

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubenconv ${INSTALL_DIR}/bin/

