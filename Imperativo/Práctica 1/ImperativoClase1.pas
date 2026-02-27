{Se desea procesar la información de las ventas de productos de un comercio (como máximo 50). 
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. 
   De cada venta se conoce el día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades). 
   El código y el dia deben generarse automáticamente (random) y la cantidad se debe leer. 
   El ingreso de las ventas finaliza con el día de venta 0  (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}
program Clase1MI;
const dimF = 10;
type dias   = 0..31;
     rango1 = 1..15;
     rango2 = 1..99;
     rango3 = 0..dimF;
     venta = record                     
                dia: dias;
				codigoP: rango1;
				cantidad: rango2;
			 end;
	 vector = array [1..dimF] of venta;

	 elemento = record                  {Inciso g. ¿Estructura?}
	              codigoP: rango1;
	              cantTotal: integer;
	            end;

procedure AlmacenarInformacion (var v: vector; var dimL: rango3); 
  procedure LeerVenta (var v: venta);
  begin
    Randomize;
    write ('Dia: ');
    v.dia:= random(32); //0..31
    writeln (v.dia);
    if (v.dia <> 0)
    then begin
           write ('Codigo de producto: ');
           v.codigoP:= random(15) + 1; //1..15
           writeln (v.codigoP);
           write ('Ingrese cantidad (entre 1 y 99): ');
           readln (v.cantidad);
         end;
  end;
var unaVenta: venta;
begin
    dimL := 0;
    LeerVenta (unaVenta);
    while (unaVenta.dia <> 0)  and ( dimL < dimF ) do 
    begin
       dimL := dimL + 1;
       v[dimL]:= unaVenta;
       LeerVenta (unaVenta);
    end;
end;

procedure ImprimirVector (v: vector; dimL: rango3);
var
   i: integer;
begin
     writeln(' codigo  |  cantidad ');
     for i:= 1 to dimL do begin       
        writeln(v[i].codigoP:2,' | ' , v[i].cantidad);
     end;
     writeln;
     writeln;
End;

procedure Ordenar (var v: vector; dimL: rango3);
var i, j, pos: rango3; item: venta;			
begin
 for i:= 1 to dimL - 1 do 
 begin 
   {busca el mínimo y guarda en pos la posición}
   pos := i;
   for j := i+1 to dimL do 
        if (v[j].codigoP < v[pos].codigoP) then pos:=j;
   {intercambia v[i] y v[pos]}
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;

procedure Eliminar (var v: vector; var dimL: rango3; valorInferior, valorSuperior: rango1);
var
  ini,fin,i: integer;
  aBorrar: integer;
begin

  {Buscar en el vector la posicion donde debo empezar a borrar: ini} 
  ini:=1;
  while (ini <= dimL) and (v[ini].codigoP < valorInferior) do ini:=ini+1;

  {Buscar en el vector la posicion donde debo terminar de borrar: fin}
  {Comenzar a partir de ini porque el vector esta ordenado} 
  fin:= ini;
  while (fin <= dimL) and (v[fin].codigoP<=valorSuperior) do fin:=fin+1;
  
  {Cantidad de elementos a borrar: aBorrar}
  aBorrar:= fin - ini;  
  if (aBorrar>0)then begin
         {Eliminar todos las ventas entre las posiciones ini y fin-1 } 
		  for i:= fin to dimL do begin
			  v[ini]:=v[i];
			  ini:= ini+1;
		  end;
		  {Actualizar dimL}
		  dimL:= dimL - aBorrar;
  end;
end;

var v: vector;
    dimL: rango3;
    valorInferior, valorSuperior: rango1;
Begin
  AlmacenarInformacion (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       writeln ('--- Vector ingresado --->');
                       writeln;
                       ImprimirVector (v, dimL);
                       writeln;
                       writeln ('--- Vector ordenado --->');
                       writeln;
                       Ordenar (v, dimL);
                       ImprimirVector (v, dimL);
                       write ('Ingrese valor inferior: ');
                       readln (valorInferior);
                       write ('Ingrese valor superior: ');
                       readln (valorSuperior);
                       Eliminar (v, dimL, valorInferior, valorSuperior);
                       if (dimL = 0) then writeln ('--- Vector sin elementos, luego de la eliminación ---')
                                     else begin
                                            writeln;
                                            writeln ('--- Vector luego de la eliminacion --->');
                                            writeln;                                     
                                            ImprimirVector (v, dimL);
                                           {  ...Completar ... }
                                     end;
                      end;
                       
end.
