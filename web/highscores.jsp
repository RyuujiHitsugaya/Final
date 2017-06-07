<%-- 
    Document   : highscores
    Created on : 5/06/2017, 05:32:06 PM
    Author     : Luiigy
--%>
<%@page import="logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Co<head>
        <meta http-equiv="Content-Type" content="text/html; charset=US-8">
        <meta name="author" content="Brallan Mendoza-Luisa Cajamarca">
        <title>Scores</title>
        <link rel="stylesheet" type="text/css" href="tableStyle.css" media="screen">
    </head>
    <body>
        <% Gestor g=Gestor.getInstance();
            String[][] datos=g.obtenerScores();
        %>
        <section>
            <table width="100%"><th colspan="3"><img src="starfox/img/highscore.png" height="70px"></th><tr><td>
                    <table width="100%"><th colspan="3"><img src="starfox/img/logo.png" height="60px"></th>
                        <tr style="font-size: 40px"><td><b>#</b></td><td><b>Score</b></td><td><b>Nombre</b></td></tr>
                <%  if(datos[0].length!=0)
                    for(int i=0;i<datos[0].length;i++){
                            if(datos[0][i].equals("1")){
                                out.println("<tr>");
                                out.println("<td>"+(i+1)+"</td>");
                                out.println("<td>"+datos[1][i]+"</td>");
                                out.println("<td>"+datos[2][i]+"</td>");
                                out.println("</tr>");
                            }
                    }
                %>
            </table></td><td style='vertical-align: top'>
                <table  width="100%"><th colspan="3"><img src="serpiente/imagenes/logo.png" height="60px"></th>
                        <tr style="font-size: 40px"><td><b>#</b></td><td><b>Score</b></td><td><b>Nombre</b></td></tr>
                <%  if(datos[0].length!=0)
                    for(int i=0;i<datos[0].length;i++){
                            if(datos[0][i].equals("2")){
                                out.println("<tr>");
                                out.println("<td>"+(i+1)+"</td>");
                                out.println("<td>"+datos[1][i]+"</td>");
                                out.println("<td>"+datos[2][i]+"</td>");
                                out.println("</tr>");
                            }
                    }
                %>
            </table></td><td style='vertical-align: top' >
            <table width="100%">
                <th colspan="3"><img src="naves/images/logo.png" height="60px"></th>
                        <tr style="font-size: 40px"><td><b>#</b></td><td><b>Score</b></td><td><b>Nombre</b></td></tr>
                <%  if(datos[0].length!=0)
                    for(int i=0;i<datos[0].length;i++){
                            if(datos[0][i].equals("3")){
                                out.println("<tr>");
                                out.println("<td>"+(i+1)+"</td>");
                                out.println("<td>"+datos[1][i]+"</td>");
                                out.println("<td>"+datos[2][i]+"</td>");
                                out.println("</tr>");
                            }
                    }
                %>
            </table></td></tr>
        </table>
        </section>
    </body>
</html>
