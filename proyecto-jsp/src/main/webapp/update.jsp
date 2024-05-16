<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="league.League" %>
<%@ page import="league.LeagueService" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liga de Baloncesto Infantil Masculino</title>
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
        String user = "rocio";
        String password = "1234";
        ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", user, password);
        LeagueService jornada = new LeagueService(pool.getConnection());
        ArrayList<League> list = jornada.requestAll("");
    %>
    <header>
        <div class="container d-flex justify-content-between align-items-center">
            <a href="javascript:history.back()" class="btn btn-primary"><span style="font-weight: bold;">
                <i class="fas fa-arrow-alt-circle-left fa-lg"></i> Volver
            </span></a>
            <h1 class="text-center flex-grow-1"><span style="font-weight: bold;">MODIFICAR JORNADA</span></h1>
            <div style="width: 80px;"></div><!-- Espacio para ajustar alineación -->
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
                                    <th scope="col">JORNADA</th>
                                    <th scope="col">EQUIPOS</th>
                                    <th scope="col">LUGAR</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">HORA</th>
                                    <th scope="col">RESULTADO</th>
                                    <th scope="col" class="text-center">ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody class="medium-font">
                                <% 
                                    for(int i = 0; i < list.size(); i++) {
                                        League object = list.get(i);
                                        java.sql.Date fecha = object.getFecha();
                                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                                        String fechaFormateada = sdf.format(fecha);
                                %>
                                <tr>
                                    <td><%= object.getJornada() %></td>
                                    <td><%= object.getEquipos() %></td>
                                    <td><%= object.getLugar() %></td>
                                    <td><%= fechaFormateada %></td>
                                    <td><%= object.getHora() %></td>
                                    <td><%= object.getResultado() %></td>
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn btn-primary btn-sm"" href="edit.jsp?jornada=<%= object.getJornada() %>" style="width: 85px; font-size: 0.9rem;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path d="M13.146 0.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.364.147h-2a.5.5 0 0 1-.5-.5v-2c0-.13.05-.26.146-.354l10-10zM12.5.5l2 2-9.146 9.146-1.5-1.5L12.5.5zm-3.5 3.5l1.5 1.5-8.146 8.146-1.5-1.5L8.5 4z"/>
                                                </svg>
                                                Editar
                                            </a>
                                            <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal<%= i %>" style="width: 95px; font-size: 0.85rem;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                                    <path d="M5.354 4.646a.5.5 0 0 1 0 .708L7.293 8l-1.94 1.94a.5.5 0 1 1-.708-.708L6.293 8 4.646 6.354a.5.5 0 0 1 .708-.708L8 7.293l1.646-1.647a.5.5 0 0 1 .708.708L8.707 8l1.647 1.646a.5.5 0 0 1-.708.708L8 8.707l-1.647 1.647a.5.5 0 0 1-.708-.708L7.293 8 5.646 6.354a.5.5 0 0 1 0-.708z"/>
                                                </svg>
                                                Eliminar
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Modal -->
                                <div class="modal fade" id="confirmDeleteModal<%= i %>" tabindex="-1" aria-labelledby="confirmDeleteModalLabel<%= i %>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmDeleteModalLabel<%= i %>">Confirmar Eliminación</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                ¿Estás seguro de que deseas eliminar esta jornada?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                <form action="delete.jsp" method="post">
                                                    <input type="hidden" name="jornada" value="<%= object.getJornada() %>">
                                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </main>
            </main>
        </div>
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