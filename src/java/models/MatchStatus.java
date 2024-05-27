/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author thuat
 */
public class MatchStatus {

    private int matchStatusId;
    private String matchStatusName;
    private String createdBy;
    private LocalDateTime createdDate;
    private String updatedBy;
    private LocalDateTime lastUpdatedDate;
    private boolean isDeleted;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");

    public MatchStatus() {
    }

    public MatchStatus(int matchStatusId, String matchStatusName, String createdBy, LocalDateTime createdDate, String updatedBy, LocalDateTime lastUpdatedDate, boolean isDeleted) {
        this.matchStatusId = matchStatusId;
        this.matchStatusName = matchStatusName;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.isDeleted = isDeleted;
    }

    public int getMatchStatusId() {
        return matchStatusId;
    }

    public void setMatchStatusId(int matchStatusId) {
        this.matchStatusId = matchStatusId;
    }

    public String getMatchStatusName() {
        return matchStatusName;
    }

    public void setMatchStatusName(String matchStatusName) {
        this.matchStatusName = matchStatusName;
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

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getLastUpdatedDate() {
        return lastUpdatedDate != null ? lastUpdatedDate.format(formatter) : null;
    }

    public void setLastUpdatedDate(LocalDateTime lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "MatchStatus{" + "matchStatusId=" + matchStatusId + ", matchStatusName=" + matchStatusName + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + lastUpdatedDate + ", isDeleted=" + isDeleted + ", formatter=" + formatter + '}';
    }
    
}
