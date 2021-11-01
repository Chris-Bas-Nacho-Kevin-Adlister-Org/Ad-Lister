package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    void update(long oldAdID, Ad newAdInfo);
    void delete(long adId);

    List<Ad> createAdsFromResults(ResultSet rs) throws SQLException;
}
