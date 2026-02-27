{Desafío...
4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}

program P2E4;
procedure convertir(valor:integer);
begin
	if(valor<>0)then
	begin
		convertir(valor div 2);
		if(valor mod 2=0)then
			write(0)
		else
			write(1);
	end;
end;

var
	n:integer;
begin 
	randomize;	
	{writeln('Ingrese un numero');
	readln(n);}
	n:=random(21);
	while(n<>0)do
	begin
		writeln;
		writeln('Valor: ',n);
		write('En binario: ');
		convertir(n);
		writeln;
		writeln;
		n:=random(20);
	end;
end.

