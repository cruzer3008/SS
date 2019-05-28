%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token NUMBER NL

%%
stmt: NUMBER NUMBER NUMBER NUMBER var NL {printf("Valid\n"); exit(0);};
var: NUMBER var|;
%%

int yyerror(char *msg)
{
	printf("Invalid\n");
	exit(0);
}

void main(){
	printf("Enter expression\n");
	yyparse();
}



