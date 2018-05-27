%{
#include<stdio.h>
int sl=0;
int ml=0;
%}
%%
"/*"[a-zA-Z0-9' '\t\n]+"*/" ml++;
"//".* sl++;
%%
main()
{
yyin=fopen("wth_comments_sample.c","r");
yyout=fopen("wthO_comments_sample.c","w");
yylex();
fclose(yyin);
fclose(yyout);
printf("\n Number of single line comments are = %d\n",sl);
printf("\nNumber of multiline comments are =%d\n",ml);
}