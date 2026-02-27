{Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}

program P5E4;
type	reclamo=record
			cod:integer;
			anio:integer;
			tipo:string;
		end;
		
		reclamo2=record
			dni:integer;
			r:reclamo;
		end;
		
		lista=^nodo;
		nodo=record
			dato:reclamo;
			sig:lista;
		end;
		
		registro=record
			dni:integer;
			cant:integer;
			l:lista;
		end;
		
		arbol=^nodoA;
		nodoA=record
			dato:registro;
			HI:arbol;
			HD:arbol;
		end;

procedure cargarArbol(var a:arbol);

	procedure leerReclamo(var r:reclamo2);
	begin
		writeln('Ingrese el codigo de reclamo ');
		readln(r.r.cod);
		if(r.r.cod<>0)then
		begin
			r.r.anio:=2000+random(26);
			r.dni:=random(5000)+5000;
			r.r.tipo:='ZZZ';
		end;
		writeln('DNI: ',r.dni);
		writeln('Anio ',r.r.anio);
	end;
	
	procedure agregarAdelante(var l:lista; r:reclamo);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=r;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure agregar(var a:arbol;r:reclamo2);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.dni:=r.dni;
			a^.dato.cant:=1;
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,r.r);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(r.dni=a^.dato.dni)then begin
				agregarAdelante(a^.dato.l,r.r);
				a^.dato.cant:=a^.dato.cant+1;
			end
			else
				if(r.dni<a^.dato.dni)then
					agregar(a^.HI,r)
				else
					agregar(a^.HD,r);
	end;

var
	r:reclamo2;
begin
	a:=nil;                                                
	leerReclamo(r);
	while(r.r.cod<>0)do
	begin
		agregar(a,r);
		leerReclamo(r);
	end;
end;

function contar(l:lista):integer;
begin
	if(l=nil)then
		contar:=0
	else
		contar:=contar(l^.sig)+1;
end;

procedure contarReclamos(a:arbol);

	function buscar(a:arbol;dni:integer):integer;	
	begin
		if(a=nil)then
			buscar:=0
		else
		if(dni=a^.dato.dni)then
			buscar:=contar(a^.dato.l)
		else
			if(dni<a^.dato.dni)then
				buscar:=buscar(a^.HI,dni)
			else
				buscar:=buscar(a^.HD,dni);
	end;

var
	dni:integer;
begin
	writeln('Ingrese un dni');
	readln(dni);
	writeln('La cantidad de reclamos realizados por el dni ',dni,' es ',buscar(a,dni));
end;

procedure contarEntreDNIs(a:arbol);

	function entreDNI(a:arbol;dni1,dni2:integer):integer;
	begin
		if(a=nil)then	
			entreDNI:=0
		else
			if((dni1<a^.dato.dni)and(a^.dato.dni<dni2))then
				entreDNI:=entreDNI(a^.HI,dni1,dni2)+entreDNI(a^.HD,dni1,dni2)+a^.dato.cant
			else
				if(dni1<=a^.dato.dni)then
					entreDNI:=entreDNI(a^.HD,dni1,dni2)
				else
					if(a^.dato.dni<=dni2)then
						entreDNI:=entreDNI(a^.HD,dni1,dni2);
	end;

var
	dni1,dni2:integer;
begin
	writeln;
	writeln;
	writeln('Ingrese el primer dni');
	readln(dni1);
	writeln('Ingrese el segundo dni');
	readln(dni2);
	writeln('La cantidad de reclamos realizados fueron ',entreDNI(a,dni1,dni2));
end;

procedure mostrarAnio(a:arbol);

	procedure imprimir(a:arbol;anio:integer);
	
		procedure verificar(l:lista;a:integer);
		begin
			if(l<>nil)then
				if(l^.dato.anio=a)then
					writeln(l^.dato.cod);
		end;
	
	begin
		if(a<>nil)then
		begin
			imprimir(a^.HI,anio);
			verificar(a^.dato.l,anio);
			imprimir(a^.HD,anio);
		end;
	end;

var
	anio:integer;
begin
	writeln('Ingrese un anio');
	readln(anio);
	writeln;
	writeln;
	writeln('Codigo de reclamos realizados el anio ',anio);
	imprimir(a,anio);
end;

var
	a:arbol;
begin
	randomize;
	cargarArbol(a);
	if(a=nil)then
		writeln('Arbol sin elementos')
	else
	begin
		writeln;
		writeln;
		contarReclamos(a);
		contarEntreDNIs(a);
		writeln;
		writeln;
		mostrarAnio(a);
	end;
end.
