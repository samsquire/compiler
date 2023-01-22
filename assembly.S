.globl main
.align 4
.CONSTANT5:
   .string "Value is %d"
.CONSTANT6:
   .long 7
.CONSTANT7:
   .long 8
.CONSTANT8:
   .string "Hello world %d"
.CONSTANT9:
   .long 10
main:
pushq   %rbp
movq    %rsp, %rbp
subq    $32, %rsp
movq %rdi, -24(%rbp)
movl %esi, -28(%rbp)
movl $5, -12(%rbp)
movl -12(%rbp), %ecx 
movl $6, -8(%rbp)
movl -8(%rbp), %eax 
movl -12(%rbp), %edi
movl $7, %ecx
addl    %edi, %ecx
movl -8(%rbp), %eax
addl    $8, %eax
imul    %ecx, %eax
movl %eax, %esi
leaq .CONSTANT5(%rip), %rax 
movq    %rax, %rdi
call    printf@PLT
movl    $0, %eax
movl    $10, %esi
leaq .CONSTANT8(%rip), %rax 
movq    %rax, %rdi
call    printf@PLT
movl    $0, %eax
leave
ret
