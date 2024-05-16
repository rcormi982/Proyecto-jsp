<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="users.User"%>
<%@ page import="users.UserService"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro Usuarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<header>
    <div class="container d-flex justify-content-between align-items-center">
        <a href="javascript:history.back()" class="btn btn-primary"><span style="font-weight: bold;">
            <i class="fas fa-arrow-alt-circle-left fa-lg"></i> Volver
        </span></a>
        <h1 class="text-center flex-grow-1" style="font-weight: bold;">REGISTRO USUARIOS</h1>
        <div style="width: 90px;"></div><!-- Espacio para ajustar alineación -->
    </div>
</header>
<div class="container">
    <% 
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
    <form method="post" action="doregistration.jsp" class="py-3 px-4 rounded">
        <div class="mb-3">
            <label for="nombre" class="form-label"><span style="font-weight: bold;">Nombre</span></label>
            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ej: Sergio" required>
        </div>
        <div class="mb-3">
            <label for="lugar" class="form-label"><span style="font-weight: bold;">Apellidos</span></label>
            <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Ej: González" required>
        </div>
        <div class="mb-3">
            <label for="lugar" class="form-label"><span style="font-weight: bold;">Usuario</span></label>
            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ej: sergon" required>
            <% 
            // Verificar si el usuario ya existe
            String usuarioExiste = request.getParameter("error");
            if (usuarioExiste != null && usuarioExiste.equals("usuarioExistente")) { 
            %>
            <div class="alert alert-danger mt-2" role="alert">
                El usuario ya existe. Por favor, inténtelo con otro nombre de usuario.
            </div>
            <% } %>
        </div>
        <div class="mb-3">
            <label for="lugar" class="form-label"><span style="font-weight: bold;">Contraseña</span></label>
            <input type="password" class="form-control" id="contrasenia" name="contrasenia" placeholder="Ej: abcd" required>
        </div>
        <div class="mb-3">
            <label for="lugar" class="form-label"><span style="font-weight: bold;">Repetir contraseña</span></label>
            <input type="password" class="form-control" id="confirmContrasenia" name="confirmContrasenia" placeholder="abcd" required>
            <%
              User user = (User)session.getAttribute("user");
              if(user!=null)
                response.sendRedirect("home.jsp");
              else{
                String error = request.getParameter("error");
                if (error != null && error.equals("contrasenia")) {
                   %>
            <div class="alert alert-danger mt-2" role="alert">
                Las contraseñas no coinciden. Por favor, inténtelo de nuevo.
            </div>
            <% }
             } %>
        </div>
        <div class="row">
            <div class="col">
                <button type="submit" class="btn btn-primary"><span style="font-weight: bold;">Regístrarme</span></button>
            </div>
        </div>
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
