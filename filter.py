import fileinput
import re
from collections import defaultdict

sub = re.compile(r"\s+")
def rec_dd():
    return defaultdict(rec_dd)

opcode_byte_one = defaultdict(rec_dd)

hash_table = ["rax", "rbx", "rcx", "rdx", "rsi", "rdi", "rsp", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"]

def createhash(item):
  h = 5381;                                                                                                                        
  
  for i in range(0, len(item)): 
      c = item[i]                                                                                                                               
      h = ((h << 5) + h) + ord(c) # /* hash * 33 + c */                                                                                          
  return h;                                                                                                                                      
  

for item in hash_table:
  pass # print("{} = {}".format(item, createhash(item)))


previous_indent = 0
previous_line = ""
for line in fileinput.input():
  indent = 0
  for i in range(0, len(line)):
    if line[i] == " ":
      indent = indent + 1
    else:
      break
  if previous_indent != indent:
    if "main" in previous_line:
      splitted = sub.sub(" ", line).rstrip().split(" ")
      cleaned = splitted[2:]
      opcodes = cleaned[0:3]  
      # print(cleaned)
      instruction = cleaned[4]
      sides = instruction.replace("%", "").split(",")
      # print(sides)
      current = opcode_byte_one 
      for i in range(0, len(sides)):
        current = current[sides[i]]
      # for i in range(0, len(opcodes)):
      #  current = current[opcodes[i]]

      current["ins"] = opcodes

      # print(opcodes)
      # print("opcode {}".format(line).rstrip())
  previous_indent = indent
  previous_line = line

from pprint import pprint

def createbytelist(ins):
  for i in range(len(ins)):
    yield """
          bytes[bytes_count++] = 0x{};""".format(ins[i])


print("""
#include "common.h"
int move_var(char * source_register, char * destination_register, char * bytes) {
  unsigned long source = hash(source_register);
  unsigned long destination = hash(destination_register);
  int bytes_count = 0;
  switch (source) {""")
for source, value in opcode_byte_one.items():
  print("""
    case {}: /* {} */""".format(createhash(source), source))
  print("""
      switch (destination) { """)
  for destination, inner in value.items():
    print("""
        case {}: /* {} */
          {}
        break;
    """.format(createhash(destination), destination, "".join(list(createbytelist(inner["ins"])))))
  print("""
  }
  break;
  """)
print("""
  }
}
""")

