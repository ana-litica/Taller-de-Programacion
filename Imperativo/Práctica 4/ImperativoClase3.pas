{Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:
i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.}

program ImperativoClase3;
type	socio=record	
			nro:integer;
			nombre:string;
			edad:integer;
		end;
		
		arbol=^nodo;
		nodo=record
			dato:socio;
			HI:arbol;
			HD:arbol;
		end;

procedure cargarArbol(var a:arbol);

	procedure leerSocio(var S:socio);
	var
		nombres:array[1..5]of string=('Ana','Graciela','Sixta','Marcos','Pabla');
	begin
		s.nro:=random(51);
		if(s.nro<>0)then
		begin
			s.nombre:=nombres[random(5)+1];
			s.edad:=random(89)+1;
		end;
	end;
	
	procedure agregar(var a:arbol;s:socio);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato:=s;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(s.nro<a^.dato.nro)then
				agregar(a^.HI,s)
			else
				agregar(a^.HD,s);
	end;

var
	s:socio;
begin
	a:=nil;
	leerSocio(s);
	while(s.nro<>0)do
	begin
		agregar(a,s);
		leerSocio(s);
	end;
end;

procedure imprimirSocio(s:socio);
begin
	writeln('Numero de socio: ',s.nro,'. Nombre: ',s.nombre,'. Edad: ',s.edad);
end;

procedure imprimirOrdenCreciente(a:arbol);
begin
	if(a<>nil)then
	begin
		imprimirOrdenCreciente(a^.HI);
		imprimirSocio(a^.dato);
		imprimirOrdenCreciente(a^.HD);
	end;
end;

procedure imprimirDecreciente(a:arbol);
begin
	if(a<>nil)then
	begin
		imprimirDecreciente(a^.HD);
		imprimirSocio(a^.dato);
		imprimirDecreciente(a^.HI);
	end;
end;

procedure informarSocioDeMayorEdad(a:arbol);

	procedure hallarMaximo(a:Arbol;var max:integer;var maxNro:integer);
	
		procedure actualizarMaximo(nro,edad:integer;var max,maxNro:integer);
		begin
			if(max<edad)then
			begin
				max:=edad;
				maxNro:=nro;
			end;
		end;
	
	begin
		if(a<>nil)then
		begin
			actualizarMaximo(a^.dato.nro,a^.dato.edad,max,maxNro);
			hallarMaximo(a^.HI,max,maxNro);
			hallarMaximo(a^.HD,max,maxNro);
		end;
	end;
var
	max,maxNro:integer;
begin
	writeln;
	max:=-1;
	hallarMaximo(a,max,maxNro);
	if(max=-1)then
		writeln('Arbol vacio')
	else
		writeln('El socio de mayor edad es el socio de numero ',maxNro);
	writeln;
end;

procedure sociosEdadImpar(a:arbol);
	
	function edadImpar(a:arbol):integer;
	var
		aux:integer;
	begin
		if(a=nil)then
			edadImpar:=0
		else
		begin
			aux:=a^.dato.edad mod 2;
			if(aux=1)then	
				a^.dato.edad:=a^.dato.edad+1;
			edadImpar:=edadImpar(a^.HI)+edadImpar(a^.HD)+aux;
		end;
	end;
	
begin
	writeln;
	writeln('La cantidad de socios con edad impar es ', edadImpar(a));
	writeln;
end;

procedure buscarSocio(a:arbol);

	function buscar(a:arbol;nombre:string):boolean;
	begin
		if(a=nil)then
			buscar:=false
		else
			if(a^.dato.nombre=nombre)then
				buscar:=true
			else
				buscar:=buscar(a^.HI,nombre)or buscar(a^.HD,nombre);
	end;

var
	nombre:string;
begin
	writeln;
	writeln('Ingrese un nombre');
	readln(nombre);
	writeln;
	if(buscar(a,nombre))then
		writeln('El socio ',nombre,' existe.')
	else
		writeln('El socio ',nombre,' no existe.');
end;

procedure informarCantidadSocios(a:arbol;var tot:integer);

	function total(a:arbol):integer;
	begin
		if(a=nil)then
			total:=0
		else
			total:=total(a^.HI)+total(a^.HD)+1;
	end;

