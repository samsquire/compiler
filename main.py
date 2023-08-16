import sys
from pprint import pprint

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

class Ast:

  def __init__(self):
    self.constant = None
    self.reference = None
    self.symbol = "?"

  def load_variable(self):
      if type(self.left) == LiteralNumber:
        
        self.source_left = "${}".format(self.left.value)
        self.source_right = "%{}".format(self.use_register)
        
      elif type(self.left) == Reference:
        lhs_position = self.left.source
        print("movl -{}(%rbp), %edi".format(lhs_position))
        self.source_left = "%edi"
      else:
        self.source_left = "%{}".format(self.left.use_register)
        
      if type(self.right) == LiteralNumber:
        print("movl ${}, %{}".format(self.right.value, self.use_register))
        self.source_right = "%{}".format(self.use_register)
      elif type(self.right) == Reference:
        rhs_position = "{}".format(self.right.source)
        
        print("movl -{}(%rbp), %{}".format(rhs_position, self.use_register))
        self.source_right = "%{}".format(self.use_register)
      else:
        # print("movl %{}, %{} ".format(self.right.use_register, self.use_register))
        self.source_right = "%{}".format(self.right.use_register)

def resolvereferences(normalised):
  variables = {}
  for operation in normalised:
    if type(operation) == Assign:
      variables[operation.name] = operation
    if type(operation) == Reference:
      operation.use_register = variables[operation.name].use_register
      operation.source = variables[operation.name].source

def assignrealregisters(assignments, ranges, realregisters):
  scopes = []
  previousassignments = list(realregisters)
  template_variables = {}
  
  for item in ranges:
    
    template_variables[item[0]] = None

  previous_template_variables = dict(template_variables)
  for instruction in range(0, len(assignments)):
    for item in ranges:
      if instruction >= item[1] and instruction <= item[2]:
        eprint("instruction {} {} falls in range of {}".format(instruction, assignments[instruction][1], item[0]))
        
        if previous_template_variables[item[0]] == None and (item[3].reference_type == "register" or item[4] == "assignment"):
          
          # this variable is unassigned
          chosen_register = previousassignments.pop()
         
          previous_template_variables[item[0]] = chosen_register
          
          item[3].use_register = chosen_register
          eprint("{} is not assigned, assigning {}".format(item[0], chosen_register))
          
        elif previous_template_variables[item[0]] != None and instruction == item[2]:
            # we are at end of range, free up register
            free_register = previous_template_variables[item[0]]
            previousassignments.append(free_register)
            eprint("{} is now free".format(free_register))
          
        # instruction falls in range of variable ranges[0]

def assignregisters(normalised):
  assignments = []
  counter = 0
  for item in normalised:
    if type(item) == Assign:
      reference_type = "assignment"
      item.reference_type = "assignment"
      assignments.append((item.name, "=", item.value, item.value, "not assignable", reference_type, item, reference_type, "", item, item, "assignment"))
    if type(item) == Reference:
      item.reference = item.name
      item.reference_type = "variable"
    if type(item) == LiteralNumber:
      item.reference = item.value
      item.reference_type = "constant"
    if type(item) == Println:
      reference = "t{}".format(counter)
      reference_type = "unit"
      item.reference_type = reference_type
      assignments.append((reference, item.symbol, item.template, item.data.reference, "not assignable", reference_type, item, reference_type, reference_type, item, item, "unit"))
      counter = counter + 1
    if type(item) in [Add, Mul]:
      reference = "t{}".format(counter)
      item.reference = reference
      reference_type = "register"
      item.reference_type = reference_type
      assignments.append((reference, item.symbol, item.left.reference, item.right.reference, "assignable", reference_type, item, item.left.reference_type, item.right.reference_type, item.left, item.right, "reference"))
      counter = counter + 1

  for item in assignments:
    eprint(("{} <- {} {} {}".format(item[0], item[2], item[1], item[3])))

  return assignments

def liveranges(assignments):
  
  # find variables used
  variables = {}
  for assignment in assignments:
    if assignment[2] not in variables:
      variables[assignment[2]] = (assignment[2], assignment[9], assignment[11])
    if assignment[3] not in variables:
      variables[assignment[3]] = (assignment[3], assignment[10], assignment[11])
    if assignment[0] not in variables:
      variables[assignment[0]] = (assignment[0], assignment[6], assignment[11])

  
  ranges = []
  for variable_data in variables.values():
    variable = variable_data[0]
    search_target = variable
    start_position_a = -1
    
    end_position_a = -1
    
    for position, search1 in enumerate(assignments):
      if search_target == search1[2] or search1[0] == search_target:
        start_position_a = position
        break
      if search_target == search1[3] or search_target == search1[0]:
        start_position_a = position
        break
        
    for position in range(start_position_a, len(assignments)):
      search_target = variable
      if search_target == assignments[position][2]:
       end_position_a = position
      if search_target == assignments[position][3]:
        end_position_a = position

    eprint("Variable {} appears {}-{} {}".format(variable,  start_position_a, end_position_a, variable_data))
    ranges.append((variable, start_position_a, end_position_a, variable_data[1], variable_data[2]))

  
  return ranges

class Reference(Ast):
  def findconstant(self):
    return []
  def normalise(self, normalised):
    normalised.append(self)
  def __init__(self, name):
    self.name = name

  def codegen(self, target, method):
    pass

    
  def assignlocalvariables(self, method):
    pass

