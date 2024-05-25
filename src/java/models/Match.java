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
 * @author admin
 */
public class Match {

    private int matchId;
    private FootballClub team1;
    private FootballClub team2;
    private Season season;
    private String stadiumImg;
    private LocalDateTime time;
    private MatchStatus status;
    private MatchType type; 
    private String createdBy;
    private LocalDateTime createdDate;
    private String updatedBy;
    private LocalDateTime lastUpdatedDate;
    private boolean isDeleted;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");
    
    public Match() {
    }

    public Match(int matchId, FootballClub team1, FootballClub team2, Season season, String stadiumImg, LocalDateTime time, MatchStatus status, MatchType type, String createdBy, LocalDateTime createdDate, String updatedBy, LocalDateTime lastUpdatedDate, boolean isDeleted) {
        this.matchId = matchId;
        this.team1 = team1;
        this.team2 = team2;
        this.season = season;
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

    public Season getSeason() {
        return season;
    }

    public void setSeason(Season season) {
        this.season = season;
    }

    public String getStadiumImg() {
        return stadiumImg;
    }

    public void setStadiumImg(String stadiumImg) {
        this.stadiumImg = stadiumImg;
    }

    public String getTime() {
        return time != null ? time.format(formatter) : null;
    }

    public void setTime(LocalDateTime time) {
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

}
