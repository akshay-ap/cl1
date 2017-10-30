%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
extern FILE* yyin;
void yyerror(char *s);
int yylex();
%}

%token PRE DT RET INT MAIN

%%
s: preprocessor mainblock;
preprocessor: PRE {printf("Preprocessor Statement\n");};
mainblock: DT MAIN '('')''{' RET INT ';''}' {printf("MainBlock\n");};

%%

void yyerror(char *s){
    printf("error %s",s);
}

int main(){

    yyin = fopen("expressions.txt","r");
    printf("Opened FILE\n");
    yyparse();
    return 0;
}

