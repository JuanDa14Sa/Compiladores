%{

#include <stdio.h>
extern int yylex();
extern int yyparse();

void yyerror(const char* s);
%}

%token T_IF T_THEN T_ELSE 
%token T_VAL
%token T_NEWLINE T_QUIT
%right T_THEN T_ELSE

%type E

%start Z

%%

Z: 
	| Z 	S 
;

S: T_IF E T_THEN S T_ELSE S  {printf("Estructura correcta: if then else\n");}
|   T_IF E T_THEN S	{printf("Estructura correcta: if then");}
|   T_VAL       	
|   T_NEWLINE
|  T_QUIT T_NEWLINE  {exit(0);}
;


E: T_VAL	{$$=$1;}	
;

%%

main() 
{ 
    printf("Inserte una estructura condicional:\n"); 

    if(yyparse()==0) 
        printf("Finalizado\n"); 
} 
 
yyerror() 
{ 
    printf("ERROR: Estructura invalida\n"); 
}
