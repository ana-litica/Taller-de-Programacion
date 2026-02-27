package Practica4;

public class Jugador extends Empleado{
    private int partidos,goles;

    public Jugador(int partidos, int goles, String nombre, double basico, int antiguedad) {
        super(nombre, basico, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    @Override
    public double calcularEfectividad(){
        return (double) this.getGoles()/this.getPartidos();
    }
    
    private boolean promedioGoles(){
        return (this.calcularEfectividad())>0.5;
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double aux=this.sueldo();
        if(this.promedioGoles())
            aux+=this.getBasico();
        return aux;
    }
}
