package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import models.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Matches.
 */
public class MatchDAO {

    private static final Logger LOGGER = Logger.getLogger(MatchDAO.class.getName());

    public static final MatchDAO INSTANCE = new MatchDAO();
    private static final String FIELD_1 = "createdBy";
    private static final String FIELD_2 = "createdDate";
    private static final String FIELD_3 = "updatedBy";
    private static final String FIELD_4 = "lastUpdatedDate";
    private static final String FIELD_5 = "isDeleted";
    private final Connection con;

    private MatchDAO() {
        con = new DBContext().connect;
    }

    public MatchStatus getMatchStatusById(String statusId) {
        MatchStatus status = new MatchStatus();
        String sql = "SELECT * FROM MatchStatus WHERE statusId = ? AND isDeleted = 0";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(statusId));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    status.setMatchStatusId(rs.getInt("statusId"));
                    status.setMatchStatusName(rs.getString("statusName"));
                    status.setCreatedBy(rs.getString(FIELD_1));
                    status.setCreatedDate(rs.getTimestamp(FIELD_2).toLocalDateTime());
                    status.setUpdatedBy(rs.getString(FIELD_3));
                    status.setLastUpdatedDate(rs.getTimestamp(FIELD_4).toLocalDateTime());
                    status.setIsDeleted(rs.getBoolean(FIELD_5));
                }
            }
        } catch (SQLException | NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Error getting match status by ID", e);
        }
        return status;
    }

    public MatchType getMatchTypeById(String typeId) {
        MatchType type = new MatchType();
        String sql = "SELECT * FROM MatchType WHERE TypeId = ? AND isDeleted = 0";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(typeId));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    type.setTypeId(rs.getInt("TypeId"));
                    type.setName(rs.getString("name"));
                    type.setCreatedBy(rs.getString(FIELD_1));
                    type.setCreatedDate(rs.getTimestamp(FIELD_2).toLocalDateTime());
                    type.setUpdatedBy(rs.getString(FIELD_3));
                    type.setLastUpdatedDate(rs.getTimestamp(FIELD_4).toLocalDateTime());
                    type.setIsDeleted(rs.getBoolean(FIELD_5));
                } else {
                    LOGGER.log(Level.WARNING, "No match type found for TypeId: {0}", typeId);
                }
            }
        } catch (SQLException | NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Error getting match type by ID", e);
        }
        return type;
    }

    public List<MatchStatus> getMatchStatus() {
        List<MatchStatus> matchStatusList = new ArrayList<>();
        String sql = "SELECT * FROM MatchStatus WHERE isDeleted = 0";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MatchStatus status = new MatchStatus();
                status.setMatchStatusId(rs.getInt("statusId"));
                status.setMatchStatusName(rs.getString("statusName"));
                status.setCreatedBy(rs.getString(FIELD_1));
                status.setCreatedDate(rs.getTimestamp(FIELD_2).toLocalDateTime());
                status.setUpdatedBy(rs.getString(FIELD_3));
                status.setLastUpdatedDate(rs.getTimestamp(FIELD_4).toLocalDateTime());
                status.setIsDeleted(rs.getBoolean(FIELD_5));
                matchStatusList.add(status);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting match statuses", e);
        }
        return matchStatusList;
    }

    public boolean updateMatch(Match match) {
        boolean updated = false;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(match.getTime(), formatter);
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        String sql = "UPDATE Match SET team1 = ?, team2 = ?, seasonId = ?, [time] = ?, statusId = ?, matchTypeId = ?, updatedBy = ? WHERE matchId = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, match.getTeam1().getClubId());
            ps.setInt(2, match.getTeam2().getClubId());
            ps.setInt(3, match.getSeason().getSeasonId());
            ps.setTimestamp(4, timestamp);
            ps.setInt(5, match.getStatus().getMatchStatusId());
            ps.setInt(6, match.getType().getTypeId());
            ps.setString(7, match.getUpdatedBy());
            ps.setInt(8, match.getMatchId());
            int rowsAffected = ps.executeUpdate();
            updated = rowsAffected > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating match", e);
        }
        return updated;
    }

    public List<MatchType> getMatchTypes() {
        List<MatchType> matchTypeList = new ArrayList<>();
        String sql = "SELECT * FROM MatchType WHERE isDeleted = 0";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MatchType type = new MatchType();
                type.setTypeId(rs.getInt("TypeId"));
                type.setName(rs.getString("name"));
                type.setIsDeleted(rs.getBoolean(FIELD_5));
                matchTypeList.add(type);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting match types", e);
        }
        return matchTypeList;
    }

    public List<Match> getMatches() {
        updateMatchStatus();
        List<Match> matches = new ArrayList<>();
        String sql = "SELECT m.matchId, fc1.clubId AS team1Id, fc1.clubName AS team1Name, fc1.img AS team1Img, "
                + "fc2.clubId AS team2Id, fc2.clubName AS team2Name, fc2.img AS team2Img, s.seasonId, s.seasonName, "
                + "s.startDate AS seasonStartDate, s.endDate AS seasonEndDate, m.[startTime] AS matchTime, ms.statusId AS matchStatusId, "
                + "ms.statusName AS matchStatusName, mt.TypeId AS typeId, mt.[name] AS typeName, m.createdBy, m.createdDate, m.updatedBy, "
                + "m.lastUpdatedDate, m.isDeleted "
                + "FROM Match m "
                + "JOIN FootballClub fc1 ON m.team1 = fc1.clubId "
                + "JOIN FootballClub fc2 ON m.team2 = fc2.clubId "
                + "JOIN Season s ON m.seasonId = s.seasonId "
                + "JOIN MatchStatus ms ON m.statusId = ms.statusId "
                + "JOIN MatchType mt ON m.matchTypeId = mt.TypeId "
                + "WHERE m.isDeleted = 0";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Match match = new Match();
                FootballClub team1 = new FootballClub();
                FootballClub team2 = new FootballClub();
                Season season = new Season();
                MatchStatus matchStatus = new MatchStatus();
                MatchType matchType = new MatchType();

                match.setMatchId(rs.getInt("matchId"));
                match.setTime(rs.getTimestamp("matchTime").toLocalDateTime());

                team1.setClubId(rs.getInt("team1Id"));
                team1.setClubName(rs.getString("team1Name"));
                team1.setImg(rs.getString("team1Img"));
                match.setTeam1(team1);

                team2.setClubId(rs.getInt("team2Id"));
                team2.setClubName(rs.getString("team2Name"));
                team2.setImg(rs.getString("team2Img"));
                match.setTeam2(team2);

                season.setSeasonId(rs.getInt("seasonId"));
                season.setSeasonName(rs.getString("seasonName"));
                season.setStartDate(rs.getDate("seasonStartDate"));
                season.setEndDate(rs.getDate("seasonEndDate"));
                match.setSeason(season);

                matchStatus.setMatchStatusId(rs.getInt("matchStatusId"));
                matchStatus.setMatchStatusName(rs.getString("matchStatusName"));
                match.setStatus(matchStatus);

                matchType.setTypeId(rs.getInt("typeId"));
                matchType.setName(rs.getString("typeName"));
                match.setType(matchType);

                match.setCreatedBy(rs.getString(FIELD_1));
                match.setCreatedDate(rs.getTimestamp(FIELD_2).toLocalDateTime());
                match.setUpdatedBy(rs.getString(FIELD_3));
                match.setLastUpdatedDate(rs.getTimestamp(FIELD_4).toLocalDateTime());
                match.setIsDeleted(rs.getBoolean(FIELD_5));
                matches.add(match);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting matches", e);
        }
        return matches;
    }

    public boolean createMatch(Match match) {
        boolean created = false;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(match.getTime(), formatter);
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        String sql = "INSERT INTO Match (team1, team2, seasonId, startTime, statusId, matchTypeId, createdBy, updatedBy) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, match.getTeam1().getClubId());
            ps.setInt(2, match.getTeam2().getClubId());
            ps.setInt(3, match.getSeason().getSeasonId());
            ps.setTimestamp(4, timestamp);
            ps.setInt(5, match.getStatus().getMatchStatusId());
            ps.setInt(6, match.getType().getTypeId());
            ps.setString(7, match.getCreatedBy());
            ps.setString(8, match.getUpdatedBy());

            int rowsAffected = ps.executeUpdate();
            created = rowsAffected > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error creating match", e);
        }
        return created;
    }

    public boolean deleteMatch(int matchId) {
        boolean deleted = false;
        String sql = "UPDATE Match SET isDeleted = 1 WHERE matchId = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, matchId);
            int rowsAffected = ps.executeUpdate();
            deleted = rowsAffected > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting match", e);
        }
        return deleted;
    }

    private void updateMatchStatus() {
        String sql = "UPDATE Match SET statusId = 2 WHERE [time] <= CURRENT_TIMESTAMP AND statusId <> 2";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating match status", e);
        }
    }
}
