%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}

digit [0-9]
char [A-Za-z_]
identifier {char}({char}|{digit})*
white " "|\t|\n

%%
{white} ;
#include<{identifier}.h> {return PRE;}
int|float {return DT;}
\(|\)|\}|\{|; {return yytext[0];}
return {return RET;}
{digit}+ {return INT;}
main {return MAIN;}

%%

int yywrap(){
    return 1;
}
