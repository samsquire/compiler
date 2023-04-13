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
#define STRING 0
// ast nodes
#define ASSIGNMENT 0
#define REFERENCE 1
#define IF 2
#define METHOD_CALL 3
#define MEMBER_ACCESS 4
#define IDENTIFIER 5

struct Parameter {
  char * name;
  char * type;
  int namelength;
};

struct ANF {
  struct Function **functions;
  struct NormalForm *anf;
  int function_length;
};

struct Function {
  char * name;
  struct Parameter **parameters;
  int parameter_length;
  int expression_length;
  struct Expression **expressions;
  struct ExpressionSource **exps; 
  struct StatementSource * statements;
  struct NormalForm * anf;
};

struct Expression {
  int type;
  struct ExpressionSource **exps;
  struct StatementSource * statements;
  char * stringvalue;
  int stringlength;
  int numbervalue;
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
};

struct NormalForm {
  struct Expression ** expressions;
  int count;
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
      // printf("%s [%s] Matched pattern for identifier [%s] %s\n", regex, parse_result->last_char, identifier, subject); 
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

unsigned long
hash(unsigned char *str)
{
    unsigned long hash = 5381;
    int c;

    while (c = *str++)
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash;
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
   
   
  while ((token = gettok(parse_result, "functionbodyitem")) && parse_result->end == 0 && strcmp(token, "curlyclose") != 0 && (usetokenstop == 0 || (usetokenstop == 1 && strcmp(token, tokenstop) != 0))) {
    unsigned long hashv = hash(token);
    printf("Hash for token %s is %ld\n", token, hashv);
    switch (hashv) {
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
        member->type = MEMBER_ACCESS;
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
        struct ExpressionSource * expression_exps = malloc(sizeof(struct ExpressionSource)); 
        struct StatementSource * newstatementsource2 = malloc(sizeof(struct StatementSource));
        // struct Expression ** expressions = calloc(100, sizeof(struct Expression*)); 
        struct Expression * method_call = malloc(sizeof(struct Expression));
        statements[statementsource->statements - 1]->expressions = empty;
        empty[0] = method_call;
        statements[statementsource->statements - 1]->expression_length = 1;
        method_call->type = METHOD_CALL;
        // method_call->stringvalue = token;
        method_call->exps = _newstatements;
        method_call->statements = newstatementsource2;
        newstatementsource2->statements = 1;
        _newstatements[0] = expression_exps;
        method_call->exps[newstatementsource2->statements - 1]->expression_length = 0;
        method_call->exps[newstatementsource2->statements - 1]->expressions = owner;
        expression_exps->current_into = owner_into;
        method_call->exps[newstatementsource2->statements - 1]->expression_length = owner_size;

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
      break;
      default:  // identifier 
       printf("%s parseexpression Is an identifier %s\n", caller, token);
       struct Expression * identifier = malloc(sizeof(struct Expression));
       identifier->type = IDENTIFIER;
       identifier->stringvalue = token;

       struct ExpressionSource **newstatements = calloc(100, sizeof(struct ExpressionSource*));
       struct ExpressionSource *identifierexps = malloc(sizeof(struct ExpressionSource));
       struct StatementSource *newstatementsource = malloc(sizeof(struct StatementSource));
       struct Expression **identifierexpressions = calloc(100, sizeof(struct Expression*));
       identifier->exps = newstatements;
       identifier->statements = newstatementsource;
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
  char * keywords[] = {"member", "function", "if", "return", "open", "close", "comma"};
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

int codegen(struct ANF *anfs, struct NormalForm *anf, char * destination) {
  for (int x = 0 ; x < anf->count; x++) {
    switch (anf->expressions[x]->type) {
      case IDENTIFIER: 
         printf("Generating reference\n"); 
      break;  
    }
  }  
}

int machine_code(struct ANF *anfs, char * destination) {
  int pc = 0;
  for (int x = 0 ; x < anfs->function_length; x++) {
    printf("Codegen for function %s\n", anfs->functions[x]->name);
    codegen(anfs, anfs->functions[x]->anf, destination);  
  }
  printf("Codegen for main\n");
  codegen(anfs, anfs->anf, destination);  
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
    }
  }  
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
    
    machine_code(anfs, write_region);
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
