package Practica5;

public class Gira extends Recital{
    private String nombre;
    private Fecha [] f;
    private int actual,cantF,dL;
    
    public Gira(String banda,int tem,String nombre,int cantFechas){
        super(banda,tem);
        this.nombre=nombre;
        this.cantF=cantFechas;
        f=new Fecha[cantFechas];
        actual=0;
        this.dL=0;
        for (int i = 0; i <cantFechas; i++) {
            f[i]=null;         
        }
    }

    public String getNombre() {
        return nombre;
    }

    public int getActual() {
        return actual;
    }

    public int getCantF() {
        return cantF;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }
    
    public void agregarFecha(Fecha fe){
        if(dL<this.getCantF()){
            this.f[dL]=fe;
            dL++;
        }
    }
    
    public String actuar(){
        String aux="Buenas noches "+this.f[this.getActual()].getCiudad()+"\n"+
                super.anunciarTemas();
        this.setActual(actual+1);        
        return aux;
    }
    
    public double calcularCosto(){
        return this.cantF*30000;
    }
}
