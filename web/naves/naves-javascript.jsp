<%@page import="logica.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Videojuego con Javascript y HTML5</title>
    <link type="text/css" rel="stylesheet" href="css/main.css">
    <script src="js/videojuego-javascript.js" type="text/javascript"></script>
</head>
<body>
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
        <table align="center">
            <tr>
                <td>
    <section>
                        <form action="naves-javascript.jsp" method="get">
                        <img src="images/logo.png" height="100px"/>
                            <h3>Puntaje Final</h3>
                            <b style="font-size:20px;color:#ffffff;">
                                <table align="center">
                                    <tr>
                                        <td style="text-align: left">Puntaje:</td>
                                        <td><div id="punta"></div></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left" ><input type=hidden id="puntaje" name="punt" value="ga"/>
                                            Nombre:</td><td><input type="text" name="nombre" maxlength="12" size="14"/>
                                            <input type="hidden" name="juego" value="3" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"  align="center"><br><button type="submit" id="guardar"><b>Guardar </b></button></td>
                                    </tr>
                                </table>
                            </b>
                        </form>
                
                </a>
                <p>CRISTIAN VARGAS, SEBASTIAN CRUZ, WALTER GUTIERREZ</p>
                <hr>
                    <h3>CONTROLES:</h3>
                    <img src="images/Controles.png" alt=""/><br>
                    <img src="images/Espacio.png" alt=""/><br>
                        <button onclick="game.init()" aling="center">iniciar</button>
                    </section></td><td>
        <div class="juego">
            <canvas id="canvas" width="600" height="650">TU NAVEGADOR NO SOPORTA HTML5!</canvas>
        </div>
                        </td>
            </tr>
        </table>
                     
</body>
</html>