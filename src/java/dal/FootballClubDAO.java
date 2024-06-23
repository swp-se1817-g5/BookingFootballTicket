/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.FootballClub;

/**
 *
 * @author admin
 */
public class FootballClubDAO {

    private static FootballClubDAO instance;
    private Connection con;
    private PreparedStatement ps;

    private FootballClubDAO() {
        con = new DBContext().connect;
    }
    
    public static FootballClubDAO getInstance() {
        if(instance == null)
            instance = new FootballClubDAO();
        return instance;
    }

    public ArrayList<FootballClub> getFootballClubs(String clubName) {
        ArrayList<FootballClub> fcs = new ArrayList<>();
        String sql = "select * from FootballClub where isDeleted = 0 and clubName like ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + clubName + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FootballClub fc = new FootballClub();
                fc.setClubId(rs.getInt("clubId"));
                fc.setClubName(rs.getString("clubName"));
                fc.setImg(rs.getString("img"));
                fc.setCreatedBy(rs.getString("createdBy"));
                fc.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                fc.setUpdatedBy(rs.getString("updatedBy"));
                fc.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") == null ? null : rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                fc.setIsDeleted(rs.getBoolean("isDeleted"));
                fcs.add(fc);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fcs;
    }

    public boolean createFootballClub(FootballClub fc) {
        boolean created = false;
        String sql = "INSERT INTO FootballClub (clubName, img, description, createdBy) VALUES (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, fc.getClubName());
            ps.setString(2, fc.getImg());
            ps.setString(3, fc.getDescription());
            ps.setString(4, fc.getCreatedBy());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {

            e.printStackTrace(); // Proper exception handling
        }
        return created;
    }

    public boolean deleteFootballClub(int clubId) {
        boolean deleted = false;
        String sql = "update FootballClub set isDeleted = 1 where clubId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, clubId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public boolean updateFootballClub(FootballClub fc) {
        boolean updated = false;
        String sql = "update FootballClub set [img] = ?, clubName = ?, [description] = ?, updatedBy = ?  where clubId = ?";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, fc.getImg());
            ps.setString(2, fc.getClubName());
            ps.setString(3, fc.getDescription());
            ps.setString(4, fc.getUpdatedBy());
            ps.setInt(5, fc.getClubId());
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0) 
                updated = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

    public FootballClub getFootballClubbyID(int fCID) {
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
            ps.setInt(1, fCID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fc.setClubId(rs.getInt("clubId"));
                fc.setClubName(rs.getString("clubName"));
                fc.setImg(rs.getString("img"));
                fc.setCreatedBy(rs.getString("createdBy"));
                fc.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                fc.setUpdatedBy(rs.getString("updatedBy"));
                fc.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") == null ? null : rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
            }
        } catch (SQLException ex) {
            Logger.getLogger(FootballClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fc;
    }

    public List<FootballClub> paggingFootballClubs(int pageIndex, int numOfRecords, String search) {
        List<FootballClub> fcs = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[FootballClub] WHERE [isDeleted] = 0 and clubName like ? ORDER BY clubId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, (pageIndex - 1) * numOfRecords);
            ps.setInt(3, numOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    FootballClub fc = new FootballClub();
                    fc.setClubId(rs.getInt("clubId"));
                    fc.setClubName(rs.getString("clubName"));
                    fc.setDescription(rs.getString("description"));
                    fc.setImg(rs.getString("img"));
                    fc.setCreatedBy(rs.getString("createdBy"));
                    fc.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                    fc.setUpdatedBy(rs.getString("updatedBy"));
                    fc.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") == null ? null : rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                    fc.setIsDeleted(rs.getBoolean("isDeleted"));
                    fcs.add(fc);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fcs;
    }

    public int gettotalRecords(String search) {
        int quantity = 0;
        String query = "SELECT COUNT(*) FROM [FootballClub] where clubName like ? ";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public static void main(String[] args) {
    }

}
