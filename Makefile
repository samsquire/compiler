
opcodes = $(wildcard opcodes/*.S)
opcodes_c = $(wildcard opcodes/*.c)
binaries = $(subst .S,,$(opcodes))
binaries_c = $(subst .c,,$(opcodes_c))

programs_c = $(wildcard *.c)
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

$(programs_binaries): $(programs_c) 
	gcc $(basename $@).c -o $(basename $@) -g -l:libpcre2-8.a -I pcre2-10.42/

make: $(binaries) $(programs_binaries)

inspect:
	objdump -b binary -Mintel,x86-64 -D main.bin -m i386 ; \
	objdump -b binary -Mintel,x86-64 -D x.bin -m i386 ; \
	objdump -b binary -Mintel,x86-64 -D talker.bin -m i386





