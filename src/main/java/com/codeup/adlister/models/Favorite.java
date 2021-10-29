package com.codeup.adlister.models;

public class Favorite {
    private long userId;
    private long adId;

    public Favorite(long userId, long adId){
        this.adId = adId;
        this.userId = userId;
    }

    public long getUserId() {
        return userId;
    }

    public long getAdId() {
        return adId;
    }

}
