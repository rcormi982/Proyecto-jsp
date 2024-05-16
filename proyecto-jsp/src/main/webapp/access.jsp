<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="users.User"%>
<%@ page import="users.AuthService"%>
<%@ page import="league.League" %>
<%@ page import="league.LeagueService" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liga de Baloncesto Infantil Masculino</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .text-white {
            color: orange !important;
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
<body class="d-flex flex-column">
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        User user = (User) session.getAttribute("user");
    
        String bdusuario = "rocio";
        String bdcontrasenia = "1234";

        if (user != null) {
            ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", bdusuario, bdcontrasenia);
            LeagueService jornada = new LeagueService(pool.getConnection());
            ArrayList<League> list = jornada.requestAll("");
    %>
    <header class="bg-success text-warning py-4">
        <div class="container">
            <h1 class="display-5 fw-bold" style="color: yellow !important;">LIGA DE BALONCESTO INFANTIL MASCULINO</h1>
        </div>
    </header>

    <div class="container-fluid">
        <div class="row">
            <nav class="col-lg-2 navbar navbar-expand-lg navbar-light bg-light flex-column" style="width: 160px;">
                <a class="navbar-brand d-block mx-auto" href="#">
                    <img src="assets/brand/logo.jpg" alt="" width="80" height="90">
                </a>
                <p class="text-white"><i class="bi bi-person-fill"></i> <strong>Usuario: admin</strong></p>
                <a class="btn add-jornada-btn mt-3 mb-3" href="home.jsp">Agregar Jornada</a>
                <a class="btn add-jornada-btn mt-3 mb-3" href="update.jsp">Modificar Jornada</a>
                <a class="btn add-jornada-btn mt-3 mb-3" href="view.jsp">Ver Comentarios</a>
                <a class="btn add-jornada-btn mt-3 mb-3" href="logout.jsp">Cerrar Sesión</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>

            <main role="main" class="col-lg-10">
                <main class="container mt-5">
                    <h1 style="font-weight: bold;">LISTADO DE JORNADAS</h1>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">JORNADA</th>
                                    <th scope="col">EQUIPOS</th>
                                    <th scope="col">LUGAR</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">HORA</th>
                                    <th scope="col">RESULTADO</th>
                                </tr>
                            </thead>
                            <tbody class="medium-font">
                                <% 
                                   if (list != null && !list.isEmpty()) {
                                        for(int i = 0; i < list.size(); i++) {
                                            League league = list.get(i);
                                            java.sql.Date fecha = league.getFecha();
                                            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                                            String fechaFormateada = sdf.format(fecha);
                                %>
                                    <tr>
                                        <td><%= league.getJornada() %></td>
                                        <td><%= league.getEquipos() %></td>
                                        <td><%= league.getLugar() %></td>
                                        <td><%= fechaFormateada %></td>
                                        <td><%= league.getHora() %></td>
                                        <td><%= league.getResultado() %></td>
                                    </tr>
                                <%  }
                                   } 
                                %>
                            </tbody>
                        </table>
                    </div>
                </main>
            </main>
        </div>
    </div>
    <% } else { %>
        <%
            session.setAttribute("errorMessage", "Credenciales incorrectas. Por favor, inténtalo de nuevo.");
            response.sendRedirect("index.jsp");
        %>
    <% } %>
    <footer class="footer py-3 bg-light text-center mt-auto">
        <div class="container">
            <span class="text-muted" style="font-weight: bold;">© 2024 Rocío Corbacho Millán</span>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
