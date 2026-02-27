/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;
import PaqueteLectura.GeneradorAleatorio;

public class Ej1 {
     public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Proyecto p=new Proyecto("Eureka","Graciela",9015);
        for(int i=0;i<3;i++){
            String nombre=GeneradorAleatorio.generarString(6);
            Investigador inv=new Investigador(nombre,GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarInt(5));
            p.agregarInvestigador(inv);
            for(int j=0;j<2;j++){
                Subsidio s=new Subsidio(GeneradorAleatorio.generarDouble(50000),GeneradorAleatorio.generarString(12));
                inv.agregarSubsidio(s);
            }
            inv.otorgarTodos(nombre);
        }
        
        System.out.println(p.toString());
    }
}
