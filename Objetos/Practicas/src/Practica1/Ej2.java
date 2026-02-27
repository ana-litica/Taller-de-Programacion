/*
2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
 */
package Practica1;
import PaqueteLectura.Lector;

public class Ej2 {
     public static void main(String[] args) {
        int dim=4;
        double[]v =new double [dim];
        int i;
        double suma=0;
        
        for(i=0;i<dim;i++){
            System.out.println("Ingrese la altura del jugador "+(i+1));
            v[i]=Lector.leerDouble();
            suma+=v[i];
        }
        
        double promedio=suma/dim;
        
        System.out.println("La altura promedio es "+promedio+"\n");
        
        int cant=0;
        for(i=0;i<dim;i++){
            if(v[i]>promedio)
                cant++;
        }
        
        System.out.println("La cantidad de jugadores con altura mayor al promedio es "+cant);
        
    }
}
