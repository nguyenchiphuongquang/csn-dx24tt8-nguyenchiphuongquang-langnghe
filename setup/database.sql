CREATE DATABASE IF NOT EXISTS db_langnghe_vietnam CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_langnghe_vietnam;
CREATE TABLE locations (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255));
CREATE TABLE categories (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255));
CREATE TABLE craft_villages (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), location_id INT, category_id INT, address VARCHAR(255));
INSERT INTO locations (name) VALUES ('Hà Nội'), ('Bắc Ninh'), ('Thừa Thiên Huế');
INSERT INTO categories (name) VALUES ('Gốm sứ'), ('Tranh dân gian'), ('Mây tre đan');
INSERT INTO craft_villages (name, location_id, category_id, address) VALUES ('Gốm Bát Tràng', 1, 1, 'Gia Lâm, Hà Nội');
