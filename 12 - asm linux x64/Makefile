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

wingas: example.win.gas.exe

example.win.gas.obj: example.win.gas.s
	as --64 -g  -gdwarf-2  example.win.gas.s -o example.win.gas.obj

example.win.gas.exe: example.win.gas.obj
	ld example.win.gas.obj -o example.win.gas.exe -L"D:\bins\mingw64\x86_64-w64-mingw32\lib" -lkernel32

runwingas: example.win.gas.exe
	./example.win.gas.exe
	@echo "Exit code: $$?"

clean:
	rm -f example.o example.out example.gas.o example.gas.out