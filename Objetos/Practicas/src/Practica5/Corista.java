package Practica5;

// No encontré el main de este ejercicio

public class Corista extends Persona{
     private int tonoFundamental;

    public Corista(String unNombre, int unDNI, int unaEdad,int tonoFundamental) {
        super(unNombre, unDNI, unaEdad);
        this.setTonoFundamental(tonoFundamental);
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
        public String completasDatos(){
        return super.toString()+". Tono fundamental: "+this.getTonoFundamental();
    }
}
