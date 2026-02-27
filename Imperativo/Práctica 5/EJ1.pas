{El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program AdEj1;
const	dimF=300;
type	rango=0..dimF;
		oficina=record
			cod:integer;
			dni:integer;
			expensa:real;
		end;
		
		vector=array[1..dimF]of oficina;
	
procedure cargarVector(var v:vector; var dimL:integer);

	procedure generarOficina(var o:oficina);
	begin
		o.cod:=random(101);
		if(o.cod<>0)then
		begin
			   o.dni:=random(5000)+1;
			   o.expensa:=random(200)+1;
		end;
		writeln('Codigo:',o.cod,'. DNI del propietario: ',o.dni,'. Valor de expensa: ',o.expensa:0:2);
	end;

var
	o:oficina;
begin
	dimL:=0;
	generarOficina(o);
	while((dimL<dimF)and(o.cod<>0))do
	begin
		dimL:=dimL+1;
		v[dimL]:=o;
		generarOficina(o);
	end;
end;	

procedure ordenar{seleccion}(var v:vector;dimL:integer);
var
	i,j,pos:integer;
	item:oficina;
begin
	for i:=1 to dimL-1 do
	begin
		pos:=i;
		for j:=i+1 to dimL do
			if(v[j].cod<v[pos].cod)then
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;
end;

{procedure ordenar (var v:Vector;dimL:integer);//insercion
var
begin
	for i:=2 to dimL do
	begin
		act:=v[i];
		j:=i-1;
		while((j>0)and(v[j]>act))do
		begin
			v[j+1]:=v[i];
			v:=j-1;
		end;
		v[j+1]:=act;
	end;
end;}

function busquedaDicotomica(v:vector;cod,dimL,inicio,fin:integer):integer;
var
	mitad:integer;
begin
	if(dimL=0)then
		busquedaDicotomica:=0
	else
	begin
		if(inicio<=fin)then
		begin
			mitad:=(inicio+fin)div 2;
			if(v[mitad].cod=cod)then
				busquedaDicotomica:=mitad
			else
			begin
				if(v[mitad].cod>cod)then
					busquedaDicotomica:=busquedaDicotomica(v,cod,dimL,inicio,mitad-1)
				else
					busquedaDicotomica:=busquedaDicotomica(v,cod,dimL,mitad+1,fin)
			end;
		end
		else
			busquedaDicotomica:=0;
	end;
end;

function montoTotal(v:Vector;dimL:integer):real;
begin
	if(dimL=0)then
		montoTotal:=0
	else
		montoTotal:=v[dimL].expensa+montoTotal(v,dimL-1);
end;

var
	v:Vector;
	dimL,cod,pos:integer;
begin
	randomize;
	cargarVector(v,dimL);//A
	ordenar(v,dimL);//B
	writeln;
	writeln;
	writeln('Ingrese un codigo: ');
	readln(cod);
	pos:=busquedaDicotomica(v,cod,dimL,1,dimF);//C	
	if(pos<>0)then
		writeln('El dni del propietario de la oficina con codigo ',cod,' es ',v[pos].dni)
	else
		writeln('No se encontro la oficina.');
	writeln;
	writeln;
	writeln('El monto total del expensas es ',montoTotal(v,dimL):0:2);
end.
