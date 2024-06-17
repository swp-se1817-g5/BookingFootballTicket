/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
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
            e.printStackTrace();
        }
        return seats;
    }

    public List<SeatArea> paggingSeatAreas(int pageIndex, int numberItemsPerPage, String seatAreaSearch, String standSearch) {
        List<SeatArea> seatAreas = new ArrayList<>();
        String sql = "SELECT \n"
                + "    sa.seatId, \n"
                + "    sa.seatName, \n"
                + "    sa.price, \n"
                + "    sa.quantity, \n"
                + "    sa.createdBy, \n"
                + "    sa.createdDate, \n"
                + "    sa.updatedBy, \n"
                + "    sa.lastUpdatedDate, \n"
                + "    s.standId, \n"
                + "    s.standName\n"
                + "FROM \n"
                + "    SeatArea sa\n"
                + "JOIN \n"
                + "    Stand s \n"
                + "ON \n"
                + "    sa.standId = s.standId\n"
                + "where sa.seatName = ? and s.standName = ?\n"
                + "ORDER BY seatId\n"
                + "Offset ? ROWS FETCH Next ? ROWS only";
        try(PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + seatAreaSearch + "%");
            ps.setString(2, "%" + standSearch + "%");
            ps.setInt(3, (pageIndex - 1) * numberItemsPerPage);
            ps.setInt(4, numberItemsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                SeatArea seatArea = new SeatArea();
                  seatArea.setSeatId(rs.getInt("seatId"));
                seatArea.setSeatName(rs.getString("seatName"));
                seatArea.setPrice(rs.getBigDecimal("price"));
                seatArea.setQuantity(rs.getInt("quantity"));
                seatArea.setCreatedBy(rs.getString("createdBy"));
                seatArea.setCreatedDate(rs.getTimestamp("createdDate") == null ? null : rs.getTimestamp("createdDate").toLocalDateTime());
                seatArea.setUpdatedBy(rs.getString("updatedBy"));
                seatArea.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") == null ? null : rs.getTimestamp("lastUpdatedDate").toLocalDateTime());

                Stand stand = new Stand();
                stand.setStandId(rs.getInt("standId"));
                stand.setStandName(rs.getString("standName"));

                seatArea.setStand(stand);

                seatAreas.add(seatArea);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return seatAreas;
    }

    public int getTotal(String seatAreaSearch, String standSearch) {
        int total = 0;
        String sql = "select count(*) from SeatArea sa join Stand s\n"
                + "on sa.standId = s.standId\n"
                + "where sa.seatName like ? and s.standName like ? ";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + seatAreaSearch + "%");
            ps.setString(2, "%" + standSearch + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return total;
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
        System.out.println(INSTANCE.paggingSeatAreas(1, 5, "", "").toString());
    }

}
