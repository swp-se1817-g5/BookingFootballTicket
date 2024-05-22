/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDate;

/**
 *
 * @author admin
 */
public class FootballClub {

    private int clubId;
    private String clubName;
    private String createBy;
    private LocalDate createdDate;
    private String updateBy;
    private LocalDate lastUpdateDate;
    private boolean isDeleted;

    public FootballClub() {
    }

    public FootballClub(int clubId, String clubName, String createBy, LocalDate createdDate, String updateBy, LocalDate lastUpdateDate, boolean isDeleted) {
        this.clubId = clubId;
        this.clubName = clubName;
        this.createBy = createBy;
        this.createdDate = createdDate;
        this.updateBy = updateBy;
        this.lastUpdateDate = lastUpdateDate;
        this.isDeleted = isDeleted;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public LocalDate getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(LocalDate lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

}
