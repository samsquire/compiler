.globl main
.align 4
.CONSTANT1:
 .string "Hello world"
main:
  pushq %rbp
  leaq .CONSTANT1(%rip),%rdi
  call printf@PLT
  popq %rbp
  ret  