class Assign(Ast):
  def findconstant(self):
    return []

  def normalise(self, normalised):
    normalised.append(self)
  
  def __init__(self, name, value):
    self.name = name
    self.value = value
    self.symbol = "="

  def assignlocalvariables(self, method):
    method.stack -= 4
    self.source = method.stack
    eprint("Assigning local variable {} to stack position {}".format(self.name, self.source))
  
  def codegen(self, target, method):
   
  
    print("movl ${}, -{}(%rbp)".format(self.value.value, self.source))
    print("movl -{}(%rbp), %{} ".format(self.source, self.use_register))
    
class LiteralNumber(Ast):

  def __repr__(self):
    return "int({})".format(self.value)
  
  def findconstant(self):
    self.constant = Constant(self.value, "long")
    return [self.constant]

  def normalise(self, normalised):
    normalised.append(self)
  
  def __init__(self, value):
    self.value = value

  def codegen(self, target, method):
    pass
    
  def assignlocalvariables(self, method):
    pass

class Mul(Ast):
  def __init__(self, left, right):
    self.left = left
    self.right = right
    self.symbol = "*"

  
  def assignlocalvariables(self, method):
    self.left.assignlocalvariables(method)
    self.right.assignlocalvariables(method)
  
  def normalise(self, normalised):
    self.left.normalise(normalised)
    self.right.normalise(normalised)
    normalised.append(self)
  
  def findconstant(self):
    constants = []
    left_constants = []
    right_constants = []
    
    left_constants.extend(self.left.findconstant())
    right_constants.extend(self.right.findconstant())

    constants.extend(left_constants)
    constants.extend(right_constants)
    return constants

  def codegen(self, target, method):
    self.left.codegen("edx", method)
    self.right.codegen("eax", method)

    self.load_variable()
      
    
    print("imul    {}, {}".format(self.source_left, self.source_right))
    

  

class Add(Ast):

  def __init__(self, left, right):
    self.left = left
    self.right = right
    self.symbol = "+"

  def normalise(self, normalised):
    self.left.normalise(normalised)
    self.right.normalise(normalised)
    normalised.append(self)
  
  def findconstant(self):
    constants = []
    left_constants = []
    right_constants = []
    
    left_constants.extend(self.left.findconstant())
    right_constants.extend(self.right.findconstant())

    constants.extend(left_constants)
    constants.extend(right_constants)
    return constants

  def codegen(self, target, method):
    self.left.codegen("edx", method)
    self.right.codegen("eax", method)

    
    self.load_variable()
      
    
    print("addl    {}, {}".format(self.source_left, self.source_right))
    

  
  def assignlocalvariables(self, method):
    self.left.assignlocalvariables(method)
    self.right.assignlocalvariables(method)

class Constant(Ast):
  counter = 0

  def __init__(self, value, type):
    self.name = "{}{}".format("CONSTANT", Constant.counter)
    self.value = value
    self.type = type
    Constant.counter = Constant.counter + 1
    self.symbol = "CONSTANT"

  def codegen(self, target, method):
    pass

  def constantgen(self):
    print(".{}:".format(self.name))
    if self.type == "string":
      print("   .{} \"{}\"".format(self.type, self.value))
    else:
      print("   .{} {}".format(self.type, self.value))

class Println(Ast):

  def normalise(self, normalised):
    self.data.normalise(normalised)
    normalised.append(self)

  def assignlocalvariables(self, method):
    self.data.assignlocalvariables(method)
  
  def findconstant(self):
    self.constant_template = Constant(self.template, "string")

    constants = [self.constant_template]

    constants.extend(self.data.findconstant())

    return constants

  def __init__(self, template, data):
    self.data = data
    self.template = template
    self.symbol = "func println"

  def codegen(self, target, method):
    
    self.data.codegen("", method)
    if type(self.data) == LiteralNumber:
      
      print("movl    ${}, %esi".format(self.data.value))
    else:
      print("movl %{}, %esi".format(self.data.use_register))
    print("leaq .{}(%rip), %rax ".format(self.constant_template.name))
    print("movq    %rax, %rdi")
      
    print("call    printf@PLT")
    print("movl    $0, %eax") 


class Main(Ast):

  def __init__(self, program):
    self.program = program
    self.stack = 16

  def findconstant(self):
    constants = []
    for line in self.program:
      constants.extend(line.findconstant())
    return constants

  def codegen(self, target, method):
    print(".globl main")
    print(".align 4")
    for ast in self.program:
      constants = ast.findconstant()
      for constant in constants:
        constant.constantgen()

    normalised = []
    for ast in self.program:
      ast.normalise(normalised)
      ast.assignlocalvariables(self)
    
    assignments = assignregisters(normalised)
    ranges = liveranges(assignments)
    realregisters = assignrealregisters(assignments, ranges, ["eax", "ebx", "ecx", "edx"])
    resolvereferences(normalised)
    
    eprint(normalised)
    
    print("main:")
    print("pushq   %rbp")
    print("movq    %rsp, %rbp")
    print("subq    $32, %rsp")
    print("movq %rdi, -24(%rbp)")                       
    print("movl %esi, -28(%rbp)")
    for ast in self.program:
      ast.codegen(target, self)

    
    print("leave")
    print("ret")

program = Main(
  [
    Assign("a", LiteralNumber(5)),
    Assign("b", LiteralNumber(6)),
    
    Println("Value is %d",
            Mul(Add(Reference("a"), LiteralNumber(7)),     Add(LiteralNumber(8), Reference("b")))),
  Println("Hello world %d", LiteralNumber(10))])

program.findconstant()
program.codegen("eax", program)

a = 5
b = 6
eprint((a + 7) * (8 + b))

# print(0x3f - 0x1f)
