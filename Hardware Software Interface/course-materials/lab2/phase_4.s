Dump of assembler code for function phase_4:
   0x0000000000400fc1 <+0>:	sub    $0x18,%rsp
   0x0000000000400fc5 <+4>:	lea    0xc(%rsp),%rdx
   0x0000000000400fca <+9>:	mov    $0x401ec1,%esi
   0x0000000000400fcf <+14>:	mov    $0x0,%eax
   0x0000000000400fd4 <+19>:	callq  0x400ab0 <__isoc99_sscanf@plt>
   0x0000000000400fd9 <+24>:	cmp    $0x1,%eax
   0x0000000000400fdc <+27>:	jne    0x400fe5 <phase_4+36>
   0x0000000000400fde <+29>:	cmpl   $0x0,0xc(%rsp)
   0x0000000000400fe3 <+34>:	jg     0x400fea <phase_4+41>
   0x0000000000400fe5 <+36>:	callq  0x40163d <explode_bomb>
=> 0x0000000000400fea <+41>:	mov    0xc(%rsp),%edi
   0x0000000000400fee <+45>:	callq  0x400f84 <func4>
   0x0000000000400ff3 <+50>:	cmp    $0x37,%eax
   0x0000000000400ff6 <+53>:	je     0x400ffd <phase_4+60>
   0x0000000000400ff8 <+55>:	callq  0x40163d <explode_bomb>
   0x0000000000400ffd <+60>:	add    $0x18,%rsp
   0x0000000000401001 <+64>:	retq   
End of assembler dump.



Dump of assembler code for function func4:
=> 0x0000000000400f84 <+0>:	mov    %rbx,-0x10(%rsp)
   0x0000000000400f89 <+5>:	mov    %rbp,-0x8(%rsp)
   0x0000000000400f8e <+10>:	sub    $0x18,%rsp
   0x0000000000400f92 <+14>:	mov    %edi,%ebx
   0x0000000000400f94 <+16>:	mov    $0x1,%eax
   0x0000000000400f99 <+21>:	cmp    $0x1,%edi
   0x0000000000400f9c <+24>:	jle    0x400fb2 <func4+46>
   0x0000000000400f9e <+26>:	lea    -0x1(%rbx),%edi
   0x0000000000400fa1 <+29>:	callq  0x400f84 <func4>
   0x0000000000400fa6 <+34>:	mov    %eax,%ebp
   0x0000000000400fa8 <+36>:	lea    -0x2(%rbx),%edi
   0x0000000000400fab <+39>:	callq  0x400f84 <func4>
   0x0000000000400fb0 <+44>:	add    %ebp,%eax
   0x0000000000400fb2 <+46>:	mov    0x8(%rsp),%rbx
   0x0000000000400fb7 <+51>:	mov    0x10(%rsp),%rbp
   0x0000000000400fbc <+56>:	add    $0x18,%rsp
   0x0000000000400fc0 <+60>:	retq   
End of assembler dump.



