:wq%{
#include<stdio.h>
int id=0,op=0,par=0,flag=0,in=0,inid=0,inop=0,unrecognized=0;
%}
%%
[0-9]+ {id++; if(in==1) inid++; printf("\nIdentifier : ");ECHO;}
[\+\*] {op++; if(in==2) inop++; printf("\nOperator : ");ECHO;}
"(" {par++; in=1;}
")" {if(inid!=inop+1) flag=1; par--;if(par==0){ in=0;inid=0;inop=0;}}
. {unrecognized=1; printf("\nUnrecognized Symbol"); ECHO;}
\n return 0;
%%
main()
{
	printf("\nEnter the Expression:");
	yylex();
	if(id==(op+1)&& flag==0 && unrecognized==0 && par==0)
	{	
		printf("\nValid Expression\n");
		printf("\nNumber of identifiers = %d  and operators = %d\n ",id,op);
	}
	else
	{
		printf("\nInvalid Expression");
	}
}
