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
                out.print("<h1>Could not delete file content</h1>");
            }
        %>
        <form method="post" action="validar.jsp">
            <div class="box">
                <br>
                <img src="../../img/textEn.gif" alt="Title" class="titulo" width="287" height="52">
                <input type="text" name="user" value="User" onFocus="field_focus(this, 'User');"
                       onblur="field_blur(this, 'User');" class="data" />
                <input type="password" name="pass" value="Password" onFocus="field_focus(this, 'Password');"
                       onblur="field_blur(this, 'Password');" class="data" />

                <button type="submit" class="btn">
                    Enter
                </button>
                <!-- End Btn -->

                <a href="invitado.jsp">
                    <div id="btn2">Guest</div>
                </a> <!-- End Btn2 -->

            </div> <!-- End Box -->

        </form>
        <p>Do you forgot the password? <a href="./pass/recuperar.jsp"><u style="color:#f1c40f;">Click Here!</u></a></p>
        <p>Do not have account? <a href="crearCuenta.jsp"><u style="color:#f1c40f;">Click Here!</u></a></p>

       
    </body>

</html>