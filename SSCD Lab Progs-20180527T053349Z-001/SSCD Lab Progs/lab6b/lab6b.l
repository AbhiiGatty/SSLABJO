%{
#include "y.tab.h"
#include<stdio.h>
%}
%%
[\t] ;
[0-9]+|([0-9]*\.[0-9]+) {printf("\nNumber %s found",yytext); return NUM;}
[\+\*\-\/<>=] {printf("\nOperator %s found",yytext); return OP;}
int |
char |
float |
double |
void |
break |
continue |
while |
for |
do |
if |
else |
switch |
goto |
return |
printf |
main |
scanf |
exit {printf("\nKeyword %s found",yytext); return KEY;}
[a-zA-Z][a-zA-Z0-9_]* {printf("\nIdentifier %s found",yytext); return ID;}
. ;
%%
