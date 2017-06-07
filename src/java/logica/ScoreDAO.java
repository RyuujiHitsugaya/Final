/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Luiigy
 */
public class ScoreDAO {

    private static Connection con;
    private static Statement st;
    private static ResultSet rs;
    
    public static void registrarScore(int juego,int score,String nombre){
        if( nombre.length()== 0)
            nombre="Anonimo";
        if(score != 0)
        try{
            con=Conexion.getConexion();
            st=con.createStatement();
            String consulta="insert into scores values ("+juego+",'"+nombre+"',"+score+")";
            st.executeUpdate(consulta);    
        }catch(SQLException e){
            System.out.println(" Error getScores() "+e);
            }
    }
    public static ArrayList getScores() {
       try{
        ArrayList scores = new ArrayList();
            con=Conexion.getConexion();
            st=con.createStatement();
            String consulta="select * from scores order by score desc";
            rs=st.executeQuery(consulta);    
            while(rs.next()){
                int juego = rs.getInt("juego");
                int score = rs.getInt("score");
                String nombre = rs.getString("nombre");
                scores.add(new Score(juego,score,nombre));
           }return scores;
       }catch(SQLException e){
            System.out.println(" Error getScores() "+e);
            }
        return null;
    }
}
