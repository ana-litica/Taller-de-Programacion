package Practica5;
//No encontré el main de este ejericicio

public class Hileras extends Coro{
    private Corista[][] c;
    private int dimFColumnas,dimFFilas,filaActual,columnaActual;
    //private int []dimL;
    
    public Hileras (String nombre, Director d,int dF,int dimC){
        super(nombre,d);
        this.dimFColumnas=dimC;
        this.dimFFilas=dF;
        this.filaActual=0;
        this.columnaActual=0;
        c=new Corista[dF][dimC];
        /*dimL=new int [dF];
        for(int i=0;i<dF;i++){
            dimL[i]=0;
        }*/
    }

    public int getDimFColumnas() {
        return dimFColumnas;
    } 
    
    public int getDimFFilas(){
        return dimFFilas;
    }
    
    public void agregarCorista(Corista cor){
        this.c[this.filaActual][this.columnaActual]=cor;
        this.columnaActual++;
        if(this.columnaActual==this.dimFColumnas){
            this.filaActual++;
            this.columnaActual=0;
        }
    }
    
    public boolean estaLleno(){
        boolean lleno=false;
        if(this.filaActual==this.dimFFilas)
            lleno=true;
        return lleno;
    }
    
    public boolean bienFormado(){
        int i=0;
        boolean lleno=true;
        int min = 9999;
        while(i<this.getDimFFilas()&&(lleno)){
            int j=0;
            int tonoActual = this.c[i][j].getTonoFundamental();
            if (tonoActual < min) {
                min = tonoActual;
            } else lleno = false;
            while((j<this.getDimFColumnas())&& (lleno) &&(tonoActual==this.c[i][j].getTonoFundamental()))
                j++;
            if (j == this.getDimFColumnas()) {
                i++;
            }
        }
        return lleno;
    }
    
    
}
