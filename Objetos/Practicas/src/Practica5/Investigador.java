package Practica5;

public class Investigador {
    private String nombre,especialidad;
    private int categoria;
    private int cantSubsidios,maxSubsidios=5;
    private Subsidio[]s;

    public Investigador(String nombre, String especialidad, int categoria) {
        this.nombre = nombre;
        this.especialidad = especialidad;
        this.categoria = categoria;
        this.cantSubsidios=0;
        this.s=new Subsidio[this.maxSubsidios];
        for(int i=0;i<this.maxSubsidios;i++)
            s[i]=null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }

    public int getMaxSubsidios() {
        return maxSubsidios;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(this.cantSubsidios<this.maxSubsidios){
            this.s[this.cantSubsidios]=unSubsidio;
            this.cantSubsidios++;
        }
    }
    
    public double sumarMonto(){
        double suma=0;
        for(int i=0;i<this.cantSubsidios;i++)
            suma+=this.s[i].getMonto();
        return suma;
    }
    
    public void otorgarTodos(String nombre_completo){
        for(int i=0;i<this.cantSubsidios;i++){
            if(!this.s[i].isOtorgado()){
                this.s[i].setOtorgado(true);
            }
        }
    }
    
    public String toString(){
        return "Nombre: "+this.getNombre()+
                ". Categoria: "+this.getCategoria()+
                ". Especialidad: "+this.getEspecialidad()+
                ". Monto total de subsidios: "+this.sumarMonto();
    }
}
