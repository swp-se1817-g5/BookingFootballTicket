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
    private LocalDateTime postOn;
    private String updateBy;
    private LocalDateTime lastUpdateDate;
    private NewsState stateId;
    private boolean isDeleted;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    private final DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");

    public News() {
    }

    public News(String title, String content, String image, String conclusion, String createBy, NewsState stateId) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.conclusion = conclusion;
        this.createBy = createBy;
        this.stateId = stateId;
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

    public String getPostOn() {
        return postOn != null ? postOn.format(formatter) : null;
    }

    public String getPostOnConverted() {
        return postOn != null ? timeFormatter.format(postOn) : null;
    }

    public void setPostOn(LocalDateTime postOn) {
        this.postOn = postOn;
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

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public NewsState getStateId() {
        return stateId;
    }

    public void setStateId(NewsState stateId) {
        this.stateId = stateId;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "News{" + "\n"
                + "newsId=" + newsId + ",\n"
                + "title=" + title + ",\n"
                + "content=" + content + ",\n"
                + "image=" + image + ",\n"
                + "conclusion=" + conclusion + ",\n"
                + "createBy=" + createBy + ",\n"
                + "createdDate=" + createdDate + ",\n"
                + "postOn=" + postOn + ",\n"
                + "updateBy=" + updateBy + ",\n"
                + "lastUpdateDate=" + lastUpdateDate + ",\n"
                + "stateId=" + stateId + ",\n"
                + "isDeleted=" + isDeleted + ",\n"
                + "formatter=" + formatter + '\n'
                + '}';
    }

}
