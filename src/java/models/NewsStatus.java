/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author nguye
 */
public class NewsStatus {

    private int statusId;
    private String statusName;
    private int isDeleted;

    public NewsStatus() {
    }

    public NewsStatus(int statusId, String statusName, int isDeleted) {
        this.statusId = statusId;
        this.statusName = statusName;
        this.isDeleted = isDeleted;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "NewsStatus{" + "statusId=" + statusId + ", statusName=" + statusName + ", isDeleted=" + isDeleted + '}';
    }

}
