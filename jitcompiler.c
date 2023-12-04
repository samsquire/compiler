/*
JIT Compiler by Samuel Squire (https://github.com/samsquire/compiler)
with JIT code from Jacob Martin (https://gist.github.com/martinjacobd)

This C program executes a language that is superficially similar to Javascript.
It is barebones and a toy.
*/
/*
 * Copyright (c) 2023 Jacob Martin
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

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
#include <ctype.h>
#define PCRE2_CODE_UNIT_WIDTH 8
#include <pcre2.h>
#define MAX_SIZE 1024
#include <fcntl.h>
#include <sys/stat.h>

int compile_stub(int function_id);

struct hashmap_key {
  char key[1024];
  int len;
};
struct hashmap_value {
  uintptr_t  value;
  int nested;
  int set;
  
};

struct RangePair {
  struct Range ** ranges;
  int range_length;
};

struct Assignment {
  struct Expression *expression;
  struct ExpressionSource *exps;
  char * variable;  
  char * variable_key;  
  int variable_length;
  int variable_key_length;
  int type;
  char * symbol; 
  char * left;
  char * right;
  char * text;
  char ** references; 
  int reference_length;
  int ** reference_variable_length;
  char * chosen_register;
  struct Expression **reference_expressions;
  int reference_expressions_length;
};
struct Edges {
  struct Edge **edges;
  int edge_count;
  struct Assignment *from;
};
struct Edge {
  struct Assignment *assignment;
  char * destination;
};

struct Range {
  struct Expression * expression; 
  struct Assignment *start_assignment; 
  struct Assignment *end_assignment; 
  int start_position; 
  int end_position; 
  char * variable;
  int variable_length;
  char * chosen_register;
};
struct AssignmentPair  {
  struct Assignment *assignments;
  int assignment_length;
};
struct hashmap {
  int id;
  struct hashmap_key key[MAX_SIZE];       
  struct hashmap_value value[MAX_SIZE]; 
};
struct work_def {
  struct hashmap *hashmap;
  int running;
  int count;
};

// from https://stackoverflow.com/a/7666577/10662977
unsigned long
hash(unsigned char *str)
{
    unsigned long hash = 5381;
    int c;

    while (c = *str++)
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash;
}

int set_hashmap(struct hashmap *hashmap, char key[], uintptr_t value, int key_length) {
    unsigned long hsh = hash(key) % MAX_SIZE;
    memcpy(&(*hashmap).key[hsh], key, MAX_SIZE); 
    hashmap->key[hsh].len = key_length;
    hashmap->value[hsh].value =  value; 
    hashmap->value[hsh].set = 1;
}

int set_hashmap_nested(struct hashmap *hashmap, char key[], struct hashmap *nested) {
    unsigned long hsh = hash(key) % MAX_SIZE;
    memcpy(&(*hashmap).key[hsh], key, MAX_SIZE); 
    hashmap->value[hsh].nested = nested->id;
}

struct hashmap_value * get_hashmap(struct hashmap *hashmap, char key[]) {
    unsigned long hsh = hash(key) % MAX_SIZE;
    return &hashmap->value[hsh];
}
struct hashmap_value * get_hashmap_nested(struct hashmap *hashmaps, struct hashmap *hashmap, char key[], char subkey[]) {
    unsigned long hsh = hash(key) % MAX_SIZE;
    int nested = (*hashmap).value[hsh].nested;
    return get_hashmap(&hashmaps[nested], subkey);
}

void *clone_benchmark(void *args) {
    struct work_def *work = args;
    int current = 0;
    struct hashmap *hashmaps = calloc(MAX_SIZE, sizeof(struct hashmap));
    printf("Using %luGB for test.\n", MAX_SIZE * sizeof(struct hashmap) / 1024 / 1024 / 1024);
    while (work->running == 1) {
        memcpy(&hashmaps[current++], work->hashmap, sizeof(struct hashmap)); 
        current = current % MAX_SIZE; 
        work->count++;
    }
}

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
#define NUMBER 1
#define STRING 2
// ast nodes
#define ASSIGNMENT 0
#define REFERENCE 1
#define IF 2
#define METHOD_CALL 3
#define MEMBER_ACCESS 4
#define IDENTIFIER 5
#define ADD 6
#define SUBTRACT 7
#define MULTIPLY 8
#define RETURN 9
// assignment nodes
#define VARIABLE 0
#define REFERENCE 1
// tags
#define IS_AST_METADATA 1

struct Parameter {
  char * name;
  char * type;
  int namelength;
};

struct ANF {
  struct Function **functions;
  struct NormalForm *anf;
  int function_length;
  struct CodeGenContext * codegen_context;
  long long heap_start;
};

struct Function {
  char * name;
  int id;
  struct Parameter **parameters;
  int parameter_length;
  int expression_length;
  struct Expression **expressions;
  struct ExpressionSource **exps; 
  struct StatementSource * statements;
  struct NormalForm * anf;
  char * code;
  struct FunctionContext *context;
  int compiled;
  struct Callsite ** callsites;
  int callsite_length;
  int global;
};

struct Callsite {
  struct Function * function; 
  struct FunctionContext * function_context; 
  int pc;
};

struct Expression {
  int id;
  int type;
  struct ExpressionSource **exps;
  struct StatementSource * statements;
  char * stringvalue;
  int stringlength;
  int numbervalue;
  char * symbol;
  char * variable;
  int variable_length;
  int assigned;
  int tag;
  char * chosen_register;
  int token_type;
};

struct ExpressionSource {
  struct Expression **expressions;
  struct Expression ***current_into;
  int expression_length;
};

struct StatementSource {
  int statements;
};

struct ParseResult {
  char *last_char;  
  int pos;
  char * program_body;
  int end;
  int length;
  int start;
  struct Function **functions;
  int function_length;
  int precedence;
  struct ExpressionSource **exps; 
  struct StatementSource * statements;
  char * last_token;
  int current_id;
  int token_type;
};

struct NormalForm {
  struct Expression ** expressions;
  int count;
  struct AssignmentPair *assignment_pair;
};

struct CodeGenContext {
  struct Function ** global_functions;
  struct Function ** user_functions;
  int function_length;
  int global_function_length;
  struct FunctionContext * main_function_context;
  long long heap_start;
};
struct CodeGenContext * CODEGEN_CONTEXT;
struct FunctionContext {
  int pc;
  struct Function * function;
  char * code;
};

#define BUF_SIZE 1024

int dump_expressions(int count, struct ExpressionSource *exps) {
  char * spaces = malloc(sizeof(char) * count + 1);
  spaces[sizeof(char) * count] = '\0';
  for (int x = 0 ; x < count ; x++) {
    spaces[x] = ' ';
  } 
  int expression_length = exps->expression_length;
  // printf("Has %d expressions", expression_length);
  struct Expression **expressions = exps->expressions;
  for (int x = 0 ; x < expression_length; x++) {
    struct Expression *expression = expressions[x];  
      switch (expression->type) {
        case IDENTIFIER:
          printf("%sidentifier %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
        case MEMBER_ACCESS:
          printf("%smember access %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
        case METHOD_CALL:
          printf("%smethod call %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
        case ADD:
          printf("%sadd %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
        case RETURN:
          printf("%sreturn %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
        case SUBTRACT:
          printf("%ssubtract %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
        case MULTIPLY:
          printf("%smultiply %s %d\n", spaces, expression->stringvalue, expression->numbervalue);
          break;
      }
    for (int y = 0 ; y < expression->statements->statements; y++) {
     // printf("%d %p\n", y, expression->exps[y]);
      if (expression->exps[y]->expression_length > 0) {
        dump_expressions(count + 1, expression->exps[y]);
      }
    }
  }
}

char * charget(struct ParseResult *parse_result) {
  parse_result->start = 0;
  char * last_char = malloc((sizeof(char) * 2)); 
  memset(last_char, '\0', 2);
  last_char[0] = parse_result->program_body[parse_result->pos]; 
  parse_result->last_char = last_char;
  if (parse_result->pos + 1 == parse_result->length) {
    parse_result->end = 1;
    printf("end early\n");
    return last_char;
  }
  parse_result->pos = parse_result->pos + 1;
  return last_char; 
}

char * _gettok(struct ParseResult *parse_result, char * caller) {
   // reset whether token is a number or string
   parse_result->token_type = 0;
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
  if (strcmp(parse_result->last_char, "+") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "add";
  }
  if (strcmp(parse_result->last_char, "*") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "multiply";
  }
  if (strcmp(parse_result->last_char, "-") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      return "subtract";
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
      printf("%s CLOSE TAG\n", caller);
      return "close";
  }
  if (strcmp(parse_result->last_char, ".") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      printf("%s CLOSE TAG", caller);
      return "member";
  }
  if (strcmp(parse_result->last_char, ";") == 0) {
      free(parse_result->last_char);
      parse_result->last_char = charget(parse_result);
      printf("%s CLOSE expression\n", caller);
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

  char * regex = "^[a-zA-Z0-9-_]+$";
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

    while (parse_result->end == 0 && (rc = pcre2_match(
        re,                   /* the compiled pattern */
        subject,              /* the subject string */
        subject_length,       /* the length of the subject */
        0,                    /* start at offset 0 in the subject */
        0,                    /* default options */
        match_data,           /* block for storing the result */
        NULL)) > 0) {          /* use default match context */  
      ovector = pcre2_get_ovector_pointer(match_data);
      // printf("\n%s Match succeeded at offset %d\n", caller, (int)ovector[0]);   
      for (i = 0; i < rc; i++) {
        PCRE2_SPTR substring_start = subject + ovector[2*i];
        size_t substring_length = ovector[2*i+1] - ovector[2*i];
        // printf("%2d: [%.*s]\n", i, (int)substring_length, (char *)substring_start);
      }
      identifier[count++] = parse_result->last_char[0];
      // printf("%s [%s] Matched pattern for identifier [%s] %s\n", regex, parse_result->last_char, identifier, subject); 
      // free(parse_result->last_char); 
      parse_result->last_char = charget(parse_result);
      subject = (PCRE2_SPTR)parse_result->last_char;
    }
    pcre2_match_data_free(match_data);   /* Release memory used for the match */
    printf("%d rc is\n", rc);

    if (parse_result->end == 1 && strcmp(parse_result->last_char, ")") != 0 && strcmp(parse_result->last_char, "\n") != 0) {
      identifier[count++] = parse_result->last_char[0];
    }

    // when finished looping
    // pcre2_match_data_free(match_data);   /* Release memory used for the match */
    pcre2_code_free(re);  
    int is_number = 1;
    for (int c = 0 ; c < count ; c++) {
      if (isdigit(identifier[c]) == 0) {
        is_number = 0; 
        break;
      }
    }
    if (is_number == 1) {
      parse_result->token_type = NUMBER;
    } else {
      parse_result->token_type = STRING;
    }
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
        // printf("\n%s Match succeeded at offset %d\n", caller, (int)ovector[0]);   
        for (i = 0; i < rc; i++) {
          PCRE2_SPTR substring_start = subject + ovector[2*i];
          size_t substring_length = ovector[2*i+1] - ovector[2*i];
          // printf("%2d: [%.*s]\n", i, (int)substring_length, (char *)substring_start);
        }
        identifier[count++] = parse_result->last_char[0];
        // printf("quote %s %s [%s] Matched pattern for identifier [%s] %s\n", caller, pattern, parse_result->last_char, identifier, subject); 
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

  printf("Unknown char: [%s] %s\n", parse_result->last_char, parse_result->program_body);
  return "unknown";
}
char * gettok(struct ParseResult *parse_result, char * caller) {
  char * token = _gettok(parse_result, caller);    
  parse_result->last_token = token;
  return token;
}

