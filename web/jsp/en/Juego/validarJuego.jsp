<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../css/styleMenu.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script><%//Para los iconos%>
        <title>Estilo</title>
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
        <br><br><br><br>
        <div class="box">
            <img src="../../../img/estiloEn.gif" alt="Clasificacion" width="250" height="45">
            <a href="bosque.jsp?opc=g&j=0&i=0">
                <div class="btn"> <i class="fas fa-tree"></i></i>&nbsp; Forest</div>
            </a>
            <a href="desierto.jsp?opc=g&j=0&i=0">
                <div class="btnAmarillo"> <i class="fas fa-thermometer-full"></i>&nbsp; Desert</div>
            </a>
            <a href="fantasia.jsp?opc=g&j=0&i=0">
                <div class="btnMorado"> <i class="fas fa-magic"></i>&nbsp; Fantasy</div>
            </a>
            <a href="nevado.jsp?opc=g&j=0&i=0">
                <div class="btnAzul"> <i class="fas fa-snowflake"></i>&nbsp; Snowy</div>
            </a>

            <a href="../menu.jsp?opc=g&j=0&i=0">
                <div class="btnRojo"><i class="fas fa-undo-alt"></i>&nbsp; Go Back</div>
            </a>
        </div>
    </body>
</html>