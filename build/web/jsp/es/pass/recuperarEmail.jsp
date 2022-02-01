<%-- 
    Document   : recuperarEmail
    Created on : 05-may-2021, 20:53:23
    Author     : Juan Carlos
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../../js/js.js"></script> <% //para que cuando haga click en el campo email o contraseña se borre lo que hay dentro%>
        <link href="../../../css/style.css" rel="stylesheet" type="text/css">
        <title>Email</title>
    </head>
    <body>
        <form method="post" action="recuperarEmailVerificar.jsp">
            <div class="box">
                <br>
                <%
                    String user = request.getParameter("user");
                    boolean userbool = false; //Verificacion de usuario

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegobd", "root", "");
                    Statement s = conexion.createStatement();
                    ResultSet listado = s.executeQuery("SELECT * FROM usuarios");
                    request.setCharacterEncoding("UTF-8");
                    String email = "";
                    while (listado.next()) {
                        String userBD = listado.getString("user");

                        if (userBD.equals(user)) {
                            userbool = true;
                            email = (String) listado.getObject("email");
                        }

                    }
                    if ((!userbool)) {
                        out.print("<h1>Usuario no encontrado</h1><br><a href=\"recuperar.jsp\"><div class=\"btn\">Volver</div></a><a href=\"crearCuenta.jsp\"><div id=\"btn2\">Crear Cuenta</div></a>");
                    } else {
                        out.print("<h1>Introduzca el email completo:" + email.substring(0, 5).concat("****") + "</h1>");
                        out.print("<input type=\"user\" name=\"email\" value=\"email\" onFocus=\"field_focus(this, \'email\');\"onblur=\"field_blur(this, 'email');\" class=\"data\" /><button type=\"submit\" id=\"btn3\">Comprobar</button>");
                    }

                    conexion.close();
                %>

            </div>
        </form>

        <p>¿Ya tienes cuenta? <a href="../login.jsp"><u style="color:#f1c40f;">¡Haz click aquí!</u></a></p>
    </body>
</html>
