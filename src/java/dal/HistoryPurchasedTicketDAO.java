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
import models.HistoryPurchasedTicket;
import models.MatchSeat;
import models.Season;
import models.User;

/**
 *
 * @author nguye
 */
public class HistoryPurchasedTicketDAO {

    private static volatile HistoryPurchasedTicketDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_NEWS = "SELECT * FROM HistoryPurchasedTicket";
    private static final String TICKET_ID = "ticketId";
    private static final String MATCH_SEAT_ID = "matchSeatId";
    private static final String SEASON_SEAT_ID = "seasonSeatId";
    private static final String EMAIL = "email";
    private static final String QRCODE = "qrCode";
    private static final String PRICE = "price";
    private static final String QUANTITY = "quantity";
    private static final String STATUS = "status";
    private static final String CREATED_DATE = "createdDate";
    private static final String CREATED_BY = "createdBy";

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

// Get list all of news
    public ArrayList<HistoryPurchasedTicket> getlistHistoryPurchasedTicket() {
        ArrayList<HistoryPurchasedTicket> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_NEWS);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicket historyPurchasedTicket = new HistoryPurchasedTicket();
                historyPurchasedTicket.setTicketId(rs.getInt(TICKET_ID));
                MatchSeat matchSeat = new MatchSeat();
                matchSeat.setMatchSeatId(rs.getInt(MATCH_SEAT_ID));
                historyPurchasedTicket.setMatchSeatId(matchSeat);
                Season season = new Season();
                season.setSeasonId(rs.getInt(SEASON_SEAT_ID));
                historyPurchasedTicket.setSeasonSeatedId(season);
                User user = new User();
                user.setEmail(EMAIL);
                historyPurchasedTicket.setEmail(user);
                historyPurchasedTicket.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicket.setPrice(rs.getBigDecimal(PRICE));
                historyPurchasedTicket.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicket.setStatus(rs.getBoolean(STATUS));
                historyPurchasedTicket.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicket.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                list.add(historyPurchasedTicket);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        ArrayList<HistoryPurchasedTicket> list = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicket();
        for (HistoryPurchasedTicket historyPurchasedTicket : list) {
            System.out.println(historyPurchasedTicket.toString());
        }
    }
}
