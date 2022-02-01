<%-- 
    Document   : Agregar
    Created on : 02/02/2018, 01:11:48 PM
    Author     : Joel
--%>

<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Add</title>
    </head>
    <body>  
        <div class="container">
            <h1>Add Record</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Users:
                <input type="text" name="txtNom" class="form-control"/><br>
                Passwords:
                <input type="text" name="txtDNI" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Go Back</a>
            </form>
        </div>
        
        
    </body>
</html>
<%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/juegobd";
       String Driver="com.mysql.jdbc.Driver";
       String user2="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user2,clave);
       PreparedStatement ps;
       String pass, user;
       user=request.getParameter("txtUser");
       pass=request.getParameter("txtPass");      
       if(user!=null && user!=null){
           ps=con.prepareStatement("insert into usuario(user, pass)values('"+pass+"','"+user+"')");
           ps.executeUpdate();
           JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");           
           response.sendRedirect("panel.jsp");
           
       }
       
       
%>