%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token number id nl
%left '+' '-'
%left '*' '/'

%%
stmt: exp nl {printf("Valid Expression\n");exit(0);};
exp: exp '+' exp|exp '-' exp|exp '*' exp|exp '/' exp|'('exp')'|id|number;
%%

int yyerror(char *msg){
	printf("Invalid\n");
	exit(0);
}

main(){
	printf("Enter the expression\n");
	yyparse();
}
