package league;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;

import crud.CRUD;

public class LeagueService implements CRUD<League>{
    
    Connection conn;

    public LeagueService(Connection conn){
        this.conn = conn;
    }
    @Override
    public League requestByJornada(long jornada) throws SQLException {
        Statement statement = null;
        League result = null;
        statement = this.conn.createStatement();
        String sql = String.format("SELECT * FROM partidos WHERE jornada=%d", jornada);
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            String equipos = querySet.getString("equipos");
            String lugar = querySet.getString("lugar");
            Date fecha = querySet.getDate("fecha");
            String hora = querySet.getString("hora");
            String resultado = querySet.getString("resultado");

            result = new League(jornada, equipos, lugar, fecha, hora, resultado);  
        }
        statement.close();
        return result;
    }

    @Override
    public ArrayList<League> _requestAll(String sql) throws SQLException {

        ArrayList<League> result = new ArrayList<League>();
        Statement statement = this.conn.createStatement();   
        ResultSet querySet = statement.executeQuery(sql);
        // Recorremos cada uno de los registro devueltos por la consulta
        while(querySet.next()) {
            //Obtenemos los datos de la jornada
            long jornada = querySet.getLong("jornada");
            String equipos = querySet.getString("equipos");
            String lugar = querySet.getString("lugar");
            Date fecha = querySet.getDate("fecha");
            String hora = querySet.getString("hora");
            String resultado = querySet.getString("resultado");

            result.add(new League(jornada, equipos, lugar, fecha, hora, resultado));
        } 
        statement.close();

        //Devolvemos el array de jornadas
        return result;
    }

    
    @Override
    public ArrayList<League> requestAll(String sortedBy) throws SQLException {
        String sql = "SELECT * FROM partidos"+(sortedBy.length()>0?(" ORDER BY "+sortedBy):"");
        return this._requestAll(sql);
    }

    @Override
    public League create(long jornada, String equipos, String lugar, Date fecha, String hora, String resultado) throws SQLException {
        Statement statement = this.conn.createStatement();    
        String sql = String.format("INSERT INTO partidos (jornada, equipos, lugar, fecha, hora, resultado) VALUES (%d, '%s', '%s', '%s', '%s', '%s')", jornada, equipos, lugar, fecha, hora, resultado);
        int affectedRows = statement.executeUpdate(sql);    
        if (affectedRows == 0) {
            throw new SQLException("Creating user failed, no rows affected.");
        }
        statement.close();
        return new League(jornada, equipos, lugar, fecha, hora, resultado);
    }

    @Override
    public int update(League object) throws SQLException {

        long jornada = object.getJornada();
        String equipos = object.getEquipos();
        String lugar = object.getLugar();
        Date fecha = object.getFecha();   
        String hora = object.getHora();
        String resultado = object.getResultado();
        //Creamos la consulta
        Statement statement = this.conn.createStatement(); 

        String sql = String.format("UPDATE partidos SET equipos = '%s', lugar = '%s', fecha = '%s', hora = '%s', resultado = '%s' WHERE jornada=%d",
                                    equipos, lugar, fecha, hora, resultado, jornada);
        // Ejecución de la consulta
        int affectedRows = statement.executeUpdate(sql);
        //Cerramos la consulta
        statement.close();
        //Devolvemos excepción si ha habido un error
        if (affectedRows == 0)
            throw new SQLException("Creating user failed, no rows affected.");
        else
            return affectedRows;
    }
    
    @Override
    public boolean delete(long jornada) throws SQLException {
        Statement statement = null;
        statement = this.conn.createStatement();
        String sql = String.format("DELETE FROM partidos WHERE jornada=%d", jornada);
        int result = statement.executeUpdate(sql);
        statement.close();
        return result == 1;
    }
}
