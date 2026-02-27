/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package Practica1;
import PaqueteLectura.Lector;

public class Ej4 {
    public static void main(String[] args) {
        int dP=8,dO=4;
        int[][]e=new int [dP][dO];
        int piso,oficina;
        
        for(int i=0;i<dP;i++){
            for(int j=0;j<dO;j++)
                e[i][j]=0;
        }
        
        System.out.println("Ingrese el numero de piso");
        piso=Lector.leerInt();
        
        while(piso!=9){
            System.out.println("Ingrese el numero de oficina");
            oficina=Lector.leerInt();
            e[piso-1][oficina-1]+=1;
            System.out.println("Ingrese el numero de piso");
            piso=Lector.leerInt();           
        }
        
        for(int i=0;i<dP;i++){
            for(int j=0;j<dO;j++)
                System.out.println("Piso: "+(i++)+". Oficina: "+(j++)+". Cantidad de personas: "+e[i][j]);
        }
    }
}
