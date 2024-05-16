<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="connectionpool.ConnectionPool" %>
<%@ page import="comments.Comments" %>
<%@ page import="comments.CommentsService" %>
<%@ page import="users.User" %>
<%@ page import="users.UserService" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comentarios de la Jornada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body {
            background-image: url('assets/brand/pista3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: rgba(255, 255, 255, 100);
        }
        body::after {
            content: "";
            background-color: rgba(255, 255, 255, 0.6); /* Color blanco con opacidad del 50% */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Asegura que esté detrás de todo */
        }
    </style>
</head>
<body class="d-flex flex-column">
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // Obtener el ID de la jornada seleccionada
    long partido_jornada = Long.parseLong(request.getParameter("jornada"));

    String dbusuario = "rocio";
    String dbcontrasenia = "1234";
    ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", dbusuario, dbcontrasenia);

    try {
        CommentsService commentsService = new CommentsService(pool.getConnection());
        UserService usuario = new UserService(pool.getConnection());

        // Obtener los comentarios de la jornada seleccionada
        ArrayList<Comments> comentarios = commentsService.requestById(partido_jornada);
%>
<header>
    <div class="container d-flex justify-content-between align-items-center">
        <a href="javascript:history.back()" class="btn btn-primary"><span style="font-weight: bold;">
            <i class="fas fa-arrow-alt-circle-left fa-lg"></i> Volver
        </span></a>
        <h1 class="text-center flex-grow-1"><span style="font-weight: bold;">COMENTARIOS DE LA JORNADA</span></h1>
        <div style="width: 90px;"></div><!-- Espacio para ajustar alineación -->
    </div>
</header>

<div class="container-fluid">
    <div class="row justify-content-center">
        <main role="main" class="col-lg-10">
            <main class="container mt-5">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">USUARIO ID</th>
                                <th scope="col">USUARIO</th>
                                <th scope="col">COMENTARIOS</th>
                            </tr>
                        </thead>
                        <tbody class="medium-font">
                            <% 
                            for (Comments comment : comentarios) { 
                                // Obtener el nombre de usuario correspondiente al usuario_id
                                User user = usuario.requestById(comment.getUsuario_id());
                            %>
                            <tr>
                                <td><%= comment.getUsuario_id() %></td>
                                <td><%= user.getUsuario() %></td>
                                <td><%= comment.getComentarios() %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </main>
        </main>
    </div>
</div>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<footer class="footer py-3 bg-light text-center mt-auto">
    <div class="container">
        <span class="text-muted" span style="font-weight: bold;">© 2024 Rocío Corbacho Millán</span>
    </div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
