package Practica4;

public class Anual extends Sistema{
    public Anual(Estacion est, int N, int A) {
        super(est, N, A);
    }   
    
    public String promedio(){
        String aux="";
        for(int i=0;i<this.getN();i++){
            double suma=0;
            int j;
            for(j=0;j<12;j++)
                suma+=this.getTemperatura(j+1, i+this.getA());
            suma=suma/12;
            aux+="-Año "+(this.getA()+i)+": "+suma+"°C;"+"\n";
        }
        
        return aux;
    }
}
