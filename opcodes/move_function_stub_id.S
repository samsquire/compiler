.globl main
main:
  movabs $3,%r12
  call *%r12
hello:
  ret
