La gramática XML presentada al correr los archivos lex y bison para reconocerla nos presenta unos conflictos shift-reduce. 

Es decir, la verificación de los tags START y STOP, al regex de reconocimiento alfabéticos al igual que el tag STR, así, tanto las reglas como el terminal que va a ser desplazado tiene la misma precedencia eyapp considera la asociatividad, si es asociativa a izquierdas, reduce y si es asociativa a derechas desplaza. Si no es asociativa, genera un mensaje de error. Por tanto, no se nos hes posible declarar dos tokens con diferente asociatividad y la misma precedencia.

