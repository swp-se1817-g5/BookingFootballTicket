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
public class SeatClass {

    private int seatClassId;
    private String seatClassName;
    private BigDecimal price;

    public SeatClass() {
    }

    public SeatClass(int seatClassId, String seatClassName, BigDecimal price) {
        this.seatClassId = seatClassId;
        this.seatClassName = seatClassName;
        this.price = price;
    }

    public int getSeatClassId() {
        return seatClassId;
    }

    public void setSeatClassId(int seatClassId) {
        this.seatClassId = seatClassId;
    }

    public String getSeatClassName() {
        return seatClassName;
    }

    public void setSeatClassName(String seatClassName) {
        this.seatClassName = seatClassName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "SeatClass{" + "seatClassId=" + seatClassId + ", seatClassName=" + seatClassName + ", price=" + price + '}';
    }

}