int subsume(struct ExpressionSource **statements, struct StatementSource *statementsource, int type, struct ParseResult * parse_result) {
      struct ExpressionSource **_newstatements2 = calloc(100, sizeof(struct ExpressionSource)); 
      struct ExpressionSource *_newexps = malloc(sizeof(struct ExpressionSource)); 
      struct StatementSource *_newstatementsource3 = malloc(sizeof(struct StatementSource)); 
      _newstatementsource3->statements = 1;
    
      _newexps->expressions = statements[statementsource->statements - 1]->expressions;
      _newexps->expression_length = statements[statementsource->statements - 1]->expression_length;
      _newexps->current_into = statements[statementsource->statements - 1]->current_into;

      struct Expression * _add = malloc(sizeof(struct Expression));
      _add->id = parse_result->current_id++;
      _add->type = type;
      _add->exps = _newstatements2;
      _add->statements = _newstatementsource3;
      _newstatements2[0] = _newexps;

       
      struct Expression **_newroot = calloc(100, sizeof(struct Expression*));
      statements[statementsource->statements - 1]->expressions = _newroot; 
      statements[statementsource->statements - 1]->expression_length = 0;
      *statements[statementsource->statements - 1]->current_into = _newroot;
      statements[statementsource->statements - 1]->expressions[statements[statementsource->statements - 1]->expression_length++] = _add;

}

struct ExpressionSource ** parse_expressions(
  char * caller,
  struct StatementSource *statementsource,
  struct ExpressionSource **statements,
  struct ExpressionSource *head,
  struct ParseResult *parse_result,
  int usetokenstop,
  char * tokenstop) {
  char * token;
   
  /*
add 193486030
subtract 7572940974490733
multiply 7572685654880005

  */
   
  while ((token = gettok(parse_result, "functionbodyitem")) && parse_result->end == 0 && strcmp(token, "curlyclose") != 0 && (usetokenstop == 0 || (usetokenstop == 1 && strcmp(token, tokenstop) != 0))) {
    unsigned long hashv = hash(token);
    printf("Hash for token %s is %ld\n", token, hashv);
    switch (hashv) {
      case 6953974653989: // case return 
        // subsume(statements, statementsource, RETURN, parse_result);
        printf("%s Return statement\n", caller);
        struct ExpressionSource * _newline3 = malloc(sizeof(struct ExpressionSource));
        struct ExpressionSource * _emptyline3 = malloc(sizeof(struct ExpressionSource));
        struct ExpressionSource ** _empty5 = malloc(sizeof(struct ExpressionSource*));
        struct ExpressionSource ** _empty6 = malloc(sizeof(struct ExpressionSource*));
        struct Expression ** _new_expressions3 = calloc(100, sizeof(struct Expression*));
        struct Expression ** _returnexpressions = calloc(100, sizeof(struct Expression*));
        struct Expression * _exprs2 = calloc(1, sizeof(struct Expression));
        struct StatementSource * _newstatementsource = calloc(1, sizeof(struct StatementSource));
        struct StatementSource * _newstatementsource2 = calloc(1, sizeof(struct StatementSource));
        struct Expression * _return = malloc(sizeof(struct Expression));
        printf("%p\n", statements[statementsource->statements - 1]->expressions);
        statements[statementsource->statements - 1]->expressions[statements[statementsource->statements - 1]->expression_length++] = _return; 
        statementsource->statements++;
        statements[statementsource->statements - 1] = _newline3;

        statementsource = _newstatementsource2;

        _return->id = parse_result->current_id++;
        _return->type = RETURN;
        _return->symbol = "(ret)";
        _return->exps = _empty6;
        _return->statements = _newstatementsource2;
        _newstatementsource->statements = 1;
        _newstatementsource2->statements = 1;
        _empty5[0] = _newline3;
        statements = _empty6;

        _newline3->expression_length = 0;
        _newline3->expressions = _new_expressions3;
        _newline3->current_into = &_new_expressions3;

        _empty6[0] = _emptyline3;
        _emptyline3->expression_length = 0;
        _emptyline3->expressions = _returnexpressions;
        _emptyline3->current_into = &_returnexpressions;
        break;
      case 193486030: // case add
        struct ExpressionSource **_newstatements2 = calloc(100, sizeof(struct ExpressionSource)); 
        struct ExpressionSource *_newexps = malloc(sizeof(struct ExpressionSource)); 
        struct StatementSource *_newstatementsource3 = malloc(sizeof(struct StatementSource)); 
        _newstatementsource3->statements = 1;
      
        _newexps->expressions = statements[statementsource->statements - 1]->expressions;
        _newexps->expression_length = statements[statementsource->statements - 1]->expression_length;
        _newexps->current_into = statements[statementsource->statements - 1]->current_into;

        struct Expression * _add = malloc(sizeof(struct Expression));
        _add->id = parse_result->current_id++;
        _add->type = ADD;
        _add->symbol = "+";
        _add->exps = _newstatements2;
        _add->statements = _newstatementsource3;
        _newstatements2[0] = _newexps;

         
        struct Expression **_newroot = calloc(100, sizeof(struct Expression*));
        statements[statementsource->statements - 1]->expressions = _newroot; 
        statements[statementsource->statements - 1]->expression_length = 0;
        *statements[statementsource->statements - 1]->current_into = _newroot;
        statements[statementsource->statements - 1]->expressions[statements[statementsource->statements - 1]->expression_length++] = _add;
        statements = _newstatements2;
        statementsource = _newstatementsource3;
        break;
      
      case 6953778704349: // case . case member
        printf("Is an member access operator\n");

        struct ExpressionSource **newstatements2 = calloc(100, sizeof(struct ExpressionSource)); 
        struct ExpressionSource *newexps = malloc(sizeof(struct ExpressionSource)); 
        struct StatementSource *newstatementsource3 = malloc(sizeof(struct StatementSource)); 
        newstatementsource3->statements = 1;
      
        newexps->expressions = statements[statementsource->statements - 1]->expressions;
        newexps->expression_length = statements[statementsource->statements - 1]->expression_length;
        newexps->current_into = statements[statementsource->statements - 1]->current_into;

        struct Expression * member = malloc(sizeof(struct Expression));
        member->id = parse_result->current_id++;
        member->type = MEMBER_ACCESS;
        member->symbol = ".";
        member->exps = newstatements2;
        member->statements = newstatementsource3;
        newstatements2[0] = newexps;

         
        struct Expression **newroot = calloc(100, sizeof(struct Expression*));
        statements[statementsource->statements - 1]->expressions = newroot; 
        statements[statementsource->statements - 1]->expression_length = 0;
        *statements[statementsource->statements - 1]->current_into = newroot;
        statements[statementsource->statements - 1]->expressions[statements[statementsource->statements - 1]->expression_length++] = member;
        break; 
      case 210708961883: // case ) case close  parameterlistend
        printf("%s Close bracket\n", caller);
        break;
      case -3372849529167478127: // case ; case semicolon
        printf("%s End of statement\n", caller);
        struct ExpressionSource * _newline2 = malloc(sizeof(struct ExpressionSource));
        struct ExpressionSource * _emptyline2 = malloc(sizeof(struct ExpressionSource));
        struct ExpressionSource ** _empty4 = malloc(sizeof(struct ExpressionSource*));
        struct Expression ** _new_expressions2 = calloc(100, sizeof(struct Expression*));
        struct Expression * _exprs = calloc(1, sizeof(struct Expression));
        statementsource->statements++;
        statements[statementsource->statements - 1] = _newline2;
        _newline2->expression_length = 0;
        _newline2->expressions = _new_expressions2;
        _newline2->current_into = &_new_expressions2;
        break;
      case 6385555319: // case ( case open
        printf("open bracket\n");
        
        printf("OWNER %d\n", statements[statementsource->statements - 1]->expression_length - 1);
        dump_expressions(1, statements[statementsource->statements - 1]);
        struct Expression ** owner = statements[statementsource->statements - 1]->expressions;
        int owner_size = statements[statementsource->statements - 1]->expression_length;
        struct Expression *** owner_into = statements[statementsource->statements - 1]->current_into;
        
        struct ExpressionSource ** _newstatements = calloc(100, sizeof(struct ExpressionSource*)); 
        struct Expression ** empty = calloc(100, sizeof(struct Expression*)); 
        struct Expression ** method_call_expressions = calloc(100, sizeof(struct Expression*));
        method_call_expressions[0] = owner[owner_size - 1];
        // the identifier of a method call is metadata and doesn't need to be evaluated
        method_call_expressions[0]->tag = IS_AST_METADATA;
        struct ExpressionSource * expression_exps = malloc(sizeof(struct ExpressionSource)); 
        struct StatementSource * newstatementsource2 = malloc(sizeof(struct StatementSource));
        // struct Expression ** expressions = calloc(100, sizeof(struct Expression*)); 
        struct Expression * method_call = malloc(sizeof(struct Expression));
        owner[owner_size - 1] = method_call;
        // statements[statementsource->statements - 1]->expression_length = 1;
        method_call->id = parse_result->current_id++;
        method_call->type = METHOD_CALL;
        // method_call->stringvalue = token;
        method_call->exps = _newstatements;
        method_call->statements = newstatementsource2;
        newstatementsource2->statements = 1;
        _newstatements[0] = expression_exps;
        method_call->exps[newstatementsource2->statements - 1]->expression_length = 1;
        method_call->exps[newstatementsource2->statements - 1]->expressions = method_call_expressions;
        expression_exps->current_into = owner_into;

        printf("expression location %d %p\n", method_call->exps[newstatementsource2->statements - 1]->expression_length, method_call->exps[newstatementsource2->statements - 1]->expressions[method_call->exps[newstatementsource2->statements - 1]->expression_length - 1]);
        dump_expressions(1, statements[statementsource->statements - 1]);
        
        char * tokenstop = "close";
        
        while (parse_result->end == 0 && strcmp(parse_result->last_token, "close") != 0) {
          printf("Parsing subexpression\n");
          char * before = malloc(sizeof(char) * 2);
          parse_expressions("exprparse", newstatementsource2, _newstatements, head, parse_result, 1, tokenstop);

          memcpy(before, parse_result->last_char, 2); 
          int pos = parse_result->pos;
          if (strcmp(parse_result->last_token, "close") != 0 /*&& strcmp(gettok(parse_result, "commacheck"), "comma") != 0 */) {
            
            free(parse_result->last_char);
            parse_result->last_char = before;
            parse_result->pos = pos;
          } else {
            /*if (strcmp(parse_result->last_token, "comma") == 0) {
              parse_result->pos = parse_result->pos + 1;
            }*/
            // parse_result->pos = parse_result->pos + 1;
          }
        }
        break; 
      case 210709067314: // case , case comma
        printf("%s Comma encountered, creating new statement\n", caller);
        struct ExpressionSource * newline2 = malloc(sizeof(struct ExpressionSource));
        struct ExpressionSource * emptyline2 = malloc(sizeof(struct ExpressionSource));
        struct ExpressionSource ** empty4 = malloc(sizeof(struct ExpressionSource*));
        struct Expression ** new_expressions = calloc(100, sizeof(struct Expression*));
        struct Expression * exprs = calloc(1, sizeof(struct Expression));
        statementsource->statements++;
        statements[statementsource->statements - 1] = newline2;
        newline2->expression_length = 0;
        newline2->expressions = new_expressions;
        newline2->current_into = &new_expressions;
      break;
      default:  // identifier 
        printf("%s parseexpression Is an identifier %s\n", caller, token);
        struct Expression * identifier = malloc(sizeof(struct Expression));
        identifier->type = IDENTIFIER;
        identifier->stringvalue = token;
        identifier->token_type = parse_result->token_type;
        char * first_non_number;
        if (parse_result->token_type == NUMBER) {
          identifier->numbervalue = strtol(token, &first_non_number, 10);
        }

        struct ExpressionSource **newstatements = calloc(100, sizeof(struct ExpressionSource*));
        struct ExpressionSource *identifierexps = malloc(sizeof(struct ExpressionSource));
        struct StatementSource *newstatementsource = malloc(sizeof(struct StatementSource));
        struct Expression **identifierexpressions = calloc(100, sizeof(struct Expression*));

        identifier->id = parse_result->current_id++;
        identifier->exps = newstatements;
        identifier->statements = newstatementsource;
        identifier->symbol = "^";
        newstatementsource->statements = 1;
        newstatements[0] = identifierexps;
        printf("identifier expression %p\n", identifier->exps[newstatementsource->statements - 1]);
        identifier->exps[newstatementsource->statements - 1]->expression_length = 0;
        identifier->exps[newstatementsource->statements - 1]->expressions = identifierexpressions;
        printf("statements %p\n", statements[statementsource->statements - 1]);
        int new_position = statements[statementsource->statements - 1]->expression_length;
        statements[statementsource->statements - 1]->expressions[new_position] = identifier;
        statements[statementsource->statements - 1]->expression_length++;
        printf("expression location %d %p\n", new_position, statements[statementsource->statements - 1]->expressions[new_position]);
        dump_expressions(1, statements[statementsource->statements - 1]);
       break;
    } 
  }
  return statements;
}

