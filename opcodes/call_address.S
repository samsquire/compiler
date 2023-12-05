.globl main
main:
  movabs $0x7f4bb365c740,%r11
  call *%r11
hello:
  ret
