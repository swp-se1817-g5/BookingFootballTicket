/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;

/**
 *
 * @author admin
 */
public class SeatArea {

    private int seatId;
    private String seatName;
    private Stand stand;
    private SeatClass seatClass;
    private int quantity;
    private boolean isActive;

    public SeatArea() {
    }

    public SeatArea(int seatId, String seatName, Stand stand, SeatClass seatClass, int quantity, boolean isActive) {
        this.seatId = seatId;
        this.seatName = seatName;
        this.stand = stand;
        this.seatClass = seatClass;
        this.quantity = quantity;
        this.isActive = isActive;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public Stand getStand() {
        return stand;
    }

    public void setStand(Stand stand) {
        this.stand = stand;
    }

    public SeatClass getSeatClass() {
        return seatClass;
    }

    public void setSeatClass(SeatClass seatClass) {
        this.seatClass = seatClass;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "SeatArea{" + "seatId=" + seatId + ", seatName=" + seatName + ", stand=" + stand + ", seatClass=" + seatClass + ", quantity=" + quantity + ", isActive=" + isActive + '}';
    }

}