struct ParseResult * continue_parse(
  char * caller,
  struct StatementSource *statementsource,
  struct ExpressionSource **statements,
  struct ExpressionSource *head,
  struct ParseResult *parse_result) {


  struct Expression **expressions;
  printf("Getting token\n");
  char * token = gettok(parse_result, "parsebegin");
  printf("%s", token); 


  switch (hash(token)) {
    case 7572387384277067: // case function
      char * function_name = gettok(parse_result, "functionbodybegin");
      struct Function *function = malloc(sizeof(struct Function));
      struct Callsite **callsites = calloc(100, sizeof(struct Callsite*));
      function->callsites = callsites;
      function->parameter_length = 0;
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

        struct Parameter *parameter = malloc(sizeof(struct Parameter));
        parameter->type = type;
        parameter->name = name;
        printf("there are %d parameters\n", function->parameter_length);
        parameters[function->parameter_length++] = parameter;

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

      struct Expression **newinto = calloc(100, sizeof(struct Expression*));
      struct ExpressionSource ** _newstatements = calloc(100, sizeof(struct ExpressionSource*));
      struct ExpressionSource *newexps= calloc(1, sizeof(struct ExpressionSource));
      struct StatementSource *newstatementsource = calloc(1, sizeof(struct StatementSource));
      function->exps = _newstatements;
      _newstatements[0] = newexps;
      function->statements = newstatementsource;
      newstatementsource->statements = 1;
      newexps->current_into = &newinto;
      newexps->expressions = newinto;
      newexps->expression_length = 0;
      
      printf("function parse INTO %p", newinto);
      struct ExpressionSource **returnedexps = parse_expressions("functionparse", newstatementsource, _newstatements, head, parse_result, 0, NULL);
      
      return continue_parse("functionparse", statementsource, statements, head, parse_result);
      break;
    case 177613: // case (
      printf("is a parameter list"); 
      break;
    case 6953778704349: // case .
      printf("is a member access");
       
      break;
    default: // case identifier
      printf("%s Funcbody Is an identifier %s\n", caller, token);
      struct Expression * identifier = malloc(sizeof(struct Expression));
      struct ExpressionSource ** newstatements = malloc(sizeof(struct ExpressionSource*));
      struct ExpressionSource * identifierexps = malloc(sizeof(struct ExpressionSource));
      struct StatementSource * _newstatementsource = malloc(sizeof(struct StatementSource));
      struct Expression ** expression = calloc(100, sizeof(struct Expression));
      _newstatementsource->statements = 1;
      identifier->id = parse_result->current_id++;
      identifier->type = IDENTIFIER;
      identifier->stringvalue = token;
      identifier->exps = newstatements;
      newstatements[0] = identifierexps;
      identifier->exps[_newstatementsource->statements - 1]->expression_length = 0;
      identifier->exps[_newstatementsource->statements - 1]->expressions = expression;
      identifier->statements = _newstatementsource;
      int new_position = statements[statementsource->statements - 1]->expression_length++;
      printf("%s New position is %d\n", caller, new_position);
      printf("identifier INTO %p\n", statements[statementsource->statements - 1]->expressions);
      statements[statementsource->statements - 1]->expressions[new_position] = identifier;
      int expressions_count = 0;
      struct ExpressionSource **expressions = parse_expressions("identifier", statementsource, statements, head, parse_result, 0, NULL);
      break;
  }
  
  return parse_result; 
}

// rootparse
struct ParseResult* parse(int length, char * program_body) {
  struct ParseResult * parse_result = malloc(sizeof(struct ParseResult));
  struct ExpressionSource ** statements = malloc(sizeof(struct ExpressionSource*));
  struct ExpressionSource * exps = malloc(sizeof(struct ExpressionSource));
  struct StatementSource * statementsource = malloc(sizeof(struct StatementSource));
  parse_result->pos = 0;
  parse_result->exps = statements;
  statements[0] = exps;
  statementsource->statements = 1;
  parse_result->length = length;
  parse_result->program_body = program_body;
  char * last_char = malloc((sizeof(char) * 2)); 
  memset(last_char, '\0', 2);
  last_char[0] = ' ';
  last_char[0] = parse_result->program_body[parse_result->pos]; 
  parse_result->last_char = last_char;
  parse_result->end = 0;
  parse_result->start = 1;
  struct Expression **root = calloc(100, sizeof(struct Expression**));
  exps->expressions = root;
  exps->expression_length = 0;
  exps->current_into = &root;
  printf("FIRST INTO %p\n", root); 
  char * keywords[] = {"member", "function", "if", "return", "open", "close", "comma", "add", "subtract", "multiply", "rax", "rbx", "rcx", "rdx", "rsi", "rdi"};
  printf("HASH TABLE %ld\n", sizeof(keywords));
  for (int x = 0 ; x < sizeof(keywords) / sizeof(keywords[0]); x++) {
    printf("%s %ld\n", keywords[x], hash(keywords[x]));
  }
  printf("\n");

  struct Function **functions = calloc(100, sizeof(struct Function*));
  parse_result->functions = functions;
  parse_result->function_length = 0;
  parse_result->statements = statementsource;
  return continue_parse("rootparse", statementsource, statements, exps, parse_result);
}


int dump_function(struct Function *function) {
  printf("##########");
  printf("Function %s\n", function->name); 
  for (int x = 0 ; x < function->parameter_length; x++) {
    printf("- parameter name %s\n", function->parameters[x]->name);
    printf("- parameter type %s\n", function->parameters[x]->type);
  }
  printf("Has %d statements\n", function->statements->statements);
  for (int x = 0 ; x < function->statements->statements; x++) {
    dump_expressions(1, function->exps[x]);
  }
}
/*
int descendanf(struct NormalForm * anf, struct ExpressionSource *expressions) {
  for (int x = expressions->expression_length - 1; x >= 0 ; x--) {
    for (int y = expressions->expressions[x]->statements->statements - 1 ; y >= 0 ; y--) {
      descendanf(anf, expressions->expressions[x]->exps[y]);
    }
    anf->expressions[anf->count++] = expressions->expressions[x];
  }
}*/
int descendanf(struct NormalForm * anf, struct ExpressionSource *expressions) {
  for (int x = expressions->expression_length - 1; x >= 0  ; x--) {
  // for (int x = 0; x < expressions->expression_length ; x++) {
    // for (int y = 0 ; y < expressions->expressions[x]->statements->statements ; y++) {
    for (int y = expressions->expressions[x]->statements->statements - 1 ; y >= 0 ; y--) {
      descendanf(anf, expressions->expressions[x]->exps[y]);
    }
    anf->expressions[anf->count++] = expressions->expressions[x];
  }
}

