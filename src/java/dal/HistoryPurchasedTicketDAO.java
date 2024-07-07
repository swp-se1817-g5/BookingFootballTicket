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
import models.TicketStatus;

/**
 *
 * @author nguye
 */
public class HistoryPurchasedTicketDAO {

    private static volatile HistoryPurchasedTicketDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_MATCH_SEAT = "Select hptms.*,ticketStatus.statusName from HistoryPurchasedTicketMatchSeat hptms JOIN TicketStatus ticketStatus ON ticketStatus.statusId = hptms.statusId";
    private static final String SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_SEASON_SEAT = "Select hptss.*,ticketStatus.statusName from HistoryPurchasedTicketSeasonSeat hptss JOIN TicketStatus ticketStatus ON ticketStatus.statusId = hptss.statusId";
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
    private static final String START_DATE = "startDate";
    private static final String END_DATE = "endDate";

    public HistoryPurchasedTicketDAO() {
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
                historyPurchasedTicketMatchSeat.setStartTime(rs.getTimestamp(START_TIME).toLocalDateTime());
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
    public ArrayList<HistoryPurchasedTicketMatchSeat> SearchMatchSeat(String value) {
        ArrayList<HistoryPurchasedTicketMatchSeat> list = new ArrayList<>();
        String sql = "SELECT hptms.*, ticketStatus.statusName "
                + "FROM HistoryPurchasedTicketMatchSeat hptms "
                + "JOIN TicketStatus ticketStatus ON ticketStatus.statusId = hptms.statusId "
                + "WHERE hptms.seasonName LIKE '%" + value + "%' "
                + "OR hptms.seatClassName LIKE '%" + value + "%' "
                + "OR hptms.team1 LIKE '%" + value + "%' "
                + "OR hptms.team2 LIKE '%" + value + "%' "
                + "OR hptms.email LIKE '%" + value + "%' "
                + "OR hptms.standName LIKE '%" + value + "%'";

        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat = new HistoryPurchasedTicketMatchSeat();
                historyPurchasedTicketMatchSeat.setTicketId(rs.getInt(TICKET_MATCHSEAT_ID));
                historyPurchasedTicketMatchSeat.setTeam1(rs.getString(TEAM_1));
                historyPurchasedTicketMatchSeat.setTeam2(rs.getString(TEAM_2));
                historyPurchasedTicketMatchSeat.setStartTime(rs.getTimestamp(START_TIME).toLocalDateTime());
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

//    public static void main(String[] args) {
//        System.out.println(HistoryPurchasedTicketDAO.getInstance().Search("user1"));
//    }
    // Get list all of HistoryPurchasedTicketMatchSeat
    public ArrayList<HistoryPurchasedTicketSeasonSeat> getlistHistoryPurchasedTicketSeasonSeat() {
        ArrayList<HistoryPurchasedTicketSeasonSeat> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_SEASON_SEAT);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketSeasonSeat historyPurchasedTicketSeasonSeat = new HistoryPurchasedTicketSeasonSeat();
                historyPurchasedTicketSeasonSeat.setTicketId(rs.getInt(TICKET_MATCHSEAT_ID));
                historyPurchasedTicketSeasonSeat.setStartDate(rs.getDate(START_DATE));
                historyPurchasedTicketSeasonSeat.setEndDate(rs.getDate(END_DATE));
                historyPurchasedTicketSeasonSeat.setSeasonName(rs.getString(SEASON_NAME));
                historyPurchasedTicketSeasonSeat.setSeatName(rs.getString(SEAT_NAME));
                historyPurchasedTicketSeasonSeat.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicketSeasonSeat.setStandName(rs.getString(STAND_NAME));
                historyPurchasedTicketSeasonSeat.setSeatClassName(rs.getString(SEAT_CLASS_NAME));
                historyPurchasedTicketSeasonSeat.setEmail(rs.getString(EMAIL));
                historyPurchasedTicketSeasonSeat.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicketSeasonSeat.setPrice(rs.getBigDecimal(PRICE));
                TicketStatus ticketStatus = new TicketStatus();
                ticketStatus.setStatusId(rs.getInt(STATUS_ID));
                ticketStatus.setStatusName(rs.getString(STATUS_NAME));
                historyPurchasedTicketSeasonSeat.setStatusId(ticketStatus);
                historyPurchasedTicketSeasonSeat.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicketSeasonSeat.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                list.add(historyPurchasedTicketSeasonSeat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//    public static void main(String[] args) {
//        System.out.println(HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketSeasonSeat());
//    }

    public ArrayList<HistoryPurchasedTicketSeasonSeat> SearchSeasonSeat(String value) {
        ArrayList<HistoryPurchasedTicketSeasonSeat> list = new ArrayList<>();
        String sql = "SELECT hptss.*, ticketStatus.statusName "
                + "FROM HistoryPurchasedTicketMatchSeat hptss "
                + "JOIN TicketStatus ticketStatus ON ticketStatus.statusId = hptss.statusId "
                + "WHERE hptss.seasonName LIKE '%" + value + "%' "
                + "OR hptss.seatClassName LIKE '%" + value + "%' "
                + "OR hptss.team1 LIKE '%" + value + "%' "
                + "OR hptss.team2 LIKE '%" + value + "%' "
                + "OR hptss.email LIKE '%" + value + "%' "
                + "OR hptss.createdBy LIKE '%" + value + "%' "
                + "OR hptss.standName LIKE '%" + value + "%'";

        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketSeasonSeat historyPurchasedTicketSeasonSeat = new HistoryPurchasedTicketSeasonSeat();
                historyPurchasedTicketSeasonSeat.setTicketId(rs.getInt(TICKET_MATCHSEAT_ID));
                historyPurchasedTicketSeasonSeat.setStartDate(rs.getDate(START_DATE));
                historyPurchasedTicketSeasonSeat.setEndDate(rs.getDate(END_DATE));
                historyPurchasedTicketSeasonSeat.setSeasonName(rs.getString(SEASON_NAME));
                historyPurchasedTicketSeasonSeat.setSeatName(rs.getString(SEAT_NAME));
                historyPurchasedTicketSeasonSeat.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicketSeasonSeat.setStandName(rs.getString(STAND_NAME));
                historyPurchasedTicketSeasonSeat.setSeatClassName(rs.getString(SEAT_CLASS_NAME));
                historyPurchasedTicketSeasonSeat.setEmail(rs.getString(EMAIL));
                historyPurchasedTicketSeasonSeat.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicketSeasonSeat.setPrice(rs.getBigDecimal(PRICE));
                TicketStatus ticketStatus = new TicketStatus();
                ticketStatus.setStatusId(rs.getInt(STATUS_ID));
                ticketStatus.setStatusName(rs.getString(STATUS_NAME));
                historyPurchasedTicketSeasonSeat.setStatusId(ticketStatus);
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
