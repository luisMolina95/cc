# For Windows Only
.PHONY: all run clear

all: main.exe

main.obj: main.c
	cl /c /I..\00_SDL3\include main.c /Fomain.obj

main.exe: main.obj
	link main.obj /LIBPATH:..\00_SDL3\lib\x64 SDL3.lib

run: main.exe
	set PATH=..\00_SDL3\lib\x64;%PATH%
	main

clear:
	del /F main.exe main.obj