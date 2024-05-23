/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
/**
 *
 * @author admin
 */
public class FootballClubDAO {
    
    public static FootballClubDAO INSTANCE = new FootballClubDAO();
    private Connection con;
    
    private FootballClubDAO() {
         if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }
    
    
    
    
}
