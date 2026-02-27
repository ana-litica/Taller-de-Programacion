/*
1- a) Cargue la clase Auto.java (dada por la cátedra) en su proyecto.
Un objeto auto se crea sin valores iniciales y responde a los siguientes mensajes:
getPatente() retorna la patente (int) del auto
getDueño() retorna el nombre del dueño (String) del auto
setPatente(X) modifica el número de patente al “int” pasado por parámetro (X)
setDueño(X) modifica el nombre del dueño al “String” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Patente 111222 Dueño Carla

Perez”

b) Simular la entrada de autos al estacionamiento municipal en el centro de la ciudad. El
estacionamiento está dividido en N pisos y cada piso tiene N plazas, y debemos
almacenar en una estructura de datos adecuada los autos estacionados.
Realice un programa que lea la información de 5 autos que desean estacionar. Por cada
auto, también lea número de piso y número de plaza e ingréselo en la estructura en el
lugar adecuado.
Nota: N se ingresa por teclado. Al principio el estacionamiento debe estar vacío (sin
autos).
c) A partir de la estructura de autos:
i. Informar para cada número de piso y número de plaza ocupado, la
representación del auto que la ocupa.
ii. Informar cuál es el piso más ocupado.
iii. Informar el total de autos estacionados en la plaza 1 (tenga en cuenta
todos los pisos).
iv. Informar el total de autos que ocupan lugares con igual número de piso y
número de plaza.
 */
package Practica2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Adicional {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Cantidad de pisos y plazas:");
        int N=Lector.leerInt();
        
        
        Auto[][]a=new Auto[N][N];
        int i,j;
        
        for (i = 0; i < N; i++) {
            for(j=0;j<N;j++)
                a[i][j]=null;
        }
        
        for(i=0;i<5;i++){
            int piso=GeneradorAleatorio.generarInt(N);
            int plaza=GeneradorAleatorio.generarInt(N);
            
            a[piso][plaza]=new Auto();
            a[piso][plaza].setDueño(GeneradorAleatorio.generarString(GeneradorAleatorio.generarInt(10)+1));
            a[piso][plaza].setPatente(GeneradorAleatorio.generarInt(1000)+1);
            
        }
        
        int max=-1,maxP=0,p1=0,igual=0;
        for (i=0;i<N;i++){
            int cant=0;
            for(j=0;j<N;j++){
                if(a[i][j]!=null){
                    System.out.println(a[i][j].toString());
                    System.out.println("Piso: "+(i+1)+". Plaza: "+(j+1));
                    cant++;
                    if(i==j)
                        igual++;
                }
            }
            if(max<cant){
                max=cant;
                maxP=i;
            }
            if(a[i][1]!=null)
                p1++;
        }
        
        if(max!=-1)
            System.out.println("El piso más ocupado es "+(maxP+1));
        else
            System.out.println("Estacionamiento vacio");
        System.out.println("La cantidad de autos en la plaza 1 es "+p1);
        System.out.println("Los autos en lugares con mismos numeros de piso y plaza son "+igual);
    }
}
