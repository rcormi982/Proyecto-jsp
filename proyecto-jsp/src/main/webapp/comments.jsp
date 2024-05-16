<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="users.User" %>
<%@ page import="comments.CommentsService" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Comentarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex: 1;
        }
        .footer {
            flex-shrink: 0;
        }
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
<body>
<header>
        <div class="container d-flex justify-content-between align-items-center">
            <a href="javascript:history.back()" class="btn btn-primary"><span style="font-weight: bold;">
                <i class="fas fa-arrow-alt-circle-left fa-lg"></i> Volver
            </span></a>
            <h1 class="text-center flex-grow-1"><span style="font-weight: bold;">AGREGAR COMENTARIOS</span></h1>
            <div style="width: 60px;"></div><!-- Espacio para ajustar alineación -->
        </div>
    </header>
<div class="container">
    <% 
    // Verificar si el usuario está autenticado
    User user = (User) session.getAttribute("user");

    // Obtener la jornada
    String jornada = request.getParameter("jornada");
    if (user != null) {
    %>
    <form method="post" action="add_comments.jsp" class="py-3 px-4 rounded">
        <input type="hidden" name="userId" value="<%= user.getId() %>">
        <input type="hidden" name="jornada" value="<%= jornada %>">
        <div class="mb-3">
            <label for="comentarios" class="form-label"><span style="font-weight: bold;">Comentarios:</span></label>
            <textarea class="form-control" id="comentarios" name="comentarios" rows="6" placeholder="Escribe tus comentarios aquí" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary"><span style="font-weight: bold;">Agregar Comentario</span></button>
    </form>
    <% } else { %>
    <div class="alert alert-danger" role="alert">
        Debes iniciar sesión para agregar comentarios.
    </div>
    <a class="btn btn-primary" href="index.jsp"><span style="font-weight: bold;">Iniciar Sesión</span></a>
    <% } %>
</div>

<footer class="footer py-3 bg-light text-center">
    <div class="container">
        <span class="text-muted" span style="font-weight: bold;">© 2024 Rocío Corbacho Millán</span>
    </div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
