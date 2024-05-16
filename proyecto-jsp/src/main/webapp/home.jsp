<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="connectionpool.ConnectionPool" %>
<%@ page import="league.LeagueService" %>
<%@ page import="league.League" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Jornada</title>
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
        .alert-danger {
            color: #721c24;
            background-color: #ffcccc;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>
    <header>
        <div class="container d-flex justify-content-between align-items-center">
            <a href="javascript:history.back()" class="btn btn-primary"><span style="font-weight: bold;">
                <i class="fas fa-arrow-alt-circle-left fa-lg"></i> Volver
            </span></a>
            <h1 class="text-center flex-grow-1"><span style="font-weight: bold;">AGREGAR JORNADA</span></h1>
            <div style="width: 60px;"></div><!-- Espacio para ajustar alineación -->
        </div>
    </header>
    <div class="container">
        <form method="post" action="home.jsp" class="py-3 px-4 rounded">
            <div class="mb-3">
                <label for="equipos" class="form-label"><span style="font-weight: bold;">Jornada:</span></label>
                <input type="number" class="form-control" id="jornada" name="jornada" required min="1">
            </div>
            <div class="mb-3">
                <label for="equipos" class="form-label"><span style="font-weight: bold;">Equipos:</span></label>
                <input type="text" class="form-control" id="equipos" name="equipos" required>
            </div>
            <div class="mb-3">
                <label for="lugar" class="form-label"><span style="font-weight: bold;">Lugar:</span></label>
                <input type="text" class="form-control" id="lugar" name="lugar" required>
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="fecha" class="form-label"><span style="font-weight: bold;">Fecha:</span></label>
                        <input type="date" class="form-control" id="fecha" name="fecha" placeholder="dd/mm/yyyy" required pattern="\d{2}/\d{2}/\d{4}">
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label for="hora" class="form-label"><span style="font-weight: bold;">Hora:</span></label>
                        <input type="time" class="form-control" id="hora" name="hora" placeholder="hh:mm" required>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label for="resultado" class="form-label"><span style="font-weight: bold;">Resultado:</span></label>
                <input type="text" class="form-control" id="resultado" name="resultado" placeholder="00-00" required pattern="\d{2}-\d{2}">
            </div>
            <button type="submit" class="btn btn-primary"><span style="font-weight: bold;">Añadir</span></button>
        </form>
    </div>
    
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        long jornada = 0;

        String parsedJornada = request.getParameter("jornada");
        if (parsedJornada != null && !parsedJornada.isEmpty()) {
            try {
                jornada = Long.parseLong(parsedJornada);
            } catch (NumberFormatException e) {
                out.println("Error: El valor de la jornada no es un número válido.");
            }
        }
        String equipos = request.getParameter("equipos");
        String lugar = request.getParameter("lugar");
        String fechaString = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String resultado = request.getParameter("resultado");

        if (equipos != null && lugar != null && fechaString != null && hora != null && resultado != null) {
            try {
                String user = "rocio";
                String password = "1234";

                ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", user, password);
                LeagueService jornadaService = new LeagueService(pool.getConnection());

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date fechaUtil = sdf.parse(fechaString);
                java.sql.Date fecha = new java.sql.Date(fechaUtil.getTime());

                // Verificar si la jornada ya existe antes de insertarla
                if (jornadaService.requestByJornada(jornada) != null) {
    %>
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="alert alert-danger text-center" role="alert"><span style="font-weight: bold;">
                    Error: La jornada ya existe en la base de datos.
                </span></div>
            </div>
        </div>
    </div>
    <%
                } else {
                    // Insertar la jornada si no existe
                    League nuevaJornada = jornadaService.create(jornada, equipos, lugar, fecha, hora, resultado);
    %>
    <script>
        alert("Jornada agregada correctamente");
        window.location.href = "access.jsp";
    </script>
    <%
                }
                pool.getConnection().close();
            } catch (SQLException e) {
                out.println("Error SQL: " + e.getMessage());
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>

    <footer class="footer py-3 bg-light text-center mt-auto">
        <div class="container">
            <span class="text-muted" style="font-weight: bold;">© 2024 Rocío Corbacho Millán</span>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
