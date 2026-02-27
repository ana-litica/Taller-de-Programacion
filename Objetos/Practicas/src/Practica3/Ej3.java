/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package Practica3;
import PaqueteLectura.GeneradorAleatorio;

public class Ej3 {
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        Estante e=new Estante();
        for(int i=0;i<8;i++){
 
            Autor a=new Autor(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(15),GeneradorAleatorio.generarString(15));
            Libro libro=new Libro(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(7),a,GeneradorAleatorio.generarString(20));
        
            e.agregar(libro);
        }
        Autor aM=new Autor(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(15),GeneradorAleatorio.generarString(15));
 
        Libro libroM=new Libro("Mujercitas",GeneradorAleatorio.generarString(7),aM,GeneradorAleatorio.generarString(20));
        e.agregar(libroM);
        
        //String nombre=e.buscarTitulo("Mujercitas").getPrimerAutor().getNombre();
        
        
        System.out.println("Autor de Mujercitas: "+e.buscarTitulo("Mujercitas").getPrimerAutor().getNombre());
    }
}
