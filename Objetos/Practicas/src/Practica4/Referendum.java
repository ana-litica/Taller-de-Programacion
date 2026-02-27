package Practica4;

public class Referendum extends Urna{
    private int aFavor,enContra;
    
    public Referendum(Zona Z,int U){
        super(Z,U);
        this.aFavor=0;
        this.enContra=0;
    }

    public int getaFavor() {
        return aFavor;
    }

    public int getEnContra() {
        return enContra;
    }

    
    public void votarAFavor(){
        this.aFavor++;
    }
    
    public void votarEnContra(){
        this.enContra++;
    }
    
    public int calcularGanador(){
        int ganador;
        if(this.getaFavor()==this.getEnContra())
            ganador=0;
        else{
            if(this.getEnContra()>this.getaFavor())
                ganador=-1;
            else
                ganador=1;
        }
        return ganador;
    }
    
    public String anunciarGanador(){
        String aux="";
        if(this.calcularGanador()==0)
            aux+="Hubo empate";
        else{
            if(this.calcularGanador()==1)
                aux+=" A favor";
            else
                aux+="En contra";
        }
        return aux;
    }
    
    public int calcularTotalVotos(){
        return this.getBlanco()+this.getEnContra()+this.getaFavor();
    }
}
