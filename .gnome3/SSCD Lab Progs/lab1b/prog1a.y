%{
#include<stdio.h>
#include<stdlib.h>
%}
%union{double dval;}
%start input
%token <dval> NUM
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type <dval> expr
%%
input:expr {printf("Result of the expression is %g\n",$1); exit(0);};
expr: expr '+' expr {$$=$1+$3;}
|expr '-' expr {$$=$1-$3;}
|expr '*' expr {$$=$1*$3;}
|expr '/' expr {if ($3!=0) $$=$1/$3;else {printf("\nDivide By Zero!!!");exit(0);}}
| '-' expr %prec UMINUS {$$=-$2;}
| '(' expr ')' {$$=$2;}
| NUM = {$$=$1;}
;
%%
int yyerror()
{
printf("Invalid Expression!!");
exit(0);
}
int main()
{
printf("\nEnter an Expression:");
yyparse();
}

