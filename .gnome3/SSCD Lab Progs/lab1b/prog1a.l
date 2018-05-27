%{
#include "y.tab.h"
%}
%%
[0-9]+|([0-9]*\.[0-9]+) {yylval.dval = atof(yytext); return NUM;}
[\*\+\-\/] {return yytext[0];}
"(" {return yytext[0];}
")" {return yytext[0];}
[ \t] ;
. return yytext[0];
\n return 0;
%%
