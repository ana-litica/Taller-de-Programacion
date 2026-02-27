package Practica4;

public class Zona {
    private String localidad,partido,provincia;

    public Zona(String localidad, String partido, String provincia) {
        this.localidad = localidad;
        this.partido = partido;
        this.provincia = provincia;
    }


    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getPartido() {
        return partido;
    }

    public void setPartido(String partido) {
        this.partido = partido;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }
    
    public String toString(){
        return this.getLocalidad()+"-"+
                this.getPartido()+"-"+
                this.getProvincia();
    }
}
