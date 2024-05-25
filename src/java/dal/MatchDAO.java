/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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

    public ArrayList<Match> getMatches() {
        ArrayList<Match> matches = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "SELECT "
                    + "m.matchId, "
                    + "fc1.clubId AS team1Id, "
                    + "fc1.clubName AS team1Name, "
                    + "fc1.img AS team1Img, "
                    + "fc2.clubId AS team2Id, "
                    + "fc2.clubName AS team2Name, "
                    + "fc2.img AS team2Img, "
                    + "s.seasonId, "
                    + "s.seasonName, "
                    + "s.startDate AS seasonStartDate, "
                    + "s.endDate AS seasonEndDate, "
                    + "m.stadiumImg AS matchStadiumImg, "
                    + "m.[time] AS matchTime, "
                    + "ms.statusId AS matchStatusId, "
                    + "ms.statusName AS matchStatusName, "
                    + "mt.TypeId AS typeId, "
                    + "mt.[name] AS typeName, "
                    + "m.createdBy, "
                    + "m.createdDate, "
                    + "m.updatedBy, "
                    + "m.lastUpdatedDate, "
                    + "m.isDeleted "
                    + "FROM Match m "
                    + "JOIN FootballClub fc1 ON m.team1 = fc1.clubId "
                    + "JOIN FootballClub fc2 ON m.team2 = fc2.clubId "
                    + "JOIN Season s ON m.seasonId = s.seasonId "
                    + "JOIN MatchStatus ms ON m.statusId = ms.statusId "
                    + "JOIN MatchType mt ON m.matchTypeId = mt.TypeId "
                    + "WHERE m.isDeleted = 0;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Match m = new Match();
                FootballClub fc1 = new FootballClub();
                FootballClub fc2 = new FootballClub();
                Season ss = new Season();
                MatchStatus ms = new MatchStatus();
                MatchType mt = new MatchType();

                m.setMatchId(rs.getInt("matchId"));
                m.setStadiumImg(rs.getString("matchStadiumImg"));
                m.setTime(rs.getDate("matchTime"));

                fc1.setClubId(rs.getInt("team1Id"));
                fc1.setClubName(rs.getString("team1Name"));
                fc1.setImg(rs.getString("team1Img"));
                m.setTeam1(fc1);

                fc2.setClubId(rs.getInt("team2Id"));
                fc2.setClubName(rs.getString("team2Name"));
                fc2.setImg(rs.getString("team2Img"));
                m.setTeam2(fc2);

                ss.setSeasonId(rs.getInt("seasonId"));
                ss.setSeasonName(rs.getString("seasonName"));
                ss.setStartDate(rs.getDate("seasonStartDate"));
                ss.setEndDate(rs.getDate("seasonEndDate"));
                m.setSeason(ss);

                ms.setMatchStatusId(rs.getInt("matchStatusId"));
                ms.setMatchStatusName(rs.getString("matchStatusName"));
                m.setStatus(ms);

                mt.setTypeId(rs.getInt("typeId"));
                mt.setName(rs.getString("typeName"));
                m.setType(mt);

                m.setCreatedBy(rs.getString("createdBy"));
                m.setCreatedDate(rs.getDate("createdDate").toLocalDate());
                m.setUpdatedBy(rs.getString("updatedBy"));
                m.setLastUpdatedDate(rs.getDate("lastUpdatedDate").toLocalDate());
                m.setIsDeleted(rs.getBoolean("isDeleted"));
                matches.add(m);
            }
        } catch (SQLException e) {
        }
        return matches;
    }

    public boolean createFootballClub(int fc1Id, int fc2Id, int seasonId, String stadiumImg, Date time, int statusId, int matchTypeId, String createdBy, String updateBy) {
        boolean created = false;
        String sql = "INSERT INTO Match (team1, team2, seasonId, stadiumImg, [time], statusId, matchTypeId, createdBy, updatedBy) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, fc1Id); // team1
            ps.setInt(2, fc2Id); // team2
            ps.setInt(3, seasonId); // seasonId
            ps.setString(4, stadiumImg); // stadiumImg
            ps.setDate(5, (java.sql.Date) time); // time
            ps.setInt(6, statusId); // statusId
            ps.setInt(7, matchTypeId); // matchTypeId
            ps.setString(8, createdBy); // createdBy
            ps.setString(10, updateBy); // updatedBy
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {

            e.printStackTrace(); // Proper exception handling
        }
        return created;
    }

    public static void main(String[] args) {
        System.out.println(MatchDAO.INSTANCE.getMatches().toString());
    }

}
