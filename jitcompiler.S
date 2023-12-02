	.file	"jitcompiler.c"
	.text
.Ltext0:
	.file 0 "/home/sam/compiler" "./jitcompiler.c"
	.globl	hash
	.type	hash, @function
hash:
.LFB8:
	.file 1 "./jitcompiler.c"
	.loc 1 115 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	.loc 1 116 19
	movq	$5381, -8(%rbp)
	.loc 1 119 11
	jmp	.L2
.L3:
	.loc 1 120 23
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	.loc 1 120 29
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 120 37
	movl	-12(%rbp), %eax
	cltq
	.loc 1 120 14
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
.L2:
	.loc 1 119 20
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	.loc 1 119 16
	movzbl	(%rax), %eax
	.loc 1 119 14
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	.loc 1 119 12
	cmpl	$0, -12(%rbp)
	jne	.L3
	.loc 1 122 12
	movq	-8(%rbp), %rax
	.loc 1 123 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	hash, .-hash
	.globl	set_hashmap
	.type	set_hashmap, @function
set_hashmap:
.LFB9:
	.loc 1 125 87
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	.loc 1 126 25
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	.loc 1 126 19
	andl	$1023, %eax
	movq	%rax, -8(%rbp)
	.loc 1 127 12
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	salq	$8, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-24(%rbp), %rdx
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	.loc 1 127 5
	movq	-32(%rbp), %rax
	movl	$1024, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	.loc 1 128 27
	movq	-24(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	salq	$8, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	1028(%rax), %rdx
	movl	-44(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 129 31
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$65792, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	leaq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 130 29
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$65792, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	addq	$20, %rax
	movl	$1, (%rax)
	.loc 1 131 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	set_hashmap, .-set_hashmap
	.globl	set_hashmap_nested
	.type	set_hashmap_nested, @function
set_hashmap_nested:
.LFB10:
	.loc 1 133 85
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 134 25
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	.loc 1 134 19
	andl	$1023, %eax
	movq	%rax, -8(%rbp)
	.loc 1 135 12
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	salq	$8, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-24(%rbp), %rdx
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	.loc 1 135 5
	movq	-32(%rbp), %rax
	movl	$1024, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	.loc 1 136 40
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 136 32
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rcx
	addq	$65792, %rcx
	salq	$4, %rcx
	addq	%rcx, %rdx
	addq	$16, %rdx
	movl	%eax, (%rdx)
	.loc 1 137 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	set_hashmap_nested, .-set_hashmap_nested
	.globl	get_hashmap
	.type	get_hashmap, @function
get_hashmap:
.LFB11:
	.loc 1 139 73
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 140 25
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	.loc 1 140 19
	andl	$1023, %eax
	movq	%rax, -8(%rbp)
	.loc 1 141 12
	movq	-8(%rbp), %rax
	addq	$65792, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	.loc 1 142 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	get_hashmap, .-get_hashmap
	.globl	get_hashmap_nested
	.type	get_hashmap_nested, @function
get_hashmap_nested:
.LFB12:
	.loc 1 143 121
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	.loc 1 144 25
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	.loc 1 144 19
	andl	$1023, %eax
	movq	%rax, -8(%rbp)
	.loc 1 145 9
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$65792, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	addq	$16, %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	.loc 1 146 33
	movl	-12(%rbp), %eax
	cltq
	imulq	$1069064, %rax, %rdx
	.loc 1 146 12
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	get_hashmap
	.loc 1 147 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	get_hashmap_nested, .-get_hashmap_nested
	.section	.rodata
.LC0:
	.string	"Using %luGB for test.\n"
	.text
	.globl	clone_benchmark
	.type	clone_benchmark, @function
clone_benchmark:
.LFB13:
	.loc 1 149 35
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 150 22
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 151 9
	movl	$0, -20(%rbp)
	.loc 1 152 32
	movl	$1069064, %esi
	movl	$1024, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 153 5
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 154 11
	jmp	.L12
.L13:
	.loc 1 155 42
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 155 33
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 155 25
	imulq	$1069064, %rax, %rdx
	.loc 1 155 16
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 155 9
	movl	$1069064, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 156 17
	movl	-20(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$22, %eax
	addl	%eax, %edx
	andl	$1023, %edx
	subl	%eax, %edx
	movl	%edx, -20(%rbp)
	.loc 1 157 13
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	.loc 1 157 20
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
.L12:
	.loc 1 154 16
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 154 26
	cmpl	$1, %eax
	je	.L13
	.loc 1 159 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	clone_benchmark, .-clone_benchmark
	.section	.rodata
.LC1:
	.string	"./jitcompiler.c"
.LC2:
	.string	"illegal char\n"
	.text
	.globl	convert_to_hex
	.type	convert_to_hex, @function
convert_to_hex:
.LFB14:
	.loc 1 162 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, %eax
	movb	%al, -36(%rbp)
	.loc 1 163 6
	cmpb	$47, -36(%rbp)
	jle	.L15
	.loc 1 163 16 discriminator 1
	cmpb	$57, -36(%rbp)
	jg	.L15
	.loc 1 164 14
	movsbl	-36(%rbp), %eax
	subl	$48, %eax
	jmp	.L16
.L15:
	.loc 1 165 13
	cmpb	$64, -36(%rbp)
	jle	.L17
	.loc 1 165 23 discriminator 1
	cmpb	$70, -36(%rbp)
	jg	.L17
	.loc 1 166 20
	movsbl	-36(%rbp), %eax
	subl	$55, %eax
	jmp	.L16
.L17:
	.loc 1 167 13
	cmpb	$96, -36(%rbp)
	jle	.L18
	.loc 1 167 23 discriminator 1
	cmpb	$102, -36(%rbp)
	jg	.L18
	.loc 1 168 20
	movsbl	-36(%rbp), %eax
	subl	$87, %eax
	jmp	.L16
.L18:
	movl	$-1, -28(%rbp)
	movl	$0, -24(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$170, -20(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, -8(%rbp)
.LBB11:
.LBB12:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/error.h"
	.loc 2 71 5
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movl	-24(%rbp), %esi
	movl	-28(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	movl	$0, %eax
	call	error_at_line@PLT
	.loc 2 73 1
	nop
.LBE12:
.LBE11:
	.loc 1 171 12
	movl	$-1, %eax
.L16:
	.loc 1 173 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	convert_to_hex, .-convert_to_hex
	.globl	CODEGEN_CONTEXT
	.bss
	.align 8
	.type	CODEGEN_CONTEXT, @object
	.size	CODEGEN_CONTEXT, 8
CODEGEN_CONTEXT:
	.zero	8
	.section	.rodata
.LC3:
	.string	"%sidentifier %s %d\n"
.LC4:
	.string	"%smember access %s %d\n"
.LC5:
	.string	"%smethod call %s %d\n"
.LC6:
	.string	"%sadd %s %d\n"
.LC7:
	.string	"%sreturn %s %d\n"
.LC8:
	.string	"%ssubtract %s %d\n"
.LC9:
	.string	"%smultiply %s %d\n"
	.text
	.globl	dump_expressions
	.type	dump_expressions, @function
dump_expressions:
.LFB15:
	.loc 1 299 64
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 1 300 39
	movl	-52(%rbp), %eax
	cltq
	.loc 1 300 19
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	.loc 1 301 23
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 301 9
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 301 32
	movb	$0, (%rax)
.LBB13:
	.loc 1 302 12
	movl	$0, -40(%rbp)
	.loc 1 302 3
	jmp	.L20
.L21:
	.loc 1 303 11 discriminator 3
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 303 15 discriminator 3
	movb	$32, (%rax)
	.loc 1 302 33 discriminator 3
	addl	$1, -40(%rbp)
.L20:
	.loc 1 302 22 discriminator 1
	movl	-40(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L21
.LBE13:
	.loc 1 305 7
	movq	-64(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 307 23
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.LBB14:
	.loc 1 308 12
	movl	$0, -36(%rbp)
	.loc 1 308 3
	jmp	.L22
.L35:
.LBB15:
	.loc 1 309 48
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 309 24
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 310 25
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	.loc 1 310 7
	subl	$3, %eax
	cmpl	$6, %eax
	ja	.L23
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L25(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L25(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L25:
	.long	.L31-.L25
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L24-.L25
	.text
.L29:
	.loc 1 312 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 313 11
	jmp	.L23
.L30:
	.loc 1 315 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 316 11
	jmp	.L23
.L31:
	.loc 1 318 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 319 11
	jmp	.L23
.L28:
	.loc 1 321 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 322 11
	jmp	.L23
.L24:
	.loc 1 324 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 325 11
	jmp	.L23
.L27:
	.loc 1 327 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 328 11
	jmp	.L23
.L26:
	.loc 1 330 11
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 331 11
	nop
.L23:
.LBB16:
	.loc 1 333 14
	movl	$0, -32(%rbp)
	.loc 1 333 5
	jmp	.L32
.L34:
	.loc 1 335 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 335 27
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 335 30
	movl	16(%rax), %eax
	.loc 1 335 10
	testl	%eax, %eax
	jle	.L33
	.loc 1 336 47
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 336 53
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 336 9
	movq	(%rax), %rax
	movl	-52(%rbp), %edx
	addl	$1, %edx
	movq	%rax, %rsi
	movl	%edx, %edi
	call	dump_expressions
.L33:
	.loc 1 333 63 discriminator 2
	addl	$1, -32(%rbp)
.L32:
	.loc 1 333 36 discriminator 1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 333 48 discriminator 1
	movl	(%rax), %eax
	.loc 1 333 24 discriminator 1
	cmpl	%eax, -32(%rbp)
	jl	.L34
.LBE16:
.LBE15:
	.loc 1 308 44 discriminator 2
	addl	$1, -36(%rbp)
.L22:
	.loc 1 308 22 discriminator 1
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L35
.LBE14:
	.loc 1 340 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	dump_expressions, .-dump_expressions
	.section	.rodata
.LC10:
	.string	"end early"
	.text
	.globl	charget
	.type	charget, @function
charget:
.LFB16:
	.loc 1 342 50
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 343 23
	movq	-24(%rbp), %rax
	movl	$0, 32(%rax)
	.loc 1 344 22
	movl	$2, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 345 3
	movq	-8(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 346 30
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 346 57
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	.loc 1 346 44
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	.loc 1 346 16
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	.loc 1 347 27
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 348 19
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 348 25
	leal	1(%rax), %edx
	.loc 1 348 44
	movq	-24(%rbp), %rax
	movl	28(%rax), %eax
	.loc 1 348 6
	cmpl	%eax, %edx
	jne	.L37
	.loc 1 349 23
	movq	-24(%rbp), %rax
	movl	$1, 24(%rax)
	.loc 1 350 5
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 351 12
	movq	-8(%rbp), %rax
	jmp	.L38
.L37:
	.loc 1 353 35
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 353 41
	leal	1(%rax), %edx
	.loc 1 353 21
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 354 10
	movq	-8(%rbp), %rax
.L38:
	.loc 1 355 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	charget, .-charget
	.section	.rodata
.LC11:
	.string	"%s Skipping whitespace\n"
.LC12:
	.string	" "
.LC13:
	.string	"\n"
.LC14:
	.string	","
.LC15:
	.string	"comma"
.LC16:
	.string	"+"
.LC17:
	.string	"add"
.LC18:
	.string	"*"
.LC19:
	.string	"multiply"
.LC20:
	.string	"-"
.LC21:
	.string	"subtract"
.LC22:
	.string	"("
.LC23:
	.string	"open"
.LC24:
	.string	"{"
.LC25:
	.string	"curlyopen"
.LC26:
	.string	"}"
.LC27:
	.string	"curlyclose"
.LC28:
	.string	")"
.LC29:
	.string	"%s CLOSE TAG\n"
.LC30:
	.string	"close"
.LC31:
	.string	"."
.LC32:
	.string	"%s CLOSE TAG"
.LC33:
	.string	"member"
.LC34:
	.string	";"
.LC35:
	.string	"%s CLOSE expression\n"
.LC36:
	.string	"endstatement"
.LC37:
	.string	"^[a-zA-Z0-9-_]+$"
.LC38:
	.string	"%d rc is\n"
.LC39:
	.string	"\""
.LC40:
	.string	"'"
.LC41:
	.string	"[^\"']+"
.LC42:
	.string	"\n\ninside a quote\n"
.LC43:
	.string	"Unknown char: [%s] %s\n"
.LC44:
	.string	"unknown"
	.text
	.globl	_gettok
	.type	_gettok, @function
_gettok:
.LFB17:
	.loc 1 357 65
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	.loc 1 357 65
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 359 29
	movq	-184(%rbp), %rax
	movl	$0, 84(%rax)
	.loc 1 360 10
	jmp	.L40
.L41:
	.loc 1 361 7
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 362 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 362 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 363 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 363 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
.L40:
	.loc 1 360 23
	movq	-184(%rbp), %rax
	movl	32(%rax), %eax
	.loc 1 360 31
	testl	%eax, %eax
	jne	.L41
	.loc 1 360 47 discriminator 1
	movq	-184(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 360 31 discriminator 1
	testl	%eax, %eax
	jne	.L42
	.loc 1 360 81 discriminator 2
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 360 62 discriminator 2
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 360 58 discriminator 2
	testl	%eax, %eax
	je	.L41
	.loc 1 360 126 discriminator 3
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 360 107 discriminator 3
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 360 104 discriminator 3
	testl	%eax, %eax
	je	.L41
.L42:
	.loc 1 366 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 366 7
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 366 6
	testl	%eax, %eax
	jne	.L43
	.loc 1 367 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 367 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 368 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 368 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 369 14
	leaq	.LC15(%rip), %rax
	jmp	.L75
.L43:
	.loc 1 371 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 371 7
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 371 6
	testl	%eax, %eax
	jne	.L45
	.loc 1 372 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 372 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 373 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 373 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 374 14
	leaq	.LC17(%rip), %rax
	jmp	.L75
.L45:
	.loc 1 376 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 376 7
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 376 6
	testl	%eax, %eax
	jne	.L46
	.loc 1 377 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 377 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 378 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 378 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 379 14
	leaq	.LC19(%rip), %rax
	jmp	.L75
.L46:
	.loc 1 381 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 381 7
	leaq	.LC20(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 381 6
	testl	%eax, %eax
	jne	.L47
	.loc 1 382 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 382 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 383 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 383 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 384 14
	leaq	.LC21(%rip), %rax
	jmp	.L75
.L47:
	.loc 1 387 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 387 7
	leaq	.LC22(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 387 6
	testl	%eax, %eax
	jne	.L48
	.loc 1 388 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 388 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 389 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 389 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 390 14
	leaq	.LC23(%rip), %rax
	jmp	.L75
.L48:
	.loc 1 392 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 392 7
	leaq	.LC24(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 392 6
	testl	%eax, %eax
	jne	.L49
	.loc 1 393 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 393 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 394 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 394 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 395 14
	leaq	.LC25(%rip), %rax
	jmp	.L75
.L49:
	.loc 1 397 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 397 7
	leaq	.LC26(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 397 6
	testl	%eax, %eax
	jne	.L50
	.loc 1 398 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 398 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 399 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 399 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 400 14
	leaq	.LC27(%rip), %rax
	jmp	.L75
.L50:
	.loc 1 402 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 402 7
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 402 6
	testl	%eax, %eax
	jne	.L51
	.loc 1 403 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 403 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 404 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 404 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 405 7
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 406 14
	leaq	.LC30(%rip), %rax
	jmp	.L75
.L51:
	.loc 1 408 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 408 7
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 408 6
	testl	%eax, %eax
	jne	.L52
	.loc 1 409 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 409 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 410 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 410 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 411 7
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 412 14
	leaq	.LC33(%rip), %rax
	jmp	.L75
.L52:
	.loc 1 414 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 414 7
	leaq	.LC34(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 414 6
	testl	%eax, %eax
	jne	.L53
	.loc 1 415 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 415 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 416 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 416 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 417 7
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 418 14
	leaq	.LC36(%rip), %rax
	jmp	.L75
.L53:
	.loc 1 430 10
	movq	$1, -112(%rbp)
	.loc 1 433 10
	leaq	.LC37(%rip), %rax
	movq	%rax, -104(%rbp)
	.loc 1 434 11
	movq	-104(%rbp), %rax
	movq	%rax, -96(%rbp)
	.loc 1 435 11
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	.loc 1 439 8
	leaq	-128(%rbp), %rcx
	leaq	-164(%rbp), %rdx
	movq	-96(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	$-1, %rsi
	movq	%rax, %rdi
	call	pcre2_compile_8@PLT
	movq	%rax, -88(%rbp)
	.loc 1 447 17
	movq	-88(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pcre2_match_data_create_from_pattern_8@PLT
	movq	%rax, -80(%rbp)
	.loc 1 449 13
	movq	-80(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-88(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	pcre2_match_8@PLT
	addq	$16, %rsp
	movl	%eax, -156(%rbp)
	.loc 1 458 6
	cmpl	$0, -156(%rbp)
	jle	.L54
.LBB17:
	.loc 1 459 9
	movl	$101, -132(%rbp)
	.loc 1 460 25
	movl	-132(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 461 5
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 462 9
	movl	$0, -152(%rbp)
	.loc 1 467 13
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	.loc 1 471 5
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 472 5
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	pcre2_match_data_free_8@PLT
	.loc 1 474 11
	jmp	.L55
.L59:
	.loc 1 482 17
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	pcre2_get_ovector_pointer_8@PLT
	movq	%rax, -56(%rbp)
	.loc 1 484 14
	movl	$0, -160(%rbp)
	.loc 1 484 7
	jmp	.L56
.L57:
.LBB18:
	.loc 1 485 57 discriminator 3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	cltq
	.loc 1 485 55 discriminator 3
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 485 20 discriminator 3
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 486 44 discriminator 3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	.loc 1 486 42 discriminator 3
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 486 61 discriminator 3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	cltq
	.loc 1 486 59 discriminator 3
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 486 16 discriminator 3
	subq	%rax, %rdx
	movq	%rdx, -16(%rbp)
.LBE18:
	.loc 1 484 28 discriminator 3
	addl	$1, -160(%rbp)
.L56:
	.loc 1 484 21 discriminator 1
	movl	-160(%rbp), %eax
	cmpl	-156(%rbp), %eax
	jl	.L57
	.loc 1 489 41
	movq	-184(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 489 23
	movl	-152(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -152(%rbp)
	movslq	%eax, %rcx
	.loc 1 489 17
	movq	-32(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 489 52
	movzbl	(%rdx), %eax
	.loc 1 489 27
	movb	%al, (%rcx)
	.loc 1 491 24
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 491 7
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 492 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 492 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 493 15
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
.L55:
	.loc 1 474 24
	movq	-184(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 474 35
	testl	%eax, %eax
	jne	.L58
	.loc 1 474 44 discriminator 1
	movq	-80(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-88(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	pcre2_match_8@PLT
	addq	$16, %rsp
	movl	%eax, -156(%rbp)
	.loc 1 474 35 discriminator 1
	cmpl	$0, -156(%rbp)
	jg	.L59
.L58:
	.loc 1 495 5
	movl	-156(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 497 21
	movq	-184(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 497 8
	cmpl	$1, %eax
	jne	.L60
	.loc 1 497 54 discriminator 1
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 497 35 discriminator 1
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 497 32 discriminator 1
	testl	%eax, %eax
	je	.L60
	.loc 1 497 99 discriminator 2
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 497 80 discriminator 2
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 497 77 discriminator 2
	testl	%eax, %eax
	je	.L60
	.loc 1 498 41
	movq	-184(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 498 23
	movl	-152(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -152(%rbp)
	movslq	%eax, %rcx
	.loc 1 498 17
	movq	-32(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 498 52
	movzbl	(%rdx), %eax
	.loc 1 498 27
	movb	%al, (%rcx)
.L60:
	.loc 1 503 5
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	pcre2_code_free_8@PLT
	.loc 1 504 9
	movl	$1, -148(%rbp)
.LBB19:
	.loc 1 505 14
	movl	$0, -144(%rbp)
	.loc 1 505 5
	jmp	.L61
.L64:
	.loc 1 506 11
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movl	-144(%rbp), %edx
	movslq	%edx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	movsbq	%dl, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	.loc 1 506 10
	testl	%eax, %eax
	jne	.L62
	.loc 1 507 19
	movl	$0, -148(%rbp)
	.loc 1 508 9
	jmp	.L63
.L62:
	.loc 1 505 35 discriminator 2
	addl	$1, -144(%rbp)
.L61:
	.loc 1 505 24 discriminator 1
	movl	-144(%rbp), %eax
	cmpl	-152(%rbp), %eax
	jl	.L64
.L63:
.LBE19:
	.loc 1 511 8
	cmpl	$1, -148(%rbp)
	jne	.L65
	.loc 1 512 32
	movq	-184(%rbp), %rax
	movl	$1, 84(%rax)
	jmp	.L66
.L65:
	.loc 1 514 32
	movq	-184(%rbp), %rax
	movl	$2, 84(%rax)
.L66:
	.loc 1 516 12
	movq	-32(%rbp), %rax
	jmp	.L75
.L54:
.LBE17:
	.loc 1 519 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 519 7
	leaq	.LC39(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 519 6
	testl	%eax, %eax
	je	.L67
	.loc 1 519 73 discriminator 1
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 519 54 discriminator 1
	leaq	.LC40(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 519 50 discriminator 1
	testl	%eax, %eax
	jne	.L68
.L67:
.LBB20:
	.loc 1 520 12
	leaq	.LC41(%rip), %rax
	movq	%rax, -72(%rbp)
	.loc 1 522 5
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 524 31
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 524 29
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 525 13
	movq	-72(%rbp), %rax
	movq	%rax, -96(%rbp)
	.loc 1 526 13
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	.loc 1 527 10
	leaq	-128(%rbp), %rcx
	leaq	-164(%rbp), %rdx
	movq	-96(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	$-1, %rsi
	movq	%rax, %rdi
	call	pcre2_compile_8@PLT
	movq	%rax, -88(%rbp)
	.loc 1 535 19
	movq	-88(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pcre2_match_data_create_from_pattern_8@PLT
	movq	%rax, -80(%rbp)
	.loc 1 537 11
	movq	-80(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-88(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	pcre2_match_8@PLT
	addq	$16, %rsp
	movl	%eax, -156(%rbp)
	.loc 1 546 8
	cmpl	$0, -156(%rbp)
	jle	.L68
.LBB21:
	.loc 1 547 11
	movl	$101, -136(%rbp)
	.loc 1 548 27
	movl	-136(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	.loc 1 549 7
	movl	-136(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 550 11
	movl	$0, -140(%rbp)
	.loc 1 555 15
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	.loc 1 559 7
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 560 7
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	pcre2_match_data_free_8@PLT
	.loc 1 562 13
	jmp	.L69
.L73:
	.loc 1 570 19
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	pcre2_get_ovector_pointer_8@PLT
	movq	%rax, -56(%rbp)
	.loc 1 572 16
	movl	$0, -160(%rbp)
	.loc 1 572 9
	jmp	.L70
.L71:
.LBB22:
	.loc 1 573 59 discriminator 3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	cltq
	.loc 1 573 57 discriminator 3
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 573 22 discriminator 3
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
	.loc 1 574 46 discriminator 3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	.loc 1 574 44 discriminator 3
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 574 63 discriminator 3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	cltq
	.loc 1 574 61 discriminator 3
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 574 18 discriminator 3
	subq	%rax, %rdx
	movq	%rdx, -40(%rbp)
.LBE22:
	.loc 1 572 30 discriminator 3
	addl	$1, -160(%rbp)
.L70:
	.loc 1 572 23 discriminator 1
	movl	-160(%rbp), %eax
	cmpl	-156(%rbp), %eax
	jl	.L71
	.loc 1 577 43
	movq	-184(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 577 25
	movl	-140(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -140(%rbp)
	movslq	%eax, %rcx
	.loc 1 577 19
	movq	-64(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 577 54
	movzbl	(%rdx), %eax
	.loc 1 577 29
	movb	%al, (%rcx)
	.loc 1 579 26
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 579 9
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 580 35
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 580 33
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 581 17
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
.L69:
	.loc 1 562 26
	movq	-184(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 562 37
	testl	%eax, %eax
	jne	.L72
	.loc 1 562 46 discriminator 1
	movq	-80(%rbp), %rcx
	movq	-112(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-88(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movq	%rcx, %r9
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	pcre2_match_8@PLT
	addq	$16, %rsp
	movl	%eax, -156(%rbp)
	.loc 1 562 37 discriminator 1
	cmpl	$0, -156(%rbp)
	jg	.L73
.L72:
	.loc 1 583 7
	movl	-156(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 585 23
	movq	-184(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 585 10
	cmpl	$1, %eax
	jne	.L74
	.loc 1 585 56 discriminator 1
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 585 37 discriminator 1
	leaq	.LC28(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 585 34 discriminator 1
	testl	%eax, %eax
	je	.L74
	.loc 1 585 101 discriminator 2
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 585 82 discriminator 2
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 585 79 discriminator 2
	testl	%eax, %eax
	je	.L74
	.loc 1 586 43
	movq	-184(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 586 25
	movl	-140(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -140(%rbp)
	movslq	%eax, %rcx
	.loc 1 586 19
	movq	-64(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 586 54
	movzbl	(%rdx), %eax
	.loc 1 586 29
	movb	%al, (%rcx)
.L74:
	.loc 1 589 33
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	charget
	.loc 1 589 31
	movq	-184(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 591 7
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	pcre2_code_free_8@PLT
	.loc 1 592 14
	movq	-64(%rbp), %rax
	jmp	.L75
.L68:
.LBE21:
.LBE20:
	.loc 1 609 3
	movq	-184(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 610 10
	leaq	.LC44(%rip), %rax
.L75:
	.loc 1 611 1 discriminator 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L76
	.loc 1 611 1 is_stmt 0
	call	__stack_chk_fail@PLT
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	_gettok, .-_gettok
	.globl	gettok
	.type	gettok, @function
gettok:
.LFB18:
	.loc 1 612 64 is_stmt 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 613 18
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_gettok
	movq	%rax, -8(%rbp)
	.loc 1 614 28
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 72(%rax)
	.loc 1 615 10
	movq	-8(%rbp), %rax
	.loc 1 616 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	gettok, .-gettok
	.globl	subsume
	.type	subsume, @function
subsume:
.LFB19:
	.loc 1 618 137
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	.loc 1 619 51
	movl	$24, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 620 43
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 621 54
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	.loc 1 622 40
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 624 57
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 624 41
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 624 74
	movq	(%rax), %rdx
	.loc 1 624 29
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 625 63
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 625 47
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 625 80
	movl	16(%rax), %edx
	.loc 1 625 35
	movq	-32(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 626 58
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 626 42
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 626 75
	movq	8(%rax), %rdx
	.loc 1 626 30
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 628 34
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	.loc 1 629 30
	movq	-80(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 629 42
	leal	1(%rax), %ecx
	movq	-80(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 629 16
	movq	-16(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 630 18
	movq	-16(%rbp), %rax
	movl	-68(%rbp), %edx
	movl	%edx, 4(%rax)
	.loc 1 631 18
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 632 24
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 633 26
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 636 38
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 637 33
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 637 17
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 637 64
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 638 33
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 638 17
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 638 70
	movl	$0, 16(%rax)
	.loc 1 639 34
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 639 18
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 639 51
	movq	8(%rax), %rax
	.loc 1 639 66
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 640 33
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 640 17
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 640 50
	movq	(%rax), %rsi
	.loc 1 640 90
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 640 74
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 640 107
	movl	16(%rax), %edx
	.loc 1 640 126
	leal	1(%rdx), %ecx
	movl	%ecx, 16(%rax)
	movslq	%edx, %rax
	.loc 1 640 63
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 640 130
	movq	-16(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 642 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	subsume, .-subsume
	.section	.rodata
.LC45:
	.string	"Hash for token %s is %ld\n"
.LC46:
	.string	"%s Return statement\n"
.LC47:
	.string	"%p\n"
.LC48:
	.string	"(ret)"
.LC49:
	.string	"Is an member access operator"
.LC50:
	.string	"%s Close bracket\n"
.LC51:
	.string	"%s End of statement\n"
.LC52:
	.string	"open bracket"
.LC53:
	.string	"OWNER %d\n"
.LC54:
	.string	"expression location %d %p\n"
.LC55:
	.string	"Parsing subexpression"
.LC56:
	.string	"exprparse"
	.align 8
.LC57:
	.string	"%s Comma encountered, creating new statement\n"
	.align 8
.LC58:
	.string	"%s parseexpression Is an identifier %s\n"
.LC59:
	.string	"^"
.LC60:
	.string	"identifier expression %p\n"
.LC61:
	.string	"statements %p\n"
.LC62:
	.string	"functionbodyitem"
	.text
	.globl	parse_expressions
	.type	parse_expressions, @function
parse_expressions:
.LFB20:
	.loc 1 651 21
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$448, %rsp
	movq	%rdi, -392(%rbp)
	movq	%rsi, -400(%rbp)
	movq	%rdx, -408(%rbp)
	movq	%rcx, -416(%rbp)
	movq	%r8, -424(%rbp)
	movl	%r9d, -428(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -440(%rbp)
	.loc 1 651 21
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 661 9
	jmp	.L81
.L97:
.LBB23:
	.loc 1 662 27
	movq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	movq	%rax, -344(%rbp)
	.loc 1 663 5
	movq	-344(%rbp), %rdx
	movq	-352(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 664 5
	movabsq	$-3372849529167478127, %rax
	cmpq	%rax, -344(%rbp)
	je	.L82
	movabsq	$-3372849529167478127, %rax
	cmpq	-344(%rbp), %rax
	jb	.L83
	movabsq	$6953974653989, %rax
	cmpq	%rax, -344(%rbp)
	je	.L84
	movabsq	$6953974653989, %rax
	cmpq	-344(%rbp), %rax
	jb	.L83
	movabsq	$6953778704349, %rax
	cmpq	%rax, -344(%rbp)
	je	.L85
	movabsq	$6953778704349, %rax
	cmpq	-344(%rbp), %rax
	jb	.L83
	movabsq	$210709067314, %rax
	cmpq	%rax, -344(%rbp)
	je	.L86
	movabsq	$210709067314, %rax
	cmpq	-344(%rbp), %rax
	jb	.L83
	movabsq	$210708961883, %rax
	cmpq	%rax, -344(%rbp)
	je	.L87
	movabsq	$210708961883, %rax
	cmpq	-344(%rbp), %rax
	jb	.L83
	cmpq	$193486030, -344(%rbp)
	je	.L88
	movabsq	$6385555319, %rax
	cmpq	%rax, -344(%rbp)
	je	.L89
	jmp	.L83
.L84:
.LBB24:
	.loc 1 667 9
	movq	-392(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 668 47
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -304(%rbp)
	.loc 1 669 49
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -296(%rbp)
	.loc 1 670 46
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -288(%rbp)
	.loc 1 671 46
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -280(%rbp)
	.loc 1 672 50
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	.loc 1 672 30
	movq	%rax, -368(%rbp)
	.loc 1 673 51
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	.loc 1 673 30
	movq	%rax, -360(%rbp)
	.loc 1 674 39
	movl	$88, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -272(%rbp)
	.loc 1 675 56
	movl	$4, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -264(%rbp)
	.loc 1 676 57
	movl	$4, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -256(%rbp)
	.loc 1 677 39
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -248(%rbp)
	.loc 1 678 50
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 678 34
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 678 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 679 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 679 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 679 52
	movq	(%rax), %rsi
	.loc 1 679 92
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 679 76
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 679 109
	movl	16(%rax), %edx
	.loc 1 679 128
	leal	1(%rdx), %ecx
	movl	%ecx, 16(%rax)
	movslq	%edx, %rax
	.loc 1 679 65
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 679 132
	movq	-248(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 680 24
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 680 36
	leal	1(%rax), %edx
	movq	-400(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 681 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 681 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 681 53
	movq	-304(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 683 25
	movq	-256(%rbp), %rax
	movq	%rax, -400(%rbp)
	.loc 1 685 35
	movq	-424(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 685 47
	leal	1(%rax), %ecx
	movq	-424(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 685 21
	movq	-248(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 686 23
	movq	-248(%rbp), %rax
	movl	$9, 4(%rax)
	.loc 1 687 25
	movq	-248(%rbp), %rax
	leaq	.LC48(%rip), %rdx
	movq	%rdx, 40(%rax)
	.loc 1 688 23
	movq	-248(%rbp), %rax
	movq	-280(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 689 29
	movq	-248(%rbp), %rax
	movq	-256(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 690 41
	movq	-264(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 691 42
	movq	-256(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 692 20
	movq	-288(%rbp), %rax
	movq	-304(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 693 20
	movq	-280(%rbp), %rax
	movq	%rax, -408(%rbp)
	.loc 1 695 38
	movq	-304(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 1 696 32
	movq	-368(%rbp), %rdx
	movq	-304(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 697 33
	movq	-304(%rbp), %rax
	leaq	-368(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 699 20
	movq	-280(%rbp), %rax
	movq	-296(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 700 40
	movq	-296(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 1 701 34
	movq	-360(%rbp), %rdx
	movq	-296(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 702 35
	movq	-296(%rbp), %rax
	leaq	-360(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 703 9
	jmp	.L81
.L88:
	.loc 1 705 53
	movl	$24, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -88(%rbp)
	.loc 1 706 45
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -80(%rbp)
	.loc 1 707 56
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	.loc 1 708 42
	movq	-72(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 710 59
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 710 43
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 710 76
	movq	(%rax), %rdx
	.loc 1 710 31
	movq	-80(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 711 65
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 711 49
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 711 82
	movl	16(%rax), %edx
	.loc 1 711 37
	movq	-80(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 712 60
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 712 44
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 712 77
	movq	8(%rax), %rdx
	.loc 1 712 32
	movq	-80(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 714 36
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	.loc 1 715 32
	movq	-424(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 715 44
	leal	1(%rax), %ecx
	movq	-424(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 715 18
	movq	-64(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 716 20
	movq	-64(%rbp), %rax
	movl	$6, 4(%rax)
	.loc 1 717 22
	movq	-64(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, 40(%rax)
	.loc 1 718 20
	movq	-64(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 719 26
	movq	-64(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 720 28
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 723 40
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -56(%rbp)
	.loc 1 724 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 724 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 724 66
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 725 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 725 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 725 72
	movl	$0, 16(%rax)
	.loc 1 726 36
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 726 20
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 726 53
	movq	8(%rax), %rax
	.loc 1 726 68
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 727 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 727 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 727 52
	movq	(%rax), %rsi
	.loc 1 727 92
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 727 76
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 727 109
	movl	16(%rax), %edx
	.loc 1 727 128
	leal	1(%rdx), %ecx
	movl	%ecx, 16(%rax)
	movslq	%edx, %rax
	.loc 1 727 65
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 727 132
	movq	-64(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 728 20
	movq	-88(%rbp), %rax
	movq	%rax, -408(%rbp)
	.loc 1 729 25
	movq	-72(%rbp), %rax
	movq	%rax, -400(%rbp)
	.loc 1 730 9
	jmp	.L81
.L85:
	.loc 1 733 9
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 735 52
	movl	$24, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -240(%rbp)
	.loc 1 736 44
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -232(%rbp)
	.loc 1 737 55
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -224(%rbp)
	.loc 1 738 41
	movq	-224(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 740 58
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 740 42
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 740 75
	movq	(%rax), %rdx
	.loc 1 740 30
	movq	-232(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 741 64
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 741 48
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 741 81
	movl	16(%rax), %edx
	.loc 1 741 36
	movq	-232(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 742 59
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 742 43
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 742 76
	movq	8(%rax), %rdx
	.loc 1 742 31
	movq	-232(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 744 38
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -216(%rbp)
	.loc 1 745 34
	movq	-424(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 745 46
	leal	1(%rax), %ecx
	movq	-424(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 745 20
	movq	-216(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 746 22
	movq	-216(%rbp), %rax
	movl	$4, 4(%rax)
	.loc 1 747 24
	movq	-216(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rdx, 40(%rax)
	.loc 1 748 22
	movq	-216(%rbp), %rax
	movq	-240(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 749 28
	movq	-216(%rbp), %rax
	movq	-224(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 750 27
	movq	-240(%rbp), %rax
	movq	-232(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 753 39
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -208(%rbp)
	.loc 1 754 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 754 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 754 66
	movq	-208(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 755 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 755 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 755 72
	movl	$0, 16(%rax)
	.loc 1 756 36
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 756 20
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 756 53
	movq	8(%rax), %rax
	.loc 1 756 68
	movq	-208(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 757 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 757 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 757 52
	movq	(%rax), %rsi
	.loc 1 757 92
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 757 76
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 757 109
	movl	16(%rax), %edx
	.loc 1 757 128
	leal	1(%rdx), %ecx
	movl	%ecx, 16(%rax)
	movslq	%edx, %rax
	.loc 1 757 65
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 757 132
	movq	-216(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 758 9
	jmp	.L81
.L87:
	.loc 1 760 9
	movq	-392(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 761 9
	jmp	.L81
.L82:
	.loc 1 763 9
	movq	-392(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 764 47
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -336(%rbp)
	.loc 1 765 49
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -328(%rbp)
	.loc 1 766 46
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -320(%rbp)
	.loc 1 767 50
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	.loc 1 767 30
	movq	%rax, -360(%rbp)
	.loc 1 768 38
	movl	$88, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -312(%rbp)
	.loc 1 769 24
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 769 36
	leal	1(%rax), %edx
	movq	-400(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 770 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 770 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 770 53
	movq	-336(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 771 38
	movq	-336(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 1 772 32
	movq	-360(%rbp), %rdx
	movq	-336(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 773 33
	movq	-336(%rbp), %rax
	leaq	-360(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 774 9
	jmp	.L81
.L89:
	.loc 1 776 9
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 778 56
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 778 40
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 778 73
	movl	16(%rax), %eax
	.loc 1 778 9
	subl	$1, %eax
	movl	%eax, %esi
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 779 55
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 779 39
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 779 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	dump_expressions
	.loc 1 780 64
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 780 48
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 780 30
	movq	(%rax), %rax
	movq	%rax, -168(%rbp)
	.loc 1 781 52
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 781 36
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 781 13
	movl	16(%rax), %eax
	movl	%eax, -380(%rbp)
	.loc 1 782 70
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 782 54
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 782 31
	movq	8(%rax), %rax
	movq	%rax, -160(%rbp)
	.loc 1 784 53
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -152(%rbp)
	.loc 1 785 38
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -144(%rbp)
	.loc 1 786 56
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -136(%rbp)
	.loc 1 787 43
	movl	-380(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 787 36
	movq	-136(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 789 32
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 789 41
	movl	$1, 64(%rax)
	.loc 1 790 53
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -128(%rbp)
	.loc 1 791 56
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -120(%rbp)
	.loc 1 793 43
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -112(%rbp)
	.loc 1 794 14
	movl	-380(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-168(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 794 31
	movq	-112(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 796 39
	movq	-424(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 796 51
	leal	1(%rax), %ecx
	movq	-424(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 796 25
	movq	-112(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 797 27
	movq	-112(%rbp), %rax
	movl	$3, 4(%rax)
	.loc 1 799 27
	movq	-112(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 800 33
	movq	-112(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 801 41
	movq	-120(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 802 27
	movq	-152(%rbp), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 803 20
	movq	-112(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 803 46
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 803 26
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 803 83
	movl	$1, 16(%rax)
	.loc 1 804 20
	movq	-112(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 804 46
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 804 26
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 804 77
	movq	-136(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 805 39
	movq	-128(%rbp), %rax
	movq	-160(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 807 133
	movq	-112(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 807 159
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 807 139
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 807 176
	movq	(%rax), %rdx
	.loc 1 807 201
	movq	-112(%rbp), %rax
	movq	8(%rax), %rcx
	.loc 1 807 227
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 807 207
	salq	$3, %rax
	subq	$8, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 807 244
	movl	16(%rax), %eax
	cltq
	.loc 1 807 189
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	.loc 1 807 9
	movq	(%rax), %rdx
	.loc 1 807 58
	movq	-112(%rbp), %rax
	movq	8(%rax), %rcx
	.loc 1 807 84
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 807 64
	salq	$3, %rax
	subq	$8, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 807 9
	movl	16(%rax), %eax
	movl	%eax, %esi
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 808 55
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 808 39
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 808 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	dump_expressions
	.loc 1 810 16
	leaq	.LC30(%rip), %rax
	movq	%rax, -104(%rbp)
	.loc 1 812 15
	jmp	.L92
.L94:
.LBB25:
	.loc 1 813 11
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 814 27
	movl	$2, %edi
	call	malloc@PLT
	movq	%rax, -96(%rbp)
	.loc 1 815 11
	movq	-424(%rbp), %rsi
	movq	-416(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-120(%rbp), %rax
	subq	$8, %rsp
	pushq	-104(%rbp)
	movl	$1, %r9d
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	parse_expressions
	addq	$16, %rsp
	.loc 1 817 38
	movq	-424(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 817 11
	movzwl	(%rax), %edx
	movq	-96(%rbp), %rax
	movw	%dx, (%rax)
	.loc 1 818 15
	movq	-424(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -376(%rbp)
	.loc 1 819 34
	movq	-424(%rbp), %rax
	movq	72(%rax), %rax
	.loc 1 819 15
	leaq	.LC30(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 819 14
	testl	%eax, %eax
	je	.L92
	.loc 1 821 30
	movq	-424(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 821 13
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 822 37
	movq	-424(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 823 31
	movq	-424(%rbp), %rax
	movl	-376(%rbp), %edx
	movl	%edx, 8(%rax)
.L92:
.LBE25:
	.loc 1 812 28
	movq	-424(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 812 39
	testl	%eax, %eax
	jne	.L100
	.loc 1 812 61 discriminator 1
	movq	-424(%rbp), %rax
	movq	72(%rax), %rax
	.loc 1 812 42 discriminator 1
	leaq	.LC30(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 812 39 discriminator 1
	testl	%eax, %eax
	jne	.L94
	.loc 1 831 9
	jmp	.L100
.L86:
	.loc 1 833 9
	movq	-392(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 834 46
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -200(%rbp)
	.loc 1 835 48
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -192(%rbp)
	.loc 1 836 45
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -184(%rbp)
	.loc 1 837 48
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	.loc 1 837 30
	movq	%rax, -360(%rbp)
	.loc 1 838 37
	movl	$88, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -176(%rbp)
	.loc 1 839 24
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 839 36
	leal	1(%rax), %edx
	movq	-400(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 840 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 840 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 840 53
	movq	-200(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 841 37
	movq	-200(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 1 842 31
	movq	-360(%rbp), %rdx
	movq	-200(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 843 32
	movq	-200(%rbp), %rax
	leaq	-360(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 844 7
	jmp	.L81
.L83:
	.loc 1 846 9
	movq	-352(%rbp), %rdx
	movq	-392(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC58(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 847 42
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	.loc 1 848 26
	movq	-48(%rbp), %rax
	movl	$5, 4(%rax)
	.loc 1 849 33
	movq	-48(%rbp), %rax
	movq	-352(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 850 46
	movq	-424(%rbp), %rax
	movl	84(%rax), %edx
	.loc 1 850 32
	movq	-48(%rbp), %rax
	movl	%edx, 80(%rax)
	.loc 1 852 25
	movq	-424(%rbp), %rax
	movl	84(%rax), %eax
	.loc 1 852 12
	cmpl	$1, %eax
	jne	.L95
	.loc 1 853 37
	leaq	-360(%rbp), %rcx
	movq	-352(%rbp), %rax
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol@PLT
	.loc 1 853 35
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, 36(%rax)
.L95:
	.loc 1 856 51
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 857 51
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 858 54
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	.loc 1 859 53
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -16(%rbp)
	.loc 1 861 38
	movq	-424(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 861 50
	leal	1(%rax), %ecx
	movq	-424(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 861 24
	movq	-48(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 862 26
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 863 32
	movq	-48(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 864 28
	movq	-48(%rbp), %rax
	leaq	.LC59(%rip), %rdx
	movq	%rdx, 40(%rax)
	.loc 1 865 40
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 866 26
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 867 56
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 867 81
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 867 62
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	.loc 1 867 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC60(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 868 19
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 868 44
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 868 25
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 868 81
	movl	$0, 16(%rax)
	.loc 1 869 19
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 869 44
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 869 25
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 869 75
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 870 61
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 870 45
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 870 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 871 54
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 871 38
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 871 13
	movl	16(%rax), %eax
	movl	%eax, -372(%rbp)
	.loc 1 872 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 872 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 872 52
	movq	(%rax), %rax
	.loc 1 872 65
	movl	-372(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	.loc 1 872 80
	movq	-48(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 873 35
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 873 19
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 873 52
	movl	16(%rax), %edx
	.loc 1 873 71
	addl	$1, %edx
	movl	%edx, 16(%rax)
	.loc 1 874 87
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 874 71
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 874 104
	movq	(%rax), %rax
	.loc 1 874 117
	movl	-372(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 874 9
	movq	(%rax), %rdx
	movl	-372(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 875 55
	movq	-400(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 875 39
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-408(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 875 9
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	dump_expressions
	.loc 1 876 8
	jmp	.L81
.L100:
	.loc 1 831 9
	nop
.L81:
.LBE24:
.LBE23:
	.loc 1 661 19
	movq	-424(%rbp), %rax
	leaq	.LC62(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -352(%rbp)
	.loc 1 661 123
	cmpq	$0, -352(%rbp)
	je	.L96
	.loc 1 661 76 discriminator 1
	movq	-424(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 661 61 discriminator 1
	testl	%eax, %eax
	jne	.L96
	.loc 1 661 90 discriminator 2
	movq	-352(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 661 87 discriminator 2
	testl	%eax, %eax
	je	.L96
	.loc 1 661 123 discriminator 3
	cmpl	$0, -428(%rbp)
	je	.L97
	.loc 1 661 145 discriminator 4
	cmpl	$1, -428(%rbp)
	jne	.L96
	.loc 1 661 170 discriminator 5
	movq	-440(%rbp), %rdx
	movq	-352(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 661 167 discriminator 5
	testl	%eax, %eax
	jne	.L97
.L96:
	.loc 1 879 10
	movq	-408(%rbp), %rax
	.loc 1 880 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L99
	call	__stack_chk_fail@PLT
.L99:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	parse_expressions, .-parse_expressions
	.section	.rodata
.LC63:
	.string	"Getting token"
.LC64:
	.string	"parsebegin"
.LC65:
	.string	"%s"
.LC66:
	.string	"functionbodybegin"
.LC67:
	.string	"Is a function %s\n"
.LC68:
	.string	"expectfuncopen"
.LC69:
	.string	"Error expected parameter list"
.LC70:
	.string	"int"
.LC71:
	.string	"string"
.LC72:
	.string	"funcparamname"
.LC73:
	.string	"type is %s name is %s\n"
.LC74:
	.string	"there are %d parameters\n"
.LC75:
	.string	"commacheck"
.LC76:
	.string	"loopparameterlist"
.LC77:
	.string	"functioncurlyopencheck"
	.align 8
.LC78:
	.string	"Error: expected curlyopen after function parameters"
.LC79:
	.string	"function parse INTO %p"
.LC80:
	.string	"functionparse"
.LC81:
	.string	"is a parameter list"
.LC82:
	.string	"is a member access"
	.align 8
.LC83:
	.string	"%s Funcbody Is an identifier %s\n"
.LC84:
	.string	"%s New position is %d\n"
.LC85:
	.string	"identifier INTO %p\n"
.LC86:
	.string	"identifier"
	.text
	.globl	continue_parse
	.type	continue_parse, @function
continue_parse:
.LFB21:
	.loc 1 887 37
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -224(%rbp)
	movq	%rdx, -232(%rbp)
	movq	%rcx, -240(%rbp)
	movq	%r8, -248(%rbp)
	.loc 1 887 37
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 891 3
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 892 18
	movq	-248(%rbp), %rax
	leaq	.LC64(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -168(%rbp)
	.loc 1 893 3
	movq	-168(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 896 11
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	.loc 1 896 3
	movabsq	$7572387384277067, %rdx
	cmpq	%rdx, %rax
	je	.L102
	movabsq	$7572387384277067, %rdx
	cmpq	%rax, %rdx
	jb	.L103
	cmpq	$177613, %rax
	je	.L104
	movabsq	$6953778704349, %rdx
	cmpq	%rdx, %rax
	je	.L105
	jmp	.L103
.L102:
.LBB26:
	.loc 1 898 30
	movq	-248(%rbp), %rax
	leaq	.LC66(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -160(%rbp)
	.loc 1 899 35
	movl	$104, %edi
	call	malloc@PLT
	movq	%rax, -152(%rbp)
	.loc 1 900 37
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -144(%rbp)
	.loc 1 901 27
	movq	-152(%rbp), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, 88(%rax)
	.loc 1 902 34
	movq	-152(%rbp), %rax
	movl	$0, 24(%rax)
	.loc 1 903 19
	movq	-248(%rbp), %rax
	movq	40(%rax), %rdx
	.loc 1 903 43
	movq	-248(%rbp), %rax
	movl	48(%rax), %eax
	cltq
	.loc 1 903 30
	salq	$3, %rax
	addq	%rax, %rdx
	.loc 1 903 62
	movq	-152(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 904 19
	movq	-248(%rbp), %rax
	movl	48(%rax), %eax
	.loc 1 904 36
	leal	1(%rax), %edx
	movq	-248(%rbp), %rax
	movl	%edx, 48(%rax)
	.loc 1 905 39
	movl	$8, %esi
	movl	$10, %edi
	call	calloc@PLT
	movq	%rax, -136(%rbp)
	.loc 1 906 28
	movq	-152(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 907 22
	movq	-152(%rbp), %rax
	movq	-160(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 908 7
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 909 21
	movq	-248(%rbp), %rax
	leaq	.LC68(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -128(%rbp)
	.loc 1 910 11
	movq	-128(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 910 10
	testl	%eax, %eax
	je	.L106
	.loc 1 911 9
	leaq	.LC69(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L106:
	.loc 1 913 7
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 914 13
	jmp	.L107
.L112:
.LBB27:
	.loc 1 916 13
	movq	-168(%rbp), %rax
	leaq	.LC70(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 916 12
	testl	%eax, %eax
	jne	.L108
	.loc 1 917 17
	movq	-168(%rbp), %rax
	movq	%rax, -176(%rbp)
.L108:
	.loc 1 919 13
	movq	-168(%rbp), %rax
	leaq	.LC71(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 919 12
	testl	%eax, %eax
	jne	.L109
	.loc 1 920 17
	movq	-168(%rbp), %rax
	movq	%rax, -176(%rbp)
.L109:
	.loc 1 923 23
	movq	-248(%rbp), %rax
	leaq	.LC72(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -120(%rbp)
	.loc 1 924 9
	movq	-120(%rbp), %rdx
	movq	-176(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC73(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 925 25
	movl	$2, %edi
	call	malloc@PLT
	movq	%rax, -112(%rbp)
	.loc 1 927 39
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	.loc 1 928 25
	movq	-104(%rbp), %rax
	movq	-176(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 929 25
	movq	-104(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 930 9
	movq	-152(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 931 28
	movq	-152(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 931 46
	leal	1(%rax), %ecx
	movq	-152(%rbp), %rdx
	movl	%ecx, 24(%rdx)
	cltq
	.loc 1 931 19
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 931 50
	movq	-104(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 933 36
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 933 9
	movzwl	(%rax), %edx
	movq	-112(%rbp), %rax
	movw	%dx, (%rax)
	.loc 1 934 13
	movq	-248(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -196(%rbp)
	.loc 1 935 20
	movq	-248(%rbp), %rax
	leaq	.LC75(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, %rdx
	.loc 1 935 13
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	.loc 1 935 12
	testl	%eax, %eax
	je	.L107
	.loc 1 936 28
	movq	-248(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 936 11
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 937 35
	movq	-248(%rbp), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 938 29
	movq	-248(%rbp), %rax
	movl	-196(%rbp), %edx
	movl	%edx, 8(%rax)
.L107:
.LBE27:
	.loc 1 914 23
	movq	-248(%rbp), %rax
	leaq	.LC76(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -168(%rbp)
	.loc 1 914 92
	cmpq	$0, -168(%rbp)
	je	.L111
	.loc 1 914 81 discriminator 1
	movq	-248(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 914 66 discriminator 1
	testl	%eax, %eax
	jne	.L111
	.loc 1 914 95 discriminator 2
	movq	-168(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 914 92 discriminator 2
	testl	%eax, %eax
	jne	.L112
.L111:
	.loc 1 941 26
	movq	-248(%rbp), %rax
	leaq	.LC77(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettok
	movq	%rax, -96(%rbp)
	.loc 1 942 11
	movq	-96(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 942 10
	testl	%eax, %eax
	je	.L113
	.loc 1 943 9
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L113:
	.loc 1 946 37
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	.loc 1 946 27
	movq	%rax, -184(%rbp)
	.loc 1 947 51
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -88(%rbp)
	.loc 1 948 41
	movl	$24, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -80(%rbp)
	.loc 1 949 52
	movl	$4, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -72(%rbp)
	.loc 1 950 22
	movq	-152(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 40(%rax)
	.loc 1 951 25
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 952 28
	movq	-152(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 1 953 38
	movq	-72(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 954 29
	movq	-80(%rbp), %rax
	leaq	-184(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 955 28
	movq	-184(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 956 34
	movq	-80(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 1 958 7
	movq	-184(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC79(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 959 48
	movq	-248(%rbp), %rsi
	movq	-240(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-72(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	call	parse_expressions
	addq	$16, %rsp
	movq	%rax, -64(%rbp)
	.loc 1 961 14
	movq	-248(%rbp), %rsi
	movq	-240(%rbp), %rcx
	movq	-232(%rbp), %rdx
	movq	-224(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC80(%rip), %rax
	movq	%rax, %rdi
	call	continue_parse
	jmp	.L114
.L104:
	.loc 1 964 7
	leaq	.LC81(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 965 7
	jmp	.L115
.L105:
	.loc 1 967 7
	leaq	.LC82(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 969 7
	jmp	.L115
.L103:
	.loc 1 971 7
	movq	-168(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC83(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 972 40
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	.loc 1 973 50
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	.loc 1 974 50
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 975 54
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 976 41
	movl	$88, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -24(%rbp)
	.loc 1 977 39
	movq	-32(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 978 36
	movq	-248(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 978 48
	leal	1(%rax), %ecx
	movq	-248(%rbp), %rdx
	movl	%ecx, 80(%rdx)
	.loc 1 978 22
	movq	-56(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 979 24
	movq	-56(%rbp), %rax
	movl	$5, 4(%rax)
	.loc 1 980 31
	movq	-56(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 981 24
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 982 24
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 983 17
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 983 43
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 983 23
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 983 80
	movl	$0, 16(%rax)
	.loc 1 984 17
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 984 43
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 984 23
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 984 74
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 985 30
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 986 52
	movq	-224(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 986 36
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 986 69
	movl	16(%rdx), %eax
	.loc 1 986 88
	leal	1(%rax), %ecx
	movl	%ecx, 16(%rdx)
	.loc 1 986 11
	movl	%eax, -192(%rbp)
	.loc 1 987 7
	movl	-192(%rbp), %edx
	movq	-216(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC84(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 988 64
	movq	-224(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 988 48
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 988 7
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC85(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 989 33
	movq	-224(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 989 17
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 989 50
	movq	(%rax), %rax
	.loc 1 989 63
	movl	-192(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	.loc 1 989 78
	movq	-56(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 990 11
	movl	$0, -188(%rbp)
	.loc 1 991 47
	movq	-248(%rbp), %rsi
	movq	-240(%rbp), %rcx
	movq	-232(%rbp), %rdx
	movq	-224(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movl	$0, %r9d
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC86(%rip), %rax
	movq	%rax, %rdi
	call	parse_expressions
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	.loc 1 992 7
	nop
.L115:
.LBE26:
	.loc 1 995 10
	movq	-248(%rbp), %rax
.L114:
	.loc 1 996 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L116
	call	__stack_chk_fail@PLT
.L116:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	continue_parse, .-continue_parse
	.section	.rodata
.LC87:
	.string	"FIRST INTO %p\n"
.LC88:
	.string	"function"
.LC89:
	.string	"if"
.LC90:
	.string	"return"
.LC91:
	.string	"rax"
.LC92:
	.string	"rbx"
.LC93:
	.string	"rcx"
.LC94:
	.string	"rdx"
.LC95:
	.string	"rsi"
.LC96:
	.string	"rdi"
.LC97:
	.string	"HASH TABLE %ld\n"
.LC98:
	.string	"%s %ld\n"
.LC99:
	.string	"rootparse"
	.text
	.globl	parse
	.type	parse, @function
parse:
.LFB22:
	.loc 1 999 60
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movl	%edi, -212(%rbp)
	movq	%rsi, -224(%rbp)
	.loc 1 999 60
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1000 39
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -192(%rbp)
	.loc 1 1001 43
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -184(%rbp)
	.loc 1 1002 36
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -176(%rbp)
	.loc 1 1003 46
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -168(%rbp)
	.loc 1 1004 21
	movq	-192(%rbp), %rax
	movl	$0, 8(%rax)
	.loc 1 1005 22
	movq	-192(%rbp), %rax
	movq	-184(%rbp), %rdx
	movq	%rdx, 56(%rax)
	.loc 1 1006 17
	movq	-184(%rbp), %rax
	movq	-176(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1007 31
	movq	-168(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 1008 24
	movq	-192(%rbp), %rax
	movl	-212(%rbp), %edx
	movl	%edx, 28(%rax)
	.loc 1 1009 30
	movq	-192(%rbp), %rax
	movq	-224(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 1010 22
	movl	$2, %edi
	call	malloc@PLT
	movq	%rax, -160(%rbp)
	.loc 1 1011 3
	movq	-160(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1012 16
	movq	-160(%rbp), %rax
	movb	$32, (%rax)
	.loc 1 1013 30
	movq	-192(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 1013 57
	movq	-192(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	.loc 1 1013 44
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	.loc 1 1013 16
	movq	-160(%rbp), %rax
	movb	%dl, (%rax)
	.loc 1 1014 27
	movq	-192(%rbp), %rax
	movq	-160(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1015 21
	movq	-192(%rbp), %rax
	movl	$0, 24(%rax)
	.loc 1 1016 23
	movq	-192(%rbp), %rax
	movl	$1, 32(%rax)
	.loc 1 1017 30
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	.loc 1 1017 23
	movq	%rax, -200(%rbp)
	.loc 1 1018 21
	movq	-200(%rbp), %rdx
	movq	-176(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1019 27
	movq	-176(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 1 1020 22
	movq	-176(%rbp), %rax
	leaq	-200(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 1021 3
	movq	-200(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC87(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1022 10
	leaq	.LC33(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	.LC88(%rip), %rax
	movq	%rax, -136(%rbp)
	leaq	.LC89(%rip), %rax
	movq	%rax, -128(%rbp)
	leaq	.LC90(%rip), %rax
	movq	%rax, -120(%rbp)
	leaq	.LC23(%rip), %rax
	movq	%rax, -112(%rbp)
	leaq	.LC30(%rip), %rax
	movq	%rax, -104(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, -96(%rbp)
	leaq	.LC17(%rip), %rax
	movq	%rax, -88(%rbp)
	leaq	.LC21(%rip), %rax
	movq	%rax, -80(%rbp)
	leaq	.LC19(%rip), %rax
	movq	%rax, -72(%rbp)
	leaq	.LC91(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC92(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC93(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC94(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC95(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC96(%rip), %rax
	movq	%rax, -24(%rbp)
	.loc 1 1023 3
	movl	$128, %esi
	leaq	.LC97(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB28:
	.loc 1 1024 12
	movl	$0, -204(%rbp)
	.loc 1 1024 3
	jmp	.L118
.L119:
	.loc 1 1025 50 discriminator 3
	movl	-204(%rbp), %eax
	cltq
	movq	-144(%rbp,%rax,8), %rax
	.loc 1 1025 5 discriminator 3
	movq	%rax, %rdi
	call	hash
	movq	%rax, %rdx
	movl	-204(%rbp), %eax
	cltq
	movq	-144(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	leaq	.LC98(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1024 65 discriminator 3
	addl	$1, -204(%rbp)
.L118:
	.loc 1 1024 22 discriminator 1
	movl	-204(%rbp), %eax
	cmpl	$15, %eax
	jbe	.L119
.LBE28:
	.loc 1 1027 3
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 1029 33
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -152(%rbp)
	.loc 1 1030 27
	movq	-192(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, 40(%rax)
	.loc 1 1031 33
	movq	-192(%rbp), %rax
	movl	$0, 48(%rax)
	.loc 1 1032 28
	movq	-192(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, 64(%rax)
	.loc 1 1033 10
	movq	-192(%rbp), %rsi
	movq	-176(%rbp), %rcx
	movq	-184(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC99(%rip), %rax
	movq	%rax, %rdi
	call	continue_parse
	.loc 1 1034 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L121
	call	__stack_chk_fail@PLT
.L121:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	parse, .-parse
	.section	.rodata
.LC100:
	.string	"##########"
.LC101:
	.string	"Function %s\n"
.LC102:
	.string	"- parameter name %s\n"
.LC103:
	.string	"- parameter type %s\n"
.LC104:
	.string	"Has %d statements\n"
	.text
	.globl	dump_function
	.type	dump_function, @function
dump_function:
.LFB23:
	.loc 1 1037 46
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 1038 3
	leaq	.LC100(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1039 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC101(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB29:
	.loc 1 1040 12
	movl	$0, -8(%rbp)
	.loc 1 1040 3
	jmp	.L123
.L124:
	.loc 1 1041 45 discriminator 3
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1041 57 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1041 5 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC102(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1042 45 discriminator 3
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1042 57 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1042 5 discriminator 3
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC103(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1040 53 discriminator 3
	addl	$1, -8(%rbp)
.L123:
	.loc 1 1040 32 discriminator 1
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	.loc 1 1040 22 discriminator 1
	cmpl	%eax, -8(%rbp)
	jl	.L124
.LBE29:
	.loc 1 1044 41
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 1044 3
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC104(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB30:
	.loc 1 1045 12
	movl	$0, -4(%rbp)
	.loc 1 1045 3
	jmp	.L125
.L126:
	.loc 1 1046 33 discriminator 3
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1046 39 discriminator 3
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1046 5 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	dump_expressions
	.loc 1 1045 59 discriminator 3
	addl	$1, -4(%rbp)
.L125:
	.loc 1 1045 32 discriminator 1
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	.loc 1 1045 44 discriminator 1
	movl	(%rax), %eax
	.loc 1 1045 22 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L126
.LBE30:
	.loc 1 1048 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	dump_function, .-dump_function
	.globl	descendanf
	.type	descendanf, @function
descendanf:
.LFB24:
	.loc 1 1058 79
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
.LBB31:
	.loc 1 1059 27
	movq	-32(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 1059 12
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	.loc 1 1059 3
	jmp	.L128
.L131:
.LBB32:
	.loc 1 1062 29
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1062 42
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1062 45
	movq	16(%rax), %rax
	.loc 1 1062 57
	movl	(%rax), %eax
	.loc 1 1062 14
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	.loc 1 1062 5
	jmp	.L129
.L130:
	.loc 1 1063 34 discriminator 3
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1063 47 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1063 50 discriminator 3
	movq	8(%rax), %rax
	.loc 1 1063 56 discriminator 3
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1063 7 discriminator 3
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	descendanf
	.loc 1 1062 86 discriminator 3
	subl	$1, -4(%rbp)
.L129:
	.loc 1 1062 78 discriminator 1
	cmpl	$0, -4(%rbp)
	jns	.L130
.LBE32:
	.loc 1 1065 49 discriminator 2
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1065 62 discriminator 2
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rsi
	.loc 1 1065 8 discriminator 2
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	.loc 1 1065 25 discriminator 2
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1065 32 discriminator 2
	leal	1(%rax), %ecx
	movq	-24(%rbp), %rdx
	movl	%ecx, 8(%rdx)
	cltq
	.loc 1 1065 21 discriminator 2
	salq	$3, %rax
	leaq	(%rdi,%rax), %rdx
	.loc 1 1065 62 discriminator 2
	movq	(%rsi), %rax
	.loc 1 1065 36 discriminator 2
	movq	%rax, (%rdx)
	.loc 1 1059 63 discriminator 2
	subl	$1, -8(%rbp)
.L128:
	.loc 1 1059 54 discriminator 1
	cmpl	$0, -8(%rbp)
	jns	.L131
.LBE31:
	.loc 1 1067 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	descendanf, .-descendanf
	.globl	normalform
	.type	normalform, @function
normalform:
.LFB25:
	.loc 1 1069 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	.loc 1 1070 25
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 1071 29
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 1072 15
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 1073 35
	movq	-72(%rbp), %rax
	movq	40(%rax), %rdx
	.loc 1 1073 21
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
.LBB33:
	.loc 1 1074 12
	movl	$0, -56(%rbp)
	.loc 1 1074 3
	jmp	.L133
.L134:
	.loc 1 1075 17 discriminator 3
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1075 28 discriminator 3
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1075 36 discriminator 3
	movl	-56(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 1074 56 discriminator 3
	addl	$1, -56(%rbp)
.L133:
	.loc 1 1074 36 discriminator 1
	movq	-72(%rbp), %rax
	movl	48(%rax), %eax
	.loc 1 1074 22 discriminator 1
	cmpl	%eax, -56(%rbp)
	jl	.L134
.LBE33:
	.loc 1 1077 41
	movq	-72(%rbp), %rax
	movl	48(%rax), %edx
	.loc 1 1077 27
	movq	-40(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 1079 38
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -24(%rbp)
	.loc 1 1080 20
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1081 14
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
.LBB34:
	.loc 1 1082 12
	movl	$0, -52(%rbp)
	.loc 1 1082 3
	jmp	.L135
.L138:
.LBB35:
	.loc 1 1083 40
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	.loc 1 1084 48
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 1085 17
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1085 28
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1085 37
	movq	-16(%rbp), %rdx
	movq	%rdx, 56(%rax)
	.loc 1 1086 17
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1086 28
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1086 31
	movq	56(%rax), %rax
	.loc 1 1086 44
	movl	$0, 8(%rax)
	.loc 1 1087 17
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1087 28
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1087 31
	movq	56(%rax), %rax
	.loc 1 1087 50
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
.LBB36:
	.loc 1 1088 14
	movl	$0, -48(%rbp)
	.loc 1 1088 5
	jmp	.L136
.L137:
	.loc 1 1089 63 discriminator 3
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1089 74 discriminator 3
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1089 77 discriminator 3
	movq	40(%rax), %rax
	.loc 1 1089 83 discriminator 3
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1089 7 discriminator 3
	movq	(%rax), %rdx
	.loc 1 1089 30 discriminator 3
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1089 41 discriminator 3
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1089 7 discriminator 3
	movq	56(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	descendanf
	.loc 1 1088 79 discriminator 3
	addl	$1, -48(%rbp)
.L136:
	.loc 1 1088 38 discriminator 1
	movq	-72(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1088 49 discriminator 1
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1088 52 discriminator 1
	movq	48(%rax), %rax
	.loc 1 1088 64 discriminator 1
	movl	(%rax), %eax
	.loc 1 1088 24 discriminator 1
	cmpl	%eax, -48(%rbp)
	jl	.L137
.LBE36:
.LBE35:
	.loc 1 1082 56 discriminator 2
	addl	$1, -52(%rbp)
.L135:
	.loc 1 1082 36 discriminator 1
	movq	-72(%rbp), %rax
	movl	48(%rax), %eax
	.loc 1 1082 22 discriminator 1
	cmpl	%eax, -52(%rbp)
	jl	.L138
.LBE34:
.LBB37:
	.loc 1 1092 12
	movl	$0, -44(%rbp)
	.loc 1 1092 3
	jmp	.L139
.L140:
	.loc 1 1093 33 discriminator 3
	movq	-72(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 1093 39 discriminator 3
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1093 5 discriminator 3
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	descendanf
	.loc 1 1092 63 discriminator 3
	addl	$1, -44(%rbp)
.L139:
	.loc 1 1092 36 discriminator 1
	movq	-72(%rbp), %rax
	movq	64(%rax), %rax
	.loc 1 1092 48 discriminator 1
	movl	(%rax), %eax
	.loc 1 1092 22 discriminator 1
	cmpl	%eax, -44(%rbp)
	jl	.L140
.LBE37:
	.loc 1 1095 10
	movq	-40(%rbp), %rax
	.loc 1 1096 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	normalform, .-normalform
	.section	.rodata
.LC105:
	.string	"Resolving function %s\n"
.LC106:
	.string	"Inspecting function %s\n"
	.text
	.globl	resolve_name
	.type	resolve_name, @function
resolve_name:
.LFB26:
	.loc 1 1098 87
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 1099 3
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC105(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB38:
	.loc 1 1100 12
	movl	$0, -8(%rbp)
	.loc 1 1100 3
	jmp	.L143
.L146:
	.loc 1 1101 47
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1101 63
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1101 5
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC106(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1102 23
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1102 39
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1102 42
	movq	(%rax), %rax
	.loc 1 1102 9
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 1102 8
	testl	%eax, %eax
	jne	.L144
	.loc 1 1103 21
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1103 37
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L142
.L144:
	.loc 1 1100 51 discriminator 2
	addl	$1, -8(%rbp)
.L143:
	.loc 1 1100 31 discriminator 1
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 1100 22 discriminator 1
	cmpl	%eax, -8(%rbp)
	jl	.L146
.LBE38:
.LBB39:
	.loc 1 1106 12
	movl	$0, -4(%rbp)
	.loc 1 1106 3
	jmp	.L147
.L149:
	.loc 1 1107 23
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1107 41
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1107 44
	movq	(%rax), %rax
	.loc 1 1107 9
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 1107 8
	testl	%eax, %eax
	jne	.L148
	.loc 1 1108 21
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1108 39
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L142
.L148:
	.loc 1 1106 58 discriminator 2
	addl	$1, -4(%rbp)
.L147:
	.loc 1 1106 31 discriminator 1
	movq	-24(%rbp), %rax
	movl	20(%rax), %eax
	.loc 1 1106 22 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L149
.L142:
.LBE39:
	.loc 1 1111 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	resolve_name, .-resolve_name
	.section	.rodata
.LC107:
	.string	"Generating method call"
	.align 8
.LC108:
	.string	"Method call to function %s at %p\n"
.LC109:
	.string	"%s %p\n"
.LC110:
	.string	"%p %p relative pointer %ld\n"
	.align 8
.LC111:
	.string	"%p %p creating function id %ld\n"
	.align 8
.LC112:
	.string	"%p creating function stub %ld\n"
.LC113:
	.string	"Generating add"
.LC114:
	.string	"%d add bytes length\n"
.LC115:
	.string	"Add instruction left is %s\n"
	.align 8
.LC116:
	.string	"Right instruction right is %s\n"
.LC117:
	.string	"my register is %s\n"
	.align 8
.LC118:
	.string	"register left is destination register"
.LC119:
	.string	"Generating reference"
.LC120:
	.string	"%s %s\n"
.LC121:
	.string	"reference %s\n"
.LC122:
	.string	"mov $%d, %%%s\n"
.LC123:
	.string	"%x\n"
	.text
	.globl	writecode
	.type	writecode, @function
writecode:
.LFB27:
	.loc 1 1113 116
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%rdi, -296(%rbp)
	movq	%rsi, -304(%rbp)
	movq	%rdx, -312(%rbp)
	.loc 1 1113 116
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.LBB40:
	.loc 1 1114 12
	movl	$0, -280(%rbp)
	.loc 1 1114 3
	jmp	.L151
.L224:
	.loc 1 1115 16
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1115 33
	movq	(%rax), %rcx
	.loc 1 1115 46
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1115 49
	movq	(%rax), %rax
	.loc 1 1115 60
	movl	4(%rax), %eax
	.loc 1 1115 5
	cmpl	$6, %eax
	je	.L152
	cmpl	$6, %eax
	jg	.L153
	cmpl	$3, %eax
	je	.L154
	cmpl	$5, %eax
	je	.L155
	jmp	.L153
.L154:
.LBB41:
	.loc 1 1117 10
	leaq	.LC107(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1118 14
	movl	$2, -216(%rbp)
	.loc 1 1119 32
	movl	-216(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	.loc 1 1120 14
	movl	$0, -276(%rbp)
	.loc 1 1121 39
	movl	-276(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -276(%rbp)
	movslq	%eax, %rdx
	.loc 1 1121 22
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1121 43
	movb	$-1, (%rax)
	.loc 1 1122 39
	movl	-276(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -276(%rbp)
	movslq	%eax, %rdx
	.loc 1 1122 22
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1122 43
	movb	$-48, (%rax)
	.loc 1 1123 34
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -96(%rbp)
	.loc 1 1124 14
	movl	$0, -212(%rbp)
	.loc 1 1125 58
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1125 75
	movq	(%rax), %rcx
	.loc 1 1125 88
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1125 30
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	.loc 1 1126 64
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1126 81
	movq	(%rax), %rcx
	.loc 1 1126 94
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1126 97
	movq	(%rax), %rax
	.loc 1 1126 108
	movq	8(%rax), %rax
	.loc 1 1126 114
	movq	(%rax), %rax
	.loc 1 1126 117
	movq	(%rax), %rax
	.loc 1 1126 30
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	.loc 1 1127 17
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -72(%rbp)
	.loc 1 1128 39
	movq	-72(%rbp), %rdx
	movq	-296(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	resolve_name
	movq	%rax, -64(%rbp)
	.loc 1 1129 10
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1131 10
	movq	-64(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC108(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1133 40
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1133 57
	movq	(%rax), %rcx
	.loc 1 1133 70
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1133 73
	movq	(%rax), %rax
	.loc 1 1133 84
	movq	8(%rax), %rax
	.loc 1 1133 90
	movq	(%rax), %rax
	.loc 1 1133 93
	movq	(%rax), %rax
	.loc 1 1133 30
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
	.loc 1 1134 10
	movq	-56(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC109(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1136 26
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1136 49
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1136 53
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1136 32
	addq	%rsi, %rax
	.loc 1 1136 57
	movb	$72, (%rax)
	.loc 1 1137 26
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1137 49
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1137 53
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1137 32
	addq	%rsi, %rax
	.loc 1 1137 57
	movb	$-119, (%rax)
	.loc 1 1138 26
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1138 49
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1138 53
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1138 32
	addq	%rsi, %rax
	.loc 1 1138 57
	movb	$-27, (%rax)
	.loc 1 1141 22
	movq	-64(%rbp), %rax
	movl	80(%rax), %eax
	.loc 1 1141 13
	cmpl	$1, %eax
	jne	.L156
	.loc 1 1142 24
	movq	-64(%rbp), %rax
	movl	100(%rax), %eax
	.loc 1 1142 15
	cmpl	$1, %eax
	jne	.L226
.LBB42:
	.loc 1 1144 30
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1144 53
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1144 57
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1144 36
	addq	%rsi, %rax
	.loc 1 1144 61
	movb	$72, (%rax)
	.loc 1 1145 30
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1145 53
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1145 57
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1145 36
	addq	%rsi, %rax
	.loc 1 1145 61
	movb	$-65, (%rax)
	.loc 1 1146 45
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 1146 70
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 1146 21
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 1147 31
	movl	$8, %edi
	call	malloc@PLT
	.loc 1 1147 21
	movq	%rax, -208(%rbp)
	.loc 1 1149 28
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 1149 22
	movq	%rax, -208(%rbp)
	.loc 1 1150 14
	movq	-208(%rbp), %rax
	movq	%rax, %rcx
	movq	-208(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC110(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1151 14
	movq	-208(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1152 30
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1152 35
	leal	8(%rax), %edx
	movq	-304(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1154 30
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1154 53
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1154 57
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1154 36
	addq	%rsi, %rax
	.loc 1 1154 61
	movb	$72, (%rax)
	.loc 1 1155 30
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1155 53
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1155 57
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1155 36
	addq	%rsi, %rax
	.loc 1 1155 61
	movb	$-72, (%rax)
	.loc 1 1157 46
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 1157 71
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 1157 21
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	.loc 1 1158 32
	movl	$8, %edi
	call	malloc@PLT
	.loc 1 1158 21
	movq	%rax, -200(%rbp)
	.loc 1 1160 33
	movq	-64(%rbp), %rax
	movq	64(%rax), %rax
	.loc 1 1160 23
	movq	%rax, -200(%rbp)
	.loc 1 1161 14
	movq	-200(%rbp), %rax
	movq	%rax, %rcx
	movq	-200(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC110(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1162 14
	movq	-200(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1163 30
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1163 35
	leal	8(%rax), %edx
	movq	-304(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1164 30
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1164 53
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1164 57
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1164 36
	addq	%rsi, %rax
	.loc 1 1164 61
	movb	$72, (%rax)
.LBB43:
	.loc 1 1166 23
	movl	$0, -272(%rbp)
	.loc 1 1166 14
	jmp	.L158
.L159:
	.loc 1 1166 54 discriminator 3
	addl	$1, -272(%rbp)
.L158:
	.loc 1 1166 33 discriminator 1
	movl	-272(%rbp), %eax
	cmpl	$3, %eax
	jbe	.L159
.LBE43:
.LBB44:
	.loc 1 1169 23
	movl	$0, -268(%rbp)
	.loc 1 1169 14
	jmp	.L160
.L161:
	.loc 1 1170 65 discriminator 3
	movl	-268(%rbp), %eax
	movslq	%eax, %rdx
	movq	-96(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 1 1170 45 discriminator 3
	movl	-276(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -276(%rbp)
	movslq	%eax, %rdx
	.loc 1 1170 28 discriminator 3
	movq	-104(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1170 65 discriminator 3
	movzbl	(%rcx), %eax
	.loc 1 1170 49 discriminator 3
	movb	%al, (%rdx)
	.loc 1 1169 54 discriminator 3
	addl	$1, -268(%rbp)
.L160:
	.loc 1 1169 33 discriminator 1
	movl	-268(%rbp), %eax
	cmpl	$3, %eax
	jbe	.L161
.LBE44:
.LBB45:
	.loc 1 1172 23
	movl	$0, -264(%rbp)
	.loc 1 1172 14
	jmp	.L162
.L163:
	.loc 1 1173 77 discriminator 3
	movl	-264(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	.loc 1 1173 32 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdi
	.loc 1 1173 55 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1173 59 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1173 38 discriminator 3
	leaq	(%rdi,%rax), %rdx
	.loc 1 1173 77 discriminator 3
	movzbl	(%rsi), %eax
	.loc 1 1173 63 discriminator 3
	movb	%al, (%rdx)
	.loc 1 1172 54 discriminator 3
	addl	$1, -264(%rbp)
.L162:
	.loc 1 1172 32 discriminator 1
	movl	-264(%rbp), %eax
	cmpl	-216(%rbp), %eax
	jl	.L163
.LBE45:
.LBE42:
	.loc 1 1209 10
	jmp	.L226
.L156:
.LBB46:
	.loc 1 1177 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1177 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1177 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1177 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1177 59 discriminator 3
	movb	$72, (%rax)
	.loc 1 1178 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1178 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1178 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1178 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1178 59 discriminator 3
	movb	$-65, (%rax)
	.loc 1 1179 43 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 1179 68 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 1179 19 discriminator 3
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
	.loc 1 1180 29 discriminator 3
	movl	$8, %edi
	call	malloc@PLT
	.loc 1 1180 19 discriminator 3
	movq	%rax, -208(%rbp)
	.loc 1 1182 37 discriminator 3
	movq	-64(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	.loc 1 1182 20 discriminator 3
	movq	%rax, -208(%rbp)
	.loc 1 1183 12 discriminator 3
	movq	-208(%rbp), %rax
	movq	%rax, %rcx
	movq	-208(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC111(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1184 12 discriminator 3
	movq	-208(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1185 28 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1185 33 discriminator 3
	leal	8(%rax), %edx
	movq	-304(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1187 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1187 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1187 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1187 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1187 59 discriminator 3
	movb	$73, (%rax)
	.loc 1 1188 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1188 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1188 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1188 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1188 59 discriminator 3
	movb	$-69, (%rax)
	.loc 1 1189 56 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 1189 81 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	cltq
	.loc 1 1189 19 discriminator 3
	addq	%rdx, %rax
	movq	%rax, -40(%rbp)
	.loc 1 1190 37 discriminator 3
	movl	$8, %edi
	call	malloc@PLT
	.loc 1 1190 19 discriminator 3
	movq	%rax, -200(%rbp)
	.loc 1 1192 28 discriminator 3
	leaq	compile_stub(%rip), %rax
	movq	%rax, -200(%rbp)
	.loc 1 1193 12 discriminator 3
	movq	-200(%rbp), %rax
	movq	%rax, %rdx
	movq	-200(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC112(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1194 12 discriminator 3
	movq	-200(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1196 40 discriminator 3
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 1197 43 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %edx
	.loc 1 1197 25 discriminator 3
	movq	-32(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 1198 31 discriminator 3
	movq	-32(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1199 39 discriminator 3
	movq	-32(%rbp), %rax
	movq	-304(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 1200 20 discriminator 3
	movq	-64(%rbp), %rax
	movq	88(%rax), %rsi
	.loc 1 1200 40 discriminator 3
	movq	-64(%rbp), %rax
	movl	96(%rax), %eax
	.loc 1 1200 57 discriminator 3
	leal	1(%rax), %ecx
	movq	-64(%rbp), %rdx
	movl	%ecx, 96(%rdx)
	cltq
	.loc 1 1200 31 discriminator 3
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 1200 61 discriminator 3
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1202 28 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1202 33 discriminator 3
	leal	8(%rax), %edx
	movq	-304(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1204 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1204 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1204 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1204 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1204 59 discriminator 3
	movb	$65, (%rax)
	.loc 1 1205 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1205 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1205 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1205 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1205 59 discriminator 3
	movb	$-1, (%rax)
	.loc 1 1206 28 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rsi
	.loc 1 1206 51 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1206 55 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1206 34 discriminator 3
	addq	%rsi, %rax
	.loc 1 1206 59 discriminator 3
	movb	$-45, (%rax)
.LBE46:
	.loc 1 1209 10 discriminator 3
	jmp	.L226
.L152:
	.loc 1 1211 10
	leaq	.LC113(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1212 14
	movl	$4, -244(%rbp)
	.loc 1 1213 14
	movl	$3, -240(%rbp)
	.loc 1 1214 10
	movl	-240(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC114(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1215 29
	movl	-240(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -184(%rbp)
	.loc 1 1216 14
	movl	$0, -236(%rbp)
	.loc 1 1218 40
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1218 53
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1218 56
	movq	8(%rax), %rax
	.loc 1 1218 62
	movq	(%rax), %rax
	.loc 1 1218 65
	movq	(%rax), %rax
	.loc 1 1218 30
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	.loc 1 1219 41
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1219 54
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1219 57
	movq	8(%rax), %rax
	.loc 1 1219 63
	movq	(%rax), %rax
	.loc 1 1219 66
	movq	(%rax), %rax
	.loc 1 1219 30
	movq	8(%rax), %rax
	movq	%rax, -168(%rbp)
	.loc 1 1220 17
	movq	-176(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -192(%rbp)
	.loc 1 1221 17
	movq	-168(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -160(%rbp)
	.loc 1 1223 10
	movq	-192(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC115(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1224 10
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC116(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1225 43
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1225 56
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1225 17
	movq	72(%rax), %rax
	movq	%rax, -152(%rbp)
	.loc 1 1226 10
	movq	-152(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC117(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1228 14
	movq	-152(%rbp), %rdx
	movq	-192(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 1228 13
	testl	%eax, %eax
	jne	.L164
	.loc 1 1229 12
	leaq	.LC118(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1230 26
	movq	-160(%rbp), %rax
	movq	%rax, -192(%rbp)
.L164:
	.loc 1 1233 35
	movl	-236(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -236(%rbp)
	movslq	%eax, %rdx
	.loc 1 1233 19
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1233 39
	movb	$72, (%rax)
	.loc 1 1234 35
	movl	-236(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -236(%rbp)
	movslq	%eax, %rdx
	.loc 1 1234 19
	movq	-184(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1234 39
	movb	$1, (%rax)
	.loc 1 1236 35
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	movq	%rax, -144(%rbp)
	.loc 1 1237 36
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	hash
	movq	%rax, -136(%rbp)
	cmpq	$193505043, -136(%rbp)
	je	.L165
	cmpq	$193505043, -136(%rbp)
	ja	.L166
	cmpq	$193504563, -136(%rbp)
	je	.L167
	cmpq	$193504563, -136(%rbp)
	ja	.L166
	cmpq	$193504548, -136(%rbp)
	je	.L168
	cmpq	$193504548, -136(%rbp)
	ja	.L166
	cmpq	$193504530, -136(%rbp)
	je	.L169
	cmpq	$193504530, -136(%rbp)
	ja	.L166
	cmpq	$193504464, -136(%rbp)
	je	.L170
	cmpq	$193504497, -136(%rbp)
	je	.L171
	jmp	.L166
.L170:
	cmpq	$193505043, -144(%rbp)
	je	.L172
	cmpq	$193505043, -144(%rbp)
	ja	.L227
	cmpq	$193504563, -144(%rbp)
	je	.L174
	cmpq	$193504563, -144(%rbp)
	ja	.L227
	cmpq	$193504548, -144(%rbp)
	je	.L175
	cmpq	$193504548, -144(%rbp)
	ja	.L227
	cmpq	$193504497, -144(%rbp)
	je	.L176
	cmpq	$193504530, -144(%rbp)
	je	.L177
	.loc 1 1257 12
	jmp	.L227
.L176:
	.loc 1 1242 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1242 31
	movb	$-40, (%rax)
	.loc 1 1243 16
	jmp	.L173
.L177:
	.loc 1 1245 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1245 31
	movb	$-56, (%rax)
	.loc 1 1246 16
	jmp	.L173
.L174:
	.loc 1 1248 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1248 31
	movb	$-48, (%rax)
	.loc 1 1249 16
	jmp	.L173
.L172:
	.loc 1 1251 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1251 31
	movb	$-16, (%rax)
	.loc 1 1252 16
	jmp	.L173
.L175:
	.loc 1 1254 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1254 31
	movb	$-8, (%rax)
	.loc 1 1255 16
	nop
.L173:
	.loc 1 1257 12 discriminator 10
	jmp	.L227
.L171:
	cmpq	$193505043, -144(%rbp)
	je	.L178
	cmpq	$193505043, -144(%rbp)
	ja	.L228
	cmpq	$193504563, -144(%rbp)
	je	.L180
	cmpq	$193504563, -144(%rbp)
	ja	.L228
	cmpq	$193504548, -144(%rbp)
	je	.L181
	cmpq	$193504548, -144(%rbp)
	ja	.L228
	cmpq	$193504464, -144(%rbp)
	je	.L182
	cmpq	$193504530, -144(%rbp)
	je	.L183
	.loc 1 1276 12
	jmp	.L228
.L182:
	.loc 1 1261 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1261 31
	movb	$-61, (%rax)
	.loc 1 1262 16
	jmp	.L179
.L183:
	.loc 1 1264 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1264 31
	movb	$-53, (%rax)
	.loc 1 1265 16
	jmp	.L179
.L180:
	.loc 1 1267 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1267 31
	movb	$-45, (%rax)
	.loc 1 1268 16
	jmp	.L179
.L178:
	.loc 1 1270 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1270 31
	movb	$-13, (%rax)
	.loc 1 1271 16
	jmp	.L179
.L181:
	.loc 1 1273 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1273 31
	movb	$-5, (%rax)
	.loc 1 1274 16
	nop
.L179:
	.loc 1 1276 12 discriminator 11
	jmp	.L228
.L169:
	cmpq	$193505043, -144(%rbp)
	je	.L184
	cmpq	$193505043, -144(%rbp)
	ja	.L229
	cmpq	$193504563, -144(%rbp)
	je	.L186
	cmpq	$193504563, -144(%rbp)
	ja	.L229
	cmpq	$193504548, -144(%rbp)
	je	.L187
	cmpq	$193504548, -144(%rbp)
	ja	.L229
	cmpq	$193504464, -144(%rbp)
	je	.L188
	cmpq	$193504497, -144(%rbp)
	je	.L189
	.loc 1 1295 12
	jmp	.L229
.L188:
	.loc 1 1280 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1280 31
	movb	$-63, (%rax)
	.loc 1 1281 16
	jmp	.L185
.L189:
	.loc 1 1283 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1283 31
	movb	$-39, (%rax)
	.loc 1 1284 16
	jmp	.L185
.L186:
	.loc 1 1286 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1286 31
	movb	$-47, (%rax)
	.loc 1 1287 16
	jmp	.L185
.L184:
	.loc 1 1289 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1289 31
	movb	$-15, (%rax)
	.loc 1 1290 16
	jmp	.L185
.L187:
	.loc 1 1292 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1292 31
	movb	$-7, (%rax)
	.loc 1 1293 16
	nop
.L185:
	.loc 1 1295 12 discriminator 12
	jmp	.L229
.L167:
	cmpq	$193505043, -144(%rbp)
	je	.L190
	cmpq	$193505043, -144(%rbp)
	ja	.L230
	cmpq	$193504548, -144(%rbp)
	je	.L192
	cmpq	$193504548, -144(%rbp)
	ja	.L230
	cmpq	$193504530, -144(%rbp)
	je	.L193
	cmpq	$193504530, -144(%rbp)
	ja	.L230
	cmpq	$193504464, -144(%rbp)
	je	.L194
	cmpq	$193504497, -144(%rbp)
	je	.L195
	.loc 1 1314 12
	jmp	.L230
.L194:
	.loc 1 1299 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1299 31
	movb	$-62, (%rax)
	.loc 1 1300 16
	jmp	.L191
.L195:
	.loc 1 1302 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1302 31
	movb	$-38, (%rax)
	.loc 1 1303 16
	jmp	.L191
.L193:
	.loc 1 1305 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1305 31
	movb	$-54, (%rax)
	.loc 1 1306 16
	jmp	.L191
.L190:
	.loc 1 1308 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1308 31
	movb	$-14, (%rax)
	.loc 1 1309 16
	jmp	.L191
.L192:
	.loc 1 1311 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1311 31
	movb	$-6, (%rax)
	.loc 1 1312 16
	nop
.L191:
	.loc 1 1314 12 discriminator 13
	jmp	.L230
.L165:
	cmpq	$193504563, -144(%rbp)
	je	.L196
	cmpq	$193504563, -144(%rbp)
	ja	.L231
	cmpq	$193504548, -144(%rbp)
	je	.L198
	cmpq	$193504548, -144(%rbp)
	ja	.L231
	cmpq	$193504530, -144(%rbp)
	je	.L199
	cmpq	$193504530, -144(%rbp)
	ja	.L231
	cmpq	$193504464, -144(%rbp)
	je	.L200
	cmpq	$193504497, -144(%rbp)
	je	.L201
	.loc 1 1333 12
	jmp	.L231
.L200:
	.loc 1 1318 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1318 31
	movb	$-58, (%rax)
	.loc 1 1319 16
	jmp	.L197
.L201:
	.loc 1 1321 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1321 31
	movb	$-34, (%rax)
	.loc 1 1322 16
	jmp	.L197
.L199:
	.loc 1 1324 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1324 31
	movb	$-50, (%rax)
	.loc 1 1325 16
	jmp	.L197
.L196:
	.loc 1 1327 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1327 31
	movb	$-42, (%rax)
	.loc 1 1328 16
	jmp	.L197
.L198:
	.loc 1 1330 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1330 31
	movb	$-2, (%rax)
	.loc 1 1331 16
	nop
.L197:
	.loc 1 1333 12 discriminator 14
	jmp	.L231
.L168:
	cmpq	$193505043, -144(%rbp)
	je	.L202
	cmpq	$193505043, -144(%rbp)
	ja	.L232
	cmpq	$193504563, -144(%rbp)
	je	.L204
	cmpq	$193504563, -144(%rbp)
	ja	.L232
	cmpq	$193504530, -144(%rbp)
	je	.L205
	cmpq	$193504530, -144(%rbp)
	ja	.L232
	cmpq	$193504464, -144(%rbp)
	je	.L206
	cmpq	$193504497, -144(%rbp)
	je	.L207
	.loc 1 1352 12
	jmp	.L232
.L206:
	.loc 1 1337 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1337 31
	movb	$-57, (%rax)
	.loc 1 1338 16
	jmp	.L203
.L207:
	.loc 1 1340 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1340 31
	movb	$-33, (%rax)
	.loc 1 1341 16
	jmp	.L203
.L205:
	.loc 1 1343 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1343 31
	movb	$-49, (%rax)
	.loc 1 1344 16
	jmp	.L203
.L204:
	.loc 1 1346 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1346 31
	movb	$-41, (%rax)
	.loc 1 1347 16
	jmp	.L203
.L202:
	.loc 1 1349 27
	movq	-184(%rbp), %rax
	addq	$2, %rax
	.loc 1 1349 31
	movb	$-9, (%rax)
	.loc 1 1350 16
	nop
.L203:
	.loc 1 1352 12 discriminator 15
	jmp	.L232
.L227:
	.loc 1 1257 12
	nop
	jmp	.L166
.L228:
	.loc 1 1276 12
	nop
	jmp	.L166
.L229:
	.loc 1 1295 12
	nop
	jmp	.L166
.L230:
	.loc 1 1314 12
	nop
	jmp	.L166
.L231:
	.loc 1 1333 12
	nop
	jmp	.L166
.L232:
	.loc 1 1352 12
	nop
.L166:
.LBB47:
	.loc 1 1355 19
	movl	$0, -260(%rbp)
	.loc 1 1355 10
	jmp	.L208
.L209:
	.loc 1 1356 71 discriminator 3
	movl	-260(%rbp), %eax
	movslq	%eax, %rdx
	movq	-184(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	.loc 1 1356 29 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdi
	.loc 1 1356 52 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1356 56 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1356 35 discriminator 3
	leaq	(%rdi,%rax), %rdx
	.loc 1 1356 71 discriminator 3
	movzbl	(%rsi), %eax
	.loc 1 1356 60 discriminator 3
	movb	%al, (%rdx)
	.loc 1 1355 49 discriminator 3
	addl	$1, -260(%rbp)
.L208:
	.loc 1 1355 28 discriminator 1
	movl	-260(%rbp), %eax
	cmpl	-240(%rbp), %eax
	jl	.L209
.LBE47:
	.loc 1 1358 10
	jmp	.L153
.L155:
	.loc 1 1360 17
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1360 30
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1360 33
	movl	64(%rax), %eax
	.loc 1 1360 13
	cmpl	$1, %eax
	je	.L233
	.loc 1 1361 12
	leaq	.LC119(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1362 19
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1362 32
	movl	-280(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1362 35
	movl	80(%rax), %eax
	.loc 1 1362 15
	cmpl	$1, %eax
	jne	.L233
.LBB48:
	.loc 1 1363 18
	movl	$4, -232(%rbp)
	.loc 1 1364 51
	movl	-232(%rbp), %eax
	addl	$3, %eax
	.loc 1 1364 18
	movl	%eax, -228(%rbp)
	.loc 1 1365 29
	movl	-228(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -128(%rbp)
	.loc 1 1366 18
	movl	$0, -224(%rbp)
	.loc 1 1367 23
	movq	-128(%rbp), %rax
	movb	$72, (%rax)
	.loc 1 1368 19
	movq	-128(%rbp), %rax
	addq	$1, %rax
	.loc 1 1368 23
	movb	$-57, (%rax)
	.loc 1 1378 82
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1378 99
	movq	(%rax), %rcx
	.loc 1 1378 112
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1378 14
	movq	56(%rax), %rcx
	.loc 1 1378 35
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1378 52
	movq	(%rax), %rsi
	.loc 1 1378 65
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	.loc 1 1378 14
	movq	8(%rax), %rax
	movq	%rcx, %rdx
	movq	%rax, %rsi
	leaq	.LC120(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB49:
	.loc 1 1379 23
	movl	$0, -256(%rbp)
	.loc 1 1379 14
	jmp	.L211
.L212:
	.loc 1 1380 44 discriminator 3
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1380 61 discriminator 3
	movq	(%rax), %rcx
	.loc 1 1380 74 discriminator 3
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1380 77 discriminator 3
	movq	64(%rax), %rax
	.loc 1 1380 88 discriminator 3
	movl	-256(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1380 16 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC121(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1379 91 discriminator 3
	addl	$1, -256(%rbp)
.L211:
	.loc 1 1379 38 discriminator 1
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1379 55 discriminator 1
	movq	(%rax), %rcx
	.loc 1 1379 68 discriminator 1
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1379 71 discriminator 1
	movl	72(%rax), %eax
	.loc 1 1379 33 discriminator 1
	cmpl	%eax, -256(%rbp)
	jl	.L212
.LBE49:
	.loc 1 1382 42
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1382 59
	movq	(%rax), %rcx
	.loc 1 1382 72
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1382 75
	movq	88(%rax), %rax
	.loc 1 1382 34
	movq	%rax, %rdi
	call	hash
	movq	%rax, -120(%rbp)
	cmpq	$193505043, -120(%rbp)
	je	.L213
	cmpq	$193505043, -120(%rbp)
	ja	.L214
	cmpq	$193504563, -120(%rbp)
	je	.L215
	cmpq	$193504563, -120(%rbp)
	ja	.L214
	cmpq	$193504548, -120(%rbp)
	je	.L216
	cmpq	$193504548, -120(%rbp)
	ja	.L214
	cmpq	$193504530, -120(%rbp)
	je	.L217
	cmpq	$193504530, -120(%rbp)
	ja	.L214
	cmpq	$193504464, -120(%rbp)
	je	.L218
	cmpq	$193504497, -120(%rbp)
	je	.L219
	jmp	.L214
.L218:
	.loc 1 1385 23
	movq	-128(%rbp), %rax
	addq	$2, %rax
	.loc 1 1385 27
	movb	$-64, (%rax)
	.loc 1 1386 16
	jmp	.L214
.L219:
	.loc 1 1388 23
	movq	-128(%rbp), %rax
	addq	$2, %rax
	.loc 1 1388 27
	movb	$-61, (%rax)
	.loc 1 1389 16
	jmp	.L214
.L217:
	.loc 1 1391 23
	movq	-128(%rbp), %rax
	addq	$2, %rax
	.loc 1 1391 27
	movb	$-63, (%rax)
	.loc 1 1392 16
	jmp	.L214
.L215:
	.loc 1 1394 23
	movq	-128(%rbp), %rax
	addq	$2, %rax
	.loc 1 1394 27
	movb	$-62, (%rax)
	.loc 1 1395 16
	jmp	.L214
.L213:
	.loc 1 1397 23
	movq	-128(%rbp), %rax
	addq	$2, %rax
	.loc 1 1397 27
	movb	$-58, (%rax)
	.loc 1 1398 16
	jmp	.L214
.L216:
	.loc 1 1400 23
	movq	-128(%rbp), %rax
	addq	$2, %rax
	.loc 1 1400 27
	movb	$-57, (%rax)
	.loc 1 1401 16
	nop
.L214:
	.loc 1 1403 32
	movl	-232(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	.loc 1 1403 20
	movq	%rax, -200(%rbp)
	.loc 1 1404 21
	leaq	-200(%rbp), %rax
	movq	%rax, -112(%rbp)
	.loc 1 1405 14
	movl	-232(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 1405 42
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1405 55
	movl	-280(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1405 38
	leaq	36(%rax), %rcx
	.loc 1 1405 14
	movq	-112(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 1406 18
	movl	$3, -220(%rbp)
	.loc 1 1407 31
	movl	-220(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -220(%rbp)
	movslq	%eax, %rdx
	.loc 1 1407 19
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1407 52
	movq	-112(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 1407 35
	movb	%al, (%rdx)
	.loc 1 1408 31
	movl	-220(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -220(%rbp)
	movslq	%eax, %rdx
	.loc 1 1408 19
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1408 35
	movq	-112(%rbp), %rax
	movzbl	1(%rax), %eax
	movb	%al, (%rdx)
	.loc 1 1409 31
	movl	-220(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -220(%rbp)
	movslq	%eax, %rdx
	.loc 1 1409 19
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1409 35
	movq	-112(%rbp), %rax
	movzbl	2(%rax), %eax
	movb	%al, (%rdx)
	.loc 1 1410 31
	movl	-220(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -220(%rbp)
	movslq	%eax, %rdx
	.loc 1 1410 19
	movq	-128(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1410 35
	movq	-112(%rbp), %rax
	movzbl	3(%rax), %eax
	movb	%al, (%rdx)
	.loc 1 1411 77
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1411 94
	movq	(%rax), %rcx
	.loc 1 1411 107
	movl	-280(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1411 14
	movq	88(%rax), %rdx
	.loc 1 1411 43
	movq	-312(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1411 56
	movl	-280(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1411 14
	movl	36(%rax), %eax
	movl	%eax, %esi
	leaq	.LC122(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB50:
	.loc 1 1412 23
	movl	$0, -252(%rbp)
	.loc 1 1412 14
	jmp	.L220
.L221:
	.loc 1 1413 36 discriminator 3
	movl	-252(%rbp), %eax
	movslq	%eax, %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 1413 16 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1412 49 discriminator 3
	addl	$1, -252(%rbp)
.L220:
	.loc 1 1412 33 discriminator 1
	movl	-252(%rbp), %eax
	cmpl	-228(%rbp), %eax
	jl	.L221
.LBE50:
.LBB51:
	.loc 1 1415 23
	movl	$0, -248(%rbp)
	.loc 1 1415 14
	jmp	.L222
.L223:
	.loc 1 1416 69 discriminator 3
	movl	-248(%rbp), %eax
	movslq	%eax, %rdx
	movq	-128(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	.loc 1 1416 31 discriminator 3
	movq	-304(%rbp), %rax
	movq	16(%rax), %rdi
	.loc 1 1416 54 discriminator 3
	movq	-304(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1416 58 discriminator 3
	leal	1(%rax), %ecx
	movq	-304(%rbp), %rdx
	movl	%ecx, (%rdx)
	cltq
	.loc 1 1416 37 discriminator 3
	leaq	(%rdi,%rax), %rdx
	.loc 1 1416 69 discriminator 3
	movzbl	(%rsi), %eax
	.loc 1 1416 62 discriminator 3
	movb	%al, (%rdx)
	.loc 1 1415 48 discriminator 3
	addl	$1, -248(%rbp)
.L222:
	.loc 1 1415 32 discriminator 1
	movl	-248(%rbp), %eax
	cmpl	-228(%rbp), %eax
	jl	.L223
.LBE51:
.LBE48:
	.loc 1 1421 7
	jmp	.L233
.L226:
	.loc 1 1209 10
	nop
	jmp	.L153
.L233:
	.loc 1 1421 7
	nop
.L153:
.LBE41:
	.loc 1 1114 66 discriminator 2
	addl	$1, -280(%rbp)
.L151:
	.loc 1 1114 27 discriminator 1
	movq	-312(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1114 44 discriminator 1
	movl	8(%rax), %eax
	.loc 1 1114 22 discriminator 1
	cmpl	%eax, -280(%rbp)
	jl	.L224
.LBE40:
	.loc 1 1424 1
	nop
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L225
	call	__stack_chk_fail@PLT
.L225:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	writecode, .-writecode
	.section	.rodata
.LC124:
	.string	"%s machine code\n"
.LC125:
	.string	"%x "
	.text
	.globl	dump_machine_code
	.type	dump_machine_code, @function
dump_machine_code:
.LFB28:
	.loc 1 1425 49
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 1426 3
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC124(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB52:
	.loc 1 1427 12
	movl	$0, -4(%rbp)
	.loc 1 1427 3
	jmp	.L235
.L237:
	.loc 1 1428 15
	movl	-4(%rbp), %eax
	andl	$7, %eax
	.loc 1 1428 8
	testl	%eax, %eax
	jne	.L236
	.loc 1 1428 23 discriminator 1
	movl	$10, %edi
	call	putchar@PLT
.L236:
	.loc 1 1429 23 discriminator 2
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 1429 5 discriminator 2
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1427 30 discriminator 2
	addl	$1, -4(%rbp)
.L235:
	.loc 1 1427 22 discriminator 1
	cmpl	$99, -4(%rbp)
	jle	.L237
.LBE52:
	.loc 1 1432 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	dump_machine_code, .-dump_machine_code
	.section	.rodata
	.align 8
.LC126:
	.string	"Calling compile of user function"
.LC127:
	.string	"Patching callsites"
	.align 8
.LC128:
	.string	"Function %s compiled to %p there are %d callsites\n"
.LC129:
	.string	"%d\n"
	.align 8
.LC130:
	.string	"Need to patch %p %d with %p %p\n"
	.align 8
.LC131:
	.string	"SUCCESS Patching callsite to %d\n"
.LC132:
	.string	"Lazy compilation %s"
.LC133:
	.string	"Main method again"
.LC134:
	.string	"%s.bin"
.LC135:
	.string	"w+b"
	.text
	.globl	compile_stub
	.type	compile_stub, @function
compile_stub:
.LFB29:
	.loc 1 1433 35
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movl	%edi, -276(%rbp)
	.loc 1 1433 35
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1434 47
	movq	CODEGEN_CONTEXT(%rip), %rax
	movq	8(%rax), %rax
	.loc 1 1434 63
	movl	-276(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1434 21
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	.loc 1 1435 3
	leaq	.LC126(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1436 37
	call	getpagesize@PLT
	.loc 1 1436 3
	movslq	%eax, %rcx
	.loc 1 1436 20
	movq	-256(%rbp), %rax
	movq	72(%rax), %rax
	.loc 1 1436 29
	movq	16(%rax), %rax
	.loc 1 1436 3
	movl	$7, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mprotect@PLT
	.loc 1 1437 3
	movq	-256(%rbp), %rax
	movq	56(%rax), %rdx
	movq	-256(%rbp), %rax
	movq	72(%rax), %rcx
	movq	CODEGEN_CONTEXT(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	writecode
	.loc 1 1438 37
	call	getpagesize@PLT
	.loc 1 1438 3
	movslq	%eax, %rcx
	.loc 1 1438 20
	movq	-256(%rbp), %rax
	movq	72(%rax), %rax
	.loc 1 1438 29
	movq	16(%rax), %rax
	.loc 1 1438 3
	movl	$5, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mprotect@PLT
	.loc 1 1439 3
	leaq	.LC127(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1440 20
	movl	$8, %edi
	call	malloc@PLT
	.loc 1 1440 10
	movq	%rax, -264(%rbp)
	.loc 1 1441 21
	movq	-256(%rbp), %rax
	movq	64(%rax), %rax
	.loc 1 1441 11
	movq	%rax, -264(%rbp)
	.loc 1 1442 3
	movq	-256(%rbp), %rax
	movl	96(%rax), %ecx
	movq	-256(%rbp), %rax
	movq	64(%rax), %rdx
	movq	-256(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC128(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB53:
	.loc 1 1443 12
	movl	$0, -268(%rbp)
	.loc 1 1443 3
	jmp	.L239
.L240:
.LBB54:
	.loc 1 1444 5 discriminator 3
	movl	-268(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC129(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1445 41 discriminator 3
	movq	-256(%rbp), %rax
	movq	88(%rax), %rax
	.loc 1 1445 52 discriminator 3
	movl	-268(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1445 22 discriminator 3
	movq	(%rax), %rax
	movq	%rax, -240(%rbp)
	.loc 1 1446 28 discriminator 3
	movq	-240(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1446 46 discriminator 3
	movq	16(%rax), %rdx
	.loc 1 1446 63 discriminator 3
	movq	-240(%rbp), %rax
	movl	16(%rax), %eax
	cltq
	.loc 1 1446 12 discriminator 3
	addq	%rdx, %rax
	movq	%rax, -232(%rbp)
	.loc 1 1447 48 discriminator 3
	call	getpagesize@PLT
	.loc 1 1447 5 discriminator 3
	movslq	%eax, %rcx
	.loc 1 1447 22 discriminator 3
	movq	-240(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1447 40 discriminator 3
	movq	16(%rax), %rax
	.loc 1 1447 5 discriminator 3
	movl	$7, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mprotect@PLT
	.loc 1 1448 5 discriminator 3
	movq	-256(%rbp), %rax
	movq	64(%rax), %rcx
	movq	-240(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 1448 56 discriminator 3
	movq	-240(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1448 5 discriminator 3
	movq	16(%rax), %rax
	movq	-232(%rbp), %rsi
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC130(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1449 5 discriminator 3
	movq	-264(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1450 48 discriminator 3
	call	getpagesize@PLT
	.loc 1 1450 5 discriminator 3
	movslq	%eax, %rcx
	.loc 1 1450 22 discriminator 3
	movq	-240(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1450 40 discriminator 3
	movq	16(%rax), %rax
	.loc 1 1450 5 discriminator 3
	movl	$5, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mprotect@PLT
	.loc 1 1451 5 discriminator 3
	movq	-240(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %esi
	leaq	.LC131(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE54:
	.loc 1 1443 52 discriminator 3
	addl	$1, -268(%rbp)
.L239:
	.loc 1 1443 32 discriminator 1
	movq	-256(%rbp), %rax
	movl	96(%rax), %eax
	.loc 1 1443 22 discriminator 1
	cmpl	%eax, -268(%rbp)
	jl	.L240
.LBE53:
	.loc 1 1454 3
	movq	-256(%rbp), %rax
	movq	(%rax), %rdx
	leaq	-224(%rbp), %rax
	leaq	.LC132(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1455 3
	movq	-256(%rbp), %rax
	movq	64(%rax), %rdx
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	dump_machine_code
	.loc 1 1456 57
	movq	CODEGEN_CONTEXT(%rip), %rax
	movq	24(%rax), %rax
	.loc 1 1456 3
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC133(%rip), %rax
	movq	%rax, %rdi
	call	dump_machine_code
	.loc 1 1459 3
	movq	-256(%rbp), %rax
	movq	(%rax), %rdx
	leaq	-112(%rbp), %rax
	leaq	.LC134(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1460 15
	leaq	-112(%rbp), %rax
	leaq	.LC135(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -248(%rbp)
	.loc 1 1461 18
	movq	-256(%rbp), %rax
	movq	64(%rax), %rax
	.loc 1 1461 3
	movq	-248(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$150, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 1462 3
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	.loc 1 1463 3
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 1464 1
	nop
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L241
	call	__stack_chk_fail@PLT
.L241:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	compile_stub, .-compile_stub
	.section	.rodata
.LC136:
	.string	"printf"
	.align 8
.LC137:
	.string	"generating code region for function %s %d\n"
.LC138:
	.string	"couldn't allocate\n"
.LC139:
	.string	"GENERATING 55"
.LC140:
	.string	"Main"
.LC141:
	.string	"main.bin"
	.text
	.globl	codegen
	.type	codegen, @function
codegen:
.LFB30:
	.loc 1 1466 31
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	.loc 1 1467 45
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -96(%rbp)
	.loc 1 1468 25
	movq	-152(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 1469 37
	movq	-152(%rbp), %rax
	movq	32(%rax), %rdx
	.loc 1 1469 31
	movq	-96(%rbp), %rax
	movq	%rdx, 32(%rax)
	.loc 1 1471 19
	movq	-96(%rbp), %rax
	movq	%rax, CODEGEN_CONTEXT(%rip)
	.loc 1 1472 41
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -88(%rbp)
	.loc 1 1473 7
	movl	$0, -124(%rbp)
	.loc 1 1474 39
	movl	$104, %edi
	call	malloc@PLT
	movq	%rax, -80(%rbp)
	.loc 1 1475 25
	movq	-80(%rbp), %rax
	leaq	.LC136(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1476 27
	movq	-80(%rbp), %rax
	movl	$1, 100(%rax)
	.loc 1 1477 42
	movl	-124(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -124(%rbp)
	cltq
	.loc 1 1477 19
	leaq	0(,%rax,8), %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1477 46
	movq	-80(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1478 43
	movq	-96(%rbp), %rax
	movl	-124(%rbp), %edx
	movl	%edx, 20(%rax)
	.loc 1 1479 27
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 1479 25
	movq	-80(%rbp), %rax
	movq	%rdx, 64(%rax)
	.loc 1 1480 25
	movq	-80(%rbp), %rax
	movq	printf@GOTPCREL(%rip), %rdx
	movq	%rdx, 64(%rax)
	.loc 1 1481 29
	movq	-80(%rbp), %rax
	movl	$1, 80(%rax)
	.loc 1 1482 37
	movq	-96(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1483 41
	movq	-152(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 1483 35
	movq	-96(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 1484 42
	movq	-152(%rbp), %rax
	movl	16(%rax), %edx
	.loc 1 1484 36
	movq	-96(%rbp), %rax
	movl	%edx, 16(%rax)
.LBB55:
	.loc 1 1487 12
	movl	$0, -132(%rbp)
	.loc 1 1487 3
	jmp	.L243
.L248:
.LBB56:
	.loc 1 1488 5
	call	getpagesize@PLT
	movl	%eax, %edx
	.loc 1 1488 63
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1488 74
	movl	-132(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1488 5
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC137(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1489 49
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	.loc 1 1491 13
	call	getpagesize@PLT
	.loc 1 1490 26
	cltq
	movl	$0, %r9d
	movl	$-1, %r8d
	movl	$33, %ecx
	movl	$3, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	mmap@PLT
	movq	%rax, -40(%rbp)
	.loc 1 1496 9
	cmpq	$0, -40(%rbp)
	jne	.L244
	.loc 1 1497 31
	call	__errno_location@PLT
	.loc 1 1497 8
	movl	(%rax), %eax
	movl	$-12, -120(%rbp)
	movl	%eax, -116(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -32(%rbp)
	movl	$1497, -112(%rbp)
	leaq	.LC138(%rip), %rax
	movq	%rax, -24(%rbp)
.LBB57:
.LBB58:
	.loc 2 71 5
	movq	-24(%rbp), %rdi
	movl	-112(%rbp), %ecx
	movq	-32(%rbp), %rdx
	movl	-116(%rbp), %esi
	movl	-120(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	movl	$0, %eax
	call	error_at_line@PLT
	.loc 2 73 1
	nop
.L244:
.LBE58:
.LBE57:
	.loc 1 1499 29
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 1500 10
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1500 21
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1500 31
	movq	-40(%rbp), %rdx
	movq	%rdx, 64(%rax)
	.loc 1 1501 10
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1501 21
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1501 34
	movq	-48(%rbp), %rdx
	movq	%rdx, 72(%rax)
	.loc 1 1502 35
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1502 39
	leal	1(%rax), %ecx
	movq	-48(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	.loc 1 1502 18
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1502 43
	movb	$85, (%rax)
	.loc 1 1503 55
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1503 66
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1503 6
	movq	56(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-96(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	writecode
	.loc 1 1504 35
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1504 39
	leal	1(%rax), %ecx
	movq	-48(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	.loc 1 1504 18
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1504 43
	movb	$93, (%rax)
	.loc 1 1505 35
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1505 39
	leal	1(%rax), %ecx
	movq	-48(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	.loc 1 1505 18
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1505 43
	movb	$-61, (%rax)
	.loc 1 1506 29
	call	getpagesize@PLT
	.loc 1 1506 6
	movslq	%eax, %rcx
	movq	-40(%rbp), %rax
	movl	$5, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mprotect@PLT
.LBB59:
	.loc 1 1507 15
	movl	$0, -128(%rbp)
	.loc 1 1507 6
	jmp	.L245
.L247:
	.loc 1 1508 18
	movl	-128(%rbp), %eax
	andl	$7, %eax
	.loc 1 1508 11
	testl	%eax, %eax
	jne	.L246
	.loc 1 1508 26 discriminator 1
	movl	$10, %edi
	call	putchar@PLT
.L246:
	.loc 1 1509 38 discriminator 2
	movq	-48(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 1509 44 discriminator 2
	movl	-128(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	.loc 1 1509 8 discriminator 2
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC125(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1507 33 discriminator 2
	addl	$1, -128(%rbp)
.L245:
	.loc 1 1507 25 discriminator 1
	cmpl	$99, -128(%rbp)
	jle	.L247
.LBE59:
.LBE56:
	.loc 1 1487 48 discriminator 2
	addl	$1, -132(%rbp)
.L243:
	.loc 1 1487 28 discriminator 1
	movq	-152(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 1487 22 discriminator 1
	cmpl	%eax, -132(%rbp)
	jl	.L248
.LBE55:
	.loc 1 1513 8
	call	getpagesize@PLT
	.loc 1 1512 30
	cltq
	movl	$0, %r9d
	movl	$-1, %r8d
	movl	$33, %ecx
	movl	$3, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	mmap@PLT
	movq	%rax, -72(%rbp)
	.loc 1 1519 6
	cmpq	$0, -72(%rbp)
	jne	.L249
	.loc 1 1520 28
	call	__errno_location@PLT
	.loc 1 1520 5
	movl	(%rax), %eax
	movl	$-12, -108(%rbp)
	movl	%eax, -104(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$1520, -100(%rbp)
	leaq	.LC138(%rip), %rax
	movq	%rax, -8(%rbp)
.LBB60:
.LBB61:
	.loc 2 71 5
	movq	-8(%rbp), %rdi
	movl	-100(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movl	-104(%rbp), %esi
	movl	-108(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	movl	$0, %eax
	call	error_at_line@PLT
	.loc 2 73 1
	nop
.L249:
.LBE61:
.LBE60:
	.loc 1 1522 52
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	.loc 1 1523 42
	movq	-96(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 24(%rax)
	.loc 1 1524 31
	movq	-64(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 1526 3
	leaq	.LC139(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1527 42
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1527 46
	leal	1(%rax), %ecx
	movq	-64(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	.loc 1 1527 20
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1527 50
	movb	$85, (%rax)
	.loc 1 1528 3
	movq	-152(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-64(%rbp), %rcx
	movq	-96(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	writecode
	.loc 1 1530 42
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1530 46
	leal	1(%rax), %ecx
	movq	-64(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	.loc 1 1530 20
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1530 50
	movb	$93, (%rax)
	.loc 1 1531 42
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 1531 46
	leal	1(%rax), %ecx
	movq	-64(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	.loc 1 1531 20
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1531 50
	movb	$-61, (%rax)
	.loc 1 1532 31
	call	getpagesize@PLT
	.loc 1 1532 3
	movslq	%eax, %rcx
	movq	-72(%rbp), %rax
	movl	$5, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mprotect@PLT
	.loc 1 1533 3
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC140(%rip), %rax
	movq	%rax, %rdi
	call	dump_machine_code
	.loc 1 1534 15
	leaq	.LC135(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC141(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -56(%rbp)
	.loc 1 1535 31
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 1535 3
	movq	-56(%rbp), %rdx
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$150, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 1 1536 3
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	.loc 1 1537 3
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 1538 3
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 1539 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	codegen, .-codegen
	.section	.rodata
.LC142:
	.string	"t%d"
	.align 8
.LC143:
	.string	"Method call Assigning %d to variable %s\n"
.LC144:
	.string	"%d-%s"
.LC145:
	.string	"%s <- %s"
	.align 8
.LC146:
	.string	"Created a identifier reference"
	.align 8
.LC147:
	.string	"Member lookup Assigning %d to variable %s\n"
.LC148:
	.string	"%s <- %s %s"
	.align 8
.LC149:
	.string	"Add operation Assigning %d to variable %s\n"
.LC150:
	.string	"%s <- %s %s %s"
	.align 8
.LC151:
	.string	"Return operation Assigning %d to variable %s\n"
	.text
	.globl	assignregisters
	.type	assignregisters, @function
assignregisters:
.LFB31:
	.loc 1 1543 65
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$784, %rsp
	movq	%rdi, -776(%rbp)
	.loc 1 1543 65
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1544 37
	movl	$112, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -640(%rbp)
.LBB62:
	.loc 1 1545 12
	movl	$0, -764(%rbp)
	.loc 1 1545 3
	jmp	.L251
.L252:
	.loc 1 1546 16 discriminator 3
	movl	-764(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1546 36 discriminator 3
	movq	$0, 88(%rax)
	.loc 1 1545 30 discriminator 3
	addl	$1, -764(%rbp)
.L251:
	.loc 1 1545 22 discriminator 1
	cmpl	$99, -764(%rbp)
	jle	.L252
.LBE62:
	.loc 1 1548 7
	movl	$0, -760(%rbp)
	.loc 1 1549 7
	movl	$0, -756(%rbp)
.LBB63:
	.loc 1 1551 12
	movl	$0, -752(%rbp)
	.loc 1 1551 3
	jmp	.L253
.L271:
	.loc 1 1552 16
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1552 29
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1552 32
	movl	4(%rax), %eax
	.loc 1 1552 5
	subl	$3, %eax
	cmpl	$6, %eax
	ja	.L254
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L256(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L256(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L256:
	.long	.L260-.L256
	.long	.L259-.L256
	.long	.L258-.L256
	.long	.L257-.L256
	.long	.L254-.L256
	.long	.L254-.L256
	.long	.L255-.L256
	.text
.L260:
.LBB64:
	.loc 1 1554 22
	movl	$50, %edi
	call	malloc@PLT
	movq	%rax, -384(%rbp)
	.loc 1 1555 9
	movl	-756(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -756(%rbp)
	movq	-384(%rbp), %rcx
	movl	%eax, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1556 64
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1556 77
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1556 9
	movl	(%rax), %eax
	movq	-384(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC143(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1557 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1557 46
	movl	$1, 28(%rax)
	.loc 1 1558 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1558 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1558 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1558 70
	movq	(%rcx), %rax
	.loc 1 1558 52
	movq	%rax, (%rdx)
	.loc 1 1559 59
	movq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	.loc 1 1559 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1559 57
	movl	%ecx, %edx
	movl	%edx, 24(%rax)
	.loc 1 1560 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1560 50
	movq	-384(%rbp), %rax
	movq	%rax, 8(%rdx)
	.loc 1 1561 39
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -376(%rbp)
	.loc 1 1562 51
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1562 64
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1562 9
	movl	(%rax), %edx
	movq	-384(%rbp), %rcx
	movq	-376(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1563 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1563 54
	movq	-376(%rbp), %rax
	movq	%rax, 16(%rdx)
	.loc 1 1565 53
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1565 66
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1565 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1565 69
	movq	40(%rcx), %rax
	.loc 1 1565 48
	movq	%rax, 32(%rdx)
	.loc 1 1566 51
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1566 64
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1566 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1566 67
	movq	48(%rcx), %rax
	.loc 1 1566 46
	movq	%rax, 40(%rdx)
	.loc 1 1567 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1567 25
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1567 39
	movq	-384(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 1 1568 59
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1568 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1568 25
	movl	-752(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1568 79
	movl	24(%rdx), %edx
	.loc 1 1568 46
	movl	%edx, 56(%rax)
	.loc 1 1570 9
	leaq	-320(%rbp), %rax
	movl	$300, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1571 13
	movl	$0, -748(%rbp)
	.loc 1 1572 13
	movl	$0, -744(%rbp)
	.loc 1 1573 13
	movl	$0, -740(%rbp)
	.loc 1 1574 13
	movl	$0, -736(%rbp)
	.loc 1 1575 30
	movl	$1, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -368(%rbp)
	.loc 1 1576 44
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -360(%rbp)
	.loc 1 1577 54
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -352(%rbp)
	.loc 1 1578 13
	movl	$0, -732(%rbp)
	.loc 1 1579 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1579 52
	movq	-368(%rbp), %rax
	movq	%rax, 64(%rdx)
.LBB65:
	.loc 1 1581 18
	movl	$0, -728(%rbp)
	.loc 1 1581 9
	jmp	.L261
.L268:
.LBB66:
	.loc 1 1582 22
	movl	$0, -724(%rbp)
	.loc 1 1582 13
	jmp	.L262
.L267:
.LBB67:
	.loc 1 1583 44
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -336(%rbp)
	.loc 1 1584 106
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1584 119
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1584 122
	movq	8(%rax), %rax
	.loc 1 1584 128
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1584 131
	movq	(%rax), %rax
	.loc 1 1584 144
	movl	-724(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1584 15
	movq	48(%rax), %rcx
	.loc 1 1584 56
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1584 69
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1584 72
	movq	8(%rax), %rax
	.loc 1 1584 78
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1584 81
	movq	(%rax), %rax
	.loc 1 1584 94
	movl	-724(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1584 15
	movl	(%rax), %edx
	movq	-336(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1585 50
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1585 63
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1585 66
	movq	8(%rax), %rax
	.loc 1 1585 72
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1585 75
	movq	(%rax), %rax
	.loc 1 1585 88
	movl	-724(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 1585 41
	movl	-740(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -740(%rbp)
	cltq
	.loc 1 1585 25
	leaq	0(,%rax,8), %rcx
	movq	-368(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1585 91
	movq	48(%rdx), %rax
	.loc 1 1585 45
	movq	%rax, (%rcx)
	.loc 1 1586 73
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1586 86
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1586 89
	movq	8(%rax), %rax
	.loc 1 1586 95
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1586 98
	movq	(%rax), %rax
	.loc 1 1586 111
	movl	-724(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1586 64
	movl	-732(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -732(%rbp)
	cltq
	.loc 1 1586 36
	leaq	0(,%rax,8), %rdx
	movq	-352(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1586 111
	movq	(%rcx), %rax
	.loc 1 1586 68
	movq	%rax, (%rdx)
	.loc 1 1587 50
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -328(%rbp)
	.loc 1 1588 45
	movq	-336(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1588 43
	movl	%eax, %edx
	movq	-328(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1589 72
	movl	-736(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -736(%rbp)
	cltq
	.loc 1 1589 40
	leaq	0(,%rax,8), %rdx
	movq	-360(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1589 76
	movq	-328(%rbp), %rax
	movq	%rax, (%rdx)
.LBB68:
	.loc 1 1590 24
	movl	$0, -720(%rbp)
	.loc 1 1590 15
	jmp	.L263
.L264:
	.loc 1 1591 51 discriminator 3
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1591 64 discriminator 3
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1591 67 discriminator 3
	movq	8(%rax), %rax
	.loc 1 1591 73 discriminator 3
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1591 76 discriminator 3
	movq	(%rax), %rax
	.loc 1 1591 89 discriminator 3
	movl	-724(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1591 92 discriminator 3
	movq	48(%rax), %rdx
	.loc 1 1591 102 discriminator 3
	movl	-720(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rcx
	.loc 1 1591 42 discriminator 3
	movl	-748(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -748(%rbp)
	.loc 1 1591 102 discriminator 3
	movzbl	(%rcx), %edx
	.loc 1 1591 46 discriminator 3
	cltq
	movb	%dl, -320(%rbp,%rax)
	.loc 1 1590 101 discriminator 3
	addl	$1, -720(%rbp)
.L263:
	.loc 1 1590 39 discriminator 1
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1590 52 discriminator 1
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1590 55 discriminator 1
	movq	8(%rax), %rax
	.loc 1 1590 61 discriminator 1
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1590 64 discriminator 1
	movq	(%rax), %rax
	.loc 1 1590 77 discriminator 1
	movl	-724(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1590 80 discriminator 1
	movl	56(%rax), %eax
	.loc 1 1590 34 discriminator 1
	cmpl	%eax, -720(%rbp)
	jl	.L264
.LBE68:
	.loc 1 1593 18
	cmpl	$1, -744(%rbp)
	jne	.L265
	.loc 1 1594 42
	movl	-748(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -748(%rbp)
	.loc 1 1594 46
	cltq
	movb	$32, -320(%rbp,%rax)
	.loc 1 1595 42
	movl	-748(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -748(%rbp)
	.loc 1 1595 46
	cltq
	movb	$44, -320(%rbp,%rax)
	.loc 1 1596 42
	movl	-748(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -748(%rbp)
	.loc 1 1596 46
	cltq
	movb	$32, -320(%rbp,%rax)
.L265:
	.loc 1 1598 18
	cmpl	$0, -744(%rbp)
	jne	.L266
	.loc 1 1599 42
	movl	-748(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -748(%rbp)
	.loc 1 1599 46
	cltq
	movb	$40, -320(%rbp,%rax)
	.loc 1 1600 23
	movl	$1, -744(%rbp)
.L266:
.LBE67:
	.loc 1 1582 83 discriminator 2
	addl	$1, -724(%rbp)
.L262:
	.loc 1 1582 36 discriminator 1
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1582 49 discriminator 1
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1582 52 discriminator 1
	movq	8(%rax), %rax
	.loc 1 1582 58 discriminator 1
	movl	-728(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1582 61 discriminator 1
	movl	16(%rax), %eax
	.loc 1 1582 31 discriminator 1
	cmpl	%eax, -724(%rbp)
	jl	.L267
.LBE66:
	.loc 1 1581 76 discriminator 2
	addl	$1, -728(%rbp)
.L261:
	.loc 1 1581 33 discriminator 1
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1581 46 discriminator 1
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1581 49 discriminator 1
	movq	16(%rax), %rax
	.loc 1 1581 61 discriminator 1
	movl	(%rax), %eax
	.loc 1 1581 28 discriminator 1
	cmpl	%eax, -728(%rbp)
	jl	.L268
.LBE65:
	.loc 1 1604 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1604 58
	movl	-740(%rbp), %eax
	movl	%eax, 72(%rdx)
	.loc 1 1605 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1605 67
	movq	-360(%rbp), %rax
	movq	%rax, 80(%rdx)
	.loc 1 1606 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1606 63
	movq	-352(%rbp), %rax
	movq	%rax, 96(%rdx)
	.loc 1 1607 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1607 70
	movl	-732(%rbp), %eax
	movl	%eax, 104(%rdx)
	.loc 1 1608 34
	movl	-748(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -748(%rbp)
	.loc 1 1608 38
	cltq
	movb	$41, -320(%rbp,%rax)
	.loc 1 1611 23
	movl	$400, %edi
	call	malloc@PLT
	movq	%rax, -344(%rbp)
	.loc 1 1612 9
	movl	-756(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -756(%rbp)
	movq	-384(%rbp), %rcx
	movl	%eax, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1613 9
	leaq	-320(%rbp), %rcx
	movq	-384(%rbp), %rdx
	movq	-344(%rbp), %rax
	leaq	.LC145(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1614 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1614 46
	movq	-344(%rbp), %rax
	movq	%rax, 56(%rdx)
	.loc 1 1616 27
	addl	$1, -760(%rbp)
	.loc 1 1617 9
	jmp	.L254
.L258:
	.loc 1 1619 16
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1619 29
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1619 32
	movl	60(%rax), %eax
	.loc 1 1619 12
	testl	%eax, %eax
	jne	.L276
.LBB69:
	.loc 1 1620 11
	leaq	.LC146(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1621 14
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1621 27
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1621 41
	movl	$1, 60(%rax)
	.loc 1 1622 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1622 48
	movl	$2, 28(%rax)
	.loc 1 1623 59
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1623 72
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1623 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1623 72
	movq	(%rcx), %rax
	.loc 1 1623 54
	movq	%rax, (%rdx)
	.loc 1 1624 55
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1624 68
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1624 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1624 71
	movq	40(%rcx), %rax
	.loc 1 1624 50
	movq	%rax, 32(%rdx)
	.loc 1 1625 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1625 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1625 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1625 73
	movq	24(%rcx), %rax
	.loc 1 1625 52
	movq	%rax, 8(%rdx)
	.loc 1 1626 45
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -496(%rbp)
	.loc 1 1627 82
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1627 95
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1627 11
	movq	24(%rax), %rcx
	.loc 1 1627 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1627 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1627 11
	movl	(%rax), %edx
	movq	-496(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1628 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1628 56
	movq	-496(%rbp), %rax
	movq	%rax, 16(%rdx)
	.loc 1 1629 79
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1629 99
	movq	8(%rax), %rax
	.loc 1 1629 61
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	.loc 1 1629 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1629 59
	movl	%ecx, %edx
	movl	%edx, 24(%rax)
	.loc 1 1630 61
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1630 14
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1630 27
	movl	-752(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1630 81
	movl	24(%rdx), %edx
	.loc 1 1630 48
	movl	%edx, 56(%rax)
	.loc 1 1631 46
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1631 59
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 1631 14
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1631 27
	movl	-752(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1631 62
	movq	24(%rdx), %rdx
	.loc 1 1631 41
	movq	%rdx, 48(%rax)
	.loc 1 1632 26
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -488(%rbp)
	.loc 1 1633 32
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -480(%rbp)
	.loc 1 1634 46
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -472(%rbp)
	.loc 1 1635 67
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -464(%rbp)
	.loc 1 1636 15
	movl	$0, -688(%rbp)
	.loc 1 1637 15
	movl	$0, -684(%rbp)
	.loc 1 1638 15
	movl	$0, -680(%rbp)
	.loc 1 1639 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1639 54
	movq	-480(%rbp), %rax
	movq	%rax, 64(%rdx)
	.loc 1 1640 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1640 69
	movq	-472(%rbp), %rax
	movq	%rax, 80(%rdx)
	.loc 1 1641 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1641 65
	movq	-464(%rbp), %rax
	movq	%rax, 96(%rdx)
	.loc 1 1642 44
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -456(%rbp)
	.loc 1 1643 81
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1643 94
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1643 11
	movq	48(%rax), %rcx
	.loc 1 1643 56
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1643 69
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1643 11
	movl	(%rax), %edx
	movq	-456(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1644 50
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -448(%rbp)
	.loc 1 1645 45
	movq	-456(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1645 43
	movl	%eax, %edx
	movq	-448(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1646 72
	movl	-684(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -684(%rbp)
	cltq
	.loc 1 1646 36
	leaq	0(,%rax,8), %rdx
	movq	-472(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1646 76
	movq	-448(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1647 90
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1647 103
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1647 81
	movl	-680(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -680(%rbp)
	cltq
	.loc 1 1647 43
	leaq	0(,%rax,8), %rdx
	movq	-464(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1647 103
	movq	(%rcx), %rax
	.loc 1 1647 85
	movq	%rax, (%rdx)
	.loc 1 1648 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1648 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	.loc 1 1648 48
	movl	-688(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -688(%rbp)
	cltq
	.loc 1 1648 21
	leaq	0(,%rax,8), %rcx
	movq	-480(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1648 73
	movq	48(%rdx), %rax
	.loc 1 1648 52
	movq	%rax, (%rcx)
	.loc 1 1649 11
	movq	-488(%rbp), %rax
	movl	$100, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1650 91
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1650 11
	movq	8(%rax), %rcx
	.loc 1 1650 49
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1650 11
	movq	8(%rax), %rdx
	movq	-488(%rbp), %rax
	leaq	.LC145(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1651 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1651 60
	movl	-688(%rbp), %eax
	movl	%eax, 72(%rdx)
	.loc 1 1652 22
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1652 48
	movq	-488(%rbp), %rax
	movq	%rax, 56(%rdx)
	.loc 1 1653 29
	addl	$1, -760(%rbp)
.LBE69:
	.loc 1 1655 9
	jmp	.L276
.L259:
	.loc 1 1657 23
	movl	$50, %edi
	call	malloc@PLT
	movq	%rax, -664(%rbp)
	.loc 1 1658 9
	movl	-756(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -756(%rbp)
	movq	-664(%rbp), %rcx
	movl	%eax, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1659 66
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1659 79
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1659 9
	movl	(%rax), %eax
	movq	-664(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC147(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1660 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1660 46
	movl	$0, 28(%rax)
	.loc 1 1661 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1661 50
	movq	-664(%rbp), %rax
	movq	%rax, 8(%rdx)
	.loc 1 1662 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1662 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1662 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1662 70
	movq	(%rcx), %rax
	.loc 1 1662 52
	movq	%rax, (%rdx)
	.loc 1 1663 59
	movq	-664(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	.loc 1 1663 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1663 57
	movl	%ecx, %edx
	movl	%edx, 24(%rax)
	.loc 1 1664 39
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -440(%rbp)
	.loc 1 1665 51
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1665 64
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1665 9
	movl	(%rax), %edx
	movq	-664(%rbp), %rcx
	movq	-440(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1666 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1666 54
	movq	-440(%rbp), %rax
	movq	%rax, 16(%rdx)
	.loc 1 1667 53
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1667 66
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1667 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1667 69
	movq	40(%rcx), %rax
	.loc 1 1667 48
	movq	%rax, 32(%rdx)
	.loc 1 1668 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1668 25
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1668 39
	movq	-664(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 1 1669 59
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1669 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1669 25
	movl	-752(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1669 79
	movl	24(%rdx), %edx
	.loc 1 1669 46
	movl	%edx, 56(%rax)
	.loc 1 1670 24
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -432(%rbp)
	.loc 1 1671 9
	movl	-756(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -756(%rbp)
	movq	-664(%rbp), %rcx
	movl	%eax, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1672 9
	movq	-432(%rbp), %rax
	movl	$100, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1673 13
	movl	$0, -676(%rbp)
	.loc 1 1674 37
	movl	$1, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -424(%rbp)
	.loc 1 1675 61
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -416(%rbp)
	.loc 1 1676 51
	movl	$4, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -408(%rbp)
	.loc 1 1677 13
	movl	$0, -672(%rbp)
	.loc 1 1678 13
	movl	$0, -668(%rbp)
	.loc 1 1679 38
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -400(%rbp)
	.loc 1 1680 100
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1680 113
	movq	(%rax), %rax
	.loc 1 1680 116
	movq	8(%rax), %rax
	.loc 1 1680 122
	movq	(%rax), %rax
	.loc 1 1680 125
	movq	(%rax), %rax
	.loc 1 1680 138
	movq	(%rax), %rax
	.loc 1 1680 9
	movq	48(%rax), %rcx
	.loc 1 1680 50
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1680 63
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1680 66
	movq	8(%rax), %rax
	.loc 1 1680 72
	movq	(%rax), %rax
	.loc 1 1680 75
	movq	(%rax), %rax
	.loc 1 1680 88
	movq	(%rax), %rax
	.loc 1 1680 9
	movl	(%rax), %edx
	movq	-400(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1681 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1681 52
	movq	-424(%rbp), %rax
	movq	%rax, 64(%rdx)
	.loc 1 1682 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1682 63
	movq	-416(%rbp), %rax
	movq	%rax, 96(%rdx)
	.loc 1 1683 83
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1683 96
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1683 99
	movq	8(%rax), %rax
	.loc 1 1683 105
	movq	(%rax), %rax
	.loc 1 1683 108
	movq	(%rax), %rax
	.loc 1 1683 121
	movq	(%rax), %rcx
	.loc 1 1683 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1683 40
	movq	64(%rax), %rsi
	.loc 1 1683 74
	movl	-676(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -676(%rbp)
	cltq
	.loc 1 1683 51
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 1683 124
	movq	48(%rcx), %rax
	.loc 1 1683 78
	movq	%rax, (%rdx)
	.loc 1 1684 105
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1684 118
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1684 121
	movq	8(%rax), %rax
	.loc 1 1684 127
	movq	(%rax), %rax
	.loc 1 1684 130
	movq	(%rax), %rcx
	.loc 1 1684 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1684 40
	movq	96(%rax), %rsi
	.loc 1 1684 96
	movl	-668(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -668(%rbp)
	cltq
	.loc 1 1684 62
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 1684 143
	movq	(%rcx), %rax
	.loc 1 1684 100
	movq	%rax, (%rdx)
	.loc 1 1685 105
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1685 118
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1685 121
	movq	8(%rax), %rax
	.loc 1 1685 127
	movq	(%rax), %rax
	.loc 1 1685 130
	movq	(%rax), %rcx
	.loc 1 1685 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1685 40
	movq	96(%rax), %rsi
	.loc 1 1685 96
	movl	-668(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -668(%rbp)
	cltq
	.loc 1 1685 62
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdx
	.loc 1 1685 100
	movq	8(%rcx), %rax
	movq	%rax, (%rdx)
	.loc 1 1686 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1686 70
	movl	-668(%rbp), %eax
	movl	%eax, 104(%rdx)
	.loc 1 1687 44
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -392(%rbp)
	.loc 1 1688 39
	movq	-400(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1688 37
	movl	%eax, %edx
	movq	-392(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1689 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1689 40
	movq	80(%rax), %rcx
	.loc 1 1689 105
	movl	-672(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -672(%rbp)
	cltq
	.loc 1 1689 66
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	.loc 1 1689 109
	movq	-392(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1690 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1690 67
	movq	-408(%rbp), %rax
	movq	%rax, 80(%rdx)
	.loc 1 1691 104
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1691 117
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1691 120
	movq	8(%rax), %rax
	.loc 1 1691 126
	movq	(%rax), %rax
	.loc 1 1691 129
	movq	(%rax), %rax
	.loc 1 1691 142
	addq	$8, %rax
	movq	(%rax), %rax
	.loc 1 1691 9
	movq	48(%rax), %rsi
	.loc 1 1691 48
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1691 61
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1691 64
	movq	8(%rax), %rax
	.loc 1 1691 70
	movq	(%rax), %rax
	.loc 1 1691 73
	movq	(%rax), %rax
	.loc 1 1691 86
	movq	(%rax), %rax
	.loc 1 1691 9
	movq	48(%rax), %rcx
	movq	-664(%rbp), %rdx
	movq	-432(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC148(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1692 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1692 46
	movq	-432(%rbp), %rax
	movq	%rax, 56(%rdx)
	.loc 1 1693 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1693 58
	movl	-676(%rbp), %eax
	movl	%eax, 72(%rdx)
	.loc 1 1694 27
	addl	$1, -760(%rbp)
	.loc 1 1695 9
	jmp	.L254
.L257:
	.loc 1 1697 23
	movl	$50, %edi
	call	malloc@PLT
	movq	%rax, -656(%rbp)
	.loc 1 1698 9
	movl	-756(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -756(%rbp)
	movq	-656(%rbp), %rcx
	movl	%eax, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1699 66
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1699 79
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1699 9
	movl	(%rax), %eax
	movq	-656(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC149(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1701 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1701 46
	movl	$0, 28(%rax)
	.loc 1 1702 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1702 50
	movq	-656(%rbp), %rax
	movq	%rax, 8(%rdx)
	.loc 1 1703 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1703 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1703 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1703 70
	movq	(%rcx), %rax
	.loc 1 1703 52
	movq	%rax, (%rdx)
	.loc 1 1704 59
	movq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	.loc 1 1704 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1704 57
	movl	%ecx, %edx
	movl	%edx, 24(%rax)
	.loc 1 1705 36
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -560(%rbp)
	.loc 1 1706 48
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1706 61
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1706 9
	movl	(%rax), %edx
	movq	-664(%rbp), %rcx
	movq	-560(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1707 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1707 54
	movq	-560(%rbp), %rax
	movq	%rax, 16(%rdx)
	.loc 1 1708 53
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1708 66
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1708 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1708 69
	movq	40(%rcx), %rax
	.loc 1 1708 48
	movq	%rax, 32(%rdx)
	.loc 1 1709 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1709 25
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1709 39
	movq	-656(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 1 1710 59
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1710 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1710 25
	movl	-752(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1710 79
	movl	24(%rdx), %edx
	.loc 1 1710 46
	movl	%edx, 56(%rax)
	.loc 1 1712 51
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1712 64
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1712 67
	movq	8(%rax), %rax
	.loc 1 1712 73
	movq	(%rax), %rax
	.loc 1 1712 76
	movq	(%rax), %rax
	.loc 1 1712 89
	movq	(%rax), %rcx
	.loc 1 1712 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1712 92
	movq	48(%rcx), %rax
	.loc 1 1712 46
	movq	%rax, 40(%rdx)
	.loc 1 1713 52
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1713 65
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1713 68
	movq	8(%rax), %rax
	.loc 1 1713 74
	movq	(%rax), %rax
	.loc 1 1713 77
	movq	(%rax), %rax
	.loc 1 1713 90
	addq	$8, %rax
	movq	(%rax), %rcx
	.loc 1 1713 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1713 93
	movq	48(%rcx), %rax
	.loc 1 1713 47
	movq	%rax, 48(%rdx)
	.loc 1 1714 13
	movl	$0, -700(%rbp)
	.loc 1 1715 13
	movl	$0, -696(%rbp)
	.loc 1 1716 13
	movl	$0, -692(%rbp)
	.loc 1 1717 34
	movl	$1, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -552(%rbp)
	.loc 1 1718 58
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -544(%rbp)
	.loc 1 1719 48
	movl	$4, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -536(%rbp)
	.loc 1 1720 29
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -648(%rbp)
	.loc 1 1721 30
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -528(%rbp)
	.loc 1 1722 40
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -520(%rbp)
	.loc 1 1723 41
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -512(%rbp)
	.loc 1 1724 102
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1724 115
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1724 118
	movq	8(%rax), %rax
	.loc 1 1724 124
	movq	(%rax), %rax
	.loc 1 1724 127
	movq	(%rax), %rax
	.loc 1 1724 140
	movq	(%rax), %rax
	.loc 1 1724 9
	movq	48(%rax), %rcx
	.loc 1 1724 52
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1724 65
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1724 68
	movq	8(%rax), %rax
	.loc 1 1724 74
	movq	(%rax), %rax
	.loc 1 1724 77
	movq	(%rax), %rax
	.loc 1 1724 90
	movq	(%rax), %rax
	.loc 1 1724 9
	movl	(%rax), %edx
	movq	-520(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1725 103
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1725 116
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1725 119
	movq	8(%rax), %rax
	.loc 1 1725 125
	movq	(%rax), %rax
	.loc 1 1725 128
	movq	(%rax), %rax
	.loc 1 1725 141
	addq	$8, %rax
	movq	(%rax), %rax
	.loc 1 1725 9
	movq	48(%rax), %rcx
	.loc 1 1725 53
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1725 66
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1725 69
	movq	8(%rax), %rax
	.loc 1 1725 75
	movq	(%rax), %rax
	.loc 1 1725 78
	movq	(%rax), %rax
	.loc 1 1725 91
	addq	$8, %rax
	movq	(%rax), %rax
	.loc 1 1725 9
	movl	(%rax), %edx
	movq	-512(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1727 24
	movq	-520(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1727 22
	movl	%eax, %edx
	movq	-648(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1728 25
	movq	-512(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1728 23
	movl	%eax, %edx
	movq	-528(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1730 74
	movl	-696(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -696(%rbp)
	cltq
	.loc 1 1730 38
	leaq	0(,%rax,8), %rdx
	movq	-536(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1730 78
	movq	-648(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1731 52
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1731 65
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1731 68
	movq	8(%rax), %rax
	.loc 1 1731 74
	movq	(%rax), %rax
	.loc 1 1731 77
	movq	(%rax), %rax
	.loc 1 1731 90
	movq	(%rax), %rdx
	.loc 1 1731 43
	movl	-700(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -700(%rbp)
	cltq
	.loc 1 1731 23
	leaq	0(,%rax,8), %rcx
	movq	-552(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1731 93
	movq	48(%rdx), %rax
	.loc 1 1731 47
	movq	%rax, (%rcx)
	.loc 1 1732 52
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1732 65
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1732 68
	movq	8(%rax), %rax
	.loc 1 1732 74
	movq	(%rax), %rax
	.loc 1 1732 77
	movq	(%rax), %rax
	.loc 1 1732 90
	addq	$8, %rax
	movq	(%rax), %rdx
	.loc 1 1732 43
	movl	-700(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -700(%rbp)
	cltq
	.loc 1 1732 23
	leaq	0(,%rax,8), %rcx
	movq	-552(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1732 93
	movq	48(%rdx), %rax
	.loc 1 1732 47
	movq	%rax, (%rcx)
	.loc 1 1733 74
	movl	-696(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -696(%rbp)
	cltq
	.loc 1 1733 38
	leaq	0(,%rax,8), %rdx
	movq	-536(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1733 78
	movq	-528(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1734 75
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1734 88
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1734 91
	movq	8(%rax), %rax
	.loc 1 1734 97
	movq	(%rax), %rax
	.loc 1 1734 100
	movq	(%rax), %rdx
	.loc 1 1734 66
	movl	-692(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -692(%rbp)
	cltq
	.loc 1 1734 34
	leaq	0(,%rax,8), %rcx
	movq	-544(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1734 113
	movq	(%rdx), %rax
	.loc 1 1734 70
	movq	%rax, (%rcx)
	.loc 1 1735 75
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1735 88
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1735 91
	movq	8(%rax), %rax
	.loc 1 1735 97
	movq	(%rax), %rax
	.loc 1 1735 100
	movq	(%rax), %rdx
	.loc 1 1735 66
	movl	-692(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -692(%rbp)
	cltq
	.loc 1 1735 34
	leaq	0(,%rax,8), %rcx
	movq	-544(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1735 70
	movq	8(%rdx), %rax
	movq	%rax, (%rcx)
	.loc 1 1736 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1736 52
	movq	-552(%rbp), %rax
	movq	%rax, 64(%rdx)
	.loc 1 1737 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1737 63
	movq	-544(%rbp), %rax
	movq	%rax, 96(%rdx)
	.loc 1 1738 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1738 70
	movl	-692(%rbp), %eax
	movl	%eax, 104(%rdx)
	.loc 1 1739 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1739 67
	movq	-536(%rbp), %rax
	movq	%rax, 80(%rdx)
	.loc 1 1740 24
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -504(%rbp)
	.loc 1 1741 9
	movq	-504(%rbp), %rax
	movl	$100, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1742 137
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1742 9
	movq	48(%rax), %rdi
	.loc 1 1742 97
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1742 9
	movq	32(%rax), %rsi
	.loc 1 1742 59
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1742 9
	movq	40(%rax), %rcx
	movq	-656(%rbp), %rdx
	movq	-504(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC150(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1743 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1743 46
	movq	-504(%rbp), %rax
	movq	%rax, 56(%rdx)
	.loc 1 1744 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1744 58
	movl	-700(%rbp), %eax
	movl	%eax, 72(%rdx)
	.loc 1 1745 27
	addl	$1, -760(%rbp)
	.loc 1 1746 9
	jmp	.L254
.L255:
	.loc 1 1748 23
	movl	$50, %edi
	call	malloc@PLT
	movq	%rax, -624(%rbp)
	.loc 1 1749 9
	movl	-756(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -756(%rbp)
	movq	-624(%rbp), %rcx
	movl	%eax, %edx
	leaq	.LC142(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1750 69
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1750 82
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1750 9
	movl	(%rax), %eax
	movq	-624(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC151(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1752 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1752 46
	movl	$2, 28(%rax)
	.loc 1 1753 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1753 50
	movq	-656(%rbp), %rax
	movq	%rax, 8(%rdx)
	.loc 1 1754 57
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1754 70
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	(%rax,%rdx), %rcx
	.loc 1 1754 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1754 70
	movq	(%rcx), %rax
	.loc 1 1754 52
	movq	%rax, (%rdx)
	.loc 1 1755 59
	movq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rcx
	.loc 1 1755 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1755 57
	movl	%ecx, %edx
	movl	%edx, 24(%rax)
	.loc 1 1756 39
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -616(%rbp)
	.loc 1 1757 51
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1757 64
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1757 9
	movl	(%rax), %edx
	movq	-664(%rbp), %rcx
	movq	-616(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1758 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1758 54
	movq	-616(%rbp), %rax
	movq	%rax, 16(%rdx)
	.loc 1 1759 53
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1759 66
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	.loc 1 1759 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1759 69
	movq	40(%rcx), %rax
	.loc 1 1759 48
	movq	%rax, 32(%rdx)
	.loc 1 1760 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1760 25
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1760 39
	movq	-656(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 1 1761 59
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1761 12
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1761 25
	movl	-752(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1761 79
	movl	24(%rdx), %edx
	.loc 1 1761 46
	movl	%edx, 56(%rax)
	.loc 1 1763 51
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1763 64
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1763 67
	movq	8(%rax), %rax
	.loc 1 1763 73
	movq	(%rax), %rax
	.loc 1 1763 76
	movq	(%rax), %rax
	.loc 1 1763 89
	movq	(%rax), %rcx
	.loc 1 1763 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1763 92
	movq	48(%rcx), %rax
	.loc 1 1763 46
	movq	%rax, 40(%rdx)
	.loc 1 1764 13
	movl	$0, -712(%rbp)
	.loc 1 1765 13
	movl	$0, -708(%rbp)
	.loc 1 1766 13
	movl	$0, -704(%rbp)
	.loc 1 1767 37
	movl	$1, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -608(%rbp)
	.loc 1 1768 61
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -600(%rbp)
	.loc 1 1769 51
	movl	$4, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -592(%rbp)
	.loc 1 1770 36
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -584(%rbp)
	.loc 1 1771 43
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -576(%rbp)
	.loc 1 1772 105
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1772 118
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1772 121
	movq	8(%rax), %rax
	.loc 1 1772 127
	movq	(%rax), %rax
	.loc 1 1772 130
	movq	(%rax), %rax
	.loc 1 1772 143
	movq	(%rax), %rax
	.loc 1 1772 9
	movq	48(%rax), %rcx
	.loc 1 1772 55
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1772 68
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1772 71
	movq	8(%rax), %rax
	.loc 1 1772 77
	movq	(%rax), %rax
	.loc 1 1772 80
	movq	(%rax), %rax
	.loc 1 1772 93
	movq	(%rax), %rax
	.loc 1 1772 9
	movl	(%rax), %edx
	movq	-576(%rbp), %rax
	leaq	.LC144(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1774 24
	movq	-576(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1774 22
	movl	%eax, %edx
	movq	-648(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1776 80
	movl	-708(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -708(%rbp)
	cltq
	.loc 1 1776 41
	leaq	0(,%rax,8), %rdx
	movq	-592(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1776 84
	movq	-584(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1777 58
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1777 71
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1777 74
	movq	8(%rax), %rax
	.loc 1 1777 80
	movq	(%rax), %rax
	.loc 1 1777 83
	movq	(%rax), %rax
	.loc 1 1777 96
	movq	(%rax), %rdx
	.loc 1 1777 49
	movl	-712(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -712(%rbp)
	cltq
	.loc 1 1777 26
	leaq	0(,%rax,8), %rcx
	movq	-608(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1777 99
	movq	48(%rdx), %rax
	.loc 1 1777 53
	movq	%rax, (%rcx)
	.loc 1 1778 81
	movq	-776(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1778 94
	movl	-752(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1778 97
	movq	8(%rax), %rax
	.loc 1 1778 103
	movq	(%rax), %rax
	.loc 1 1778 106
	movq	(%rax), %rdx
	.loc 1 1778 72
	movl	-704(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -704(%rbp)
	cltq
	.loc 1 1778 37
	leaq	0(,%rax,8), %rcx
	movq	-600(%rbp), %rax
	addq	%rax, %rcx
	.loc 1 1778 119
	movq	(%rdx), %rax
	.loc 1 1778 76
	movq	%rax, (%rcx)
	.loc 1 1779 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1779 52
	movq	-608(%rbp), %rax
	movq	%rax, 64(%rdx)
	.loc 1 1780 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1780 63
	movq	-600(%rbp), %rax
	movq	%rax, 96(%rdx)
	.loc 1 1781 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1781 70
	movl	-704(%rbp), %eax
	movl	%eax, 104(%rdx)
	.loc 1 1782 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1782 67
	movq	-592(%rbp), %rax
	movq	%rax, 80(%rdx)
	.loc 1 1783 30
	movl	$100, %edi
	call	malloc@PLT
	movq	%rax, -568(%rbp)
	.loc 1 1784 9
	movq	-568(%rbp), %rax
	movl	$100, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1785 100
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1785 9
	movq	32(%rax), %rsi
	.loc 1 1785 62
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1785 9
	movq	40(%rax), %rcx
	movq	-624(%rbp), %rdx
	movq	-568(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC148(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 1786 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1786 46
	movq	-568(%rbp), %rax
	movq	%rax, 56(%rdx)
	.loc 1 1787 20
	movl	-760(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1787 58
	movl	-712(%rbp), %eax
	movl	%eax, 72(%rdx)
	.loc 1 1788 27
	addl	$1, -760(%rbp)
	.loc 1 1789 9
	jmp	.L254
.L276:
	.loc 1 1655 9
	nop
.L254:
.LBE64:
	.loc 1 1551 37 discriminator 2
	addl	$1, -752(%rbp)
.L253:
	.loc 1 1551 27 discriminator 1
	movq	-776(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1551 22 discriminator 1
	cmpl	%eax, -752(%rbp)
	jl	.L271
.LBE63:
.LBB70:
	.loc 1 1793 12
	movl	$0, -716(%rbp)
	.loc 1 1793 3
	jmp	.L272
.L273:
	.loc 1 1794 31 discriminator 3
	movl	-716(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-640(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1794 5 discriminator 3
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1793 45 discriminator 3
	addl	$1, -716(%rbp)
.L272:
	.loc 1 1793 22 discriminator 1
	movl	-716(%rbp), %eax
	cmpl	-760(%rbp), %eax
	jl	.L273
.LBE70:
	.loc 1 1796 45
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -632(%rbp)
	.loc 1 1797 32
	movq	-632(%rbp), %rax
	movq	-640(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1798 38
	movq	-632(%rbp), %rax
	movl	-760(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 1799 24
	movq	-776(%rbp), %rax
	movq	-632(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 1800 10
	movq	-632(%rbp), %rax
	.loc 1 1801 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L275
	call	__stack_chk_fail@PLT
.L275:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	assignregisters, .-assignregisters
	.section	.rodata
.LC152:
	.string	"looking up %s\n"
.LC153:
	.string	"key doesn't exist"
.LC154:
	.string	"key exists"
.LC155:
	.string	"Variable %s appears %d-%d\n"
	.text
	.globl	liveranges
	.type	liveranges, @function
liveranges:
.LFB32:
	.loc 1 1803 96
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	.loc 1 1804 33
	movl	$1069064, %esi
	movl	$10, %edi
	call	calloc@PLT
	movq	%rax, -72(%rbp)
	.loc 1 1805 30
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -64(%rbp)
	.loc 1 1806 36
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -56(%rbp)
	.loc 1 1807 9
	movl	$0, -136(%rbp)
.LBB71:
	.loc 1 1808 14
	movl	$0, -132(%rbp)
	.loc 1 1808 5
	jmp	.L278
.L279:
	.loc 1 1809 18 discriminator 3
	movl	-132(%rbp), %eax
	cltq
	imulq	$1069064, %rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1809 25 discriminator 3
	movl	-132(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 1808 31 discriminator 3
	addl	$1, -132(%rbp)
.L278:
	.loc 1 1808 24 discriminator 1
	cmpl	$9, -132(%rbp)
	jle	.L279
.LBE71:
.LBB72:
	.loc 1 1811 14
	movl	$0, -128(%rbp)
	.loc 1 1811 5
	jmp	.L280
.L285:
.LBB73:
	.loc 1 1815 16
	movl	$0, -124(%rbp)
	.loc 1 1815 7
	jmp	.L281
.L284:
.LBB74:
	.loc 1 1816 43
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1816 56
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1816 59
	movq	64(%rax), %rax
	.loc 1 1816 70
	movl	-124(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1816 16
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 1817 9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1818 9
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC152(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1819 40
	movq	-16(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_hashmap
	movq	%rax, -8(%rbp)
	.loc 1 1820 19
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	.loc 1 1820 12
	testl	%eax, %eax
	jne	.L282
	.loc 1 1821 11
	leaq	.LC153(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1822 99
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1822 112
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1822 115
	movq	80(%rax), %rax
	.loc 1 1822 141
	movl	-124(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1822 11
	movl	(%rax), %edx
	.loc 1 1822 65
	movq	-152(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1822 78
	movl	-128(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	.loc 1 1822 61
	addq	%rcx, %rax
	.loc 1 1822 11
	movq	%rax, %rdi
	movq	-16(%rbp), %rsi
	movq	-72(%rbp), %rax
	movl	%edx, %ecx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	set_hashmap
	.loc 1 1823 25
	movl	-136(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1823 43
	movq	-16(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1824 67
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1824 80
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1824 83
	movq	80(%rax), %rax
	.loc 1 1824 109
	movl	-124(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1824 32
	movl	-136(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-56(%rbp), %rdx
	addq	%rcx, %rdx
	.loc 1 1824 109
	movq	(%rax), %rax
	.loc 1 1824 50
	movq	%rax, (%rdx)
	.loc 1 1825 26
	addl	$1, -136(%rbp)
	jmp	.L283
.L282:
	.loc 1 1827 11
	leaq	.LC154(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L283:
.LBE74:
	.loc 1 1815 79 discriminator 2
	addl	$1, -124(%rbp)
.L281:
	.loc 1 1815 43 discriminator 1
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1815 56 discriminator 1
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1815 59 discriminator 1
	movl	72(%rax), %eax
	.loc 1 1815 26 discriminator 1
	cmpl	%eax, -124(%rbp)
	jl	.L284
.LBE73:
	.loc 1 1811 63 discriminator 2
	addl	$1, -128(%rbp)
.L280:
	.loc 1 1811 41 discriminator 1
	movq	-160(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1811 24 discriminator 1
	cmpl	%eax, -128(%rbp)
	jl	.L285
.LBE72:
	.loc 1 1831 30
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -48(%rbp)
	.loc 1 1832 9
	movl	$0, -120(%rbp)
.LBB75:
	.loc 1 1833 14
	movl	$0, -116(%rbp)
	.loc 1 1833 5
	jmp	.L286
.L297:
.LBB76:
	.loc 1 1834 44
	movl	-116(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1834 14
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 1835 11
	movl	$-1, -112(%rbp)
	.loc 1 1838 11
	movl	$-1, -108(%rbp)
	.loc 1 1839 51
	movl	-116(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1839 11
	movl	(%rax), %eax
	movl	%eax, -92(%rbp)
.LBB77:
	.loc 1 1840 16
	movl	$0, -104(%rbp)
	.loc 1 1840 7
	jmp	.L287
.L290:
	.loc 1 1841 35
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1841 48
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1841 51
	movq	8(%rax), %rax
	.loc 1 1841 13
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 1841 12
	testl	%eax, %eax
	jne	.L288
	.loc 1 1842 28
	movl	-104(%rbp), %eax
	movl	%eax, -112(%rbp)
	.loc 1 1843 46
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1843 59
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	.loc 1 1843 28
	addq	%rcx, %rax
	movq	%rax, -88(%rbp)
	.loc 1 1844 11
	jmp	.L289
.L288:
	.loc 1 1840 65 discriminator 2
	addl	$1, -104(%rbp)
.L287:
	.loc 1 1840 43 discriminator 1
	movq	-160(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1840 26 discriminator 1
	cmpl	%eax, -104(%rbp)
	jl	.L290
.L289:
.LBE77:
.LBB78:
	.loc 1 1847 16
	movl	$0, -100(%rbp)
	.loc 1 1847 7
	jmp	.L291
.L296:
	.loc 1 1848 35
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1848 48
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1848 51
	movq	8(%rax), %rax
	.loc 1 1848 13
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 1848 12
	testl	%eax, %eax
	jne	.L292
	.loc 1 1849 26
	movl	-100(%rbp), %eax
	movl	%eax, -108(%rbp)
	.loc 1 1850 44
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1850 57
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	.loc 1 1850 26
	addq	%rcx, %rax
	movq	%rax, -80(%rbp)
.L292:
.LBB79:
	.loc 1 1852 18
	movl	$0, -96(%rbp)
	.loc 1 1852 9
	jmp	.L293
.L295:
	.loc 1 1853 37
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1853 50
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1853 53
	movq	64(%rax), %rax
	.loc 1 1853 64
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1853 15
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 1853 14
	testl	%eax, %eax
	jne	.L294
	.loc 1 1854 28
	movl	-100(%rbp), %eax
	movl	%eax, -108(%rbp)
	.loc 1 1855 46
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1855 59
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	.loc 1 1855 28
	addq	%rcx, %rax
	movq	%rax, -80(%rbp)
.L294:
	.loc 1 1852 82 discriminator 2
	addl	$1, -96(%rbp)
.L293:
	.loc 1 1852 46 discriminator 1
	movq	-160(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1852 59 discriminator 1
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1852 62 discriminator 1
	movl	72(%rax), %eax
	.loc 1 1852 28 discriminator 1
	cmpl	%eax, -96(%rbp)
	jl	.L295
.LBE79:
	.loc 1 1847 65 discriminator 2
	addl	$1, -100(%rbp)
.L291:
	.loc 1 1847 43 discriminator 1
	movq	-160(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1847 26 discriminator 1
	cmpl	%eax, -100(%rbp)
	jl	.L296
.LBE78:
	.loc 1 1860 29 discriminator 2
	movl	$56, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	.loc 1 1861 28 discriminator 2
	movq	-24(%rbp), %rax
	movl	-112(%rbp), %edx
	movl	%edx, 24(%rax)
	.loc 1 1862 26 discriminator 2
	movq	-24(%rbp), %rax
	movl	-108(%rbp), %edx
	movl	%edx, 28(%rax)
	.loc 1 1863 22 discriminator 2
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rax)
	.loc 1 1864 29 discriminator 2
	movq	-24(%rbp), %rax
	movl	-92(%rbp), %edx
	movl	%edx, 40(%rax)
	.loc 1 1865 30 discriminator 2
	movq	-24(%rbp), %rax
	movq	-88(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 1866 28 discriminator 2
	movq	-24(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, 16(%rax)
	.loc 1 1867 24 discriminator 2
	movl	-120(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -120(%rbp)
	cltq
	.loc 1 1867 12 discriminator 2
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1867 28 discriminator 2
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 1868 6 discriminator 2
	movl	-108(%rbp), %ecx
	movl	-112(%rbp), %edx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC155(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE76:
	.loc 1 1833 43 discriminator 2
	addl	$1, -116(%rbp)
.L286:
	.loc 1 1833 23 discriminator 1
	movl	-116(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L297
.LBE75:
	.loc 1 1872 34
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 1873 22
	movq	-40(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 1874 28
	movq	-40(%rbp), %rax
	movl	-120(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 1875 10
	movq	-40(%rbp), %rax
	.loc 1 1876 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	liveranges, .-liveranges
	.section	.rodata
.LC156:
	.string	"Assigning %s to %d\n"
	.align 8
.LC157:
	.string	"Instruction %s %s appears in range of %d-%d\n"
.LC158:
	.string	"Register %s is free\n"
.LC159:
	.string	"assignment position %d\n"
	.align 8
.LC160:
	.string	"Assigned register %s to %s <- %s\n"
	.text
	.globl	assignrealregisters
	.type	assignrealregisters, @function
assignrealregisters:
.LFB33:
	.loc 1 1879 161
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movl	%r8d, -100(%rbp)
	.loc 1 1880 33
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -40(%rbp)
.LBB80:
	.loc 1 1881 12
	movl	$0, -60(%rbp)
	.loc 1 1881 3
	jmp	.L300
.L301:
	.loc 1 1882 69 discriminator 3
	movl	-100(%rbp), %eax
	subl	-60(%rbp), %eax
	.loc 1 1882 5 discriminator 3
	leal	-1(%rax), %edx
	.loc 1 1882 49 discriminator 3
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-96(%rbp), %rax
	addq	%rcx, %rax
	.loc 1 1882 5 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC156(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1883 64 discriminator 3
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 1 1883 40 discriminator 3
	movl	-100(%rbp), %eax
	subl	-60(%rbp), %eax
	cltq
	.loc 1 1883 24 discriminator 3
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 1883 64 discriminator 3
	movq	(%rcx), %rax
	.loc 1 1883 49 discriminator 3
	movq	%rax, (%rdx)
	.loc 1 1881 41 discriminator 3
	addl	$1, -60(%rbp)
.L300:
	.loc 1 1881 22 discriminator 1
	movl	-60(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L301
.LBE80:
	.loc 1 1885 7
	movl	-100(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -56(%rbp)
	.loc 1 1886 40
	movl	$1069064, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 1 1887 31
	movl	$1069064, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
.LBB81:
	.loc 1 1889 12
	movl	$0, -52(%rbp)
	.loc 1 1889 3
	jmp	.L302
.L303:
	.loc 1 1890 95 discriminator 3
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1890 103 discriminator 3
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1890 5 discriminator 3
	movl	40(%rax), %edx
	.loc 1 1890 47 discriminator 3
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1890 55 discriminator 3
	movl	-52(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1890 5 discriminator 3
	movq	32(%rax), %rsi
	movq	-32(%rbp), %rax
	movl	%edx, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	set_hashmap
	.loc 1 1889 51 discriminator 3
	addl	$1, -52(%rbp)
.L302:
	.loc 1 1889 34 discriminator 1
	movq	-80(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1889 22 discriminator 1
	cmpl	%eax, -52(%rbp)
	jl	.L303
.LBE81:
.LBB82:
	.loc 1 1892 12
	movl	$0, -48(%rbp)
	.loc 1 1892 3
	jmp	.L304
.L309:
.LBB83:
	.loc 1 1893 14
	movl	$0, -44(%rbp)
	.loc 1 1893 5
	jmp	.L305
.L308:
	.loc 1 1894 38
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1894 46
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1894 49
	movl	24(%rax), %eax
	.loc 1 1894 12
	cmpl	%eax, -48(%rbp)
	jl	.L306
	.loc 1 1894 94 discriminator 1
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1894 102 discriminator 1
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1894 105 discriminator 1
	movl	28(%rax), %eax
	.loc 1 1894 66 discriminator 1
	cmpl	%eax, -48(%rbp)
	jg	.L306
.LBB84:
	.loc 1 1895 197
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1895 205
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1895 11
	movl	28(%rax), %edi
	.loc 1 1895 158
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1895 166
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1895 11
	movl	24(%rax), %ecx
	.loc 1 1895 115
	movq	-88(%rbp), %rax
	movq	(%rax), %rsi
	.loc 1 1895 128
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	.loc 1 1895 11
	movq	56(%rax), %rdx
	.loc 1 1895 77
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1895 85
	movl	-44(%rbp), %esi
	movslq	%esi, %rsi
	salq	$3, %rsi
	addq	%rsi, %rax
	movq	(%rax), %rax
	.loc 1 1895 11
	movq	32(%rax), %rax
	movl	%edi, %r8d
	movq	%rax, %rsi
	leaq	.LC157(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1897 84
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1897 92
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1897 42
	movq	32(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_hashmap
	movq	%rax, -16(%rbp)
	.loc 1 1899 40
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1899 48
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1899 51
	movl	28(%rax), %eax
	.loc 1 1899 14
	cmpl	%eax, -48(%rbp)
	jne	.L307
	.loc 1 1899 79 discriminator 1
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1899 87 discriminator 1
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1899 90 discriminator 1
	movq	48(%rax), %rax
	.loc 1 1899 66 discriminator 1
	testq	%rax, %rax
	je	.L307
	.loc 1 1900 63
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1900 71
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1900 13
	movq	48(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC158(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1901 84
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1901 92
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1901 32
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	.loc 1 1901 66
	movq	48(%rax), %rax
	.loc 1 1901 64
	movq	%rax, (%rdx)
	.loc 1 1902 38
	addl	$1, -56(%rbp)
	.loc 1 1903 27
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 1904 25
	movq	-16(%rbp), %rax
	movl	$0, 12(%rax)
.L307:
	.loc 1 1906 11
	movl	-56(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC159(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1907 25
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1907 33
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1907 36
	movq	48(%rax), %rax
	.loc 1 1907 14
	testq	%rax, %rax
	jne	.L306
.LBB85:
	.loc 1 1908 57
	movl	-56(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1908 20
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 1909 107
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 1 1909 13
	movl	%eax, %edi
	movq	-8(%rbp), %rdx
	.loc 1 1909 55
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1909 63
	movl	-44(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1909 13
	movq	32(%rax), %rsi
	movq	-32(%rbp), %rax
	movl	%edi, %ecx
	movq	%rax, %rdi
	call	set_hashmap
	.loc 1 1910 142
	movq	-88(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1910 155
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1910 13
	movq	56(%rax), %rcx
	.loc 1 1910 90
	movq	-88(%rbp), %rax
	movq	(%rax), %rsi
	.loc 1 1910 103
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	.loc 1 1910 13
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC160(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1911 28
	movq	-88(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1911 41
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	.loc 1 1911 71
	movq	-8(%rbp), %rax
	movq	%rax, 88(%rdx)
	.loc 1 1912 28
	movq	-88(%rbp), %rax
	movq	(%rax), %rcx
	.loc 1 1912 41
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	.loc 1 1912 54
	movq	(%rax), %rax
	.loc 1 1912 83
	movq	-8(%rbp), %rdx
	movq	%rdx, 72(%rax)
	.loc 1 1913 23
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1913 31
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1913 52
	movq	-8(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 1 1914 38
	subl	$1, -56(%rbp)
.L306:
.LBE85:
.LBE84:
	.loc 1 1893 53 discriminator 2
	addl	$1, -44(%rbp)
.L305:
	.loc 1 1893 36 discriminator 1
	movq	-80(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1893 24 discriminator 1
	cmpl	%eax, -44(%rbp)
	jl	.L308
.LBE83:
	.loc 1 1892 90 discriminator 2
	addl	$1, -48(%rbp)
.L304:
	.loc 1 1892 58 discriminator 1
	movq	-88(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1892 41 discriminator 1
	cmpl	%eax, -48(%rbp)
	jl	.L309
.LBE82:
	.loc 1 1922 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	assignrealregisters, .-assignrealregisters
	.globl	assign_all_registers
	.type	assign_all_registers, @function
assign_all_registers:
.LFB34:
	.loc 1 1924 90
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 1925 34
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	liveranges
	movq	%rax, -16(%rbp)
	.loc 1 1926 28
	movl	$8, %esi
	movl	$100, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 1927 7
	movl	$0, -20(%rbp)
	.loc 1 1928 32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 1928 17
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1928 36
	leaq	.LC91(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1929 32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 1929 17
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1929 36
	leaq	.LC93(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1930 32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 1930 17
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1930 36
	leaq	.LC94(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1931 32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 1931 17
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1931 36
	leaq	.LC92(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1932 32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 1932 17
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1932 36
	leaq	.LC95(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1933 32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	.loc 1 1933 17
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 1933 36
	leaq	.LC96(%rip), %rdx
	movq	%rdx, (%rax)
	.loc 1 1935 3
	movl	-20(%rbp), %edi
	movq	-8(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-40(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	assignrealregisters
	.loc 1 1937 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	assign_all_registers, .-assign_all_registers
	.section	.rodata
.LC161:
	.string	"Codegen for main"
	.text
	.globl	machine_code
	.type	machine_code, @function
machine_code:
.LFB35:
	.loc 1 1939 36
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 1940 7
	movl	$0, -4(%rbp)
	.loc 1 1941 39
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 1941 3
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	assign_all_registers
.LBB86:
	.loc 1 1942 12
	movl	$0, -8(%rbp)
	.loc 1 1942 3
	jmp	.L312
.L313:
	.loc 1 1943 55 discriminator 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1943 66 discriminator 3
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1943 69 discriminator 3
	movq	56(%rax), %rax
	.loc 1 1943 5 discriminator 3
	movq	16(%rax), %rdx
	.loc 1 1943 30 discriminator 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1943 41 discriminator 3
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1943 5 discriminator 3
	movq	56(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	assign_all_registers
	.loc 1 1942 48 discriminator 3
	addl	$1, -8(%rbp)
.L312:
	.loc 1 1942 28 discriminator 1
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 1942 22 discriminator 1
	cmpl	%eax, -8(%rbp)
	jl	.L313
.LBE86:
	.loc 1 1945 3
	leaq	.LC161(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1946 3
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	codegen
	.loc 1 1947 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	machine_code, .-machine_code
	.globl	dump
	.type	dump, @function
dump:
.LFB36:
	.loc 1 1949 44
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
.LBB87:
	.loc 1 1950 12
	movl	$0, -4(%rbp)
	.loc 1 1950 3
	jmp	.L315
.L316:
	.loc 1 1951 31 discriminator 3
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 1951 42 discriminator 3
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 1951 5 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	dump_function
	.loc 1 1950 56 discriminator 3
	addl	$1, -4(%rbp)
.L315:
	.loc 1 1950 36 discriminator 1
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	.loc 1 1950 22 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L316
.LBE87:
	.loc 1 1953 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	dump, .-dump
	.section	.rodata
.LC162:
	.string	"member access"
.LC163:
	.string	"identifier %s %d\n"
.LC164:
	.string	"method call"
	.text
	.globl	dump_anf
	.type	dump_anf, @function
dump_anf:
.LFB37:
	.loc 1 1955 38
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
.LBB88:
	.loc 1 1956 12
	movl	$0, -4(%rbp)
	.loc 1 1956 3
	jmp	.L318
.L326:
	.loc 1 1957 16
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1957 29
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1957 32
	movl	4(%rax), %eax
	.loc 1 1957 5
	subl	$3, %eax
	cmpl	$6, %eax
	ja	.L319
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L321(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L321(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L321:
	.long	.L325-.L321
	.long	.L324-.L321
	.long	.L323-.L321
	.long	.L322-.L321
	.long	.L319-.L321
	.long	.L319-.L321
	.long	.L320-.L321
	.text
.L324:
	.loc 1 1959 9
	leaq	.LC162(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1960 9
	jmp	.L319
.L323:
	.loc 1 1962 75
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1962 88
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 1962 9
	movl	36(%rax), %edx
	.loc 1 1962 41
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 1962 54
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.loc 1 1962 9
	movq	24(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC163(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 1963 9
	jmp	.L319
.L325:
	.loc 1 1965 9
	leaq	.LC164(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1966 9
	jmp	.L319
.L322:
	.loc 1 1968 9
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1969 9
	jmp	.L319
.L320:
	.loc 1 1971 9
	leaq	.LC90(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 1972 9
	nop
.L319:
	.loc 1 1956 37 discriminator 2
	addl	$1, -4(%rbp)
.L318:
	.loc 1 1956 27 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 1956 22 discriminator 1
	cmpl	%eax, -4(%rbp)
	jl	.L326
.LBE88:
	.loc 1 1975 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	dump_anf, .-dump_anf
	.section	.rodata
.LC165:
	.string	"rb"
.LC166:
	.string	"Parsing code\n%s"
.LC167:
	.string	"#### Code:"
.LC168:
	.string	"Dumping AST"
.LC169:
	.string	"Dumping ANF"
.LC170:
	.string	"ANF for function %s\n"
.LC171:
	.string	"ANF for main"
.LC172:
	.string	"Assigning registers"
.LC173:
	.string	"r"
.LC174:
	.string	"/proc/self/maps"
.LC175:
	.string	"open() failed: %s.\n"
.LC176:
	.string	"read() failed: %s.\n"
.LC177:
	.string	"close() failed: %s.\n"
.LC178:
	.string	"heap"
.LC179:
	.string	"\n\nfrom /proc/self/maps:\n%s\n"
.LC180:
	.string	"%llx"
.LC181:
	.string	"heap start is %llx\n"
.LC182:
	.string	"Executing machine code at %p\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB38:
	.loc 1 1978 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	addq	$-128, %rsp
	movl	%edi, -8308(%rbp)
	movq	%rsi, -8320(%rbp)
	.loc 1 1978 1
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1983 10
	movq	$0, -8272(%rbp)
	.loc 1 1985 25
	movq	-8320(%rbp), %rax
	addq	$8, %rax
	.loc 1 1985 14
	movq	(%rax), %rax
	leaq	.LC165(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8256(%rbp)
	.loc 1 1987 6
	cmpq	$0, -8256(%rbp)
	je	.L328
	.loc 1 1989 5
	movq	-8256(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 1990 14
	movq	-8256(%rbp), %rax
	movq	%rax, %rdi
	call	ftell@PLT
	movq	%rax, -8264(%rbp)
	.loc 1 1991 5
	movq	-8256(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	.loc 1 1992 34
	movq	-8264(%rbp), %rax
	.loc 1 1992 14
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8272(%rbp)
	.loc 1 1993 5
	movq	-8264(%rbp), %rdx
	movq	-8272(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 1994 8
	cmpq	$0, -8272(%rbp)
	je	.L329
	.loc 1 1996 7
	movq	-8264(%rbp), %rdx
	movq	-8256(%rbp), %rcx
	movq	-8272(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
.L329:
	.loc 1 1998 5
	movq	-8256(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L328:
	.loc 1 2001 6
	cmpq	$0, -8272(%rbp)
	je	.L330
.LBB89:
	.loc 1 2003 5
	movq	-8272(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC166(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 2005 31
	movq	-8264(%rbp), %rax
	movl	%eax, %edx
	movq	-8272(%rbp), %rax
	movq	%rax, %rsi
	movl	%edx, %edi
	call	parse
	movq	%rax, -8248(%rbp)
	.loc 1 2006 5
	leaq	.LC167(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 2007 5
	movq	-8248(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC65(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 2008 5
	leaq	.LC168(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB90:
	.loc 1 2009 14
	movl	$0, -8292(%rbp)
	.loc 1 2009 5
	jmp	.L331
.L332:
	.loc 1 2010 30 discriminator 3
	movq	-8248(%rbp), %rax
	movq	56(%rax), %rax
	.loc 1 2010 36 discriminator 3
	movl	-8292(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 1 2010 7 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	dump_expressions
	.loc 1 2009 56 discriminator 3
	addl	$1, -8292(%rbp)
.L331:
	.loc 1 2009 29 discriminator 1
	movq	-8248(%rbp), %rax
	movq	64(%rax), %rax
	.loc 1 2009 41 discriminator 1
	movl	(%rax), %eax
	.loc 1 2009 24 discriminator 1
	cmpl	%eax, -8292(%rbp)
	jl	.L332
.LBE90:
	.loc 1 2012 5
	movq	-8248(%rbp), %rax
	movq	%rax, %rdi
	call	dump
	.loc 1 2013 25
	movq	-8248(%rbp), %rax
	movq	%rax, %rdi
	call	normalform
	movq	%rax, -8240(%rbp)
	.loc 1 2014 5
	leaq	.LC169(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.LBB91:
	.loc 1 2015 14
	movl	$0, -8288(%rbp)
	.loc 1 2015 5
	jmp	.L333
.L334:
	.loc 1 2016 43 discriminator 3
	movq	-8240(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 2016 54 discriminator 3
	movl	-8288(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2016 7 discriminator 3
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC170(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 2017 20 discriminator 3
	movq	-8240(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 2017 31 discriminator 3
	movl	-8288(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2017 7 discriminator 3
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	dump_anf
	.loc 1 2015 50 discriminator 3
	addl	$1, -8288(%rbp)
.L333:
	.loc 1 2015 30 discriminator 1
	movq	-8240(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 2015 24 discriminator 1
	cmpl	%eax, -8288(%rbp)
	jl	.L334
.LBE91:
	.loc 1 2019 5
	leaq	.LC171(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 2020 5
	movq	-8240(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	dump_anf
	.loc 1 2021 5
	leaq	.LC172(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 2022 5
	movq	-8240(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	assignregisters
.LBB92:
	.loc 1 2023 14
	movl	$0, -8284(%rbp)
	.loc 1 2023 5
	jmp	.L335
.L336:
	.loc 1 2024 27 discriminator 3
	movq	-8240(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 2024 38 discriminator 3
	movl	-8284(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 2024 7 discriminator 3
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	assignregisters
	.loc 1 2023 50 discriminator 3
	addl	$1, -8284(%rbp)
.L335:
	.loc 1 2023 30 discriminator 1
	movq	-8240(%rbp), %rax
	movl	16(%rax), %eax
	.loc 1 2023 24 discriminator 1
	cmpl	%eax, -8284(%rbp)
	jl	.L336
.LBE92:
	.loc 1 2026 20
	leaq	.LC173(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC174(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8232(%rbp)
	.loc 1 2027 7
	cmpq	$0, -8232(%rbp)
	jne	.L337
	.loc 1 2028 58
	call	__errno_location@PLT
	.loc 1 2028 9
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC175(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 2029 9
	movl	$1, %edi
	call	exit@PLT
.L337:
	.loc 1 2031 10
	movq	$0, -8208(%rbp)
	movq	$0, -8200(%rbp)
	leaq	-8192(%rbp), %rdx
	movl	$0, %eax
	movl	$1022, %ecx
	movq	%rdx, %rdi
	rep stosq
	.loc 1 2032 8
	movq	-8232(%rbp), %rax
	movq	%rax, %rdi
	call	fileno@PLT
	movl	%eax, %ecx
	leaq	-8208(%rbp), %rax
	movl	$8192, %edx
	movq	%rax, %rsi
	movl	%ecx, %edi
	call	read@PLT
	.loc 1 2032 7
	cmpq	$-1, %rax
	jne	.L338
	.loc 1 2033 58
	call	__errno_location@PLT
	.loc 1 2033 9
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC176(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 2034 9
	movl	$1, %edi
	call	exit@PLT
.L338:
	.loc 1 2036 8
	movq	-8232(%rbp), %rax
	movq	%rax, %rdi
	call	fileno@PLT
	movl	%eax, %edi
	call	close@PLT
	.loc 1 2036 7
	cmpl	$-1, %eax
	jne	.L339
	.loc 1 2037 59
	call	__errno_location@PLT
	.loc 1 2037 9
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	leaq	.LC177(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 2038 9
	movl	$1, %edi
	call	exit@PLT
.L339:
	.loc 1 2040 15
	movq	$0, -8280(%rbp)
	.loc 1 2041 19
	leaq	-8208(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -8224(%rbp)
	.loc 1 2042 10
	jmp	.L340
.L342:
	.loc 1 2043 12
	movq	-8224(%rbp), %rax
	leaq	.LC178(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	.loc 1 2043 11
	testq	%rax, %rax
	je	.L340
	.loc 1 2044 13
	movq	-8224(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC179(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 2045 13
	leaq	-8280(%rbp), %rdx
	movq	-8224(%rbp), %rax
	leaq	.LC180(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	.loc 1 2046 13
	jmp	.L341
.L340:
	.loc 1 2042 19
	leaq	.LC13(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -8224(%rbp)
	.loc 1 2042 39
	cmpq	$0, -8224(%rbp)
	jne	.L342
.L341:
	.loc 1 2049 5
	movq	-8280(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC181(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 2050 22
	movq	-8280(%rbp), %rdx
	movq	-8240(%rbp), %rax
	movq	%rdx, 32(%rax)
	.loc 1 2051 5
	movq	-8240(%rbp), %rax
	movq	%rax, %rdi
	call	machine_code
	.loc 1 2052 42
	movq	-8240(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 2052 59
	movq	24(%rax), %rax
	.loc 1 2052 82
	movq	16(%rax), %rax
	.loc 1 2052 11
	movq	%rax, -8216(%rbp)
	.loc 1 2054 5
	movq	-8216(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC182(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 2055 5
	movq	-8216(%rbp), %rax
	call	*%rax
.LVL0:
	movl	%eax, %esi
	leaq	.LC123(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L330:
.LBE89:
	.loc 1 2067 10
	movl	$0, %eax
	.loc 1 2068 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L344
	call	__stack_chk_fail@PLT
.L344:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	main, .-main
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/12/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 9 "/usr/include/stdint.h"
	.file 10 "/usr/local/include/pcre2.h"
	.file 11 "/usr/include/string.h"
	.file 12 "/usr/include/unistd.h"
	.file 13 "/usr/include/stdlib.h"
	.file 14 "/usr/include/x86_64-linux-gnu/sys/mman.h"
	.file 15 "/usr/include/errno.h"
	.file 16 "/usr/include/ctype.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x335e
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x29
	.long	.LASF443
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0xe
	.long	.LASF7
	.byte	0x3
	.byte	0xd6
	.byte	0x17
	.long	0x3a
	.uleb128 0xf
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0xf
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2a
	.byte	0x8
	.uleb128 0x18
	.long	0x48
	.uleb128 0xf
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0xf
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x20
	.long	0x56
	.uleb128 0xf
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xe
	.long	.LASF8
	.byte	0x4
	.byte	0x26
	.byte	0x17
	.long	0x4f
	.uleb128 0xf
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xe
	.long	.LASF10
	.byte	0x4
	.byte	0x2a
	.byte	0x16
	.long	0x41
	.uleb128 0xf
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0xe
	.long	.LASF12
	.byte	0x4
	.byte	0x98
	.byte	0x19
	.long	0x8f
	.uleb128 0xe
	.long	.LASF13
	.byte	0x4
	.byte	0x99
	.byte	0x1b
	.long	0x8f
	.uleb128 0xe
	.long	.LASF14
	.byte	0x4
	.byte	0xc2
	.byte	0x1b
	.long	0x8f
	.uleb128 0x6
	.long	0xc4
	.uleb128 0x18
	.long	0xba
	.uleb128 0xf
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x20
	.long	0xc4
	.uleb128 0xd
	.long	.LASF79
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.long	0x256
	.uleb128 0x2
	.long	.LASF16
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.long	0x7c
	.byte	0
	.uleb128 0x2
	.long	.LASF17
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.long	0xba
	.byte	0x8
	.uleb128 0x2
	.long	.LASF18
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0xba
	.byte	0x10
	.uleb128 0x2
	.long	.LASF19
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0xba
	.byte	0x18
	.uleb128 0x2
	.long	.LASF20
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.long	0xba
	.byte	0x20
	.uleb128 0x2
	.long	.LASF21
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.long	0xba
	.byte	0x28
	.uleb128 0x2
	.long	.LASF22
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.long	0xba
	.byte	0x30
	.uleb128 0x2
	.long	.LASF23
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.long	0xba
	.byte	0x38
	.uleb128 0x2
	.long	.LASF24
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.long	0xba
	.byte	0x40
	.uleb128 0x2
	.long	.LASF25
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.long	0xba
	.byte	0x48
	.uleb128 0x2
	.long	.LASF26
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.long	0xba
	.byte	0x50
	.uleb128 0x2
	.long	.LASF27
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.long	0xba
	.byte	0x58
	.uleb128 0x2
	.long	.LASF28
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.long	0x26f
	.byte	0x60
	.uleb128 0x2
	.long	.LASF29
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.long	0x274
	.byte	0x68
	.uleb128 0x2
	.long	.LASF30
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.long	0x7c
	.byte	0x70
	.uleb128 0x2
	.long	.LASF31
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.long	0x7c
	.byte	0x74
	.uleb128 0x2
	.long	.LASF32
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x96
	.byte	0x78
	.uleb128 0x2
	.long	.LASF33
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x2
	.long	.LASF34
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.long	0x62
	.byte	0x82
	.uleb128 0x2
	.long	.LASF35
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.long	0x279
	.byte	0x83
	.uleb128 0x2
	.long	.LASF36
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.long	0x289
	.byte	0x88
	.uleb128 0x2
	.long	.LASF37
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.long	0xa2
	.byte	0x90
	.uleb128 0x2
	.long	.LASF38
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.long	0x293
	.byte	0x98
	.uleb128 0x2
	.long	.LASF39
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.long	0x29d
	.byte	0xa0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.long	0x274
	.byte	0xa8
	.uleb128 0x2
	.long	.LASF41
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x2
	.long	.LASF42
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.long	0x2e
	.byte	0xb8
	.uleb128 0x2
	.long	.LASF43
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.long	0x7c
	.byte	0xc0
	.uleb128 0x2
	.long	.LASF44
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.long	0x2a2
	.byte	0xc4
	.byte	0
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0xd0
	.uleb128 0x2c
	.long	.LASF444
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0x13
	.long	.LASF46
	.uleb128 0x6
	.long	0x26a
	.uleb128 0x6
	.long	0xd0
	.uleb128 0x12
	.long	0xc4
	.long	0x289
	.uleb128 0x21
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x262
	.uleb128 0x13
	.long	.LASF47
	.uleb128 0x6
	.long	0x28e
	.uleb128 0x13
	.long	.LASF48
	.uleb128 0x6
	.long	0x298
	.uleb128 0x12
	.long	0xc4
	.long	0x2b2
	.uleb128 0x21
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF49
	.byte	0x7
	.byte	0x4d
	.byte	0x13
	.long	0xae
	.uleb128 0x6
	.long	0x256
	.uleb128 0x18
	.long	0x2be
	.uleb128 0x2d
	.long	.LASF163
	.byte	0x7
	.byte	0x91
	.byte	0xe
	.long	0x2be
	.uleb128 0xf
	.byte	0x8
	.byte	0x5
	.long	.LASF50
	.uleb128 0xf
	.byte	0x8
	.byte	0x7
	.long	.LASF51
	.uleb128 0x6
	.long	0x2ec
	.uleb128 0x18
	.long	0x2e2
	.uleb128 0x2e
	.uleb128 0x6
	.long	0x5d
	.uleb128 0x6
	.long	0xcb
	.uleb128 0x18
	.long	0x2f2
	.uleb128 0x6
	.long	0xba
	.uleb128 0x18
	.long	0x2fc
	.uleb128 0x2f
	.byte	0x7
	.byte	0x4
	.long	0x41
	.byte	0x10
	.byte	0x2f
	.byte	0x1
	.long	0x365
	.uleb128 0x14
	.long	.LASF52
	.value	0x100
	.uleb128 0x14
	.long	.LASF53
	.value	0x200
	.uleb128 0x14
	.long	.LASF54
	.value	0x400
	.uleb128 0x14
	.long	.LASF55
	.value	0x800
	.uleb128 0x14
	.long	.LASF56
	.value	0x1000
	.uleb128 0x14
	.long	.LASF57
	.value	0x2000
	.uleb128 0x14
	.long	.LASF58
	.value	0x4000
	.uleb128 0x14
	.long	.LASF59
	.value	0x8000
	.uleb128 0x22
	.long	.LASF60
	.byte	0x1
	.uleb128 0x22
	.long	.LASF61
	.byte	0x2
	.uleb128 0x22
	.long	.LASF62
	.byte	0x4
	.uleb128 0x22
	.long	.LASF63
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.long	.LASF64
	.byte	0x8
	.byte	0x18
	.byte	0x13
	.long	0x69
	.uleb128 0xe
	.long	.LASF65
	.byte	0x8
	.byte	0x1a
	.byte	0x14
	.long	0x83
	.uleb128 0xe
	.long	.LASF66
	.byte	0x9
	.byte	0x5a
	.byte	0x1b
	.long	0x3a
	.uleb128 0x16
	.long	.LASF67
	.value	0x1ca
	.byte	0x12
	.long	0x365
	.uleb128 0x20
	.long	0x389
	.uleb128 0x16
	.long	.LASF68
	.value	0x1ce
	.byte	0x1e
	.long	0x3a6
	.uleb128 0x6
	.long	0x395
	.uleb128 0x16
	.long	.LASF69
	.value	0x3a7
	.byte	0x1
	.long	0x3b7
	.uleb128 0x13
	.long	.LASF70
	.uleb128 0x16
	.long	.LASF71
	.value	0x3a7
	.byte	0x1
	.long	0x3c8
	.uleb128 0x13
	.long	.LASF72
	.uleb128 0x16
	.long	.LASF73
	.value	0x3a7
	.byte	0x1
	.long	0x3d9
	.uleb128 0x13
	.long	.LASF74
	.uleb128 0x16
	.long	.LASF75
	.value	0x3a7
	.byte	0x1
	.long	0x3ef
	.uleb128 0x20
	.long	0x3de
	.uleb128 0x13
	.long	.LASF76
	.uleb128 0x16
	.long	.LASF77
	.value	0x3a7
	.byte	0x1
	.long	0x400
	.uleb128 0x13
	.long	.LASF78
	.uleb128 0x6
	.long	0x2e
	.uleb128 0x30
	.long	.LASF80
	.value	0x404
	.byte	0x1
	.byte	0x36
	.byte	0x8
	.long	0x433
	.uleb128 0x10
	.string	"key"
	.byte	0x37
	.byte	0x8
	.long	0x433
	.byte	0
	.uleb128 0x31
	.string	"len"
	.byte	0x1
	.byte	0x38
	.byte	0x7
	.long	0x7c
	.value	0x400
	.byte	0
	.uleb128 0x12
	.long	0xc4
	.long	0x444
	.uleb128 0x1c
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0xd
	.long	.LASF81
	.byte	0x10
	.byte	0x1
	.byte	0x3a
	.long	0x477
	.uleb128 0x2
	.long	.LASF82
	.byte	0x1
	.byte	0x3b
	.byte	0xe
	.long	0x37d
	.byte	0
	.uleb128 0x2
	.long	.LASF83
	.byte	0x1
	.byte	0x3c
	.byte	0x7
	.long	0x7c
	.byte	0x8
	.uleb128 0x10
	.string	"set"
	.byte	0x3d
	.byte	0x7
	.long	0x7c
	.byte	0xc
	.byte	0
	.uleb128 0xd
	.long	.LASF84
	.byte	0x10
	.byte	0x1
	.byte	0x41
	.long	0x49e
	.uleb128 0x2
	.long	.LASF85
	.byte	0x1
	.byte	0x42
	.byte	0x13
	.long	0x513
	.byte	0
	.uleb128 0x2
	.long	.LASF86
	.byte	0x1
	.byte	0x43
	.byte	0x7
	.long	0x7c
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.long	.LASF87
	.byte	0x38
	.byte	0x1
	.byte	0x57
	.long	0x513
	.uleb128 0x2
	.long	.LASF88
	.byte	0x1
	.byte	0x58
	.byte	0x17
	.long	0x6ad
	.byte	0
	.uleb128 0x2
	.long	.LASF89
	.byte	0x1
	.byte	0x59
	.byte	0x16
	.long	0x6c1
	.byte	0x8
	.uleb128 0x2
	.long	.LASF90
	.byte	0x1
	.byte	0x5a
	.byte	0x16
	.long	0x6c1
	.byte	0x10
	.uleb128 0x2
	.long	.LASF91
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.long	0x7c
	.byte	0x18
	.uleb128 0x2
	.long	.LASF92
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.long	0x7c
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF93
	.byte	0x1
	.byte	0x5d
	.byte	0xa
	.long	0xba
	.byte	0x20
	.uleb128 0x2
	.long	.LASF94
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.long	0x7c
	.byte	0x28
	.uleb128 0x2
	.long	.LASF95
	.byte	0x1
	.byte	0x5f
	.byte	0xa
	.long	0xba
	.byte	0x30
	.byte	0
	.uleb128 0x6
	.long	0x518
	.uleb128 0x6
	.long	0x49e
	.uleb128 0xd
	.long	.LASF96
	.byte	0x70
	.byte	0x1
	.byte	0x46
	.long	0x5ed
	.uleb128 0x2
	.long	.LASF88
	.byte	0x1
	.byte	0x47
	.byte	0x16
	.long	0x6ad
	.byte	0
	.uleb128 0x2
	.long	.LASF93
	.byte	0x1
	.byte	0x48
	.byte	0xa
	.long	0xba
	.byte	0x8
	.uleb128 0x2
	.long	.LASF97
	.byte	0x1
	.byte	0x49
	.byte	0xa
	.long	0xba
	.byte	0x10
	.uleb128 0x2
	.long	.LASF94
	.byte	0x1
	.byte	0x4a
	.byte	0x7
	.long	0x7c
	.byte	0x18
	.uleb128 0x2
	.long	.LASF98
	.byte	0x1
	.byte	0x4b
	.byte	0x7
	.long	0x7c
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF99
	.byte	0x1
	.byte	0x4c
	.byte	0xa
	.long	0xba
	.byte	0x20
	.uleb128 0x2
	.long	.LASF100
	.byte	0x1
	.byte	0x4d
	.byte	0xa
	.long	0xba
	.byte	0x28
	.uleb128 0x2
	.long	.LASF101
	.byte	0x1
	.byte	0x4e
	.byte	0xa
	.long	0xba
	.byte	0x30
	.uleb128 0x2
	.long	.LASF102
	.byte	0x1
	.byte	0x4f
	.byte	0xa
	.long	0xba
	.byte	0x38
	.uleb128 0x2
	.long	.LASF103
	.byte	0x1
	.byte	0x50
	.byte	0xb
	.long	0x2fc
	.byte	0x40
	.uleb128 0x2
	.long	.LASF104
	.byte	0x1
	.byte	0x51
	.byte	0x7
	.long	0x7c
	.byte	0x48
	.uleb128 0x2
	.long	.LASF105
	.byte	0x1
	.byte	0x52
	.byte	0xa
	.long	0x6b2
	.byte	0x50
	.uleb128 0x2
	.long	.LASF95
	.byte	0x1
	.byte	0x53
	.byte	0xa
	.long	0xba
	.byte	0x58
	.uleb128 0x2
	.long	.LASF106
	.byte	0x1
	.byte	0x54
	.byte	0x17
	.long	0x6bc
	.byte	0x60
	.uleb128 0x2
	.long	.LASF107
	.byte	0x1
	.byte	0x55
	.byte	0x7
	.long	0x7c
	.byte	0x68
	.byte	0
	.uleb128 0xd
	.long	.LASF108
	.byte	0x58
	.byte	0x1
	.byte	0xe8
	.long	0x6ad
	.uleb128 0x10
	.string	"id"
	.byte	0xe9
	.byte	0x7
	.long	0x7c
	.byte	0
	.uleb128 0x2
	.long	.LASF98
	.byte	0x1
	.byte	0xea
	.byte	0x7
	.long	0x7c
	.byte	0x4
	.uleb128 0x2
	.long	.LASF109
	.byte	0x1
	.byte	0xeb
	.byte	0x1d
	.long	0x9b0
	.byte	0x8
	.uleb128 0x2
	.long	.LASF110
	.byte	0x1
	.byte	0xec
	.byte	0x1c
	.long	0x9d4
	.byte	0x10
	.uleb128 0x2
	.long	.LASF111
	.byte	0x1
	.byte	0xed
	.byte	0xa
	.long	0xba
	.byte	0x18
	.uleb128 0x2
	.long	.LASF112
	.byte	0x1
	.byte	0xee
	.byte	0x7
	.long	0x7c
	.byte	0x20
	.uleb128 0x2
	.long	.LASF113
	.byte	0x1
	.byte	0xef
	.byte	0x7
	.long	0x7c
	.byte	0x24
	.uleb128 0x2
	.long	.LASF99
	.byte	0x1
	.byte	0xf0
	.byte	0xa
	.long	0xba
	.byte	0x28
	.uleb128 0x2
	.long	.LASF93
	.byte	0x1
	.byte	0xf1
	.byte	0xa
	.long	0xba
	.byte	0x30
	.uleb128 0x2
	.long	.LASF94
	.byte	0x1
	.byte	0xf2
	.byte	0x7
	.long	0x7c
	.byte	0x38
	.uleb128 0x2
	.long	.LASF114
	.byte	0x1
	.byte	0xf3
	.byte	0x7
	.long	0x7c
	.byte	0x3c
	.uleb128 0x10
	.string	"tag"
	.byte	0xf4
	.byte	0x7
	.long	0x7c
	.byte	0x40
	.uleb128 0x2
	.long	.LASF95
	.byte	0x1
	.byte	0xf5
	.byte	0xa
	.long	0xba
	.byte	0x48
	.uleb128 0x2
	.long	.LASF115
	.byte	0x1
	.byte	0xf6
	.byte	0x7
	.long	0x7c
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.long	0x5ed
	.uleb128 0x6
	.long	0x6b7
	.uleb128 0x6
	.long	0x7c
	.uleb128 0x6
	.long	0x6ad
	.uleb128 0x6
	.long	0x51d
	.uleb128 0xd
	.long	.LASF116
	.byte	0x10
	.byte	0x1
	.byte	0x61
	.long	0x6ed
	.uleb128 0x2
	.long	.LASF117
	.byte	0x1
	.byte	0x62
	.byte	0x16
	.long	0x6c1
	.byte	0
	.uleb128 0x2
	.long	.LASF118
	.byte	0x1
	.byte	0x63
	.byte	0x7
	.long	0x7c
	.byte	0x8
	.byte	0
	.uleb128 0x32
	.long	.LASF119
	.long	0x105008
	.byte	0x1
	.byte	0x65
	.byte	0x8
	.long	0x725
	.uleb128 0x10
	.string	"id"
	.byte	0x66
	.byte	0x7
	.long	0x7c
	.byte	0
	.uleb128 0x10
	.string	"key"
	.byte	0x67
	.byte	0x16
	.long	0x725
	.byte	0x4
	.uleb128 0x33
	.long	.LASF82
	.byte	0x1
	.byte	0x68
	.byte	0x18
	.long	0x736
	.long	0x101008
	.byte	0
	.uleb128 0x12
	.long	0x40a
	.long	0x736
	.uleb128 0x1c
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0x12
	.long	0x444
	.long	0x747
	.uleb128 0x1c
	.long	0x3a
	.value	0x3ff
	.byte	0
	.uleb128 0xd
	.long	.LASF120
	.byte	0x10
	.byte	0x1
	.byte	0x6a
	.long	0x77b
	.uleb128 0x2
	.long	.LASF119
	.byte	0x1
	.byte	0x6b
	.byte	0x13
	.long	0x77b
	.byte	0
	.uleb128 0x2
	.long	.LASF121
	.byte	0x1
	.byte	0x6c
	.byte	0x7
	.long	0x7c
	.byte	0x8
	.uleb128 0x2
	.long	.LASF122
	.byte	0x1
	.byte	0x6d
	.byte	0x7
	.long	0x7c
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.long	0x6ed
	.uleb128 0xd
	.long	.LASF123
	.byte	0x18
	.byte	0x1
	.byte	0xc2
	.long	0x7b4
	.uleb128 0x2
	.long	.LASF124
	.byte	0x1
	.byte	0xc3
	.byte	0xa
	.long	0xba
	.byte	0
	.uleb128 0x2
	.long	.LASF98
	.byte	0x1
	.byte	0xc4
	.byte	0xa
	.long	0xba
	.byte	0x8
	.uleb128 0x2
	.long	.LASF125
	.byte	0x1
	.byte	0xc5
	.byte	0x7
	.long	0x7c
	.byte	0x10
	.byte	0
	.uleb128 0x34
	.string	"ANF"
	.byte	0x28
	.byte	0x1
	.byte	0xc8
	.byte	0x8
	.long	0x802
	.uleb128 0x2
	.long	.LASF126
	.byte	0x1
	.byte	0xc9
	.byte	0x15
	.long	0x8cf
	.byte	0
	.uleb128 0x10
	.string	"anf"
	.byte	0xca
	.byte	0x16
	.long	0x90d
	.byte	0x8
	.uleb128 0x2
	.long	.LASF127
	.byte	0x1
	.byte	0xcb
	.byte	0x7
	.long	0x7c
	.byte	0x10
	.uleb128 0x2
	.long	.LASF128
	.byte	0x1
	.byte	0xcc
	.byte	0x1b
	.long	0x96d
	.byte	0x18
	.uleb128 0x2
	.long	.LASF129
	.byte	0x1
	.byte	0xcd
	.byte	0xd
	.long	0x2d4
	.byte	0x20
	.byte	0
	.uleb128 0xd
	.long	.LASF130
	.byte	0x68
	.byte	0x1
	.byte	0xd0
	.long	0x8cf
	.uleb128 0x2
	.long	.LASF124
	.byte	0x1
	.byte	0xd1
	.byte	0xa
	.long	0xba
	.byte	0
	.uleb128 0x10
	.string	"id"
	.byte	0xd2
	.byte	0x7
	.long	0x7c
	.byte	0x8
	.uleb128 0x2
	.long	.LASF131
	.byte	0x1
	.byte	0xd3
	.byte	0x16
	.long	0x972
	.byte	0x10
	.uleb128 0x2
	.long	.LASF132
	.byte	0x1
	.byte	0xd4
	.byte	0x7
	.long	0x7c
	.byte	0x18
	.uleb128 0x2
	.long	.LASF133
	.byte	0x1
	.byte	0xd5
	.byte	0x7
	.long	0x7c
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF134
	.byte	0x1
	.byte	0xd6
	.byte	0x17
	.long	0x6bc
	.byte	0x20
	.uleb128 0x2
	.long	.LASF109
	.byte	0x1
	.byte	0xd7
	.byte	0x1d
	.long	0x9b0
	.byte	0x28
	.uleb128 0x2
	.long	.LASF110
	.byte	0x1
	.byte	0xd8
	.byte	0x1c
	.long	0x9d4
	.byte	0x30
	.uleb128 0x10
	.string	"anf"
	.byte	0xd9
	.byte	0x17
	.long	0x90d
	.byte	0x38
	.uleb128 0x2
	.long	.LASF135
	.byte	0x1
	.byte	0xda
	.byte	0xa
	.long	0xba
	.byte	0x40
	.uleb128 0x2
	.long	.LASF136
	.byte	0x1
	.byte	0xdb
	.byte	0x1b
	.long	0xa0b
	.byte	0x48
	.uleb128 0x2
	.long	.LASF137
	.byte	0x1
	.byte	0xdc
	.byte	0x7
	.long	0x7c
	.byte	0x50
	.uleb128 0x2
	.long	.LASF138
	.byte	0x1
	.byte	0xdd
	.byte	0x16
	.long	0xa42
	.byte	0x58
	.uleb128 0x2
	.long	.LASF139
	.byte	0x1
	.byte	0xde
	.byte	0x7
	.long	0x7c
	.byte	0x60
	.uleb128 0x2
	.long	.LASF140
	.byte	0x1
	.byte	0xdf
	.byte	0x7
	.long	0x7c
	.byte	0x64
	.byte	0
	.uleb128 0x6
	.long	0x8d4
	.uleb128 0x6
	.long	0x802
	.uleb128 0x23
	.long	.LASF141
	.byte	0x18
	.value	0x114
	.long	0x90d
	.uleb128 0x9
	.long	.LASF134
	.value	0x115
	.byte	0x18
	.long	0x6bc
	.byte	0
	.uleb128 0x9
	.long	.LASF122
	.value	0x116
	.byte	0x7
	.long	0x7c
	.byte	0x8
	.uleb128 0x9
	.long	.LASF142
	.value	0x117
	.byte	0x1a
	.long	0xb12
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	0x8d9
	.uleb128 0x23
	.long	.LASF143
	.byte	0x28
	.value	0x11a
	.long	0x96d
	.uleb128 0x9
	.long	.LASF144
	.value	0x11b
	.byte	0x16
	.long	0x8cf
	.byte	0
	.uleb128 0x9
	.long	.LASF145
	.value	0x11c
	.byte	0x16
	.long	0x8cf
	.byte	0x8
	.uleb128 0x9
	.long	.LASF127
	.value	0x11d
	.byte	0x7
	.long	0x7c
	.byte	0x10
	.uleb128 0x9
	.long	.LASF146
	.value	0x11e
	.byte	0x7
	.long	0x7c
	.byte	0x14
	.uleb128 0x9
	.long	.LASF147
	.value	0x11f
	.byte	0x1c
	.long	0xa0b
	.byte	0x18
	.uleb128 0x9
	.long	.LASF129
	.value	0x120
	.byte	0xd
	.long	0x2d4
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.long	0x912
	.uleb128 0x6
	.long	0x977
	.uleb128 0x6
	.long	0x780
	.uleb128 0xd
	.long	.LASF148
	.byte	0x18
	.byte	0x1
	.byte	0xf9
	.long	0x9b0
	.uleb128 0x2
	.long	.LASF134
	.byte	0x1
	.byte	0xfa
	.byte	0x17
	.long	0x6bc
	.byte	0
	.uleb128 0x2
	.long	.LASF149
	.byte	0x1
	.byte	0xfb
	.byte	0x18
	.long	0xa4c
	.byte	0x8
	.uleb128 0x2
	.long	.LASF133
	.byte	0x1
	.byte	0xfc
	.byte	0x7
	.long	0x7c
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	0x9b5
	.uleb128 0x6
	.long	0x97c
	.uleb128 0xd
	.long	.LASF150
	.byte	0x4
	.byte	0x1
	.byte	0xff
	.long	0x9d4
	.uleb128 0x9
	.long	.LASF110
	.value	0x100
	.byte	0x7
	.long	0x7c
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x9ba
	.uleb128 0x23
	.long	.LASF151
	.byte	0x18
	.value	0x123
	.long	0xa0b
	.uleb128 0x24
	.string	"pc"
	.value	0x124
	.long	0x7c
	.byte	0
	.uleb128 0x9
	.long	.LASF152
	.value	0x125
	.byte	0x15
	.long	0x8d4
	.byte	0x8
	.uleb128 0x9
	.long	.LASF135
	.value	0x126
	.byte	0xa
	.long	0xba
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	0x9d9
	.uleb128 0xd
	.long	.LASF153
	.byte	0x18
	.byte	0x1
	.byte	0xe2
	.long	0xa42
	.uleb128 0x2
	.long	.LASF152
	.byte	0x1
	.byte	0xe3
	.byte	0x15
	.long	0x8d4
	.byte	0
	.uleb128 0x2
	.long	.LASF154
	.byte	0x1
	.byte	0xe4
	.byte	0x1c
	.long	0xa0b
	.byte	0x8
	.uleb128 0x10
	.string	"pc"
	.byte	0xe5
	.byte	0x7
	.long	0x7c
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	0xa47
	.uleb128 0x6
	.long	0xa10
	.uleb128 0x6
	.long	0x6bc
	.uleb128 0x23
	.long	.LASF155
	.byte	0x58
	.value	0x103
	.long	0xb12
	.uleb128 0x9
	.long	.LASF156
	.value	0x104
	.byte	0x9
	.long	0xba
	.byte	0
	.uleb128 0x24
	.string	"pos"
	.value	0x105
	.long	0x7c
	.byte	0x8
	.uleb128 0x9
	.long	.LASF157
	.value	0x106
	.byte	0xa
	.long	0xba
	.byte	0x10
	.uleb128 0x24
	.string	"end"
	.value	0x107
	.long	0x7c
	.byte	0x18
	.uleb128 0x9
	.long	.LASF158
	.value	0x108
	.byte	0x7
	.long	0x7c
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF159
	.value	0x109
	.byte	0x7
	.long	0x7c
	.byte	0x20
	.uleb128 0x9
	.long	.LASF126
	.value	0x10a
	.byte	0x15
	.long	0x8cf
	.byte	0x28
	.uleb128 0x9
	.long	.LASF127
	.value	0x10b
	.byte	0x7
	.long	0x7c
	.byte	0x30
	.uleb128 0x9
	.long	.LASF160
	.value	0x10c
	.byte	0x7
	.long	0x7c
	.byte	0x34
	.uleb128 0x9
	.long	.LASF109
	.value	0x10d
	.byte	0x1d
	.long	0x9b0
	.byte	0x38
	.uleb128 0x9
	.long	.LASF110
	.value	0x10e
	.byte	0x1c
	.long	0x9d4
	.byte	0x40
	.uleb128 0x9
	.long	.LASF161
	.value	0x10f
	.byte	0xa
	.long	0xba
	.byte	0x48
	.uleb128 0x9
	.long	.LASF162
	.value	0x110
	.byte	0x7
	.long	0x7c
	.byte	0x50
	.uleb128 0x9
	.long	.LASF115
	.value	0x111
	.byte	0x7
	.long	0x7c
	.byte	0x54
	.byte	0
	.uleb128 0x6
	.long	0x6c6
	.uleb128 0x35
	.long	.LASF164
	.byte	0x1
	.value	0x122
	.byte	0x19
	.long	0x96d
	.uleb128 0x9
	.byte	0x3
	.quad	CODEGEN_CONTEXT
	.uleb128 0x36
	.long	.LASF445
	.byte	0x7
	.value	0x1b7
	.byte	0xc
	.long	.LASF446
	.long	0x7c
	.long	0xb4f
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x19
	.byte	0
	.uleb128 0xb
	.long	.LASF165
	.byte	0xb
	.value	0x15e
	.byte	0xe
	.long	0xba
	.long	0xb6b
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x3
	.long	0x2f2
	.byte	0
	.uleb128 0xb
	.long	.LASF166
	.byte	0xb
	.value	0x164
	.byte	0xe
	.long	0xba
	.long	0xb87
	.uleb128 0x3
	.long	0xbf
	.uleb128 0x3
	.long	0x2f7
	.byte	0
	.uleb128 0xb
	.long	.LASF167
	.byte	0xc
	.value	0x166
	.byte	0xc
	.long	0x7c
	.long	0xb9e
	.uleb128 0x3
	.long	0x7c
	.byte	0
	.uleb128 0xb
	.long	.LASF168
	.byte	0xc
	.value	0x173
	.byte	0x10
	.long	0x2b2
	.long	0xbbf
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x2e
	.byte	0
	.uleb128 0xb
	.long	.LASF169
	.byte	0x7
	.value	0x329
	.byte	0xc
	.long	0x7c
	.long	0xbd6
	.uleb128 0x3
	.long	0x2be
	.byte	0
	.uleb128 0x37
	.long	.LASF170
	.byte	0xd
	.value	0x27d
	.byte	0xd
	.long	0xbe9
	.uleb128 0x3
	.long	0x7c
	.byte	0
	.uleb128 0xb
	.long	.LASF171
	.byte	0x7
	.value	0x15e
	.byte	0xc
	.long	0x7c
	.long	0xc06
	.uleb128 0x3
	.long	0x2c3
	.uleb128 0x3
	.long	0x2f7
	.uleb128 0x19
	.byte	0
	.uleb128 0xb
	.long	.LASF172
	.byte	0xb
	.value	0x1a3
	.byte	0xe
	.long	0xba
	.long	0xc1d
	.uleb128 0x3
	.long	0x7c
	.byte	0
	.uleb128 0xb
	.long	.LASF173
	.byte	0x7
	.value	0x2a3
	.byte	0xf
	.long	0x2e
	.long	0xc43
	.uleb128 0x3
	.long	0x4a
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x2c3
	.byte	0
	.uleb128 0xb
	.long	.LASF174
	.byte	0x7
	.value	0x2ce
	.byte	0x11
	.long	0x8f
	.long	0xc5a
	.uleb128 0x3
	.long	0x2be
	.byte	0
	.uleb128 0xb
	.long	.LASF175
	.byte	0x7
	.value	0x2c9
	.byte	0xc
	.long	0x7c
	.long	0xc7b
	.uleb128 0x3
	.long	0x2be
	.uleb128 0x3
	.long	0x8f
	.uleb128 0x3
	.long	0x7c
	.byte	0
	.uleb128 0xb
	.long	.LASF176
	.byte	0xb
	.value	0x197
	.byte	0xf
	.long	0x2e
	.long	0xc92
	.uleb128 0x3
	.long	0x2f2
	.byte	0
	.uleb128 0x26
	.long	.LASF184
	.byte	0xf
	.byte	0x25
	.byte	0xd
	.long	0x6b7
	.uleb128 0x15
	.long	.LASF177
	.byte	0xe
	.byte	0x39
	.byte	0xe
	.long	0x48
	.long	0xccd
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x96
	.byte	0
	.uleb128 0x15
	.long	.LASF178
	.byte	0x7
	.byte	0xb2
	.byte	0xc
	.long	0x7c
	.long	0xce3
	.uleb128 0x3
	.long	0x2be
	.byte	0
	.uleb128 0x15
	.long	.LASF179
	.byte	0x7
	.byte	0xe6
	.byte	0xc
	.long	0x7c
	.long	0xcf9
	.uleb128 0x3
	.long	0x2be
	.byte	0
	.uleb128 0xb
	.long	.LASF180
	.byte	0x7
	.value	0x2a9
	.byte	0xf
	.long	0x2e
	.long	0xd1f
	.uleb128 0x3
	.long	0x2e7
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x2c3
	.byte	0
	.uleb128 0xb
	.long	.LASF181
	.byte	0x7
	.value	0x102
	.byte	0xe
	.long	0x2be
	.long	0xd3b
	.uleb128 0x3
	.long	0x2f7
	.uleb128 0x3
	.long	0x2f7
	.byte	0
	.uleb128 0xb
	.long	.LASF182
	.byte	0x7
	.value	0x166
	.byte	0xc
	.long	0x7c
	.long	0xd58
	.uleb128 0x3
	.long	0xba
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x19
	.byte	0
	.uleb128 0x15
	.long	.LASF183
	.byte	0xe
	.byte	0x51
	.byte	0xc
	.long	0x7c
	.long	0xd78
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x7c
	.byte	0
	.uleb128 0x38
	.long	.LASF185
	.byte	0xc
	.value	0x3f3
	.byte	0xc
	.long	0x7c
	.uleb128 0x15
	.long	.LASF186
	.byte	0xd
	.byte	0xb1
	.byte	0x11
	.long	0x8f
	.long	0xda5
	.uleb128 0x3
	.long	0x2f7
	.uleb128 0x3
	.long	0x301
	.uleb128 0x3
	.long	0x7c
	.byte	0
	.uleb128 0x26
	.long	.LASF187
	.byte	0x10
	.byte	0x4f
	.byte	0x23
	.long	0xdb1
	.uleb128 0x6
	.long	0x2ed
	.uleb128 0x25
	.long	.LASF189
	.byte	0xa
	.value	0x3a7
	.byte	0x1
	.long	0xdc9
	.uleb128 0x3
	.long	0xdc9
	.byte	0
	.uleb128 0x6
	.long	0x3de
	.uleb128 0xb
	.long	.LASF188
	.byte	0xa
	.value	0x3a7
	.byte	0x1
	.long	0x405
	.long	0xde5
	.uleb128 0x3
	.long	0xde5
	.byte	0
	.uleb128 0x6
	.long	0x3f4
	.uleb128 0x25
	.long	.LASF190
	.byte	0xa
	.value	0x3a7
	.byte	0x1
	.long	0xdfd
	.uleb128 0x3
	.long	0xde5
	.byte	0
	.uleb128 0xb
	.long	.LASF191
	.byte	0xa
	.value	0x3a7
	.byte	0x1
	.long	0x7c
	.long	0xe32
	.uleb128 0x3
	.long	0xe32
	.uleb128 0x3
	.long	0x39a
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x371
	.uleb128 0x3
	.long	0xde5
	.uleb128 0x3
	.long	0xe37
	.byte	0
	.uleb128 0x6
	.long	0x3ea
	.uleb128 0x6
	.long	0x3cd
	.uleb128 0xb
	.long	.LASF192
	.byte	0xa
	.value	0x3a7
	.byte	0x1
	.long	0xde5
	.long	0xe58
	.uleb128 0x3
	.long	0xe32
	.uleb128 0x3
	.long	0xe58
	.byte	0
	.uleb128 0x6
	.long	0x3ab
	.uleb128 0xb
	.long	.LASF193
	.byte	0xa
	.value	0x3a7
	.byte	0x1
	.long	0xdc9
	.long	0xe8d
	.uleb128 0x3
	.long	0x39a
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x371
	.uleb128 0x3
	.long	0x6b7
	.uleb128 0x3
	.long	0x405
	.uleb128 0x3
	.long	0xe8d
	.byte	0
	.uleb128 0x6
	.long	0x3bc
	.uleb128 0x15
	.long	.LASF194
	.byte	0xb
	.byte	0x9c
	.byte	0xc
	.long	0x7c
	.long	0xead
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x3
	.long	0x2f2
	.byte	0
	.uleb128 0x25
	.long	.LASF195
	.byte	0xd
	.value	0x238
	.byte	0xd
	.long	0xec0
	.uleb128 0x3
	.long	0x48
	.byte	0
	.uleb128 0x15
	.long	.LASF196
	.byte	0xb
	.byte	0x3d
	.byte	0xe
	.long	0x48
	.long	0xee0
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x2e
	.byte	0
	.uleb128 0xb
	.long	.LASF197
	.byte	0xd
	.value	0x229
	.byte	0xe
	.long	0x48
	.long	0xef7
	.uleb128 0x3
	.long	0x2e
	.byte	0
	.uleb128 0x39
	.long	.LASF198
	.byte	0x2
	.byte	0x2e
	.byte	0xd
	.long	.LASF447
	.long	0xf22
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x7c
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x3
	.long	0x41
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x19
	.byte	0
	.uleb128 0xb
	.long	.LASF199
	.byte	0x7
	.value	0x164
	.byte	0xc
	.long	0x7c
	.long	0xf3a
	.uleb128 0x3
	.long	0x2f2
	.uleb128 0x19
	.byte	0
	.uleb128 0xb
	.long	.LASF200
	.byte	0xd
	.value	0x22c
	.byte	0xe
	.long	0x48
	.long	0xf56
	.uleb128 0x3
	.long	0x2e
	.uleb128 0x3
	.long	0x2e
	.byte	0
	.uleb128 0x15
	.long	.LASF201
	.byte	0xb
	.byte	0x2b
	.byte	0xe
	.long	0x48
	.long	0xf76
	.uleb128 0x3
	.long	0x48
	.uleb128 0x3
	.long	0x2e2
	.uleb128 0x3
	.long	0x2e
	.byte	0
	.uleb128 0xa
	.long	.LASF210
	.value	0x7b9
	.byte	0x5
	.long	0x7c
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x10e0
	.uleb128 0x7
	.long	.LASF202
	.value	0x7b9
	.byte	0xe
	.long	0x7c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8324
	.uleb128 0x7
	.long	.LASF203
	.value	0x7b9
	.byte	0x1a
	.long	0x2fc
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8336
	.uleb128 0x1
	.long	.LASF204
	.value	0x7bf
	.byte	0xa
	.long	0xba
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8288
	.uleb128 0x1
	.long	.LASF158
	.value	0x7c0
	.byte	0x8
	.long	0x8f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8280
	.uleb128 0x4
	.string	"f"
	.value	0x7c1
	.byte	0xa
	.long	0x2be
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8272
	.uleb128 0x5
	.quad	.LBB89
	.quad	.LBE89-.LBB89
	.uleb128 0x4
	.string	"ast"
	.value	0x7d5
	.byte	0x19
	.long	0x10e0
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8264
	.uleb128 0x1
	.long	.LASF205
	.value	0x7dd
	.byte	0x12
	.long	0x10e5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8256
	.uleb128 0x1
	.long	.LASF206
	.value	0x7ea
	.byte	0xb
	.long	0x2be
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8248
	.uleb128 0x1
	.long	.LASF207
	.value	0x7ef
	.byte	0xa
	.long	0x10ea
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8224
	.uleb128 0x1
	.long	.LASF129
	.value	0x7f8
	.byte	0xf
	.long	0x2d4
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8296
	.uleb128 0x1
	.long	.LASF208
	.value	0x7f9
	.byte	0xc
	.long	0xba
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8240
	.uleb128 0x1
	.long	.LASF209
	.value	0x804
	.byte	0xb
	.long	0x1100
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8232
	.uleb128 0x8
	.quad	.LBB90
	.quad	.LBE90-.LBB90
	.long	0x1098
	.uleb128 0x4
	.string	"x"
	.value	0x7d9
	.byte	0xe
	.long	0x7c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8308
	.byte	0
	.uleb128 0x8
	.quad	.LBB91
	.quad	.LBE91-.LBB91
	.long	0x10bd
	.uleb128 0x4
	.string	"x"
	.value	0x7df
	.byte	0xe
	.long	0x7c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8304
	.byte	0
	.uleb128 0x5
	.quad	.LBB92
	.quad	.LBE92-.LBB92
	.uleb128 0x4
	.string	"x"
	.value	0x7e7
	.byte	0xe
	.long	0x7c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -8300
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0xa51
	.uleb128 0x6
	.long	0x7b4
	.uleb128 0x12
	.long	0xc4
	.long	0x10fb
	.uleb128 0x1c
	.long	0x3a
	.value	0x1fff
	.byte	0
	.uleb128 0x3a
	.long	0x7c
	.uleb128 0x6
	.long	0x10fb
	.uleb128 0xa
	.long	.LASF211
	.value	0x7a3
	.byte	0x5
	.long	0x7c
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x1156
	.uleb128 0x17
	.string	"anf"
	.value	0x7a3
	.byte	0x21
	.long	0x90d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.quad	.LBB88
	.quad	.LBE88-.LBB88
	.uleb128 0x4
	.string	"x"
	.value	0x7a4
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF212
	.value	0x79d
	.byte	0x5
	.long	0x7c
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x11a7
	.uleb128 0x7
	.long	.LASF213
	.value	0x79d
	.byte	0x1e
	.long	0x10e0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.quad	.LBB87
	.quad	.LBE87-.LBB87
	.uleb128 0x4
	.string	"x"
	.value	0x79e
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF214
	.value	0x793
	.byte	0x5
	.long	0x7c
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x1206
	.uleb128 0x7
	.long	.LASF205
	.value	0x793
	.byte	0x1e
	.long	0x10e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.string	"pc"
	.value	0x794
	.byte	0x7
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.quad	.LBB86
	.quad	.LBE86-.LBB86
	.uleb128 0x4
	.string	"x"
	.value	0x796
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF215
	.value	0x784
	.byte	0x5
	.long	0x7c
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x1274
	.uleb128 0x17
	.string	"anf"
	.value	0x784
	.byte	0x2d
	.long	0x90d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF142
	.value	0x784
	.byte	0x49
	.long	0xb12
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF216
	.value	0x785
	.byte	0x15
	.long	0x1274
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF217
	.value	0x786
	.byte	0xb
	.long	0x2fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.long	.LASF218
	.value	0x787
	.byte	0x7
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x6
	.long	0x477
	.uleb128 0xa
	.long	.LASF219
	.value	0x757
	.byte	0x5
	.long	0x7c
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x13f3
	.uleb128 0x17
	.string	"anf"
	.value	0x757
	.byte	0x2c
	.long	0x90d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x7
	.long	.LASF216
	.value	0x757
	.byte	0x43
	.long	0x1274
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x7
	.long	.LASF142
	.value	0x757
	.byte	0x66
	.long	0xb12
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x7
	.long	.LASF220
	.value	0x757
	.byte	0x7e
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x7
	.long	.LASF218
	.value	0x757
	.byte	0x91
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x1
	.long	.LASF221
	.value	0x758
	.byte	0xb
	.long	0x2fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF222
	.value	0x75d
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.long	.LASF223
	.value	0x75e
	.byte	0x13
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF224
	.value	0x75f
	.byte	0x13
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.quad	.LBB80
	.quad	.LBE80-.LBB80
	.long	0x134c
	.uleb128 0x4
	.string	"x"
	.value	0x759
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.uleb128 0x8
	.quad	.LBB81
	.quad	.LBE81-.LBB81
	.long	0x1370
	.uleb128 0x4
	.string	"x"
	.value	0x761
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x5
	.quad	.LBB82
	.quad	.LBE82-.LBB82
	.uleb128 0x1
	.long	.LASF225
	.value	0x764
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.quad	.LBB83
	.quad	.LBE83-.LBB83
	.uleb128 0x4
	.string	"r"
	.value	0x765
	.byte	0xe
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x5
	.quad	.LBB84
	.quad	.LBE84-.LBB84
	.uleb128 0x1
	.long	.LASF226
	.value	0x769
	.byte	0x21
	.long	0x13f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.quad	.LBB85
	.quad	.LBE85-.LBB85
	.uleb128 0x1
	.long	.LASF95
	.value	0x774
	.byte	0x14
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x444
	.uleb128 0xa
	.long	.LASF227
	.value	0x70b
	.byte	0x14
	.long	0x1274
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x1645
	.uleb128 0x17
	.string	"anf"
	.value	0x70b
	.byte	0x33
	.long	0x90d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x7
	.long	.LASF142
	.value	0x70b
	.byte	0x4f
	.long	0xb12
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.long	.LASF228
	.value	0x70c
	.byte	0x15
	.long	0x77b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.long	.LASF229
	.value	0x70d
	.byte	0xd
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.long	.LASF230
	.value	0x70e
	.byte	0xc
	.long	0x6b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.long	.LASF94
	.value	0x70f
	.byte	0x9
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.long	.LASF85
	.value	0x727
	.byte	0x15
	.long	0x513
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF231
	.value	0x728
	.byte	0x9
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF216
	.value	0x750
	.byte	0x15
	.long	0x1274
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x8
	.quad	.LBB71
	.quad	.LBE71-.LBB71
	.long	0x14cc
	.uleb128 0x4
	.string	"i"
	.value	0x710
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.byte	0
	.uleb128 0x8
	.quad	.LBB72
	.quad	.LBE72-.LBB72
	.long	0x1540
	.uleb128 0x4
	.string	"x"
	.value	0x713
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x5
	.quad	.LBB73
	.quad	.LBE73-.LBB73
	.uleb128 0x4
	.string	"r"
	.value	0x717
	.byte	0x10
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x5
	.quad	.LBB74
	.quad	.LBE74-.LBB74
	.uleb128 0x1
	.long	.LASF232
	.value	0x718
	.byte	0x10
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF226
	.value	0x71b
	.byte	0x1f
	.long	0x13f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.quad	.LBB75
	.quad	.LBE75-.LBB75
	.uleb128 0x4
	.string	"v"
	.value	0x729
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x5
	.quad	.LBB76
	.quad	.LBE76-.LBB76
	.uleb128 0x1
	.long	.LASF233
	.value	0x72a
	.byte	0xe
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF234
	.value	0x72b
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.long	.LASF89
	.value	0x72c
	.byte	0x1a
	.long	0x6c1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF90
	.value	0x72d
	.byte	0x1a
	.long	0x6c1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.long	.LASF235
	.value	0x72e
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x1
	.long	.LASF94
	.value	0x72f
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x1
	.long	.LASF236
	.value	0x744
	.byte	0x15
	.long	0x518
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.quad	.LBB77
	.quad	.LBE77-.LBB77
	.long	0x1602
	.uleb128 0x4
	.string	"x"
	.value	0x730
	.byte	0x10
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.uleb128 0x5
	.quad	.LBB78
	.quad	.LBE78-.LBB78
	.uleb128 0x4
	.string	"x"
	.value	0x737
	.byte	0x10
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x5
	.quad	.LBB79
	.quad	.LBE79-.LBB79
	.uleb128 0x4
	.string	"y"
	.value	0x73c
	.byte	0x12
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF237
	.value	0x607
	.byte	0x19
	.long	0xb12
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b6a
	.uleb128 0x17
	.string	"anf"
	.value	0x607
	.byte	0x3c
	.long	0x90d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -792
	.uleb128 0x1
	.long	.LASF117
	.value	0x608
	.byte	0x17
	.long	0x6c1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -656
	.uleb128 0x1
	.long	.LASF238
	.value	0x60c
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -776
	.uleb128 0x1
	.long	.LASF239
	.value	0x60d
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -772
	.uleb128 0x1
	.long	.LASF142
	.value	0x704
	.byte	0x1b
	.long	0xb12
	.uleb128 0x3
	.byte	0x91
	.sleb128 -648
	.uleb128 0x8
	.quad	.LBB62
	.quad	.LBE62-.LBB62
	.long	0x16db
	.uleb128 0x4
	.string	"x"
	.value	0x609
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -780
	.byte	0
	.uleb128 0x8
	.quad	.LBB63
	.quad	.LBE63-.LBB63
	.long	0x1b49
	.uleb128 0x4
	.string	"x"
	.value	0x60f
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -768
	.uleb128 0x5
	.quad	.LBB64
	.quad	.LBE64-.LBB64
	.uleb128 0x4
	.string	"key"
	.value	0x612
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x1
	.long	.LASF240
	.value	0x619
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0x1
	.long	.LASF241
	.value	0x621
	.byte	0xe
	.long	0x1b6a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x1
	.long	.LASF242
	.value	0x623
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -764
	.uleb128 0x1
	.long	.LASF243
	.value	0x624
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -760
	.uleb128 0x1
	.long	.LASF244
	.value	0x625
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -756
	.uleb128 0x1
	.long	.LASF245
	.value	0x626
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -752
	.uleb128 0x1
	.long	.LASF103
	.value	0x627
	.byte	0x11
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x1
	.long	.LASF105
	.value	0x628
	.byte	0x10
	.long	0x6b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x1
	.long	.LASF106
	.value	0x629
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x1
	.long	.LASF246
	.value	0x62a
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -748
	.uleb128 0x1
	.long	.LASF102
	.value	0x64b
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x1
	.long	.LASF247
	.value	0x679
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -680
	.uleb128 0x1
	.long	.LASF248
	.value	0x680
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -456
	.uleb128 0x1
	.long	.LASF249
	.value	0x686
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0x1
	.long	.LASF250
	.value	0x689
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -692
	.uleb128 0x1
	.long	.LASF251
	.value	0x68a
	.byte	0x11
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -440
	.uleb128 0x1
	.long	.LASF252
	.value	0x68b
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x1
	.long	.LASF253
	.value	0x68c
	.byte	0x10
	.long	0x6b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -424
	.uleb128 0x1
	.long	.LASF254
	.value	0x68d
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -688
	.uleb128 0x1
	.long	.LASF255
	.value	0x68e
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -684
	.uleb128 0x1
	.long	.LASF256
	.value	0x68f
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x1
	.long	.LASF257
	.value	0x697
	.byte	0xf
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
	.uleb128 0x1
	.long	.LASF258
	.value	0x6a1
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0x1
	.long	.LASF259
	.value	0x6a9
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -576
	.uleb128 0x1
	.long	.LASF260
	.value	0x6b2
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -716
	.uleb128 0x1
	.long	.LASF261
	.value	0x6b3
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -712
	.uleb128 0x1
	.long	.LASF262
	.value	0x6b4
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -708
	.uleb128 0x1
	.long	.LASF263
	.value	0x6b5
	.byte	0x11
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0x1
	.long	.LASF264
	.value	0x6b6
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -560
	.uleb128 0x1
	.long	.LASF265
	.value	0x6b7
	.byte	0x10
	.long	0x6b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0x1
	.long	.LASF266
	.value	0x6b8
	.byte	0xf
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -664
	.uleb128 0x1
	.long	.LASF267
	.value	0x6b9
	.byte	0xf
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -544
	.uleb128 0x1
	.long	.LASF268
	.value	0x6ba
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -536
	.uleb128 0x1
	.long	.LASF269
	.value	0x6bb
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0x1
	.long	.LASF270
	.value	0x6cc
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0x1
	.long	.LASF271
	.value	0x6d4
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -640
	.uleb128 0x1
	.long	.LASF272
	.value	0x6dc
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -632
	.uleb128 0x1
	.long	.LASF273
	.value	0x6e4
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -728
	.uleb128 0x1
	.long	.LASF274
	.value	0x6e5
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -724
	.uleb128 0x1
	.long	.LASF275
	.value	0x6e6
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -720
	.uleb128 0x1
	.long	.LASF276
	.value	0x6e7
	.byte	0x11
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -624
	.uleb128 0x1
	.long	.LASF277
	.value	0x6e8
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -616
	.uleb128 0x1
	.long	.LASF278
	.value	0x6e9
	.byte	0x10
	.long	0x6b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -608
	.uleb128 0x1
	.long	.LASF279
	.value	0x6ea
	.byte	0xf
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -600
	.uleb128 0x1
	.long	.LASF280
	.value	0x6eb
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -592
	.uleb128 0x1
	.long	.LASF281
	.value	0x6f7
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -584
	.uleb128 0x8
	.quad	.LBB65
	.quad	.LBE65-.LBB65
	.long	0x1a95
	.uleb128 0x4
	.string	"y"
	.value	0x62d
	.byte	0x12
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -744
	.uleb128 0x5
	.quad	.LBB66
	.quad	.LBE66-.LBB66
	.uleb128 0x4
	.string	"e"
	.value	0x62e
	.byte	0x16
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -740
	.uleb128 0x5
	.quad	.LBB67
	.quad	.LBE67-.LBB67
	.uleb128 0x1
	.long	.LASF282
	.value	0x62f
	.byte	0x16
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x1
	.long	.LASF283
	.value	0x633
	.byte	0x15
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.uleb128 0x5
	.quad	.LBB68
	.quad	.LBE68-.LBB68
	.uleb128 0x4
	.string	"c"
	.value	0x636
	.byte	0x18
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -736
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.quad	.LBB69
	.quad	.LBE69-.LBB69
	.uleb128 0x1
	.long	.LASF284
	.value	0x65a
	.byte	0x12
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -512
	.uleb128 0x1
	.long	.LASF285
	.value	0x660
	.byte	0x12
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -504
	.uleb128 0x1
	.long	.LASF103
	.value	0x661
	.byte	0x13
	.long	0x2fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x1
	.long	.LASF105
	.value	0x662
	.byte	0x12
	.long	0x6b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -488
	.uleb128 0x1
	.long	.LASF286
	.value	0x663
	.byte	0x20
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0x1
	.long	.LASF287
	.value	0x664
	.byte	0xf
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -704
	.uleb128 0x1
	.long	.LASF288
	.value	0x665
	.byte	0xf
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -700
	.uleb128 0x1
	.long	.LASF289
	.value	0x666
	.byte	0xf
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -696
	.uleb128 0x1
	.long	.LASF290
	.value	0x66a
	.byte	0x12
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -472
	.uleb128 0x1
	.long	.LASF291
	.value	0x66c
	.byte	0x11
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -464
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.quad	.LBB70
	.quad	.LBE70-.LBB70
	.uleb128 0x4
	.string	"x"
	.value	0x701
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -732
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0xc4
	.long	0x1b7b
	.uleb128 0x1c
	.long	0x3a
	.value	0x12b
	.byte	0
	.uleb128 0xa
	.long	.LASF292
	.value	0x5ba
	.byte	0x5
	.long	0x7c
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x1d1d
	.uleb128 0x7
	.long	.LASF205
	.value	0x5ba
	.byte	0x19
	.long	0x10e5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.long	.LASF128
	.value	0x5bb
	.byte	0x1b
	.long	0x96d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.long	.LASF144
	.value	0x5c0
	.byte	0x16
	.long	0x8cf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF146
	.value	0x5c1
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x1
	.long	.LASF293
	.value	0x5c2
	.byte	0x15
	.long	0x8d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.long	.LASF294
	.value	0x5e8
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.long	.LASF147
	.value	0x5f2
	.byte	0x1c
	.long	0xa0b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.string	"fp"
	.value	0x5fe
	.byte	0xa
	.long	0x2be
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x8
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.long	0x1cd8
	.uleb128 0x4
	.string	"x"
	.value	0x5cf
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x5
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.uleb128 0x1
	.long	.LASF154
	.value	0x5d1
	.byte	0x1e
	.long	0xa0b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF295
	.value	0x5d2
	.byte	0xb
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x8
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.long	0x1c92
	.uleb128 0x4
	.string	"n"
	.value	0x5e3
	.byte	0xf
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0x27
	.long	0x331f
	.quad	.LBB57
	.quad	.LBE57-.LBB57
	.value	0x5d9
	.byte	0x8
	.uleb128 0xc
	.long	0x3354
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	0x3349
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xc
	.long	0x333e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.long	0x3333
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0xc
	.long	0x3328
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	0x331f
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.value	0x5f0
	.byte	0x5
	.uleb128 0xc
	.long	0x3354
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	0x3349
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0xc
	.long	0x333e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	0x3333
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xc
	.long	0x3328
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF296
	.value	0x599
	.byte	0x5
	.long	0x7c
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x1df1
	.uleb128 0x7
	.long	.LASF297
	.value	0x599
	.byte	0x16
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.uleb128 0x1
	.long	.LASF152
	.value	0x59a
	.byte	0x15
	.long	0x8d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x1
	.long	.LASF298
	.value	0x5a0
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x1
	.long	.LASF124
	.value	0x5ad
	.byte	0x8
	.long	0x1df1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x1
	.long	.LASF299
	.value	0x5b2
	.byte	0x8
	.long	0x1df1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x4
	.string	"fp"
	.value	0x5b4
	.byte	0xa
	.long	0x2be
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x5
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.uleb128 0x4
	.string	"x"
	.value	0x5a3
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x5
	.quad	.LBB54
	.quad	.LBE54-.LBB54
	.uleb128 0x1
	.long	.LASF300
	.value	0x5a5
	.byte	0x16
	.long	0xa47
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x1
	.long	.LASF159
	.value	0x5a6
	.byte	0xc
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0xc4
	.long	0x1e01
	.uleb128 0x21
	.long	0x3a
	.byte	0x63
	.byte	0
	.uleb128 0xa
	.long	.LASF301
	.value	0x591
	.byte	0x5
	.long	0x7c
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e61
	.uleb128 0x7
	.long	.LASF124
	.value	0x591
	.byte	0x1e
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.long	.LASF135
	.value	0x591
	.byte	0x2b
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.uleb128 0x4
	.string	"n"
	.value	0x593
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF302
	.value	0x459
	.byte	0x5
	.long	0x7c
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x2273
	.uleb128 0x7
	.long	.LASF136
	.value	0x459
	.byte	0x27
	.long	0x96d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x7
	.long	.LASF154
	.value	0x459
	.byte	0x49
	.long	0xa0b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x17
	.string	"anf"
	.value	0x459
	.byte	0x6f
	.long	0x90d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x5
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.uleb128 0x4
	.string	"x"
	.value	0x45a
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x5
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.uleb128 0x1
	.long	.LASF303
	.value	0x45e
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x1
	.long	.LASF304
	.value	0x45f
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.long	.LASF305
	.value	0x460
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.uleb128 0x1
	.long	.LASF306
	.value	0x463
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.long	.LASF307
	.value	0x464
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x1
	.long	.LASF308
	.value	0x465
	.byte	0x1e
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF309
	.value	0x466
	.byte	0x1e
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.long	.LASF310
	.value	0x467
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.long	.LASF152
	.value	0x468
	.byte	0x1c
	.long	0x8d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.long	.LASF311
	.value	0x46d
	.byte	0x1e
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.long	.LASF312
	.value	0x4bc
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x1
	.long	.LASF313
	.value	0x4bd
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x1
	.long	.LASF314
	.value	0x4bf
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x1
	.long	.LASF315
	.value	0x4c0
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x1
	.long	.LASF100
	.value	0x4c2
	.byte	0x1e
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1
	.long	.LASF101
	.value	0x4c3
	.byte	0x1e
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1
	.long	.LASF316
	.value	0x4c4
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1
	.long	.LASF317
	.value	0x4c5
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.long	.LASF318
	.value	0x4c9
	.byte	0x11
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.long	.LASF319
	.value	0x4d4
	.byte	0x18
	.long	0x3a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1
	.long	.LASF320
	.value	0x4d5
	.byte	0x18
	.long	0x3a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x8
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.long	0x20ef
	.uleb128 0x1
	.long	.LASF159
	.value	0x47a
	.byte	0x15
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF298
	.value	0x47b
	.byte	0x15
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x1
	.long	.LASF321
	.value	0x485
	.byte	0x15
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF322
	.value	0x486
	.byte	0x15
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x8
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.long	0x20aa
	.uleb128 0x4
	.string	"n"
	.value	0x48e
	.byte	0x17
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.byte	0
	.uleb128 0x8
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.long	0x20ce
	.uleb128 0x4
	.string	"n"
	.value	0x491
	.byte	0x17
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.byte	0
	.uleb128 0x5
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.uleb128 0x4
	.string	"i"
	.value	0x494
	.byte	0x17
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.long	0x2152
	.uleb128 0x1
	.long	.LASF159
	.value	0x49b
	.byte	0x13
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF298
	.value	0x49c
	.byte	0x13
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x1
	.long	.LASF323
	.value	0x4a5
	.byte	0x13
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF324
	.value	0x4a6
	.byte	0x13
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x1
	.long	.LASF300
	.value	0x4ac
	.byte	0x1d
	.long	0xa47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x8
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.long	0x2176
	.uleb128 0x4
	.string	"n"
	.value	0x54b
	.byte	0x13
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -276
	.byte	0
	.uleb128 0x5
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.uleb128 0x1
	.long	.LASF325
	.value	0x553
	.byte	0x12
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x1
	.long	.LASF326
	.value	0x554
	.byte	0x12
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x1
	.long	.LASF327
	.value	0x555
	.byte	0x15
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.long	.LASF328
	.value	0x556
	.byte	0x12
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x4
	.string	"reg"
	.value	0x566
	.byte	0x1c
	.long	0x3a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF329
	.value	0x57b
	.byte	0x14
	.long	0x6b7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x1
	.long	.LASF330
	.value	0x57c
	.byte	0x15
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.long	.LASF331
	.value	0x57e
	.byte	0x12
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -236
	.uleb128 0x8
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.long	0x222b
	.uleb128 0x4
	.string	"y"
	.value	0x563
	.byte	0x17
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.byte	0
	.uleb128 0x8
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.long	0x224f
	.uleb128 0x4
	.string	"n"
	.value	0x584
	.byte	0x17
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -268
	.byte	0
	.uleb128 0x5
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.uleb128 0x4
	.string	"n"
	.value	0x587
	.byte	0x17
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF332
	.value	0x44a
	.byte	0x13
	.long	0x8d4
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x22f6
	.uleb128 0x7
	.long	.LASF136
	.value	0x44a
	.byte	0x38
	.long	0x96d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.long	.LASF333
	.value	0x44a
	.byte	0x48
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.long	0x22d6
	.uleb128 0x4
	.string	"x"
	.value	0x44c
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.uleb128 0x4
	.string	"x"
	.value	0x452
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF334
	.value	0x42d
	.byte	0xe
	.long	0x10e5
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x240c
	.uleb128 0x7
	.long	.LASF213
	.value	0x42d
	.byte	0x2d
	.long	0x10e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.long	.LASF335
	.value	0x42e
	.byte	0x10
	.long	0x10e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.string	"anf"
	.value	0x42f
	.byte	0x17
	.long	0x90d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF134
	.value	0x437
	.byte	0x18
	.long	0x6bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x2379
	.uleb128 0x4
	.string	"x"
	.value	0x432
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x8
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x23ec
	.uleb128 0x4
	.string	"x"
	.value	0x43a
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x5
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.uleb128 0x1
	.long	.LASF336
	.value	0x43b
	.byte	0x19
	.long	0x90d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF337
	.value	0x43c
	.byte	0x1a
	.long	0x6bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.uleb128 0x4
	.string	"y"
	.value	0x440
	.byte	0xe
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x5
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.uleb128 0x4
	.string	"y"
	.value	0x444
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF338
	.value	0x422
	.byte	0x5
	.long	0x7c
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x248b
	.uleb128 0x17
	.string	"anf"
	.value	0x422
	.byte	0x24
	.long	0x90d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.long	.LASF134
	.value	0x422
	.byte	0x42
	.long	0x9b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.uleb128 0x4
	.string	"x"
	.value	0x423
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.uleb128 0x4
	.string	"y"
	.value	0x426
	.byte	0xe
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF339
	.value	0x40d
	.byte	0x5
	.long	0x7c
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x24ff
	.uleb128 0x7
	.long	.LASF152
	.value	0x40d
	.byte	0x24
	.long	0x8d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x8
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.long	0x24df
	.uleb128 0x4
	.string	"x"
	.value	0x410
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.uleb128 0x4
	.string	"x"
	.value	0x415
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF340
	.value	0x3e7
	.byte	0x15
	.long	0x10e0
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x25e2
	.uleb128 0x7
	.long	.LASF158
	.value	0x3e7
	.byte	0x1f
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -228
	.uleb128 0x7
	.long	.LASF157
	.value	0x3e7
	.byte	0x2e
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x1
	.long	.LASF213
	.value	0x3e8
	.byte	0x18
	.long	0x10e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1
	.long	.LASF110
	.value	0x3e9
	.byte	0x1e
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x1
	.long	.LASF109
	.value	0x3ea
	.byte	0x1d
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1
	.long	.LASF341
	.value	0x3eb
	.byte	0x1c
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1
	.long	.LASF156
	.value	0x3f2
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.long	.LASF342
	.value	0x3f9
	.byte	0x17
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x1
	.long	.LASF343
	.value	0x3fe
	.byte	0xa
	.long	0x25e2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1
	.long	.LASF126
	.value	0x405
	.byte	0x15
	.long	0x8cf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x5
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.uleb128 0x4
	.string	"x"
	.value	0x400
	.byte	0xc
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -220
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0xba
	.long	0x25f2
	.uleb128 0x21
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.long	.LASF344
	.value	0x372
	.byte	0x16
	.long	0x10e0
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x2820
	.uleb128 0x7
	.long	.LASF345
	.value	0x373
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x7
	.long	.LASF341
	.value	0x374
	.byte	0x1b
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x7
	.long	.LASF110
	.value	0x375
	.byte	0x1d
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x7
	.long	.LASF346
	.value	0x376
	.byte	0x1c
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x7
	.long	.LASF213
	.value	0x377
	.byte	0x17
	.long	0x10e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x28
	.long	.LASF134
	.value	0x37a
	.byte	0x17
	.long	0x6bc
	.uleb128 0x1
	.long	.LASF347
	.value	0x37c
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x5
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.uleb128 0x1
	.long	.LASF333
	.value	0x382
	.byte	0xe
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.long	.LASF152
	.value	0x383
	.byte	0x18
	.long	0x8d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.long	.LASF138
	.value	0x384
	.byte	0x19
	.long	0xa42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1
	.long	.LASF131
	.value	0x389
	.byte	0x1a
	.long	0x972
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.long	.LASF348
	.value	0x38d
	.byte	0xe
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.long	.LASF349
	.value	0x3ad
	.byte	0xe
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.long	.LASF350
	.value	0x3b2
	.byte	0x1b
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x1
	.long	.LASF351
	.value	0x3b3
	.byte	0x22
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF352
	.value	0x3b4
	.byte	0x20
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.long	.LASF353
	.value	0x3b5
	.byte	0x1f
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.long	.LASF354
	.value	0x3bf
	.byte	0x21
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.long	.LASF355
	.value	0x3cc
	.byte	0x1b
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.long	.LASF356
	.value	0x3cd
	.byte	0x22
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF357
	.value	0x3ce
	.byte	0x21
	.long	0x9b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF358
	.value	0x3cf
	.byte	0x20
	.long	0x9d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF88
	.value	0x3d0
	.byte	0x1c
	.long	0x6bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF359
	.value	0x3da
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1
	.long	.LASF360
	.value	0x3de
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.uleb128 0x1
	.long	.LASF134
	.value	0x3df
	.byte	0x21
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0x1
	.long	.LASF98
	.value	0x393
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1
	.long	.LASF124
	.value	0x39b
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF361
	.value	0x39d
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.long	.LASF362
	.value	0x39f
	.byte	0x1b
	.long	0x977
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x4
	.string	"pos"
	.value	0x3a6
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -212
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF363
	.value	0x284
	.byte	0x1c
	.long	0x9b0
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x2c14
	.uleb128 0x7
	.long	.LASF345
	.value	0x285
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
	.uleb128 0x7
	.long	.LASF341
	.value	0x286
	.byte	0x1b
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x7
	.long	.LASF110
	.value	0x287
	.byte	0x1d
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -424
	.uleb128 0x7
	.long	.LASF346
	.value	0x288
	.byte	0x1c
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0x7
	.long	.LASF213
	.value	0x289
	.byte	0x17
	.long	0x10e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -440
	.uleb128 0x7
	.long	.LASF364
	.value	0x28a
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -444
	.uleb128 0x7
	.long	.LASF365
	.value	0x28b
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -456
	.uleb128 0x1
	.long	.LASF347
	.value	0x28c
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x5
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.uleb128 0x1
	.long	.LASF366
	.value	0x296
	.byte	0x13
	.long	0x3a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x5
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0x1
	.long	.LASF367
	.value	0x29c
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x1
	.long	.LASF368
	.value	0x29d
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x1
	.long	.LASF369
	.value	0x29e
	.byte	0x24
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x1
	.long	.LASF370
	.value	0x29f
	.byte	0x24
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x1
	.long	.LASF371
	.value	0x2a0
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0x1
	.long	.LASF372
	.value	0x2a1
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x1
	.long	.LASF373
	.value	0x2a2
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x1
	.long	.LASF358
	.value	0x2a3
	.byte	0x22
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x1
	.long	.LASF374
	.value	0x2a4
	.byte	0x22
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x1
	.long	.LASF375
	.value	0x2a5
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x1
	.long	.LASF376
	.value	0x2c1
	.byte	0x23
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF377
	.value	0x2c2
	.byte	0x22
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.long	.LASF378
	.value	0x2c3
	.byte	0x21
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1
	.long	.LASF379
	.value	0x2ca
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.long	.LASF380
	.value	0x2d3
	.byte	0x1d
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.long	.LASF381
	.value	0x2df
	.byte	0x23
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x1
	.long	.LASF352
	.value	0x2e0
	.byte	0x22
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x1
	.long	.LASF382
	.value	0x2e1
	.byte	0x21
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x1
	.long	.LASF383
	.value	0x2e8
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x1
	.long	.LASF384
	.value	0x2f1
	.byte	0x1d
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x1
	.long	.LASF385
	.value	0x2fc
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x1
	.long	.LASF386
	.value	0x2fd
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.uleb128 0x1
	.long	.LASF387
	.value	0x2fe
	.byte	0x24
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x1
	.long	.LASF388
	.value	0x2ff
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x1
	.long	.LASF389
	.value	0x300
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x1
	.long	.LASF390
	.value	0x30c
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1
	.long	.LASF391
	.value	0x30d
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -396
	.uleb128 0x1
	.long	.LASF392
	.value	0x30e
	.byte	0x1f
	.long	0xa4c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.long	.LASF351
	.value	0x310
	.byte	0x24
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.long	.LASF393
	.value	0x311
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1
	.long	.LASF394
	.value	0x312
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.long	.LASF395
	.value	0x316
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.long	.LASF396
	.value	0x317
	.byte	0x22
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1
	.long	.LASF397
	.value	0x319
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.long	.LASF365
	.value	0x32a
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.long	.LASF398
	.value	0x342
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x1
	.long	.LASF399
	.value	0x343
	.byte	0x23
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1
	.long	.LASF400
	.value	0x344
	.byte	0x24
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x1
	.long	.LASF401
	.value	0x345
	.byte	0x1e
	.long	0x6bc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x1
	.long	.LASF402
	.value	0x346
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1
	.long	.LASF355
	.value	0x34f
	.byte	0x1d
	.long	0x6ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF403
	.value	0x353
	.byte	0x10
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x1
	.long	.LASF356
	.value	0x358
	.byte	0x23
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF357
	.value	0x359
	.byte	0x22
	.long	0x9b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF353
	.value	0x35a
	.byte	0x21
	.long	0x9d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF404
	.value	0x35b
	.byte	0x1d
	.long	0x6bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF359
	.value	0x367
	.byte	0xd
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -388
	.uleb128 0x5
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.uleb128 0x1
	.long	.LASF361
	.value	0x32e
	.byte	0x12
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x4
	.string	"pos"
	.value	0x332
	.byte	0xf
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF405
	.value	0x26a
	.byte	0x5
	.long	0x7c
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x2cc2
	.uleb128 0x7
	.long	.LASF110
	.value	0x26a
	.byte	0x27
	.long	0x9b0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x7
	.long	.LASF341
	.value	0x26a
	.byte	0x4b
	.long	0x9d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x7
	.long	.LASF98
	.value	0x26a
	.byte	0x60
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x7
	.long	.LASF213
	.value	0x26a
	.byte	0x7b
	.long	0x10e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1
	.long	.LASF376
	.value	0x26b
	.byte	0x21
	.long	0x9b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.long	.LASF377
	.value	0x26c
	.byte	0x20
	.long	0x9b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF378
	.value	0x26d
	.byte	0x1f
	.long	0x9d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF379
	.value	0x274
	.byte	0x1b
	.long	0x6ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.long	.LASF380
	.value	0x27c
	.byte	0x1b
	.long	0x6bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.long	.LASF406
	.value	0x264
	.byte	0x8
	.long	0xba
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x2d12
	.uleb128 0x7
	.long	.LASF213
	.value	0x264
	.byte	0x23
	.long	0x10e0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.long	.LASF345
	.value	0x264
	.byte	0x38
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF347
	.value	0x265
	.byte	0xa
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.long	.LASF407
	.value	0x165
	.byte	0x8
	.long	0xba
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f4a
	.uleb128 0x7
	.long	.LASF213
	.value	0x165
	.byte	0x24
	.long	0x10e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x7
	.long	.LASF345
	.value	0x165
	.byte	0x39
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x4
	.string	"re"
	.value	0x1a5
	.byte	0xf
	.long	0xdc9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1
	.long	.LASF408
	.value	0x1a6
	.byte	0xe
	.long	0x39a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1
	.long	.LASF409
	.value	0x1a7
	.byte	0xe
	.long	0x39a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x28
	.long	.LASF410
	.value	0x1a8
	.byte	0xe
	.long	0x39a
	.uleb128 0x1
	.long	.LASF411
	.value	0x1a9
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x1
	.long	.LASF412
	.value	0x1aa
	.byte	0xe
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1
	.long	.LASF413
	.value	0x1ab
	.byte	0xf
	.long	0x405
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.string	"i"
	.value	0x1ac
	.byte	0x7
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1
	.long	.LASF414
	.value	0x1ae
	.byte	0xa
	.long	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1
	.long	.LASF415
	.value	0x1b1
	.byte	0xa
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1
	.long	.LASF416
	.value	0x1b5
	.byte	0x15
	.long	0xde5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x4
	.string	"rc"
	.value	0x1c1
	.byte	0x8
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x8
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.long	0x2eb5
	.uleb128 0x1
	.long	.LASF417
	.value	0x1cb
	.byte	0x9
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x1
	.long	.LASF355
	.value	0x1cc
	.byte	0xc
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.long	.LASF122
	.value	0x1ce
	.byte	0x9
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1
	.long	.LASF418
	.value	0x1f8
	.byte	0x9
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x8
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.long	0x2e94
	.uleb128 0x1
	.long	.LASF419
	.value	0x1e5
	.byte	0x14
	.long	0x39a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF420
	.value	0x1e6
	.byte	0x10
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.uleb128 0x4
	.string	"c"
	.value	0x1f9
	.byte	0xe
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.byte	0
	.uleb128 0x5
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.uleb128 0x1
	.long	.LASF421
	.value	0x208
	.byte	0xc
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x5
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.uleb128 0x1
	.long	.LASF417
	.value	0x223
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1
	.long	.LASF355
	.value	0x224
	.byte	0xe
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.long	.LASF122
	.value	0x226
	.byte	0xb
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x5
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x1
	.long	.LASF419
	.value	0x23d
	.byte	0x16
	.long	0x39a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.long	.LASF420
	.value	0x23e
	.byte	0x12
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF422
	.value	0x156
	.byte	0x8
	.long	0xba
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x2f8b
	.uleb128 0x7
	.long	.LASF213
	.value	0x156
	.byte	0x24
	.long	0x10e0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF156
	.value	0x158
	.byte	0xa
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.long	.LASF423
	.value	0x12b
	.byte	0x5
	.long	0x7c
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x307d
	.uleb128 0x7
	.long	.LASF122
	.value	0x12b
	.byte	0x1a
	.long	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x7
	.long	.LASF109
	.value	0x12b
	.byte	0x3a
	.long	0x9b5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.long	.LASF424
	.value	0x12c
	.byte	0xa
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.long	.LASF133
	.value	0x131
	.byte	0x7
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.long	.LASF134
	.value	0x133
	.byte	0x17
	.long	0x6bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.long	0x301d
	.uleb128 0x4
	.string	"x"
	.value	0x12e
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x5
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x4
	.string	"x"
	.value	0x134
	.byte	0xc
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x5
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x1
	.long	.LASF88
	.value	0x135
	.byte	0x18
	.long	0x6ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x4
	.string	"y"
	.value	0x14d
	.byte	0xe
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF425
	.byte	0xa1
	.byte	0x5
	.long	0x7c
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x30ec
	.uleb128 0x1b
	.string	"c"
	.byte	0xa1
	.byte	0x19
	.long	0xc4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x3b
	.long	0x331f
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.byte	0x1
	.byte	0xaa
	.byte	0x5
	.uleb128 0xc
	.long	0x3354
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	0x3349
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.long	0x333e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.long	0x3333
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	0x3328
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF426
	.byte	0x95
	.byte	0x7
	.long	0x48
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x3146
	.uleb128 0x11
	.long	.LASF427
	.byte	0x95
	.byte	0x1d
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF428
	.byte	0x96
	.byte	0x16
	.long	0x3146
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.long	.LASF429
	.byte	0x97
	.byte	0x9
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.long	.LASF430
	.byte	0x98
	.byte	0x15
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.long	0x747
	.uleb128 0x1a
	.long	.LASF431
	.byte	0x8f
	.byte	0x18
	.long	0x13f3
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x31c1
	.uleb128 0x11
	.long	.LASF430
	.byte	0x8f
	.byte	0x3b
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x11
	.long	.LASF119
	.byte	0x8f
	.byte	0x55
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.string	"key"
	.byte	0x8f
	.byte	0x63
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.long	.LASF432
	.byte	0x8f
	.byte	0x6f
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.string	"hsh"
	.byte	0x90
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF83
	.byte	0x91
	.byte	0x9
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1a
	.long	.LASF433
	.byte	0x8b
	.byte	0x18
	.long	0x13f3
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x320d
	.uleb128 0x11
	.long	.LASF119
	.byte	0x8b
	.byte	0x34
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.string	"key"
	.byte	0x8b
	.byte	0x42
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1e
	.string	"hsh"
	.byte	0x8c
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.long	.LASF434
	.byte	0x85
	.byte	0x5
	.long	0x7c
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x3267
	.uleb128 0x11
	.long	.LASF119
	.byte	0x85
	.byte	0x28
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.string	"key"
	.byte	0x85
	.byte	0x36
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF83
	.byte	0x85
	.byte	0x4d
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.string	"hsh"
	.byte	0x86
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.long	.LASF435
	.byte	0x7d
	.byte	0x5
	.long	0x7c
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x32cf
	.uleb128 0x11
	.long	.LASF119
	.byte	0x7d
	.byte	0x21
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.string	"key"
	.byte	0x7d
	.byte	0x2f
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.long	.LASF82
	.byte	0x7d
	.byte	0x40
	.long	0x37d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.long	.LASF436
	.byte	0x7d
	.byte	0x4b
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1e
	.string	"hsh"
	.byte	0x7e
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x3c
	.long	.LASF437
	.byte	0x1
	.byte	0x72
	.byte	0x1
	.long	0x3a
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x331a
	.uleb128 0x1b
	.string	"str"
	.byte	0x72
	.byte	0x15
	.long	0x331a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF437
	.byte	0x74
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.string	"c"
	.byte	0x75
	.byte	0x9
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x6
	.long	0x4f
	.uleb128 0x3d
	.long	.LASF447
	.byte	0x2
	.byte	0x40
	.byte	0x1
	.byte	0x3
	.uleb128 0x1f
	.long	.LASF438
	.byte	0x40
	.byte	0x14
	.long	0x7c
	.uleb128 0x1f
	.long	.LASF439
	.byte	0x40
	.byte	0x22
	.long	0x7c
	.uleb128 0x1f
	.long	.LASF440
	.byte	0x40
	.byte	0x38
	.long	0x2f2
	.uleb128 0x1f
	.long	.LASF441
	.byte	0x41
	.byte	0x16
	.long	0x41
	.uleb128 0x1f
	.long	.LASF442
	.byte	0x41
	.byte	0x2a
	.long	0x2f2
	.uleb128 0x19
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x6
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF161:
	.string	"last_token"
.LASF403:
	.string	"first_non_number"
.LASF7:
	.string	"size_t"
.LASF340:
	.string	"parse"
.LASF263:
	.string	"add_references"
.LASF159:
	.string	"start"
.LASF209:
	.string	"jmp_func"
.LASF59:
	.string	"_ISgraph"
.LASF390:
	.string	"owner"
.LASF339:
	.string	"dump_function"
.LASF259:
	.string	"_add_variable_key"
.LASF14:
	.string	"__ssize_t"
.LASF72:
	.string	"pcre2_real_compile_context_8"
.LASF47:
	.string	"_IO_codecvt"
.LASF376:
	.string	"_newstatements2"
.LASF342:
	.string	"root"
.LASF131:
	.string	"parameters"
.LASF283:
	.string	"method_variable_key_length"
.LASF27:
	.string	"_IO_save_end"
.LASF422:
	.string	"charget"
.LASF386:
	.string	"_emptyline2"
.LASF310:
	.string	"method_name"
.LASF370:
	.string	"_empty6"
.LASF418:
	.string	"is_number"
.LASF130:
	.string	"Function"
.LASF333:
	.string	"function_name"
.LASF20:
	.string	"_IO_write_base"
.LASF121:
	.string	"running"
.LASF348:
	.string	"open"
.LASF319:
	.string	"reg_left"
.LASF308:
	.string	"method_call_expression"
.LASF111:
	.string	"stringvalue"
.LASF36:
	.string	"_lock"
.LASF231:
	.string	"range_count"
.LASF71:
	.string	"pcre2_compile_context_8"
.LASF98:
	.string	"type"
.LASF424:
	.string	"spaces"
.LASF303:
	.string	"call_bytes_length"
.LASF301:
	.string	"dump_machine_code"
.LASF25:
	.string	"_IO_save_base"
.LASF325:
	.string	"size_of_immediate"
.LASF442:
	.string	"__format"
.LASF220:
	.string	"realregisters"
.LASF164:
	.string	"CODEGEN_CONTEXT"
.LASF438:
	.string	"__status"
.LASF365:
	.string	"tokenstop"
.LASF366:
	.string	"hashv"
.LASF256:
	.string	"member_variable_key"
.LASF29:
	.string	"_chain"
.LASF49:
	.string	"ssize_t"
.LASF33:
	.string	"_cur_column"
.LASF372:
	.string	"_returnexpressions"
.LASF213:
	.string	"parse_result"
.LASF208:
	.string	"line"
.LASF322:
	.string	"address2"
.LASF8:
	.string	"__uint8_t"
.LASF314:
	.string	"add_bytes"
.LASF353:
	.string	"newstatementsource"
.LASF423:
	.string	"dump_expressions"
.LASF169:
	.string	"fileno"
.LASF335:
	.string	"result"
.LASF238:
	.string	"assignment_counter"
.LASF284:
	.string	"_identifier_variable_key"
.LASF97:
	.string	"variable_key"
.LASF137:
	.string	"compiled"
.LASF89:
	.string	"start_assignment"
.LASF94:
	.string	"variable_length"
.LASF11:
	.string	"long int"
.LASF338:
	.string	"descendanf"
.LASF120:
	.string	"work_def"
.LASF189:
	.string	"pcre2_code_free_8"
.LASF416:
	.string	"match_data"
.LASF359:
	.string	"new_position"
.LASF280:
	.string	"return_variable_key_left"
.LASF141:
	.string	"NormalForm"
.LASF46:
	.string	"_IO_marker"
.LASF269:
	.string	"add_variable_key_right"
.LASF210:
	.string	"main"
.LASF85:
	.string	"ranges"
.LASF258:
	.string	"key3"
.LASF58:
	.string	"_ISprint"
.LASF346:
	.string	"head"
.LASF149:
	.string	"current_into"
.LASF6:
	.string	"signed char"
.LASF108:
	.string	"Expression"
.LASF264:
	.string	"add_reference_expressions"
.LASF64:
	.string	"uint8_t"
.LASF233:
	.string	"search_target"
.LASF79:
	.string	"_IO_FILE"
.LASF273:
	.string	"return_reference_count"
.LASF147:
	.string	"main_function_context"
.LASF48:
	.string	"_IO_wide_data"
.LASF266:
	.string	"left_length"
.LASF136:
	.string	"context"
.LASF123:
	.string	"Parameter"
.LASF4:
	.string	"unsigned char"
.LASF211:
	.string	"dump_anf"
.LASF40:
	.string	"_freeres_list"
.LASF217:
	.string	"real_registers"
.LASF125:
	.string	"namelength"
.LASF178:
	.string	"fclose"
.LASF106:
	.string	"reference_expressions"
.LASF127:
	.string	"function_length"
.LASF407:
	.string	"_gettok"
.LASF306:
	.string	"method_address"
.LASF352:
	.string	"newexps"
.LASF349:
	.string	"curlyopen"
.LASF225:
	.string	"instruction"
.LASF241:
	.string	"method_call_text"
.LASF327:
	.string	"bytes"
.LASF82:
	.string	"value"
.LASF105:
	.string	"reference_variable_length"
.LASF337:
	.string	"function_expressions"
.LASF15:
	.string	"char"
.LASF74:
	.string	"pcre2_real_match_context_8"
.LASF400:
	.string	"empty4"
.LASF364:
	.string	"usetokenstop"
.LASF116:
	.string	"AssignmentPair"
.LASF77:
	.string	"pcre2_match_data_8"
.LASF406:
	.string	"gettok"
.LASF444:
	.string	"_IO_lock_t"
.LASF299:
	.string	"filename"
.LASF75:
	.string	"pcre2_code_8"
.LASF160:
	.string	"precedence"
.LASF145:
	.string	"user_functions"
.LASF305:
	.string	"method_ins_count"
.LASF414:
	.string	"subject_length"
.LASF288:
	.string	"identifier_reference_variable_count"
.LASF17:
	.string	"_IO_read_ptr"
.LASF184:
	.string	"__errno_location"
.LASF174:
	.string	"ftell"
.LASF345:
	.string	"caller"
.LASF436:
	.string	"key_length"
.LASF194:
	.string	"strcmp"
.LASF329:
	.string	"immediate"
.LASF304:
	.string	"method_bytes"
.LASF296:
	.string	"compile_stub"
.LASF177:
	.string	"mmap"
.LASF102:
	.string	"text"
.LASF73:
	.string	"pcre2_match_context_8"
.LASF344:
	.string	"continue_parse"
.LASF395:
	.string	"expression_exps"
.LASF28:
	.string	"_markers"
.LASF250:
	.string	"member_reference_count"
.LASF62:
	.string	"_ISpunct"
.LASF443:
	.string	"GNU C17 12.3.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF199:
	.string	"printf"
.LASF204:
	.string	"buffer"
.LASF139:
	.string	"callsite_length"
.LASF224:
	.string	"registers"
.LASF95:
	.string	"chosen_register"
.LASF412:
	.string	"erroroffset"
.LASF100:
	.string	"left"
.LASF415:
	.string	"regex"
.LASF383:
	.string	"member"
.LASF126:
	.string	"functions"
.LASF37:
	.string	"_offset"
.LASF198:
	.string	"__error_at_line_alias"
.LASF152:
	.string	"function"
.LASF107:
	.string	"reference_expressions_length"
.LASF399:
	.string	"emptyline2"
.LASF318:
	.string	"destination_register"
.LASF397:
	.string	"method_call"
.LASF207:
	.string	"maps"
.LASF129:
	.string	"heap_start"
.LASF173:
	.string	"fread"
.LASF356:
	.string	"newstatements"
.LASF155:
	.string	"ParseResult"
.LASF2:
	.string	"long unsigned int"
.LASF223:
	.string	"template_variables"
.LASF237:
	.string	"assignregisters"
.LASF279:
	.string	"return_left_length"
.LASF84:
	.string	"RangePair"
.LASF393:
	.string	"empty"
.LASF232:
	.string	"reference"
.LASF31:
	.string	"_flags2"
.LASF298:
	.string	"address"
.LASF19:
	.string	"_IO_read_base"
.LASF362:
	.string	"parameter"
.LASF117:
	.string	"assignments"
.LASF257:
	.string	"member_variable_key_length"
.LASF311:
	.string	"arg1"
.LASF44:
	.string	"_unused2"
.LASF287:
	.string	"identifier_reference_count"
.LASF430:
	.string	"hashmaps"
.LASF66:
	.string	"uintptr_t"
.LASF182:
	.string	"sprintf"
.LASF421:
	.string	"quoteregex"
.LASF92:
	.string	"end_position"
.LASF56:
	.string	"_ISxdigit"
.LASF247:
	.string	"key2"
.LASF87:
	.string	"Range"
.LASF271:
	.string	"key4"
.LASF202:
	.string	"argc"
.LASF297:
	.string	"function_id"
.LASF32:
	.string	"_old_offset"
.LASF148:
	.string	"ExpressionSource"
.LASF253:
	.string	"member_reference_variable_length"
.LASF427:
	.string	"args"
.LASF203:
	.string	"argv"
.LASF367:
	.string	"_newline3"
.LASF312:
	.string	"add_size_of_immediate"
.LASF133:
	.string	"expression_length"
.LASF252:
	.string	"member_reference_expressions"
.LASF10:
	.string	"__uint32_t"
.LASF351:
	.string	"_newstatements"
.LASF101:
	.string	"right"
.LASF50:
	.string	"long long int"
.LASF226:
	.string	"lookup"
.LASF431:
	.string	"get_hashmap_nested"
.LASF239:
	.string	"counter"
.LASF76:
	.string	"pcre2_real_code_8"
.LASF262:
	.string	"add_reference_expressions_count"
.LASF374:
	.string	"_newstatementsource2"
.LASF52:
	.string	"_ISupper"
.LASF187:
	.string	"__ctype_b_loc"
.LASF61:
	.string	"_IScntrl"
.LASF22:
	.string	"_IO_write_end"
.LASF317:
	.string	"register_right"
.LASF445:
	.string	"sscanf"
.LASF441:
	.string	"__line"
.LASF378:
	.string	"_newstatementsource3"
.LASF411:
	.string	"errornumber"
.LASF354:
	.string	"returnedexps"
.LASF172:
	.string	"strerror"
.LASF122:
	.string	"count"
.LASF439:
	.string	"__errnum"
.LASF328:
	.string	"byte_count"
.LASF302:
	.string	"writecode"
.LASF190:
	.string	"pcre2_match_data_free_8"
.LASF384:
	.string	"newroot"
.LASF332:
	.string	"resolve_name"
.LASF168:
	.string	"read"
.LASF23:
	.string	"_IO_buf_base"
.LASF3:
	.string	"unsigned int"
.LASF134:
	.string	"expressions"
.LASF67:
	.string	"PCRE2_UCHAR8"
.LASF267:
	.string	"right_length"
.LASF119:
	.string	"hashmap"
.LASF326:
	.string	"bytes_count"
.LASF242:
	.string	"position"
.LASF363:
	.string	"parse_expressions"
.LASF246:
	.string	"reference_expressions_count"
.LASF377:
	.string	"_newexps"
.LASF91:
	.string	"start_position"
.LASF42:
	.string	"__pad5"
.LASF435:
	.string	"set_hashmap"
.LASF336:
	.string	"function_anf"
.LASF313:
	.string	"add_bytes_length"
.LASF387:
	.string	"_empty4"
.LASF369:
	.string	"_empty5"
.LASF144:
	.string	"global_functions"
.LASF260:
	.string	"add_reference_count"
.LASF229:
	.string	"variables_list"
.LASF388:
	.string	"_new_expressions2"
.LASF371:
	.string	"_new_expressions3"
.LASF429:
	.string	"current"
.LASF358:
	.string	"_newstatementsource"
.LASF16:
	.string	"_flags"
.LASF80:
	.string	"hashmap_key"
.LASF188:
	.string	"pcre2_get_ovector_pointer_8"
.LASF375:
	.string	"_return"
.LASF309:
	.string	"method_call_name_identifier"
.LASF289:
	.string	"identifier_reference_expression_count"
.LASF243:
	.string	"first"
.LASF43:
	.string	"_mode"
.LASF38:
	.string	"_codecvt"
.LASF234:
	.string	"start_position_a"
.LASF235:
	.string	"end_position_a"
.LASF413:
	.string	"ovector"
.LASF205:
	.string	"anfs"
.LASF200:
	.string	"calloc"
.LASF93:
	.string	"variable"
.LASF245:
	.string	"reference_variable_length_count"
.LASF420:
	.string	"substring_length"
.LASF183:
	.string	"mprotect"
.LASF389:
	.string	"_exprs"
.LASF45:
	.string	"FILE"
.LASF428:
	.string	"work"
.LASF115:
	.string	"token_type"
.LASF86:
	.string	"range_length"
.LASF154:
	.string	"function_context"
.LASF103:
	.string	"references"
.LASF343:
	.string	"keywords"
.LASF281:
	.string	"return_text"
.LASF54:
	.string	"_ISalpha"
.LASF315:
	.string	"add_bytes_count"
.LASF404:
	.string	"identifierexpressions"
.LASF396:
	.string	"newstatementsource2"
.LASF382:
	.string	"newstatementsource3"
.LASF417:
	.string	"size"
.LASF114:
	.string	"assigned"
.LASF350:
	.string	"newinto"
.LASF51:
	.string	"long long unsigned int"
.LASF274:
	.string	"return_reference_variable_length_count"
.LASF419:
	.string	"substring_start"
.LASF158:
	.string	"length"
.LASF60:
	.string	"_ISblank"
.LASF12:
	.string	"__off_t"
.LASF142:
	.string	"assignment_pair"
.LASF373:
	.string	"_exprs2"
.LASF81:
	.string	"hashmap_value"
.LASF63:
	.string	"_ISalnum"
.LASF381:
	.string	"newstatements2"
.LASF251:
	.string	"member_references"
.LASF150:
	.string	"StatementSource"
.LASF392:
	.string	"owner_into"
.LASF156:
	.string	"last_char"
.LASF434:
	.string	"set_hashmap_nested"
.LASF41:
	.string	"_freeres_buf"
.LASF57:
	.string	"_ISspace"
.LASF185:
	.string	"getpagesize"
.LASF193:
	.string	"pcre2_compile_8"
.LASF401:
	.string	"new_expressions"
.LASF316:
	.string	"register_left"
.LASF219:
	.string	"assignrealregisters"
.LASF277:
	.string	"return_reference_expressions"
.LASF196:
	.string	"memset"
.LASF96:
	.string	"Assignment"
.LASF357:
	.string	"identifierexps"
.LASF432:
	.string	"subkey"
.LASF26:
	.string	"_IO_backup_base"
.LASF35:
	.string	"_shortbuf"
.LASF215:
	.string	"assign_all_registers"
.LASF140:
	.string	"global"
.LASF197:
	.string	"malloc"
.LASF222:
	.string	"assignment_stack_position"
.LASF13:
	.string	"__off64_t"
.LASF410:
	.string	"name_table"
.LASF135:
	.string	"code"
.LASF128:
	.string	"codegen_context"
.LASF426:
	.string	"clone_benchmark"
.LASF165:
	.string	"strstr"
.LASF181:
	.string	"fopen"
.LASF216:
	.string	"range_pair"
.LASF212:
	.string	"dump"
.LASF88:
	.string	"expression"
.LASF24:
	.string	"_IO_buf_end"
.LASF278:
	.string	"return_reference_variable_length"
.LASF151:
	.string	"FunctionContext"
.LASF214:
	.string	"machine_code"
.LASF276:
	.string	"return_references"
.LASF409:
	.string	"subject"
.LASF240:
	.string	"_method_variable_key"
.LASF124:
	.string	"name"
.LASF171:
	.string	"fprintf"
.LASF70:
	.string	"pcre2_real_general_context_8"
.LASF53:
	.string	"_ISlower"
.LASF166:
	.string	"strtok"
.LASF186:
	.string	"strtol"
.LASF157:
	.string	"program_body"
.LASF163:
	.string	"stderr"
.LASF9:
	.string	"short int"
.LASF255:
	.string	"member_reference_expression_count"
.LASF162:
	.string	"current_id"
.LASF368:
	.string	"_emptyline3"
.LASF112:
	.string	"stringlength"
.LASF408:
	.string	"pattern"
.LASF236:
	.string	"range"
.LASF143:
	.string	"CodeGenContext"
.LASF294:
	.string	"main_write_region"
.LASF175:
	.string	"fseek"
.LASF425:
	.string	"convert_to_hex"
.LASF291:
	.string	"identifier_variable_key_length"
.LASF34:
	.string	"_vtable_offset"
.LASF324:
	.string	"compile_address"
.LASF433:
	.string	"get_hashmap"
.LASF275:
	.string	"return_reference_expressions_count"
.LASF68:
	.string	"PCRE2_SPTR8"
.LASF446:
	.string	"__isoc99_sscanf"
.LASF447:
	.string	"error_at_line"
.LASF300:
	.string	"callsite"
.LASF69:
	.string	"pcre2_general_context_8"
.LASF176:
	.string	"strlen"
.LASF230:
	.string	"variables_list_length"
.LASF254:
	.string	"member_reference_variable_length_count"
.LASF201:
	.string	"memcpy"
.LASF99:
	.string	"symbol"
.LASF380:
	.string	"_newroot"
.LASF221:
	.string	"previousassignments"
.LASF18:
	.string	"_IO_read_end"
.LASF132:
	.string	"parameter_length"
.LASF405:
	.string	"subsume"
.LASF398:
	.string	"newline2"
.LASF394:
	.string	"method_call_expressions"
.LASF113:
	.string	"numbervalue"
.LASF307:
	.string	"method_address_count"
.LASF218:
	.string	"register_count"
.LASF331:
	.string	"ins_counter"
.LASF265:
	.string	"add_reference_variable_length"
.LASF206:
	.string	"mapsfd"
.LASF65:
	.string	"uint32_t"
.LASF83:
	.string	"nested"
.LASF402:
	.string	"exprs"
.LASF30:
	.string	"_fileno"
.LASF320:
	.string	"reg_right"
.LASF90:
	.string	"end_assignment"
.LASF385:
	.string	"_newline2"
.LASF334:
	.string	"normalform"
.LASF39:
	.string	"_wide_data"
.LASF341:
	.string	"statementsource"
.LASF295:
	.string	"write_region"
.LASF347:
	.string	"token"
.LASF195:
	.string	"free"
.LASF55:
	.string	"_ISdigit"
.LASF286:
	.string	"identifier_reference_expressions"
.LASF379:
	.string	"_add"
.LASF227:
	.string	"liveranges"
.LASF5:
	.string	"short unsigned int"
.LASF248:
	.string	"_member_variable_key"
.LASF228:
	.string	"variables"
.LASF118:
	.string	"assignment_length"
.LASF268:
	.string	"add_variable_key_left"
.LASF21:
	.string	"_IO_write_ptr"
.LASF360:
	.string	"expressions_count"
.LASF261:
	.string	"add_reference_variable_length_count"
.LASF192:
	.string	"pcre2_match_data_create_from_pattern_8"
.LASF293:
	.string	"printf_function"
.LASF391:
	.string	"owner_size"
.LASF270:
	.string	"text2"
.LASF440:
	.string	"__fname"
.LASF249:
	.string	"text4"
.LASF285:
	.string	"text5"
.LASF330:
	.string	"immediate_bytes"
.LASF321:
	.string	"start2"
.LASF170:
	.string	"exit"
.LASF138:
	.string	"callsites"
.LASF244:
	.string	"reference_count"
.LASF146:
	.string	"global_function_length"
.LASF292:
	.string	"codegen"
.LASF272:
	.string	"_return_variable_key"
.LASF437:
	.string	"hash"
.LASF191:
	.string	"pcre2_match_8"
.LASF78:
	.string	"pcre2_real_match_data_8"
.LASF290:
	.string	"identifier_variable_key"
.LASF282:
	.string	"method_variable_key"
.LASF167:
	.string	"close"
.LASF179:
	.string	"fflush"
.LASF104:
	.string	"reference_length"
.LASF323:
	.string	"compile_stub_start"
.LASF355:
	.string	"identifier"
.LASF153:
	.string	"Callsite"
.LASF180:
	.string	"fwrite"
.LASF110:
	.string	"statements"
.LASF109:
	.string	"exps"
.LASF361:
	.string	"before"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/sam/compiler"
.LASF0:
	.string	"./jitcompiler.c"
	.ident	"GCC: (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
