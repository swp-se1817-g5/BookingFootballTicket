/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.sql.Timestamp;
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

    public MatchStatus getMatchStatusById(String statusId) {
        MatchStatus status = new MatchStatus();
        try {
            System.out.println("Loading data...");
            String sql = "select * from MatchStatus "
                    + "where statusId = ? and isDeleted = 0";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(statusId));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                status.setMatchStatusId(rs.getInt("statusId"));
                status.setMatchStatusName(rs.getString("statusName"));
                status.setCreatedBy(rs.getString("createdBy"));
                status.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                status.setUpdatedBy(rs.getString("updatedBy"));
                status.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                status.setIsDeleted(rs.getBoolean("isDeleted"));
            }

        } catch (SQLException e) {
        } catch (NumberFormatException e) {
            System.out.println("Invalid TypeId format: " + statusId);
        }
        return status;
    }

    public MatchType getMatchTypeById(String typeId) {
        MatchType type = new MatchType();
        try {
            System.out.println("Loading data...");
            String sql = "select * from MatchType "
                    + "where TypeId = ? and isDeleted = 0";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(typeId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                type.setTypeId(rs.getInt("TypeId"));
                type.setName(rs.getString("name"));
                type.setCreatedBy(rs.getString("createdBy"));
                type.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                type.setUpdatedBy(rs.getString("updatedBy"));
                type.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                type.setIsDeleted(rs.getBoolean("isDeleted"));
            } else {
                System.out.println("No match type found for TypeId: " + typeId);
            }

        } catch (SQLException e) {
        } catch (NumberFormatException e) {
            System.out.println("Invalid TypeId format: " + typeId);
        }
        return type;
    }

    public ArrayList<MatchStatus> getMatchStatus() {
        ArrayList<MatchStatus> matchStatus = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "select * from MatchStatus "
                    + "where isDeleted = 0";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MatchStatus h = new MatchStatus();
                h.setMatchStatusId(rs.getInt("statusId"));
                h.setMatchStatusName(rs.getString("statusName"));
                h.setCreatedBy(rs.getString("createdBy"));
                h.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                h.setUpdatedBy(rs.getString("updatedBy"));
                h.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                h.setIsDeleted(rs.getBoolean("isDeleted"));
                matchStatus.add(h);
            }
        } catch (SQLException e) {
        }
        return matchStatus;
    }

    public ArrayList<MatchType> getMatchTypes() {
        ArrayList<MatchType> matchType = new ArrayList<>();
        try {
            System.out.println("Loading data...");
            String sql = "select * from MatchType "
                    + "where isDeleted = 0";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MatchType h = new MatchType();
                h.setTypeId(rs.getInt("TypeId"));
                h.setName(rs.getString("name"));
                h.setCreatedBy(rs.getString("createdBy"));
                h.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                h.setUpdatedBy(rs.getString("updatedBy"));
                h.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
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
                m.setTime(rs.getTimestamp("matchTime").toLocalDateTime());

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
                m.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                m.setUpdatedBy(rs.getString("updatedBy"));
                m.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                m.setIsDeleted(rs.getBoolean("isDeleted"));
                matches.add(m);
            }
        } catch (SQLException e) {
        }
        return matches;
    }

    public boolean createMatch(Match match) {
        boolean created = false;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(match.getTime(), formatter);
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        String sql = "INSERT INTO Match (team1, team2, seasonId, stadiumImg, [time], statusId, matchTypeId, createdBy, updatedBy) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, match.getTeam1().getClubId()); // team1
            ps.setInt(2, match.getTeam2().getClubId()); // team2
            ps.setInt(3, match.getSeason().getSeasonId()); // seasonId
            ps.setString(4, ""); // stadiumImg
            ps.setTimestamp(5, timestamp); // time
            ps.setInt(6, match.getStatus().getMatchStatusId()); // statusId
            ps.setInt(7, match.getType().getTypeId()); // matchTypeId
            ps.setString(8, match.getCreatedBy()); // createdBy
            ps.setString(9, match.getUpdatedBy()); // updatedBy

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {
            // Proper exception handling

        }
        return created;
    }

    public boolean deleteMatch(int matchId) {
        boolean deleted = false;
        String sql = "update Match set isDeleted = 1 where matchId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, matchId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public static void main(String[] args) {
        System.out.println(MatchDAO.INSTANCE.getMatchTypeById("2").getName());
    }

}
