%{
#include<stdio.h>
int pn=0,nn=0,pf=0,nf=0;
%}
%%
[+]?[0-9]+ {pn++;}
[-][0-9]+ {nn++;}
[+]?[0-9]*\.[0-9]+ {pf++;}
[-][0-9]*\.[0-9]+ {nf++;}
. ;
%%

void main(){
	yyin = fopen("input.txt","r");
	yylex();
	printf("Positive Numbers:%d\nNegative Numbers:%d\nPositive Fractions:%d\nNegative Fractions:%d\n",pn,nn,pf,nf);
}
