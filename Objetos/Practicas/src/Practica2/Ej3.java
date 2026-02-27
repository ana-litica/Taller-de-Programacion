/*
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package Practica2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej3 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dias=5,turnos=8,d=0,t=0,edad,DNI;
        String nombre;
        Persona [][] p=new Persona[dias][turnos];
        
        System.out.println("Ingrese el nombre");
        nombre=Lector.leerString();
        while((d<dias)&&!(nombre.equals("ZZZ"))){
            t=0;
            while ((t<turnos)&&!(nombre.equals("ZZZ"))) {
                /*System.out.println("Ingrese el DNI");
                DNI=Lector.leerInt();
                System.out.println("Ingrese la edad");
                edad=Lector.leerInt();*/
                DNI=GeneradorAleatorio.generarInt(44000);
                edad=GeneradorAleatorio.generarInt(99)+1;
                p[d][t]=new Persona(nombre,DNI,edad);
                t++;
                System.out.println("Ingrese el nombre");
                nombre=Lector.leerString();
            }
            d++;
        }
        
        int i,j;
        for (i = 0; i < d; i++) {//d es dimLog de filas
            int x;
            if (i==(d-1)) {//d-1 es el valor de la dL de los dias
               x=t;    
            }else x= turnos;
            for ( j = 0; j < x; j++)//dia numero d (puede que no esten llenos los turnos, t es dimLog de columnas)
                    System.out.println("El turno "+(j+1)+" del dia "+(i+1)+" fue asignado a "+p[i][j].getNombre());
                             
        }
        
    }
}
