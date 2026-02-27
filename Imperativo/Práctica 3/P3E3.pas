{Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program P3E3;
type	examen=record
			materia:integer;
			fecha:string;
			nota:integer;
		end;
		
		registro=record
			legajo:integer;
			e:examen;
		end;
		
		lista=^nodoL;
		nodoL=record
			dato:examen;
			sig:lista;
		end;
		
		alumno=record
			legajo:integer;
			finales:lista;
		end;
		
		arbol=^nodo;
		nodo=record
			dato:alumno;
			HI:arbol;
			HD:arbol;
		end;

procedure cargarArbol(var a:arbol);

	procedure leerExamen(var r:registro);
	var
		fechas:array[1..4] of string=('25/7','1/11','4/11','12/10');
	begin
		r.legajo:=random(51);
		if(r.legajo<>0)then
		begin
			r.e.nota:=random(10)+1;
			r.e.fecha:=fechas[random(4)+1];
		end;
		writeln('Legajo: ',r.legajo,'. Nota: ',r.e.nota,'. Fecha: ',r.e.fecha);
		writeln;
	end;
	
	procedure agregarAdelante(var l:lista;e:examen);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=e;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure agregar(var a:arbol;r:registro);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.legajo:=r.legajo;
			a^.dato.finales:=nil;
			agregarAdelante(a^.dato.finales,r.e);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(r.legajo=a^.dato.legajo)then
				agregarAdelante(a^.dato.finales,r.e)
			else
				if(r.legajo<a^.dato.legajo)then
					agregar(a^.HI,r)
				else
					agregar(a^.HD,r);
	end;

var
	r:registro;
begin
	a:=nil;
	leerExamen(r);
	while(r.legajo<>0)do
	begin
		agregar(a,r);
		leerExamen(r);
	end;
end;

procedure imprimir(a:arbol);
begin
	if(a<>nil)then
	begin
		imprimir(a^.HI);
		write(a^.dato.legajo,' | ');
		imprimir(a^.HD);
	end;
end;

procedure legajoImpar(a:Arbol);

	function contarLegajosImpares(a:arbol):integer;
	var
		resto:integer;
	begin
		if(a=nil)then
			contarLegajosImpares:=0
		else
		begin
			resto:=a^.dato.legajo mod 2;
			contarLegajosImpares:=contarLegajosImpares(a^.HI)+contarLegajosImpares(a^.HD)+resto;
		end;
	end;

begin
	writeln;
	writeln('La cantidad de alumnos con legajo impar es ',contarLegajosImpares(a));
	writeln;
end;

procedure informarAprobados(a:arbol);

	function contarAprobados(l:lista):integer;
	begin
		if(l=nil)then
			contarAprobados:=0
		else
			if(l^.dato.nota>=4)then
				contarAprobados:=contarAprobados(l^.sig)+1
			else
				contarAprobados:=contarAprobados(l^.sig);
	end;

begin
	if(a<>nil)then
	begin
		informarAprobados(a^.hi);
		writeln('La cantidad de finales aprobados del alumno de legajo ',a^.dato.legajo,' es ',contarAprobados(a^.dato.finales));
		informarAprobados(a^.hd);		
	end;
end;

procedure informarPromedios(a:arbol);

	procedure informarPromediosSuperiores(a:arbol;v:real);
			
		procedure sumar(l:lista;var suma,notas:integer);
		begin
			if(l=nil)then
			begin
				suma:=0;
				notas:=0;
			end
			else
			begin
				sumar(l^.sig,suma,notas);
				suma:=suma+1;
				notas:=notas+l^.dato.nota;			
			end;
		end;
		
	
		procedure verificar(a:alumno;v:real);
		var
			suma,notas:integer;
			promedio:real;
		begin
			sumar(a.finales,suma,notas);
			promedio:=notas/suma;
			if(promedio>v)then
				writeln('El alumno de legajo ',a.legajo,' tiene un promedio superior a ',v:0:2,' (',promedio:0:2,').');
		end;
	
	begin
		if(a<>nil)then
		begin
			
			informarPromediosSuperiores(a^.HI,v);
			informarPromediosSuperiores(a^.HD,v);
			verificar(a^.dato,v);
		end;
	end;

var
	valor:real;
begin	
	writeln;
	writeln('Ingrese un valor');
	readln(valor);
	writeln;
	informarPromediosSuperiores(a,valor);
end;

var
	a:arbol;
begin
	randomize;
	cargarArbol(a);//a
	//imprimir(a);
	legajoImpar(a);//b
	informarAprobados(a);
	informarPromedios(a);
end.
