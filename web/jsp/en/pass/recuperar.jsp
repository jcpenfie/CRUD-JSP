<%-- 
    Document   : recuperar
    Created on : 05-may-2021, 20:30:38
    Author     : Juan Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../../js/js.js"></script> <% //para que cuando haga click en el campo email o contraseña se borre lo que hay dentro%>
        <link href="../../../css/style.css" rel="stylesheet" type="text/css">
        <title>Recover account</title>
    </head>
    <body>
        <form method="post" action="recuperarEmail.jsp">
            <div class="box">
                <br>
                <h1>Recover account</h1>
                <input type="text" name="user" value="User" onFocus="field_focus(this, 'User');"
                       onblur="field_blur(this, 'User');" class="data" />

                <button type="submit" id="btn3">
                    Next
                </button>

            </div>
        </form> 
        <p>Already have an account? <a href="../login.jsp"><u style="color:#f1c40f;">¡Click Here!</u></a></p>
    </body>
</html>
