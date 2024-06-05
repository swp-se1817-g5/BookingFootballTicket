/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
public class SeatArea {
    private int seatId;
    private Stand stand;
    private BigDecimal price;
    private int quantity;
    private String createdBy;
    private DateTimeFormatter createdDate;
    private String updatedBy;
    private DateTimeFormatter lastUpdatedDate;

    public SeatArea() {
    }

    public SeatArea(int seatId, Stand stand, BigDecimal price, int quantity, String createdBy, DateTimeFormatter createdDate, String updatedBy, DateTimeFormatter lastUpdatedDate) {
        this.seatId = seatId;
        this.stand = stand;
        this.price = price;
        this.quantity = quantity;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
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

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public DateTimeFormatter getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(DateTimeFormatter createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public DateTimeFormatter getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(DateTimeFormatter lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }
    
        
  
    
}
