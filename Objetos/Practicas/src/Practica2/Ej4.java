/*
4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.
 */
package Practica2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej4 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dias=5, turnos=8,DNI,edad,d,cupos=0,i;
        String nombre;
        Persona [][] p= new Persona[dias][turnos];
        int [] t= new int [dias];
        
        for (i = 0; i < dias; i++) {
            t[i]=0;           
        }
        
        System.out.println("Ingrese el nombre");
        nombre=Lector.leerString();
        while ((!nombre.equals("ZZZ"))&&(cupos!=40)) {
            /*System.out.println("Ingrese el dia elegido");
            d=Lector.leerInt();*/
            d=GeneradorAleatorio.generarInt(5)+1;
            if (t[d-1]<turnos) {
                /*System.out.println("Ingrese el DNI");
                DNI=Lector.leerInt();
                System.out.println("Ingrese la edad");
                edad=Lector.leerInt();*/
                DNI=GeneradorAleatorio.generarInt(44000);
                edad=GeneradorAleatorio.generarInt(99)+1;
                p[d-1][t[d-1]]=new Persona(nombre,DNI,edad);
                t[d-1]++;
                cupos++;
            } else {
                System.out.println("No hay turnos disponibles en el dia elegido");
            }
            System.out.println("Ingrese el nombre");
            nombre=Lector.leerString();
        }
        
        System.out.println("               ");
        
        for (i = 0; i < dias; i++) {         
            System.out.println("La cantidad de inscriptos el dia "+(i+1)+" fue de "+t[i] );
            for (int j = 0; j < t[i]; j++) {
                System.out.println("Dia: "+(i+1)+". Turno: "+(j+1)+". Nombre: "+p[i][j].getNombre());              
            }
            
        }
    }
}
