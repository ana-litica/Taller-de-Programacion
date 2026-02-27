{4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio,
día y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
 }

program ABB2Ej4;
type	rangoD=1..31;
		rangoM=1..12;
		registro=record
			socio:integer;
			dia:rangoD;
			mes:rangoM;
			cant:integer;
		end;
		
		prestamo=record
			isbn:integer;
			r:registro;
		end;
		
		lista=^nodo;
		nodo=record
			dato:registro;
			sig:lista;
		end;
		
		arbol1=^nodo1;
		nodo1=record
			dato:prestamo;
			HI:arbol1;
			HD:arbol1;
		end;
		
		prestamo2=record
			isbn:integer;
			l:lista;
		end;
		
		arbol2=^nodo2;
		nodo2=record
			dato:prestamo2;
			HI:arbol2;
			HD:arbol2;
		end;
		
		registro2=record
			isbn:integer;
			cant:integer;
		end;
		
		lista2=^nodoL;
		nodoL=record
			dato:registro2;
			sig:lista2;
		end;
		
procedure cargarArboles(var a1:arbol1;var a2:arbol2);

	procedure generarPrestamo(var p:prestamo);
	begin
		p.isbn:=random(101);
		if(p.isbn<>0)then
		begin
			p.r.socio:=random(500)+1;
			p.r.dia:=random(31)+1;
			p.r.mes:=random(12)+1;
			p.r.cant:=random(15)+1;
			writeln('ISBN: ',p.isbn,'|Socio: ',p.r.socio,'|Dia: ',p.r.dia,'|Mes: ',p.r.mes,'|Cantidad de dias: ',p.r.cant);
		end;
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

	procedure agregarA1(var a:arbol1;p:prestamo);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
		begin
			if(p.isbn<a^.dato.isbn)then
				agregarA1(a^.HI,p)
			else
				agregarA1(a^.HD,p);
		end;
	end;
	
	procedure agregarA2(var a:arbol2;p:prestamo);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.dato.isbn:=p.isbn;
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,p.r);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
		begin
			if(a^.dato.isbn=p.isbn)then
				agregarAdelante(a^.dato.l,p.r)
			else
			begin
				if(p.isbn<a^.dato.isbn)then
					agregarA2(a^.HI,p)
				else
					agregarA2(a^.HD,p);
			end;
		end;
	end;

var
	p:prestamo;
begin
	a1:=nil;
	a2:=nil;
	generarPrestamo(p);
	while(p.isbn<>0)do
	begin
		agregarA1(a1,p);
		agregarA2(a2,p);
		generarPrestamo(p);
	end;
end;
	
procedure informarMayorISBN(a:arbol1);

	function mayorISBN(a:arbol1):integer;
	begin
		if(a=nil)then
			mayorISBN:=-1	
		else
		begin
			if(a^.HD=nil)then
				mayorISBN:=a^.dato.ISBN
			else
				mayorISBN:=mayorISBN(a^.HD);
		end;
	end;

begin
	writeln;
	writeln;
	if(mayorISBN(a)=-1)then
		writeln('Arbol sin elementos')
	else
	begin
		writeln('El mayor ISBN es ',mayorISBN(a));
	end;
	writeln;
	writeln;
end;
	
procedure informarMenorISBN(a:arbol2);

	function menorISBN(a:arbol2):integer;
	begin
		if(a=nil)then
			menorISBN:=999
		else
		begin
			if(a^.HI=nil)then
				menorISBN:=a^.dato.isbn
			else
				menorISBN:=menorISBN(a^.HI);
		end;
	end;

begin
	if(menorISBN(a)=999)then
		writeln('Arbol vacio')
	else
		writeln('El menor ISBN es ',menorISBN(a));
	writeln;
	writeln;
end;
	
procedure informarPrestamos1(a:arbol1);

	function contarPrestamos1(a:arbol1;s:integer):integer;
	begin
		if(a=nil)then
			contarPrestamos1:=0
		else
		begin
			if(a^.dato.r.socio=s)then
				contarPrestamos1:=1+contarPrestamos1(a^.HD,s)+contarPrestamos1(a^.HD,s)
			else
				contarPrestamos1:=contarPrestamos1(a^.HI,s)+contarPrestamos1(a^.HD,s);
		end;
	end;
	
var
	socio:integer;
begin
	write('Ingrese un numero de socio: ');
	read(socio);
	writeln;
	writeln;
	writeln('La cantidad de prestamos realizados por socio ',socio,' es ',contarPrestamos1(a,socio));
end;
	
procedure informarPrestamos2(a:arbol2);

	function buscar(l:lista;s:integer):boolean;
	var
		aux:boolean;
	begin
		aux:=false;
		while((l<>nil)and(aux=false))do
		begin
			if(l^.dato.socio=s)then
				aux:=true;
			l:=l^.sig;
		end;
		buscar:=aux;
	end;

	function contarPrestamos2(a:arbol2;s:integer):integer;
	begin
		if(a=nil)then
			contarPrestamos2:=0
		else
		begin
			if(buscar(a^.dato.l,s))then
				contarPrestamos2:=1+contarPrestamos2(a^.HI,s)+contarPrestamos2(a^.HD,s)
			else
				contarPrestamos2:=contarPrestamos2(a^.HI,s)+contarPrestamos2(a^.HD,s);
		end;
	end;
	
