%{
#include<stdio.h>
%}
BC [/][\*]
EC [\*][/]
SC [/][/]
QT [\"]
%x CMT
%x QOUT
%%
{BC} BEGIN CMT;
<CMT>{EC} {BEGIN 0;}
<CMT>. |
<CMT>\n ;
{QT} {ECHO; BEGIN QOUT;}
<QOUT>{QT} {ECHO; BEGIN 0;} 
<QOUT>.|\n {ECHO;}
{SC}.* ;
%%
main(int argc,char *argv[])
{
	FILE *fin, *fout;
	if(argc!=3)
	{
		printf("Usage <executable file> <input file> <output file>");
		return;
	}
	fin=fopen(argv[1],"r");
	if(!fin)
	{
		printf("Input file doesnot exist %s",argv[1]);
		return;
	}
	fout=fopen(argv[2],"w");
	yyin=fin;
	yyout=fout;
	yylex();
}
