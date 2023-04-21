default: make

opcodes = $(wildcard opcodes/*.S)
opcodes_c = $(wildcard opcodes/*.c)
binaries = $(subst .S,,$(opcodes))
binaries_c = $(subst .c,,$(opcodes_c))

$(binaries_c): $(opcodes_c)
	gcc -o $(basename $@) $(basename $@).c ; \
	objdump -dj .text $@ > $(basename $@)-text

$(binaries): $(opcodes)
	gcc -o $(basename $@) $(basename $@).S ; \
	objdump -dj .text $@ > $(basename $@)-text

clean: $(binaries)
	rm $(binaries) $(binaries_c)

make: $(binaries) $(binaries_c)
	gcc jitcompiler.c -o jitcompiler -g -l:libpcre2-8.a -I pcre2-10.42/
inspect:
	objdump -b binary -Mintel,x86-64 -D main.bin -m i386 ; \
	objdump -b binary -Mintel,x86-64 -D x.bin -m i386





