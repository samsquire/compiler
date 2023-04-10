// Takes hexadecimal bytes from stdin and executes them as machine code,
// assuming they implement a function that takes no arguments
// and returns an int
// prints out the returned value as a hex number

// Sample input on x86_64: echo b8ff000000c3 | ./jit
// makes a function that returns 0xff

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <error.h>
#include <errno.h>
#include <unistd.h>
#include <sys/mman.h>

int convert_to_hex(char c)
{
  if (c >= '0' && c <= '9') {
    return c - '0';
  } else if (c >= 'A' && c <= 'F') {
    return c - 'A' + 10;
  } else if (c >= 'a' && c <= 'f') {
    return c - 'a' + 10;
  } else {
    error_at_line(-1, 0, __FILE__, __LINE__, "illegal char\n");
    return -1;
  }
}

#define BUF_SIZE 1024

int main(int argc, char *argv[])
{
  char buffer[BUF_SIZE];
  
  char *write_region = mmap(NULL,
			    getpagesize(),
			    PROT_READ | PROT_WRITE,
			    MAP_SHARED | MAP_ANONYMOUS,
			    -1,
			    0);
  
  if (write_region == NULL) {
    error_at_line(-ENOMEM, errno, __FILE__, __LINE__, "couldn't allocate\n");
  }

  fgets(buffer, sizeof(buffer), stdin);

  for (size_t i = 0; buffer[i * 2 + 1] != '\0'; i++) {
    write_region[i] = 16 * convert_to_hex(buffer[i*2]) + convert_to_hex(buffer[i*2 + 1]);
  }

   mprotect(write_region, getpagesize(), PROT_READ | PROT_EXEC);

  int (*jmp_func)(void) = (void *) write_region;

  printf("%x\n", jmp_func());

  return 0;
}
