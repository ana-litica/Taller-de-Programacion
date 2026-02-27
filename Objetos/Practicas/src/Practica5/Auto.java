package Practica5;

public class Auto {
    private String dueño,patente;

    public Auto(String dueño, String patente) {
        this.dueño = dueño;
        this.patente = patente;
    }
    
    /*public Auto(){
        
    }*/

    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public String toString(){
        return "Dueño del auto: "+this.getDueño()+
                ". Patente: "+this.getPatente();
    }
}
