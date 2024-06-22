/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author thuat
 */
public class MatchStatus {

    private int matchStatusId;
    private String matchStatusName;

    public MatchStatus() {
    }

    public MatchStatus(int matchStatusId, String matchStatusName) {
        this.matchStatusId = matchStatusId;
        this.matchStatusName = matchStatusName;
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

    @Override
    public String toString() {
        return "MatchStatus{" + "matchStatusId=" + matchStatusId + ", matchStatusName=" + matchStatusName + '}';
    }

}
