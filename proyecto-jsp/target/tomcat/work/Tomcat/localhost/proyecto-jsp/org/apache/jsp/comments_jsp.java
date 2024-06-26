/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2024-05-09 09:00:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import users.User;
import comments.CommentsService;
import java.sql.SQLException;

public final class comments_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>Agregar Comentarios</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-direction: column;\r\n");
      out.write("            min-height: 100vh;\r\n");
      out.write("        }\r\n");
      out.write("        .container {\r\n");
      out.write("            flex: 1;\r\n");
      out.write("        }\r\n");
      out.write("        .footer {\r\n");
      out.write("            flex-shrink: 0;\r\n");
      out.write("        }\r\n");
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
      out.write("<body>\r\n");
      out.write("<header>\r\n");
      out.write("        <div class=\"container d-flex justify-content-between align-items-center\">\r\n");
      out.write("            <a href=\"javascript:history.back()\" class=\"btn btn-primary\"><span style=\"font-weight: bold;\">\r\n");
      out.write("                <i class=\"fas fa-arrow-alt-circle-left fa-lg\"></i> Volver\r\n");
      out.write("            </span></a>\r\n");
      out.write("            <h1 class=\"text-center flex-grow-1\"><span style=\"font-weight: bold;\">AGREGAR COMENTARIOS</span></h1>\r\n");
      out.write("            <div style=\"width: 60px;\"></div><!-- Espacio para ajustar alineación -->\r\n");
      out.write("        </div>\r\n");
      out.write("    </header>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    ");
 
    // Verificar si el usuario está autenticado
    User user = (User) session.getAttribute("user");

    // Obtener la jornada
    String jornada = request.getParameter("jornada");
    if (user != null) {
    
      out.write("\r\n");
      out.write("    <form method=\"post\" action=\"add_comments.jsp\" class=\"py-3 px-4 rounded\">\r\n");
      out.write("        <input type=\"hidden\" name=\"userId\" value=\"");
      out.print( user.getId() );
      out.write("\">\r\n");
      out.write("        <input type=\"hidden\" name=\"jornada\" value=\"");
      out.print( jornada );
      out.write("\">\r\n");
      out.write("        <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"comentarios\" class=\"form-label\"><span style=\"font-weight: bold;\">Comentarios:</span></label>\r\n");
      out.write("            <textarea class=\"form-control\" id=\"comentarios\" name=\"comentarios\" rows=\"6\" placeholder=\"Escribe tus comentarios aquí\" required></textarea>\r\n");
      out.write("        </div>\r\n");
      out.write("        <button type=\"submit\" class=\"btn btn-primary\"><span style=\"font-weight: bold;\">Agregar Comentario</span></button>\r\n");
      out.write("    </form>\r\n");
      out.write("    ");
 } else { 
      out.write("\r\n");
      out.write("    <div class=\"alert alert-danger\" role=\"alert\">\r\n");
      out.write("        Debes iniciar sesión para agregar comentarios.\r\n");
      out.write("    </div>\r\n");
      out.write("    <a class=\"btn btn-primary\" href=\"index.jsp\"><span style=\"font-weight: bold;\">Iniciar Sesión</span></a>\r\n");
      out.write("    ");
 } 
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<footer class=\"footer py-3 bg-light text-center\">\r\n");
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
