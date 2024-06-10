/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import models.MatchSeat;
import models.SeatArea;
import models.Stand;

/**
 *
 * @author admin
 */
public class MatchSeatDAO {

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
                     matchSeatId,
                     matchId,
                     seatId,
                     availability
                     FROM MatchSeat
                     WHERE matchId = ? """;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, matchId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MatchSeat matchSeat = new MatchSeat();

                matchSeat.setMatchSeatId(rs.getInt("matchSeatId"));
                matchSeat.setMatchId(rs.getInt("matchId"));
                matchSeat.setSeatId(rs.getInt("seatId"));
                matchSeat.setAvailability(rs.getInt("availability"));
                matchSeats.add(matchSeat);
            }
        } catch (SQLException e) {
        }
        return matchSeats;
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
        System.out.println(INSTANCE.getMatchSeatbyMatch(2).get(0).toString());
    }

}
