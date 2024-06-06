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
    private String mainTitle;
    private String title;
    private String mainContent;
    private String content;
    private String createBy;
    private LocalDateTime createdDate;
    private String updateBy;
    private LocalDateTime lastUpdateDate;
    private String image;
    private boolean status;
    private boolean state;
    private boolean isDeleted;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public News() {
    }

    public News(String mainTitle, String title, String mainContent, String content, String createBy, String updateBy, String image, boolean status, boolean state, String deletedBy) {
        this.mainTitle = mainTitle;
        this.title = title;
        this.mainContent = mainContent;
        this.content = content;
        this.createBy = createBy;
        this.updateBy = updateBy;
        this.image = image;
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

    public String getMainTitle() {
        return mainTitle;
    }

    public void setMainTitle(String mainTitle) {
        this.mainTitle = mainTitle;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMainContent() {
        return mainContent;
    }

    public void setMainContent(String mainContent) {
        this.mainContent = mainContent;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
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
        return "News{" + "newsId=" + newsId + ", mainTitle=" + mainTitle + ", title=" + title + ", mainContent=" + mainContent + ", content=" + content + ", createBy=" + createBy + ", createdDate=" + createdDate + ", updateBy=" + updateBy + ", lastUpdateDate=" + lastUpdateDate + ", image=" + image + ", status=" + status + ", state=" + state + ", isDeleted=" + isDeleted + ", formatter=" + formatter + '}';
    }

}
