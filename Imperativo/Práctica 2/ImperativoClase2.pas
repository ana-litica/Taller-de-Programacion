{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random” mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.
e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del vector.
f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en el vector, sus dígitos en el orden en que aparecen en el número. 
   Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. 
   Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 30;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);//Al cargar, el módulo recursivo es interno

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);//generar valor
    if ((valor <> 20 ) and (dimL < dimF)) //si es distinto de 20 y hay lugar
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;//agrego atras
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
{     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
}
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
{     writeln;
     for i:= 1 to dimL do
         write ('----');
}
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
     if (dimL > 0) then begin
        ImprimirVectorRecursivo (v, dimL-1);//Imprimir la primera parte del vector
        write(v[dimL], ' | ');
     end;
     
end; 
    
function Sumar (v: vector; dimL: integer): integer;  
begin
 if (dimL = 0) then Sumar:= 0
 else
     if (( v[dimL] mod 2 ) = 0) then 
         Sumar:= v[dimL] + Sumar (v, dimL-1)//Ultimo elemento + suma de pares del resto del vector
     else
         Sumar:= Sumar (v, dimL-1);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer;
var aux: integer;
begin
	if(dimL=0)then ObtenerMaximo:= -1//Ultimo caso
	else begin 
	    aux:=ObtenerMaximo(v, dimL-1);//Busca el maximo entre el resto de los elementos del vector
		if(v[dimL]>aux)then//compara
			ObtenerMaximo:=v[dimL]
		else
		    ObtenerMaximo:=aux;	    
	end;
end;
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
  if (dimL = 0) then BuscarValor:= false
  else
        if (v[dimL] = valor) then 
            BuscarValor:= true
        else
            BuscarValor:= BuscarValor(v, dimL -1 , valor);
end; 

procedure ImprimirDigitos (v: vector; dimL: integer);

	procedure imprimir(n:integer);
	begin 
		if(n<>0)then
		begin
			imprimir(n div 10);//Como se divide desde el final del numero, llama recursivamente hasta el div del primer digito del nro
			write(n mod 10, ' | ');//Imprime el primer digito, vuelve para imprimir el sig y así sucesivamente
		end;
	end; 
	
begin
	if(dimL<>0)then
	begin
		ImprimirDigitos(v,dimL-1);//Llega al principio del vector
		imprimir(v[dimL]);//Empezando desde el dimL=1, imprime el vector 
		writeln;
	end;
end;

var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  Randomize;
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       writeln ('--- Imprimir Vector Iterativo ---');
                       ImprimirVector (v, dimL);
                       
                       writeln ('--- Imprimir Vector Recursivo ---');                       
                       ImprimirVectorRecursivo (v, dimL);
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores PARES del vector es ', suma); 
 writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;

  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.
