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
public class MatchType {

    private int typeId;
    private String name;
    private String createdBy;
    private LocalDate createdDate;
    private String updatedBy;
    private LocalDate lastUpdatedDate;
    private boolean isDeleted;

    public MatchType() {
    }

    public MatchType(int typeId, String name, String createdBy, LocalDate createdDate, String updatedBy, LocalDate lastUpdatedDate, boolean isDeleted) {
        this.typeId = typeId;
        this.name = name;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.isDeleted = isDeleted;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        return "MatchType{" + "typeId=" + typeId + ", name=" + name + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + lastUpdatedDate + ", isDeleted=" + isDeleted + '}';
    }
    
    

   

}
