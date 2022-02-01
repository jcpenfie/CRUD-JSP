<%-- 
    Document   : Delete
    Created on : 02/02/2018, 03:34:00 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/juegobd";
            String Driver = "com.mysql.jdbc.Driver";
            String user2 = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user2, clave);
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
            String user = request.getParameter("user");
            out.print(user);
            user.trim();
            Statement sta = con.createStatement();
            sta.executeUpdate("delete from usuarios where user='" + user + "'");
            
            response.sendRedirect("panel.jsp");

        %>
    </body>
</html>
