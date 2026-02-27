{Descargar el programa ImperativoEjercicioClase3.pas que contiene parte del código del
siguiente enunciado a resolver. Implementar lo indicado en el código.
Escribir un programa que:
a. Implemente un módulo que almacene información de socios de un club en un árbol binario
de búsqueda. De cada socio se debe almacenar número de socio, nombre y edad. La carga
finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio. La
información de cada socio debe generarse aleatoriamente.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informar los datos de los socios en orden creciente.
ii. Informar los datos de los socios en orden decreciente.
iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
que se les aumentó la edad.
vi. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
retorne el promedio de las edades de los socios.}

program P3E1;
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

	procedure leerSocio(var s:socio);
	var
		nombre:array[1..5]of string=('Ana','Julian','Graciela','Pabla','Sixta');
	begin
		s.nro:=random(21);
		if(s.nro<>0)then
		begin
			s.nombre:=nombre[random(5)+1];
			s.edad:=random(83)+18;
		end;
	end;
	
	procedure agregar(var a:arbol;s:socio);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato:=S;
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
	writeln('Numero de socio: ', s.nro);
	writeln('Nombre del socio: ', s.nombre);
	writeln('Edad del socio: ', s.edad);
	writeln;
end;
		
procedure informarCreciente(a:arbol);
begin
	if(a<>nil)then
	begin
		informarCreciente(a^.HI);
		imprimirSocio(a^.dato);
		informarCreciente(a^.HD);
	end;
end;		

procedure informarDecreciente(a:arbol);
begin
	if(a<>nil)then
	begin
		informarDecreciente(a^.HD);
		imprimirSocio(a^.dato);
		informarDecreciente(a^.HI);
	end;
end;
		
procedure socioMayor(a:arbol);

	procedure hallarMaximo(a:arbol;var max,maxNro:integer);
	
		procedure actualizarMaximo(nro,edad:integer; var max,maxCod:integer);
		begin
			if(max<edad)then
			begin
				max:=Edad;
				maxCod:=nro;
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
	max,maxCod:integer;
begin
	max:=-1;
	hallarMaximo(a,max,maxCod);
	if(max=-1)then
		writeln('Arbol vacio')
	else
		writeln('El numero del socio con mas edad es ',maxCod);
end;		

procedure aumentarEdad(var a:arbol);

	function edadImpar(a:Arbol):integer;
	var
		resto:integer;
	begin
		if(a=nil)then	
			edadImpar:=0
		else
		begin
			resto:=a^.dato.edad mod 2;
			if(resto=1)then
				a^.dato.edad:=a^.dato.edad+1;
			edadImpar:=edadImpar(a^.HI)+edadImpar(a^.HD)+resto;
		end;
	end;

begin
	writeln;
	writeln('La cantidad de socios con edad impar es ', edadImpar(a));
	writeln;
end;
		
procedure buscarNombre(a:Arbol);

	function buscar(a:arbol;nombre:string):boolean;
	begin
		if(a=nil)then
			buscar:=false
		else
		begin
			if(a^.dato.nombre=nombre)then
				buscar:=true
			else
				buscar:=buscar(a^.HI,nombre)or buscar(a^.HD,nombre);
		end;
	end;

var
	nombre:string;
begin
	writeln('Ingrese un nombre');
	readln(nombre);
	writeln;
	if(buscar(a,nombre))then
		writeln('El socio de nombre ', nombre,' existe.')
	else
		writeln('El socio de nombre ', nombre,' no existe.')
end;
		
function contarTotal(a:arbol):integer;
begin
	if(a=nil)then
		contarTotal:=0
	else	
		contarTotal:=contarTotal(a^.HI)+contarTotal(a^.HD)+1;
end;
		
		
procedure totalSocios(a:Arbol);
begin
	writeln('La cantidad de socios es ',contarTotal(a));
	writeln;
end;		

procedure promediarEdades(a:arbol);

	function sumar(a:Arbol):integer;
	begin
		if(a=nil)then
			sumar:=0
		else
			sumar:=sumar(a^.HI)+sumar(a^.HD)+a^.dato.edad;
	end;

	function promedio(a:arbol):real;
	begin
		if(a=nil)then
			promedio:=0
		else
			promedio:=sumar(a)/contarTotal(a);
	end;

begin
	writeln;
	writeln('La edad promedio de los socios es ',promedio(a):0:2);
	writeln;
end;
		
var
	a:arbol;
begin
	randomize;
	cargarArbol(a);//a
	writeln('Orden creciente');
	informarCreciente(a);//b i
	writeln;
	writeln('-----------------------------------');
	writeln('Orden decreciente');
	informarDecreciente(a);//ii
	writeln;
	socioMayor(a);//iii
	writeln;
	aumentarEdad(a);//iv
	writeln;
	buscarNombre(a);//vi
	writeln;
	totalSocios(a);//vii
	writeln;
	promediarEdades(a);//viii
end.
