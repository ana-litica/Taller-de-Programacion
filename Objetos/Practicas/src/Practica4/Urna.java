package Practica4;

public abstract class Urna {
    private int numeroUrna,blanco;
    private Zona zona;
    
    public Urna (Zona Z,int U){
        setZona(Z);
        setNumeroUrna(U);
        this.blanco=0;
    }

    public int getNumeroUrna() {
        return numeroUrna;
    }

    public void setNumeroUrna(int numero) {
        this.numeroUrna = numero;
    }

    public int getBlanco() {
        return blanco;
    }

    public Zona getZona() {
        return zona;
    }

    public void setZona(Zona zona) {
        this.zona = zona;
    }
    
    public void votarEnBlanco(){
        this.blanco++;
    }
    
    public abstract int calcularGanador();
    public abstract int calcularTotalVotos();
    public abstract String anunciarGanador();
    
    public String toString(){
        return "Urna: "+this.getNumeroUrna()+
                ". Zona: "+this.getZona().toString()+
                ". Total votos: "+this.calcularTotalVotos()+
                ". Ganador: "+this.anunciarGanador();
    }
}
