/*
2- Queremos organizar libros en una estantería. La estantería tiene 5 estantes, cada uno
tiene espacio para 10 libros. Los libros se organizarán en la estantería según su peso.
Desde el estante superior al inferior irán los libros con peso 1g..299g, 300g..599g, 600g
a 899g, 900g a 1199g, 1200g a 1500g (como se muestra en la
figura). Suponga que los libros pesan menos de 1500g.
a. Declare una estructura adecuada para representar la
estantería, sabiendo que de cada libro sólo se guardará el
título.
b. Lea la información de los libros (título, peso) hasta
ingresar uno con peso 0 y almacénelos en la estantería según
su peso. En caso de existir espacio en el estante adecuado,
ingresar al libro en el primer lugar libre (de manera directa).
Caso contrario informe que no hay lugar para dicho libro.
Nota: el número de estante de un libro se calcula haciendo
e = peso_del_libro / 300. Además, piense en usar una estructura
que para cada estante guarde la cantidad de libros que tiene,
así sabrá cuál es el primer lugar libre de cada estante.
c. Luego de la carga (inciso b), informar para cada estante
los títulos de los libros que contiene.
 */
package Practica1;
import PaqueteLectura.Lector;

public class Adicional2 {
    public static void main(String[] args) {
        int dE=5,dL=10,e,i,j;
        int []log=new int [dE];
        double peso;
        String [][] estante=new String[dE][dL];
        
        for(i=0;i<dE;i++ )
            log[i]=0;
        
        System.out.println("Ingrese un peso");
        peso=Lector.leerDouble();
        while(peso!=0){
            e=(int) (peso/300);
            if (log[e]<dE) {
                System.out.println("Ingrese el titulo");
                estante[e][log[e]]=Lector.leerString();
                log[e]++;
            } else {
                System.out.println("No hay lugar en el estante.");
            }
            System.out.println("Ingrese un peso");
            peso=Lector.leerDouble();
        }
        
        for(i=0;i<dE;i++){
            System.out.println("Estante "+(i+1));
            for(j=0;j<log[i];j++)
                System.out.println("Titulo del libro: "+estante[i][j]);
        }
    }
}
