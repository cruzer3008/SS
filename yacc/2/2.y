%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token NUMBER ALPHA UND NL

%%
stmt: exp NL {printf("Valid\n");exit(0);};
exp : ALPHA var;
var: ALPHA var|NUMBER var|UND var|;
%%

int yyerror(char *msg){
	printf("Invalid\n");
	exit(0);
}
int main(){
	printf("Enter input\n");
	yyparse();
	exit(0);
}
