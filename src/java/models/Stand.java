/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author admin
 */
public class Stand {

    private int standId;
    private String standName;
    private int classId;
    private BigDecimal price;
    private int quantity;
    private LocalDate createdDate;
    private String updateBy;
    private LocalDate lastUpdateDate;
    private boolean isDeleted;

    public Stand(int standId, String standName, int classId, BigDecimal price, int quantity, LocalDate createdDate, String updateBy, LocalDate lastUpdateDate, boolean isDeleted) {
        this.standId = standId;
        this.standName = standName;
        this.classId = classId;
        this.price = price;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.updateBy = updateBy;
        this.lastUpdateDate = lastUpdateDate;
        this.isDeleted = isDeleted;
    }

    public int getStandId() {
        return standId;
    }

    public void setStandId(int standId) {
        this.standId = standId;
    }

    public String getStandName() {
        return standName;
    }

    public void setStandName(String standName) {
        this.standName = standName;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    @Override
    public String toString() {
        return "Stand{" + "standId=" + standId + ", standName=" + standName + ", classId=" + classId + ", price=" + price + ", quantity=" + quantity + ", createdDate=" + createdDate + ", updateBy=" + updateBy + ", lastUpdateDate=" + lastUpdateDate + ", isDeleted=" + isDeleted + '}';
    }
    
    
    
    
    
    
}
