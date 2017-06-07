var velocidad = 80;
var tamano = 10;
var velocidadop = 10;
var puntaje = 0;
var nume;
var puntajeFinal = puntaje;
var imagenop = new Image();
var imagencabeza1 = new Image();
var imagencabeza2 = new Image();
var imagencabeza3 = new Image();
var imagencabeza4 = new Image();
var imagencuerpo = new Image();
imagenop.src = "imagenes/raton.png";
imagencabeza1.src = "imagenes/cabeza.png";
imagencabeza2.src = "imagenes/cabeza1.png";
imagencabeza3.src = "imagenes/cabeza2.png";
imagencabeza4.src = "imagenes/cabeza3.png";
imagencuerpo.src = "imagenes/cuerpose.png";

class objeto {
    constructor() {
        this.tamano = tamano;
    }
    choque(obj) {
        var difx = Math.abs(this.x - obj.x);
        var dify = Math.abs(this.y - obj.y);
        if (difx >= 0 && difx < tamano && dify >= 0 && dify < tamano) {
            return true;
        } else {
            return false;
        }
    }
    choquecomida(obj) {
        var difx = Math.abs(this.x - obj.x);
        var dify = Math.abs(this.y - obj.y);
        if (difx >= 0 && difx < 40 && dify >= 0 && dify < 40) {
            return true;
        } else {
            return false;
        }
    }
}

class Cola extends objeto {

    constructor(x, y) {
        super();
        this.x = x;
        this.y = y;
        this.siguiente = null;
    }

    dibujar(ctx) {

        if (this.siguiente != null) {
            this.siguiente.dibujar2(ctx);
        }
        ctx.fillStyle = "#0000FF";
        if (nume == 0) {
            ctx.drawImage(imagencabeza1, this.x, this.y);
        } else if (nume == 1) {
            ctx.drawImage(imagencabeza2, this.x, this.y-50);
        } else if (nume == 2) {
            ctx.drawImage(imagencabeza3, this.x-50, this.y);
        } else {
            ctx.drawImage(imagencabeza4, this.x, this.y);
            console.log(nume);
        }

    }
    dibujar2(ctx) {
        if (this.siguiente != null) {
            this.siguiente.dibujar2(ctx);
        }
        ctx.fillStyle = "#0000FF";
        ctx.drawImage(imagencuerpo, this.x, this.y);
    }
    setxy(x, y) {
        if (this.siguiente != null) {
            this.siguiente.setxy(this.x, this.y);
        }
        this.x = x;
        this.y = y;
    }
    meter() {
        if (this.siguiente == null) {
            this.siguiente = new Cola(this.x, this.y);
        } else {
            this.siguiente.meter();
        }
    }
    verSiguiente() {
        return this.siguiente;
    }
}

class Comida extends objeto {
    constructor() {
        super();
        this.x = this.generar();
        this.y = this.generar();


    }
    generar() {
        var num = (Math.floor(Math.random() * 56)) * 10;
        return num;
    }
    colocar() {
        this.x = this.generar();
        this.y = this.generar();
    }

    dibujar(ctx) {
        ctx.fillStyle = "#FF0000";
        ctx.drawImage(imagenop, this.x, this.y);

    }
}
var cabeza = new Cola(50, 50);
var comida = new Comida();
var ejex = true;
var ejey = true;
var xdir = 0;
var ydir = 0;
function movimiento() {
    var nx = cabeza.x + xdir;
    var ny = cabeza.y + ydir;
    cabeza.setxy(nx, ny);
}

function control(event) {
    var cod = event.keyCode;
    if (ejex) {
        if (cod == 38) {
            ydir = -velocidadop;
            xdir = 0;
            ejex = false;
            ejey = true;
            nume = 1;
        }
        if (cod == 40) {
            ydir = velocidadop;
            xdir = 0;
            ejex = false;
            ejey = true;
            nume = 0;
        }
    }
    if (ejey) {
        if (cod == 37) {
            ydir = 0;
            xdir = -velocidadop;
            ejey = false;
            ejex = true;
            nume = 2;
        }
        if (cod == 39) {
            ydir = 0;
            xdir = velocidadop;
            ejey = false;
            ejex = true;
            nume = 3;
        }
    }
}

function findeJuego() {
    puntajeFinal = puntaje;
    xdir = 0;
    ydir = 0;
    ejex = true;
    ejey = true;
    cabeza = new Cola(20, 20);
    comida = new Comida();
    document.getElementById("puntaje").value = puntajeFinal;
    document.getElementById("punta").innerHTML = puntajeFinal;
    alert("Perdiste");
    velocidadop = 10;
    puntaje = 0;
}
function choquepared() {
    if (cabeza.x < 0 || cabeza.x > 560 || cabeza.y < 0 || cabeza.y > 560) {
        findeJuego();
    }
}
function choquecuerpo() {
    var temp = null;
    try {
        temp = cabeza.verSiguiente().verSiguiente();
    } catch (err) {
        temp = null;
    }
    while (temp != null) {
        if (cabeza.choque(temp)) {
            findeJuego();
        } else {
            temp = temp.verSiguiente();
        }
    }
}
function dibujo() {
    var canvas = document.getElementById("canvasop");
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    document.getElementById("point").innerHTML = puntaje;
    cabeza.dibujar(ctx);
    comida.dibujar(ctx);
}
function main() {

    choquecuerpo();
    choquepared();
    dibujo();
    movimiento();
    if (cabeza.choquecomida(comida)) {
        document.getElementById("pierde").play();
        puntaje = puntaje + 100;
        velocidadop = velocidadop + 1;
        comida.colocar();
        cabeza.meter();
    }
}
setInterval("main()", velocidad);


