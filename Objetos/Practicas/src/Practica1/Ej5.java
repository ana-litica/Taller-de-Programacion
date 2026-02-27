/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package Practica1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej5 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int c=5,a=4,i,j;
        int [][]calif=new int [c][a];
        double []suma=new double [a];
       
        for ( i = 0; i < a; i++) {
            suma[i]=0;
            
        }
        
        for(i=0; i<c;i++){
            for(j=0;j<a;j++){
                //System.out.println("Ingrese las calificaciones de las categoria "+(i+1));
                //calif[i][j]=Lector.leerInt();
                calif[i][j]=GeneradorAleatorio.generarInt(10)+1;
                suma[j]+=calif[i][j];
            }
        }
        
        for(i=0;i<c;i++){
            System.out.println("                ");
            for(j=0;j<a;j++)
                System.out.print(calif[i][j]+" | ");
        }
        
        System.out.println("\n");
        
        for (i=0;i<a;i++){
            suma[i]=suma[i]/c;
            System.out.println("La calificacion promedio de la categoria "+(i+1)+" es "+suma[i]);
        }
        
    }
}
