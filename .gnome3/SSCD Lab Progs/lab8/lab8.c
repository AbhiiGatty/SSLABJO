#include<stdio.h>
int main()
{
	int p,r,alloc[10][10],max[10][10],available[10],need[10][10],i,j,k,completed[10],safeSeq[10],process,count=0;
	printf("\nEnter the no. of processes :");
	scanf("%d",&p);
	printf("\nEnter the no. of resources :");
	scanf("%d",&r);
	for(i=0;i<p;i++)
		completed[i]=0;
	printf("\nEnter the Allocation for each process:");
	for(i=0;i<p;i++)
	{
		printf("\nFor process %d:",i+1);
		for(j=0;j<r;j++)
		{
			scanf("%d",&alloc[i][j]);
		}
	}
	printf("\nEnter the Maximum matrix for each process :");
	for(i=0;i<p;i++)
	{
		printf("\nFor process %d:",i+1);
		for(j=0;j<r;j++)
		{
			scanf("%d",&max[i][j]);
		}
	}
	printf("\nEnter the available resources :");
	for(i=0;i<r;i++)
		scanf("%d",&available[i]);
	for(i=0;i<p;i++)
		for(j=0;j<r;j++)
			need[i][j] = max[i][j] - alloc[i][j];
	printf("\nNeed Matrix :\n");
	for(i=0;i<p;i++)
	{
		for(j=0;j<r;j++)
		{
			printf("%d\t",need[i][j]);
		}
		printf("\n");
	}
	do{
		printf("\nMax Matrix \t Allocation Matrix \n");
		for(i=0;i<p;i++)
		{
			for(j=0;j<r;j++)
				printf("%d  ",max[i][j]);
			printf("\t\t");
			for(j=0;j<r;j++)
				printf("%d  ",alloc[i][j]);
			printf("\n");
		}
		process = -1;
		for(i=0;i<p;i++)
		{
			if(completed[i]==0)
			{	
				process=i;
				for(j=0;j<r;j++)
				{
					if(available[j]<need[i][j])
					{
						process =-1;
						break;
					}
				}
			}
			if(process !=-1)
				break;
		}
		if(process !=-1)
		{
			printf("\nProcess %d runs to completion!!",process+1);
			safeSeq[count] = process+1;
			count++;
			for(j=0;j<r;j++)
			{
				available[j] += alloc[process][j];
				alloc[process][j]=0;
				max[process][j]=0;
				completed[process] =1;
			}	
		}			
	}while(count!=p&&process!=-1);
	if(count==p)
	{
		printf("\nThe system is in safe state");
		printf("\nSafe Sequence:<");
		for(j=0;j<p;j++)
		{
			printf("%d\t",safeSeq[j]);
		}
	}
	else
	{
		printf("\nThe system is in unsafe state");
		
	}
}


//Enter the Available Resources: 3 3 2
//Max matrix:7 5 3, 3 2 2, 7 0 2, 2 2 2, 4 3 3
//Allocation matrix:0 1 0,2 0 0, 3 0 2, 2 1 1, 0 0 2