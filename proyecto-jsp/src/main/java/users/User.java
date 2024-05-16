package users;

public class User {
    private long id;
    private String nombre;
    private String apellidos;
    private String usuario;
    private String contrasenia;

    public User(long id, String nombre, String apellidos, String usuario){
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.usuario = usuario;
    }
    public User(String nombre, String contrasenia) {
        this.nombre = nombre;
        this.contrasenia = contrasenia;
    }

    public User(){

    }

    public long getId() {
        return id;
    }
    
    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getUsuario() {
        return usuario;
    }
    public String getContrasenia() {
        return contrasenia;
    }

    @Override
    public String toString() {
        return String.format("%s %s (%s)",getNombre(), getApellidos(), getUsuario());
    }
}

