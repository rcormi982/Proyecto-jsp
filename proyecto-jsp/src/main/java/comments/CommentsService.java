package comments;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class CommentsService implements CommentsInterface {
    Connection conn = null;

    public CommentsService(Connection conn){
        this.conn = conn;
    }

    @Override
    public Comments create(long partido_jornada, long usuario_id, String comentarios) throws SQLException {
        Statement statement = this.conn.createStatement();    
        String sql = String.format("INSERT INTO comentarios (partido_jornada, usuario_id, comentarios) VALUES (%d, %d, '%s')", partido_jornada, usuario_id, comentarios);
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
                 return new Comments(id, partido_jornada, usuario_id, comentarios);
            }else {
                 statement.close();
                 throw new SQLException("Creating user failed, no ID obtained.");
             }
         }
    }

    @Override
    public ArrayList<Comments> requestById(long partido_jornada) throws SQLException {

        ArrayList<Comments> result = new ArrayList<Comments>();
        Statement statement = this.conn.createStatement();   
        String sql = String.format("SELECT usuario_id, comentarios FROM comentarios WHERE partido_jornada=%d", partido_jornada);
        ResultSet querySet = statement.executeQuery(sql);

        // Recorremos cada uno de los registro devueltos por la consulta
        while(querySet.next()) {
            //Obtenemos los comentarios de la jornada
            long usuario_id = querySet.getLong("usuario_id");
            String comentarios = querySet.getString("comentarios");
            
            result.add(new Comments(usuario_id, comentarios));
        } 
        statement.close();
        //Devolvemos el array de comentarios
        return result;
    }    
}    
