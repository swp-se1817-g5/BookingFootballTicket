/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Logger;
import models.BookingTicket;
import models.HistoryPurchasedTicketMatchSeat;

/**
 *
 * @author AD
 */
public class DaoBooking {
    public static DaoBooking INSTANCE = new DaoBooking();
    private Connection con;
    private static final Logger LOGGER = Logger.getLogger(MatchSeatDAO.class.getName());

    private DaoBooking() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }
    
    public void addOrderTicket(BookingTicket book) {
        String sql = """
                     INSERT INTO [dbo].[BookingTicket]
                                ([seatName]
                                ,[quantity]
                                ,[standName]
                                ,[seatClassName]
                                ,[email]
                                ,[qrCode]
                                ,[price]
                                ,[status]
                                ,[createdDate]
                                ,[matchId]
                                ,[matchSeatId])
                          VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setString(1, book.getSeatName());
            st.setInt(2, book.getQuantity());
            st.setString(3, book.getStandName());
            st.setString(4, book.getSeatClassName());
            st.setString(5, book.getEmail());
            st.setString(6, book.getQrCode());
            st.setBigDecimal(7, book.getPrice());
            st.setString(8, book.getStatus());
            st.setTimestamp(9, Timestamp.valueOf(getFormatDate(LocalDateTime.now())));
            st.setInt(10, book.getMatchId());
            st.setInt(11, book.getMatchSeatId());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    // Method to get BookingTicket by bookingId
    public BookingTicket getBookingTicketById(int bookingId) {
        String sql = "SELECT * FROM [dbo].[BookingTicket] WHERE [bookingId] = ?";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, bookingId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int quantity = rs.getInt("quantity");
                    int matchId = rs.getInt("matchId");
                    int matchSeatId = rs.getInt("matchSeatId");
                    String seatName = rs.getString("seatName");
                    String standName = rs.getString("standName");
                    String seatClassName = rs.getString("seatClassName");
                    String email = rs.getString("email");
                    String qrCode = rs.getString("qrCode");
                    BigDecimal price = rs.getBigDecimal("price");
                    String status = rs.getString("status");
                    LocalDateTime createdDate = rs.getTimestamp("createdDate").toLocalDateTime();
                    return new BookingTicket(bookingId, quantity, matchId,matchSeatId, seatName, 
                            standName, seatClassName, email, qrCode,
                            price, status, createdDate
                    );
                    
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null; // return null if no record found
    }
    
    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    public int getNewId() {
        String sql = "SELECT TOP 1 bookingId\n"
                + "FROM BookingTicket\n"
                + "ORDER BY bookingId DESC;";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("bookingId");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -1;
    }
      // Method to update status by bookingId
    public void updateBookingStatus(BookingTicket book) {
        String sql = "UPDATE [dbo].[BookingTicket] SET [status] = ? WHERE [bookingId] = ?";
        try (PreparedStatement st = con.prepareStatement(sql);) {
            st.setString(1, book.getStatus());
            st.setInt(2, book.getBookingId());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    public static void main(String[] args) {
        
    }
}
