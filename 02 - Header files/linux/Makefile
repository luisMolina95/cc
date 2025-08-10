main.out: utils.o main.o
	g++ utils.o main.o -o main.out

utils.o:
	g++ utils.cc -c

main.o:
	g++ main.cc -c

clean:
	rm -f *.o
	rm -f main.out