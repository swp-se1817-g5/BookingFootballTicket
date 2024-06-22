/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import models.MatchSeat;
import models.SeatArea;
import models.SeatClass;
import models.Stand;

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

    private MatchSeatDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
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

    public static void main(String[] args) {
        System.out.println(INSTANCE.getMatchSeatbyMatch(3).toString());
    }
}
