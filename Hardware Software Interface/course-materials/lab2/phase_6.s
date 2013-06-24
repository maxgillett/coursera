Dump of assembler code for function phase_6:
=> 0x00000000004010d9 <+0>:	sub    $0x8,%rsp
   0x00000000004010dd <+4>:	mov    $0xa,%edx
   0x00000000004010e2 <+9>:	mov    $0x0,%esi
   0x00000000004010e7 <+14>:	callq  0x400b80 <strtol@plt>
   0x00000000004010ec <+19>:	mov    %eax,0x20168e(%rip)        # 0x602780 <node0>
   0x00000000004010f2 <+25>:	mov    $0x602780,%edi
   0x00000000004010f7 <+30>:	callq  0x40106f <fun6>
   0x00000000004010fc <+35>:	mov    0x8(%rax),%rax
   0x0000000000401100 <+39>:	mov    0x8(%rax),%rax
   0x0000000000401104 <+43>:	mov    0x8(%rax),%rax
   0x0000000000401108 <+47>:	mov    0x201672(%rip),%edx        # 0x602780 <node0>
   0x000000000040110e <+53>:	cmp    %edx,(%rax)
   0x0000000000401110 <+55>:	je     0x401117 <phase_6+62>
   0x0000000000401112 <+57>:	callq  0x40163d <explode_bomb>
   0x0000000000401117 <+62>:	add    $0x8,%rsp
   0x000000000040111b <+66>:	retq   
End of assembler dump.


Dump of assembler code for function fun6:
=> 0x000000000040106f <+0>:	mov    0x8(%rdi),%r8
   0x0000000000401073 <+4>:	movq   $0x0,0x8(%rdi)
   0x000000000040107b <+12>:	mov    %rdi,%rax
   0x000000000040107e <+15>:	mov    %rdi,%rcx
   0x0000000000401081 <+18>:	test   %r8,%r8
   0x0000000000401084 <+21>:	jne    0x4010c6 <fun6+87>
   0x0000000000401086 <+23>:	mov    %rdi,%rax
   0x0000000000401089 <+26>:	retq   
   0x000000000040108a <+27>:	mov    %rdx,%rcx
   0x000000000040108d <+30>:	mov    0x8(%rcx),%rdx
   0x0000000000401091 <+34>:	test   %rdx,%rdx
   0x0000000000401094 <+37>:	je     0x40109f <fun6+48>
   0x0000000000401096 <+39>:	cmp    %esi,(%rdx)
   0x0000000000401098 <+41>:	jg     0x40108a <fun6+27>
   0x000000000040109a <+43>:	mov    %rcx,%rdi
   0x000000000040109d <+46>:	jmp    0x4010a2 <fun6+51>
   0x000000000040109f <+48>:	mov    %rcx,%rdi
   0x00000000004010a2 <+51>:	cmp    %rdx,%rdi
   0x00000000004010a5 <+54>:	je     0x4010ad <fun6+62>
   0x00000000004010a7 <+56>:	mov    %r8,0x8(%rdi)
   0x00000000004010ab <+60>:	jmp    0x4010b0 <fun6+65>
   0x00000000004010ad <+62>:	mov    %r8,%rax
   0x00000000004010b0 <+65>:	mov    0x8(%r8),%rcx
   0x00000000004010b4 <+69>:	mov    %rdx,0x8(%r8)
   0x00000000004010b8 <+73>:	test   %rcx,%rcx
   0x00000000004010bb <+76>:	je     0x4010d7 <fun6+104>
   0x00000000004010bd <+78>:	mov    %rcx,%r8
   0x00000000004010c0 <+81>:	mov    %rax,%rcx
   0x00000000004010c3 <+84>:	mov    %rax,%rdi
   0x00000000004010c6 <+87>:	mov    %rcx,%rdx
   0x00000000004010c9 <+90>:	test   %rcx,%rcx
   0x00000000004010cc <+93>:	je     0x4010a2 <fun6+51>
   0x00000000004010ce <+95>:	mov    (%r8),%esi
   0x00000000004010d1 <+98>:	cmp    %esi,(%rcx)
   0x00000000004010d3 <+100>:	jg     0x40108d <fun6+30>
   0x00000000004010d5 <+102>:	jmp    0x4010a2 <fun6+51>
   0x00000000004010d7 <+104>:	repz retq 
End of assembler dump.
