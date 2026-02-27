/*
4- El Servicio Meteorológico Nacional necesita un sistema que permita registrar, para una
determinada estación meteorológica, la temperatura promedio mensual de N años
consecutivos a partir de un año A dado. Además, necesita dos versiones del sistema: una
que tenga funcionalidad para reportar el promedio histórico por años y otra que tenga
funcionalidad para reportar el promedio histórico por meses. Esto se detalla más adelante.
De la estación, interesa conocer: nombre, y latitud y longitud donde se encuentra.
Implemente las clases, constructores y métodos que considere necesarios para:
a) Crear el sistema de registro/reporte, que funcionará en una determinada estación,
para N años consecutivos a partir de un año A. Inicie cada temperatura en un valor
muy alto.
b) Registrar la temperatura de un mes y año recibidos por parámetro. Nota: El mes está
en rango 1..12 y el año está en rango A..A+N-1.
c) Obtener la temperatura de un mes y año recibidos por parámetro. Nota: El mes está
en rango 1..12 y el año está en rango A..A+N-1. En caso de no haberse registrado
temperatura para ese mes/año se retorna el valor muy alto.
d) Devolver un String que concatena el mes y año en que se registró la mayor
temperatura. Nota: Suponga que ya están registradas las temperaturas de todos
los meses y años.
e) Devolver un String con el nombre de la estación, su latitud y longitud, y los promedios
mensuales o anuales según corresponda:
- La versión del sistema que reporta por años deberá calcular el promedio para
cada año (el promedio del año X se calcula con los datos mensuales de ese año).
Ej: “La Plata (34,921 S - 57,955 O):
- Año 2020: 23,8 oC;
- Año 2021: 26,1 oC;
- Año 2022: 25,3 oC. ”

- La versión del sistema que reporta por meses deberá calcular el promedio para
cada mes (el promedio del mes M se calcula con los datos de todos los años en ese
mes).
Ej: “La Plata (34,921 S - 57,955 O):
- Enero: 28,2 oC;
- Febrero: 26,8 oC;
- Marzo: 24.3 oC
- .....”

Nota: Suponga que ya están registradas las temperaturas de todos los meses
y años. Utilice el carácter \n para concatenar un salto de línea.
f) Realice un programa principal que cree un Sistema con reporte anual para 3 años
consecutivos a partir del 2021, para la estación La Plata (latitud -34.921
y longitud -57.955). Cargue todas las temperaturas (para todos los meses y años).
Informe los promedios anuales, y el mes y año en que se registró la mayor
temperatura.
Luego cree un Sistema con informe mensual para 4 años a partir de 2020, para la
estación Mar del Plata (latitud -38.002 y longitud -57.556). Cargue todas las
temperaturas (para todos los meses y años). Informe los promedios mensuales, y el
mes y año en que se registró la mayor temperatura.
NOTA: Preste atención de no violar el encapsulamiento al resolver el ejercicio.
 */
package Practica4;
import PaqueteLectura.GeneradorAleatorio;

public class Ej4 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacion e1=new Estacion("La Plata",-34.921,-57.955);
        Anual a=new Anual(e1,3,2021);
        
        Estacion e2=new Estacion("Mar del Plata",-34.921,-57.955);
        Mensual m=new Mensual(e2,4,2020);
        
        int i,j,k;
        
        for(i=0;i<3;i++){
            for(j=2021;j<2024;j++){
                for(k=1;k<12;k++){
                    a.registrarTemperatura(k,j,GeneradorAleatorio.generarDouble(35));
                }
            }
        }
        
        System.out.println(a.toString());
        System.out.println(a.mayorTemperatura());
        
        System.out.println("                  ");
        
        for(i=0;i<4;i++){
            for(j=2020;j<2024;j++){
                for(k=1;k<12;k++){
                    m.registrarTemperatura(k,j,GeneradorAleatorio.generarDouble(35));
                }
            }
        }
        
        System.out.println(m.toString());
        System.out.println(m.mayorTemperatura());
    }
}
