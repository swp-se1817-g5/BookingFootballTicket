/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
public class Match {

    private int matchId;
    private FootballClub team1;
    private FootballClub team2;
    private Season season;
    private LocalDateTime time;
    private MatchStatus status;
    private MatchType type;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    private final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMMM dd, yyyy");
    private final DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
    private final DateTimeFormatter timeFormatter_1 = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");

    public Match() {
    }

    public Match(int matchId, FootballClub team1, FootballClub team2, Season season, LocalDateTime time, MatchStatus status, MatchType type) {
        this.matchId = matchId;
        this.team1 = team1;
        this.team2 = team2;
        this.season = season;
        this.time = time;
        this.status = status;
        this.type = type;
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

    public String getDate() {
        return time != null ? time.format(dateFormatter) : null;
    }

    public String getDateTime() {
        return time != null ? time.format(timeFormatter) : null;
    }
    
    public LocalDateTime getLocalDateTime(){
        return this.time;
    }
 public String getTimeConverted() {
        return time != null ? timeFormatter_1.format(time) : null;
    }
    @Override
    public String toString() {
        return "Match{" + "matchId=" + matchId + ", team1=" + team1 + ", team2=" + team2 + ", season=" + season + ", time=" + time + ", status=" + status + ", type=" + type + ", formatter=" + formatter + '}';
    }

}
