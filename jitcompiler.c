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
#define PCRE2_CODE_UNIT_WIDTH 8
#include <pcre2.h>

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
// types
#define NUMBER 0
// ast nodes
#define ASSIGNMENT 0
#define REFERENCE 1
#define IF 1
#define METHOD_CALL 1

struct AST {
  int type;
  int length;
  struct AST * children;
};

struct ParseResult {
  struct AST * root;
  char *last_char;  
  int pos;
  char * program_body;
  int end;
  int length;
};

#define BUF_SIZE 1024

char * charget(struct ParseResult *parse_result) {
  char * last_char = malloc((sizeof(char) * 2)); 
  memset(last_char, '\0', 2);
  last_char[0] = parse_result->program_body[parse_result->pos]; 
  parse_result->last_char = last_char;
  if (parse_result->pos + 1 == parse_result->length) {
    parse_result->end = 1;
    printf("end early");
    return last_char;
  }
  parse_result->pos = parse_result->pos + 1;
  return last_char; 
}

char * gettok(struct ParseResult *parse_result) {
   while (parse_result->end == 0 && (strcmp(parse_result->last_char, " ") == 0 || strcmp(parse_result->last_char, "\n") == 0)) {
      printf("Skipping whitespace\n");
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
   }
      
      
  if (strcmp(parse_result->last_char, "(") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "open";
  }
  if (strcmp(parse_result->last_char, ")") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "close";
  }

  pcre2_code *re;
  PCRE2_SPTR pattern;     /* PCRE2_SPTR is a pointer to unsigned code units of */
  PCRE2_SPTR subject;     /* the appropriate width (8, 16, or 32 bits). */
  PCRE2_SPTR name_table;
  int errornumber;
  PCRE2_SIZE erroroffset;
  PCRE2_SIZE *ovector;
  int i;

  size_t subject_length = 1;
  // pcre2_code *pcre2_compile(PCRE2_SPTR pattern, PCRE2_SIZE length, uint32_t options, int *errorcode, PCRE2_SIZE *erroroffset, pcre2_compile_context *ccontext);

  char * regex = "^[a-zA-Z0-9]+$";
  pattern = (PCRE2_SPTR)regex;
  subject = (PCRE2_SPTR)parse_result->last_char;

  pcre2_match_data *match_data;

  re = pcre2_compile(
    pattern,               /* the pattern */
    PCRE2_ZERO_TERMINATED, /* indicates pattern is zero-terminated */
    0,                     /* default options */
    &errornumber,          /* for error number */
    &erroroffset,          /* for error offset */
    NULL);                 /* use default compile context */

   match_data = pcre2_match_data_create_from_pattern(re, NULL);

   int rc = pcre2_match(
    re,                   /* the compiled pattern */
    subject,              /* the subject string */
    subject_length,       /* the length of the subject */
    0,                    /* start at offset 0 in the subject */
    0,                    /* default options */
    match_data,           /* block for storing the result */
    NULL);                /* use default match context */  

  if (rc > 0) {
    int size = sizeof(char) * 30 + 1;
    char * identifier = malloc(size);
    memset(identifier, '\0', size);
    int count = 0;

    free(parse_result->last_char); 
    parse_result->last_char = charget(parse_result);
    subject = (PCRE2_SPTR)parse_result->last_char;


    printf("%s\n", identifier);
    pcre2_match_data_free(match_data);   /* Release memory used for the match */

    while (parse_result->end == 0 && (rc = pcre2_match(
        re,                   /* the compiled pattern */
        subject,              /* the subject string */
        subject_length,       /* the length of the subject */
        0,                    /* start at offset 0 in the subject */
        0,                    /* default options */
        match_data,           /* block for storing the result */
        NULL)) > 0) {          /* use default match context */  
      printf("%s [%s] Matched pattern for identifier [%s]\n", regex, parse_result->last_char, identifier); 
      ovector = pcre2_get_ovector_pointer(match_data);
      printf("\nMatch succeeded at offset %d\n", (int)ovector[0]);   
      for (i = 0; i < rc; i++) {
        PCRE2_SPTR substring_start = subject + ovector[2*i];
        size_t substring_length = ovector[2*i+1] - ovector[2*i];
        printf("%2d: [%.*s]\n", i, (int)substring_length, (char *)substring_start);
      }
      identifier[count++] = parse_result->last_char[0];
      free(parse_result->last_char); 
      parse_result->last_char = charget(parse_result);
      subject = (PCRE2_SPTR)parse_result->last_char;
    }
    printf("%d rc is", rc);

    if (parse_result->end == 1 && strcmp(parse_result->last_char, ")") != 0 && strcmp(parse_result->last_char, "\n") != 0) {
      identifier[count++] = parse_result->last_char[0];
    }
    // when finished looping
    // pcre2_match_data_free(match_data);   /* Release memory used for the match */
    pcre2_code_free(re);  
    return identifier;
  }
   
  /*
  if re.match("[a-zA-Z0-9\.\_\-]+", self.last_char):
      identifier = ""
      while self.end == False and re.match("[a-zA-Z0-9\.\_\-]+", self.last_char):
          
          identifier = identifier + self.last_char
          self.last_char = self.charget()
      
      if self.end and self.last_char != ")" and self.last_char != "\n":
          identifier += self.last_char
      
      return identifier.lower() 
  */
  return "unknown";
}

