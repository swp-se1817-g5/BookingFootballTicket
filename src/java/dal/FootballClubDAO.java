/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.FootballClub;

/**
 *
 * @author admin
 */
public class FootballClubDAO {

    public static FootballClubDAO INSTANCE = new FootballClubDAO();
    private Connection con;
    private PreparedStatement ps;

    private FootballClubDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public ArrayList<FootballClub> getFootballClubs() {
        ArrayList<FootballClub> fcs = new ArrayList<>();
        String sql = "select * from FootballClub where isDeleted = 0";

        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FootballClub fc = new FootballClub();
                fc.setClubId(rs.getInt("clubId"));
                fc.setClubName(rs.getString("clubName"));
                fc.setImg(rs.getString("img"));
                fc.setCreatedBy(rs.getString("createdBy"));
                fc.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                fc.setUpdatedBy(rs.getString("updatedBy"));
                fc.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                fc.setIsDeleted(rs.getBoolean("isDeleted"));
                fcs.add(fc);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return fcs;
    }

    public boolean createFootballClub(FootballClub fc) {
        boolean created = false;
        String sql = "INSERT INTO FootballClub (clubName, img, createdBy, updatedBy, isDeleted) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fc.getClubName());
            ps.setString(2, fc.getImg());
            ps.setString(3, fc.getCreatedBy());
            ps.setString(4, fc.getUpdatedBy());
            ps.setBoolean(5, fc.isIsDeleted());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {

            e.printStackTrace(); // Proper exception handling
        }
        return created;
    }

    public FootballClub getFootballClubbyID(int FcID) {
        FootballClub fc = new FootballClub();
        String sql = "SELECT [clubId]\n"
                + "      ,[clubName]\n"
                + "      ,[img]\n"
                + "      ,[createdBy]\n"
                + "      ,[createdDate]\n"
                + "      ,[updatedBy]\n"
                + "      ,[lastUpdatedDate]\n"
                + "  FROM [dbo].[FootballClub] WHERE [isDeleted] = 0 AND [clubId] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, FcID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fc.setClubId(rs.getInt("clubId"));
                fc.setClubName(rs.getString("clubName"));
                fc.setImg(rs.getString("img"));
                fc.setCreatedBy(rs.getString("createdBy"));
                fc.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                fc.setUpdatedBy(rs.getString("updatedBy"));
                fc.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
            }
        } catch (SQLException ex) {
            Logger.getLogger(FootballClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fc;
    }

    public static void main(String[] args) {
        System.out.println(FootballClubDAO.INSTANCE.getFootballClubbyID(1).toString());
        
    }

}
