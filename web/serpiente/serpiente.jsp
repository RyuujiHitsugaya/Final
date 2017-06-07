<%@page import="logica.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=US-8">
        <meta name="author" content="Brallan Mendoza-Luisa Cajamarca">
        <meta name="nombre" content="Juego serpiente">
            <title>La serpiente</title>
            <link rel="stylesheet" type="text/css" href="estilos/default.css" media="screen">
                <script src="libs/jquery-1.11.0.min.js" language="JavaScript1.2"></script>
                <script src="serpiente.js" language="JavaScript1.2"></script>
                <title>la serpiente</title>
                </head>
                <body onkeydown="control(event);">
                    <% Gestor g=Gestor.getInstance(); 
                String nombre="";
                String juego="";
                String score="";
            try{
                nombre=request.getParameter("nombre");
                juego=request.getParameter("juego");
                score=request.getParameter("punt");
                g.agregarScore(juego, score, nombre);
            }catch(Exception e){
                System.out.println("sin Score "+e);
            }
            %>
        <table align="center"><tr><td><section>
                        <form action="serpiente.jsp" method="get">
                        <img src="imagenes/logo.png"/>
                        <h3>Puntaje Actual</h3>
                        <b style="font-size:20px;color:#ffffff;"><label id="point">puntaje: </label></b>
                            <h3>Puntaje Final</h3>
                            <b style="font-size:20px;color:#ffffff;">
                                <table align="center">
                                    <tr>
                                        <td style="text-align: left">Puntaje:</td>
                                        <td><div id="punta"></div></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left"><input type=hidden id="puntaje" name="punt" value="ga"/>
                                            Nombre:</td><td><input type="text" name="nombre" maxlength="12" size="14"/>
                                            <input type="hidden" name="juego" value="2" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><br><button type="submit" id="guardar"><b>Guardar </b></button></td>
                                    </tr>
                                </table>
                            </b>
                        </form></section></td><td>
                        <canvas id="canvasop" width="600" height="600">
                            Tu navegador no es compatible
                        </canvas></td></tr></table>                        
                    <audio id="pierde">
                        <source src="sonidos/ratas.ogg" type="audio/ogg">
                            <source src="sonidos/ratas.mp3" type="audio/mpeg">
                                <source src="sonidos/ratas.wav" type="audio/wav">
                                    Tu navegador no es compatible
                                    </audio>
                                    </body>
                                    </html>
