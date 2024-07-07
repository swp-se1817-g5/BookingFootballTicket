/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;

/**
 *
 * @author thuat
 */
public class TicketHold {
    private int id;
    private int matchSeatId;
    private String email;
    private LocalDateTime holdTime;
    private int holdQuantity;

    public TicketHold() {
    }

    public TicketHold(int id, int matchSeatId, String email, LocalDateTime holdTime, int holdQuantity) {
        this.id = id;
        this.matchSeatId = matchSeatId;
        this.email = email;
        this.holdTime = holdTime;
        this.holdQuantity = holdQuantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMatchSeatId() {
        return matchSeatId;
    }

    public void setMatchSeatId(int matchSeatId) {
        this.matchSeatId = matchSeatId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDateTime getHoldTime() {
        return holdTime;
    }

    public void setHoldTime(LocalDateTime holdTime) {
        this.holdTime = holdTime;
    }

    public int getHoldQuantity() {
        return holdQuantity;
    }

    public void setHoldQuantity(int holdQuantity) {
        this.holdQuantity = holdQuantity;
    }
    
}
