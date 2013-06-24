Dump of assembler code for function phase_5:
=> 0x0000000000401002 <+0>:	sub    $0x18,%rsp
   0x0000000000401006 <+4>:	lea    0x8(%rsp),%rcx   # second argument
   0x000000000040100b <+9>:	lea    0xc(%rsp),%rdx   # first argument
   0x0000000000401010 <+14>:	mov    $0x401ebe,%esi
   0x0000000000401015 <+19>:	mov    $0x0,%eax
   0x000000000040101a <+24>:	callq  0x400ab0 <__isoc99_sscanf@plt>
   0x000000000040101f <+29>:	cmp    $0x1,%eax
   0x0000000000401022 <+32>:	jg     0x401029 <phase_5+39>
   0x0000000000401024 <+34>:	callq  0x40163d <explode_bomb>
   0x0000000000401029 <+39>:	mov    0xc(%rsp),%eax
   0x000000000040102d <+43>:	and    $0xf,%eax        # eax = eax AND 0..1111 (bitwise)
   0x0000000000401030 <+46>:	mov    %eax,0xc(%rsp)   # eax should not equal 0xf (0..1111)
   0x0000000000401034 <+50>:	cmp    $0xf,%eax
   0x0000000000401037 <+53>:	je     0x401065 <phase_5+99>
   0x0000000000401039 <+55>:	mov    $0x0,%ecx
   0x000000000040103e <+60>:	mov    $0x0,%edx
   0x0000000000401043 <+65>:	add    $0x1,%edx
   0x0000000000401046 <+68>:	cltq   
   0x0000000000401048 <+70>:	mov    0x401ba0(,%rax,4),%eax
   # above computation should ultimately set eax = 0xf (see instruction at +82)
   # So, working backwards...
   # To get the 0xf located at the address 0x401ba0+24, we need to set %rax to 24/4 = 6
   # To get the decimal value of 6, we need position +56, so 56/4 = 14 
   # 14 => pos 8 => 2
   # 2 => pos 4 => 1
   # 1 => pos 40 => 10
   # And so on... until we reach 12 positions back, so that edx is incremented
   # a total of 12 times.
   # The intial %rax value we calculated will be the first argument passed to phase_5
   # and the sum total of all of these %rax values (93) should be the second argument we 
   # pass to phase_5
   0x000000000040104f <+77>:	add    %eax,%ecx        # add eax to ecx (so exc = 0xf)
   0x0000000000401051 <+79>:	cmp    $0xf,%eax        # eax should equal 0xf (0..1111)
   0x0000000000401054 <+82>:	jne    0x401043 <phase_5+65>
   0x0000000000401056 <+84>:	mov    %eax,0xc(%rsp)
   0x000000000040105a <+88>:	cmp    $0xc,%edx        # edx should equal 0..1100
   0x000000000040105d <+91>:	jne    0x401065 <phase_5+99>
   0x000000000040105f <+93>:	cmp    0x8(%rsp),%ecx   # second argument SHOULD eql ecx
   0x0000000000401063 <+97>:	je     0x40106a <phase_5+104>
   0x0000000000401065 <+99>:	callq  0x40163d <explode_bomb>
   0x000000000040106a <+104>:	add    $0x18,%rsp
   0x000000000040106e <+108>:	retq   
End of assembler dump.


Array at 0x401ba0
0x401ba0 <array.3014>:	0x0a	0x00	0x00	0x00	0x02	0x00	0x00	0x00
0x401ba8 <array.3014+8>:	0x0e	0x00	0x00	0x00	0x07	0x00	0x00	0x00
0x401bb0 <array.3014+16>:	0x08	0x00	0x00	0x00	0x0c	0x00	0x00	0x00
0x401bb8 <array.3014+24>:	0x0f	0x00	0x00	0x00	0x0b	0x00	0x00	0x00
0x401bc0 <array.3014+32>:	0x00	0x00	0x00	0x00	0x04	0x00	0x00	0x00
0x401bc8 <array.3014+40>:	0x01	0x00	0x00	0x00	0x0d	0x00	0x00	0x00
0x401bd0 <array.3014+48>:	0x03	0x00	0x00	0x00	0x09	0x00	0x00	0x00
0x401bd8 <array.3014+56>:	0x06	0x00	0x00	0x00	0x05	0x00	0x00	0x00


Dump of assembler code for function __isoc99_sscanf:
=> 0x0000003dd5669750 <+0>:	sub    $0xd8,%rsp
   0x0000003dd5669757 <+7>:	test   %al,%al
   0x0000003dd5669759 <+9>:	mov    %rdx,0x30(%rsp)
   0x0000003dd566975e <+14>:	mov    %rcx,0x38(%rsp)
   0x0000003dd5669763 <+19>:	mov    %r8,0x40(%rsp)
   0x0000003dd5669768 <+24>:	mov    %r9,0x48(%rsp)
   0x0000003dd566976d <+29>:	je     0x3dd56697a6 <__isoc99_sscanf+86>
   0x0000003dd566976f <+31>:	movaps %xmm0,0x50(%rsp)
   0x0000003dd5669774 <+36>:	movaps %xmm1,0x60(%rsp)
   0x0000003dd5669779 <+41>:	movaps %xmm2,0x70(%rsp)
   0x0000003dd566977e <+46>:	movaps %xmm3,0x80(%rsp)
   0x0000003dd5669786 <+54>:	movaps %xmm4,0x90(%rsp)
   0x0000003dd566978e <+62>:	movaps %xmm5,0xa0(%rsp)
   0x0000003dd5669796 <+70>:	movaps %xmm6,0xb0(%rsp)
   0x0000003dd566979e <+78>:	movaps %xmm7,0xc0(%rsp)
   0x0000003dd56697a6 <+86>:	lea    0xe0(%rsp),%rax
   0x0000003dd56697ae <+94>:	lea    0x8(%rsp),%rdx
   0x0000003dd56697b3 <+99>:	movl   $0x10,0x8(%rsp)  
   0x0000003dd56697bb <+107>:	movl   $0x30,0xc(%rsp)
   0x0000003dd56697c3 <+115>:	mov    %rax,0x10(%rsp)
   0x0000003dd56697c8 <+120>:	lea    0x20(%rsp),%rax
   0x0000003dd56697cd <+125>:	mov    %rax,0x18(%rsp)
   0x0000003dd56697d2 <+130>:	callq  0x3dd56697e0 <__isoc99_vsscanf>
   0x0000003dd56697d7 <+135>:	add    $0xd8,%rsp
   0x0000003dd56697de <+142>:	retq   
End of assembler dump.
