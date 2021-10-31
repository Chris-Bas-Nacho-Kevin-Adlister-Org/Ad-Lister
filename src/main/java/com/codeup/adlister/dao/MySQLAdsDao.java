package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, item_condition, post_date, price_in_cents, location, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4,ad.getCondition());
//            stmt.setDate(5,ad.getPostDate());
            stmt.setDate(5, java.sql.Date.valueOf(LocalDate.now()));
            stmt.setInt(6, ad.getPriceInCents());
            stmt.setString(7, ad.getLocation());
            stmt.setString(8,ad.getCategory());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
//        LocalDate currentdate = LocalDate.now();
        Date currentDate = Date.valueOf(LocalDate.now());
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("item_condition"),
            //Will need to revisit to confirm proper date conversion
            rs.getDate("post_date"),
            Integer.parseInt(rs.getString("price_in_cents")),
            rs.getString("location"),
            rs.getString("category")
        );
    }

    @Override
    public void update(Ad oldAdInfo, Ad newAdInfo) {
        String query = "UPDATE ads SET title = ?, category = ?, description = ?, item_condition = ?, post_date = ?, price_in_cents = ?, location = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, newAdInfo.getTitle());
            stmt.setString(2, newAdInfo.getDescription());
            stmt.setString(3, newAdInfo.getCondition());
            stmt.setDate(4, newAdInfo.getPostDate());
            stmt.setInt(5, newAdInfo.getPriceInCents());
            stmt.setString(6, newAdInfo.getLocation());
            stmt.setString(7, newAdInfo.getCategory());
            stmt.setLong(8, oldAdInfo.getId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad info", e);
        }
    }

    public List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
