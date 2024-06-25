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
import java.util.logging.Level;
import java.util.logging.Logger;
import models.HistoryPurchasedTicketMatchSeat;
import models.HistoryPurchasedTicketSeasonSeat;
import models.MatchSeat;
import models.Season;
import models.SeasonSeat;
import models.SeatClass;
import models.TicketStatus;
import models.User;

/**
 *
 * @author nguye
 */
public class HistoryPurchasedTicketDAO {

    private static volatile HistoryPurchasedTicketDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_MATCH_SEAT = "Select hptms.*,ticketStatus.statusName from HistoryPurchasedTicketMatchSeat hptms JOIN TicketStatus ticketStatus ON ticketStatus.statusId = hptms.statusId";
    private static final String SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_SEASON_SEAT = "SELECT * FROM HistoryPurchasedTicketSeasonSeat";
    private static final String SQL_QUERY_GET_LIST_TICKET_STATUS = "SELECT * FROM TicketStatus";
    private static final String TICKET_MATCHSEAT_ID = "ticketMatchSeatId";
    private static final String TICKET_SEASON_ID = "ticketSeasonSeatId";
    private static final String SEASON_SEAT_ID = "seasonSeatId";
    private static final String EMAIL = "email";
    private static final String QRCODE = "qrCode";
    private static final String PRICE = "price";
    private static final String QUANTITY = "quantity";
    private static final String STATUS_ID = "statusId";
    private static final String STATUS_NAME = "statusName";
    private static final String CREATED_DATE = "createdDate";
    private static final String CREATED_BY = "createdBy";
    private static final String CLUB_NAME = "clubName";
    private static final String TEAM_1 = "team1";
    private static final String TEAM_2 = "team2";
    private static final String START_TIME = "startTime";
    private static final String SEASON_NAME = "seasonName";
    private static final String SEAT_NAME = "seatName";
    private static final String STAND_NAME = "standName";
    private static final String SEAT_CLASS_NAME = "seatClassName";
    private static final String TICKET_STATUS_ID = "statusId";
    private static final String TICKET_STATUS_NAME = "statusName";

    private HistoryPurchasedTicketDAO() {
        // Private constructor to prevent instantiation
        connect = new DBContext().connect;
    }

