package crud;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import league.League;

public interface CRUD<T> {

    public ArrayList<T> _requestAll(String sql) throws SQLException;
    public ArrayList<T> requestAll(String sortedBy) throws SQLException;
    public League create(long jornada, String equipos, String lugar, Date fecha, String hora, String resultado) throws SQLException;
    public int update(T object) throws SQLException;
    public boolean delete(long id) throws SQLException;
    public League requestByJornada(long jornada) throws SQLException;

}
