%{
#include"y.tab.h"
int x=0;
%}
%%
"int" {x++;return INT;}
"float" {x++;return FLOAT;}
"double" {x++;return DOUBLE;}
"char" {x++;return CHAR;;}
[a-z]+ {yylval=yytext;if(x>0)return ID;return O;}
"\n" {return NL;}
"," {return C;}
";" {x--;return SE;}
. {}
%%

