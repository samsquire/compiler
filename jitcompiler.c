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

struct Parameter {
  char * name;
  char * type;
};

struct Function {
  char * name;
  struct Parameter **parameters;
  int length;
};



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
  int start;
  struct Function **functions;
  int function_length;
};

#define BUF_SIZE 1024

char * charget(struct ParseResult *parse_result) {
  parse_result->start = 0;
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

char * gettok(struct ParseResult *parse_result, char * caller) {
   while (parse_result->start || (parse_result->end == 0 && (strcmp(parse_result->last_char, " ") == 0 || strcmp(parse_result->last_char, "\n") == 0))) {
      printf("%s Skipping whitespace\n", caller);
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
   }
      
  if (strcmp(parse_result->last_char, ",") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "comma";
  }
      
  if (strcmp(parse_result->last_char, "(") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "open";
  }
  if (strcmp(parse_result->last_char, "{") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "curlyopen";
  }
  if (strcmp(parse_result->last_char, "}") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "curlyclose";
  }
  if (strcmp(parse_result->last_char, ")") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      printf("%s CLOSE TAG", caller);
      return "close";
  }
  if (strcmp(parse_result->last_char, ";") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      printf("%s CLOSE expression", caller);
      return "endstatement";
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

  char * regex = "^[a-zA-Z0-9-_.]+$";
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
    int size = sizeof(char) * 100 + 1;
    char * identifier = malloc(size);
    memset(identifier, '\0', size);
    int count = 0;

    // free(parse_result->last_char); 
    // identifier[count++] = parse_result->last_char[0];
    // parse_result->last_char = charget(parse_result);
    subject = (PCRE2_SPTR)parse_result->last_char;
    // identifier[count++] = parse_result->last_char[0];


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
      ovector = pcre2_get_ovector_pointer(match_data);
      printf("\n%sMatch succeeded at offset %d\n", caller, (int)ovector[0]);   
      for (i = 0; i < rc; i++) {
        PCRE2_SPTR substring_start = subject + ovector[2*i];
        size_t substring_length = ovector[2*i+1] - ovector[2*i];
        printf("%2d: [%.*s]\n", i, (int)substring_length, (char *)substring_start);
      }
      identifier[count++] = parse_result->last_char[0];
      printf("%s [%s] Matched pattern for identifier [%s] %s\n", regex, parse_result->last_char, identifier, subject); 
      free(parse_result->last_char); 
      parse_result->last_char = charget(parse_result);
      subject = (PCRE2_SPTR)parse_result->last_char;
    }
    printf("%d rc is\n", rc);

    if (parse_result->end == 1 && strcmp(parse_result->last_char, ")") != 0 && strcmp(parse_result->last_char, "\n") != 0) {
      identifier[count++] = parse_result->last_char[0];
    }

    // when finished looping
    // pcre2_match_data_free(match_data);   /* Release memory used for the match */
    pcre2_code_free(re);  
    return identifier;
  }
   
  if (strcmp(parse_result->last_char, "\"") == 0 ||  strcmp(parse_result->last_char, "'") == 0) {
    char * quoteregex = "[^\"']+";
    
    printf("\n\ninside a quote\n\n");

    parse_result->last_char = charget(parse_result);
    pattern = (PCRE2_SPTR)quoteregex;
    subject = (PCRE2_SPTR)parse_result->last_char;
    re = pcre2_compile(
      pattern,               /* the pattern */
      PCRE2_ZERO_TERMINATED, /* indicates pattern is zero-terminated */
      0,                     /* default options */
      &errornumber,          /* for error number */
      &erroroffset,          /* for error offset */
      NULL);                 /* use default compile context */

     match_data = pcre2_match_data_create_from_pattern(re, NULL);

     rc = pcre2_match(
      re,                   /* the compiled pattern */
      subject,              /* the subject string */
      subject_length,       /* the length of the subject */
      0,                    /* start at offset 0 in the subject */
      0,                    /* default options */
      match_data,           /* block for storing the result */
      NULL);                /* use default match context */  

    if (rc > 0) {
      int size = sizeof(char) * 100 + 1;
      char * identifier = malloc(size);
      memset(identifier, '\0', size);
      int count = 0;

      // free(parse_result->last_char); 
      // identifier[count++] = parse_result->last_char[0];
      // parse_result->last_char = charget(parse_result);
      subject = (PCRE2_SPTR)parse_result->last_char;
      // identifier[count++] = parse_result->last_char[0];


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
        ovector = pcre2_get_ovector_pointer(match_data);
        printf("\n%s Match succeeded at offset %d\n", caller, (int)ovector[0]);   
        for (i = 0; i < rc; i++) {
          PCRE2_SPTR substring_start = subject + ovector[2*i];
          size_t substring_length = ovector[2*i+1] - ovector[2*i];
          printf("%2d: [%.*s]\n", i, (int)substring_length, (char *)substring_start);
        }
        identifier[count++] = parse_result->last_char[0];
        printf("quote %s %s [%s] Matched pattern for identifier [%s] %s\n", caller, pattern, parse_result->last_char, identifier, subject); 
        free(parse_result->last_char); 
        parse_result->last_char = charget(parse_result);
        subject = (PCRE2_SPTR)parse_result->last_char;
      }
      printf("%d rc is\n", rc);

      if (parse_result->end == 1 && strcmp(parse_result->last_char, ")") != 0 && strcmp(parse_result->last_char, "\n") != 0) {
        identifier[count++] = parse_result->last_char[0];
      }
      // when finished looping
      parse_result->last_char = charget(parse_result);
      // pcre2_match_data_free(match_data);   /* Release memory used for the match */
      pcre2_code_free(re);  
      return identifier;
    }
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

  printf("Unknown char: [%s]\n", parse_result->last_char);
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

struct Expression ** parse_expressions(struct ParseResult *parse_result) {
  char * token;
  while ((token = gettok(parse_result, "functionbodyitem")) && parse_result->end == 0 && strcmp(token, "curlyclose") != 0) {
    switch (hash(token)) {
      default:  
       // identifier 
       printf("Is an identifier %s", token);
    } 
  }
}

struct ParseResult * continue_parse(struct ParseResult *parse_result) {
  struct Expression **expressions;
  printf("Getting token\n");
  char * token = gettok(parse_result, "parsebegin");
  printf("%s", token); 

  char * keywords[] = {"function", "if", "return", "(", ")"};

  for (int x = 0 ; x < 4; x++) {
    printf("%s %ld\n", keywords[x], hash(keywords[x]));
  }

  struct Function **functions = calloc(100, sizeof(struct Function*));
  parse_result->functions = functions;
  parse_result->function_length = 0;

  switch (hash(token)) {
    case 7572387384277067: // case function
      char * function_name = gettok(parse_result, "functionbodybegin");
      struct Function *function = malloc(sizeof(struct Function));
      parse_result->functions[parse_result->function_length] = function;
      parse_result->function_length++;
      struct Parameter **parameters = calloc(10, sizeof(struct Parameter*));
      function->parameters = parameters;

      function->name = function_name;
      printf("Is a function %s\n", function_name);
      char * open = gettok(parse_result, "expectfuncopen");
      if (strcmp(open, "open") != 0) {
        printf("Error expected parameter list");
      }
      printf("%s", open);
      while ((token = gettok(parse_result, "loopparameterlist")) && parse_result->end == 0 && strcmp(token, "close") != 0) {
        char * type;
        if (strcmp(token, "int") == 0) {
           type = token;
        } 
        if (strcmp(token, "string") == 0) {
           type = token;
        } 
        
        char * name = gettok(parse_result, "funcparamname");
        printf("type is %s name is %s\n", type, name);
        char * before = malloc(sizeof(char) * 2);

        struct Parameter *parameter = malloc(sizeof(struct Parameter*));
        parameter->type = type;
        parameter->name = name;
        parameters[function->length++] = parameter;

        memcpy(before, parse_result->last_char, 2); 
        int pos = parse_result->pos;
        if (strcmp(gettok(parse_result, "commacheck"), "comma") != 0) {
          free(parse_result->last_char);
          parse_result->last_char = before;
          parse_result->pos = pos;
        }
      }
      char * curlyopen = gettok(parse_result, "functioncurlyopencheck");
      if (strcmp(curlyopen, "curlyopen") != 0) {
        printf("Error: expected curlyopen after function parameters");
      }
      expressions = parse_expressions(parse_result);
      continue_parse(parse_result);
      break;
    case 177613:
      printf("is a parameter list"); 
      break;
    default:
      printf("Is an identifier %s", token);
      struct Expression **expressions = parse_expressions(parse_result);
      break;
  }
  
  return parse_result; 
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
  parse_result->start = 1;

  return continue_parse(parse_result);
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
