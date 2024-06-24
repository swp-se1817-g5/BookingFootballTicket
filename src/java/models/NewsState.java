/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author nguye
 */
public class NewsState {

    private int stateId;
    private String stateName;
    private int isDeleted;

    public NewsState() {
    }

    public NewsState(int stateId, String stateName, int isDeleted) {
        this.stateId = stateId;
        this.stateName = stateName;
        this.isDeleted = isDeleted;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "NewsState{" + "stateId=" + stateId + ", stateName=" + stateName + ", isDeleted=" + isDeleted + '}';
    }

}
