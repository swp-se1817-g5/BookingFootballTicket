/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
                s.setLastUpdatedDate(rs.getTimestamp(8).toLocalDateTime());
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
            ps.setString(5, "");
            ps.setString(6, "");
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
            while(rs.next())
            {
                s.setSeasonId(Integer.parseInt(seasonID));
                s.setSeasonName(rs.getString(2));
                s.setStartDate(rs.getDate(3));
                s.setEndDate((rs.getDate(4)));
                s.setCreatedBy(rs.getString(5));
                s.setCreatedDate(rs.getTimestamp(6).toLocalDateTime());
                s.setUpdatedBy(rs.getString(7));
                s.setLastUpdatedDate(rs.getTimestamp(8).toLocalDateTime());
            }

        } catch (SQLException ex) {
            Logger.getLogger(SeasonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public static void main(String[] args) {
//        ArrayList<Season> seasons = SeasonDAO.INSTANCE.getAllseason();
//        for (Season season : seasons) {
//            System.out.println(season.toString());
//        }
        Season s = SeasonDAO.INSTANCE.getSeasonbyID("1");
        System.out.println(s.toString());
    }

}
