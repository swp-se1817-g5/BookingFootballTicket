/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
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
        String sql = "INSERT INTO FootballClub (clubName, img, createdBy) VALUES (?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, fc.getClubName());
            ps.setString(2, fc.getImg());
            ps.setString(3, fc.getCreatedBy());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {

            e.printStackTrace(); // Proper exception handling
        }
        return created;
    }

    public boolean deleteFootballClub(int footballClubId) {
        boolean deleted = false;
        String sql = "update FootballClub set isDeleted = 1 where footballClubId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, footballClubId);
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
        String sql = "update FootballClub set  where footballClubId = ?";

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

    public ArrayList<FootballClub> getFootballClubs(int offset, int noOfRecords) {
        ArrayList<FootballClub> fcs = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[FootballClub] WHERE [isDeleted] = 0 ORDER BY clubId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, noOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fcs;
    }

    public int getNoOfRecords() {
        int quantity = 0;
        String query = "SELECT COUNT(*) FROM [FootballClub]";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public static void main(String[] args) {
        System.out.println(FootballClubDAO.INSTANCE.getFootballClubs(2, 2));
    }

}
