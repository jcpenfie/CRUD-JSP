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
        <title>Recuperar Cuenta</title>
    </head>
    <body>
        <form method="post" action="recuperarEmail.jsp">
            <div class="box">
                <br>
                <h1>Recuperar Cuenta</h1>
                <input type="text" name="user" value="Usuario" onFocus="field_focus(this, 'Usuario');"
                       onblur="field_blur(this, 'Usuario');" class="data" />

                <button type="submit" id="btn3">
                    Siguiente
                </button>

            </div>
        </form> 
        <p>¿Ya tienes cuenta? <a href="../login.jsp"><u style="color:#f1c40f;">¡Haz click aquí!</u></a></p>
    </body>
</html>
