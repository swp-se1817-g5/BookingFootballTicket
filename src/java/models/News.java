/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author admin
 */
public class News {

    private int newsId;
    private Match matchId;
    private User userId;
    private String title;
    private String content;
    private String createBy;
    private LocalDateTime createdDate;
    private String updateBy;
    private LocalDateTime lastUpdateDate;
    private int status;
    private boolean isDeleted;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");

    public News() {
    }

    public News(Match matchId, User userId, String title, String content, String createBy, int status) {
        this.matchId = matchId;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.createBy = createBy;
        this.status = status;
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

    public String getCreatedDate() {
        return createdDate != null ? createdDate.format(formatter) : null;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getLastUpdateDate() {
        return lastUpdateDate != null ? lastUpdateDate.format(formatter) : null;
    }

    public void setLastUpdateDate(LocalDateTime lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Match getMatchId() {
        return matchId;
    }

    public void setMatchId(Match matchId) {
        this.matchId = matchId;
    }

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", matchId=" + matchId + ", userId=" + userId + ", title=" + title + ", content=" + content + ", createBy=" + createBy + ", createdDate=" + createdDate + ", updateBy=" + updateBy + ", lastUpdateDate=" + lastUpdateDate + ", status=" + status +", isDeleted=" + isDeleted + ", formatter=" + formatter + '}';
    }

}
