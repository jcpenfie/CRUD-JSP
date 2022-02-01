<%-- 
    Document   : Editar
    Created on : 02/02/2018, 03:33:51 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script><%//Para los iconos%>
        <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Editar</title>
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
            PreparedStatement ps;
            String user = String.valueOf(request.getParameter("user"));
            Statement s = con.createStatement();
            ResultSet listado = s.executeQuery("SELECT * FROM usuarios");
            while (listado.next()) {
        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                User:
                <input type="text" readonly="" class="form-control" value="<%= listado.getString("user")%>"/>
                Contraseña:
                <input type="text" name="txtPass" class="form-control" value="<%= listado.getString("pass")%>"/>
                E-mail:
                <input type="text" name="txtEmail" class="form-control" value="<%= listado.getString("email")%>"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>

                <a href="panel.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String email, pass;
    email = request.getParameter("txtEmail");
    pass = request.getParameter("txtPass");
    if (user != null && email != null && pass != null) {
        ps = con.prepareStatement("update usuarios set pass='" + pass + "', email='" + email + "'where user='" + user + "'");
        ps.executeUpdate();        
        response.sendRedirect("panel.jsp");
    }


%>
