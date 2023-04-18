.globl main
main:
  pushq %rbp
  movabsq $12345678910, %rax
  leaq (%rdi), %rdi
  call *%rax
  popq %rbp
  ret
