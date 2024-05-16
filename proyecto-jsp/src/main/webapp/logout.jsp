<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="connectionpool.ConnectionPool"%>
<%@page import="users.AuthService"%>
<%@page import="users.User"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    session.invalidate();
    //response.sendRedirect("index.jsp");
%>
<script>
    alert("Se ha cerrado la sesión correctamente");
    window.location.href = "index.jsp";
</script>