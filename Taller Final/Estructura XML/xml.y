%{
    #include<stdio.h> 
    #include<string.h>
%} 

%union{
    char *str;
}

%token <str>TK_START <str>TK_STOP <str>TK_STR

%type <str> xml start
%%



start : xml  {printf("Resultado\n");} 




xml: TK_START exp TK_STOP   {   
                                if(strcmp($1, $3)  != 0){
                                    yyerror("Error");
                                }     
                            };

exp : start
| TK_STR
| exp start
;

%% 

main() 
{ 
    printf("Ingrese la expresion a calcular:\n"); 

    if(yyparse()==0) 
        printf("Resultado\n"); 
} 

yywrap()
{
} 

yyerror() 
{ 
    printf("Error\n"); 
}

