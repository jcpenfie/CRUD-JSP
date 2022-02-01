<%-- 
    Document   : juego
    Created on : 05-may-2021, 18:38:46
    Author     : Juan Carlos
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/styleMenu.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script><%//Para los iconos%>
        <title>Menu</title>
    </head>
    <body>
        <ul>

            <%
                String user = "";
                try {
                    String dirActual = getServletContext().getRealPath("/") + "datos.txt";
                    BufferedReader bf = new BufferedReader(new FileReader(dirActual));
                    user = bf.readLine();
                    bf.close();
                } catch (Exception e) {
                    out.print("No se ha podido leer el archivo");
                }
                out.print("<li><span><i class=\"fas fa-user\"></i>&nbsp;" + user + "</span></li>");
            %>
            <li style="float:right"><a class="active" href="http://localhost:8080/PrectoFinalXampp/index.jsp"><i class="fas fa-sign-out-alt"></i> Exit</a></li>
        </ul>
        <img src="../../img/textEn.gif" alt="Title" width="318" height="57"/>
        <div class="box">
            <%
                if (user.startsWith("GEST")) {
                    out.print("<a href=\"Juego/bosque.jsp?opc=g&j=0&i=0\"><div class=\"btn\"> <i class=\"fas fa-play\"></i>&nbsp; Play</div></a>");
                } else {
                    out.print("<a href=\"Juego/validarJuego.jsp\"><div class=\"btn\"> <i class=\"fas fa-play\"></i>&nbsp; Play</div></a>");
                }
            %>

            <a href="clasificacion.jsp">
                <div class="btnMorado"><i class="fas fa-trophy"></i>&nbsp; Leaderboard</div>
            </a>
            <% if (user.equals("admin")) {
                    out.print("<a href=\"./PanelAdmin/panel.jsp\"><div class=\"btnRojo\"> <i class=\"fas fa-tools\"></i>&nbsp; Admin Panel</div></a>");
                }
            %>
        </div>
    </body>
</html>



