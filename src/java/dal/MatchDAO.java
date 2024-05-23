/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import models.*;

/**
 *
 * @author thuat
 */
public class MatchDAO {

    public static MatchDAO INSTANCE = new MatchDAO();
    private Connection con;

    private MatchDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public ArrayList<MatchType> getMatchTypes() {
        ArrayList<MatchType> matchType = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "select * from MatchType";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MatchType h = new MatchType();
                h.setName(rs.getString("name"));
                h.setCreatedBy(rs.getString("createdBy"));
                h.setCreatedDate(rs.getDate("createdDate").toLocalDate());
                h.setUpdatedBy(rs.getString("updatedBy"));
                h.setLastUpdatedDate(rs.getDate("lastUpdatedDate").toLocalDate());
                h.setIsDeleted(rs.getBoolean("isDeleted"));
                matchType.add(h);
            }
        } catch (SQLException e) {
        }
        return matchType;
    }

    public ArrayList<Match> getMatchs() {
        ArrayList<Match> match = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "select * from Match";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Match h = new Match();
                h.setMatchId(rs.getInt("matchId"));
                h.setTeam1(rs.getInt("team1"));
                h.setTeam2(rs.getInt("team2"));
                h.setSeasonId(rs.getInt("seasonId"));
                h.setStadiumImg(rs.getString("stadiumImg"));
                h.setTime(rs.getDate("time"));
                h.setStatusId(rs.getInt("statusId"));
                h.setMatchId(rs.getInt("matchTypeId"));
                h.setCreatedBy(rs.getString("createdBy"));
                h.setCreatedDate(rs.getDate("createdDate").toLocalDate());
                h.setUpdatedBy(rs.getString("updatedBy"));
                h.setLastUpdatedDate(rs.getDate("lastUpdatedDate").toLocalDate());
                h.setIsDeleted(rs.getBoolean("isDeleted"));
                match.add(h);
            }
        } catch (SQLException e) {
        }
        return match;
    }
    

}
