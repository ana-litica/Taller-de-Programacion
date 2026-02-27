package Practica3;

public class Estante {
     private int dF=20;
    private int dL;
    private Libro [] l;
    
    public Estante(){
        this.dL=0;
        this.l=new Libro[this.dF];
        for (int i=0;i<dF;i++)
            this.l[i]=null;//porque no hay ninguna libro en la estanteria (No existen todavia)
    }
    
    public int getCant(){
        return this.dL;
    }
    
    private boolean lleno(){
        return this.dF==this.dL;
    }
    
   public void agregar (Libro l){
        if(dL<dF){
            this.l[dL]=l;
            dL++;
        }
    }
    
    public Libro buscarTitulo(String titulo){
        Libro aux=null;
        int i=0;
        while(i<this.dL && aux == null){
            if(!(titulo.equals(this.l[i].getTitulo())))
                i++;
            else
                aux=l[i];
        }
        return aux;
    }
}
