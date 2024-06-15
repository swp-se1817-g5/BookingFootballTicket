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
    private String title;
    private String content;
    private String image;
    private String conclusion;
    private String createBy;
    private LocalDateTime createdDate;
    private String updateBy;
    private LocalDateTime lastUpdateDate;
    private int status;
    private boolean state;
    private boolean isDeleted;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public News() {
    }

    public News(String title, String content, String image, String conclusion, String createBy, int status, boolean state) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.conclusion = conclusion;
        this.createBy = createBy;
        this.status = status;
        this.state = state;
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

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", title=" + title + ", content=" + content + ", image=" + image + ", conclusion=" + conclusion + ", createBy=" + createBy + ", createdDate=" + createdDate + ", updateBy=" + updateBy + ", lastUpdateDate=" + lastUpdateDate + ", status=" + status + ", state=" + state + ", isDeleted=" + isDeleted + ", formatter=" + formatter + '}';
    }

}
