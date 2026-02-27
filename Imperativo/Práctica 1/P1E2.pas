{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program P1E2;
const	dF=300;
type	oficina=Record
			cod:integer;
			dni:integer;
			expensa:Real;
		end;
		vector=array[1..300]of oficina;

procedure cargarVector(var v:vector; var dL:integer);

	procedure leerOficina(var o:oficina);
	begin
		writeln('Ingrese el codigo de identificacion');
		readln(o.cod);
		if(o.cod<>-1)then
		begin
			o.dni:=random(999)+1;
			o.expensa:=random(5000)+500;
		end;
	end;

var
	o:oficina;
begin
	dL:=0;
	leerOficina(o);
	while(o.cod<>-1)do
	begin
		dL:=dL+1;
		v[dL]:=o;
		leerOficina(o);
	end;
end;

procedure insercion(var v:vector;dL:integer);
var
	i,j:integer;
	act:oficina;
begin
	for i:=2 to dL do 
	begin
		act:=v[i];
		j:=i-1;
		while((j>0)and(v[j].cod>act.cod))do
		begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=act;
	end;
end;

procedure seleccion(var v:vector;dL:integer);
var	
	i,j,pos:integer;
	item:oficina;
begin
	for i:=1 to dL-1 do 
	begin
		pos:=i;
		for j:=i+1 to dL do 
			if(v[j].cod<v[pos].cod)then
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;

var
	v:vector;
	dL:integer;
begin
	randomize;
	cargarVector(v,dL);
	insercion(v,dL);
	seleccion(v,dL);
end.
