%{ 
  #include<stdio.h> 
  int id=0,flag=0,com=0, oper=0;
%} 
%% 
\/\/.* {com++;}
"/*"[^"*/"]*"*/" {com++;}
[\+\-\*\/] oper++;
= ;
[ \t\n] ;
"int"|"char"|"float"|"double" {flag=1;} 
";" {flag=0;} 
[a-zA-Z][a-zA-Z0-9]* {if(flag!=0) id++;} 
. ;
%% 
void main(void) 
{ 
  yyin=fopen("input.txt","r");
  yylex(); 	
  printf("Number of Identifier:%d\n",id); 
  printf("No. of comments=%d\n", com);
  printf("No. of operators=%d\n", oper);
  fclose(yyin); 
} 


