package Practica5;

public class Proyecto {
    private String nombre,director;
    private int codigo;
    private int dL,dF=50;
    private Investigador[]investigadores;
    
    public Proyecto(String nombre,String director,int codigo){
        this.nombre=nombre;
        this.director=director;
        this.codigo=codigo;
        dL=0;
        investigadores=new Investigador[this.dF];
        for(int i=0;i<this.dF;i++)
            this.investigadores[i]=null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getdL() {
        return dL;
    }

    public int getdF() {
        return dF;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(this.dL<this.dF){
            this.investigadores[dL]=unInvestigador;
            dL++;
        }          
    }
    
    public double dineroTotalOtorgado(){
        double total=0;
        for(int i=0;i<this.dL;i++)
            total+=this.investigadores[i].sumarMonto();
        return total;
    }
    
    public String toString(){
        String aux="Proyecto: "+this.getNombre()+
                ". Codigo: "+this.getCodigo()+
                ". Director: "+this.getDirector()+
                ". Dinero otorgado: "+this.dineroTotalOtorgado()+"\n";
        for(int i=0;i<this.dL;i++)
            aux+="Investigador "+(i+1)+": "+this.investigadores[i].toString()+"\n";
        return aux;
    }
}
