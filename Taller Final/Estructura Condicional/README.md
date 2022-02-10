1)Maquina de estados generada a partir de cond.dot y el uso de Graphviz
   ![machine_state](https://user-images.githubusercontent.com/72633281/153325519-a24f0110-42b1-467a-906e-0268fc782739.png)


2) Los conflictos de SHIFT-REDUCE se presentan en el parsing de los tokens ELSE, este conflicto afecta al token THEN, ya que al no haber una precedencia entre estos dos, puede que se use el SHIFT en ELSE, aunque la entrada requiera un REDUCE.

3) Para solucionar el conflicto podemos darle un precedencia mayor a ELSE, o dejar la predeciencia de ambos al mismo nivel, de este modo solucionamos el conflicto usando asociatividad a derecha.
