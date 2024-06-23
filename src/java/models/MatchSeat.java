/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;

/**
 *
 * @author thuat
 */
public class MatchSeat {

    private int matchSeatId;
    private int matchId;
    private SeatArea seatarea;
    private BigDecimal price;
    private int availability;

    public MatchSeat() {
    }

    public MatchSeat(int matchSeatId, int matchId, SeatArea seatarea, BigDecimal price, int availability) {
        this.matchSeatId = matchSeatId;
        this.matchId = matchId;
        this.seatarea = seatarea;
        this.price = price;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "MatchSeat{" + "matchSeatId=" + matchSeatId + ", matchId=" + matchId + ", seatarea=" + seatarea + ", price=" + price + ", availability=" + availability + '}';
    }

}
