<%-- 
    Document   : crearCuenta
    Created on : 05-may-2021, 20:31:17
    Author     : Juan Carlos
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="../../js/js.js"></script> <% //para que cuando haga click en el campo email o contraseña se borre lo que hay dentro%>
        <link href="../../css/style.css" rel="stylesheet" type="text/css">
        <title>Create Account</title>
    </head>
    <body>
        <form method="post" action="validarCuenta.jsp">
            <div class="box">
                <br>
                <h1>Create Account</h1>
                <label>User:</label> 
                <input type="text" name="user" value="" class="data" required/>
                <br><label>E-mail:</label> 
                <input type="email" name="email" value="" class="data" required/>
                <label>Password:</label> 
                <input type="password" name="pass" value="" class="data" required/>

                <button type="submit" id="btn3">Create</button>

            </div>
        </form>


        <%

            if (request.getParameter("btn3") != null) {
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String email = request.getParameter("email");
                Connection cnx = null;
                //ResultSet rs = null;
                Statement sta = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://localhost/juegobd?user=root&password=");
                    sta = cnx.createStatement();
                    sta.executeUpdate("insert into usuarios values('" + user + "', '" + pass + "', '" + email + "')");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e + "");
                }
            }
        %>
        <p>Did you forget your password? <a href="recuperar.jsp"><u style="color:#f1c40f;">Click here!</u></a></p>
        <p>Already have an account? <a href="login.jsp"><u style="color:#f1c40f;">Click here!</u></a></p>
    </body>
</html>
