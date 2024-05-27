/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author thuat
 */
public class Season {

    private int seasonId;
    private String seasonName;
    private Date startDate;
    private Date endDate;
    private String createdBy;
    private LocalDateTime createdDate;
    private String updatedBy;
    private LocalDateTime lastUpdatedDate;
    private boolean isDeleted;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");
    
    public Season() {
    }

    public Season(int seasonId, String seasonName, Date startDate, Date endDate, String createdBy, LocalDateTime createdDate, String updatedBy, LocalDateTime lastUpdatedDate, boolean isDeleted) {
        this.seasonId = seasonId;
        this.seasonName = seasonName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.isDeleted = isDeleted;
    }

    public Season(String seasonName, Date startDate, Date endDate) {
        this.seasonName = seasonName;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    

    public int getSeasonId() {
        return seasonId;
    }

    public void setSeasonId(int seasonId) {
        this.seasonId = seasonId;
    }

    public String getSeasonName() {
        return seasonName;
    }

    public void setSeasonName(String seasonName) {
        this.seasonName = seasonName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
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
        return lastUpdatedDate!= null ? lastUpdatedDate.format(formatter) : null;
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
        return "Season{" + "seasonId=" + seasonId + ", seasonName=" + seasonName + ", startDate=" + startDate + ", endDate=" + endDate + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + lastUpdatedDate + ", isDeleted=" + isDeleted + '}';
    }
    

}
