USE adlister_db;

# TRUNCATE ads;
# TRUNCATE users;
# TRUNCATE favorites_list;

INSERT INTO users (username, email, phone_number, password) VALUES ('skye', 'skye@email.com', '1234567890', 'letmein1');
INSERT INTO users (username, email, phone_number, password) VALUES ('nacho', 'nacho@email.com', '1234567890', 'letmein2');
INSERT INTO users (username, email, phone_number, password) VALUES ('hot_dog_water_man', 'hot@dog.com', '1234567890', 'letmein3');
INSERT INTO users (username, email, phone_number, password) VALUES ('sebastian', 'sebastian@email.com', '1234567890', 'letmein4');



INSERT INTO ads (user_id, title, description, item_condition, location, price_in_cents, post_date, category)
VALUES ('1', 'dank memes', 'buy a pack of ten get a pun thrown in!', 'new', 'Troll Base', '1337', '2021-10-28', 'Collectibles'),
       ('2', 'belly button lint', 'warm and squishy', 'fair', 'My Navel Base', '9001', '2021-10-28', 'Services'),
       ('3', 'HoT dOg WaTeR', 'has most nitrates of any other hot dog water currently available on the market!!!', 'new', 'Street Cart', '5', '2021-10-28', 'Event'),
       ('4', 'repurposed bandaids', 'extra strength!!!', 'mint', 'dark web', '600000', '2021-10-28', 'Real Estate');