    public static HistoryPurchasedTicketDAO getInstance() {
        if (INSTANCE == null) {
            synchronized (HistoryPurchasedTicketDAO.class) {
                if (INSTANCE == null) {
                    INSTANCE = new HistoryPurchasedTicketDAO();
                }
            }
        }
        return INSTANCE;
    }
    PreparedStatement ps = null;
    ResultSet rs = null;

// Get list all of HistoryPurchasedTicketMatchSeat
    public ArrayList<HistoryPurchasedTicketMatchSeat> getlistHistoryPurchasedTicketMatchSeat() {
        ArrayList<HistoryPurchasedTicketMatchSeat> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_MATCH_SEAT);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat = new HistoryPurchasedTicketMatchSeat();
                historyPurchasedTicketMatchSeat.setTicketId(rs.getInt(TICKET_MATCHSEAT_ID));
                historyPurchasedTicketMatchSeat.setTeam1(rs.getString(TEAM_1));
                historyPurchasedTicketMatchSeat.setTeam2(rs.getString(TEAM_2));
                historyPurchasedTicketMatchSeat.setStartTime(rs.getDate(START_TIME));
                historyPurchasedTicketMatchSeat.setSeasonName(rs.getString(SEASON_NAME));
                historyPurchasedTicketMatchSeat.setSeatName(rs.getString(SEAT_NAME));
                historyPurchasedTicketMatchSeat.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicketMatchSeat.setStandName(rs.getString(STAND_NAME));
                historyPurchasedTicketMatchSeat.setSeatClassName(rs.getString(SEAT_CLASS_NAME));
                historyPurchasedTicketMatchSeat.setEmail(rs.getString(EMAIL));
                historyPurchasedTicketMatchSeat.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicketMatchSeat.setPrice(rs.getBigDecimal(PRICE));
                TicketStatus ticketStatus = new TicketStatus();
                ticketStatus.setStatusId(rs.getInt(STATUS_ID));
                ticketStatus.setStatusName(rs.getString(STATUS_NAME));
                historyPurchasedTicketMatchSeat.setStatusId(ticketStatus);
                historyPurchasedTicketMatchSeat.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicketMatchSeat.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                list.add(historyPurchasedTicketMatchSeat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // Search of HistoryPurchasedTicketMatchSeat
    public ArrayList<HistoryPurchasedTicketMatchSeat> Search(String value) {
        ArrayList<HistoryPurchasedTicketMatchSeat> list = new ArrayList<>();
        String sql = "SELECT hptms.*, ticketStatus.statusName "
                + "FROM HistoryPurchasedTicketMatchSeat hptms "
                + "JOIN TicketStatus ticketStatus ON ticketStatus.statusId = hptms.statusId "
                + "WHERE hptms.seasonName LIKE '%" + value + "%' "
                + "OR hptms.seatClassName LIKE '%" + value + "%' "
                + "OR hptms.team1 LIKE '%" + value + "%' "
                + "OR hptms.team2 LIKE '%" + value + "%' "
                + "OR hptms.standName LIKE '%" + value + "%'";

        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat = new HistoryPurchasedTicketMatchSeat();
                historyPurchasedTicketMatchSeat.setTicketId(rs.getInt(TICKET_MATCHSEAT_ID));
                historyPurchasedTicketMatchSeat.setTeam1(rs.getString(TEAM_1));
                historyPurchasedTicketMatchSeat.setTeam2(rs.getString(TEAM_2));
                historyPurchasedTicketMatchSeat.setStartTime(rs.getDate(START_TIME));
                historyPurchasedTicketMatchSeat.setSeasonName(rs.getString(SEASON_NAME));
                historyPurchasedTicketMatchSeat.setSeatName(rs.getString(SEAT_NAME));
                historyPurchasedTicketMatchSeat.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicketMatchSeat.setStandName(rs.getString(STAND_NAME));
                historyPurchasedTicketMatchSeat.setSeatClassName(rs.getString(SEAT_CLASS_NAME));
                historyPurchasedTicketMatchSeat.setEmail(rs.getString(EMAIL));
                historyPurchasedTicketMatchSeat.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicketMatchSeat.setPrice(rs.getBigDecimal(PRICE));
                TicketStatus ticketStatus = new TicketStatus();
                ticketStatus.setStatusId(rs.getInt(STATUS_ID));
                ticketStatus.setStatusName(rs.getString(STATUS_NAME));
                historyPurchasedTicketMatchSeat.setStatusId(ticketStatus);
                historyPurchasedTicketMatchSeat.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicketMatchSeat.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                list.add(historyPurchasedTicketMatchSeat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(HistoryPurchasedTicketDAO.getInstance().Search("Sum"));
    }

    // Get list all of HistoryPurchasedTicketMatchSeat
    public ArrayList<HistoryPurchasedTicketSeasonSeat> getlistHistoryPurchasedTicketSeasonSeat() {
        ArrayList<HistoryPurchasedTicketSeasonSeat> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_SEASON_SEAT);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketSeasonSeat historyPurchasedTicketSeasonSeat = new HistoryPurchasedTicketSeasonSeat();
                historyPurchasedTicketSeasonSeat.setTicketId(rs.getInt(TICKET_SEASON_ID));
                SeasonSeat seasonSeat = new SeasonSeat();
                seasonSeat.setSeasonSeatId(rs.getInt(SEASON_SEAT_ID));
                historyPurchasedTicketSeasonSeat.setSeasonSeatedId(seasonSeat);
                User user = new User();
                user.setEmail(EMAIL);
                historyPurchasedTicketSeasonSeat.setEmail(user);
                historyPurchasedTicketSeasonSeat.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicketSeasonSeat.setPrice(rs.getBigDecimal(PRICE));
                historyPurchasedTicketSeasonSeat.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicketSeasonSeat.setStatus(rs.getBoolean(STATUS_ID));
                historyPurchasedTicketSeasonSeat.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicketSeasonSeat.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);

                list.add(historyPurchasedTicketSeasonSeat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<TicketStatus> getListTicketStatus() {
        ArrayList<TicketStatus> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_TICKET_STATUS);
            rs = ps.executeQuery();
            while (rs.next()) {
                TicketStatus ticketStatus = new TicketStatus();
                ticketStatus.setStatusId(rs.getInt(TICKET_STATUS_ID));
                ticketStatus.setStatusName(rs.getString(TICKET_STATUS_NAME));
                list.add(ticketStatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
//    public static void main(String[] args) {
////        System.out.println(HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat());
////        System.out.println(HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketSeasonSeat());
//System.out.println(HistoryPurchasedTicketDAO.getInstance().getListTicketStatus());
//    }
}
