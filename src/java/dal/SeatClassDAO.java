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
import models.SeatClass;

/**
 *
 * @author nguye
 */
public class SeatClassDAO {

    private static volatile SeatClassDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_SEAT_CLASS = "SELECT * FROM SeatClass ";
    private static final String SEAT_CLASS_ID = "seatClassId";
    private static final String SEAT_CLASS_NAME = "seatClassName";
    private static final String PRICE = "price";

    private SeatClassDAO() {
        // Private constructor to prevent instantiation
        connect = new DBContext().connect;
    }

    public static SeatClassDAO getInstance() {
        if (INSTANCE == null) {
            synchronized (SeatClassDAO.class) {
                if (INSTANCE == null) {
                    INSTANCE = new SeatClassDAO();
                }
            }
        }
        return INSTANCE;
    }
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<SeatClass> getListSeatClass() {
        ArrayList<SeatClass> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_SEAT_CLASS);
            rs = ps.executeQuery();
            while (rs.next()) {
                SeatClass seatClass = new SeatClass();
                seatClass.setSeatClassId(rs.getInt(SEAT_CLASS_ID));
                seatClass.setSeatClassName(rs.getString(SEAT_CLASS_NAME));
                seatClass.setPrice(rs.getBigDecimal(PRICE));
                list.add(seatClass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeatClassDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public static void main(String[] args) {
//        System.out.println(SeatClassDAO.getInstance().getListSeatClass());
////        System.out.println(HistoryPurchasedTicketDAO.getInstance().getlistHistoryPurchasedTicketSeasonSeat());
//    }
}
