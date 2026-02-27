/*
1- a) Simular la entrada de autos al estacionamiento municipal en el centro de la ciudad.
El estacionamiento está dividido en 5 pisos y cada piso tiene 10 plazas.
Realice un programa que genere aleatoriamente números (patentes) hasta el 0. Por cada
patente generada, debe leer por teclado el número de piso y número de plaza donde
debe estacionar el auto, debiendo marcar ese lugar como ocupado en una estructura de
datos adecuada.
Nota: Al principio todas las plazas del estacionamiento deben marcarse desocupadas.
Además, durante la lectura, puede considerar que el lugar leído (número de piso,
número de plaza) está desocupado y que dichos números son válidos.
 */
package Practica1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Adicional1 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int pisos=5,plazas=10,i,j,pi,pl;
        boolean [][]libre=new boolean[pisos][plazas];
        int [][]auto=new int [pisos][plazas];
        int []cant=new int [pisos];
        
        for(i=0;i<pisos;i++){
            cant[i]=0;
            for(j=0;j<plazas;j++)
                libre[i][j]=true;
        }
        
        int patente=GeneradorAleatorio.generarInt(51);
        while(patente!=0){
            //System.out.println("Ingrese el piso.");
            //pi=Lector.leerInt();
            pi=GeneradorAleatorio.generarInt(pisos)+1;
            //System.out.println("Ingrese la plaza.");
            //pl=Lector.leerInt();
            pl=GeneradorAleatorio.generarInt(plazas)+1;
            if(libre[pi-1][pl-1]){
                libre[pi-1][pl-1]=false;
                auto[pi-1][pl-1]=patente;
                cant[pi-1]++;
            }
            patente=GeneradorAleatorio.generarInt(51);
        }
        
        for(i=0;i<pisos;i++){
            for(j=0;j<plazas;j++)
                System.out.print(auto[i][j]+" | ");
            System.out.println("               ");
        }
        
        System.out.println("\n");
        System.out.println("Cantidad de autos por piso:");
        for(i=0;i<pisos;i++){
            System.out.print(cant[i]+" | ");
        }
        
        System.out.println("\n");
        int max=-1;
        for (i=0;i<pisos;i++){
            if(max<cant[i])
                max=i+1;
        }
        System.out.println("El piso más ocupado es el "+max);
    }
}
