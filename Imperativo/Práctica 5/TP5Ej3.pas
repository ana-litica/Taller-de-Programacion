{Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}

program TpAdEj3;
type	rangoR=1..10;
		registro=record
			cod:integer;
			stock:integer;
			precio:real;
		end;
		
		producto=record
			rubro:rangoR;
			r:registro;
		end;
		
		arbol=^nodo;
		nodo=record
			dato:registro;
			HI:Arbol;
			HD:arbol;
		end;
		
		vector=array[rangoR]of arbol;

procedure cargarVector(var v:vector);

	procedure inicializarArboles(var v:vector);
	var
		i:rangoR;
	begin
		for i:=1 to 10 do
			v[i]:=nil;
	end;

	procedure generarProducto(var p:producto);
	begin
		p.r.cod:=random(101);
		if(p.r.cod<>0)then
		begin
			p.rubro:=random(10)+1;
			p.r.stock:=random(20)+1;
			p.r.precio:=random(50)+1;
		end;
		writeln('Codigo: ',p.r.cod,'. Rubro: ',p.rubro,'. Stock: ',p.r.stock,'. Precio: ',p.r.precio:0:2);
	end;
	
	procedure agregar(var a:arbol;r:Registro);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato:=r;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
		begin
			if(r.cod<a^.dato.cod)then
				agregar(a^.HI,r)
			else
				agregar(a^.HD,r);
		end;
	end;

var
	p:producto;
begin
	inicializarArboles(v);
	generarProducto(p);
	while(p.r.cod<>0)do
	begin
		agregar(v[p.rubro],p.r);
		generarProducto(p);
	end;
end;

procedure buscarProducto(v:vector);

	function buscar(a:arbol;cod:integer):boolean;
	begin
		if(a=nil)then
			buscar:=false
		else
		begin
			if(cod=a^.dato.cod)then
				buscar:=true
			else	
				buscar:=buscar(a^.HI,cod)or buscar(a^.HD,cod);
		end;
	end;

var	
	rubro:rangoR;
	codigo:integer;
begin
	writeln;
	writeln;
	writeln('Ingrese un rubro:');
	readln(rubro);
	writeln('Ingrese un codigo:');
	readln(codigo);
	writeln;
	writeln;
	if(buscar(v[rubro],codigo))then
		writeln('El codigo ',codigo,' existe en el rubro ',rubro)
	else
		writeln('El codigo ',codigo,' no existe en el rubro ',rubro);
end;

procedure hallarMaximos(v:vector);

	procedure actualizarMaximo(r:registro;var maxCod,maxStock:integer);
	begin
		if(r.cod>maxCod)then
		begin
			maxCod:=r.cod;
			maxStock:=r.stock;
		end;
	end;


	procedure maximo(a:arbol;var maxCod,maxStock:integer);
	begin
		if(a<>nil)then
		begin
			actualizarMaximo(a^.dato,maxCod,maxStock);
			maximo(a^.HI,maxCod,maxStock);
			maximo(a^.HD,maxCod,maxStock);
		end;
	end;

var
	i:rangoR;
	maxCod,maxStock:integer;
begin
	writeln;
	writeln;
	for i:=1 to 10 do
	begin
		maxCod:=-1;
		maximo(v[i],maxCod,maxStock);
		if(maxCod=-1)then
			writeln('Arbol vacio')
		else
			writeln('El producto de mayor codigo del rubro ',i,' es ',maxCod,'. Su stock es ',maxStock);
	end;
end;

procedure informarEntreCodigos(v:Vector);

	function contarCodigos(a:Arbol;min,max:rangoR):integer;
	begin
		if(a=nil)then
			contarCodigos:=0
		else
		begin
			if((a^.dato.cod>min)and(a^.dato.cod<max))then
				contarCodigos:=contarCodigos(a^.HI,min,max)+contarCodigos(a^.HD,min,max)+1
			else
			begin
				if(a^.dato.cod>max)then
					contarCodigos:=contarCodigos(a^.HI,min,max)
				else
				begin
					if(a^.dato.cod<min)then
						contarCodigos:=contarCodigos(a^.HD,min,max);
				end;
			end;
		end;
	end;
	
var
	i,cod1,cod2:rangoR;
begin
	writeln;
	writeln;
	writeln('Ingrese el codigo minimo:');
	readln(cod1);
	writeln;
	writeln('Ingrese el codigo maximo:');
	readln(cod2);
	writeln;
	writeln;
	for i:=1 to 10 do
	begin
		if(v[i]=nil)then
			writeln('Arbol vacio')
		else
			writeln('La cantidad de produtos con codigo entre ',cod1, ' y ',cod2,' en el rubro ',i,' es ',contarCodigos(v[i],cod1,cod2));
	end;
end;

var
	v:vector;
begin
	randomize;
	cargarVector(v);//A
	buscarProducto(v);//B
	hallarMaximos(v);//C
	informarEntreCodigos(v);//D
end.
