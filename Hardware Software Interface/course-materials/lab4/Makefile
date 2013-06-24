
SRC=cache-test-skel.c

.FORCE:

cache-test: .FORCE $(SRC) $(TEST_CACHE)
ifndef TEST_CACHE
	$(error You did not define TEST_CACHE!)
endif
	gcc -Wall $(SRC) $(TEST_CACHE) -o $@

check-cache-test-skel.c:
	./check.sh cache_16c_4a_4b.o 16384 4 4
	./check.sh cache_32c_8a_8b.o 32768 8 8
	./check.sh cache_64c_2a_16b.o 65536 2 16