struct ANF * normalform(struct ParseResult *parse_result) {
  struct ANF * result = malloc(sizeof(struct ANF));  
  struct NormalForm * anf = malloc(sizeof(struct NormalForm));  
  result->anf = anf; 
  result->functions = parse_result->functions;
  for (int x = 0 ; x < parse_result->function_length; x++) {
    parse_result->functions[x]->id = x;
  }
  result->function_length = parse_result->function_length;

  struct Expression ** expressions = calloc(100, sizeof(struct Expression*));  
  anf->expressions = expressions;
  anf->count = 0;
  for (int x = 0 ; x < parse_result->function_length; x++) {
    struct NormalForm * function_anf = malloc(sizeof(struct NormalForm));
    struct Expression ** function_expressions= calloc(100, sizeof(struct Expression*));
    parse_result->functions[x]->anf = function_anf;
    parse_result->functions[x]->anf->count = 0;
    parse_result->functions[x]->anf->expressions = function_expressions;
    for (int y = 0 ; y < parse_result->functions[x]->statements->statements; y++) {
      descendanf(parse_result->functions[x]->anf, parse_result->functions[x]->exps[y]);
    }
  }
  for (int y = 0 ; y < parse_result->statements->statements; y++) {
    descendanf(anf, parse_result->exps[y]);
  }
  return result;
}

struct Function * resolve_name(struct CodeGenContext * context, char * function_name) {
  printf("Resolving function %s\n", function_name);
  for (int x = 0 ; x < context->function_length; x++) {
    printf("Inspecting function %s\n", context->user_functions[x]->name);
    if (strcmp(context->user_functions[x]->name, function_name) == 0) {
      return context->user_functions[x];
    }
  }
  for (int x = 0 ; x < context->global_function_length; x++) {
    if (strcmp(context->global_functions[x]->name, function_name) == 0) {
      return context->global_functions[x];
    }
  }
}

int writecode(struct CodeGenContext * context, struct FunctionContext * function_context, struct NormalForm * anf) {
  for (int x = 0 ; x < anf->assignment_pair->assignment_length; x++) {
    switch (anf->assignment_pair->assignments[x].expression->type) {
      case METHOD_CALL:
         printf("Generating method call\n"); 
         int call_bytes_length = 2;
         char * method_bytes = malloc(call_bytes_length);
         int method_ins_count = 0;
         method_bytes[method_ins_count++] = 0xff; 
         method_bytes[method_ins_count++] = 0xd0; 
         char * method_address = malloc(sizeof(char) * 4);
         int method_address_count = 0;
         struct Expression * method_call_expression = anf->assignment_pair->assignments[x].expression;
         struct Expression * method_call_name_identifier =  anf->assignment_pair->assignments[x].expression->exps[0]->expressions[0];
         char * method_name = method_call_name_identifier->stringvalue;
         struct Function * function = resolve_name(context, method_name);
         printf("%s\n", method_name);
         
         printf("Method call to function %s at %p\n", method_name, function->code);

         struct Expression * arg1 = anf->assignment_pair->assignments[x].expression->exps[0]->expressions[1];
         printf("%s %p\n", arg1->stringvalue, arg1->stringvalue);
         // push rsp rbp
         // function_context->code[function_context->pc++] = 0x48; 
         //function_context->code[function_context->pc++] = 0x89; 
         // function_context->code[function_context->pc++] = 0xe5; 
          
          
         if (function->compiled == 1) {
           if (function->global == 1) {
             // load string
             function_context->code[function_context->pc++] = 0x48; 
             function_context->code[function_context->pc++] = 0xbf; 
             char * start = function_context->code + function_context->pc; 
             char * address = malloc(sizeof(char) * 8);
              
             address = arg1->stringvalue;
             printf("%p %p relative pointer %ld\n", arg1->stringvalue, address, (long) address);
             memcpy(start, &address, 8);
             function_context->pc += 8;
             // jump location
             function_context->code[function_context->pc++] = 0x48; 
             function_context->code[function_context->pc++] = 0xb8; 

             char * start2 = function_context->code + function_context->pc; 
             char * address2 = malloc(sizeof(char) * 8);
              
             address2 = function->code;
             printf("%p %p relative pointer %ld\n", function->code, address2, (long) address2);
             memcpy(start2, &address2, 8);
             function_context->pc += 8;
             function_context->code[function_context->pc++] = 0x48; 
           
             for (int n = 0 ; n < sizeof(char) * 4; n++) {
               // method_address[method_address_count++] = function->code[n];
             }
             for (int n = 0 ; n < call_bytes_length; n++) {
               method_bytes[method_ins_count++] = method_address[n];
             }
             for (int i = 0; i < call_bytes_length; i++) {
               function_context->code[function_context->pc++] = method_bytes[i]; 
             } 
           }
         } else {
           function_context->code[function_context->pc++] = 0x48; 
           function_context->code[function_context->pc++] = 0xbf; 
           char * start = function_context->code + function_context->pc; 
           uintptr_t * address = malloc(sizeof(uintptr_t) * 1);
            
           *address = (uintptr_t) function->id;
           printf("%p %p creating function id %ld\n", arg1->stringvalue, address, (long) address);
           memcpy(start, address, 8);
           function_context->pc += 8;

           function_context->code[function_context->pc++] = 0x49; 
           function_context->code[function_context->pc++] = 0xbb; 
           char * compile_stub_start = function_context->code + function_context->pc; 
           char * compile_address = malloc(sizeof(char) * 8);
            
           compile_address = (char*)compile_stub;
           printf("%p creating function stub %ld\n", compile_address, (long) compile_address);
           memcpy(compile_stub_start, &compile_address, 8);

           struct Callsite *callsite = malloc(sizeof(struct Callsite));
           callsite->pc = function_context->pc;
           callsite->function = function;
           callsite->function_context = function_context;
           function->callsites[function->callsite_length++] = callsite; 

           function_context->pc += 8;
            
           function_context->code[function_context->pc++] = 0x41; 
           function_context->code[function_context->pc++] = 0xff; 
           function_context->code[function_context->pc++] = 0xd3; 

         }
         break;
      case ADD:
         printf("Generating add\n"); 
         int add_size_of_immediate = sizeof(char) * sizeof(int);
         int add_bytes_length = 3 * sizeof(char);
         printf("%d add bytes length\n", add_bytes_length);
         char * add_bytes = malloc(add_bytes_length);
         int add_bytes_count = 0;

         struct Expression * left = anf->expressions[x]->exps[0]->expressions[0];
         struct Expression * right = anf->expressions[x]->exps[0]->expressions[1];
         char * register_left = left->chosen_register;
         char * register_right = right->chosen_register;
         // function_context->code[function_context->pc++] = 0x48; 
         printf("Add instruction left is %s\n", register_left); 
         printf("Right instruction right is %s\n", register_right); 
         char * destination_register = anf->expressions[x]->chosen_register;
         printf("my register is %s\n", destination_register);
         
         if (strcmp(register_left, destination_register) == 0) {
           printf("register left is destination register");
           register_left = register_right;
         }
         
         add_bytes[add_bytes_count++] = 0x48; 
         add_bytes[add_bytes_count++] = 0x01; 
          
         unsigned long reg_left = hash(destination_register);
         unsigned long reg_right = hash(register_left);
         switch (reg_right) {
           case 193504464: // case rax 
             switch (reg_left) {
               case 193504497: // case rbx 
                 add_bytes[2] = 0xd8;
               break;
               case 193504530: // case rcx 
                 add_bytes[2] = 0xc8;
               break;
               case 193504563: // case rdx 
                 add_bytes[2] = 0xd0;
               break;
               case 193505043: // case rsi 
                 add_bytes[2] = 0xf0;
               break;
               case 193504548: // case rdi 
                 add_bytes[2] = 0xf8;
               break;
             }
           break;
           case 193504497: // case rbx 
             switch (reg_left) {
               case 193504464: // case rax 
                 add_bytes[2] = 0xc3;
               break;
               case 193504530: // case rcx 
                 add_bytes[2] = 0xcb;
               break;
               case 193504563: // case rdx 
                 add_bytes[2] = 0xd3;
               break;
               case 193505043: // case rsi 
                 add_bytes[2] = 0xf3;
               break;
               case 193504548: // case rdi 
                 add_bytes[2] = 0xfb;
               break;
             }
           break;
           case 193504530: // case rcx 
             switch (reg_left) {
               case 193504464: // case rax 
                 add_bytes[2] = 0xc1;
               break;
               case 193504497: // case rbx 
                 add_bytes[2] = 0xd9;
               break;
               case 193504563: // case rdx 
                 add_bytes[2] = 0xd1;
               break;
               case 193505043: // case rsi 
                 add_bytes[2] = 0xf1;
               break;
               case 193504548: // case rdi 
                 add_bytes[2] = 0xf9;
               break;
             }
           break;
           case 193504563: // case rdx 
             switch (reg_left) {
               case 193504464: // case rax 
                 add_bytes[2] = 0xc2;
               break;
               case 193504497: // case rbx 
                 add_bytes[2] = 0xda;
               break;
               case 193504530: // case rcx 
                 add_bytes[2] = 0xca;
               break;
               case 193505043: // case rsi 
                 add_bytes[2] = 0xf2;
               break;
               case 193504548: // case rdi 
                 add_bytes[2] = 0xfa;
               break;
             }
           break;
           case 193505043: // case rsi 
             switch (reg_left) {
               case 193504464: // case rax 
                 add_bytes[2] = 0xc6;
               break;
               case 193504497: // case rbx 
                 add_bytes[2] = 0xde;
               break;
               case 193504530: // case rcx 
                 add_bytes[2] = 0xce;
               break;
               case 193504563: // case rdx 
                 add_bytes[2] = 0xd6;
               break;
               case 193504548: // case rdi 
                 add_bytes[2] = 0xfe;
               break;
             }
           break;
           case 193504548: // case rdi 
             switch (reg_left) {
               case 193504464: // case rax 
                 add_bytes[2] = 0xc7;
               break;
               case 193504497: // case rbx 
                 add_bytes[2] = 0xdf;
               break;
               case 193504530: // case rcx 
                 add_bytes[2] = 0xcf;
               break;
               case 193504563: // case rdx 
                 add_bytes[2] = 0xd7;
               break;
               case 193505043: // case rsi 
                 add_bytes[2] = 0xf7;
               break;
             }
           break;
         }
          
         for (int n = 0; n < add_bytes_length; n++) {
            function_context->code[function_context->pc++] = add_bytes[n]; 
         }
         break;  
      case IDENTIFIER: 
         if (anf->expressions[x]->tag != IS_AST_METADATA) {
           printf("Generating reference\n"); 
           if (anf->expressions[x]->token_type == NUMBER) {
             int size_of_immediate = sizeof(char) * 4;
             int bytes_count = (3 * sizeof(char)) + size_of_immediate;
             char * bytes = malloc(bytes_count);
             int byte_count = 0;
             bytes[0] = 0x48; 
             bytes[1] = 0xc7;
             /*
  rax 193504464
  rbx 193504497
  rcx 193504530
  rdx 193504563
  rsi 193505043
  rdi 193504548

             */
             printf("%s %s\n", anf->assignment_pair->assignments[x].variable, anf->assignment_pair->assignments[x].text);
             for (int y = 0 ; y < anf->assignment_pair->assignments[x].reference_length; y++) {
               printf("reference %s\n", anf->assignment_pair->assignments[x].references[y]); 
             }
             unsigned long reg = hash(anf->assignment_pair->assignments[x].chosen_register);
             switch (reg) {
               case 193504464: // case rax 
                 bytes[2] = 0xc0;
               break;
               case 193504497: // case rbx 
                 bytes[2] = 0xc3;
               break;
               case 193504530: // case rcx 
                 bytes[2] = 0xc1;
               break;
               case 193504563: // case rdx 
                 bytes[2] = 0xc2;
               break;
               case 193505043: // case rsi 
                 bytes[2] = 0xc6;
               break;
               case 193504548: // case rdi 
                 bytes[2] = 0xc7;
               break;
             }
             int * immediate = malloc(size_of_immediate);    
             char * immediate_bytes = (char*)&immediate; 
             memcpy(immediate_bytes, &anf->expressions[x]->numbervalue, size_of_immediate);
             int ins_counter = 3;
             bytes[ins_counter++] = immediate_bytes[0];
             bytes[ins_counter++] = immediate_bytes[1];
             bytes[ins_counter++] = immediate_bytes[2];
             bytes[ins_counter++] = immediate_bytes[3];
             printf("mov $%d, %%%s\n", anf->expressions[x]->numbervalue, anf->assignment_pair->assignments[x].chosen_register);
             for (int n = 0 ; n < bytes_count; n++) {
               printf("%x\n", bytes[n] & 0xff);
             }
             for (int n = 0; n < bytes_count; n++) {
              function_context->code[function_context->pc++] = bytes[n]; 
             }
           }
           // emit_mov_constant(anfs-> 
         }
      break;  
    }
  }  
}
int dump_machine_code(char * name, char * code) {
  printf("%s machine code\n", name);
  for (int n = 0 ; n < 100; n++) {
    if (n % 8 == 0) { printf("\n"); }
    printf("%x ", code[n] & 0xff);
  }

}
int compile_stub(int function_id) {
  printf("Calling compile of user function for stub %d\n", function_id);
  struct Function * function = CODEGEN_CONTEXT->user_functions[function_id];    
  struct FunctionContext *function_context = function->context;
  function->context->pc = 0;
  mprotect(function->context->code, getpagesize(), PROT_READ | PROT_EXEC | PROT_WRITE);
  char *write_region = function->context->code;
  memset(function_context->code, 0, getpagesize());
  write_region[function_context->pc++] = 0x55;
  writecode(CODEGEN_CONTEXT, function->context, function->anf);
  write_region[function_context->pc++] = 0x5d; 
  write_region[function_context->pc++] = 0xc3; 
  mprotect(function->context->code, getpagesize(), PROT_READ | PROT_EXEC);
  printf("Patching callsites\n");  
  char * address = malloc(sizeof(char) * 8);
  address = function->code;
  printf("Function %s compiled to %p there are %d callsites\n", function->name, function->code, function->callsite_length);
  for (int x = 0 ; x < function->callsite_length; x++) {
    printf("%d\n", x);
    struct Callsite *callsite = function->callsites[x];
    char * start = callsite->function_context->code + callsite->pc; 
    mprotect(callsite->function_context->code, getpagesize(), PROT_READ | PROT_EXEC | PROT_WRITE);
    printf("Need to patch %p %d with %p %p\n", callsite->function_context->code, callsite->pc, function->code, start);
    memcpy(start, &address, 8);
    mprotect(callsite->function_context->code, getpagesize(), PROT_READ | PROT_EXEC);
    printf("SUCCESS Patching callsite to %d\n", callsite->pc);
  }
  char name[100]; 
  sprintf(name, "Lazy compilation %s", function->name);
  dump_machine_code(name, function->code);
  dump_machine_code("Main method again", CODEGEN_CONTEXT->main_function_context->code);

  char filename[100]; 
  sprintf(filename, "%s.bin", function->name);
  FILE * fp = fopen(filename, "wb");  
  fwrite(function->code, 150, 1, fp);
  fflush(fp);
  fclose(fp);
  int (*jmp_func)(void) = (void *) address;
  jmp_func();
  return 0;
}

