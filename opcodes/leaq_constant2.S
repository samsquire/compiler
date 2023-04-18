.globl main
main:
  pushq %rbp
  leaq 0x5555, %rdi
  popq %rbp
  ret
