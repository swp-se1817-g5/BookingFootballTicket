/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.*;

/**
 *
 * @author admin
 */
public class DashboardDAO {

    private static DashboardDAO instance;
    private Connection con;

    private DashboardDAO() {
        con = new DBContext().connect;
    }

    public static DashboardDAO getInstance() {
        if (instance == null) {
            instance = new DashboardDAO();
        }
        return instance;
    }

    public int getTotalTicketsSold(int month, int year) {
        int total = 0;
        String sql = "SELECT SUM(quantity) FROM HistoryPurchasedTicketMatchSeat WHERE YEAR(createdDate) = ? ";
        if (month != 0) {
            sql += "AND MONTH(createdDate) = ?";
        }
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, year);
            if (month != 0) {
                ps.setInt(2, month);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getBigDecimal(1) != null) {
                total = rs.getInt(1);
            }
            total += countSeasonTickets(month, year);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return total;
    }

    public int countSeasonTickets(int month, int year) {
        int count = 0;
        String sql = "SELECT Sum(quantity) FROM HistoryPurchasedTicketSeasonSeat WHERE YEAR(createdDate) = ? ";
        if (month != 0) {
            sql += "AND MONTH(createdDate) = ?";
        }
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, year);
            if (month != 0) {
                ps.setInt(2, month);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getBigDecimal(1) != null) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return count;
    }

    public int getTotalTicketsSold() {
        int total = 0;
        String sql = "SELECT SUM(ticket_count) AS total_tickets "
                + "FROM ("
                + "    SELECT SUM(quantity) AS ticket_count FROM HistoryPurchasedTicketMatchSeat "
                + "    UNION ALL "
                + "    SELECT SUM(quantity) AS ticket_count FROM HistoryPurchasedTicketSeasonSeat"
                + ") AS combined_counts";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getBigDecimal(1) != null) {
                total = rs.getInt("total_tickets");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return total;
    }

    public BigDecimal getTotalRevenue() {
        BigDecimal totalRevenue = BigDecimal.ZERO;
        String sql = "SELECT SUM(price) AS total_revenue FROM ( "
                + "    SELECT price FROM HistoryPurchasedTicketMatchSeat "
                + "    UNION ALL "
                + "    SELECT price FROM HistoryPurchasedTicketSeasonSeat "
                + ") AS combined_tickets";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getBigDecimal(1) != null) {
                totalRevenue = rs.getBigDecimal("total_revenue");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalRevenue;
    }

    public BigDecimal getTotalRevenue(int month, int year) {
        BigDecimal total = BigDecimal.ZERO;
        String sql = "SELECT SUM(price) FROM HistoryPurchasedTicketMatchSeat WHERE YEAR(createdDate) = ? ";
        if (month != 0) {
            sql += "AND MONTH(createdDate) = ?";
        }
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, year);
            if (month != 0) {
                ps.setInt(2, month);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getBigDecimal(1) != null) {
                total = rs.getBigDecimal(1);
            }
            total = total.add(getSeasonsRevenue(month, year));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return total;
    }

    public BigDecimal getSeasonsRevenue(int month, int year) {
        BigDecimal total = BigDecimal.ZERO;
        String sql = "SELECT SUM(price) FROM HistoryPurchasedTicketSeasonSeat WHERE YEAR(createdDate) = ? ";
        if (month != 0) {
            sql += "AND MONTH(createdDate) = ?";
        }
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, year);
            if (month != 0) {
                ps.setInt(2, month);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getBigDecimal(1) != null) {
                total = rs.getBigDecimal(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return total;
    }

    public static void main(String[] args) {
        System.out.println(DashboardDAO.getInstance().getTotalTicketsSold());
    }

}
