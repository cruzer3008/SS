%{
	int c=0,w=0,s=0,l=0;
%}

%%
[^ \t\n,."'/]+ {w++;c+=yyleng;}
[ ] {s++;}
[\n] {l++;}
. {c++;}
%%

void main()
{
	yyin = fopen("input.txt","r");
	yylex();
	printf("Lines: %d\nCharacter: %d\nSpaces: %d\nWords: %d\n",l,c,s,w);
}