unsigned long
hash(unsigned char *str)
{
    unsigned long hash = 5381;
    int c;

    while (c = *str++)
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash;
}

struct ParseResult* parse(int length, char * program_body) {
  struct ParseResult * parse_result = malloc(sizeof(struct ParseResult));
  parse_result->pos = 0;
  parse_result->length = length;
  parse_result->program_body = program_body;
  char * last_char = malloc((sizeof(char) * 2)); 
  memset(last_char, '\0', 2);
  last_char[0] = ' ';
  last_char[0] = parse_result->program_body[parse_result->pos]; 
  parse_result->last_char = last_char;
  parse_result->end = 0;
  printf("Getting token\n");
  char * token = gettok(parse_result);
  printf("%s", token); 

  char * keywords[] = {"function", "if", "return", "(", ")"};

  for (int x = 0 ; x < 4; x++) {
    printf("%s %ld\n", keywords[x], hash(keywords[x]));
  }

  switch (hash(token)) {
    case 7572387384277067: // function
      printf("Is a function\n");
    break;

  }
  
  return parse_result; 
}


int main(int argc, char *argv[])
{
  
  char *write_region = mmap(NULL,
			    getpagesize(),
			    PROT_READ | PROT_WRITE,
			    MAP_SHARED | MAP_ANONYMOUS,
			    -1,
			    0);
  
  if (write_region == NULL) {
    error_at_line(-ENOMEM, errno, __FILE__, __LINE__, "couldn't allocate\n");
  }

  // fgets(buffer, sizeof(buffer), stdin);

  char * buffer = 0;
  long length;
  FILE * f = fopen (argv[1], "rb");

  if (f)
  {
    fseek (f, 0, SEEK_END);
    length = ftell (f);
    fseek (f, 0, SEEK_SET);
    buffer = malloc(sizeof(char) * length + 1);
    memset(buffer, '\0', length);
    if (buffer)
    {
      fread (buffer, 1, length, f);
    }
    fclose (f);
  }

  if (buffer)
  {
    printf("Parsing code\n%s", buffer);
    // start to process your data / extract strings here...
    struct ParseResult *ast = parse(length, buffer);  
  }

  /*for (size_t i = 0; buffer[i * 2 + 1] != '\0'; i++) {
    write_region[i] = 16 * convert_to_hex(buffer[i*2]) + convert_to_hex(buffer[i*2 + 1]);
  }

   mprotect(write_region, getpagesize(), PROT_READ | PROT_EXEC);

  int (*jmp_func)(void) = (void *) write_region;

  printf("%x\n", jmp_func());
  */
  return 0;
}
