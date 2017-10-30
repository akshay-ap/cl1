%{
#include"y.tab.h"
extern int yylval;
%}

%%

[0-9]+ {yylval=(int)yytext; return NUMBER;}
[\t\n] ;
"+" {return (PLUS);}
"-" {return (MINUS);}
"*" {return (MULTIPLY);}
"/" {return (DIVIDE);}
"(" {return (LEFT_PARENTHESIS);}
")" {return (RIGHT_PARANTHESIS);}
";" {return (END);}
"^" {return (POWER);}
%%
int yywarp(void)
{return 1;}
