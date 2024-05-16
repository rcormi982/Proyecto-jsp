<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="league.League" %>
<%@ page import="league.LeagueService" %>
<%@ page import="java.util.ArrayList" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/style.css">

</head>
<body>
    <h1>Listado de partidos</h1>
    
    <% 
        //Usuario de la base de datos
        String user = "rocio";
        //Contraseña de la base de datos
        String password = "1234";
        //Pool de conexiones a la base de datos
        ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", user, password);
        LeagueService jornada = new LeagueService(pool.getConnection());
        ArrayList<League> list = jornada.requestAll("");
    %>
        <div class="container">
        <h1>LISTA DE PERSONAS</h1>
        <div class="d-flex justify-content-between">
            <h4>JORNADA</h4>
            <h4>EQUIPOS</h4>
            <h4>LUGAR</h4>
            <h4>FECHA</h4>
            <h4>HORA</h4>
            <h4>RESULTADO</h4>
        </div>
    <% for(int i = 0; i < list.size(); i++) { %>
            <div class="d-flex justify-content-between mb-3 align-items-center">
                <div><%= list.get(i).getJornada() %></div>
                <div class="text-justify"><%= list.get(i).getEquipos() %> <%= list.get(i).getLugar() %></div>
                <div class="text-justify"><%= list.get(i).getFecha() %></div>
                <div class="text-justify"><%= list.get(i).getHora() %></div>
                <div class="text-justify"><%= list.get(i).getResultado() %></div>
                <div>
                    <button type="button" class="btn btn-primary">Editar</button>
                    <button type="button" class="btn btn-danger">Eliminar</button>
                </div>
            </div>
        <% } %>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
</body>
</html>
