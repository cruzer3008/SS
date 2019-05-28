%{
#include<stdio.h>
int v=0,c=0,s=0,n=0,l=0;
%}

%%
[ \t] ;
[aeiouAEIOU] {v++;}
[\n] {l++;}
[a-zA-Z] {c++;}
[0-9]* {n++;}
. {s++;}
%%

int main()
{
	yyin = fopen("input.txt","r");
	yylex();
	printf("Vowels: %d\nLines: %d\nConsonants: %d\nNumbers: %d\nSpecial Characters: %d\n",v,l,c,n,s);
}
