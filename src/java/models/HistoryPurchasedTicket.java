/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
public class HistoryPurchasedTicket {

    private int ticketId;
    private MatchSeat matchSeatId;
    private String email;
    private String qrCode;
    private BigDecimal price;
    private int quantity;
    private boolean status;
    private String createdBy;
    private LocalDateTime createdDate;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public HistoryPurchasedTicket() {
    }

    public HistoryPurchasedTicket(int ticketId, MatchSeat matchSeatId, String email, String qrCode, LocalDateTime createdDate, BigDecimal price, int quantity, boolean status, String createdBy) {
        this.ticketId = ticketId;
        this.matchSeatId = matchSeatId;
        this.email = email;
        this.qrCode = qrCode;
        this.createdDate = createdDate;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.createdBy = createdBy;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public MatchSeat getMatchSeatId() {
        return matchSeatId;
    }

    public void setMatchSeatId(MatchSeat matchSeatId) {
        this.matchSeatId = matchSeatId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public String getCreatedDate() {
        return createdDate != null ? createdDate.format(formatter) : null;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
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

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "HistoryPurchasedTicket{" + "ticketId=" + ticketId + ", matchSeatId=" + matchSeatId + ", email=" + email + ", qrCode=" + qrCode + ", createdDate=" + createdDate + ", price=" + price + ", quantity=" + quantity + ", status=" + status + ", createdBy=" + createdBy + '}';
    }

}
