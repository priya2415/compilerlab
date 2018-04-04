%{
#include "y.tab.h"
%}
digit [a-z0-9]
%%
{digit} {yylval=(char)yytext[0];return ID;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"(" {return '(';}
")" {return ')';}
\n {return '\n';}
"=" {return '=';}
%%
int yywrap()
{
return 1;
}
