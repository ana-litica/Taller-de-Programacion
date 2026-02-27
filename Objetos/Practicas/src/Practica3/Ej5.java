/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI
 */
package Practica3;
import PaqueteLectura.Lector;

public class Ej5 {
    public static void main(String[] args) {
        System.out.println("Ingrese el radio");
        double radio=Lector.leerDouble();
        System.out.println("Ingrese el color de relleno");
        String relleno=Lector.leerString();
        System.out.println("Ingrese el color de linea");
        String linea=Lector.leerString();
        
        Circulo c=new Circulo(radio,relleno,linea);
        System.out.println("Perimetro: "+c.calcularPerimetro());
        System.out.println("Area: "+c.calcularArea());
    }
}
