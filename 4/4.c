#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void main()
{
	FILE *inputFile;
	inputFile = fopen("input.txt","r");
	int sa,len,address;
	char type,name[20],input[20];
	fscanf(inputFile,"%c%s%X%X",&type,name,&sa,&len);
	printf("Loading file %s with starting address %06X and with program length %06X\n",name,sa,len);

	fscanf(inputFile, "%s", input);
	while (strcmp(input, "E") != 0)
	{
		if (strcmp(input, "T") == 0)
		{
			fscanf(inputFile, "%X", &address);
			fscanf(inputFile, "%X", &len);
			fscanf(inputFile, "%s", input);
		}

		int i = 0;
		while (i < strlen(input) - 1)
		{
			printf("%06X\t%c%c\n", address, input[i], input[i + 1]);
			address++;
			i += 2;
		}
		fscanf(inputFile, "%s", input);
	}
	printf("%s",input);
	fclose(inputFile);
}

