.PHONY: init
init:
	test -d ./bin || mkdir ./bin
    
.PHONY: clean
clean:
	rm -fR ./bin/*
	test -n src/converter.c || rm src/converter.c

bin/util.o: src/util.c src/util.h
	gcc -I./src \
		-fPIC \
		./src/util.c \
		-c -o./bin/util.o

src/converter.c: src/converter.leg
	leg src/converter.leg -osrc/converter.c

bin/cybubenconv: bin/util.o src/converter.c src/cybubenconv.c
	gcc -I./src \
		-fPIC \
		./bin/util.o \
		./src/cybubenconv.c \
		-o./bin/cybubenconv

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

