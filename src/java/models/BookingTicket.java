/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.time.LocalDateTime;

    /**
 *
 * @author AD
 */
public class BookingTicket {
    private int bookingId, quantity, matchId,matchSeatId;
    private String seatName, standName, seatClassName, email,qrCode;
    private BigDecimal price;
    private String status;
    private LocalDateTime createdDate;

    public BookingTicket() {
    }

    public BookingTicket(int bookingId, int quantity, int matchId,int matchSeatId, String seatName, String standName, String seatClassName, String email, String qrCode, BigDecimal price, String status, LocalDateTime createdDate) {
        this.bookingId = bookingId;
        this.quantity = quantity;
        this.matchId = matchId;
        this.matchSeatId = matchSeatId;
        this.seatName = seatName;
        this.standName = standName;
        this.seatClassName = seatClassName;
        this.email = email;
        this.qrCode = qrCode;
        this.price = price;
        this.status = status;
        this.createdDate = createdDate;
    }
    public BookingTicket(int quantity, int matchId, int matchSeatId, String seatName, String standName, String seatClassName, String email, String qrCode, BigDecimal price, String status, LocalDateTime createdDate) {
        this.quantity = quantity;
        this.matchId = matchId;
        this.matchSeatId = matchSeatId;
        this.seatName = seatName;
        this.standName = standName;
        this.seatClassName = seatClassName;
        this.email = email;
        this.qrCode = qrCode;
        this.price = price;
        this.status = status;
        this.createdDate = createdDate;
    }

    public BookingTicket(int bookingId, String status) {
        this.bookingId = bookingId;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getMatchSeatId() {
        return matchSeatId;
    }

    public void setMatchSeatId(int matchSeatId) {
        this.matchSeatId = matchSeatId;
    }
    

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public String getStandName() {
        return standName;
    }

    public void setStandName(String standName) {
        this.standName = standName;
    }

    public String getSeatClassName() {
        return seatClassName;
    }

    public void setSeatClassName(String seatClassName) {
        this.seatClassName = seatClassName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "BookingTicket{" + "bookingId=" + bookingId + ", quantity=" + quantity + ", matchId=" + matchId + ", matchSeatId=" + matchSeatId + ", seatName=" + seatName + ", standName=" + standName + ", seatClassName=" + seatClassName + ", email=" + email + ", qrCode=" + qrCode + ", price=" + price + ", status=" + status + ", createdDate=" + createdDate + '}';
    }

}
