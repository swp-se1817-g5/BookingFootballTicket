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
        String sql = "UPDATE Match SET team1 = ?, team2 = ?, [startTime] = ?, statusId = ?, matchTypeId = ? WHERE matchId = ? ";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, match.getTeam1().getClubId());
            ps.setInt(2, match.getTeam2().getClubId());
            ps.setTimestamp(3, timestamp);
            ps.setInt(4, match.getStatus().getMatchStatusId());
            ps.setInt(5, match.getType().getTypeId());
            ps.setInt(6, match.getMatchId());
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
                + "ms.statusName AS matchStatusName, mt.TypeId AS typeId, mt.[name] AS typeName, "
                + "m.isDeleted "
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

                matches.add(match);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting matches", e);
        }
        return matches;
    }

    public Match getMatcheById(String matchId) {
        updateMatchStatus();
        Match match = new Match();
        String sql = "SELECT m.matchId, fc1.clubId AS team1Id, fc1.clubName AS team1Name, fc1.img AS team1Img, "
                + "fc2.clubId AS team2Id, fc2.clubName AS team2Name, fc2.img AS team2Img, s.seasonId, s.seasonName, "
                + "s.startDate AS seasonStartDate, s.endDate AS seasonEndDate, m.[startTime] AS matchTime, ms.statusId AS matchStatusId, "
                + "ms.statusName AS matchStatusName, mt.TypeId AS typeId, mt.[name] AS typeName, "
                + "m.isDeleted "
                + "FROM Match m "
                + "JOIN FootballClub fc1 ON m.team1 = fc1.clubId "
                + "JOIN FootballClub fc2 ON m.team2 = fc2.clubId "
                + "JOIN Season s ON m.seasonId = s.seasonId "
                + "JOIN MatchStatus ms ON m.statusId = ms.statusId "
                + "JOIN MatchType mt ON m.matchTypeId = mt.TypeId "
                + "WHERE m.isDeleted = 0 and m.matchId = "
                + matchId;
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
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

            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting matches", e);
        }
        return match;
    }

    public boolean createMatch(Match match) {
        boolean created = false;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(match.getTime(), formatter);
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        String sql = "INSERT INTO Match (team1, team2, seasonId, startTime, statusId, matchTypeId) "
                + "VALUES ( ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, match.getTeam1().getClubId());
            ps.setInt(2, match.getTeam2().getClubId());
            ps.setInt(3, match.getSeason().getSeasonId());
            ps.setTimestamp(4, timestamp);
            ps.setInt(5, match.getStatus().getMatchStatusId());
            ps.setInt(6, match.getType().getTypeId());

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
        String sql = "UPDATE Match SET statusId = 2 WHERE [startTime] <= CURRENT_TIMESTAMP AND statusId <> 2";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating match status", e);
        }
    }

    public List<Match> getMatchesUpcomming(int pageNumber, int pageSize) {
        updateMatchStatus();
        List<Match> matches = new ArrayList<>();
        String fetchSql = "SELECT m.matchId, fc1.clubId AS team1Id, fc1.clubName AS team1Name, fc1.img AS team1Img, "
                + "fc2.clubId AS team2Id, fc2.clubName AS team2Name, fc2.img AS team2Img, s.seasonId, s.seasonName, "
                + "s.startDate AS seasonStartDate, s.endDate AS seasonEndDate, m.[startTime] AS matchTime, ms.statusId AS matchStatusId, "
                + "ms.statusName AS matchStatusName, mt.TypeId AS typeId, mt.[name] AS typeName, "
                + "m.isDeleted "
                + "FROM Match m "
                + "JOIN FootballClub fc1 ON m.team1 = fc1.clubId "
                + "JOIN FootballClub fc2 ON m.team2 = fc2.clubId "
                + "JOIN Season s ON m.seasonId = s.seasonId "
                + "JOIN MatchStatus ms ON m.statusId = ms.statusId "
                + "JOIN MatchType mt ON m.matchTypeId = mt.TypeId "
                + "WHERE m.isDeleted = 0 AND (m.statusId = 1 OR m.statusId = 2)"
                + "ORDER BY m.startTime ASC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement fetchPs = con.prepareStatement(fetchSql)) {
            int offset = (pageNumber - 1) * pageSize;
            fetchPs.setInt(1, offset);
            fetchPs.setInt(2, pageSize);
            try (ResultSet fetchRs = fetchPs.executeQuery()) {
                while (fetchRs.next()) {
                    Match match = extractMatchFromResultSet(fetchRs);
                    matches.add(match);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting upcoming matches", e);
        }
        return matches;
    }

    public int countMatches() {
        int totalCount = 0;
        String countSql = "SELECT COUNT(*) AS total "
                + "FROM Match m "
                + "JOIN MatchStatus ms ON m.statusId = ms.statusId "
                + "WHERE m.isDeleted = 0 "
                + "AND (m.statusId = 1 OR m.statusId = 2)";
        try (PreparedStatement countPs = con.prepareStatement(countSql)) {
            try (ResultSet countRs = countPs.executeQuery()) {
                if (countRs.next()) {
                    totalCount = countRs.getInt("total");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error counting matches", e);
        }
        return totalCount;
    }

    private Match extractMatchFromResultSet(ResultSet rs) throws SQLException {
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

        return match;
    }

    public List<Match> getFilteredMatches(String searchInput, String seasonId, String dateFrom, String dateTo, String matchStatusId, String matchTypeId) {
        List<Match> matches = new ArrayList<>();
        String sql = "SELECT m.matchId, fc1.clubId AS team1Id, fc1.clubName AS team1Name, fc1.img AS team1Img, "
                + "fc2.clubId AS team2Id, fc2.clubName AS team2Name, fc2.img AS team2Img, "
                + "s.seasonId, s.seasonName, s.startDate AS seasonStartDate, s.endDate AS seasonEndDate, "
                + "m.startTime AS matchTime, ms.statusId AS matchStatusId, ms.statusName AS matchStatusName, "
                + "mt.TypeId AS typeId, mt.name AS typeName "
                + "FROM Match m "
                + "JOIN FootballClub fc1 ON m.team1 = fc1.clubId "
                + "JOIN FootballClub fc2 ON m.team2 = fc2.clubId "
                + "JOIN Season s ON m.seasonId = s.seasonId "
                + "JOIN MatchStatus ms ON m.statusId = ms.statusId "
                + "JOIN MatchType mt ON m.matchTypeId = mt.TypeId "
                + "WHERE m.isDeleted = 0 ";

        // Xây dựng các điều kiện lọc nếu có
        List<String> conditions = new ArrayList<>();
        List<Object> params = new ArrayList<>();

        if (searchInput != null && !searchInput.isEmpty()) {
            conditions.add("(LOWER(fc1.clubName) LIKE ? OR LOWER(fc2.clubName) LIKE ?)");
            params.add("%" + searchInput.toLowerCase() + "%");
            params.add("%" + searchInput.toLowerCase() + "%");
        }

        if (seasonId != null && !seasonId.isEmpty()) {
            conditions.add("s.seasonId = ?");
            params.add(Integer.parseInt(seasonId));
        }

        if (dateFrom != null && !dateFrom.isEmpty()) {
            conditions.add("m.startTime >= ?");
            params.add(dateFrom);
        }

        if (dateTo != null && !dateTo.isEmpty()) {
            conditions.add("m.startTime <= ?");
            params.add(dateTo);
        }

        if (matchStatusId != null) {
            if (matchStatusId.isEmpty()) {
                conditions.add("(ms.statusId = 1 OR ms.statusId = 2)");
            } else {
                conditions.add("ms.statusId = ?");
                params.add(Integer.parseInt(matchStatusId));
            }
        }

        if (matchTypeId != null && !matchTypeId.isEmpty()) {
            conditions.add("mt.TypeId = ?");
            params.add(Integer.parseInt(matchTypeId));
        }

        // Thêm các điều kiện vào câu SQL nếu có
        if (!conditions.isEmpty()) {
            sql += " AND " + String.join(" AND ", conditions);
        }

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            // Thiết lập các tham số cho câu SQL nếu có
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
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

                matches.add(match);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting filtered matches", e);
        }

        return matches.isEmpty() ? null : matches;
    }

    public static void main(String[] args) {
        Match m = INSTANCE.getMatcheById("2");
        System.out.println(m.getTeam2().getClubName());
    }
}
