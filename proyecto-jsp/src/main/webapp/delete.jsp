<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="league.LeagueService" %>
<%@ page import="league.League" %>
<%@ page import="java.sql.SQLException" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String user = "rocio";
    String password = "1234";

    try {
        long jornada= Long.parseLong(request.getParameter("jornada"));
        
        ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", user, password);
        LeagueService jornadaService = new LeagueService(pool.getConnection());
        
        boolean borrado = jornadaService.delete(jornada);
        
        if (borrado) {
    %>
    <script>
        alert("Se ha eliminado la jornada correctamente");
        window.location.href = "access.jsp";
    </script>
    <%
        } else {
    %>
    <script>
        alert("No se pudo eliminar la jornada");
        window.location.href = "index.jsp";
    </script>
    <%
        }
    } catch (NumberFormatException e) {
        out.println("Error: No se proporcionó una jornada válida.");
    } catch (SQLException e) {
        out.println("Error SQL: " + e.getMessage());
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
