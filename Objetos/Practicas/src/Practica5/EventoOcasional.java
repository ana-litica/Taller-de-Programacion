package Practica5;

public class EventoOcasional extends Recital{
      private String contratante,motivo;
    private int dia;

    public EventoOcasional(String banda,int tem,String motivo,String contratante, int dia){
        super(banda,tem);
        this.motivo=motivo;
        this.contratante=contratante;
        this.dia=dia;
    }
    
    public String getContratante() {
        return contratante;
    }

    public String getMotivo() {
        return motivo;
    }

    public int getDia() {
        return dia;
    }

    public String actuar(){
        String aux="";
        if("a beneficiencia".equals(this.getMotivo()))
            aux+="Recuerden colaborar con "+this.getContratante();
        else{
            if("show de TV".equals(this.getMotivo()))
                aux+="Saludos amigos televidentes.";
            else
                aux+="Un feliz cumpleaños para "+this.getContratante();
        }
        aux+=super.anunciarTemas();
        return aux;
    }
    
    public double calcularCosto(){
        double costo;
        if("a beneficiencia".equals(this.getMotivo()))
            costo=0;
        else{
            if("show de TV".equals(this.getMotivo()))
                costo=50000;
            else
                costo=30000;
        }
        return costo;
    }
}
