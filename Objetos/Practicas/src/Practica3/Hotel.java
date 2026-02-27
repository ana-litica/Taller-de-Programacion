package Practica3;

public class Hotel {
    private int N;
    private Habitacion [] h;
    
    public Hotel(int N){
        this.N=N;
        h=new Habitacion[this.N];
        for(int i=0;i<N;i++)
            h[i]=new Habitacion();//porque ya existen las habitaciones
    }

    public int getN() {
        return N;
    }
    
    public void ingresarCliente(Persona C,int X){
        this.h[X-1].setCliente(C);
        this.h[X-1].setLibre(false);
    }
    
    public void aumentarPrecios(double monto){
        for(int i=0;i<N;i++)
            this.h[i].aumentarCosto(monto);
    }
    
    public String toString(){
        String aux="";
        for (int i=0;i<N;i++)
            aux+="Habitacion "+(i+1)+": "+this.h[i].toString()+"\n";
        return aux;
    }
}
