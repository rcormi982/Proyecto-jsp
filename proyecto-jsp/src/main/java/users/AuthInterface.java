package users;

import java.sql.SQLException;

public interface AuthInterface {
    public User login(String usuario, String contrasenia) throws SQLException;
    public User register(String nombre, String apellidos, String usuario, String contrasenia) throws SQLException;
}