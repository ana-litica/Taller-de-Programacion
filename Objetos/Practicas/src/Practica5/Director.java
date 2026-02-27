package Practica5;
// No encontré el main de este ejercicio

public class Director extends Persona{
    private int antiguedad;

    public Director(String unNombre, int unDNI, int unaEdad,int antiguedad) {
        super(unNombre, unDNI, unaEdad);
        this.setAntiguedad(antiguedad);
    } 

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public String completasDatos(){
        return super.toString()+". Antiguedad: "+this.getAntiguedad();
    }
}
