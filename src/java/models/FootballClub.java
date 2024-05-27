package models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FootballClub {

    private int clubId;
    private String clubName;
    private String img;
    private String createdBy;
    private LocalDateTime createdDate;
    private String updatedBy;
    private LocalDateTime lastUpdatedDate;
    private boolean isDeleted;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd / HH:mm:ss");

    public FootballClub() {
    }

    public FootballClub(int clubId, String clubName, String img, String createdBy, LocalDateTime createdDate, String updatedBy, LocalDateTime lastUpdatedDate, boolean isDeleted) {
        this.clubId = clubId;
        this.clubName = clubName;
        this.img = img;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.lastUpdatedDate = lastUpdatedDate;
        this.isDeleted = isDeleted;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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
        return "FootballClub{" + "clubId=" + clubId + ", clubName=" + clubName + ", img=" + img + ", createdBy=" + createdBy + ", createdDate=" + getCreatedDate() + ", updatedBy=" + updatedBy + ", lastUpdatedDate=" + getLastUpdatedDate() + ", isDeleted=" + isDeleted + '}';
    }
}
