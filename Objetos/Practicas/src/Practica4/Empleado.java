package Practica4;

public abstract class Empleado {
    private String nombre;
    private double basico;
    private int antiguedad;

    public Empleado(String nombre, double basico, int antiguedad) {
        this.nombre = nombre;
        this.basico = basico;
        this.antiguedad = antiguedad;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getBasico() {
        return basico;
    }

    public void setBasico(double basico) {
        this.basico = basico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public double sueldo(){
        return this.getBasico()+this.getBasico()*0.1;
    }
    
    public abstract double calcularSueldoACobrar();
    
    public String toString(){
        return "Nombre: "+this.getNombre()+
                ". Sueldo a cobrar: "+this.calcularSueldoACobrar()+
                ". Efectividad: "+this.calcularEfectividad();
    }
}