int codegen(struct ANF *anfs) {
  struct CodeGenContext * codegen_context = malloc(sizeof(struct CodeGenContext*));
  anfs->codegen_context = codegen_context;
  codegen_context->heap_start = anfs->heap_start;
  /** Set up address of codegen context so we can find function to compile */
  CODEGEN_CONTEXT = codegen_context;
  struct Function ** global_functions = malloc(sizeof(struct Function*));
  int global_function_length = 0;
  struct Function * printf_function = malloc(sizeof(struct Function));
  printf_function->name = "printf";
  printf_function->global = 1;
  global_functions[global_function_length++] = printf_function;
  codegen_context->global_function_length = global_function_length;
  printf_function->code = malloc(sizeof(char) * 4);
  printf_function->code = (char*)printf; 
  printf_function->compiled = 1;
  codegen_context->global_functions = global_functions; 
  codegen_context->user_functions = anfs->functions; 
  codegen_context->function_length = anfs->function_length;
   
 
  for (int x = 0 ; x < anfs->function_length; x++) { 
    printf("generating code region for function %s %d\n", anfs->functions[x]->name, getpagesize());
    struct FunctionContext * function_context = malloc(sizeof(struct FunctionContext));
    char *write_region = mmap(NULL,
            getpagesize(),
            PROT_READ | PROT_WRITE,
            MAP_SHARED | MAP_ANONYMOUS,
            -1,
            0);
     if (write_region == NULL) {
       error_at_line(-ENOMEM, errno, __FILE__, __LINE__, "couldn't allocate\n");
     }
     function_context->code = write_region;
     anfs->functions[x]->code = write_region;
     anfs->functions[x]->context = function_context;
     write_region[function_context->pc++] = 0x55;
     writecode(codegen_context, function_context, anfs->functions[x]->anf);
     write_region[function_context->pc++] = 0x5d; 
     write_region[function_context->pc++] = 0xc3; 
     mprotect(write_region, getpagesize(), PROT_READ | PROT_EXEC);
     for (int n = 0 ; n < 100; n++) {
       if (n % 8 == 0) { printf("\n"); }
       printf("%x ", function_context->code[n] & 0xff);
     }
  }
  char * main_write_region = mmap(NULL,
       getpagesize(),
       PROT_READ | PROT_WRITE,
       MAP_SHARED | MAP_ANONYMOUS,
       -1,
       0);
  
  if (main_write_region == NULL) {
    error_at_line(-ENOMEM, errno, __FILE__, __LINE__, "couldn't allocate\n");
  }
  struct FunctionContext * main_function_context = malloc(sizeof(struct FunctionContext));
  codegen_context->main_function_context = main_function_context;
  main_function_context->code = main_write_region;
  
  printf("GENERATING 55\n");
  main_write_region[main_function_context->pc++] = 0x55; 
  writecode(codegen_context, main_function_context, anfs->anf);

  main_write_region[main_function_context->pc++] = 0x5d; 
  main_write_region[main_function_context->pc++] = 0xc3;
  mprotect(main_write_region, getpagesize(), PROT_READ | PROT_EXEC);
  dump_machine_code("Main", main_write_region);
  FILE * fp = fopen("main.bin", "wb");  
  fwrite(main_function_context->code, 150, 1, fp);
  fflush(fp);
  fclose(fp);
  printf("\n");
}

int precolour_method_call(struct Expression *expression, char ** real_registers, int register_count) {
  int current_register = 0;
  // printf("Found expression type %d\n", expression->type);
    for (int n = 0 ; n < expression->statements->statements; n++) {
      for (int k = 0 ; k < expression->exps[n]->expression_length; k++) {
        if (current_register >= register_count) {
          printf("WARNING Need to spill\n");
        }
        char * assigned_register = real_registers[current_register++];
        expression->exps[n]->expressions[k]->chosen_register = assigned_register;
        printf("Found expression in method call %d %s %s\n", expression->exps[n]->expressions[k]->type, expression->exps[n]->expressions[k]->stringvalue, assigned_register);
        switch (expression->exps[n]->expressions[k]->type) {
          case METHOD_CALL:
            printf("submethodcall\n");
            precolour_method_call(expression->exps[n]->expressions[k], real_registers, register_count);
          break;
        }
      }
    }
}

int precolour_anf(struct NormalForm *anfs) {
  char ** real_registers = calloc(100, sizeof(char*));
  int register_count = 0; 
  real_registers[register_count++] = "rax";
  real_registers[register_count++] = "rcx";
  real_registers[register_count++] = "rdx";
  real_registers[register_count++] = "rbx";
  real_registers[register_count++] = "rsi";
  real_registers[register_count++] = "rdi";
  for (int x = 0 ; x < anfs->count; x++) {
        switch (anfs->expressions[x]->type) {
          case METHOD_CALL:
            printf("Found method call\n");
            precolour_method_call(anfs->expressions[x], real_registers, register_count);
            break;
        }
  }
  return 0;
}

#define BINOP 0
#define MULTIARY 1
#define UNARY 2
struct AssignmentPair * assignregisters(struct NormalForm *anf) {
  struct Assignment * assignments = calloc(100, sizeof(struct Assignment));
  for (int x = 0 ; x < 100; x++) {
    assignments[x].chosen_register = NULL;
  }
  int assignment_counter = 0; 
  int counter = 0; 
  
