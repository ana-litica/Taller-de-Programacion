package Practica5;

public abstract class Recital {
    private String banda;
    private String [] temas;
    private int cantTemas,dT;

    public Recital(String banda,int tem){
        this.setBanda(banda);
        this.cantTemas=tem;
        this.temas=new String[tem];
        this.dT=0;
        /*for (int i = 0; i < tem; i++) {
            temas[i] = null;          
        }*/
    }
    
    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public int getdT() {
        return dT;
    }
    
    
    public void agregarTema(String temaNuevo){
        if(this.getdT()<this.getCantTemas()){
            this.temas[dT]=temaNuevo;
            dT++;
        }
    }
    
    public String anunciarTemas(){
        String aux="";
        for (int i = 0; i < this.getdT(); i++) {
            aux+=" y ahora tocaremos "+this.temas[i]+"\n";
        }
        return aux;
    }
    
    public abstract String actuar();
    
    public abstract double calcularCosto();
}
