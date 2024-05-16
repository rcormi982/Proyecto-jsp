package users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AuthService implements AuthInterface{
    Connection conn = null;

    public AuthService(Connection conn){
        this.conn = conn;
    }

    public AuthService(){

    }
    
    @Override
    public User login(String usuario, String contrasenia) throws SQLException{
        //Varible conteniendo el Individuo a devolver
        User result = null;
        //Construimos la consulta a realizar
        Statement statement = this.conn.createStatement();    
        String sql = String.format("SELECT id, nombre, apellidos FROM usuarios WHERE usuario='%s' AND contraseña='%s'", usuario, contrasenia);
        // Ejecución de la consulta
        ResultSet querySet = statement.executeQuery(sql);
        // Recorrido del resultado de la consulta
        if(querySet.next()) {
            //Obtenemos los datos del Individuo
            long id = querySet.getLong("id");
            String nombre = querySet.getString("nombre");
            String apellidos = querySet.getString("apellidos");
            result = new User(id, nombre, apellidos, usuario);
        }
        //Cerramos la consulta
        statement.close();    
        //Devolvemos el individuo
        return result;
    }

    @Override
    public User register(String nombre, String apellidos, String usuario, String contrasenia) throws SQLException {
         
         Statement statement = this.conn.createStatement();    
         String sql = String.format("INSERT INTO usuarios (nombre, apellidos, usuario, contraseña) VALUES ('%s', '%s', '%s', '%s')",nombre, apellidos, usuario, contrasenia);
         // Ejecución de la consulta
         int affectedRows = statement.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS);
         if (affectedRows == 0) {
             // Devolvemos una excepción si no se ha creado el individuo
             throw new SQLException("Creating user failed, no rows affected.");
         }
 
         //Aquí llegaremos si se ha creado satisfactoriamente el individuo
         try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
             if (generatedKeys.next()) {
                 //Devolvemos el identificador del individuo creado
                 long id = generatedKeys.getLong(1);
                 statement.close();
                 return new User(id, nombre, apellidos, usuario);
             }
             else {
                 //Aquí detectamos que hemos perdido conexión con el servidor de la
                 //base de datos y devolvemos una excepción
                 statement.close();
                 throw new SQLException("Creating user failed, no ID obtained.");
             }
         }
    }
}
