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
 * @author nguye
 */
public class HistoryPurchasedTicketSeasonSeat {

    private int ticketId;
    private SeasonSeat seasonSeatedId;
    private User email;
    private String qrCode;
    private BigDecimal price;
    private int quantity;
    private boolean status;
    private String createdBy;
    private LocalDateTime createdDate;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public HistoryPurchasedTicketSeasonSeat(int ticketId, SeasonSeat seasonSeatedId, User email, String qrCode, BigDecimal price, int quantity, boolean status, String createdBy, LocalDateTime createdDate) {
        this.ticketId = ticketId;
        this.seasonSeatedId = seasonSeatedId;
        this.email = email;
        this.qrCode = qrCode;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
    }

    public HistoryPurchasedTicketSeasonSeat() {
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public SeasonSeat getSeasonSeatedId() {
        return seasonSeatedId;
    }

    public void setSeasonSeatedId(SeasonSeat seasonSeatedId) {
        this.seasonSeatedId = seasonSeatedId;
    }

    public User getEmail() {
        return email;
    }

    public void setEmail(User email) {
        this.email = email;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
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

    public boolean isStatus() {
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

    public String getCreatedDate() {
        return createdDate != null ? createdDate.format(formatter) : null;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "HistoryPurchaseTicketSeasonSeat{"
                + "\n    ticketId=" + ticketId
                + "\n    seasonSeatedId=" + seasonSeatedId
                + "\n    email=" + email
                + "\n    qrCode=" + qrCode
                + "\n    price=" + price
                + "\n    quantity=" + quantity
                + "\n    status=" + status
                + "\n    createdBy=" + createdBy
                + "\n    createdDate=" + createdDate
                + "\n    formatter=" + formatter
                + "\n}";
    }

}
