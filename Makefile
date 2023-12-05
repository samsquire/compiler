
opcodes = $(wildcard opcodes/*.S)
opcodes_c = $(wildcard opcodes/*.c)
binaries = $(subst .S,,$(opcodes))
binaries_c = $(subst .c,,$(opcodes_c))

programs_c = jitcompiler.c jit.c
programs_binaries = $(subst .c,,$(programs_c))
default: make

$(binaries_c): $(opcodes_c)
	gcc -o $(basename $@) $(basename $@).c ; \
	objdump -dj .text $@ > $(basename $@)-text

$(binaries): $(opcodes)
	gcc -o $(basename $@) $(basename $@).S ; \
	objdump -dj .text $@ > $(basename $@)-text

clean: $(binaries)
	@rm $(binaries) $(binaries_c)
	@rm $(programs_c)
	@rm jitcompiler
	@rm regmove/regmove.c

$(programs_binaries): $(programs_c) regmove/regmove.c
	gcc $(basename $@).c common.c regmove/regmove.c -o $(basename $@) -g -l:libpcre2-8.a -I pcre2-10.42/ -I.

make: $(binaries) $(programs_binaries)

regmove/regmove.c:
	python3 filter.py opcodes/movreg_*-text > regmove/regmove.c ; \

inspect:
	objdump -b binary -Matt,x86-64 -D main.bin -m i386 ; \
	objdump -b binary -Matt,x86-64 -D x.bin -m i386 ; \
	objdump -b binary -Matt,x86-64 -D talker.bin -m i386





