package Practica4;

public class Entrenador extends Empleado{
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double basico, int antiguedad) {
        super(nombre, basico, antiguedad);
        this.campeonatos = campeonatos;
    }  

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    public double calcularEfectividad(){
        return (double) this.getCampeonatos()/this.getAntiguedad();
    }
    
    public double calcularSueldoACobrar(){
        double aux=this.getBasico();
        if((this.getCampeonatos()>=1)&&(this.getCampeonatos()<=4))
                aux+=5000;
        else{
            if((this.getCampeonatos()>=5)&&(this.getCampeonatos()<=10))
                aux+=30000;
            else{
                if((this.getCampeonatos()>10))
                    aux+=50000;
            }
        }
        return aux;
    }
}
