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
    private String location;
    private LocalDateTime kickOff;
    private String createBy;
    private LocalDateTime createdDate;
    private String updateBy;
    private LocalDateTime lastUpdateDate;
    private boolean status;
    private boolean isDeleted;
    private String deletedBy;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public News() {
    }

    public News(String mainTitle, String title, String mainContent, String content, String location, LocalDateTime kickOff, String createBy, boolean status) {
        this.mainTitle = mainTitle;
        this.title = title;
        this.mainContent = mainContent;
        this.content = content;
        this.location = location;
        this.kickOff = kickOff;
        this.createBy = createBy;
        this.status = status;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getMainTitle() {
        return mainTitle;
    }

    public void setMainTitle(String mainTitle) {
        this.mainTitle = mainTitle;
    }

    public String getMainContent() {
        return mainContent;
    }

    public void setMainContent(String mainContent) {
        this.mainContent = mainContent;
    }

    public String getlocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getKickOff() {
        return kickOff != null ? kickOff.format(formatter) : null;
    }

    public void setKickOff(LocalDateTime KickOff) {
        this.kickOff = KickOff;
    }

    public String getDeletedBy() {
        return deletedBy;
    }

    public void setDeletedBy(String deletedBy) {
        this.deletedBy = deletedBy;
    }

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", mainTitle=" + mainTitle + ", title=" + title + ", mainContent=" + mainContent + ", content=" + content + ", location=" + location + ", kickOff=" + kickOff + ", createBy=" + createBy + ", createdDate=" + createdDate + ", updateBy=" + updateBy + ", lastUpdateDate=" + lastUpdateDate + ", status=" + status + ", isDeleted=" + isDeleted + ", formatter=" + formatter + '}';
    }

}
