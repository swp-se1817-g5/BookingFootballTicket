package dal;

import java.sql.*;
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
                seat.setQuantity(rs.getInt("quantity"));
                seat.setStand(stand);
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
        try (PreparedStatement ps = con.prepareStatement(sql)) {
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
}
