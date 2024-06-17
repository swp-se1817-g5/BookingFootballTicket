package dal;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import models.SeatArea;
import models.Stand;

public class SeatAreaDAO {

    public static final SeatAreaDAO INSTANCE = new SeatAreaDAO();
    private final Connection con;

    private SeatAreaDAO() {
        con = new DBContext().connect;
    }

    /**
     *
     * @return
     */
    public ArrayList<SeatArea> getSeatByMatch() {
        ArrayList<SeatArea> seats = new ArrayList<>();
        String sql = """
                     SELECT 
                     sa.seatId,
                     st.standId as standId,
                     st.standName as standName,
                     sa.seatName,
                     sa.price,
                     sa.quantity
                     FROM [SeatArea] sa
                     JOIN Stand st on st.standId = sa.standId
                     WHERE sa.isDeleted = 0 """;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
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
                seats.add(seat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seats;
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

}
