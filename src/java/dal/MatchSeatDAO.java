/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import models.MatchSeat;
import models.SeatArea;

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
                     mt.matchSeatId,
                     mt.matchId,
                     mt.seatId,
                     mt.availability,
                     sa.seatId,
                     st.standId as standId,
                     st.standName as standName,
                     sa.seatName,
                     sa.price,
                     sa.quantity
                     FROM MatchSeat mt
                     join SeatArea sa on sa.seatId = mt.seatId
                     join Stand st on st.standId = sa.standId
                     WHERE matchId = ? """;

        try (PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, matchId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MatchSeat matchSeat = new MatchSeat();
                SeatArea seat = new SeatArea();

                matchSeat.setMatchSeatId(rs.getInt("matchSeatId"));

                matchSeat.setMatch(rs.getInt("matchId"));

                seat.setSeatId(rs.getInt("seatId"));
                seat.setSeatName(rs.getString("seatName"));
                seat.setPrice(rs.getBigDecimal("price"));
                seat.setQuantity(rs.getInt("quantity"));
                matchSeat.setSeatarea(seat);
                matchSeat.setAvailability(rs.getInt("availability"));
                matchSeats.add(matchSeat);
            }
        } catch (SQLException e) {
        }
        return matchSeats;
    }

    public static void main(String[] args) {
        System.out.println(INSTANCE.getMatchSeatbyMatch(2).toString());
    }
}
