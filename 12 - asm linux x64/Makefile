.PHONY: all clean run

all: example.out

example.o: example.asm
	nasm -f elf64 example.asm -o example.o

example.out: example.o
	ld example.o -o example.out

run: example.out
	./example.out
	@echo "Exit code: $$?"

clean:
	rm -f example.o example.out