ifeq ($(EXC),)
$(error EXC is not set! Please pass the exercise name as a variable.)
endif

.PHONY: all clean run gdb

all: $(EXC)/$(EXC).out

$(EXC)/$(EXC).o: $(EXC).asm
	mkdir -p $(EXC)
	yasm -g dwarf2 -f elf64 $(EXC).asm -o $(EXC)/$(EXC).o

$(EXC)/$(EXC).out: $(EXC)/$(EXC).o
	ld -g  $(EXC)/$(EXC).o -o $(EXC)/$(EXC).out

run: $(EXC)/$(EXC).out
	./$(EXC)/$(EXC).out

gdb: $(EXC)/$(EXC).out
	gdb ./$(EXC)/$(EXC).out -x $(EXC).gdb

clean:
	rm -fr rm -r [1-$(EXC)]