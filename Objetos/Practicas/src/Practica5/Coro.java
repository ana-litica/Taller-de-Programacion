package Practica5;
// No encontré el main de este ejercicio

public abstract class Coro {
    private String nombre;
    private Director d;
    
    
    public Coro(String nombre, Director d){
        this.setNombre(nombre);
        this.setD(d);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getD() {
        return d;
    }

    public void setD(Director d) {
        this.d = d;
    }

    
    public abstract void agregarCorista(Corista cor);
    public abstract boolean estaLleno();
    
    public abstract boolean bienFormado();
    
}
