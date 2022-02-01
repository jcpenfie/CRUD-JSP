<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Clases.Metodos"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../css/styleJuego.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script><%//Para los iconos%>
        <title>Desierto</title>
    </head>
    <body>
        <br>
        <%!
            int mensaje = 0;
            int posX = 0;
            int posY = 0;
            int cont = 8;
            int alto = (int) (Math.random() * 5 + 3);
            int ancho = (int) (Math.random() * 5 + 3);
            int veneno = (int) (Math.random() * 2 + 1);
            int rocksI = (int) (Math.random() * alto + 1);// generacion de rocas
            int rocksJ = (int) (Math.random() * ancho + 1);// generacion de rocas
            int contR = 0; //Para saber cuantas veces a ido a las rocas
            int contC = 0; //Para saber cuantas veces a ido a la casa
        %>

        <div class="box2">
            <%
                switch (mensaje) {
                    case 0:
                        out.print("<br><div class=\"mensaje\"><span>De alguna forma que desconocemos todos estás en mitad de una pequeña aldea con una 🎺 (trompeta) en la mano.</span></div><br>");
                        break;
                    case 1:
                        out.print("<br><div class=\"mensaje\"><span>Una fuerza desconocida hace que muevas el brazo tan fuerte que la 🎺 (trompeta) sale disparada,</span></div><br>");
                        break;
                    case 2:
                        out.print("<br><div class=\"mensaje\"><span>Confuso empiezas a buscarlo:</span></div><br>");
                        break;
                    case 3:
                        out.print("<br><div class=\"mensaje\"><span>Confuso empiezas a buscarla:</span></div>");
                        out.print("<h1>Movimientos: " + (mensaje - 3) + "</h1>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/desierto/fenceLefCor.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/desierto/FenceTop.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/desierto/fenceRigCor.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        out.print("<table><tr>");
                        for (int i = 0; i < alto; i++) {
                            out.print("<td><img src=\"../../../img/desierto/fenceLef.png\" width=\"64\" height=\"64\"></td>");
                            for (int j = 0; j < ancho; j++) {
                                if (!(i == posY && j == posX)) {
                                    if ((i == alto - 1 && j == ancho - 1)) {//casa
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + (j - 1) + "&opc=h\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/house.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (alto / 2) && j == (ancho / 2 + 1)) || (i == (alto / 2 - 1) && j == (ancho / 2))) {//flores azules
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=f\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/flowers.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == alto / 2 + 1 && j == ancho / 2 - 1)) {
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=p\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/flowers2.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (rocksI - 3) && j == rocksJ) || (i == rocksI && j == (rocksJ + 4))) {//roca1
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == rocksI && j == rocksJ)) {//roca2
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else {
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=c\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/sand.png\" width=\"64\" height=\"64\"></a></td>");
                                    }

                                } else {
                                    out.print("<td><img src=\"../../../img/desierto/face.png\" width=\"64\" height=\"64\"></td>");
                                }
                            }
                            out.print("<td><img src=\"../../../img/desierto/fenceRig.png\" width=\"64\" height=\"64\"></td>");
                            out.print("</tr>");
                            cont--;
                        }
                        out.print("</table>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/desierto/fenceLefCorDow.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/desierto/fenceDow.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/desierto/fenceRigCorDow.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        break;

                    default:
                        String opc = request.getParameter("opc");
                        switch (opc) {
                            case "h":
                                if (mensaje > 5 && contC > 0) {
                                    out.print("<br><div class=\"mensaje\"><span>No entiendes como pero al volver a mirar estába aquí la 🎺 </span></div>");
                                    out.print("<br><a href=\"guardarPuntos.jsp?p=" + mensaje + "&an=" + ancho + "&al=" + alto + "\"><div class=\"btn4\"> <i class=\"fas fa-file-download\"></i> &nbsp; Guardar Puntuación</div></a><br>");
                                } else {
                                    contC++;
                                    out.print("<br><div class=\"mensaje\"><span>La casa parece que está <b>desierta</b> 🥁<em>*Ba Dum Tss!*</em>🥁</span></div>");
                                }
                                break;
                            case "f":
                                out.print("<br><div class=\"mensaje\"><span>Entre los arbustos no estaba 🤔</span></div>");
                                break;
                            case "p":
                                out.print("<br><div class=\"mensaje\"><span>Casi te caes en el pozo y ni siquiera estaba aquí 🤷‍♀️</span></div>");
                                break;
                            case "r":

                                switch (contR) {
                                    case 4:
                                        out.print("<br><div class=\"mensaje\"><span>Vuelves a mirar bien 👀 y estaba aquí la 🎺</span></div>");
                                        out.print("<br><a href=\"guardarPuntos.jsp?p=" + mensaje + "&an=" + ancho + "&al=" + alto + "\"><div class=\"btn\"> <i class=\"fas fa-file-download\"></i> &nbsp; Guardar Puntuación</div></a>");
                                        break;
                                    default:
                                        contR++;
                                        out.print("<br><div class=\"mensaje\"><span>¿Debajo de una roca, en serio 🤦‍♂️?</span></div>");
                                        break;
                                }
                                break;
                            default:
                                out.print("<br><div class=\"mensaje\"><span>La arena dificulta la busqueda 🔎</span></div>");
                                break;
                        }
                        out.print("<h1>Movimientos: " + (mensaje - 3) + "</h1>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/desierto/fenceLefCor.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/desierto/FenceTop.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/desierto/fenceRigCor.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        int j2 = Integer.parseInt(request.getParameter("j"));
                        int i2 = Integer.valueOf(request.getParameter("i"));
                        //int i2 = 0;
                        //out.print(i2 + " " + " " + j2);
                        out.print("<table><tr>");
                        for (int i = 0; i < alto; i++) {
                            out.print("<td><img src=\"../../../img/desierto/fenceLef.png\" width=\"64\" height=\"64\"></td>");
                            for (int j = 0; j < ancho; j++) {
                                if (!(i == i2 && j == j2)) {
                                    if ((i == alto - 1 && j == ancho - 1)) {//casa
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + (j - 1) + "&opc=h\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/house.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (alto / 2) && j == (ancho / 2 + 1)) || (i == (alto / 2 - 1) && j == (ancho / 2))) {//flores azules
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=f\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/flowers.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == alto / 2 + 1 && j == ancho / 2 - 1)) {
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=p\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/flowers2.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == (rocksI - 3) && j == rocksJ) || (i == rocksI && j == (rocksJ + 4))) {//roca1
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else if ((i == rocksI && j == rocksJ)) {//roca2
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=r\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/rock1.png\" width=\"64\" height=\"64\"></a></td>");
                                    } else {
                                        out.print("<td><a href=\"desierto.jsp?i=" + i + "&j=" + j + "&opc=c\" class=\"btn btn-primary\"><img src=\"../../../img/desierto/sand.png\" width=\"64\" height=\"64\"></a></td>");
                                    }

                                } else {
                                    out.print("<td><img src=\"../../../img/desierto/face.png\" width=\"64\" height=\"64\"></td>");
                                }
                            }
                            out.print("<td><img src=\"../../../img/desierto/fenceRig.png\" width=\"64\" height=\"64\"></td>");
                            out.print("</tr>");
                            cont--;
                        }
                        out.print("</table>");
                        out.print("<table><tr>");
                        out.print("<td><img src=\"../../../img/desierto/fenceLefCorDow.png\" width=\"64\" height=\"64\"></td>");
                        for (int i = 0; i < ancho; i++) {
                            out.print("<td><img src=\"../../../img/desierto/fenceDow.png\" width=\"64\" height=\"64\"></td>");
                        }
                        out.print("<td><img src=\"../../../img/desierto/fenceRigCorDow.png\" width=\"64\" height=\"64\"></td>");
                        out.print("</tr></table>");
                        break;

                }
            %>
        </div>
        <script>
            function actualizar() {
                location.reload(true);
            <%mensaje++;%>
            }
            //Función para actualizar cada 4 segundos(4000 milisegundos)
            <%if (mensaje > 0 && mensaje < 4) {%>
            setInterval("actualizar()", 4000);
            <%}%>
        </script>
    </body>
</html>
