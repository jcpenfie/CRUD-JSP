<%-- 
    Document   : validar
    Created on : 04-may-2021, 21:32:04
    Author     : Juan Carlos
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/style.css" rel="stylesheet" type="text/css">
        <title>Verificación</title>
    </head>
    <body>
        <div class="box">
            <form method="post" action="menu.jsp">
                <%
                    //Ver si el usuario introducido por teclado existe y si si validar la contraeña
                    String user = request.getParameter("user");
                    String pass = request.getParameter("pass");
                    boolean userbool = false, passbool = false; //Verificacion de usuario y contraseña

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegobd", "root", "");
                    Statement s = conexion.createStatement();
                    ResultSet listado = s.executeQuery("SELECT * FROM usuarios");
                    while (listado.next()) {
                        String userBD = listado.getString("user");
                        String passBD = listado.getString("pass");

                        if (userBD.equals(user)) {
                            userbool = true;
                        }

                        if (passBD.equals(pass)) {
                            passbool = true;
                        }

                        //out.println("<h1>" + listado.getString("user") + " " + listado.getString("pass") + "</h1>");
                    }

                    if (!(userbool) || !(passbool)) {
                       response.sendRedirect("login.jsp");
                    } else {
                        out.print("<h1>Datos Correctos</h1><br> <img src=\"../../img/loading.gif\" alt=\"Loading\" width=\"64\" height=\"64\"><br><h5>Si no cambia de página haz click en continuar:</h5><button type=\"submit\" id=\"btn3\">Continuar</button>");
                        String dirActual = getServletContext().getRealPath("/") + "datos.txt";
                        Clases.Metodos.guardarDato(user, dirActual);
                    }
                %>
                <p id='Label1' hidden> Time </p>
                <input type='submit' id='thebutton' value='Autoclick' onclick="document.getElementById('Label2').innerHTML = 'Clicked!'" hidden=""></input> 
            </form>
    </body>
    <script>
        time = 1;
        interval = setInterval(function () {
            time--;
            document.getElementById('Label1').innerHTML = "" + time + " seconds"
            if (time == 0) {
                // stop timer
                clearInterval(interval);
                // click
                document.getElementById('thebutton').click();
            }
        }, 1000)
    </script>
</html>
