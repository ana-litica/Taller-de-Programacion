package Practica3;

public class Autor {
    private String nombre;
    private String biografia;
    private String Origen;

    public Autor(String nombre, String biografia, String Origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.Origen = Origen;
    }   

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return Origen;
    }

    public void setOrigen(String Origen) {
        this.Origen = Origen;
    }
    
    @Override
    public String toString(){
        String aux="Nombre: "+this.nombre+
            ". Biografia: "+this.biografia+
            ". Origen: "+this.Origen;
        return aux;
    }
}
