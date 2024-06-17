/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;

/**
 *
 * @author AD
 */
public class TokenForgetPassword {
    private int id;
    private boolean isUsed;
    private String token, userEmail;
    private LocalDateTime expiryTime;

    public TokenForgetPassword() {
    }

    public TokenForgetPassword(int id, boolean isUsed, String token, String userEmail, LocalDateTime expiryTime) {
        this.id = id;
        this.isUsed = isUsed;
        this.token = token;
        this.userEmail = userEmail;
        this.expiryTime = expiryTime;
    }
    
    public TokenForgetPassword(String userEmail, boolean isUsed, String token, LocalDateTime expiryTime) {
        this.userEmail = userEmail;
        this.isUsed = isUsed;
        this.token = token;
        this.expiryTime = expiryTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public LocalDateTime getExpiryTime() {
        return expiryTime;
    }

    public void setExpiryTime(LocalDateTime expiryTime) {
        this.expiryTime = expiryTime;
    }

    @Override
    public String toString() {
        return "TokenForgetPassword{" + "id=" + id + ", isUsed=" + isUsed + ", token=" + token + ", userEmail=" + userEmail + ", expiryTime=" + expiryTime + '}';
    }
    
    
}
