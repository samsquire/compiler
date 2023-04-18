.globl main
main:
  pushq %rdi 
  movabsq $555555555, %rdi
  movabsq $777777777, %r11
  callq *%r11 
  popq %rdi
  jmpq *%rax
  
