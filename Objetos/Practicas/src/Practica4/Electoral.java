package Practica4;
import PaqueteLectura.GeneradorAleatorio;

public class Electoral extends Urna {
    private int cantListas;
    private int [] contador;
    
    public Electoral(Zona Z,int U,int L ){
        super(Z,U);
        this.cantListas=L;
        this.contador=new int [L];
        for(int i=0;i<L;i++)
            this.contador[i]=0;
    }

    public int getCantListas() {
        return cantListas;
    }

    public void setCantListas(int cantListas) {
        this.cantListas = cantListas;
    }
    
    public boolean validarNumeroDeLista(int N){
        boolean valido=false;
        if((N-1)<this.getCantListas())
            valido=true;
        return valido;
    }
    
    public void votarPorLista(int I){
        this.contador[I-1]++;
    }
    
    public int devolverVotosPorLista(int I){
        return this.contador[I-1];
    }
    
    public int calcularGanador(){
        GeneradorAleatorio.iniciar();
        int max=-1,empates=0,ganadora=0;
        for(int i=0;i<this.getCantListas();i++){
            if(this.contador[i]>max){
                max=this.contador[i];
                ganadora=i;
            }else{
                if(this.contador[i]==max)
                    empates++;
            }
        }
        if(empates>=2)
            ganadora=GeneradorAleatorio.generarInt(this.getCantListas());
        return ganadora;
    }
    
    public String anunciarGanador(){
        return "Lista ganadora: "+this.calcularGanador();
    }
    
    public int calcularTotalVotos(){
        int suma=0;
        for(int i=0;i<this.getCantListas();i++)
            suma+=this.contador[i];
        suma+=this.getBlanco();
        return suma;
    }
}
