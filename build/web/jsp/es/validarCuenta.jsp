<%-- 
    Document   : validar
    Created on : 04-may-2021, 21:32:04
    Author     : Juan Carlos
--%>

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
            <%
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String email = request.getParameter("email");
                boolean userbool = false, passbool = false, emailbool = false; //Verificacion de usuario, contraseña y email

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegobd", "root", "");
                Statement s = conexion.createStatement();
                ResultSet listado = s.executeQuery("SELECT * FROM usuarios");
                request.setCharacterEncoding("UTF-8");
                while (listado.next()) {
                    String userBD = listado.getString("user");
                    String passBD = listado.getString("pass");
                    String emailBD = listado.getString("email");

                    if (userBD.equals(user)) {
                        userbool = true;
                    }

                    if (passBD.equals(pass)) {
                        passbool = true;
                    }
                    if (emailBD.equals(email)) {
                        emailbool = true;
                    }

                    //out.println("<h1>" + listado.getString("user") + " " + listado.getString("pass") + "</h1>");
                }

                if ((userbool) || (passbool) || (emailbool)) {
                    out.print("<h1>Cuenta ya creada</h1><br><a href=\"login.jsp\"><div class=\"btn\">Volver al Login</div></a><a href=\"login.jsp\"><a href=\"crearCuenta.jsp\"><div id=\"btn2\">Crear Cuenta</div></a>");
                } else {
                    try {
                        String dirActual = getServletContext().getRealPath("/") + "datos.txt";
                        Clases.Metodos.guardarDato(user, dirActual);
                    } catch (Exception e) {
                        out.print("<h1>No se ha podido escribir en el archivo</h1>");
                    }

                    int i = s.executeUpdate("insert into usuarios(user,pass,email)values('" + user + "','" + pass + "','" + email + "')");

                    response.sendRedirect("menu.jsp");
                }

                conexion.close();
            %>
        </div>
    </body>
</html>
