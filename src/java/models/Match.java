/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author admin
 */
public class Match {

    private int matchId;
    private int team1;
    private int team2;
    private int seasonId;
    private String stadiumImg;
    private Date time;
    private int statusId;
    private int typeId;
    private String createdBy;
    private LocalDate createdDate;
    private String updatedBy;
    private LocalDate lastUpdatedDate;
    private boolean isDeleted;

    public Match() {
    }

    public Match(int matchId, int team1, int team2, int seasonId, String stadiumImg, Date time, int statusId, int typeId, String createdBy, LocalDate createdDate, String updatedBy, LocalDate lastUpdatedDate, boolean isDeleted) {
        this.matchId = matchId;
        this.team1 = team1;
        this.team2 = team2;
        this.seasonId = seasonId;
        this.stadiumImg = stadiumImg;
        this.time = time;
        this.statusId = statusId;
        this.typeId = typeId;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.isDeleted = isDeleted;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getTeam1() {
        return team1;
    }

    public void setTeam1(int team1) {
        this.team1 = team1;
    }

    public int getTeam2() {
        return team2;
    }

    public void setTeam2(int team2) {
        this.team2 = team2;
    }

    public int getSeasonId() {
        return seasonId;
    }

    public void setSeasonId(int seasonId) {
        this.seasonId = seasonId;
    }

    public String getStadiumImg() {
        return stadiumImg;
    }

    public void setStadiumImg(String stadiumImg) {
        this.stadiumImg = stadiumImg;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public LocalDate getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(LocalDate lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

}
