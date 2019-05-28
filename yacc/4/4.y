%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
%}

%token NL A B

%%
stmt: C D NL {printf("Valid\n"); return(0);};
C : A;|A C;|;
D : B;|B D;|;
%%

int yyerror(char *msg){
	printf("Invalid\n");
	exit(0);
}

void main(){
	printf("Enter the expression\n");
	yyparse();
}


