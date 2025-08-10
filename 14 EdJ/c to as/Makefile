.PHONY: all run

all: example

example.o: example.asm
	yasm -g dwarf2 -f elf64 example.asm ## nasm -g -f elf64 example.asm

example: example.o
	ld -g example.o -o example

run: example
	./example

gdb: example
	gdb ./example

gccasm.s: main.c
	gcc -O0 -S main.c -masm=intel -fverbose-asm -o gccasm.s

gccasm.o: gccasm.s
	as --64 -g gccasm.s -o gccasm.o

gccasm: gccasm.o
	ld -g gccasm.o -o gccasm

gdbgccasm: gccasm
	gdb ./gccasm

clean:
	rm -f example.o example.out gccasm.s gccasm.o gccasm