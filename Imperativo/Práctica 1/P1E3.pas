{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}

program P1E3;
type	categorias=0..8;
		registro=record
			cod:integer;
			puntaje:real;
		end;
		
		pelicula=record
			r:registro;
			genero:categorias;
		end;
		
		lista=^nodo;
		nodo=record
			dato:registro;
			sig:lista;
		end;
		
		vector=array[categorias]of lista;
		
		vector2=array[categorias]of registro;

procedure cargarVector(var v:Vector);

	procedure inicializar (var v:Vector);
	var
		i:categorias;
	begin
		for i:=1 to 8 do
			v[i]:=nil;
	end;
	
	procedure agregarAtras(var l:lista; r:registro);
	var
		aux,ult:lista;
	begin
		new(aux);
		aux^.dato:=r;
		aux^.sig:=nil;
		if(l=nil)then
			l:=aux
		else
			aux^.sig:=ult;
		ult:=aux;
	end;
	
	procedure leerPelicula(var p:pelicula);
	begin
		writeln('Ingrese el codigo de pelicula: ');
		readln(p.r.cod);
		if(p.r.cod<>-1)then
		begin
			writeln('Ingrese el genero de la pelicula');
			readln(p.genero);
			writeln('Ingrese el puntaje ');
			readln(p.r.puntaje);
		end;
	end;

var
	p:pelicula;
begin
	inicializar(v);
	leerPelicula(p);
	while(p.r.cod<>-1)do
	begin
		agregarAtras(v[p.genero],p.r);
		leerPelicula(p);
	end;
end;

procedure masPuntaje(v:vector;var v2:vector2);

	function hallarMaximo(l:lista):registro;
	var
		max:registro;
	begin
		max.puntaje:=-1;
		while(l<>nil)do
		begin
			if(max.puntaje<l^.dato.puntaje)then
			begin
				max.puntaje:=l^.dato.puntaje;
				max.cod:=l^.dato.cod;
			end;
			l:=l^.sig;
		end;
		hallarMaximo:=max;
	end;

var
	i:categorias;
begin
	for i:=1 to 8 do
	begin
		v2[i]:=hallarMaximo(v[i]);
		//write(v2[i],' | ');
	end;
end;

procedure ordenar(var v:Vector2);
var
	i,j:categorias;
	act:registro;
begin
	for i:=2 to 8 do
	begin
		act:=v[i];
		j:=i-1;
		while((j>0)and(v[j].puntaje>act.puntaje))do
		begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=act;
	end;
end;


procedure mostrarCodigos(v:vector2);
begin
	writeln('Pelicula con menor puntaje: ',v[1].cod);
	writeln('Pelicula con mayor puntaje: ',v[8].cod);
end;
	
var
	v:vector;
	v2:vector2;
begin	
	cargarVector(v);
	masPuntaje(v,v2);
	ordenar(v2);
	mostrarCodigos(v2);
end.
