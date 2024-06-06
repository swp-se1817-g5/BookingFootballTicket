/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author nguye
 */
public class NewsImages {

    private int imageId;
    private String imageUrl;
    private int newsId;

    public NewsImages() {
    }

    public NewsImages(int imageId, String imageUrl, int newsId) {
        this.imageId = imageId;
        this.imageUrl = imageUrl;
        this.newsId = newsId;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    @Override
    public String toString() {
        return "NewsImages{" + "imageId=" + imageId + ", imageUrl=" + imageUrl + ", newsId=" + newsId + '}';
    }

}
