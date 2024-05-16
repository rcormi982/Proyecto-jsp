package comments;

public class Comments {
    private long id;
    private long partido_jornada;
    private long usuario_id;
    private String comentarios;

    
    public Comments(long id, long partido_jornada, long usuario_id, String comentarios) {
        this.id = id;
        this.partido_jornada = partido_jornada;
        this.usuario_id = usuario_id;
        this.comentarios = comentarios;
    }

    public Comments(long usuario_id2, String comentarios2) {
        this.usuario_id = usuario_id2;
        this.comentarios = comentarios2;
    }

    public long getId(){
        return id;
    }

    public long getPartido_jornada(){
        return partido_jornada;
    }

    public long getUsuario_id() {
        return usuario_id;
    }

    public String getComentarios() {
        return comentarios;
    }
    
    @Override
    public String toString() {
        return String.format("%d %d %d %s", getId(), getPartido_jornada(), getUsuario_id(), getComentarios());
    }

}
