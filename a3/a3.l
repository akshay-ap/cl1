%{

#include<string.h>
int insert(char str[]);
FILE *fin;
    unsigned int n=1,count=0,i;   
    struct st
    {
    char name[25];
    int value; 
    char c1[25],c2[25];

    }* symbol[50];

%}

%%

[\t]+ ;
[\n]+ {n++;}
# {printf("Preprocessor\n");}
include {printf("Include header file\n");}
[a-zA-Z0-9]+\.h				{ printf("\n%d\t%s\t\t:Header file", n, yytext); }
[0-9]+					{ printf("\n%d\t%s\t\t:Integer constant", n, yytext); }
[0-9]+\.[0-9]+				{ printf("\n%d\t%s\t\t:Real constant", n, yytext); }
void|short|int|long|float|double|char|struct		{ printf("\n%d\t%s\t\t:Datatype", n, yytext); }
([_a-zA-Z]+[_a-zA-Z0-9]*)		{ printf("\n%d\t%s\t\t:Identifier\t\t%d", n, yytext, insert(yytext)); }

%%



int main()
{
fin=fopen("sample.cpp","r");
printf("opened file\n");
yyin=fin;
yylex();
printf("\n_________________________________________________________\n");
	printf("\nSYMBOL TABLE");
	printf("\n_______________________________________\n");
	printf("\nNAME\t\tVALUE");
	printf("\n_______________________________________\n");

for(int i=0;i<count;i++)
    {
    printf("%s %d\n",symbol[i]->name,symbol[i]->value);
    }

printf("Parsing done\n");
fclose(fin);
return 0;
}

int insert(char str[])
{
int i;
	for(i=0; i<count; i++)
	{	
		if(strcmp(str, symbol[i]->name)==0)	return i;
	}
	symbol[count]=(struct st*)malloc(sizeof(struct st));
	strcpy(symbol[count]->name, str);
	symbol[count]->value=0;
	return count++;
}


int yywrap()
{
return 1;
}
