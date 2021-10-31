package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Favorite;
import com.mysql.cj.jdbc.Driver;
import com.codeup.adlister.dao.MySQLAdsDao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class MySQLFavoritesDao implements Favorites{
    private Connection connection = null;
    public MySQLFavoritesDao(Config config) {
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
    public List<Favorite> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM favorites_list");
            ResultSet rs = stmt.executeQuery();
            return createFavoritesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
    public List<Ad> favoritedAds() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT f.user_id, f.ad_id, a.title, a.description, a.item_condition, a.location, a.price_in_cents, a.post_date, a.category" +
                    " FROM favorites_list AS f " +
                    "JOIN ads AS a ON f.ad_id = a.id");
            ResultSet rs = stmt.executeQuery();
            return DaoFactory.getAdsDao().createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving the favorited ads.", e);
        }
    }
    private List<Favorite> createFavoritesFromResults(ResultSet rs) throws SQLException {
        List<Favorite> favorites = new ArrayList<>();
        while (rs.next()) {
            favorites.add(extractFavorite(rs));
        }
        return favorites;
    }
    private Favorite extractFavorite(ResultSet rs) throws SQLException {
        return new Favorite(
                rs.getLong("id"),
                rs.getLong("user_id")
        );
    }

    @Override
    public Long insert(Favorite favorite) {
        try {
            String insertQuery = "INSERT INTO favorites_list (user_id, ad_id) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, favorite.getUserId());
            stmt.setLong(2, favorite.getAdId());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }
}
