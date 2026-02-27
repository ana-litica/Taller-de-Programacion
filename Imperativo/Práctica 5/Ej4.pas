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

program TP5Ej4;
type	registro=record
			cod:integer;
			anio:integer;
			tipo:string;
		end;
		
		reclamo=record
			dni:integer;
			r:registro;
		end;
		
		lista=^nodoL;
		nodoL=record
			dato:registro;
			sig:lista;
		end;
		
		reclamo2=record
			dni:integer;
			cant:integer;
			l:lista;
		end;
		
		arbol=^nodoA;
		nodoA=record
			dato:reclamo2;
			HI:arbol;
			HD:arbol;
		end;
	
procedure cargarArbol(var a:arbol);

	procedure generarReclamo(var r:reclamo);
	var
		vT:array[1..5]of string=('Tipo1','Tipo2','Tipo3','Tipo4','Tipo5');
	begin
		r.r.cod:=random(51);
		if(r.r.cod<>0)then
		begin
			r.r.anio:=2010+random(15);
			r.r.tipo:=vT[random(5)+1];
			r.dni:=random(5000)+1;
		end;
		writeln('Codigo: ',r.r.cod,'. Anio: ',r.r.anio,'. Tipo: ',r.r.tipo,'. DNI: ',r.dni);
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
	
	procedure insertar(var a:Arbol;r:reclamo);
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
		begin
			if(r.dni=a^.dato.dni)then
			begin
				a^.dato.cant:=a^.dato.cant+1;
				agregarAdelante(a^.dato.l,r.r);
			end
			else
			begin
				if(r.dni<a^.dato.dni)then
					insertar(a^.HI,r)
				else
					insertar(a^.HD,r);
			end;
		end;
	end;

var
	r:reclamo;
begin
	a:=nil;
	generarReclamo(r);
	while(r.r.cod<>0)do
	begin
		insertar(a,r);
		generarReclamo(r);
	end;
end;		
		
function contarReclamos(a:arbol;dni:integer):integer;
begin
	if(a=nil)then
		contarReclamos:=0
	else
	begin
		if(dni=a^.dato.dni)then
			contarReclamos:=a^.dato.cant
		else
		begin
			if(dni<a^.dato.dni)then
				contarReclamos:=contarReclamos(a^.HI,dni)
			else
				contarReclamos:=contarReclamos(a^.HD,dni)
		end;
	end;
end;		

function contarEntreDni(a:arbol;minimo,maximo:integer):integer;
begin
	if(a=nil)then
		contarEntreDni:=0
	else
	begin
		if((a^.dato.dni>=minimo)and(a^.dato.dni<=maximo))then
			contarEntreDni:=a^.dato.cant+contarEntreDni(a^.HI,minimo,maximo)+contarEntreDni(a^.HD,minimo,maximo)
		else
		begin
			if(minimo>a^.dato.dni)then
				contarEntreDni:=contarEntreDni(a^.HD,minimo,maximo)
			else
				contarEntreDni:=contarEntreDni(a^.HI,minimo,maximo);
		end;
	end;
end;

function contarAnio(a:arbol;anio:integer):integer;

	function contarLista(l:lista;anio:integer):integer;
	var
		suma:integer;
	begin
		suma:=0;
		while(l<>nil)do
		begin	
			if(anio=l^.dato.anio)then
				suma:=suma+1;
			l:=l^.sig;
		end;
		contarLista:=suma;
	end;

begin
	if(a=nil)then
		contarAnio:=0
	else
		contarAnio:=contarLista(a^.dato.l,anio)+contarAnio(a^.HI,anio)+contarAnio(a^.HD,anio);
end;
		
var
	a:arbol;
	dni,minimo,maximo,anio:integer;
begin
	randomize;
	cargarArbol(a);//A
	writeln;
	writeln;
	writeln('Ingrese un DNI');
	readln(dni);
	writeln;
	writeln;
	writeln('El DNI numero ',dni,' tiene ',contarReclamos(a,dni),' reclamo/s realizados.');//B
	writeln;
	writeln;
	writeln('Ingrese el DNI minimo');
	readln(minimo);
	writeln('Ingrese el DNI maximo');
	readln(maximo);
	writeln;
	writeln;
	writeln('La cantidad de reclamos de los DNI comprendidos entre ',minimo,' y ',maximo,' es ',contarEntreDNI(a,minimo,maximo));
	writeln;
	writeln;
	writeln('Ingrese un anio (entre 2010 y 2024):');
	readln(anio);
	writeln;
	writeln;
	writeln('La cantidad de reclamos realizados en el anio ',anio,' es ',contarAnio(a,anio));
end.
