<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="connectionpool.ConnectionPool" %>
<%@ page import="users.User" %>
<%@ page import="comments.CommentsService" %>
<%@ page import="comments.Comments" %>
<%@ page import="java.sql.SQLException" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("index.jsp");
    } else {
        // Obtener el ID del usuario que inició sesión
        long userId = user.getId();

        // Obtener parámetros del formulario
        String comentarios = request.getParameter("comentarios");
        long partido_jornada = Long.parseLong(request.getParameter("jornada"));

        String dbusuario = "rocio";
        String dbcontrasenia = "1234";
        ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", dbusuario, dbcontrasenia);
        try {
            CommentsService commentsService = new CommentsService(pool.getConnection());

            // Agregar el comentario a la jornada seleccionada
            Comments comments = commentsService.create(partido_jornada, userId, comentarios);

            %>
            <script>
                alert("Comentario agregado correctamente");
                window.location.href = "accessuser.jsp";
            </script>
            <%
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
%>
