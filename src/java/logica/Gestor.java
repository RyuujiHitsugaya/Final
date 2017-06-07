/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Luiigy
 */
public class Gestor {
    private static Gestor gestor;
    private Gestor(){
    }
    public static Gestor getInstance(){
        if(gestor==null)
            gestor=new Gestor();
        return gestor;
    }
    public void agregarScore(String juego,String score,String nombre){
        ScoreDAO.registrarScore(Integer.parseInt(juego),Integer.parseInt(score),nombre);
    }
    public String[][] obtenerScores(){
        ArrayList scores=ScoreDAO.getScores();
        String[][] highscores=new String[3][scores.size()];
        Iterator it=scores.iterator();
        int cont=0;
        while(it.hasNext()){
            Score s=(Score)it.next();
            highscores[0][cont]=String.valueOf(s.getJuego());
            highscores[1][cont]=String.valueOf(s.getScore());
            highscores[2][cont]=s.getNombre();
            cont++;
        }
        return highscores;
    } 
}
