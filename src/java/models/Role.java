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
public class Role {

    private int roleId;
    private String roleName;
    private String createBy;
    private LocalDate createdDate;
    private String updateBy;
    private LocalDate lastUpdateDate;
    private boolean isDeleted;

    public Role() {
    }

    public Role(int roleId, String roleName, String createBy, LocalDate createdDate, String updateBy, LocalDate lastUpdateDate, boolean isDeleted) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.createBy = createBy;
        this.createdDate = createdDate;
        this.updateBy = updateBy;
        this.lastUpdateDate = lastUpdateDate;
        this.isDeleted = isDeleted;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
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