begin
	writeln;
	tot:=total(a);
	writeln('La cantidad total de socios es ',tot);
	writeln;
end;

procedure informarEdadPromedio(a:arbol;total:integer);

	function edadPromedio(a:arbol;total:integer):real;
	
		function sumarEdades(a:arbol):integer;
		begin
			if(a=nil)then
				sumarEdades:=0
			else
				sumarEdades:=sumarEdades(a^.HI)+sumarEdades(a^.HD)+a^.dato.edad;
		end;
	
	begin
		edadPromedio:=sumarEdades(a)/total;
	end;

begin
	writeln;
	writeln('La edad promedio de los socios es ',edadPromedio(a,total):0:2);
	writeln;
end;

procedure numeroSocioMasGrande(a:arbol);

	function mayorNro(a:arbol):integer;
	begin
		if(a=nil)then
			mayorNro:=0
		else
			if(a^.HD=nil)then
				mayorNro:=a^.dato.nro
			else
				mayorNro:=mayorNro(a^.HD);
	end;	

var
	mayor:integer;
begin
	writeln;
	mayor:=mayorNro(a);
	if(mayor=0)then
		writeln('Arbol vacio')
	else
		writeln('El numero de socio mas grande es ',mayor);
	writeln;
end;

procedure informarSocioConMenorCodigo(a:Arbol);

	function menorCodigo(a:arbol):arbol;
	begin
		if(a=nil)then
			menorCodigo:=nil
		else
			if(a^.HI=nil)then
				menorCodigo:=a
			else
				menorCodigo:=menorCodigo(a^.HI);
	end;

var
	min:arbol;
begin
	writeln;
	min:=menorCodigo(a);
	if(min=nil)then
		writeln('Arbol vacio')
	else
	begin
		writeln('Socio con menor codigo:');
		imprimirSocio(min^.dato);
	end;
end;

procedure buscarNrodeSocio(a:arbol);

	function buscarNro(a:arbol;nro:integer):boolean;
	begin
		if(a=nil)then
			buscarNro:=false
		else
			if(a^.dato.nro=nro)then
				buscarNro:=true
			else
				buscarNro:=buscarNro(a^.HI,nro)or buscarNro(a^.HD,nro);
	end;

var
	nro:integer;
begin
	writeln;
	writeln('Ingrese un valor');
	readln(nro);
	writeln;
	if(buscarNro(a,nro))then
		writeln('El socio con numero ',nro,' existe.')
	else
		writeln('El socio con numero ',nro,' no existe.');
end;

procedure informarEntreValores(a:arbol);

	function contarEntreCodigos(a:arbol;inf,sup:integer):integer;
	begin
		if(a=nil)then
			contarEntreCodigos:=0
		else
			if((a^.dato.nro>inf)and(a^.dato.nro<sup))then
				contarEntreCodigos:=contarEntreCodigos(a^.HI,inf,sup)+contarEntreCodigos(a^.HD,inf,sup)+1
			else
				if(a^.dato.nro<=inf)then
					contarEntreCodigos(a^.HD,inf,sup)
				else
					contarEntreCodigos(a^.HI,inf,sup);
	end;

var
	inf,sup:integer;
begin
	writeln;
	writeln('Ingrese el limite inferior');
	readln(inf);
	writeln('Ingrese el limite superior');
	readln(sup);
	writeln;
	writeln('La cantidad de socios con numero comprendido entre ',inf,' y ',sup,' es ', contarEntreCodigos(a,inf,sup));
end;

var
	a:arbol;
	total:integer;
begin
	randomize;
	cargarArbol(a);
	writeln('Orden creciente');
	imprimirOrdenCreciente(a);
	writeln;
	writeln('Orden decreciente');
	imprimirDecreciente(a);
	writeln;
	informarSocioDeMayorEdad(a);
	writeln;
	sociosEdadImpar(a);
	buscarSocio(a);
	writeln;
	informarCantidadSocios(a,total);
	writeln;
	informarEdadPromedio(a,total);
	writeln;
	numeroSocioMasGrande(a);
	writeln;
	informarSocioConMenorCodigo(a);
	writeln;
	buscarNrodeSocio(a);
	writeln;
	informarEntreValores(a);
end.

