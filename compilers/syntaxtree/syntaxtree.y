%{
#include<stdio.h>
#include<stdlib.h>

typedef struct node
{
	char data;
	struct node *left;
	struct node *right;
}node;

node *makenode(char d,node *l,node *r);
void print(node *root);
#define YYSTYPE struct node*
%}

%token '+' '*' '\n'
%token ID
%left '+'
%left '*'

%%

S:E'\n'{print($1);return 0;}
;
E:E'+'T{$$=makenode('+',$1,$3);}
|T {$$=$1;}
;
T:T'*'F{$$=makenode('*',$1,$3);}
|F {$$=$1;}
;
F:ID {$$=makenode((char)$1,NULL,NULL);}
;
%%
int main()
{
printf("enter expression:");
yyparse();
}

node *makenode(char d,node *l,node *r)
{
	node *temp=(node*)malloc(sizeof(node));
	temp->data=d;
	temp->left=l;
	temp->right=r;
	return temp;
}

void print(node *root)
{
	printf("%c",root->data);
	if(root->left!=NULL)
		print(root->left);
	if(root->right!=NULL)
		print(root->right);
}

void yyerror(char *s)
{
	printf("error");
}
