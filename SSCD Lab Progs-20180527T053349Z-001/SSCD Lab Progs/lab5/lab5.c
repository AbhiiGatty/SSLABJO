#include<stdio.h>
char triple[4][3][3] = { {"-","B","?"}, {"+","C","D"}, {"*","0","1"},{"=","A","0"}};
int main()
{
	int i,j,k;
	printf("\nThe input statement is \tA = -B * (C+D)\n");
	printf("The intermediate code in three - address form is \n");
	printf("T1 = - B\nT2 = C + D\nT3 = T1 * T2\nA = T3");
	printf("\nThe triples are :\n");
	for(i=0;i<4;i++)
	{
		printf("%d\t",i);
		for(j=0;j<3;j++)
		{
			for(k=0;k<3;k++)
			{
			
				printf("%c\t",triple[i][j][k]);
			}
		}
		printf("\n");
	}
	printf("\nThe machine code generated is : ");
	for(i=0;i<4;i++)
	{
		j=2;
		if(triple[i][j][0]=='?')
			printf("\nLD R0,%s%s",triple[i][0],triple[i][1]);
		else
		{
			if(triple[i][0][0] == '+')
			{
				printf("\nLD R1, %s",triple[i][1]);
				printf("\nLD R2 , %s",triple[i][2]);
				printf("\nADD R1,R1,R2");
			}
			else if(triple[i][0][0] == '*')
			{
				printf("\nMUL R%s,R%s,R%s",triple[i][1],triple[i][1],triple[i][2]);
				
			}
			else
			{
				printf("\nST %s,R0\n",triple[i][1]);
			}
		}
	}
	return 0;
}
