/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class News {

    private int newsId;
    private User userId;
    private String title;
    private String content;
    private String createBy;
    private LocalDateTime createdDate;
    private User updateBy;
    private LocalDateTime lastUpdateDate;
    private boolean isDeleted;

    public News() {
    }

    public News(User userId, String title, String content, String createBy, User updateBy, boolean isDeleted) {
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.createBy = createBy;
        this.updateBy = updateBy;
        this.isDeleted = isDeleted;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public User getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(User updateBy) {
        this.updateBy = updateBy;
    }

    public LocalDateTime getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(LocalDateTime lastUpdateDate) {
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
        return "News{" + "newsId=" + newsId + ", userId=" + userId + ", title=" + title + ", content=" + content + ", createBy=" + createBy + ", createdDate=" + createdDate + ", updateBy=" + updateBy + ", lastUpdateDate=" + lastUpdateDate + ", isDeleted=" + isDeleted + '}';
    }

}
