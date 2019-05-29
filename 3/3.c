#include<stdio.h>
#include<string.h>

void main()
{
	FILE *f4;
	int len=0,sa=0,textlen=0;
	char saddress[20],label[20],opcode[20],operand[20],temp[80],textrec[80],startaddr[20],objcode[20];
	f4 = fopen("output.txt","r");
	printf("Object Program is \n");

	fscanf(f4,"%s%s%s%s%s",saddress,label,opcode,operand,objcode);
	sa = strtol(saddress,NULL,16);
	while(strcmp(opcode,"END")!=0)
	{
		fscanf(f4,"%s%s%s%s%s",saddress,label,opcode,operand,objcode);
	}
	len = strtol(saddress,NULL,16);
	fclose(f4);
	len = len-sa;

	f4 = fopen("output.txt","r");
	fscanf(f4,"%s%s%s%s%s",saddress,label,opcode,operand,objcode);
		strcpy(startaddr,saddress);
	printf("H %s %s %06X\n",label,saddress,len);

	fscanf(f4,"%s%s%s%s%s",saddress,label,opcode,operand,objcode);

	strcpy(temp,"");
	strcpy(textrec,"T 00");
	strcat(textrec,saddress);
	
	while(strcmp(opcode,"END")!=0)
	{
		if((textlen==30)||(strcmp(opcode,"RESW")==0)||(strcmp(opcode,"RESB")==0)||(((strlen(objcode)/2)+textlen)>30)){
			printf("%s %02X %s\n",textrec,textlen,temp);
			textlen = 0;
			strcpy(temp,"");
			strcpy(textrec,"T 00");
			fscanf(f4,"%s %s %s %s %s",saddress,label,opcode,operand,objcode);
			while((strcmp(objcode,"-")==0)&&(strcmp(opcode,"END"))!=0){
				fscanf(f4,"%s %s %s %s %s",saddress,label,opcode,operand,objcode);
			}
			strcat(textrec,saddress);	
		

		}

		textlen = textlen+(strlen(objcode)/2);
		strcat(temp,objcode);
		strcat(temp," ");
		fscanf(f4,"%s %s %s %s %s",saddress,label,opcode,operand,objcode);

	}
	if(textlen!=0)
	{
		printf("%s %x %s\n",textrec,textlen,temp);
	}

	printf("E 00%s\n\n",startaddr);
	fclose(f4);
}

	
		
	
