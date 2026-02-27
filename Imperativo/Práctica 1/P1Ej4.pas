{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

program TP1Ej4;
type	rango1=1..8;
		rango2=0..30;

		registro=record
			precio:real;
			cod:integer;
		end;
		
		producto=record
			rubro:rango1;
			r:registro;
		end;
		
		lista=^nodo;
		nodo=record
			dato:registro;
			sig:lista;
		end;
		
		vector=array[rango1]of lista;
		vector2=array[rango2]of registro;
		
procedure cargarProductos(var v:vector);

	procedure leerProducto(var p:producto);
	begin
		writeln('Ingrese el precio del producto');
		readln(p.r.precio);
		if(p.r.precio<>0)then
		begin
			writeln('Ingrese el codigo del producto');
			readln(p.r.cod);
			writeln('Ingrese el rubro');
			readln(p.rubro);
		end;
	end;

	procedure inicializarRubros(var v:vector);
	var
		i:rango1;
	begin
		for i:=1 to 8 do
			v[i]:=nil;
	end;

	procedure agregarAdelante(var l:lista;r:registro);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=r;
		aux^.sig:=l;
		l:=aux;
	end;

var
	p:producto;
begin
	inicializarRubros(v);
	leerProducto(p);
	while(p.r.precio<>0)do
	begin
		agregarAdelante(v[p.rubro],p.r);
		leerProducto(p);
	end;
end;

procedure imprimirCodigos(v:vector);

	procedure imprimirRubro(l:lista);
	begin
		while(l<>nil)do
		begin
			writeln(l^.dato.cod);
			l:=l^.sig;
		end;
	end;

var
	i:rango1;
begin
	for i:=1 to 8 do
	begin
		writeln('Rubro ',i);
		imprimirRubro(v[i]);
	end;
end;

procedure rubro3(l:lista;var v2:vector2;var dl:rango2);
begin
	dl:=0;
	while((l<>nil)and(dl<30))do
	begin
		dl:=dl+1;
		v2[dl]:=l^.dato;
		l:=l^.sig;
	end;
end;

procedure seleccion(var v:Vector2; dl:rango2);
var
	i,j,pos:rango2;
	item:registro;
begin
	for i:=1 to dl-1 do
	begin
		pos:=i;
		for j:=1 to dl do
		begin
			if(v[j].precio<v[pos].precio)then
				pos:=j;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
		end;
	end;
end;

procedure imprimir(v:vector2; dl:rango2);
var
	i:rango2;
begin
	writeln('Precios del rubro 3:');
	for i:=1 to dl do
		writeln(v[i].precio:0:2);
end;

function promedio(v:vector2;dl:rango2):real;
var
	i:rango2;
	suma:real;
begin
	suma:=0;
	for i:=1 to dl do
		suma:=suma+v[i].precio;
	promedio:=suma/dl;
end;

var 
	v:vector;
	v2:vector2;
	dl:rango2;
begin
	cargarProductos(v);//A
	imprimirCodigos(v);//B
	rubro3(v[3],v2,dl);//C
	seleccion(v2,dl);//D
	imprimir(v2,dl);//E
	writeln('El promedio de los precios del rubro 3 es ',promedio(v2,dl):0:2);//F
end.
