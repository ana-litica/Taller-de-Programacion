package Practica5;
//No encontré el main de este ejercicio

public class Semicircular extends Coro{
    private Corista[] c;
    private int dL;
    private int dF;
    
    public Semicircular(String nombre, Director d,int dF){
        super(nombre,d);
        this.c=new Corista[dF];
        this.dL=0;
        this.dF=dF;
    }

    public int getdL() {
        return dL;
    }
    
    public int getdF(){
        return dF;
    }
    
    public void agregarCorista(Corista cor){
        this.c[this.dL]=cor;
        this.dL++;
    }
    
    public boolean estaLleno(){
        return this.getdL()==this.getdF();
    }
    
    public boolean bienFormado(){
        int i=0,menor=999;
        boolean bien=true;
        while((i<this.getdF())&&(bien)){
            if(this.c[i].getTonoFundamental()<menor)
                menor=this.c[i].getTonoFundamental();
            else
                bien=false;
            i++;
        }
        return bien;
    }
}