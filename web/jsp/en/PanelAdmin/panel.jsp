<%-- 
    Document   : validar
    Created on : 04-may-2021, 21:32:04
    Author     : Juan Carlos
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>  
        <title>Admin Panel</title>
    </head>
    <body>
    <body style="margin-top: 30px; background-color:#3498db;">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/juegobd";
            String Driver = "com.mysql.jdbc.Driver";
            String user2 = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user2, clave);
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from usuarios");
            //Creamo la Tabla:     
        %>
        <div class="modal-dialog">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">New Registration</button>
        </div>  

        <br>
        <div class="modal-dialog" style="background-color: white">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <table class="table table-bordered"  id="tablaDatos">
                <thead>
                    <tr>
                        <th class="text-center">User</th>
                        <th class="text-center">Password</th>
                        <th class="text-center">E-mail</th>
                        <th class="text-center">Acctions</th>
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="text-center"><%= rs.getString("user")%></td>
                        <td class="text-center"><%= rs.getString("pass")%></td>
                        <td class="text-center"><%= rs.getString("email")%></td>
                        <td class="text-center">

                            <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                            <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                            <a href="Editar.jsp?user=<%= rs.getString("user")%>" class="btn btn-primary">Edit</a>
                            <a href="Delete.jsp?user=<%= rs.getString("user")%>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%}%>
            </table>
        </div>
        <br>
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Add Record</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>User:</label> 
                                <input type="text" name="txtUser" class="form-control"/><br>
                                <label>Password:</label> 
                                <input type="password" name="txtPass" class="form-control"/>
                                <label>E-mail:</label> 
                                <input type="text" name="txtEmail" class="form-control"/>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Save" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
                String pass, user, email;
                user = request.getParameter("txtUser");
                pass = request.getParameter("txtPass");
                email = request.getParameter("txtEmail");
                if (user != null && pass != null && email != null) {
                    Statement sta = con.createStatement();
                    sta.executeUpdate("insert into usuarios values('" + user + "', '" + pass + "', '" + email + "')");
                    response.sendRedirect("panel.jsp");

                }
            %>
        </div> 
        <div class="modal-dialog">            
            <a href="../menu.jsp"> <button type="button" class="btn btn-danger">Go Back</button> </a>
        </div>
        <script src="../../../js/jquery.js" type="text/javascript"></script>             
        <script src="../../../js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>



