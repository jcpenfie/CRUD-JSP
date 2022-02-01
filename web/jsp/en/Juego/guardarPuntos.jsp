<%-- 
    Document   : validar
    Created on : 04-may-2021, 21:32:04
    Author     : Juan Carlos
--%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
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
                    String user = "";
                    try {
                        String dirActual = getServletContext().getRealPath("/") + "datos.txt";
                        BufferedReader bf = new BufferedReader(new FileReader(dirActual));
                        user = bf.readLine();
                        bf.close();
                    } catch (Exception e) {
                        out.print("The file could not be read");
                    }
                    int puntos = Integer.valueOf(request.getParameter("p"));
                    int anchoT = Integer.valueOf(request.getParameter("an"));
                    int altoT = Integer.valueOf(request.getParameter("al"));

                    int tamTab = (anchoT * altoT);
                    int multi = 0;

                    if (tamTab > 0 && tamTab < 20) {
                        multi = 10;
                    } else {
                        multi = 100;
                    }

                    int calculoPuntos = multi * puntos; //Puntos según el tamaño del mapa
                    Connection cnx = null;
                    //ResultSet rs = null;
                    Statement sta = null;
                    boolean userbool = false;
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://localhost/juegobd?user=root&password=");
                    sta = cnx.createStatement();
                    ResultSet listado = sta.executeQuery("SELECT * FROM usuarios");
                    while (listado.next()) {
                        String userBD = listado.getString("user");

                        if (userBD.equals(user)) {
                            userbool = true;
                        }
                    }

                    if (!(userbool)) {

                        try {
                            sta.executeUpdate("insert into leaderboard values('" + user + "', '" + calculoPuntos + "')");
                            response.sendRedirect("../clasificacion.jsp");
                        } catch (Exception e) {
                            out.print(e + "");
                        }

                    } else {
                        sta.executeUpdate("UPDATE `leaderboard` SET `points`='" + calculoPuntos + "' WHERE `user` = '" + user + "';");
                        response.sendRedirect("../clasificacion.jsp");
                    }

                %>
            </form>
    </body>

</html>
