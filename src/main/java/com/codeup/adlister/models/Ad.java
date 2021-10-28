package com.codeup.adlister.models;

import java.sql.Date;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String condition;
    private Date postDate; //need to figure out the date type we want to use
    private int priceInCents;
    private String location;
    private String category;


    //has everything constructor
    public Ad(long id, long userId, String title, String description, String condition, Date postDate, int priceInCents, String location, String category){
        this.category = category;
        this.location = location;
        this.priceInCents = priceInCents;
        this.id = id;
        this.description = description;
        this.condition = condition;
        this.userId = userId;
        this.title = title;
        this.postDate = postDate;
    }
    public Ad(long userId, String title, String description, String condition, Date postDate, int priceInCents, String location, String category){
        this.category = category;
        this.location = location;
        this.priceInCents = priceInCents;
        this.description = description;
        this.condition = condition;
        this.userId = userId;
        this.title = title;
        this.postDate = postDate;
    }


    public String getCondition() {
        return condition;
    }

    public Date getPostDate() {
        return postDate;
    }

    public int getPriceInCents() {
        return priceInCents;
    }

    public String getLocation() {
        return location;
    }

    public String getCategory() {
        return category;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public void setPriceInCents(int priceInCents) {
        this.priceInCents = priceInCents;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
