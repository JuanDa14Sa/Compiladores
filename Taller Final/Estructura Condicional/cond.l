%option noyywrap

%{ 
 #include <stdio.h>
 #include"cond.tab.h"
	
 #define YY_DELC iny yylex()
%} 

%% 

[0-9]+ {;return T_VAL;}

"if"     {return T_IF;} 

"then"     {return T_THEN;} 

"else"     {return T_ELSE;} 

"quit"|"exit"	{return T_QUIT;}

[\t]+   ;

" "     { }

[\n]    {return 0;} 

.       {return yytext[0]; } 

%% 

