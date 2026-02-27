package Practica5;

public abstract class Persona {
    private String nombre;
    private int DNI;
    private int edad; 

    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
       
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        return "Nombre: "+this.getNombre()+
                ". DNI: "+this.getDNI()+
                ". Edad: "+this.getEdad();
    }
    
    public abstract String completasDatos();
}
