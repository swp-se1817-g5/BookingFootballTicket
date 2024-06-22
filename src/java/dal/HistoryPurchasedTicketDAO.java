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
import models.User;

/**
 *
 * @author nguye
 */
public class HistoryPurchasedTicketDAO {

    private static volatile HistoryPurchasedTicketDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_MATCH_SEAT = "Select *, fbc1.clubName, fbc2.clubName,s.seasonName\n"
                                                                                         + "from HistoryPurchasedTicketMatchSeat hptms\n"
                                                                                         + "Join MatchSeat ms ON ms.matchSeatId = hptms.matchSeatId\n"
                                                                                         + "Join Match m ON m.matchId = ms.matchId\n"
                                                                                         + "Join FootballClub fbc1 ON fbc1.clubId = m.team1\n"
                                                                                         + "Join FootballClub fbc2 ON fbc2.clubId = m.team2\n"
                                                                                         + "Join Season s ON s.seasonId = m.seasonId";
    private static final String SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_SEASON_SEAT = "SELECT * FROM HistoryPurchasedTicketSeasonSeat";
    private static final String TICKET_MATCHSEAT_ID = "ticketMatchSeatId";
    private static final String TICKET_SEASON_ID = "ticketSeasonSeatId";
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

// Get list all of HistoryPurchasedTicketMatchSeat
    public ArrayList<HistoryPurchasedTicketMatchSeat> getlistHistoryPurchasedTicketMatchSeat() {
        ArrayList<HistoryPurchasedTicketMatchSeat> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_HISTORY_PURCHASED_TICKET_MATCH_SEAT);
            rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat = new HistoryPurchasedTicketMatchSeat();
                historyPurchasedTicketMatchSeat.setTicketId(rs.getInt(TICKET_MATCHSEAT_ID));
                MatchSeat matchSeat = new MatchSeat();
                matchSeat.setMatchSeatId(rs.getInt(MATCH_SEAT_ID));
                historyPurchasedTicketMatchSeat.setMatchSeatId(matchSeat);
                User user = new User();
                user.setEmail(EMAIL);
                historyPurchasedTicketMatchSeat.setEmail(user);
                historyPurchasedTicketMatchSeat.setQrCode(rs.getString(QRCODE));
                historyPurchasedTicketMatchSeat.setPrice(rs.getBigDecimal(PRICE));
                historyPurchasedTicketMatchSeat.setQuantity(rs.getInt(QUANTITY));
                historyPurchasedTicketMatchSeat.setStatus(rs.getBoolean(STATUS));
                historyPurchasedTicketMatchSeat.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicketMatchSeat.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                list.add(historyPurchasedTicketMatchSeat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
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
                historyPurchasedTicketSeasonSeat.setStatus(rs.getBoolean(STATUS));
                historyPurchasedTicketSeasonSeat.setCreatedBy(rs.getString(CREATED_BY));
                historyPurchasedTicketSeasonSeat.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                list.add(historyPurchasedTicketSeasonSeat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<HistoryPurchasedTicketMatchSeat> list = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketMatchSeat();
        for (HistoryPurchasedTicketMatchSeat historyPurchasedTicketMatchSeat : list) {
            System.out.println(historyPurchasedTicketMatchSeat.toString());
        }
//        ArrayList<HistoryPurchasedTicketSeasonSeat> list = HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketSeasonSeat();
//        for (HistoryPurchasedTicketSeasonSeat historyPurchasedTicketSeasonSeat : list) {
//            System.out.println(historyPurchasedTicketSeasonSeat.toString());
//        }
    }
}