var
	socio:integer;
begin
	writeln;
	writeln;
	write('Ingrese un numero de socio: ');
	read(socio);
	writeln;
	writeln;
	writeln('La cantidad de prestamos realizados por socio ',socio,' es ',contarPrestamos2(a,socio));
	writeln;
	writeln;
end;

procedure agregarAdelante(var l:lista2;isbn,cant:integer);
var
	aux:lista2;
begin
	new(aux);
	aux^.dato.isbn:=isbn;
	aux^.dato.cant:=cant;
	aux^.sig:=l;
	l:=aux;
end;
		
{procedure contarISBN1(a:arbol1;var l:lista2);

	function buscar(a:arbol1;isbn:integer):integer;
	begin
		if(a=nil)then
			buscar:=0
		else
		begin
			if(isbn=a^.dato.isbn)then
				buscar:=buscar(a^.HI,a^.dato.isbn)+buscar(a^.HD,a^.dato.isbn)+1
			else
			begin
				if(isbn<a^.dato.isbn)then
					buscar:=buscar(a^.HI,isbn)
				else
					buscar:=buscar(a^.HD,isbn)
			end;
		end;
	end;

procedure cargarLista(var l:lista);
var
	total:integer;
begin
	if(a<>nil)then
	begin
		contarISBN1(a^.HI);
		cargarLista1();
		contarISBN1(a^.HD);
	end;
end;		}
		
procedure contarISBN2(a:arbol2;var l:lista2);	

	procedure cargarLista(var l:lista2;p:prestamo2);
	
		function contarElementos(l:lista):integer;
		var
			cont:integer;
		begin
			cont:=0;
			while(l<>nil)do
			begin
				cont:=cont+1;
				l:=l^.sig;
			end;
			contarElementos:=cont;
		end;
	
	{var
		cant:integer;}
	begin
		{cant:=contarElementos(p.l);
		agregarAdelante(l,p.isbn,cant);}
		agregarAdelante(l,p.isbn,contarElementos(p.l));
	end;
	
begin
	if(a<>nil)then
	begin
		contarISBN2(a^.HI,l);
		cargarLista(l,a^.dato);
		contarISBN2(a^.HD,l);
	end;
end;	

procedure informarTotalLista(l:lista2);
begin
	if(l<>nil)then
	begin
		informarTotalLista(l^.sig);
		writeln('ISBN: ',l^.dato.isbn,'|Cantidad de prestamos: ',l^.dato.cant);	
	end;
end;

procedure totalEntreValores1(a:arbol1);

	function contarEntreValores1(a:arbol1;minimo,maximo:integer):integer;
	begin
		if(a=nil)then
			contarEntreValores1:=0
		else
		begin
			if((a^.dato.isbn>=minimo)and(a^.dato.isbn<=maximo))then
				contarEntreValores1:=1+contarEntreValores1(a^.HI,minimo,maximo)+contarEntreValores1(a^.HD,minimo,maximo)
			else
			begin
				if(a^.dato.isbn>minimo)then
					contarEntreValores1:=contarEntreValores1(a^.HI,minimo,maximo)
				else
					contarEntreValores1:=contarEntreValores1(a^.HD,minimo,maximo);
			end;
		end;
	end;

var
	minimo,maximo:integer;
begin
	writeln;
	writeln;
	writeln('En el arbol 1');
	writeln;
	writeln('Ingrese el minimo del rango: ');
	read(minimo);
	writeln('Ingrese el maximo del rango: ');
	read(maximo);
	writeln;
	writeln;
	writeln('La cantidad total de prestamos realizados entre el ISBN ',minimo,' y ',maximo,' es ',contarEntreValores1(a,minimo,maximo));
end;

procedure totalEntreValores2(a:arbol2);

	function contarEntreValores2(a:arbol2;minimo,maximo:integer):integer;
	begin
	end;

var
	minimo,maximo:integer;
begin
	writeln;
	writeln;
	writeln('En el arbol 2');
	writeln;
	writeln('Ingrese el minimo del rango: ');
	read(minimo);
	writeln('Ingrese el maximo del rango: ');
	read(maximo);
	writeln;
	writeln;
	writeln('La cantidad total de prestamos realizados entre el ISBN ',minimo,' y ',maximo,' es ',contarEntreValores2(a,minimo,maximo));
end;
		
var
	a1:arbol1;
	a2:arbol2;
	l,l2:lista2;
begin
	l2:=nil;
	randomize;
	cargarArboles(a1,a2);
	informarMayorISBN(a1);
	informarMenorISBN(a2);
	informarPrestamos1(a1);
	informarPrestamos2(a2);
	//contarISBN1(a1,l);//hacer
	contarISBN2(a2,l2);
	informarTotalLista(l2);
	totalEntreValores1(a1);
	totalEntreValores2(a2);
end.
