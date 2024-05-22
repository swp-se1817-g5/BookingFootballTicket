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
    private FootballClub team1;
    private FootballClub team2;
    private String stadiumImg;
    private Date time;
    private MatchStatus status;
    private MatchType type;
    private String createdBy;
    private LocalDate createdDate;
    private String updatedBy;
    private LocalDate lastUpdatedDate;
    private boolean isDeleted;

    public Match() {
    }

    public Match(int matchId, FootballClub team1, FootballClub team2, String stadiumImg, Date time, MatchStatus status, MatchType type, String createdBy, LocalDate createdDate, String updatedBy, LocalDate lastUpdatedDate, boolean isDeleted) {
        this.matchId = matchId;
        this.team1 = team1;
        this.team2 = team2;
        this.stadiumImg = stadiumImg;
        this.time = time;
        this.status = status;
        this.type = type;
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

    public FootballClub getTeam1() {
        return team1;
    }

    public void setTeam1(FootballClub team1) {
        this.team1 = team1;
    }

    public FootballClub getTeam2() {
        return team2;
    }

    public void setTeam2(FootballClub team2) {
        this.team2 = team2;
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

    public MatchStatus getStatus() {
        return status;
    }

    public void setStatus(MatchStatus status) {
        this.status = status;
    }

    public MatchType getType() {
        return type;
    }

    public void setType(MatchType type) {
        this.type = type;
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

    @Override
    public String toString() {
        return "Match{" + "matchId=" + matchId + ", team1=" + team1 + ", team2=" + team2 + ", stadiumImg=" + stadiumImg + ", time=" + time + ", status=" + status + ", type=" + type + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + lastUpdatedDate + ", isDeleted=" + isDeleted + '}';
    }
    
    

}