  for (int x = 0 ; x < anf->count; x++) {
    struct ExpressionSource *exps = calloc(1, sizeof(struct ExpressionSource));
    struct Expression **expressions = calloc(100, sizeof(struct Expression*));
    exps->expressions = expressions;
    exps->expression_length = 0;
    exps->expressions[exps->expression_length++] = anf->expressions[x];
    assignments[assignment_counter].exps = exps;

    if (anf->expressions[x]->chosen_register != 0) {
      assignments[assignment_counter].chosen_register = anf->expressions[x]->chosen_register;
      printf("FOUND PRECOLOURED REGISTER %p\n", assignments[assignment_counter].chosen_register);
    }
    switch (anf->expressions[x]->type) {
      case METHOD_CALL:
        char * key = malloc(sizeof(char) * 50);
        sprintf(key, "t%d", counter++);
        printf("Method call Assigning %d to variable %s\n", anf->expressions[x]->id, key);
        assignments[assignment_counter].type = MULTIARY;
        assignments[assignment_counter].expression = anf->expressions[x];
        assignments[assignment_counter].variable_length = strlen(key);
        assignments[assignment_counter].variable = key;
        char * _method_variable_key = malloc(sizeof(char)*100);
        sprintf(_method_variable_key, "%d-%s", anf->expressions[x]->id, key );
        assignments[assignment_counter].variable_key = _method_variable_key;
        
        assignments[assignment_counter].symbol = anf->expressions[x]->symbol;
        assignments[assignment_counter].left = anf->expressions[x]->variable; 
        anf->expressions[x]->variable = key;
        anf->expressions[x]->variable_length = assignments[assignment_counter].variable_length;
        char method_call_text[300];
        memset(method_call_text, '\0', 300);
        int position = 0;
        int first = 0;
        int reference_count = 0;
        int reference_variable_length_count = 0;
        char ** references = calloc(100, sizeof(char));
        int ** reference_variable_length = calloc(100, sizeof(int*));
        struct Expression ** reference_expressions = calloc(100, sizeof(struct Expression*));
        int reference_expressions_count = 0;
        assignments[assignment_counter].references = references;
        // comma separated expressions are statements 
        for (int y = 0 ; y < anf->expressions[x]->statements->statements; y++) {

            for (int e = 0; e < anf->expressions[x]->exps[y]->expression_length; e++) {
              char * method_variable_key = malloc(sizeof(char)*100);
              sprintf(method_variable_key, "%d-%s", anf->expressions[x]->exps[y]->expressions[e]->id, anf->expressions[x]->exps[y]->expressions[e]->variable );
              references[reference_count++] = anf->expressions[x]->exps[y]->expressions[e]->variable;
              reference_expressions[reference_expressions_count++] = anf->expressions[x]->exps[y]->expressions[e];
              int * method_variable_key_length = malloc(sizeof(int));
              *method_variable_key_length = strlen(method_variable_key); 
              reference_variable_length[reference_variable_length_count++] = method_variable_key_length;
              for (int c = 0 ; c < anf->expressions[x]->exps[y]->expressions[e]->variable_length ; c++) {
                method_call_text[position++] = anf->expressions[x]->exps[y]->expressions[e]->variable[c];
              }
              if (first == 1) {
                method_call_text[position++] = ' ';
                method_call_text[position++] = ',';
                method_call_text[position++] = ' ';
              }
              if (first == 0) {
                method_call_text[position++] = '(';
                first = 1;
              }
           }
        }
        assignments[assignment_counter].reference_length = reference_count;
        assignments[assignment_counter].reference_variable_length = reference_variable_length;
        assignments[assignment_counter].reference_expressions = reference_expressions;
        assignments[assignment_counter].reference_expressions_length = reference_expressions_count;
        method_call_text[position++] = ')';
        // printf("%s\n", method_call_text);

        char * text = malloc(sizeof(char) * 400);
        sprintf(key, "t%d", counter++);
        sprintf(text, "%s <- %s", key, method_call_text);
        assignments[assignment_counter].text = text;

        assignment_counter++;
        break;
      case IDENTIFIER:
        if (anf->expressions[x]->assigned == 0) {
          printf("Created a identifier reference\n");
          anf->expressions[x]->assigned = 1;
          assignments[assignment_counter].type = UNARY;
          assignments[assignment_counter].expression = anf->expressions[x];
          assignments[assignment_counter].symbol = anf->expressions[x]->symbol;
          assignments[assignment_counter].variable = anf->expressions[x]->stringvalue;
          char * _identifier_variable_key = malloc(sizeof(char)*100);
          sprintf(_identifier_variable_key, "%d-%s", anf->expressions[x]->id, anf->expressions[x]->stringvalue);
          assignments[assignment_counter].variable_key = _identifier_variable_key;
          assignments[assignment_counter].variable_length = strlen(assignments[assignment_counter].variable);
          anf->expressions[x]->variable_length = assignments[assignment_counter].variable_length;
          anf->expressions[x]->variable = anf->expressions[x]->stringvalue;
          char * text5 = malloc(sizeof(char) * 100);
          char ** references = calloc(100, sizeof(char*));
          int ** reference_variable_length = calloc(100, sizeof(int*));
          struct Expression ** identifier_reference_expressions = calloc(100, sizeof(struct Expression*));
          int identifier_reference_count = 0;
          int identifier_reference_variable_count = 0;
          int identifier_reference_expression_count = 0;
          assignments[assignment_counter].references = references;
          assignments[assignment_counter].reference_variable_length = reference_variable_length;
          assignments[assignment_counter].reference_expressions = identifier_reference_expressions;
          char * identifier_variable_key = malloc(sizeof(char)*100);
          sprintf(identifier_variable_key, "%d-%s", anf->expressions[x]->id, anf->expressions[x]->variable);
          int * identifier_variable_key_length = malloc(sizeof(int));
          *identifier_variable_key_length = strlen(identifier_variable_key);
          reference_variable_length[identifier_reference_variable_count++] = identifier_variable_key_length;
          identifier_reference_expressions[identifier_reference_expression_count++] = anf->expressions[x];
          references[identifier_reference_count++] = anf->expressions[x]->variable;
          memset(text5, '\0', 100);
          sprintf(text5, "%s <- %s", assignments[assignment_counter].variable, assignments[assignment_counter].variable);
          assignments[assignment_counter].reference_length = identifier_reference_count;
          assignments[assignment_counter].text = text5; 
          assignment_counter++;
        }
        break; 
      case MEMBER_ACCESS:
        char * key2 = malloc(sizeof(char) * 50);
        sprintf(key2, "t%d", counter++);
        printf("Member lookup Assigning %d to variable %s\n", anf->expressions[x]->id, key2);
        assignments[assignment_counter].type = BINOP;
        assignments[assignment_counter].variable = key2;
        assignments[assignment_counter].expression = anf->expressions[x];
        assignments[assignment_counter].variable_length = strlen(key2);
        char * _member_variable_key = malloc(sizeof(char)*100);
        sprintf(_member_variable_key, "%d-%s", anf->expressions[x]->id, key2);
        assignments[assignment_counter].variable_key = _member_variable_key;
        assignments[assignment_counter].symbol = anf->expressions[x]->symbol;
        anf->expressions[x]->variable = key2;
        anf->expressions[x]->variable_length = assignments[assignment_counter].variable_length;
        char * text4 = malloc(sizeof(char) * 100);
        sprintf(key2, "t%d", counter++);
        memset(text4, '\0', 100);
        int member_reference_count = 0;
        char ** member_references = calloc(100, sizeof(char));
        struct Expression ** member_reference_expressions = calloc(100, sizeof(struct Expression*));
        int ** member_reference_variable_length = calloc(100, sizeof(int));
        int member_reference_variable_length_count = 0;
        int member_reference_expression_count = 0;
        char * member_variable_key = malloc(sizeof(char)*100);
        sprintf(member_variable_key, "%d-%s", anf->expressions[x]->exps[0]->expressions[0]->id, anf->expressions[0]->exps[0]->expressions[0]->variable);
        assignments[assignment_counter].references = member_references;
        assignments[assignment_counter].reference_expressions = member_reference_expressions;
        assignments[assignment_counter].references[member_reference_count++] = anf->expressions[x]->exps[0]->expressions[0]->variable;
        assignments[assignment_counter].reference_expressions[member_reference_expression_count++] = anf->expressions[x]->exps[0]->expressions[0];
        assignments[assignment_counter].reference_expressions[member_reference_expression_count++] = anf->expressions[x]->exps[0]->expressions[1];
        assignments[assignment_counter].reference_expressions_length = member_reference_expression_count;
        int * member_variable_key_length = malloc(sizeof(int));
        *member_variable_key_length = strlen(member_variable_key);
        assignments[assignment_counter].reference_variable_length[member_reference_variable_length_count++] = member_variable_key_length ;
        assignments[assignment_counter].reference_variable_length = member_reference_variable_length;
        sprintf(text4, "%s <- %s %s", key2, anf->expressions[x]->exps[0]->expressions[0]->variable, anf->expressions[x]->exps[0]->expressions[1]->variable);
        assignments[assignment_counter].text = text4;
        assignments[assignment_counter].reference_length = member_reference_count;
        assignment_counter++;
        break;
      case ADD:
        char * key3 = malloc(sizeof(char) * 50);
        sprintf(key3, "t%d", counter++);
        printf("Add operation Assigning %d to variable %s\n", anf->expressions[x]->id, key3);

        assignments[assignment_counter].type = BINOP;
        assignments[assignment_counter].variable = key3;
        assignments[assignment_counter].expression = anf->expressions[x];
        assignments[assignment_counter].variable_length = strlen(key3);
        char * _add_variable_key = malloc(sizeof(char)*100);
        sprintf(_add_variable_key, "%d-%s", anf->expressions[x]->id, key2);
        assignments[assignment_counter].variable_key = _add_variable_key;
        assignments[assignment_counter].symbol = anf->expressions[x]->symbol;
        anf->expressions[x]->variable = key3;
        anf->expressions[x]->variable_length = assignments[assignment_counter].variable_length;
        
        assignments[assignment_counter].left = anf->expressions[x]->exps[0]->expressions[0]->variable;
        assignments[assignment_counter].right = anf->expressions[x]->exps[0]->expressions[1]->variable;
        int add_reference_count = 0;
        int add_reference_variable_length_count = 0;
        int add_reference_expressions_count = 0;
        char ** add_references = calloc(100, sizeof(char));
        struct Expression ** add_reference_expressions = calloc(100, sizeof(struct Expression*));
        int ** add_reference_variable_length = calloc(100, sizeof(int));
        int * left_length = malloc(sizeof(int));
        int * right_length = malloc(sizeof(int));
        char * add_variable_key_left = malloc(sizeof(char)*100);
        char * add_variable_key_right = malloc(sizeof(char)*100);
        sprintf(add_variable_key_left, "%d-%s", anf->expressions[x]->exps[0]->expressions[0]->id, anf->expressions[x]->exps[0]->expressions[0]->variable);
        sprintf(add_variable_key_right, "%d-%s", anf->expressions[x]->exps[0]->expressions[1]->id, anf->expressions[x]->exps[0]->expressions[1]->variable);

        *left_length = strlen(add_variable_key_left);
        *right_length = strlen(add_variable_key_right);

        add_reference_variable_length[add_reference_variable_length_count++] = left_length;
        add_references[add_reference_count++] = anf->expressions[x]->exps[0]->expressions[0]->variable;
        add_references[add_reference_count++] = anf->expressions[x]->exps[0]->expressions[1]->variable;
        add_reference_variable_length[add_reference_variable_length_count++] = right_length;
        add_reference_expressions[add_reference_expressions_count++] = anf->expressions[x]->exps[0]->expressions[0];
        add_reference_expressions[add_reference_expressions_count++] = anf->expressions[x]->exps[0]->expressions[1];
        assignments[assignment_counter].references = add_references;
        assignments[assignment_counter].reference_expressions = add_reference_expressions;
        assignments[assignment_counter].reference_expressions_length = add_reference_expressions_count;
        assignments[assignment_counter].reference_variable_length = add_reference_variable_length;
        char * text2 = malloc(sizeof(char) * 100);
        memset(text2, '\0', 100);
        sprintf(text2, "%s <- %s %s %s", key3, assignments[assignment_counter].left, assignments[assignment_counter].symbol, assignments[assignment_counter].right);
        assignments[assignment_counter].text = text2;
        assignments[assignment_counter].reference_length = add_reference_count;
        assignment_counter++;
        break;
      case RETURN:
        char * key4 = malloc(sizeof(char) * 50);
        sprintf(key4, "t%d", counter++);
        printf("Return operation Assigning %d to variable %s\n", anf->expressions[x]->id, key4);

        assignments[assignment_counter].type = UNARY;
        assignments[assignment_counter].variable = key3;
        assignments[assignment_counter].expression = anf->expressions[x];
        assignments[assignment_counter].variable_length = strlen(key3);
        char * _return_variable_key = malloc(sizeof(char)*100);
        sprintf(_return_variable_key, "%d-%s", anf->expressions[x]->id, key2);
        assignments[assignment_counter].variable_key = _return_variable_key;
        assignments[assignment_counter].symbol = anf->expressions[x]->symbol;
        anf->expressions[x]->variable = key3;
        anf->expressions[x]->variable_length = assignments[assignment_counter].variable_length;
        
        assignments[assignment_counter].left = anf->expressions[x]->exps[0]->expressions[0]->variable;
        int return_reference_count = 0;
        int return_reference_variable_length_count = 0;
        int return_reference_expressions_count = 0;
        char ** return_references = calloc(100, sizeof(char));
        struct Expression ** return_reference_expressions = calloc(100, sizeof(struct Expression*));
        int ** return_reference_variable_length = calloc(100, sizeof(int));
        int * return_left_length = malloc(sizeof(int));
        char * return_variable_key_left = malloc(sizeof(char)*100);
        sprintf(return_variable_key_left, "%d-%s", anf->expressions[x]->exps[0]->expressions[0]->id, anf->expressions[x]->exps[0]->expressions[0]->variable);

        *left_length = strlen(return_variable_key_left);

        return_reference_variable_length[return_reference_variable_length_count++] = return_left_length;
        return_references[return_reference_count++] = anf->expressions[x]->exps[0]->expressions[0]->variable;
        return_reference_expressions[return_reference_expressions_count++] = anf->expressions[x]->exps[0]->expressions[0];
        assignments[assignment_counter].references = return_references;
        assignments[assignment_counter].reference_expressions = return_reference_expressions;
        assignments[assignment_counter].reference_expressions_length = return_reference_expressions_count;
        assignments[assignment_counter].reference_variable_length = return_reference_variable_length;
        char * return_text = malloc(sizeof(char) * 100);
        memset(return_text, '\0', 100);
        sprintf(return_text, "%s <- %s %s", key4, assignments[assignment_counter].left, assignments[assignment_counter].symbol);
        assignments[assignment_counter].text = return_text;
        assignments[assignment_counter].reference_length = return_reference_count;
        assignment_counter++;
        break;
      default:
      printf("DEFAULT CASE %d\n", anf->expressions[x]->type);


    }     
  }

