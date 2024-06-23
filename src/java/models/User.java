package models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class User {

    private String email;
    private String name;
    private int roleId;
    private String hashedPassword;
    private String phoneNumber;
    private String avatar;
    private String createdBy;
    private LocalDateTime createdDate;
    private String updatedBy;
    private LocalDateTime lastUpdatedDate;
    private boolean status;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");

    public User() {
    }

    public User(String email, String name, int roleId, String hashedPassword, String phoneNumber, String avatar, String createdBy, LocalDateTime createdDate, String updatedBy, LocalDateTime lastUpdatedDate, boolean status) {
        this.email = email;
        this.name = name;
        this.roleId = roleId;
        this.hashedPassword = hashedPassword;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.status = status;
    }

    public User(String email, String name, int roleId, String hashedPassword, String phoneNumber, String avatar, String createdBy, LocalDateTime createdDate, boolean status) {
        this.email = email;
        this.name = name;
        this.roleId = roleId;
        this.hashedPassword = hashedPassword;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.status = status;
    }

    public String getFormattedLastUpdatedDate() {
        return lastUpdatedDate != null ? lastUpdatedDate.format(formatter) : null;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getHashedPassword() {
        return hashedPassword;
    }

    public void setHashedPassword(String hashedPassword) {
        this.hashedPassword = hashedPassword;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" + "email=" + email + ", name=" + name + ", roleId=" + roleId + ", hashedPassword=" + hashedPassword + ", phoneNumber=" + phoneNumber + ", avatar=" + avatar + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + lastUpdatedDate + ", status=" + status + '}';
    }

}
