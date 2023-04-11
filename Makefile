default: make

make:
	gcc jitcompiler.c -o jitcompiler -l:libpcre2-8.a -I pcre2-10.42/

