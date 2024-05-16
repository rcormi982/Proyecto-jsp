<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="league.LeagueService" %>
<%@ page import="league.League" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String user = "rocio";
    String password = "1234";

    try {
        long jornadaId = Long.parseLong(request.getParameter("jornadaId"));
        String equipos = request.getParameter("equipos");
        String lugar = request.getParameter("lugar");
        String fechaString = request.getParameter("fecha");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date fechaUtil = sdf.parse(fechaString);
        java.sql.Date fechaSql = new java.sql.Date(fechaUtil.getTime()); // Convertir a java.sql.Date
        String hora = request.getParameter("hora");
        String resultado = request.getParameter("resultado");

        ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", user, password);
        LeagueService jornadaService = new LeagueService(pool.getConnection());
        League jornada = jornadaService.requestByJornada(jornadaId);
        jornada.setEquipos(equipos);
        jornada.setLugar(lugar);
        jornada.setFecha(fechaSql);
        jornada.setHora(hora);
        jornada.setResultado(resultado);

        int updateResultado = jornadaService.update(jornada);

        if (updateResultado == 1) {
%>
    <script>
        alert("Se ha modificado la jornada correctamente");
        window.location.href = "access.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("No se pudo actualizar la jornada en la base de datos");
        window.location.href = "access.jsp";
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
