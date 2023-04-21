.globl main
main:
  mov $1, %rax
  add $1,  %rax
  add $1,  %rbx
  add $1,  %rcx
  add $1,  %rdx
  add $1,  %rsi
  add $1,  %rdi

  add %rbx,  %rax
  add %rcx,  %rax
  add %rdx,  %rax
  add %rsi,  %rax
  add %rdi,  %rax

  add %rax,  %rbx
  add %rcx,  %rbx
  add %rdx,  %rbx
  add %rsi,  %rbx
  add %rdi,  %rbx

  add %rax,  %rcx
  add %rbx,  %rcx
  add %rdx,  %rcx
  add %rsi,  %rcx
  add %rdi,  %rcx

  add %rax,  %rdx
  add %rbx,  %rdx
  add %rcx,  %rdx
  add %rsi,  %rdx
  add %rdi,  %rdx

  add %rax,  %rsi
  add %rbx,  %rsi
  add %rcx,  %rsi
  add %rdx,  %rsi
  add %rdi,  %rsi

  add %rax,  %rdi
  add %rbx,  %rdi
  add %rcx,  %rdi
  add %rdx,  %rdi
  add %rsi,  %rdi
  ret
