all: test

test: test.o
	ld -T test.ld -o test test.o

test.o: test.s
	as -o test.o test.s

.PHONY:
clean:
	rm test.o test
