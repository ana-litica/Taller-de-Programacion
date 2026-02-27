package Practica4;

public class Mensual extends Sistema{
       private String []m=new String[]{"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}; 
    
    public Mensual(Estacion est, int N, int A) {
        super(est, N, A);
    }
    
    public String promedio(){
        String aux="";
        for(int j=0;j<12;j++){
            int i;
            double suma=0;
            for(i=0;i<this.getN();i++){
                suma+=this.getTemperatura(j+1, i+this.getA());
            }
            suma=suma/this.getN();
            aux+="-"+this.m[j]+": "+suma+"°C;"+"\n";
        }
        return aux;
    }
}