  for (int x = 0 ; x < assignment_counter; x++) {
    printf("%s\n", assignments[x].text);
  }
  struct AssignmentPair * assignment_pair = malloc(sizeof(struct AssignmentPair));
  assignment_pair->assignments = assignments;
  assignment_pair->assignment_length = assignment_counter;
  anf->assignment_pair = assignment_pair;
  return assignment_pair;
}

struct RangePair * liveranges(struct NormalForm * anf, struct AssignmentPair *assignment_pair) {
    struct hashmap *variables = calloc(10, sizeof(struct hashmap));
    char ** variables_list = calloc(100, sizeof(char*));
    int ** variables_list_length = calloc(100, sizeof(int*));
    int variable_length = 0;
    for (int i = 0 ; i < 10; i++) {
        variables[i].id = i;
    }
    for (int x = 0 ; x < assignment_pair->assignment_length; x++) {
      /*char key[50];
      memset(key, '\0', 50);
      sprintf(key, "%d", anfs->anf->expressions[x]->id);*/
      for (int r = 0 ; r < assignment_pair->assignments[x].reference_length; r++) {
        char * reference = assignment_pair->assignments[x].references[r];
        printf("%s\n", reference); 
        printf("looking up %s\n", reference);
        struct hashmap_value *lookup = get_hashmap(&variables[0], reference);
        if (lookup->set == 0) {
          printf("key doesn't exist\n");
          set_hashmap(&variables[0], reference, (uintptr_t) &anf->expressions[x], *assignment_pair->assignments[x].reference_variable_length[r]);
          variables_list[variable_length] = reference;
          variables_list_length[variable_length] = assignment_pair->assignments[x].reference_variable_length[r];
          variable_length++;
        } else {
          printf("key exists\n");
        }
      }
    } 
    struct Range ** ranges = calloc(100, sizeof(struct Range*));
    int range_count = 0;
    for (int v = 0; v < variable_length; v++) {
      char * search_target = variables_list[v]; 
      int start_position_a = -1; 
      struct Assignment *start_assignment;
      struct Assignment *end_assignment;
      int end_position_a = -1; 
      int variable_length = *variables_list_length[v];
      for (int x = 0 ; x < assignment_pair->assignment_length; x++) {
        if (strcmp(assignment_pair->assignments[x].variable, search_target) == 0) {
          start_position_a = x;
          start_assignment = &assignment_pair->assignments[x];
          break;
        }
      }
      for (int x = 0 ; x < assignment_pair->assignment_length; x++) {
        if (strcmp(assignment_pair->assignments[x].variable, search_target) == 0) {
          end_position_a = x;
          end_assignment = &assignment_pair->assignments[x];
        }
        for (int y = 0 ; y <  assignment_pair->assignments[x].reference_length; y++) {
          if (strcmp(assignment_pair->assignments[x].references[y], search_target) == 0) {
            end_position_a = x;
            end_assignment = &assignment_pair->assignments[x];
          }
           
        }
      }
     struct Range * range = malloc(sizeof(struct Range));
     range->start_position = start_position_a;
     range->end_position = end_position_a;
     range->variable = search_target;
     range->variable_length = variable_length;
     range->start_assignment = start_assignment;
     range->end_assignment = end_assignment;
     ranges[range_count++] = range;
     printf("Variable %s appears %d-%d\n", search_target, start_position_a, end_position_a); 

   } 

  struct RangePair *range_pair = malloc(sizeof(struct RangePair));
  range_pair->ranges = ranges;
  range_pair->range_length = range_count;
  return range_pair;
}


int assignrealregisters(struct NormalForm *anf, struct RangePair *range_pair, struct AssignmentPair *assignment_pair, char **realregisters, int register_count) {
  char ** previousassignments = calloc(100, sizeof(char*)); 
  for (int x = 0 ; x < register_count; x++) {
    printf("Assigning %s to %d\n", realregisters[x], register_count - x - 1);
    previousassignments[register_count - x - 1] = realregisters[x];
  }
  int assignment_stack_position = register_count - 1;
  struct hashmap *template_variables = malloc(sizeof(struct hashmap)); 
  struct hashmap *registers = malloc(sizeof(struct hashmap)); 
   
  for (int x = 0 ; x < range_pair->range_length; x++) {
    set_hashmap(template_variables, range_pair->ranges[x]->variable, (uintptr_t) 0, range_pair->ranges[x]->variable_length);
  }
  for (int instruction = 0; instruction < assignment_pair->assignment_length; instruction++) {
    for (int r = 0 ; r < range_pair->range_length; r++) {
        if (instruction >= range_pair->ranges[r]->start_position && instruction <= range_pair->ranges[r]->end_position) {
          printf("Instruction %s %s appears in range of %d-%d\n", range_pair->ranges[r]->variable, assignment_pair->assignments[instruction].text, range_pair->ranges[r]->start_position, range_pair->ranges[r]->end_position);  
          
          struct hashmap_value *lookup = get_hashmap(template_variables, range_pair->ranges[r]->variable);
          
          if (instruction == range_pair->ranges[r]->end_position && range_pair->ranges[r]->chosen_register != NULL) {
            printf("Register %s is free\n", (char*) range_pair->ranges[r]->chosen_register); 
            previousassignments[assignment_stack_position + 1] = (char*) range_pair->ranges[r]->chosen_register;
            assignment_stack_position++;
            lookup->value = 0;
            lookup->set = 0;
          }
          printf("assignment position %d\n", assignment_stack_position);
          if (range_pair->ranges[r]->chosen_register == NULL) {
            char * chosen_register = previousassignments[assignment_stack_position];
            set_hashmap(template_variables, range_pair->ranges[r]->variable, (uintptr_t) chosen_register, strlen(chosen_register));
            printf("Assigned register %s to %s <- %s\n", chosen_register, assignment_pair->assignments[instruction].variable, assignment_pair->assignments[instruction].text); 
            assignment_pair->assignments[instruction].chosen_register = chosen_register;
            assignment_pair->assignments[instruction].expression->chosen_register = chosen_register;
            range_pair->ranges[r]->chosen_register = chosen_register;
            assignment_stack_position--;
          }
          //printf("%p %d %d\n", (char*)lookup->value, instruction, range_pair->ranges[r]->end_position);
        }
      } 
  }

  
}

