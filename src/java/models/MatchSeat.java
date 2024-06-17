/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author thuat
 */
public class MatchSeat {

    private int matchSeatId;
    private int matchId;
    private SeatArea seatarea;
    private int availability;

    public MatchSeat() {
    }

    public MatchSeat(int matchSeatId, int matchId, SeatArea seatarea, int availability) {
        this.matchSeatId = matchSeatId;
        this.matchId = matchId;
        this.seatarea = seatarea;
        this.availability = availability;
    }

    public int getMatchSeatId() {
        return matchSeatId;
    }

    public void setMatchSeatId(int matchSeatId) {
        this.matchSeatId = matchSeatId;
    }

    public int getMatch() {
        return matchId;
    }

    public void setMatch(int matchId) {
        this.matchId = matchId;
    }

    public SeatArea getSeatarea() {
        return seatarea;
    }

    public void setSeatarea(SeatArea seatarea) {
        this.seatarea = seatarea;
    }

    public int getAvailability() {
        return availability;
    }

    public void setAvailability(int availability) {
        this.availability = availability;
    }

    @Override
    public String toString() {
        return "MatchSeat{" + "matchSeatId=" + matchSeatId + ", match=" + matchId + ", seatarea=" + seatarea + ", availability=" + availability + '}';
    }

    

}
