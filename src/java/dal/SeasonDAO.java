/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
    private static final String SQL_QUERY_UPDATE_SEASON = "UPDATE [Season]\n"
            + "   SET [seasonName] = \n"
            + "      ,[startDate] = \n"
            + "      ,[endDate] = \n"
            + " WHERE seasonId = ";
    private static final String SEASON_NAME = "seasonName";
    private static final String START_DATE = "startDate";
    private static final String END_DATE = "endDate";
    private static final String UPDATED_BY = "updateBy";

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

    public void createSeason(Season season) {
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
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public ArrayList<Season> getSeasons(int offset, int noOfRecords) {
        ArrayList<Season> seasons = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Season] WHERE [isDeleted] = 0 ORDER BY seasonId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, noOfRecords);
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

    public int getNoOfRecords() {
        String query = "SELECT COUNT(*) FROM [Season]";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int updateSeason(Season season) {
        int n = 0;
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
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        System.out.println(INSTANCE.getSeasonbyID("1").toString());
    }

}
