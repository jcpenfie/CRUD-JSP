<%-- 
    Document   : recuperarEmail
    Created on : 05-may-2021, 20:53:23
    Author     : Juan Carlos
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        <title>Change of password</title>
    </head>
    <body>
        <div class="box">
            <br>
            <%
                String emailR = request.getParameter("email");
                boolean emailbool = false; //Verificacion de email
                emailR = emailR.trim();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegobd", "root", "");
                Statement s = conexion.createStatement();
                ResultSet listado = s.executeQuery("SELECT email FROM usuarios");
                request.setCharacterEncoding("UTF-8");
                while (listado.next()) {
                    String emailBD = listado.getString("email");
                    if (emailR.equals(emailBD)) {
                        emailbool = true;
                        String upt = "UPDATE `usuarios` SET `pass`='" + request.getParameter("pass") + "' WHERE `email` = '" + emailR + "'";
                        PreparedStatement p = (PreparedStatement) conexion.prepareStatement(upt);
                        p.executeUpdate();
                    }

                }
                if ((!emailbool)) {
                    out.print("<h1>Wrong data</h1><br><a href=\"recuperarEmailVerificar.jsp\"><div class=\"btn\">Go Back</div></a><a href=\"crearCuenta.jsp\"><div id=\"btn2\">Create Account</div></a>");
                } else {
                    out.print("<h1>Password changed successfully</h1><br><a href=\"../login.jsp\"><div class=\"btn\">Volver al inicio</div></a>");
                }

                conexion.close();
            %>

        </div>
        <p>Already have an account? <a href="../login.jsp"><u style="color:#f1c40f;">Click Here!</u></a></p>
    </body>
</html>
