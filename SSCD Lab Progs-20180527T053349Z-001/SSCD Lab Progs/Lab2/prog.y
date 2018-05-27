%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
input:stt'\n' {printf("\nPattern found\n"); exit(0);};
stt: A exp B | B ;
exp:A exp | ;
%%
main()
{
	printf("\nEnter a string:\n");
	yyparse();
}
int yyerror()
{
	printf("Pattern not found\n");
	exit(0);
}
