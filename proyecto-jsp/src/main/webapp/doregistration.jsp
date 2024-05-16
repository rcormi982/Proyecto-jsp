<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="connectionpool.ConnectionPool"%>
<%@ page import="users.AuthService"%>
<%@ page import="users.User"%>
<%@ page import="users.UserService"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String nombre = request.getParameter("nombre");
    String apellidos = request.getParameter("apellidos");
    String usuario = request.getParameter("usuario");
    String contrasenia = request.getParameter("contrasenia");
    String confirmContrasenia = request.getParameter("confirmContrasenia");
    
    if (!contrasenia.equals(confirmContrasenia)) {
        response.sendRedirect("register.jsp?error=contrasenia");
    } else {
        try {
            String dbuser = "rocio";
            String dbpassword = "1234";
            ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", dbuser, dbpassword);
            UserService userService = new UserService(pool.getConnection());
            
            boolean usuarioExiste = userService.userExists(usuario);
            if (usuarioExiste) {
                response.sendRedirect("register.jsp?error=usuarioExistente");
            } else {
                AuthService auth = new AuthService(pool.getConnection());
                User user = auth.register(nombre, apellidos, usuario, contrasenia);
    %>
        <script>
            alert("¡Se ha registrado correctamente!");
            window.location.href = "index.jsp";
        </script>
    <%
            }
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp");
        }
    }
%>
