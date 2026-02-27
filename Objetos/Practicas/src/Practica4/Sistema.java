package Practica4;

public abstract class Sistema {
    private Estacion e;
    private int N;//cant de años consecutivos
    private int A;//primer año
    private double [][] temperatura;
    
    public Sistema(Estacion est, int N,int A){
        this.e=est;
        this.N=N;
        this.A=A;
        this.temperatura=new double [N][12];
        for(int i=0;i<N;i++){
            for(int j=0;j<12;j++)
                this.temperatura[i][j]=120;
        }
    }

    public Estacion getE() {
        return e;
    }

    public int getN() {
        return N;
    }

    public int getA() {
        return A;
    }
    
    public void registrarTemperatura(int mes,int año,double t){
        this.temperatura[año-this.getA()][mes-1]=t;
    }
    
    public double getTemperatura(int mes,int año){
        return this.temperatura[año-this.getA()][mes-1];
    }
    
    public String mayorTemperatura(){
        double max=-1;
        int maxMes=0,maxAño=0;
        for(int i=0;i<this.getN();i++){
            for(int j=0;j<12;j++){
                if(this.temperatura[i][j]>max){
                    max=this.temperatura[i][j];
                    maxMes=j+1;
                    maxAño=i+1;
                }
            }
        }
        maxAño+=this.getA();
        return "Se registró la mayor temperatura el mes "+maxMes+" del año "+maxAño;
    }
    
    public abstract String promedio();
    
    public String toString(){
        return this.getE().toString()+this.promedio();
    }
}
