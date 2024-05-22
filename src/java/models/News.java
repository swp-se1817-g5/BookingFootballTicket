/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author admin
 */
public class News {

    private int newsId;
    private int userId;
    private String title;
    private String content;
    private Date postTime;
    private String createBy;
    private LocalDate createdDate;
    private String updateBy;
    private LocalDate lastUpdateDate;
    private boolean isDeleted;

    public News() {
    }

    public News(int newsId, int userId, String title, String content, Date postTime, String createBy, LocalDate createdDate, String updateBy, LocalDate lastUpdateDate, boolean isDeleted) {
        this.newsId = newsId;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.postTime = postTime;
        this.createBy = createBy;
        this.createdDate = createdDate;
        this.updateBy = updateBy;
        this.lastUpdateDate = lastUpdateDate;
        this.isDeleted = isDeleted;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public Date getPostTime() {
        return postTime;
    }

    public void setPostTime(Date postTime) {
        this.postTime = postTime;
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
