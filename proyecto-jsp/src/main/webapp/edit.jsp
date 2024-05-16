<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="connectionpool.ConnectionPool" %>
<%@ page import="league.LeagueService" %>
<%@ page import="league.League" %>
<%@ page import="java.sql.SQLException" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar jornada</title>
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
<body>
  <% 
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String user = "rocio";
    String password = "1234";

    try {
      long jornadaId = Long.parseLong(request.getParameter("jornada"));
      ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", user, password);
      LeagueService jornadaService = new LeagueService(pool.getConnection());
      League jornada = jornadaService.requestByJornada(jornadaId);
  %>
  <div class="container d-flex justify-content-between align-items-center">
    <a href="javascript:history.back()" class="btn btn-primary"><span style="font-weight: bold;">
      <i class="fas fa-arrow-alt-circle-left fa-lg"></i> Volver
    </span></a>
    <h1 class="text-center flex-grow-1"><span style="font-weight: bold;">EDITAR JORNADA</span></h1>
    <div style="width: 70px;"></div><!-- Espacio para ajustar alineación -->
  </div>
  <div class="container">
    <form method="post" action="modify.jsp" class="py-3 px-4 rounded">
      <input type="hidden" name="jornadaId" value="<%= jornada.getJornada() %>">
      <div class="mb-3">
        <label for="equipos" class="form-label"><span style="font-weight: bold;">Equipos:</span></label>
        <input type="text" class="form-control" id="equipos" name="equipos" value="<%= jornada.getEquipos() %>" required>
      </div>
      <div class="mb-3">
        <label for="lugar" class="form-label"><span style="font-weight: bold;">Lugar:</span></label>
        <input type="text" class="form-control" id="lugar" name="lugar" value="<%= jornada.getLugar() %>" required>
      </div>
      <div class="row">
        <div class="col">
          <div class="mb-3">
            <label for="fecha" class="form-label"><span style="font-weight: bold;">Fecha:</span></label>
            <input type="date" class="form-control" id="fecha" name="fecha" value="<%= jornada.getFecha() %>" placeholder="dd/mm/yyyy" required pattern="\d{2}/\d{2}/\d{4}">
          </div>
        </div>
        <div class="col">
          <div class="mb-3">
            <label for="hora" class="form-label"><span style="font-weight: bold;">Hora:</span></label>
            <input type="time" class="form-control" id="hora" name="hora" value="<%= jornada.getHora() %>" required>
          </div>
        </div>
      </div>
      <div class="mb-3">
        <label for="resultado" class="form-label"><span style="font-weight: bold;">Resultado:</span></label>
        <input type="text" class="form-control" id="resultado" name="resultado" value="<%= jornada.getResultado() %>" placeholder="00-00" required pattern="\d{2}-\d{2}">
      </div>
      <div class="row">
        <div class="col">
          <button type="submit" class="btn btn-primary"><span style="font-weight: bold;">Guardar Cambios</span></button>
          <a href="access.jsp" class="btn btn-danger ms-2"><span style="font-weight: bold;">Cancelar</span></a>
        </div>
      </div>
    </form>
  </div>
  <% 
    } catch (NumberFormatException e) {
      out.println("Error: No se proporcionó una jornada válida.");
    } catch (SQLException e) {
      out.println("Error SQL: " + e.getMessage());
    } catch (Exception e) {
      out.println("Error: " + e.getMessage());
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
