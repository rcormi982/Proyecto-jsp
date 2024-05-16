<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="users.AuthService"%>
<%@ page import="users.User"%>
<%@ page import="users.UserService"%>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body {
            background-image: url('assets/brand/Liga4.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: rgba(255, 255, 255, 100);
        }
        body::after {
            content: "";
            background-color: rgba(255, 255, 255, 0.5); /* Color blanco con opacidad del 50% */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Asegura que esté detrás de todo */
        }
        .custom-container {
            max-width: 400px;
            margin: 0 auto;
            background-color: white;
            padding: 20px; /* Espacio de relleno dentro del contenedor del formulario */
            border-radius: 8px; /* Bordes redondeados para el contenedor del formulario */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra suave para el contenedor del formulario */
        }
        h3{
            color: royalblue;
            text-align: center;
        }
    </style>
</head>
<body class="d-flex flex-column">
    <%
    // Verificar si el usuario ya está autenticado
    User user = (User) session.getAttribute("user");

    // Si el usuario ya está autenticado, redirigirlo a la página correspondiente
    if (user != null) {
        UserService userService = new UserService();
        try {
            if (userService.isAdmin(user.getUsuario())) {
                response.sendRedirect("access.jsp");
            } else {
                response.sendRedirect("accessuser.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error al procesar la solicitud. Por favor, inténtalo de nuevo más tarde.");
            response.sendRedirect("index.jsp");
        }
        return;
    }

    // Si el usuario no está autenticado y se están enviando credenciales, intentar autenticarlo
    if (request.getParameter("usuario") != null && request.getParameter("contrasenia") != null) {
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");

        String bdusuario = "rocio";
        String bdcontrasenia = "1234";

        try {
            ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", bdusuario, bdcontrasenia);
            AuthService authService = new AuthService(pool.getConnection());
            UserService userService = new UserService(pool.getConnection()); // Crear una instancia de UserService
            User userAuten = authService.login(usuario, contrasenia);

            if (userAuten != null) {
                session.setAttribute("user", userAuten);
                if (userService.isAdmin(usuario)) {
                    response.sendRedirect("access.jsp");
                } else {
                    response.sendRedirect("accessuser.jsp");
                }
                return;
            } else {
                response.sendRedirect("index.jsp?error=Nombre de usuario o contraseña incorrectos");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error al procesar la solicitud. Por favor, inténtalo de nuevo más tarde.");
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
    <div class="container custom-container mt-5">
        <h3 class="text-center mb-4"><span style="font-weight: bold;">ACCESO A BASE DE DATOS</span></h3>
            <div class = "text-center">
                <img src="assets/brand/logo.jpg" alt="" width="80" height="90" style="margin-bottom: 20px;">
            </div>
        <form method="post" action="index.jsp">
            <div class="mb-3">
                <label for="usuario" class="form-label">Nombre de usuario:</label>
                <input type="text" class="form-control" id="usuario" name="usuario" required>
            </div>
            <div class="mb-3">
                <label for="contrasenia" class="form-label">Contraseña:</label>
                <input type="password" class="form-control" id="contrasenia" name="contrasenia" required>
            </div>
            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
            <div class="mt-3">
                <% String error = request.getParameter("error");
                    if (error != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= error %>
                    </div>
                <% } %>
            </div>
            <p class="mt-3 mb-0">¿No estás registrado? <a href="register.jsp">Regístrate aquí</a></p>
        </form>
    </div>
    <footer class="footer py-3 bg-light text-center mt-auto">
        <div class="container">
            <span class="text-muted" style="font-weight: bold;">© 2024 Rocío Corbacho Millán</span>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
