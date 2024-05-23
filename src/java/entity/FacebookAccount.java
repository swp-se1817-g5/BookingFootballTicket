/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author AD
 */
public class FacebookAccount {
    private String id, email, name, first_name, given_name, family_name, picture;

    private boolean verified_facebook;

    public FacebookAccount() {
    }

    public FacebookAccount(String id, String email, String name, String first_name, String given_name, String family_name, String picture, boolean verified_facebook) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.first_name = first_name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.picture = picture;
        this.verified_facebook = verified_facebook;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public boolean isVerified_facebook() {
        return verified_facebook;
    }

    public void setVerified_facebook(boolean verified_facebook) {
        this.verified_facebook = verified_facebook;
    }

    @Override
    public String toString() {
        return "FacebookAccount{" + "id=" + id + ", email=" + email + ", name=" + name + ", first_name=" + first_name + ", given_name=" + given_name + ", family_name=" + family_name + ", picture=" + picture + ", verified_facebook=" + verified_facebook + '}';
    }
    

}
