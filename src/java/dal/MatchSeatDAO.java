/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.HistoryPurchasedTicketMatchSeat;
import models.MatchSeat;
import models.*;

/**
 *
 * @author admin
 */
public class MatchSeatDAO {

    /**
     *
     */
    public static MatchSeatDAO INSTANCE = new MatchSeatDAO();
    private Connection con;
    private static final Logger LOGGER = Logger.getLogger(MatchSeatDAO.class.getName());

    private MatchSeatDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public boolean holdTicket(TicketHold ticket) {
        boolean status = false;
        String sql = """
                     INSERT INTO HoldTicket (matchSeatId, email, holdTimestamp, holdQuantity)
                     VALUES (?, ?, NOW(), ?);
                     UPDATE MatchSeat
                     SET availability = availability - ?
                     WHERE matchSeatId = ? AND availability >= ?;
                     """;
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, ticket.getMatchSeatId());
            st.setString(2, ticket.getEmail());
            st.setInt(3, ticket.getHoldQuantity());
            st.setInt(4, ticket.getHoldQuantity());
            st.setInt(5, ticket.getHoldQuantity());
            st.setInt(6, ticket.getHoldQuantity());
            st.setInt(7, ticket.getHoldQuantity());
            status = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error getting match status by ID", ex);
        }
        return status;
    }

    public boolean subtractAvailability(BookingTicket booking) {
        boolean status = false;
        String sql = """
                     UPDATE MatchSeat
                     SET availability = availability - ?
                     WHERE matchSeatId = ? AND availability >= ?;
                     """;
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, booking.getQuantity());
            st.setInt(2, booking.getMatchSeatId());
            st.setInt(3, booking.getQuantity());
            status = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error subtraction availability ", ex);
        }
        return status;
    }

    public boolean returnAvailability(BookingTicket booking) {
        boolean status = false;
        String sql = """
                     UPDATE MatchSeat
                     SET availability = availability + ?
                     WHERE matchSeatId = ?;
                     """;
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, booking.getQuantity());
            st.setInt(2, booking.getMatchSeatId());
            status = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error return availability ", ex);
        }
        return status;
    }

    public ArrayList<MatchSeat> getMatchSeatbyMatch(int matchId) {
        ArrayList<MatchSeat> matchSeats = new ArrayList<>();
        String sql = """
                     SELECT 
                     ms.matchSeatId,
                     ms.matchId,
                     ms.seatId,
                     ms.availability,
                     sa.seatId,
                     st.standId as standId,
                     st.standName as standName,
                     sa.seatName,
                     ms.price,
                     sc.price as seatClassPrice,
                     sc.seatClassId,
                     sc.seatClassName,
                     sa.quantity
                     FROM MatchSeat ms
                     join SeatArea sa on sa.seatId = ms.seatId
                     join Stand st on st.standId = sa.standId
                     join SeatClass sc on sc.seatClassId = sa.seatClassId
                     WHERE matchId = ? """;

        try (PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, matchId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MatchSeat matchSeat = new MatchSeat();
                SeatArea seat = new SeatArea();
                SeatClass seatClass = new SeatClass();
                Stand stand = new Stand();

                stand.setStandId(rs.getInt("standId"));
                stand.setStandName(rs.getString("standName"));

                matchSeat.setMatchSeatId(rs.getInt("matchSeatId"));

                matchSeat.setMatch(rs.getInt("matchId"));

                seat.setSeatId(rs.getInt("seatId"));
                seat.setSeatName(rs.getString("seatName"));

                seatClass.setPrice(rs.getBigDecimal("seatClassPrice"));
                seatClass.setSeatClassId(rs.getInt("seatClassId"));
                seatClass.setSeatClassName(rs.getString("seatClassName"));
                seat.setQuantity(rs.getInt("quantity"));

                seat.setSeatClass(seatClass);
                seat.setStand(stand);

                matchSeat.setPrice(rs.getBigDecimal("price"));
                matchSeat.setSeatarea(seat);
                matchSeat.setAvailability(rs.getInt("availability"));
                matchSeats.add(matchSeat);
            }
        } catch (SQLException e) {
        }
        return matchSeats;
    }

    public MatchSeat getMatchSeatbyMatchSeatId(int matchSeatId) {
        MatchSeat matchSeat = new MatchSeat();
        String sql = """
                     SELECT 
                     ms.matchSeatId,
                     ms.matchId,
                     ms.seatId,
                     ms.availability,
                     sa.seatId,
                     st.standId as standId,
                     st.standName as standName,
                     sa.seatName,
                     ms.price,
                     sc.price as seatClassPrice,
                     sc.seatClassId,
                     sc.seatClassName,
                     sa.quantity
                     FROM MatchSeat ms
                     join SeatArea sa on sa.seatId = ms.seatId
                     join Stand st on st.standId = sa.standId
                     join SeatClass sc on sc.seatClassId = sa.seatClassId
                     WHERE matchSeatId = ? """;

        try (PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, matchSeatId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                SeatArea seat = new SeatArea();
                SeatClass seatClass = new SeatClass();
                Stand stand = new Stand();

                stand.setStandId(rs.getInt("standId"));
                stand.setStandName(rs.getString("standName"));

                matchSeat.setMatchSeatId(rs.getInt("matchSeatId"));

                matchSeat.setMatch(rs.getInt("matchId"));

                seat.setSeatId(rs.getInt("seatId"));
                seat.setSeatName(rs.getString("seatName"));

                seatClass.setPrice(rs.getBigDecimal("seatClassPrice"));
                seatClass.setSeatClassId(rs.getInt("seatClassId"));
                seatClass.setSeatClassName(rs.getString("seatClassName"));
                seat.setQuantity(rs.getInt("quantity"));

                seat.setSeatClass(seatClass);
                seat.setStand(stand);

                matchSeat.setPrice(rs.getBigDecimal("price"));
                matchSeat.setSeatarea(seat);
                matchSeat.setAvailability(rs.getInt("availability"));
            }
        } catch (SQLException e) {
        }
        return matchSeat;
    }

    public void addOrderTicket(HistoryPurchasedTicketMatchSeat his) {
        String sql = """
                     INSERT INTO [dbo].[HistoryPurchasedTicketMatchSeat]
                                ([team1]
                                ,[team2]
                                ,[startTime]
                                ,[seasonName]
                                ,[seatName]
                                ,[quantity]
                                ,[standName]
                                ,[seatClassName]
                                ,[email]
                                ,[qrCode]
                                ,[price]
                                ,[createdBy]
                                ,[createdDate]
                                ,[matchSeatId])
                     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setString(1, his.getTeam1());
            st.setString(2, his.getTeam2());
            st.setTimestamp(3, Timestamp.valueOf(getFormatDate(his.getStartTime())));
            st.setString(4, his.getSeasonName());
            st.setString(5, his.getSeatName());
            st.setInt(6, his.getQuantity());
            st.setString(7, his.getStandName());
            st.setString(8, his.getSeatClassName());
            st.setString(9, his.getEmail());
            st.setString(10, his.getQrCode());
            st.setBigDecimal(11, his.getPrice());
            st.setString(12, his.getEmail());
            st.setTimestamp(13, Timestamp.valueOf(getFormatDate(LocalDateTime.now())));
            st.setInt(14, his.getMatchSeatId());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("error here");
            System.out.println(ex);
        }
    }

    public int getNewId() {
        String sql = "SELECT TOP 1 ticketMatchSeatId\n"
                + "FROM HistoryPurchasedTicketMatchSeat\n"
                + "ORDER BY ticketMatchSeatId DESC;";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("ticketMatchSeatId");
            }
        } catch (SQLException ex) {
            System.out.println("error here");
            System.out.println(ex);
        }
        return -1;
    }

    public String getTicketById(int id) {
        String sql = "SELECT * FROM HistoryPurchasedTicketMatchSeat where ticketMatchSeatId = ?";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("qrCode");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    public void updateMatchSeatAvailability() {
        String sql = "{call UpdateMatchSeatAvailability}";
        try (CallableStatement st = con.prepareCall(sql);) {
            st.execute();
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error subtraction availability ", ex);
        }
    }

    public static void main(String[] args) {
        INSTANCE.updateMatchSeatAvailability();
    }
}
