{3. Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario.
El ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.
}

program TP4Ej3;
type	producto=record
			codP:integer;
			unidades:integer;
			monto:integer;
		end;
		
		venta=record
			codV:integer;
			codP:integer;
			unidades:integer;
			precio:integer;
		end;
		
		arbol=^nodo;
		nodo=record
			dato:producto;
			HI:arbol;
			Hd:arbol;
		end;
		
procedure cargarArbol(var a:arbol);

	procedure generarVenta(var v:venta);
	begin
		v.codV:=random(101);
		if(v.codV<>0)then
		begin
			v.codP:=random(100)+1;
			v.unidades:=random(100)+1;
			v.precio:=random(100)+1;
		end;
	end;
	
	procedure agregar(var a:arbol;v:venta);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.codP:=v.codP;
			a^.dato.unidades:=v.unidades;
			a^.dato.monto:=v.precio;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
		begin
			if(v.codP=a^.dato.codP)then
			begin
				a^.dato.unidades:=a^.dato.unidades+v.unidades;
				a^.dato.monto:=a^.dato.monto+v.precio;
			end
			else
			begin
				if(v.codP<a^.dato.codP)then
					agregar(a^.HI,v)
				else
					agregar(a^.HD,v);
			end;
		end;
	end;

var
	v:venta;
begin
	a:=nil;
	generarVenta(v);
	while(v.codV<>0)do
	begin
		agregar(a,v);
		generarVenta(v);
	end;
end;
		
procedure imprimir(a:arbol);

	procedure imprimirRecursivo(a:arbol);
	begin
		if(a<>nil)then
		begin
			imprimirRecursivo(a^.HI);
			writeln('Codigo de producto: ',a^.dato.codP,'|Unidades vendidas: ',a^.dato.unidades,'|Monto total: ',a^.dato.monto);
			imprimirRecursivo(a^.HD);
		end;
	end;

begin
	writeln('Productos: ');
	writeln;
	imprimirRecursivo(a);
end;

procedure masUnidades(a:arbol);

	procedure hallarMasUnidades(a:arbol;var max,maxCod:integer);
	
		procedure actualizarMasUnidades(p:producto;var max,maxCod:integer);
		begin
			if(p.unidades>=max)then
			begin
				max:=p.unidades;
				maxCod:=p.codP;
			end;
		end;
	
	begin
		if(a<>nil)then
		begin
			actualizarMasUnidades(a^.dato,max,maxCod);
			hallarMasUnidades(a^.HI,max,maxCod);
			hallarMasUnidades(a^.HD,max,maxCod);
		end;
	end;

var
	max,maxCod:integer;
begin
	writeln;
	writeln;
	max:=-1;
	hallarMasUnidades(a,max,maxCod);
	if(max=-1)then
		writeln('Arbol sin elementos.')
	else
		writeln('El productos de codigo ',maxCod,' es el que tiene mayor cantidad de unidades vendidas.');
end;
		
procedure contarMenores(a:arbol);

	function sonMenores(a:arbol;valor:integer):integer;
	begin
		if(a=nil)then
			sonMenores:=0
		else
		begin
			if(a^.dato.codP<valor)then
				sonMenores:=1+sonMenores(a^.HI,valor)+sonMenores(a^.HD,valor)
			else
				sonMenores:=sonMenores(a^.HI,valor);
		end;
	end;

var
	valor:integer;
begin
	writeln;
	writeln;
	write('Ingrese un valor: ');
	read(valor);
	writeln;
	writeln;
	writeln('La cantidad de codigos menores a ',valor,' es ',sonMenores(a,valor));
end;
		
procedure montoTotal(a:Arbol);

	function contarTotal(a:arbol;minimo,maximo:integer):integer;
	begin
		if(a=nil)then
			contarTotal:=0
		else
		begin
			if((a^.dato.codP>minimo)and(a^.dato.codP<maximo))then
				contarTotal:=a^.dato.monto+contarTotal(a^.HI,minimo,maximo)+contarTotal(a^.HD,minimo,maximo)
			else
			begin
				if(a^.dato.codP<=minimo)then
					contarTotal:=contarTotal(a^.HD,minimo,maximo)
				else
					if(a^.dato.codP>=maximo)then
						contarTotal:=contarTotal(a^.HI,minimo,maximo);
			end;
		end;
	end;

var
	minimo,maximo:integer;
begin
	writeln;
	writeln;
	writeln('Ingrese el minimo del rango');
	read(minimo);
	writeln('Ingrese el maximo del rango');
	read(maximo);
	writeln;
	writeln;
	writeln('El monto total de los productos entre los codigos ',minimo,' y ',maximo,' es ',contarTotal(a,minimo,maximo));
end;		
		
var
	a:arbol;
begin
	randomize;
	cargarArbol(a);
	imprimir(a);
	masUnidades(a);
	contarMenores(a);
	montoTotal(a);//Duda
end.
