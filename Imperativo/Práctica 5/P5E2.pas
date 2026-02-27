{Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program P5E2;
type	auto=record
			patente:string;
			fabricacion:integer;
			modelo:integer;
		end;
		
		auto2=record
			marca:string;
			auto:auto;
		end;
		
		lista=^nodo;
		nodo=record
			dato:auto;
			sig:lista;
		end;
		
		registro=record
			marca:string;
			l:lista;
		end;
		
		arbol1=^nodo1;
		nodo1=record
			dato:auto2;
			HI:arbol1;
			HD:arbol1;
		end;
		
		arbol2=^nodo2;
		nodo2=record
			dato:registro;
			HI:arbol2;
			HD:arbol2;
		end;
		
		registro2=record
			patente:string;
			marca:string;
			modelo:integer;
		end;
		
		lista2=^nodoL2;
		nodoL2=record
			dato:registro2;
			sig:lista2;
		end;
		
		vector=array[2010..2018]of lista2;

procedure cargarArboles(var a1:arbol1;var a2:arbol2);
	
	procedure leerAuto(var a:auto2);
	var
		p:array[1..5]of string=('vexg','rudn','4vqs','rmdf','lkaf');
	begin
		writeln('Ingrese una marca ');
		readln(a.marca);
		if(a.marca<>'MMM')then
		begin	
			a.auto.patente:=p[random(5)+1];
			a.auto.fabricacion:=2010+random(2018-2010+1);
			a.auto.modelo:=2010+random(2018-2010+1);
		end;
		writeln('Patente: ',a.auto.patente);
		writeln('Modelo: ',a.auto.modelo);
	end;
	
	procedure agregarA1(var a:arbol1;auto:auto2);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato:=auto;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(a^.dato.auto.patente>auto.auto.patente)then
				agregarA1(a^.HI,auto)
			else
				agregarA1(a^.HD,auto);
	end;
	
	procedure agregarAdelante(var l:lista;a:auto);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=a;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure agregarA2(var a:arbol2;auto:auto2);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.marca:=auto.marca;
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,auto.auto);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(a^.dato.marca=auto.marca)then
				agregarAdelante(a^.dato.l,auto.auto)
			else
				if(auto.marca<a^.dato.marca)then
					agregarA2(a^.HI,auto)
				else
					agregarA2(a^.HD,auto);
	end;
	
var
	u:auto2;
begin
	a1:=nil;
	a2:=nil;
	leerAuto(u);
	while(u.marca<>'MMM')do
	begin	
		agregarA1(a1,u);
		agregarA2(a2,u);
		leerAuto(u);
	end;
end;

procedure contarMarca1(a:arbol1);

	function contarAutos1(a:arbol1;marca:string):integer;
	begin
		if(a=nil)then
			contarAutos1:=0
		else
			if(a^.dato.marca=marca)then
				contarAutos1:=contarAutos1(a^.HI,marca)+contarAutos1(a^.HD,marca)+1
			else
				contarAutos1:=contarAutos1(a^.HI,marca)+contarAutos1(a^.HD,marca);
	end;

var
	marca:string;
begin
	writeln;
	writeln('Ingrese una marca');
	readln(marca);
	writeln('La cantidad de autos de la marca ',marca,' es ',contarAutos1(a,marca));
end;

procedure contarMarca2(a:arbol2);

	function contarAutos2(a:arbol2;marca:string):integer;
	
		function contarLista(l:lista):integer;
		var
			suma:integer;
		begin
			suma:=0;
			while(l<>nil)do
			begin
				suma:=suma+1;
				l:=l^.sig;
			end;
			contarLista:=suma;
		end;
	
	begin
		if(a=nil)then
			contarAutos2:=0
		else
			if(a^.dato.marca=marca)then
				contarAutos2:=contarLista(a^.dato.l)
			else
				if(a^.dato.marca<marca)then	
					contarAutos2:=contarAutos2(a^.HD,marca)
				else
					contarAutos2:=contarAutos2(a^.HI,marca);				
	end;

var
	marca:string;
begin
	writeln;
	writeln('Ingrese una marca');
	readln(marca);
	writeln('La cantidad de autos de la marca ',marca,' es ',contarAutos2(a,marca));
end;
	
procedure inicializarListas(var v:vector);
var
	i:integer;
begin
	for i:=2010 to 2018 do
		v[i]:=nil;
end;

procedure cargarVector(var v:vector;a:arbol1);

	procedure agregarAdelante(var l:lista2;r:registro2);
	var
		aux:lista2;
	begin
		new(aux);
		aux^.dato:=r;
		aux^.sig:=l;
		l:=aux;
	end;
	

var
	r:registro2;
begin
	if(a<>nil)then
	begin
		cargarVector(v,a^.HD);
		cargarVector(v,a^.HD);
		r.patente:=a^.dato.auto.patente;
		r.marca:=a^.dato.marca;
		r.modelo:=a^.dato.auto.modelo;
		agregarAdelante(v[a^.dato.auto.fabricacion],r);
	end;
end;

procedure buscarPatente1(a:arbol1);

	function buscarModelo1(a:arbol1;patente:string):integer;
	begin
		if(a=nil)then
			buscarModelo1:=-1
		else
			if(a^.dato.auto.patente=patente)then
				buscarModelo1:=a^.dato.auto.modelo
			else
				if(patente<a^.dato.auto.patente)then
					buscarModelo1(a^.HI,patente)
				else
					buscarModelo1(a^.HD,patente);
	end;

var
	patente:string;
	modelo:integer;
begin
	writeln;
	writeln('Ingrese una patente');
	readln(patente);
	writeln;
	modelo:=buscarModelo1(a,patente);
	if(modelo=-1)then
		writeln('La patente no se encuentra registrada')
	else
		writeln('El auto con patente ',patente,' es modelo ',modelo);
end;

procedure buscarPatente2(a:Arbol2);

	procedure buscarModelo2(a:arbol2;patente:string;modelo:integer;var esta:boolean);
	
		procedure buscar(l:lista;patente:string;modelo:integer;esta:boolean);
		begin
			while((l<>nil)and(not esta))do
			begin
				if(l^.dato.patente=patente)then
				begin
					esta:=true;
					modelo:=l^.dato.modelo;
				end
				else
					l:=l^.sig;
			end;
		end;
	
	begin
		if((a<>nil))then
		begin
			buscar(a^.dato.l,patente,modelo,esta);
			if(not esta)then
			begin
				buscarModelo2(a^.HI,patente,modelo,esta);
				buscarModelo2(a^.HD,patente,modelo,esta);
			end;
		end;
	end;

var
	patente:string;
	modelo:integer;
	esta:boolean;
begin
	esta:=false;
	writeln;
	writeln('Ingrese una patente');
	readln(patente);
	modelo:=-1;
	buscarModelo2(a,patente,modelo,esta);
	writeln;
	if(not esta)then
		writeln('La patente ingresada no se encuentra registrada')
	else
		writeln('El auto de patente ',patente,' es modelo ',modelo);
end;

var
	a1:arbol1;
	a2:arbol2;
	v:vector;
begin
	randomize;
	cargarArboles(a1,a2);
	contarMarca1(a1);
	contarMarca2(a2);
	inicializarListas(v);
	cargarVector(v,a1);
	buscarPatente1(a1);
	buscarPatente2(a2);
end.
