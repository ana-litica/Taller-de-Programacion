package Practica3;

public class Alumno {
    private String nombre;
    private int edad;
    private String instrumento;
    private double puntaje;

    public Alumno(String nombre, int edad, String instrumento, double puntaje) {
        this.nombre = nombre;
        this.edad = edad;
        this.instrumento = instrumento;
        this.puntaje = puntaje;
    }
    
    public Alumno(){
        
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getInstrumento() {
        return instrumento;
    }

    public void setInstrumento(String instrumento) {
        this.instrumento = instrumento;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    public String toString(){
        return "Nombre: "+this.nombre+". Edad: "+this.edad+". Instrumento: "+this.instrumento+". Puntaje: "+this.puntaje;
    }
}
