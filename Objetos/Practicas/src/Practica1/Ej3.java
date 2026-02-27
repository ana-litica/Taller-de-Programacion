/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java
 */
package Practica1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej3 {
     public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int i,j;
        int dim=5;
        int [][]m=new int [dim][dim];
        
        for (i=0;i<dim;i++){
            for(j=0;j<dim;j++)
                m[i][j]=GeneradorAleatorio.generarInt(31);
        }
        
        //Mostrar el contenido de la matriz en consola
        for (i=0;i<dim;i++){
            for(j=0;j<dim;j++)
                System.out.print(m[i][j]+" | ");
            System.out.println("             ");
        }
        System.out.println("\n");
        
        //Calcular e informar la suma de los elementos de la fila 1
        int suma=0;
        for (j=0;j<dim;j++)
            suma+=m[1][j];
        
        System.out.println("La suma de los elementos de la fila 1 es "+suma);
        System.out.println("\n");
        
        /*
        Generar un vector de 5 posiciones donde cada posición j contiene la suma
        de los elementos de la columna j de la matriz. Luego, imprima el vector
        */
        int []v=new int [dim];
        for(j=0;j<dim;j++){
            for(i=0;i<dim;i++)
                v[j]+=m[i][j];
            System.out.print(v[j]+" | ");
        }
        System.out.println("\n");
        
        /*
        Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
        encontrarse indique su ubicación (fila y columna) en caso contrario
        imprima “No se encontró el elemento”.
        */
        
        System.out.println("Ingrese un valor");
        int valor=Lector.leerInt();
        i=0;
        boolean esta=false;
        
        while ((i<dim)&&(esta==false)) {
            j=0;
            while((j<dim)&&(esta==false)){
                if (m[i][j]==valor) {
                    esta=true;
                } else {
                    j++;
                }
            }
            i++;
        }
        
        if (esta) {
            System.out.println("El valor "+valor+" se encuentra en la fila "+(i-1)+", columna "+j);
        } else {
            System.out.println("No se encontró el elemento");
        }
        
    }
}
