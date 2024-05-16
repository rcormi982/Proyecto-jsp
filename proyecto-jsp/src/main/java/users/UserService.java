package users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import comments.Comments;


public class UserService {

    Connection conn;
    public UserService(Connection conn){
        this.conn = conn;
    }
    
    public UserService(){
        
    }
  
    private ArrayList<User> _requestAll(String sql) throws SQLException{
        ArrayList<User> result = new ArrayList<User>();
        Statement statement = this.conn.createStatement();   
        ResultSet querySet = statement.executeQuery(sql);

        while(querySet.next()) {
            int id = querySet.getInt("id");
            String nombre = querySet.getString("nombre");
            String apellidos = querySet.getString("apellidos");
            String usuario = querySet.getString("usuario");
            result.add(new User(id, nombre, apellidos, usuario));
        } 
        statement.close();

        return result;
    }

    public ArrayList<User> requestAll(String sortedBy) throws SQLException{
        String sql = "SELECT id, nombre, apellidos, usuario FROM usuarios"+(sortedBy.length()>0?(" ORDER BY "+sortedBy):"");
        return this._requestAll(sql);
    }

    public User requestById(long id) throws SQLException {

        User user = null;
        Statement statement = this.conn.createStatement();   
        String sql = String.format("SELECT id, nombre, apellidos, usuario FROM usuarios WHERE id=%d", id);
        ResultSet querySet = statement.executeQuery(sql);

        while(querySet.next()) {
            String nombre = querySet.getString("nombre");
            String apellidos = querySet.getString("apellidos");
            String usuario = querySet.getString("usuario");

            user = new User(id, nombre, apellidos, usuario);
        } 
        statement.close();
        return user;
    }    

    public long create(User model) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    public int update(User object) throws SQLException {
        //Obtenemos los datos del individuo para actualizar
        //en la base de datos
        long id = object.getId();
        String nombre = object.getNombre();
        String apellidos = object.getApellidos();
        //Creamos la consulta
        Statement statement = this.conn.createStatement(); 

        String sql = String.format("UPDATE usuarios SET nombre = '%s', apellidos = '%s' WHERE id=%d", nombre, apellidos, id);
        // Ejecución de la consulta
        int affectedRows = statement.executeUpdate(sql);
        //Cerramos la consulta
        statement.close();
        //Devolvemos excepción si ha habido un error
        //o si no se ha actualizado ningún registro
        //y en caso contrario devolvemos el número de
        //registros que se han actualizado
        if (affectedRows == 0)
            throw new SQLException("Creating user failed, no rows affected.");
        else
            return affectedRows;
    }

    public boolean delete(long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }

    public boolean userExists(String usuario) throws SQLException {
        Statement statement = this.conn.createStatement();
        String sql = String.format("SELECT * FROM usuarios WHERE usuario='%s'", usuario);
        ResultSet querySet = statement.executeQuery(sql);
        boolean exists = querySet.next();
        statement.close();
        return exists;
    }

    public boolean isAdmin(String usuario) throws SQLException {
        Statement statement = this.conn.createStatement();
        String sql = String.format("SELECT es_administrador FROM usuarios WHERE usuario='%s'", usuario);
        ResultSet querySet = statement.executeQuery(sql);
        boolean esAdministrador = false;
        if (querySet.next()) {
            esAdministrador = querySet.getBoolean("es_administrador");
        }
        
        statement.close();
        return esAdministrador;
    }

}
