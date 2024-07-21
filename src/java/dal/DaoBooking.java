/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.lang.System.Logger.Level;
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

    public boolean addOrderTicketWithAvailabilityCheck(BookingTicket book) {
        String subtractSql = "UPDATE MatchSeat SET availability = availability - ? WHERE matchSeatId = ? AND availability >= ?";
        String insertSql = "INSERT INTO [dbo].[BookingTicket] ([seatName], [quantity], [standName], [seatClassName], [email], [qrCode], [price], [status], [createdDate], [matchId], [matchSeatId]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement subtractSt = con.prepareStatement(subtractSql); PreparedStatement insertSt = con.prepareStatement(insertSql)) {

            // Bắt đầu giao dịch
            con.setAutoCommit(false);

            // Cập nhật số lượng khả dụng
            subtractSt.setInt(1, book.getQuantity());
            subtractSt.setInt(2, book.getMatchSeatId());
            subtractSt.setInt(3, book.getQuantity());

            int rowsUpdated = subtractSt.executeUpdate();

            if (rowsUpdated > 0) {
                // Thêm vé vào bảng BookingTicket
                insertSt.setString(1, book.getSeatName());
                insertSt.setInt(2, book.getQuantity());
                insertSt.setString(3, book.getStandName());
                insertSt.setString(4, book.getSeatClassName());
                insertSt.setString(5, book.getEmail());
                insertSt.setString(6, book.getQrCode());
                insertSt.setBigDecimal(7, book.getPrice());
                insertSt.setString(8, book.getStatus());
                insertSt.setTimestamp(9, Timestamp.valueOf(LocalDateTime.now()));
                insertSt.setInt(10, book.getMatchId());
                insertSt.setInt(11, book.getMatchSeatId());

                insertSt.executeUpdate();

                // Cam kết giao dịch
                con.commit();
                return true;
            } else {
                // Nếu không cập nhật được số lượng khả dụng thì rollback
                con.rollback();
                return false;
            }

        } catch (SQLException ex) {
            try {
                // Rollback giao dịch nếu có lỗi
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                // Xử lý lỗi rollback (nếu cần)
            }
            // Ghi log hoặc thông báo lỗi (nếu cần)
            return false;
        } finally {
            try {
                // Thiết lập lại AutoCommit sau khi giao dịch kết thúc
                if (con != null) {
                    con.setAutoCommit(true);
                }
            } catch (SQLException ex) {
                // Xử lý lỗi thiết lập AutoCommit (nếu cần)
            }
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
                    return new BookingTicket(bookingId, quantity, matchId, matchSeatId, seatName,
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
