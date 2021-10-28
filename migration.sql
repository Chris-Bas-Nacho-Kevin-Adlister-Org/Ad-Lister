CREATE DATABASE IF NOT EXISTS adlister_db;
USE adlister_db;

DROP TABLE IF EXISTS favorites_list;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    item_condition ENUM ('new', 'mint', 'great', 'good', 'fair', 'poor') NOT NULL,
    location VARCHAR(100) NOT NULL ,
    price_in_cents INT UNSIGNED NOT NULL,
    post_date DATE NOT NULL,
    category ENUM('Event',
                'Electronics',
                'Furniture',
                'Books',
                'Tools',
                'Musical Instruments',
                'Vehicles',
                'Collectibles',
                'Clothing',
                'Sporting Equipment',
                'Misc',
                'Services',
                'Electronic Media',
                'Computers',
                'Real Estate') NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE favorites_list (
    user_id INT UNSIGNED NOT NULL,
    ad_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (ad_id) REFERENCES ads(id)
);