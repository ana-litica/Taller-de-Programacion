{Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.

b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}

program P3E2;
type	registro=record
			fecha:string;
			cant:integer;
		end;
		
		venta=record
			cod:integer;
			r:registro;
		end;
		
		arbol1=^nodo1;
		nodo1=record
			dato:venta;
			HI:arbol1;
			HD:arbol1;
		end;
		
		venta2=record
			cod:integer;
			cant:integer;
		end;
		
		arbol2=^nodo2;
		nodo2=record
			dato:venta2;
			HI:arbol2;
			HD:arbol2;
		end;
		
		lista=^nodoL;
		nodoL=record
			dato:registro;
			sig:lista;
		end;
		
		venta3=record
			cod:integeR;
			l:lista;
		end;
		
		arbol3=^nodo3;
		nodo3=record
			dato:venta3;
			HI:arbol3;
			HD:arbol3;
		end;

procedure cargarArboles(var a1:arbol1;var a2:arbol2;var a3:arbol3);

	procedure leerVenta(var v:venta);
	var
		fechas:array[1..4] of string=('25/7','1/11','4/11','12/10');
	begin
		v.cod:=random(21);
		if(v.cod<>0)then
		begin	
			v.r.fecha:=fechas[random(4)+1];
			v.r.cant:=random(20)+1;
		end;
	end;
	
	procedure agregarAdelante(var l:lista; r:registro);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=r;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure agregar1(var a:arbol1;v:Venta);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato:=v;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(v.cod<a^.dato.cod)then
				agregar1(a^.HI,v)
			else
				agregar1(a^.HD,v)
	end;
	
	procedure agregar2(var a:arbol2;v:venta);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.cod:=v.cod;
			a^.dato.cant:=v.r.cant;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(a^.dato.cod=v.cod)then
				a^.dato.cant:=a^.dato.cant+v.r.cant
			else
				if(v.cod<a^.dato.cod)then
					agregar2(a^.HI,v)
				else
					agregar2(a^.HD,v)
	end; 
	
	procedure agregar3(var a:arbol3;v:venta);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.cod:=v.cod;
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,v.r);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(a^.dato.cod=v.cod)then
				agregarAdelante(a^.dato.l,v.r)
			else
				if(v.cod<a^.dato.cod)then	
					agregar3(a^.HI,v)
				else
					agregar3(a^.HD,v);
	end;

var
	v:venta;
begin
	a1:=nil;
	a2:=nil;
	a3:=nil;
	leerVenta(v);
	while(v.cod<>0)do
	begin
		agregar1(a1,v);
		agregar2(a2,v);
		agregar3(a3,v);
		leerVenta(v);
	end;
end;

procedure productosFecha(a:arbol1);

	function contarProductos(a:arbol1;f:string):integer;
	begin
		if(a=nil)then
			contarProductos:=0
		else
			if(a^.dato.r.fecha=f)then
				contarProductos:=contarProductos(a^.HI,f)+contarProductos(a^.HD,f)+1
			else
				contarProductos:=contarProductos(a^.HI,f)+contarProductos(a^.HD,f)
	end;

var
	fecha:string;
begin	
	writeln('Ingrese una fecha');
	readln(fecha);
	writeln;
	writeln('La cantidad de productos vendidos en la fecha ingresada es ',contarProductos(a,fecha));
	writeln;
end;

procedure masUnidades(a:Arbol2);

	procedure hallarMasUnidades(a:Arbol2;var max,maxCod:integer);
		
		procedure actualizarMasUnidades(v:venta2;var max,maxCod:integer);
		begin
			if(max<v.cant)then
			begin
				max:=v.cant;
				maxCod:=v.cod;
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
	max:=-1;
	hallarMasUnidades(a,max,maxCod);
	if(max=-1)then
		writeln('Arbol vacio')
	else
		writeln('El codigo del producto con mas unidades vendidas es ',maxCod,' con ',max,' unidades.');
end;

procedure masVentas(a:arbol3);

	procedure hallarMasVentas(a:Arbol3;var max,maxCod:integer);
	
		function contarVentas(l:lista):integer;
		begin
			if(l=nil)then
				contarVentas:=0
			else
				contarVentas:=contarVentas(l^.sig)+1;
		end;
		
		procedure actualizarMasVentas(cod,cantVentas:integer;var max,maxCod:integer);
		begin
			if(max<cantVentas)then
			begin
				max:=cantVentas;
				maxCod:=cod;
			end;
		end;
		
		{function contar(l:lista):integer;
		var
			c:integer;
		begin
			c:=0;
			while(l<>nil)do
			begin
				c:=c+1;
				l:=l^.sig;
			end;
			contar:=c;
		end;}
	
	var
		cantVentas:integer;
	begin
		if(a<>nil)then
		begin	
			cantVentas:=contarVentas(a^.dato.l);
			{write(contar(a^.dato.l),' | ',cantVentas);
			writeln;}
			actualizarMasVentas(a^.dato.cod,cantVentas,max,maxCod);
			hallarMasVentas(a^.HI,max,maxCod);
			hallarMasVentas(a^.HD,max,maxCod);
		end;
	end;

var
	max,maxCod:integer;
begin	
	writeln;
	max:=-1;
	hallarMasVentas(a,max,maxCod);
	if(max=-1)then
		writeln('Arbol vacio')
	else
		writeln('El codigo de producto con mas ventas es ',maxCod,' con ',max,' ventas.');
	writeln;
end;

var
	a1:arbol1;
	a2:arbol2;
	a3:arbol3;
begin
	randomize;
	cargarArboles(a1,a2,a3);//a
	productosFecha(a1);//b
	masUnidades(a2);//c
	masVentas(a3);//d
end.
			
