%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "contact.tab.h"
%}


%%

[A-Z][a-z]{2,}			{ yylval.sValue = strdup(yytext); return NAME; }
[0-9]{4}			{ yylval.iValue = atoi(yytext); return STREET_NUM; }
[A-Z]{3,}			{ yylval.sValue = strdup(yytext); return STREET_NAME; }
[A-z]{2}			{ yylval.sValue = strdup(yytext); return STREET_TYPE; }
[0-9]{5}			{ yylval.iValue = atoi(yytext); return ZIPCODE; }
[ \t\n]				;
.				{ yyerror("WHAT THE DEUCE IS THIS?"); }

%%

