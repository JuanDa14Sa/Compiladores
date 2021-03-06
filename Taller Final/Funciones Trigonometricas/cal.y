%{
    #include<stdio.h> 
    #include<math.h>
    #define PI 3.14159265358979323846
%} 

%union
{
 float real;
}

%token <real> TK_NUM 
%token TK_SEN
%token TK_COS
%token TK_TAN
%token TK_SENH
%token TK_COSH
%token TK_TANH
%token TK_SQRT
%token TK_LOG
%token TK_E
%token TK_PI
%left '-''+' 
%left '*''/' 
%right '^'

%type <real> exp
%type <real> start

%% 
start: exp {printf("%f\n",$$);} 

exp:exp'+'exp           {$$ = $1+$3;} 
    |exp'-'exp          {$$ = $1-$3;} 
    |exp'*'exp          {$$ = $1*$3;} 
    |exp'/'exp          { 
                            if($3 == 0){  
                                yyerror("error"); 
                                YYERROR;
                            }else{ 
                                $$ = $1/$3; 
                            } 
                        } 
    |exp'^'exp          {$$ = pow($1, $3);} 
    |'('exp')'          {$$ = $2;} 
    |TK_SEN'('exp')'    {$$ = sin($3);} 
    |TK_COS'('exp')'    {$$ = cos($3);}
    |TK_TAN'('exp')'    {  
                            if(fabs(cos($3)) < 0.0001){  
                                yyerror("error"); 
                                YYERROR;
                            }else{ 
                                $$ = tan($3); 
                            }
                        }
    |TK_SENH'('exp')'   {$$ = sinh($3);}
    |TK_COSH'('exp')'   {$$ = cosh($3);}
    |TK_TANH'('exp')'   {$$ = tanh($3);}
    |TK_LOG'('exp')'    {
                            if($3 <= 0){  
                                yyerror("error"); 
                                YYERROR;
                            }else{ 
                                $$ = log($3); 
                            }
                        }
    |TK_E'('exp')'      {$$ = exp($3);}
    |TK_SQRT'('exp')'   {
                            if($3 < 0){  
                                yyerror("error"); 
                                YYERROR;
                            }else{ 
                                $$ = sqrt($3); 
                            }
                        }
    |TK_NUM             {$$ = $1;} 
    |TK_PI              {$$ = PI;}
    ; 

%% 

main() 
{ 
    printf("Enter the Expression:\n"); 

    if(yyparse()==0) 
        printf("Success\n"); 
} 

yywrap()
{
} 

yyerror() 
{ 
    printf("ERROR: Invalid Arithmetic Expression\n"); 
    return 0;
}

