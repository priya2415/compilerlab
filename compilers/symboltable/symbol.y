%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "y.tab.h"
int fl=0,i=0,type[100],j=0,error_flag=0;
char symbol[100][100],temp[100];
extern FILE *yyin;
%}
%token INT FLOAT C DOUBLE CHAR ID NL SE O
%%
START:S1 NL {return;}
;
S1:S NL S1
|S NL
;
S:INT L1 E
|FLOAT L2 E
|DOUBLE L3 E
|CHAR L4 E
|INT L1 E S
|FLOAT L2 E S
|DOUBLE L3 E S
|CHAR L4 E S
|O
;
L1:L1 C ID {strcpy(temp,(char *)$3);insert(0);}
|ID {strcpy(temp,(char *)$1);insert(0);}
;
L2:L2 C ID {strcpy(temp,(char *)$3);insert(1);}
|ID {strcpy(temp,(char *)$1);insert(1);}
;
L3:L3 C ID {strcpy(temp,(char *)$3);insert(2);}
|ID {strcpy(temp,(char *)$1);insert(2);}
;
L4:L4 C ID {strcpy(temp,(char *)$3);insert(3);}
|ID {strcpy(temp,(char *)$1);insert(3);}
;
E:SE
;
%%
main()
{
//yyin = fopen("n2.txt","r");
//printf("%s",yyin);
yyparse();
if(error_flag==0)
for(j=0;j<i;j++)
{
if(type[j]==0)
printf(" INT - ");
if(type[j]==1)
printf(" FLOAT - ");
if(type[j]==2)
printf(" DOUBLE - ");
if(type[j]==3)
printf(" CHAR - ");
printf(" %s\n",symbol[j]);
}
}
void yyerror()
{ printf("SYNTAX ERROR\n");
error_flag=1;
}
void insert(int type1)
{
fl=0;
for(j=0;j<i;j++)
	if(strcmp(temp,symbol[j])==0)
	{
		if(type[i]==type1)
			printf("REDECLARATION OF %s\n",temp);
		else
		{
		printf("MULTIPLE DECLARATION OF %s\n",temp);
		error_flag=1;
		}
	fl=1;
	}
	if(fl==0)
	{
	strcpy(symbol[i],temp);
	type[i]=type1;
	i++;
	}
}

