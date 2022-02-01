<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <script src="../../js/js.js"></script> <% //para que cuando haga click en el campo email o contraseña se borre lo que hay dentro%>
        <link href="../../css/style.css" rel="stylesheet" type="text/css">
        <title>Login</title>
    </head>

    <body>
        <%
        try {
                
            } catch (Exception e) {
                out.print("<h1>No se ha podido borrar el contenido del archivo</h1>");
            }
        %>
        <form method="post" action="validar.jsp">
            <div class="box">
                <br>
                <img src="../../img/text.gif" alt="Título" class="titulo" width="287" height="52">
                <input type="text" name="user" value="Usuario" onFocus="field_focus(this, 'Usuario');"
                       onblur="field_blur(this, 'Usuario');" class="data" />
                <input type="password" name="pass" value="Contraseña" onFocus="field_focus(this, 'Contraseña');"
                       onblur="field_blur(this, 'Contraseña');" class="data" />

                <button type="submit" class="btn">
                    Entrar
                </button>
                <!-- End Btn -->

                <a href="invitado.jsp">
                    <div id="btn2">Invitado</div>
                </a> <!-- End Btn2 -->

            </div> <!-- End Box -->

        </form>
        <p>¿Olvidaste tu contraseña? <a href="./pass/recuperar.jsp"><u style="color:#f1c40f;">¡Haz click aquí!</u></a></p>
        <p>¿No tienes cuenta? <a href="crearCuenta.jsp"><u style="color:#f1c40f;">¡Haz click aquí!</u></a></p>

       
    </body>

</html>