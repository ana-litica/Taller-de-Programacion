{Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program P2E3;
const
	max=1550;
	min=300;
	dF=20;
type	rango=min..max;
		vector=array[1..dF]of rango;

procedure cargarVector(var v:vector);

	procedure cargarRecursivo(var v:Vector;var i:integer);
	var
		valor:rango;
	begin
		valor:=random(max-min+1)+min;
		if(i<=dF)then
		begin
			i:=i+1;
			v[i]:=valor;
			cargarRecursivo(v,i);
		end;
	end;

var
	indice:integer;
begin
	indice:=0;
	cargarRecursivo(v,indice);
end;

procedure ordenar(var v:vector);
var 
	i,j:integer;
	act:rango;
begin
	for i:=2 to 20 do 
	begin
		act:=v[i];
		j:=i-1;
		while(j>0 and v[j]>act)do
		begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
	end;
end;

var
	v:vector;
begin
	randomize;
	cargarVector(v);//a
	ordenar(v);//b
end.

