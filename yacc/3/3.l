%{
#include "y.tab.h"
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
%}

%%
[0-9]+ {yylval = atoi(yytext); return NUMBER;}
[\n] {return NL;}
. {return yytext[0];}
%%

