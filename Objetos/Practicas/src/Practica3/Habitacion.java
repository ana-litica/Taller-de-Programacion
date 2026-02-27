package Practica3;

public class Habitacion {
    private double costo;
    private boolean libre;
    private Persona cliente;
    
    public Habitacion(){
        this.costo=GeneradorAleatorio.generarDouble(6001)+2000;
        this.libre=true;
        this.cliente=null;
    } 

    public double getCosto() {
        return costo;
    }

    public boolean isLibre() {
        return libre;
    }

    public Persona getCliente() {
        return cliente;
    }

   /* public void setCosto(double costo) {
        this.costo = costo;
    }*/

    public void setLibre(boolean libre) {
        this.libre = libre;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    public void aumentarCosto(double monto){
        //this.setcosto(costo+monto);
        this.costo+=monto;
    }
    
    public String toString (){
        String aux="";
        if(this.libre)
            aux="Costo: "+this.costo+". Libre. ";
        else    
            aux="Costo: "+this.costo+". Ocupada por: "+this.cliente.toString();
        return aux;
    }
}
