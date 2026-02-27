package Practica4;

public class Circulo extends Figura{
     private double radio;
    
    public Circulo(double r,String relleno,String linea){
        super(relleno,linea);
        this.setRadio(r);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularPerimetro(){
        return (2*this.getRadio()*Math.PI);
    }
    
    public double calcularArea(){
        return (Math.PI*this.getRadio()*this.getRadio());
    }
    
    public String toString(){
        String aux= super.toString()+
                    " Radio: "+this.getRadio();
        return aux;
    }
}
