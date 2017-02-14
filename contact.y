%code top{
	#include <stdio.h>
}

%union{
	int iValue;
	char* sValue;
}

%start file
%token NAME
%type<sValue> NAME
%token STREET_NUM
%type<iValue> STREET_NUM
%token STREET_NAME
%type<sValue> STREET_NAME
%token STREET_TYPE
%type<sValue> STREET_TYPE
%token ZIPCODE
%type<iValue> ZIPCODE
%token EMAIL
%type<sValue> EMAIL
%token PHONE_NUM
%type<sValue> PHONE_NUM

%%

file:		contact
	|	contact file
;

contact:	NAME NAME STREET_NUM STREET_NAME STREET_TYPE ZIPCODE {printf("%s %s\n%d %s %s\n%d\n==========\n", $1,$2,$3,$4,$5,$6); free($1); free($2); free($4); free($5); }
;

%%

int main(int argc, char** argv){
	yyparse();
}

int yyerror (char *msg) {
	return fprintf (stderr, "YACC: %s\n", msg);
}
