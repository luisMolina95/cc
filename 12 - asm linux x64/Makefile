.PHONY: all gas rungas clean run

all: example.out

example.o: example.asm
	nasm -g -f elf64 example.asm -o example.o

example.out: example.o
	ld example.o -o example.out

run: example.out
	./example.out
	@echo "Exit code: $$?"

gas: example.gas.out

example.gas.o: example.gas.s
	as -g example.gas.s -o example.gas.o

example.gas.out: example.gas.o
	ld example.gas.o -o example.gas.out

rungas: example.gas.out
	./example.gas.out
	@echo "Exit code: $$?"

clean:
	rm -f example.o example.out example.gas.o example.gas.out