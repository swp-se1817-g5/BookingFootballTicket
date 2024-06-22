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
    private BigDecimal price;
    private int quantity;

    


    public SeatArea() {
    }


    public SeatArea(int seatId, String seatName, Stand stand, BigDecimal price, int quantity) {
        this.seatId = seatId;
        this.seatName = seatName;
        this.stand = stand;
        this.price = price;
        this.quantity = quantity;
    }
    
    
    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }
    
   

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public Stand getStand() {
        return stand;
    }

    public void setStand(Stand stand) {
        this.stand = stand;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


}
