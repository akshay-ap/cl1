%{
#include<stdio.h>
#include"y.tab.h"
char addtotable(char,char,char);
int index1=0;
char temp='A'-1;

struct expr
{
char operand1;
char operator;
char operand2;
char result;
};

%}






%union
{
char symbol;
}

%left '+' '-'
%left '/' '*'

%token <symbol> LETTER NUMBER

%type <symbol> exp

%%
statement : LETTER '=' exp ';' {addtotable((char)$1,(char)$3,'=');};
exp : exp '+' exp {$$=addtotable((char)$1,(char)$3,'+');}
    | exp '-' exp {$$=addtotable((char)$1,(char)$3,'-');}
    | exp '*' exp {$$=addtotable((char)$1,(char)$3,'*');}
    | exp '/' exp {$$=addtotable((char)$1,(char)$3,'/');}
    | '(' exp ')' {$$=(char)$2;}  
    | NUMBER {$$=(char)$1;}
    | LETTER {(char)$1;};

%%

struct expr arr[20];



char addtotable(char a,char b,char o)
{
temp++;
index1++;
arr[index1].operator=b;
arr[index1].operand1=a;
arr[index1].operand2=o;
arr[index1].result=temp;
return temp;
}


void fourAdd()
{
char temp='A';
int i=0;
while(i<index1)
    {
        printf("%c\t",arr[i].operator);

        printf("%c\t",arr[i].operand1);

        printf("%c\t",arr[i].operand2);
         printf("%c:=\t",arr[i].result);
    i++;    
    temp++;
    printf("\n"); 
   }

}

void threeAdd()
{
char temp='A';
int i=0;
    while(i<index1)
    {
   
        printf("%c:=\t",arr[i].result);
        printf("%c\t",arr[i].operand1);
        printf("%c\t",arr[i].operator);
        printf("%c\t",arr[i].operand2);
 
    i++;    
    temp++;
    printf("\n"); 
   }

}

int yyerror(char *s)
{
printf("Error %s",s);
}

int yywrap()
{
return 1;
}

int main()
{

printf("Enter the expression\n");
yyparse();
threeAdd();
printf("=====================\n");
fourAdd();
return 0;

}
