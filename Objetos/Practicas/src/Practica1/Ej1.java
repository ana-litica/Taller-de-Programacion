/*
1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la tabla
del 2.
Genere enteros aleatorios hasta obtener el número 11. Para cada número muestre
el resultado de multiplicarlo por 2 (accediendo al vector).
 */
package Practica1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej1 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dF=11;
        int []v=new int [dF];
        int dato;
        for (int i = 0; i < dF; i++) {
            dato=GeneradorAleatorio.generarInt(3);
            v[i]=dato*2;
            System.out.println(dato+"x2= "+v[i]);
        }
    }
}
