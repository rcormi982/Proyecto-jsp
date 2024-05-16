/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2024-05-09 08:13:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.util.ArrayList;
import connectionpool.ConnectionPool;
import comments.Comments;
import comments.CommentsService;
import users.User;
import users.UserService;

public final class viewcomments_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>Comentarios de la Jornada</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            background-image: url('assets/brand/pista3.jpg');\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-position: center;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-color: rgba(255, 255, 255, 100);\r\n");
      out.write("        }\r\n");
      out.write("        body::after {\r\n");
      out.write("            content: \"\";\r\n");
      out.write("            background-color: rgba(255, 255, 255, 0.6); /* Color blanco con opacidad del 50% */\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            left: 0;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            z-index: -1; /* Asegura que esté detrás de todo */\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"d-flex flex-column\">\r\n");

    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // Obtener el ID de la jornada seleccionada
    long partido_jornada = Long.parseLong(request.getParameter("jornada"));

    String dbusuario = "rocio";
    String dbcontrasenia = "1234";
    ConnectionPool pool = new ConnectionPool("jdbc:mysql://localhost:3306/basketball_league", dbusuario, dbcontrasenia);

    try {
        CommentsService commentsService = new CommentsService(pool.getConnection());
        UserService usuario = new UserService(pool.getConnection());

        // Obtener los comentarios de la jornada seleccionada
        ArrayList<Comments> comentarios = commentsService.requestById(partido_jornada);

      out.write("\r\n");
      out.write("<header>\r\n");
      out.write("    <div class=\"container d-flex justify-content-between align-items-center\">\r\n");
      out.write("        <a href=\"javascript:history.back()\" class=\"btn btn-primary\"><span style=\"font-weight: bold;\">\r\n");
      out.write("            <i class=\"fas fa-arrow-alt-circle-left fa-lg\"></i> Volver\r\n");
      out.write("        </span></a>\r\n");
      out.write("        <h1 class=\"text-center flex-grow-1\"><span style=\"font-weight: bold;\">COMENTARIOS DE LA JORNADA</span></h1>\r\n");
      out.write("        <div style=\"width: 90px;\"></div><!-- Espacio para ajustar alineación -->\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write("<div class=\"container-fluid\">\r\n");
      out.write("    <div class=\"row justify-content-center\">\r\n");
      out.write("        <main role=\"main\" class=\"col-lg-10\">\r\n");
      out.write("            <main class=\"container mt-5\">\r\n");
      out.write("                <div class=\"table-responsive\">\r\n");
      out.write("                    <table class=\"table table-striped\">\r\n");
      out.write("                        <thead>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <th scope=\"col\">USUARIO ID</th>\r\n");
      out.write("                                <th scope=\"col\">USUARIO</th>\r\n");
      out.write("                                <th scope=\"col\">COMENTARIOS</th>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </thead>\r\n");
      out.write("                        <tbody class=\"medium-font\">\r\n");
      out.write("                            ");
 
                            for (Comments comment : comentarios) { 
                                // Obtener el nombre de usuario correspondiente al usuario_id
                                User user = usuario.requestById(comment.getUsuario_id());
                            
      out.write("\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>");
      out.print( comment.getUsuario_id() );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( user.getUsuario() );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( comment.getComentarios() );
      out.write("</td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            ");
 } 
      out.write("\r\n");
      out.write("                        </tbody>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("            </main>\r\n");
      out.write("        </main>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");

    } catch (SQLException e) {
        e.printStackTrace();
    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("<footer class=\"footer py-3 bg-light text-center mt-auto\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <span class=\"text-muted\" span style=\"font-weight: bold;\">© 2024 Rocío Corbacho Millán</span>\r\n");
      out.write("    </div>\r\n");
      out.write("</footer>\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
