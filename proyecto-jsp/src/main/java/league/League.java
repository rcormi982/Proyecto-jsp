package league;

import java.sql.Date;

public class League {

    private long jornada;
    private String equipos;
    private String lugar;
    private Date fecha;
    private String hora;
    private String resultado;

    public League(long jornada, String equipos, String lugar, Date fecha, String hora, String resultado) {
        this.jornada = jornada;
        this.equipos = equipos;
        this.lugar = lugar;
        this.fecha = fecha;
        this.hora = hora;
        this.resultado = resultado;
    }

    public long getJornada() {
        return jornada;
    }

    public void setJornada(long jornada) {
        this.jornada = jornada;
    }

    public String getEquipos() {
        return equipos;
    }

    public void setEquipos(String equipos) {
        this.equipos = equipos;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }


    public String getResultado() {
        return resultado;
    }
    
    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    @Override
    public String toString() {
        return String.format("<tr>" +
                                "<td>%d</td>" +
                                "<td>%s</td>" +
                                "<td>%s</td>" +
                                "<td>%s</td>" +
                                "<td>%s</td>" +
                                "<td>%s</td>" +
                            "</tr>", getJornada(), getEquipos(), getLugar(), getFecha(), getHora(), getResultado());
    }
}
