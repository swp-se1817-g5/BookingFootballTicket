/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import models.SeatArea;
import models.Stand;

/**
 *
 * @author admin
 */
public class SeatAreaDAO {

    public static SeatAreaDAO INSTANCE = new SeatAreaDAO();
    private Connection con;

    private SeatAreaDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public ArrayList<SeatArea> getSeat() {
        ArrayList<SeatArea> seats = new ArrayList<>();
        String sql = """
                     SELECT 
                     sa.seatId,
                     st.standId as standId,
                     st.standName as standName,
                     sa.seatName,
                     sa.price,
                     sa.quantity,
                     sa.createdBy,
                     sa.createdDate,
                     sa.updatedBy,
                     sa.lastUpdatedDate
                     FROM [SeatArea] sa
                     JOIN Stand st on st.standId = sa.standId
                     WHERE isDeleted = 0 """;

        try {
            PreparedStatement ps = con.prepareStatement(sql);


            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SeatArea seat = new SeatArea();
                Stand stand = new Stand();

                stand.setStandId(rs.getInt("standId"));
                stand.setStandName(rs.getString("standName"));

                seat.setSeatId(rs.getInt("seatId"));
                seat.setSeatName(rs.getString("seatName"));
                seat.setPrice(rs.getBigDecimal("price"));
                seat.setQuantity(rs.getInt("quantity"));
                seat.setStand(stand);
                seat.setCreatedBy(rs.getString("createdBy"));
                seat.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                seat.setUpdatedBy(rs.getString("updatedBy"));
                seat.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") == null ? null : rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                seats.add(seat);
            }
        } catch (SQLException e) {
        }
        return seats;
    }

    public boolean createStand(Stand stand) {
        boolean created = false;
        String sql = "insert into stand(standName, createdBy) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, stand.getStandName());
            ps.setString(2, stand.getCreatedBy());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return created;
    }

    public boolean deleteStand(int standId) {
        boolean deleted = false;
        String sql = "update stand set isDeleted = 1 where standId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, standId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public boolean updateStand(Stand stand) {
        boolean updated = false;
        String sql = "update stand set standName = ?, updatedBy = ? where standId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, stand.getStandName());
            ps.setString(2, stand.getUpdatedBy());
            ps.setInt(3, stand.getStandId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }
    
    public static void main(String[] args) {
        System.out.println(INSTANCE.getSeat().get(0).toString());
    }

}