int assign_all_registers(struct NormalForm *anf, struct AssignmentPair *assignment_pair) {
  struct RangePair *range_pair = liveranges(anf, assignment_pair);
  char ** real_registers = calloc(100, sizeof(char*));
  int register_count = 0; 
  real_registers[register_count++] = "rax";
  real_registers[register_count++] = "rcx";
  real_registers[register_count++] = "rdx";
  real_registers[register_count++] = "rbx";
  real_registers[register_count++] = "rsi";
  real_registers[register_count++] = "rdi";

  assignrealregisters(anf, range_pair, assignment_pair, real_registers, register_count);

}


int do_graph_colouring(struct NormalForm *anfs, struct AssignmentPair *assignment_pair) {
  struct hashmap * forward_links = calloc(1, sizeof(struct hashmap));

  printf("### DOING GRAPH COLOURING\n");
  printf("%d assignments\n", assignment_pair->assignment_length);
  for (int x = 0 ; x < assignment_pair->assignment_length; x++) {
    char * var_key = assignment_pair->assignments[x].variable_key;
    printf("Variable %d: %s \n", x, var_key);
    if (assignment_pair->assignments[x].reference_length == 0) {
      char * from = var_key;
      struct Edges *new_edges = calloc(1, sizeof(struct Edges));
      new_edges->from = &assignment_pair->assignments[x];
      new_edges->edge_count = 0;
      new_edges->edges = calloc(100, sizeof(struct Edge*));
      set_hashmap(forward_links, from, (uintptr_t) new_edges, strlen(from));
    }
    for (int k = 0 ; k < assignment_pair->assignments[x].reference_length ; k++) {
      printf("Found reference %s to %s\n", var_key, assignment_pair->assignments[x].references[k]);
      char * from = var_key;
      char * to = assignment_pair->assignments[x].references[k];
      dump_expressions(0, assignment_pair->assignments[x].exps);
      int var_key_length = assignment_pair->assignments[x].variable_length;
      struct hashmap_value *value = get_hashmap(forward_links, from);
      struct Edges *edges;
      if (value->set == 1) {
        printf("Forward link to %s found\n", from);
        edges = (struct Edges*) value->value;
      } else {
        printf("Forward link to %s NOT found\n", from);
        struct Edges *new_edges = calloc(1, sizeof(struct Edges));
        new_edges->from = &assignment_pair->assignments[x];
        new_edges->edge_count = 0;
        new_edges->edges = calloc(100, sizeof(struct Edge*));
        set_hashmap(forward_links, from, (uintptr_t) new_edges, strlen(from));
        struct hashmap_value *value = get_hashmap(forward_links, from);
        edges = (struct Edges*) value->value;
      }
      struct Edge *new_edge = calloc(1, sizeof(struct Edge));
      
      new_edge->destination = to;
      new_edge->assignment = &assignment_pair->assignments[x];
      printf("%p\n", edges->edges);
      edges->edges[edges->edge_count++] = new_edge;
      printf("Links to %s\n", from);
      for (int y = 0 ; y < edges->edge_count; y++) {
        printf("- %s\n", edges->edges[y]->destination);
        // dump_expressions(0, edges->edges[y]->assignment->exps);
      }
    }
    // set_hashmap(forward_links, range_pair->ranges[x]->variable, (uintptr_t) 0, range_pair->ranges[x]->variable_length);
  }
  char ** real_registers = calloc(100, sizeof(char*));
  int register_count = 0; 
  real_registers[register_count++] = "rax";
  real_registers[register_count++] = "rcx";
  real_registers[register_count++] = "rdx";
  real_registers[register_count++] = "rbx";
  real_registers[register_count++] = "rsi";
  real_registers[register_count++] = "rdi";
  struct Edges **edge_stack = calloc(100, sizeof(struct Edges*));
  int stack_count = 0;
  for (int x = 0 ; x < MAX_SIZE ; x++) {
    if (forward_links->value[x].set == 1) {
      struct Edges *edge = (struct Edges *) forward_links->value[x].value;
      if (edge->edge_count > 0 && edge->edge_count < register_count) {
        printf("FOUND EDGE WITH EDGE COUNT < %d %s\n", register_count, edge->from->variable);
        dump_expressions(0, edge->from->expression->exps[0]);
        edge_stack[stack_count++] = edge;
      }  
    }
  }
  for (int x = 0 ; x < anfs->count; x++) {
        switch (anfs->expressions[x]->type) {
          case METHOD_CALL:
            printf("Found method call\n");
            precolour_method_call(anfs->expressions[x], real_registers, register_count);
            break;
        }
  }

  char ** available = calloc(100, sizeof(char*));
  int available_len = 0;
  int available_index = 0;
  int stack_index = stack_count;
  while (stack_index > 0) {
    printf("###### GRAPH COLOUR STACK ITEM\n");
    if (available_len == 0) {
      for (int x = 0 ; x < register_count ; x++) {
        available[x] = real_registers[x];
      }
      available_len = register_count;
    } 
    printf("#### %d registers available\n", available_len);
    for (int x = 0 ; x < available_len; x++) {
      printf(" - %s", available[x]);
    } 
    printf("\n");

    stack_index--; 

    struct Edges * item = edge_stack[stack_index];
    dump_expressions(0, item->from->expression->exps[0]);
    if (item->from->chosen_register == NULL) {
      printf("%s Doesn't have a register assigned\n", item->from->variable);
      available_len--;
      char * chosen_register = available[available_index];
      available_index++;
      item->from->chosen_register = chosen_register;
      item->from->expression->chosen_register = chosen_register;
      printf("Chosen %s\n", chosen_register);
       
    } else {
      printf("Vertice is precoloured %s %s\n", item->from->variable, item->from->chosen_register);
      int removed_pos = -1;
      available_len--; 
      for (int x = 0 ; x < available_len; x++) {
        if (strcmp(item->from->chosen_register, available[x]) == 0) {
          printf("Found removed register in %d\n", x);
          removed_pos = x;
        }
      } 
      if (removed_pos != -1) {
        for (int x = removed_pos ; x < register_count - 1; x++) {
          available[x] = available[x + 1]; 
        }
        available[available_len] = 0;

      }
    }  
    
    
  }
  for (int x = 0 ; x < assignment_pair->assignment_length; x++) {
    printf("%s register = %s\n", assignment_pair->assignments[x].variable, assignment_pair->assignments[x].chosen_register);
  }

  printf("### END GRAPH COLOURING\n");
}

int machine_code(struct ANF *anfs) {
  int pc = 0;
  assign_all_registers(anfs->anf, anfs->anf->assignment_pair);
  do_graph_colouring(anfs->anf, anfs->anf->assignment_pair);
  for (int x = 0 ; x < anfs->function_length; x++) {
    assign_all_registers(anfs->functions[x]->anf, anfs->functions[x]->anf->assignment_pair);
    do_graph_colouring(anfs->functions[x]->anf, anfs->functions[x]->anf->assignment_pair);
  }
  printf("Codegen for main\n");
  codegen(anfs);  
}

int dump(struct ParseResult *parse_result) {
  for (int x = 0 ; x < parse_result->function_length; x++) {
    dump_function(parse_result->functions[x]);     
  } 
}

int dump_anf(struct NormalForm *anf) {
  for (int x = 0 ; x < anf->count; x++) {
    switch (anf->expressions[x]->type) {
      case MEMBER_ACCESS:
        printf("member access\n");
        break;
      case IDENTIFIER:
        printf("identifier %s %d\n", anf->expressions[x]->stringvalue, anf->expressions[x]->numbervalue);
        break;
      case METHOD_CALL:
        printf("method call\n");
        break;
      case ADD:
        printf("add\n");
        break;
      case RETURN:
        printf("return\n");
        break;
    }
  }  
}

int main(int argc, char *argv[])
{
  

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
    memset(buffer, '\0', length + 1);
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
    printf("#### Code:\n");
    printf("%s", ast->program_body);
    printf("Dumping AST\n");
    for (int x = 0 ; x < ast->statements->statements; x++) {
      dump_expressions(1, ast->exps[x]);
    }
    dump(ast);
    struct ANF * anfs = normalform(ast);
    printf("Dumping ANF\n");
    for (int x = 0 ; x < anfs->function_length; x++) {
      printf("ANF for function %s\n", anfs->functions[x]->name);
      dump_anf(anfs->functions[x]->anf);
    }
    printf("ANF for main\n");
    dump_anf(anfs->anf);
    printf("Assigning registers\n");
    precolour_anf(anfs->anf);
    assignregisters(anfs->anf); 
    for (int x = 0 ; x < anfs->function_length; x++) {
      precolour_anf(anfs->functions[x]->anf);
      assignregisters(anfs->functions[x]->anf); 
    }
    FILE *mapsfd = fopen("/proc/self/maps", "r");
    if(mapsfd == NULL) {
        fprintf(stderr, "open() failed: %s.\n", strerror(errno));
        exit(1);
    }
    char maps[BUFSIZ] = "";
    if(read(fileno(mapsfd), maps, BUFSIZ) == -1){
        fprintf(stderr, "read() failed: %s.\n", strerror(errno));
        exit(1);
    }
    if(close(fileno(mapsfd)) == -1){
        fprintf(stderr, "close() failed: %s.\n", strerror(errno));
        exit(1);
    }
    long long heap_start = 0;
    char*  line = strtok(maps, "\n");
    while((line = strtok(NULL, "\n")) != NULL) {
        if(strstr(line, "heap") != NULL) {
            printf("\n\nfrom /proc/self/maps:\n%s\n", line);
            sscanf(line, "%llx", &heap_start); 
            break;
        }
    } 
    printf("heap start is %llx\n", heap_start);
    anfs->heap_start = heap_start;
    machine_code(anfs);
    int (*jmp_func)(void) = (void *) anfs->codegen_context->main_function_context->code;

    printf("Executing machine code at %p\n", jmp_func);
    printf("%x\n", jmp_func());
  }

  /*for (size_t i = 0; buffer[i * 2 + 1] != '\0'; i++) {
    write_region[i] = 16 * convert_to_hex(buffer[i*2]) + convert_to_hex(buffer[i*2 + 1]);
  }


  int (*jmp_func)(void) = (void *) write_region;

  printf("%x\n", jmp_func());
  */
  return 0;
}
