%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token NUMBER NL
%left '+' '-'
%left '*' '/'

%%
stmt : exp NL {printf("Value is %d\n",$1);exit(0);}
exp : exp '+' exp {$$=$1+$3;} | exp '-' exp {$$=$1-$3;} | exp '*' exp {$$=$1*$3;} | exp '/' exp {$$=$1/$3;} | '('exp')' {$$=$2;} | NUMBER {$$=$1;};
%%

int yyerror(char *msg){
	printf("Invalid\n");
	exit(0);
}

void main(){
	printf("Enter the expression to evaluate\n");
	yyparse();
}
