default: make

opcodes = $(wildcard opcodes/*.S)
binaries = $(subst .S,,$(opcodes))

$(binaries): $(opcodes)
	gcc -o $(basename $@) $(basename $@).S ; \
	objdump -dj .text $@ > $(basename $@)-text

clean: $(binaries)
	rm $(binaries)

make: $(binaries)
	gcc jitcompiler.c -o jitcompiler -g -l:libpcre2-8.a -I pcre2-10.42/




