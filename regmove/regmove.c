
#include "common.h"
int move_var(char * source_register, char * destination_register, char * bytes) {
  unsigned long source = hash(source_register);
  unsigned long destination = hash(destination_register);
  int bytes_count = 0;
  switch (source) {

    case 193502808: /* r10 */

      switch (destination) { 

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd2;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd6;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd4;
        break;
    

  }
  break;
  

    case 193502809: /* r11 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xda;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdc;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdd;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xde;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdf;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdd;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdb;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd9;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdf;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xda;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xde;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdc;
        break;
    

  }
  break;
  

    case 193502810: /* r12 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe3;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe2;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe6;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe4;
        break;
    

  }
  break;
  

    case 193502811: /* r13 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xea;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xeb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xec;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xee;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xef;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xed;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xeb;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe9;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xef;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xea;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xee;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xec;
        break;
    

  }
  break;
  

    case 193502812: /* r14 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf5;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf2;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf6;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf4;
        break;
    

  }
  break;
  

    case 193502813: /* r15 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfa;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfc;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfd;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfe;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfd;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfb;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf9;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xff;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfa;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfe;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfc;
        break;
    

  }
  break;
  

    case 5863727: /* r8 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc7;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc2;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc6;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc4;
        break;
    

  }
  break;
  

    case 5863728: /* r9 */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xca;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcc;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcd;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xce;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcf;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x4d;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc8;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcd;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcb;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc9;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcf;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xca;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xce;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x4c;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcc;
        break;
    

  }
  break;
  

    case 193504464: /* rax */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc1;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc2;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc6;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc4;
        break;
    

  }
  break;
  

    case 193504489: /* rbp */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xea;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xeb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xec;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xed;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xee;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xef;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe8;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xeb;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe9;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xef;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xea;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xee;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xec;
        break;
    

  }
  break;
  

    case 193504497: /* rbx */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xda;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdc;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdd;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xde;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdf;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdd;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd9;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdf;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xda;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xde;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xdc;
        break;
    

  }
  break;
  

    case 193504530: /* rcx */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xca;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcc;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcd;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xce;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcf;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xc8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcd;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcb;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcf;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xca;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xce;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xcc;
        break;
    

  }
  break;
  

    case 193504548: /* rdi */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfa;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfb;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfc;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfd;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfe;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xff;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf8;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf9;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf8;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfd;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfb;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf9;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfa;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfe;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xfc;
        break;
    

  }
  break;
  

    case 193504563: /* rdx */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd7;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd6;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xd4;
        break;
    

  }
  break;
  

    case 193505043: /* rsi */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf2;
        break;
    

        case 193505050: /* rsp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xf4;
        break;
    

  }
  break;
  

    case 193505050: /* rsp */

      switch (destination) { 

        case 193502808: /* r10 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe2;
        break;
    

        case 193502809: /* r11 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe3;
        break;
    

        case 193502810: /* r12 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe4;
        break;
    

        case 193502811: /* r13 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe5;
        break;
    

        case 193502812: /* r14 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe6;
        break;
    

        case 193502813: /* r15 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe7;
        break;
    

        case 5863727: /* r8 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe0;
        break;
    

        case 5863728: /* r9 */
          
          bytes[bytes_count++] = 0x49;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe1;
        break;
    

        case 193504464: /* rax */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe0;
        break;
    

        case 193504489: /* rbp */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe5;
        break;
    

        case 193504497: /* rbx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe3;
        break;
    

        case 193504530: /* rcx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe1;
        break;
    

        case 193504548: /* rdi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe7;
        break;
    

        case 193504563: /* rdx */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe2;
        break;
    

        case 193505043: /* rsi */
          
          bytes[bytes_count++] = 0x48;
          bytes[bytes_count++] = 0x89;
          bytes[bytes_count++] = 0xe6;
        break;
    

  }
  break;
  

  }
}

