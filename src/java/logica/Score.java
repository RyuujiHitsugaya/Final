/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

/**
 *
 * @author Luiigy
 */
public class Score {

    public Score(int juego, int score, String nombre) {
        this.juego = juego;
        this.score = score;
        this.nombre = nombre;
    }

    public int getJuego() {
        return juego;
    }

    public int getScore() {
        return score;
    }

    public String getNombre() {
        return nombre;
    }
    private int juego,score;
    private String nombre;
}
