package models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class User {

    private int roleId;
    private String password;
    private String email;
    private String phoneNumber;
    private String avatar;
    private String name;
    private String createdBy;
    private LocalDateTime createdDate;
    private String updatedBy;
    private LocalDateTime lastUpdatedDate;
    private boolean isDeleted;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");

    public User() {
    }

    public User(int roleId, String password, String email, String phoneNumber, String avatar, String name, String createdBy, LocalDateTime createdDate, String updatedBy, LocalDateTime lastUpdatedDate, boolean isDeleted) {
        this.roleId = roleId;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;
        this.name = name;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.isDeleted = isDeleted;
    }

    public User(String password, String email, String phoneNumber, String avatar, String name) {
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;
        this.name = name;
    }

    public User(String email, String avatar, String name) {
        this.email = email;
        this.avatar = avatar;
        this.name = name;
    }

    public User(String name, String email, String avatar, String password, int roleId) {
        this.name = name;
        this.email = email;
        this.avatar = avatar;
        this.password = password;
        this.roleId = roleId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    @Override
    public String toString() {
        return "User{" + "roleId=" + roleId + ", password=" + password + ", email=" + email + ", phoneNumber=" + phoneNumber + ", avatar=" + avatar + ", name=" + name + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + lastUpdatedDate + ", isDeleted=" + isDeleted + '}';
    }
}
