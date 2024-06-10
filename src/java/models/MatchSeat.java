/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;

/**
 *
 * @author thuat
 */
public class MatchSeat {

    private int matchSeatId;
    private int matchId;
    private int seatId;
    private int availability;

    public MatchSeat(int matchSeatId, int matchId, int seatId, int availability) {
        this.matchSeatId = matchSeatId;
        this.matchId = matchId;
        this.seatId = seatId;
        this.availability = availability;
    }

    public MatchSeat() {
    }

    public int getMatchSeatId() {
        return matchSeatId;
    }

    public void setMatchSeatId(int matchSeatId) {
        this.matchSeatId = matchSeatId;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public int getAvailability() {
        return availability;
    }

    public void setAvailability(int availability) {
        this.availability = availability;
    }
    
    @Override
    public String toString() {
        return "MatchSeat{" + "matchSeatId=" + matchSeatId + ", matchId=" + matchId + ", seatId=" + seatId + ", availability=" + availability + '}';
    }

}
