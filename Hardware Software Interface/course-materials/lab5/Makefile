#
# Students' Makefile for the Malloc Lab
#
FILES = mm.c

CC = gcc
CFLAGS = -Wall -g

OBJS = mdriver.o mm.o memlib.o fsecs.o fcyc.o clock.o ftimer.o

TIMEOUT=15s

mdriver: $(OBJS)
	$(CC) $(CFLAGS) -o mdriver $(OBJS)

mdriver.o: mdriver.c fsecs.h fcyc.h clock.h memlib.h config.h mm.h
memlib.o: memlib.c memlib.h
mm.o: mm.c mm.h memlib.h
fsecs.o: fsecs.c fsecs.h config.h
fcyc.o: fcyc.c fcyc.h
ftimer.o: ftimer.c ftimer.h config.h
clock.o: clock.c clock.h

check-mm.c: mdriver
	set -o pipefail && timeout -k 1s $(TIMEOUT) ./mdriver | [ `grep -ic ERROR` -eq 0 ]

clean:
	rm -f *~ *.o mdriver
