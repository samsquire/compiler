# compiler

This repository is where I work on compiler development.

I have three separate compiler compilers:

* [a toy amd64 expression compiler written in Python in main.py](https://github.com/samsquire/compiler/blob/main/main.py) this outputs assembly that is assembled with GNU Assembler. It is Zero Clause BSD Licenced.
* [a register allocator with graph colouring and precolouring written Python](https://github.com/samsquire/register-allocation2) It is zero clause BSD licenced.
* an amd64 JIT compiler written in C that does lazy code generation [Jump to section](https://github.com/samsquire/compiler/blob/main/README.md#jit-compiler-written-in-c) It is MIT licenced.

Scroll down.

# amd64 cheatsheet (todo)

| Description | Opcode                                                       |
| ----------- | ------------------------------------------------------------ |
| movq        | rax 0x48 0xc7 0xc0 0xXX 0XX 0XX 0XX<br />rbx 0x48 0xc7 0xc3 0xXX 0xXX 0xXX 0xXX<br />rcx 0x48 0xc7 0xc1 0xXX 0xXX 0xXX 0xXX<br />rdi 0x48 0xc7 0xc7 0xXX 0xXX 0xXX 0xXX |
|             |                                                              |



# amd64 compiler written in Python

a compiler backend for amd64 x86_64

[This is barebones toy proof of implementation (replit link)](https://replit.com/@Chronological/Compiler3#main.py) (or main.py in this repository) but my backend can compile the following AST. It has no name, it's for learning assembly and compilation development. I hope it shall be useful to you.

```
    program = Main(
      [
        Assign("a", LiteralNumber(5)),
        Assign("b", LiteralNumber(6)),
        
        Println("Value is %d",
                Mul(Add(Reference("a"), LiteralNumber(7)),
                    Add(Reference("b"), LiteralNumber(8)))),
      Println("Hello world %d", LiteralNumber(10))])
```

1. My compiler does a post order traversal of the AST to create ANF (a normal form) version of the AST. This is "normalisation". It turns a nested traversal (deepest elements first) into a set of binary variable assignments That look similar to this:

```

    a <- int(5) = int(5)
    b <- int(6) = int(6)
    t0 <- a + 7
    t1 <- b + 8
    t2 <- t0 * t1
    t3 <- Value is %d func println t2
    t4 <- Hello world %d func println 10
```

This was inspired by psychokitty on eatonphil's discord and [Colin James' Compiling Lambda Calculus](https://compiler.club/compiling-lambda-calculus/)


2. I allocate local variables by scanning the entire AST for "Assign" variable references and increase an integer to represent the space for that variable on the stack.

Here's the code of the main() generator:

```
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
```

3. I scan the normalisation ANF list and determine ranges of variables. This is the live ranges that a variable is valid for.

I allocate real registers to ranges as I scan each operation. When a range ends, I free up the real register.

Resolve references copies the register assigned to an Assign AST element to the Reference element.

To build the assembly run this

```
python3 main.py > assembly.S
gcc -m64 -o assembled assembly.S
```
When running, it shall print:
```
./assembled
Value is 168Hello world 10
```

This is the output of 
```

a = 5
b = 6
eprint((a + 7) * (8 + b))
```

The probably inefficient code generated is this:

```
.globl main
.align 4
.CONSTANT5:
   .string "Value is %d"
.CONSTANT6:
   .long 7
.CONSTANT7:
   .long 8
.CONSTANT8:
   .string "Hello world %d"
.CONSTANT9:
   .long 10
main:
pushq   %rbp
movq    %rsp, %rbp
subq    $32, %rsp
movq %rdi, -24(%rbp)
movl %esi, -28(%rbp)
movl $5, -12(%rbp)
movl -12(%rbp), %ecx 
movl $6, -8(%rbp)
movl -8(%rbp), %eax 
movl -12(%rbp), %edi
movl $7, %ecx
addl    %edi, %ecx
movl    %eax, %esi
movl -8(%rbp), %edi
movl $8, %eax
addl    %edi, %eax
movl    %eax, %esi
imul    %ecx, %eax
movl    %eax, %esi
leaq .CONSTANT5(%rip), %rax 
movq    %rax, %rdi
call    printf@PLT
movl    $0, %eax
movl    $10, %esi
leaq .CONSTANT8(%rip), %rax 
movq    %rax, %rdi
call    printf@PLT
movl    $0, %eax
leave
ret
168
```

The compiler log is this:

```
Assigning local variable a to stack position 12
Assigning local variable b to stack position 8
a <- int(5) = int(5)
b <- int(6) = int(6)
t0 <- a + 7
t1 <- b + 8
t2 <- t0 * t1
t3 <- Value is %d func println t2
t4 <- Hello world %d func println 10
Variable int(5) appears 0-0
Variable a appears 0-2
Variable int(6) appears 1-1
Variable b appears 1-3
Variable 7 appears 2-2
Variable t0 appears 2-4
Variable 8 appears 3-3
Variable t1 appears 3-4
Variable t2 appears 4-5
Variable Value is %d appears 5-5
Variable t3 appears 5--1
Variable Hello world %d appears 6-6
Variable 10 appears 6-6
Variable t4 appears 6--1
instruction 0 = falls in range of int(5)
int(5) is not assigned, assigning edx
instruction 0 = falls in range of a
a is not assigned, assigning ecx
instruction 1 = falls in range of a
instruction 1 = falls in range of int(6)
int(6) is not assigned, assigning ebx
instruction 1 = falls in range of b
b is not assigned, assigning eax
instruction 2 + falls in range of a
ecx is now free
instruction 2 + falls in range of b
instruction 2 + falls in range of 7
instruction 2 + falls in range of t0
t0 is not assigned, assigning ecx
instruction 3 + falls in range of b
eax is now free
instruction 3 + falls in range of t0
instruction 3 + falls in range of 8
instruction 3 + falls in range of t1
t1 is not assigned, assigning eax
instruction 4 * falls in range of t0
ecx is now free
instruction 4 * falls in range of t1
eax is now free
instruction 4 * falls in range of t2
t2 is not assigned, assigning eax
instruction 5 func println falls in range of t2
eax is now free
instruction 5 func println falls in range of Value is %d
instruction 6 func println falls in range of Hello world %d
```

## Todo:

* Create assignments for `references` and `assigns` so they are used by register allocation.

# JIT compiler written in C

This is a simple JIT compiler. The code should be simple readable, if a little dense at times based on my coding style.

I use no pointer arithmetic or tight C style looping.

## Features:

* Precolouring of method parameters
* C calling convention, amd64 SySV calling convention (rdi, rsi, rcx, rdx) with `r11` and `r12` reserved by the JIT compiler.
* Can call C's printf function.
* Graph colouring of expressions.
* Simple register to register movements.
* `+` (addition) operator.
* Lazy compilation works and callsite patching.

This uses [JIT compilation code jit.c](https://gist.github.com/martinjacobd/3ee56f3c7b7ce621034ec3ecbc8e13f1) from Martin Jacob https://gist.github.com/martinjacobd

# running instructions

* run make
```
function talker(int a, int b) {
  return a + b;
}
printf("value: %d\n", 1 + talker(6, 7));
printf("value2: %d\n", talker(8, 9));
```

* try ./jitcompiler program2.lang
* try ./jitcompiler function_only.lang

Inspect the hex64 disassembly with `make inspect`

# older notes

I have generated ANF and virtual register allocation information. The compiler reads syntax that resembles the following and turns it into an AST and ANF.

```
function other(int number) {
    identifier1.identifier2.printf("Number:", number);
}
function hello(int number, string data) {
    other(number);
    printf(data, number);
}
hello(6);

```

* I need to know the memory address of the memory being written to so that I can adapt all relative pointers.
* I need to know the function index to compile at runtime.

```
mov $FUNCTION_ID %eax
call compile
```
Create an executable buffer for each function.

Then rewrite the compiled data buffer for that function with the compiled machine code.

# Credits

* playX from r/programminglanguages discord in backend for telling me about `call *%reg` for indirect calls
* chc4 from r/programminglanguages discord for various support and help with graph precolouring
* avery from r/programminglanguages discord for telling me about 3-operand additions
* elucent from r/programminglanguages discord for telling me how to encode amd64 instructions 
