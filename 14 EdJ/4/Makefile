.PHONY: all run

all: example.out

example.o: example.asm
	yasm -g dwarf2 -f elf64 example.asm

example.out: example.o
	ld -g example.o -o example.out

run: example.out
	./example.out

clean:
	rm -f example.o example.out