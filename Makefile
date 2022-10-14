.PHONY: init
init:
	test -d ./bin || mkdir ./bin
    
.PHONY: clean
clean:
	rm -fR ./bin/*
	! test -f src/converter.leg.c || rm src/converter.leg.c
	! test -f src/collector.leg.c || rm src/collector.leg.c

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

src/collector.leg.c: src/collector.leg
	leg src/collector.leg -osrc/collector.leg.c

bin/cybubencoll: bin/util.o src/collector.leg.c src/collector_cli.c
	gcc -I./src \
		-fPIC \
		./bin/util.o \
		./src/collector_cli.c \
		-o./bin/cybubencoll

.PHONY: cybubenconv
cybubenconv: bin/cybubenconv

.PHONY: cybubencoll
cybubencoll: bin/cybubencoll

.PHONY: build
build: init cybubenconv cybubencoll

.PHONY: test
test: build
	cat anthem_ascii.txt | bin/cybubenconv | bin/cybubencoll

bin/test_converter: src/converter.leg.c src/converter_api.c test/test_converter.c bin/util.o
	gcc -I./src \
		-fPIC \
		./bin/util.o \
		./test/test_converter.c \
		-o./bin/test_converter

bin/test_collector: src/collector.leg.c src/collector_api.c test/test_collector.c bin/util.o
	gcc -I./src \
		-fPIC \
		./bin/util.o \
		./test/test_collector.c \
		-o./bin/test_collector

.PHONY: install
install: build
	test -z ${INSTALL_DIR} || cp bin/cybubenconv ${INSTALL_DIR}/bin/
	test -z ${INSTALL_DIR} || cp bin/cybubencoll ${INSTALL_DIR}/bin/

