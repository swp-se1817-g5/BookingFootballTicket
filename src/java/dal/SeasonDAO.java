/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;

/**
 *
 * @author Vinh
 */
public class SeasonDAO {

    public static SeasonDAO INSTANCE = new SeasonDAO();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    private SeasonDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public static SeasonDAO getINSTANCE() {
        return INSTANCE;
    }

    public ArrayList<Season> getAllseason() {
        ArrayList<Season> seasons = new ArrayList<>();
        try {
            String sql = "SELECT [seasonId]\n"
                    + "      ,[seasonName]\n"
                    + "      ,[startDate]\n"
                    + "      ,[endDate]\n"
                    + "      ,[createdBy]\n"
                    + "      ,[createdDate]\n"
                    + "      ,[updatedBy]\n"
                    + "      ,[lastUpdatedDate]\n"
                    + "  FROM [dbo].[Season] WHERE [isDeleted] = 0";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Season s = new Season();
                s.setSeasonId(rs.getInt(1));
                s.setSeasonName(rs.getString(2));
                s.setStartDate(rs.getDate(3));
                s.setEndDate(rs.getDate(4));
                s.setCreatedBy(rs.getString(5));
                s.setCreatedDate(rs.getTimestamp(6).toLocalDateTime());
                s.setUpdatedBy(rs.getString(7));
                s.setLastUpdatedDate(rs.getTimestamp(8) != null ? rs.getTimestamp(8).toLocalDateTime() : null);
                seasons.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seasons;
    }

    public boolean createSeason(Season season) {
        boolean created = false;
        String sql = "INSERT INTO [dbo].[Season]\n"
                + "           ([seasonName]\n"
                + "           ,[startDate]\n"
                + "           ,[endDate]\n"
                + "           ,[createdBy]\n"
                + "           ,[updatedBy]\n"
                + "           ,[lastUpdatedDate]\n"
                + "           ,[isDeleted])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, season.getSeasonName());
            ps.setDate(2, new java.sql.Date(season.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(season.getEndDate().getTime()));
            ps.setString(4, "admin");
            ps.setString(5, null);
            ps.setString(6, null);
            ps.setBoolean(7, false);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return created;
    }

    public Season getSeasonbyID(String seasonID) {
        Season s = new Season();
        String sql = " SELECT [seasonId]\n"
                + "      ,[seasonName]\n"
                + "      ,[startDate]\n"
                + "      ,[endDate]\n"
                + "      ,[createdBy]\n"
                + "      ,[createdDate]\n"
                + "      ,[updatedBy]\n"
                + "      ,[lastUpdatedDate]\n"
                + "  FROM [dbo].[Season] WHERE seasonId = ? AND isDeleted =0 ";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(seasonID));
            rs = ps.executeQuery();
            while (rs.next()) {
                s.setSeasonId(Integer.parseInt(seasonID));
                s.setSeasonName(rs.getString(2));
                s.setStartDate(rs.getDate(3));
                s.setEndDate((rs.getDate(4)));
                s.setCreatedBy(rs.getString(5));
                s.setCreatedDate(rs.getTimestamp(6).toLocalDateTime());
                s.setUpdatedBy(rs.getString(7));
                s.setLastUpdatedDate(rs.getTimestamp(8) != null ? rs.getTimestamp(8).toLocalDateTime() : null);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SeasonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public ArrayList<Season> getSeasons(int offset, int noOfRecords, String search) {
        ArrayList<Season> seasons = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Season] WHERE [isDeleted] = 0 AND [seasonName] LIKE ? ORDER BY seasonId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, offset);
            ps.setInt(3, noOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Season s = new Season();
                    s.setSeasonId(rs.getInt(1));
                    s.setSeasonName(rs.getString(2));
                    s.setStartDate(rs.getDate(3));
                    s.setEndDate(rs.getDate(4));
                    s.setCreatedBy(rs.getString(5));
                    s.setCreatedDate(rs.getTimestamp(6).toLocalDateTime());
                    s.setUpdatedBy(rs.getString(7));
                    Timestamp updatedTimestamp = rs.getTimestamp(8);
                    s.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                    s.setIsDeleted(rs.getBoolean(9));
                    seasons.add(s);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seasons;
    }

    public int getNoOfRecords(String search) {
        String query = "SELECT COUNT(*) FROM [Season] WHERE [isDeleted] = 0 AND [seasonName] LIKE ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "%" + search + "%");
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean deleteSeason(int seasonId) {
        boolean deleted = false;
        String sql = "UPDATE [Season] SET isDeleted = 1 WHERE seasonId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, seasonId);
            if (ps.executeUpdate() > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public boolean updateSeason(Season season) {
        boolean n = false;
        String sql = "UPDATE [Season]"
                + "   SET [seasonName] = ?"
                + "      ,[startDate] = ?"
                + "      ,[endDate] = ?"
                + "      ,[updatedBy] = ?"
                + " WHERE seasonId = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, season.getSeasonName());
            ps.setDate(2, new java.sql.Date(season.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(season.getEndDate().getTime()));
            ps.setString(4, season.getUpdatedBy());
            ps.setInt(5, season.getSeasonId());
            n = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public ArrayList<Season> getFilterofTournment(int offset, int noOfRecords, String search, Date startDate, Date endDate) {
        ArrayList<Season> seasons = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM [dbo].[Season] WHERE [isDeleted] = 0");

        // Add search by seasonName (case insensitive)
        if (search != null && !search.isEmpty()) {
            queryBuilder.append(" AND LOWER([seasonName]) LIKE ?");
        }

        // Add search by startDate and endDate
        if (startDate != null) {
            queryBuilder.append(" AND [startDate] >= ?");
        }
        if (endDate != null) {
            queryBuilder.append(" AND [endDate] <= ?");
        }

        queryBuilder.append(" ORDER BY seasonId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        String query = queryBuilder.toString();

        try (PreparedStatement ps = con.prepareStatement(query)) {
            int parameterIndex = 1;

            // Set search by seasonName
            if (search != null && !search.isEmpty()) {
                ps.setString(parameterIndex++, "%" + search.toLowerCase() + "%");
            }

            // Set search by startDate
            if (startDate != null) {
                ps.setDate(parameterIndex++, startDate);
            }

            // Set search by endDate
            if (endDate != null) {
                ps.setDate(parameterIndex++, endDate);
            }

            ps.setInt(parameterIndex++, offset);
            ps.setInt(parameterIndex++, noOfRecords);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Season s = new Season();
                    s.setSeasonId(rs.getInt(1));
                    s.setSeasonName(rs.getString(2));
                    s.setStartDate(rs.getDate(3));
                    s.setEndDate(rs.getDate(4));
                    s.setCreatedBy(rs.getString(5));
                    s.setCreatedDate(rs.getTimestamp(6).toLocalDateTime());
                    s.setUpdatedBy(rs.getString(7));
                    Timestamp updatedTimestamp = rs.getTimestamp(8);
                    s.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                    s.setIsDeleted(rs.getBoolean(9));
                    seasons.add(s);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seasons;
    }

    public int getNoOfRecordsWithConditions(String search, Date startDate, Date endDate) {
        StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(*) FROM [Season] WHERE [isDeleted] = 0");

        // Add search by seasonName (case insensitive)
        if (search != null && !search.isEmpty()) {
            queryBuilder.append(" AND LOWER([seasonName]) LIKE ?");
        }

        // Add search by startDate and endDate
        if (startDate != null) {
            queryBuilder.append(" AND [startDate] >= ?");
        }
        if (endDate != null) {
            queryBuilder.append(" AND [endDate] <= ?");
        }

        String query = queryBuilder.toString();

        try (PreparedStatement ps = con.prepareStatement(query)) {
            int parameterIndex = 1;

            // Set search by seasonName
            if (search != null && !search.isEmpty()) {
                ps.setString(parameterIndex++, "%" + search.toLowerCase() + "%");
            }

            // Set search by startDate
            if (startDate != null) {
                ps.setDate(parameterIndex++, startDate);
            }

            // Set search by endDate
            if (endDate != null) {
                ps.setDate(parameterIndex++, endDate);
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
//        ArrayList<Season> seasons = SeasonDAO.INSTANCE.getSeasons(0, 5);
//        for (Season season : seasons) {
//            System.out.println(season.toString());
//        }
////        Season s = SeasonDAO.INSTANCE.getSeasonbyID("1");
////        System.out.println(s.toString());
    }

}
