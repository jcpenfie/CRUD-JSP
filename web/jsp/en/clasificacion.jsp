<%-- 
    Document   : validar
    Created on : 04-may-2021, 21:32:04
    Author     : Juan Carlos
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../../css/styleMenu.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script><%//Para los iconos%>
        <title>Classification</title>
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
        <img src="../../img/clasifiEn.gif" alt="Clasificacion" width="301" height="51">
        <div class="box">
            <table class="table">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Position</th>
                            <th scope="col">User</th>
                            <th scope="col">Points</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/juegobd", "root", "");
                            Statement s = conexion.createStatement();
                            ResultSet listado = s.executeQuery("SELECT * FROM leaderboard order by points desc LIMIT 5");
                            int cont = 1;
                            while (listado.next()) {
                                out.println("<tr><td><b>" + cont + "º</b></td><td>" + listado.getString("user") + "</td></th><td>" + listado.getString("points") + "</td> </tr>");
                                cont++;
                            }
                            conexion.close();
                        %>
                    </tbody>
                </table>
                <a href="menu.jsp">
                    <div class="btnMorado"><i class="fas fa-undo-alt"></i>&nbsp; Go Back</div>
                </a>
        </div>
    </body>
</html>
