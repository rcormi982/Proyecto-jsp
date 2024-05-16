package comments;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CommentsInterface {
    public Comments create(long partido_jornada, long usuario_id, String comentarios) throws SQLException;
    public ArrayList<Comments> requestById(long partido_jornada) throws SQLException;
}
