package dal;

import java.sql.*;
import java.util.ArrayList;
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

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

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
            e.printStackTrace(); // Print stack trace or use a logger to log the exception
        }
        return seats;
    }
}
