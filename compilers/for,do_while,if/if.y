%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern char *yytext;
extern FILE *yyin;
//extern FILE *out;
%}
%token IF ELSE STATE OP CP CB CC
%%
s:IFST;
IFST:STATE{printf("%s",yytext);} IFST
|IF{printf("%s",yytext);} OP{printf("%s",yytext);} STATE{printf("%s",yytext);} CP{printf("%s",yytext);} CB{printf("%s",yytext);}
IFST CC{printf("%s",yytext);} 
ESTMT
|
;
ESTMT:ELSE {printf("%s",yytext);} CB {printf("%s",yytext);}
IFST
CC {printf("%s",yytext);}
IFST
|
{printf("else { }\n");}
;
%%
yyerror() {
printf("Invalid statement\n");
}
int main(){
yyin = fopen("n2.txt", "r");
yyparse();
return 0;
}
