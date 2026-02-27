/*
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.
 */
package Practica2;
import PaqueteLectura.GeneradorAleatorio;

public class Ej2 {
     public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dF=15,dL=0,DNI,edad;
        String nombre;
        Persona [] p=new Persona [dF];
        
        edad=GeneradorAleatorio.generarInt(100);
        while((dL<dF)&&(edad!=0)){
            nombre=GeneradorAleatorio.generarString(10);
            DNI=GeneradorAleatorio.generarInt(44000);
            p[dL]=new Persona(nombre,DNI,edad);
            dL++;
            edad=GeneradorAleatorio.generarInt(100);
        }
        
        for(int i=0;i<dL;i++)
            System.out.println(p[i].toString());
        
        System.out.println("              ");
        int mayores=0,min=45000;
        Persona menorDNI=null;
        
        for(int i=0;i<dL;i++){
            if(p[i].getEdad()>65)
                mayores++;
            if(p[i].getDNI()<min){
                min=p[i].getDNI();
                menorDNI=new Persona(p[i].getNombre(),p[i].getDNI(),p[i].getEdad());  
            }
        }
        
        System.out.println("La cantidad de persona mayores a 65 años es "+mayores);
        System.out.println("              ");
        if (menorDNI!=null) {
            System.out.println("Representacion de la persona con menor DNI:");
            System.out.println(menorDNI.toString());
        } else {
            System.out.println("Vector vacio");
        } 
    }
}
