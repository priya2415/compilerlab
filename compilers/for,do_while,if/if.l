%{
#include "y.tab.h"
%}
%%
"(" return OP;
")" return CP;
"{" return CB;
"}" return CC;
"if" {
return IF;
}
"else" {
return ELSE;
}
[a-zA-Z0-9><+-=*/%&|!\[\];]+	return STATE;
[ \t\n] {printf("%s",yytext);};
%%
int yywrap(){return 1;}

