.PHONY: all run clean

all: main

# main.s: main.c
# 	cc65 -g -t c64 main.c -o main.s

main.o: main.s
	ca65 -g -t c64 main.s -o main.o

main main.lbl main.map: main.o
	ld65 -o main -t c64 -u "__STARTUP__" -Ln main.lbl -m main.map main.o c64.lib

run: main main.lbl
	x64sc -moncommands main.lbl -keybuf "load \"main\",8,1\n" main

clean:
	cmd /c del /F main main.o main.lbl main.map