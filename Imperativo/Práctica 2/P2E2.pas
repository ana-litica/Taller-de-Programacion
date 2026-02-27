{Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program P2E2;
const	min=100;
		max=200;
type	rango=min..max;
		lista=^nodo;
		nodo=record
			dato:integer;
			sig:lista;
		end;

procedure cargarLista(var l:lista);

	procedure agregarAdelante(var l:lista;v:integer);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=v;
		aux^.sig:=l;
		l:=aux;
	end;

var
	valor:integer;
begin
	valor:=random(max-min+1)+min;
	if(valor<>100)then
	begin
		agregarAdelante(l,valor);
		cargarLista(l^.sig);
	end;
end;

procedure imprimirEnOrden(l:lista);
begin
	if(l<>nil)then
	begin
		write(l^.dato,' | ');
		imprimirEnOrden(l^.sig);
	end;
end;

procedure imprimirInverso(l:lista);
begin
	if(l<>nil)then
	begin
		imprimirInverso(l^.sig);
		write(l^.dato,' | ');
	end;
end;

function minimo(l:lista):integer;
var
	aux:integer;
begin
	if(l=nil)then
		minimo:=999
	else
	begin
		aux:=minimo(l^.sig);
		if(l^.dato<aux)then
			minimo:=l^.dato
		else
			minimo:=aux;
	end;
end;

function encontrado(l:lista;valor:integer):boolean;
begin
	if(l=nil)then
		encontrado:=false
	else
		if(l^.dato=valor)then
			encontrado:=true
		else
			encontrado:=encontrado(l^.sig,valor);
end;

var
	l:lista;
	valor:integer;
begin
	randomize;
	l:=nil;
	cargarLista(l);//a
	writeln('En orden');
	imprimirEnOrden(l);//b
	writeln;
	writeln('Orden inverso');
	imprimirInverso(l);//c
	writeln;
	writeln;
	writeln('El minimo de la lista es ',minimo(l));
	writeln;
	writeln;
	valor:=random(max-min+1)+min;
	if(encontrado(l,valor))then
		writeln('El valor ', valor,' se encuentra en la lista.')
	else
		writeln('El valor ', valor,' no se encuentra en la lista.');
end.
