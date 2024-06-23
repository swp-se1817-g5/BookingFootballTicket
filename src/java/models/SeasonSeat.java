/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;

/**
 *
 * @author nguye
 */
public class SeasonSeat {

    private int seasonSeatId;
    private SeatArea seatId;
    private Season seasonId;
    private BigDecimal price;
    private int availability;

    public SeasonSeat() {
    }

    public SeasonSeat(int seasonSeatId, SeatArea seatId, Season seasonId, BigDecimal price, int availability) {
        this.seasonSeatId = seasonSeatId;
        this.seatId = seatId;
        this.seasonId = seasonId;
        this.price = price;
        this.availability = availability;
    }

    public int getSeasonSeatId() {
        return seasonSeatId;
    }

    public void setSeasonSeatId(int seasonSeatId) {
        this.seasonSeatId = seasonSeatId;
    }

    public SeatArea getSeatId() {
        return seatId;
    }

    public void setSeatId(SeatArea seatId) {
        this.seatId = seatId;
    }

    public Season getSeasonId() {
        return seasonId;
    }

    public void setSeasonId(Season seasonId) {
        this.seasonId = seasonId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getAvailability() {
        return availability;
    }

    public void setAvailability(int availability) {
        this.availability = availability;
    }

    @Override
    public String toString() {
        return "SeasonSeat{" + "seasonSeatId=" + seasonSeatId + ", seatId=" + seatId + ", seasonId=" + seasonId + ", price=" + price + ", availability=" + availability + '}';
    }

}
