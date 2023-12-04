registers = [
  "rax", "rbx", "rcx", "rdx", "rbp", "rsi", "rdi", "rsp", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"
]

def save(source, dest):
  f = open("opcodes/movreg_{}_{}.S".format(source, dest), "w")
  f.write("""
.globl main
main:
  mov %{},%{}
  ret
  """.format(source, dest))
  f.close()

for source in registers:
  for dest in registers:
    if source == dest:
      continue
    print("Saving move {} to {}".format(source, dest))
    save(source, dest) 


