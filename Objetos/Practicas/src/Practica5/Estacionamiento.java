package Practica5;

public class Estacionamiento {
    private String nombre,direccion,apertura,cierre;
    private int piso,plaza;
    private Auto [][] a;
    
    public Estacionamiento(String nombre,String direccion){
        this.nombre=nombre;
        this.direccion=direccion;
        this.apertura="8:00";
        this.cierre="21:00";
        this.piso=5;
        this.plaza=10;       
        this.inicializarAutos();
    }

    public Estacionamiento(String nombre, String direccion, String apertura, String cierre, int piso, int plaza) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.apertura = apertura;
        this.cierre = cierre;
        this.piso = piso;
        this.plaza = plaza;
        this.inicializarAutos();
    }
    
    public void inicializarAutos(){
        this.a=new Auto[this.getPiso()][this.getPlaza()];
        for(int i=0;i<this.getPiso();i++){
            for(int j=0;j<this.getPlaza();j++)
                this.a[i][j]=null;//Preguntar
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getApertura() {
        return apertura;
    }

    public void setApertura(String apertura) {
        this.apertura = apertura;
    }

    public String getCierre() {
        return cierre;
    }

    public void setCierre(String cierre) {
        this.cierre = cierre;
    }

    public int getPiso() {
        return piso;
    }

    public int getPlaza() {
        return plaza;
    }
    
    public void registrarAuto(int X, int Y,Auto auto){
        this.a[X-1][Y-1]=auto;
    }
    
    public String retornarPosicion(String patente){
        String aux="Auto inexistente";
        boolean esta=false;
        int i=0;
        while((i<this.getPiso()&&!(esta))){
            int j=0;
            while((j<this.getPlaza())&&!(esta)){
                if(patente.equals(this.a[i][j].getPatente())){
                    esta=true;
                    aux="El auto de patente "+patente+" se encuentra en la piso "+(i+1)+", plaza "+(j+1);
                }else
                    j++;
            }
            i++;
        }
        return aux;
    }
    
    public String toString(){
        String aux="";
        for (int i = 0; i < this.getPiso(); i++) {
            for (int j = 0; j < this.getPlaza(); j++) {
                aux+="Plaza "+(i+1)+
                     ". Piso "+(j+1)+": ";
                if(this.a[i][j]==null)
                    aux+="Libre";
                else
                    aux+=this.a[i][j].toString();
                aux+="\n";
            }    
        }
        return aux;
    }
    
    
    public int contarPlaza(int Y){
        int suma=0;
        for(int i=0;i<this.getPiso();i++){
            if(this.a[i][Y-1]!=null)
                suma++;
        }
        return suma;
    }
}
