package Practica4;

public class Triangulo extends Figura{
    private double lado1,lado2,lado3;

    public Triangulo(double lado1,double lado2,double lado3, String relleno,String linea ){
        super(relleno,linea);
        this.setLado1(lado1);
        this.setLado2(lado2);
        this.setLado3(lado3);
    }
    
    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }   
    
    public double calcularArea(){
        double s=(this.getLado1()+this.getLado2()+this.getLado3())/2;
        s=Math.sqrt(s*(s-this.getLado1())*(s-this.getLado2())*(s-this.getLado3()));
        return s;
    }
    
    public double calcularPerimetro(){
        return (this.getLado1()+this.getLado2()+this.getLado3());
    }
    
    public String toString(){
        String aux=super.toString()+
                " Lado 1: "+this.getLado1()+
                " Lado 2: "+this.getLado2()+
                " Lado 3: "+this.getLado3();
        return aux;
    }
}
