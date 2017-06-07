<%@page import="logica.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=US-8">
        <meta name="author" content="Brallan Mendoza-Luisa Cajamarca">
        <title>StarFox JS</title>
        <link rel="stylesheet" type="text/css" href="style.css" media="screen">
        <script src="libs/jquery-1.11.0.min.js" language="JavaScript1.2"></script>
        <script src="script.js" language="JavaScript1.2"></script>
    </head>
    <body><% Gestor g=Gestor.getInstance(); 
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
        <aside>         
            <img id="ship" src="img/ship.png"/>
            <img id="disparo" src="img/disparo.png"/>
            <img id="asteroid" src="img/asteroid.png"/>
            <img id="explosion" src="img/explosion.png"/>
            <img id="logo" src="img/logo.png"/>
            <img id="gameover" src="img/gameover.png"/>
            <img id="heroe1" src="img/heroe1.png"/>
            <img id="heroe2" src="img/heroe2.png"/>
            <img id="heroe3" src="img/heroe3.png"/>
            <img id="heroe4" src="img/heroe4.png"/>
            <img id="lifebar" src="img/lifebar.png"/>
            <img id="life" src="img/life.png"/>
            <img src="img/logo.png"/>
            <hr>
            <form action="starfox.jsp" method="get">
            <h3>Puntaje Actual</h3>
                <b style="font-size:20px;color:#ffffff;">
                    <table align="center">
                        <tr>
                            <td style="text-align: left">Puntaje:</td>
                            <td><div id="punta"></div></td>
                        </tr>
                        <tr>
                            <td style="text-align: left"><input type=hidden id="puntaje" name="punt" value="ga"/>
                                Nombre:</td><td><input type="text" name="nombre" maxlength="12" size="14"/>
                                <input type="hidden" name="juego" value="1" /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><br><button type="submit" id="guardar"><b>Guardar </b></button></td>
                        </tr>
                    </table>
                </b>
            </form>
            <hr>
            <h3>Controles del juego</h3>
            <img id="contrles" src="img/arrows.png"/>
            <br>
            <button id="iniciar"><b>Iniciar </b></button>
            <hr>
            <p>Copyright @2017 Brallan Mendoza-Luisa Cajamarca</p>
        </aside>
        <section>
            <canvas id="lienzo" width="500" height="700">
                Tu navegador no es compatible
            </canvas>
            <audio id="main">
                <source src="sonidos/main.ogg" type="audio/ogg">
                <source src="sonidos/main.mp3" type="audio/mpeg">
                Tu navegador no es compatible
            </audio>
            <audio id="dead">
                <source src="sonidos/dead.ogg" type="audio/ogg">
                <source src="sonidos/dead.mp3" type="audio/mpeg">
                Tu navegador no es compatible
            </audio>
            <audio id="explode">
                <source src="sonidos/explode.ogg" type="audio/ogg">
                <source src="sonidos/explode.mp3" type="audio/mpeg">
                Tu navegador no es compatible
            </audio>
            <audio id="mission">
                <source src="sonidos/mission.ogg" type="audio/ogg">
                <source src="sonidos/mission.mp3" type="audio/mpeg">
                Tu navegador no es compatible
            </audio>
        </section>
    </body>
</html>
