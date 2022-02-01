<%-- 
    Document   : invitado
    Created on : 05-may-2021, 18:30:41
    Author     : Juan Carlos
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/style.css" rel="stylesheet" type="text/css">
        <title>Invitado</title>
    </head>
    <body>
        <div class="box">
            <h1>Entrando como Invitado...</h1>
            <br>
            <img src="../../img/loading.gif" alt="Loading" width="64" height="64"><br>
            <h5>Si no cambia de página haz click en continuar:</h5>
            <button type="submit" id="btn3">Continuar</button>

            <form method="post" action="menu.jsp">
                <%
                    int alea = (int) (Math.random() * 100000000 + 1);
                    String invitadoUser = "INV" + alea;
                    String dirActual = getServletContext().getRealPath("/") + "datos.txt";
                    Clases.Metodos.guardarDato(invitadoUser, dirActual);
                %>
                <p id='Label1' hidden> Time </p>
                <input type='submit' id='thebutton' value='Autoclick' onclick="document.getElementById('Label2').innerHTML = 'Clicked!'" hidden=""></input> 
                <input type="text" name="user" value=" <% out.print(invitadoUser);%>" hidden/>
            </form>
    </body>
    <script>
        time = 1;
        interval = setInterval(function () {
            time--;
            document.getElementById('Label1').innerHTML = "" + time + " seconds"
            if (time == 0) {
                // stop timer
                clearInterval(interval);
                // click
                document.getElementById('thebutton').click();
            }
        }, 1000)
    </script>
</html>
