/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
public class HistoryPurchasedTicketMatchSeat {

    private int ticketId;
    private String team1;
    private String team2;
    private LocalDateTime startTime;
    private String seasonName;
    private String seatName;
    private int quantity;
    private String standName;
    private String seatClassName;
    private String email;
    private String qrCode;
    private BigDecimal price;
    private TicketStatus statusId;
    private String createdBy;
    private LocalDateTime createdDate;
    private int matchSeatId;
    private MatchSeat matchSeatid;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    private final DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");
    private final DecimalFormat priceFormatter = new DecimalFormat("#,###");

    public HistoryPurchasedTicketMatchSeat() {
    }

    public HistoryPurchasedTicketMatchSeat(String team1, String team2, LocalDateTime startTime, String seasonName, String seatName, int quantity, String standName, String seatClassName, String email, String qrCode, BigDecimal price, String createdBy, LocalDateTime createdDate, int matchSeatId) {
        this.team1 = team1;
        this.team2 = team2;
        this.startTime = startTime;
        this.seasonName = seasonName;
        this.seatName = seatName;
        this.quantity = quantity;
        this.standName = standName;
        this.seatClassName = seatClassName;
        this.email = email;
        this.qrCode = qrCode;
        this.price = price;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.matchSeatId = matchSeatId;
    }

    public HistoryPurchasedTicketMatchSeat(String seatName, int quantity, String standName,
            String seatClassName, String qrCode, BigDecimal price,
            LocalDateTime createdDate, String email) {
        this.seatName = seatName;
        this.quantity = quantity;
        this.standName = standName;
        this.seatClassName = seatClassName;
        this.qrCode = qrCode;
        this.price = price;
        this.createdDate = createdDate;
        this.email = email;
    }

    public HistoryPurchasedTicketMatchSeat(int ticketId, String team1, String team2, LocalDateTime startTime, String seasonName, String seatName, int quantity, String standName, String seatClassName, String email, String qrCode, BigDecimal price, TicketStatus statusId, String createdBy, LocalDateTime createdDate) {
        this.ticketId = ticketId;
        this.team1 = team1;
        this.team2 = team2;
        this.startTime = startTime;
        this.seasonName = seasonName;
        this.seatName = seatName;
        this.quantity = quantity;
        this.standName = standName;
        this.seatClassName = seatClassName;
        this.email = email;
        this.qrCode = qrCode;
        this.price = price;
        this.statusId = statusId;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
    }

    public int getMatchSeatId() {
        return matchSeatId;
    }

    public void setMatchSeatId(int matchSeatId) {
        this.matchSeatId = matchSeatId;
    }

    public MatchSeat getMatchSeatid() {
        return matchSeatid;
    }

    public void setMatchSeatid(MatchSeat matchSeatid) {
        this.matchSeatid = matchSeatid;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public String getTeam1() {
        return team1;
    }

    public void setTeam1(String team1) {
        this.team1 = team1;
    }

    public String getTeam2() {
        return team2;
    }

    public void setTeam2(String team2) {
        this.team2 = team2;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public String getStartTimeConverted() {
        return startTime != null ? timeFormatter.format(startTime) : null;
    }

    public String getSeasonName() {
        return seasonName;
    }

    public void setSeasonName(String seasonName) {
        this.seasonName = seasonName;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public String getPriceFormatter() {
        return priceFormatter.format(price);
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public TicketStatus getStatusId() {
        return statusId;
    }

    public void setStatusId(TicketStatus statusId) {
        this.statusId = statusId;
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

    public String getPurchasedTime() {
        return createdDate != null ? createdDate.format(timeFormatter) : null;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "HistoryPurchasedTicketMatchSeat{\n"
                + "ticketId=" + ticketId + ",\n"
                + "team1=" + team1 + ",\n"
                + "team2=" + team2 + ",\n"
                + "startTime=" + startTime + ",\n"
                + "seasonName=" + seasonName + ",\n"
                + "seatName=" + seatName + ",\n"
                + "quantity=" + quantity + ",\n"
                + "standName=" + standName + ",\n"
                + "seatClassName=" + seatClassName + ",\n"
                + "email=" + email + ",\n"
                + "qrCode=" + qrCode + ",\n"
                + "price=" + price + ",\n"
                + "statusId=" + statusId + ",\n"
                + "createdBy=" + createdBy + ",\n"
                + "createdDate=" + createdDate + ",\n"
                + "formatter=" + formatter + '\n'
                + '}';
    }

}
