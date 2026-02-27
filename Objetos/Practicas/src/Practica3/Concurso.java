package Practica3;

public class Concurso {
    private int generos=5;
    private int N;
    private Alumno[][]a;
    private int dL[];

    public Concurso(int N){
        this.N=N;
        a=new Alumno[generos][N];
        dL=new int [N];
        for (int i = 0; i < generos; i++) {
            dL[i]=0;     
        }
    }
    
    public int getGeneros() {
        return generos;
    }

    public int getN() {
        return N;
    }
    
    public void inscribirAlumno(Alumno al,int G){
        this.a[G-1][dL[G-1]]=al;
        this.dL[G-1]++;
    }
    
    private boolean nombreIgual(String N,int G){
        return N.equals(this.a[G-1][this.dL[G-1]].getNombre());
    }
    
    public void asignarPuntaje(int G,String N,double P){
        int i=0;
       /* boolean esta=false;
        while((i<dL[G-1])&&!(esta)){
            if (nombreIgual(N,G)) {
                this.a[G-1][this.dL[G-1]].setPuntaje(P);
                esta=true;
            } else {
                i++;
            }
        }*/
        while ((i<dL[G-1])&&!(nombreIgual(N,G))) {
            i++;
        }
        if ((i<dL[G-1])&&(nombreIgual(N,G)))
                this.a[G-1][this.dL[G-1]].setPuntaje(P);
    }
    
    public double punt(int g){
        return this.a[g][g].getPuntaje();
    }
    
    private Alumno maxPuntaje(){
        Alumno aux=null;
        double max=-1;
        for(int i=0;i<generos;i++){
            for(int j=0;j<this.dL[i];j++){
                if(this.a[i][j].getPuntaje()>max){
                    max=this.a[i][j].getPuntaje();
                    aux=a[i][j];
                }
            }
        }
        return aux;
    }
    
    public String toString(){
        String aux="";
        for(int i=0;i<generos;i++){
            aux+="Genero "+(i+1)+"- Total inscriptos: "+dL[i]+"\n";
            for(int j=0;j<this.dL[i];j++){
                aux+=this.a[i][j].toString()+"\n";
            }
        }
        aux+="Alumno de mayor puntaje: "+this.maxPuntaje().toString();
        return aux;
    }
}
