%{
#include "y.tab.h"
//void yyerror(const char *);
%}
ALPHA [A-Za-z]
DIGIT [0-9]
%%
{ALPHA}({ALPHA}|{DIGIT})*  return ID;
{DIGIT}+    {yylval=atoi(yytext); return NUM;}
[\n\t]       yyterminate();
.            return yytext[0];
%%

