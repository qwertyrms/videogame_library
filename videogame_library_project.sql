CREATE DATABASE IF NOT EXISTS videogame_library;
USE videogame_library;

CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip_code VARCHAR(10) NOT NULL
);

CREATE TABLE consoles (
    console_id INT AUTO_INCREMENT PRIMARY KEY,
    console_name VARCHAR(255) NOT NULL
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address_id INT,
    CONSTRAINT fk_customer_address 
    FOREIGN KEY (address_id) 
        REFERENCES addresses(address_id)
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address_id INT,
    CONSTRAINT fk_employee_address 
    FOREIGN KEY (address_id) 
        REFERENCES addresses(address_id)
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre_id INT,
    price DECIMAL(10, 2) NOT NULL,
    age_rating VARCHAR(10) NOT NULL,
    console_id INT,
    rating CHAR(1) NOT NULL,
    CONSTRAINT fk_games_genre 
    FOREIGN KEY (genre_id) 
        REFERENCES genres(genre_id),
    CONSTRAINT check_game_rating CHECK (rating IN ('E', 'T', 'M')),
    CONSTRAINT fk_games_console 
    FOREIGN KEY (console_id) 
        REFERENCES consoles(console_id)
);

CREATE TABLE game_console (
    game_id INT,
    console_id INT,
    copies_available INT NOT NULL DEFAULT 0,
    PRIMARY KEY (game_id, console_id),
    FOREIGN KEY (game_id) 
        REFERENCES games(game_id)
);

CREATE TABLE storage (
    storage_id INT AUTO_INCREMENT PRIMARY KEY,
    cloud_service VARCHAR(255) NOT NULL,
    storage_capacity INT NOT NULL,
    monthly_fee DECIMAL(10, 2) NOT NULL
);

INSERT INTO addresses (street_address, city, state, zip_code) VALUES
('911 Bronx st', 'Bronx', 'NY', '10452'),
('123 Manhattan st', 'Manhattan', 'NY', '10001'),
('111 Brooklyn st', 'Brooklyn', 'NY', '11201');

INSERT INTO customers (first_name, last_name, date_of_birth, phone_number, email, address_id) VALUES 
('Remon', 'Sabuz', '2001-01-01', '123-456-7890', 'remon.cis344@lc.com', 1),
('Diore', 'Lemond', '2002-02-02', '987-654-3210', 'diore.cis344@lc.com', 2),
('Arnab', 'Das', '2003-03-03', '789-123-4560', 'arnab.cis344@lc.com', 3);

INSERT INTO employees (first_name, last_name, date_of_birth, phone_number, email, address_id) VALUES 
('Yanilda', 'Peralta Ramos', '2004-04-04', '800-347-4560', 'professor.cis344@lc.com', 1);

INSERT INTO genres (genre_name) VALUES
('Fighting'),
('Action-adventure'),
('RPG'),
('FPS'),
('Sports'),
('Racing');

INSERT INTO games (title, genre_id, price, age_rating, rating) VALUES
('God of War', 2, 59.99, 'Mature', 'M'),
('Dragon''s Dogma', 3, 49.99, 'Teen', 'T'),
('Yakuza', 2, 39.99, 'Mature', 'M'),
('NBA2K24', 5, 59.99, 'Everyone', 'E'),
('Forza Horizon', 6, 59.99, 'Everyone', 'E'),
('Call of Duty', 4, 39.99, 'Mature', 'M'),
('Mortal Kombat', 1, 49.99, 'Teen', 'T'),
('Battlefield', 4, 49.99, 'Mature', 'M'),
('Hogwarts', 3, 59.99, 'Teen', 'T'),
('Madden NFL24', 5, 49.99, 'Everyone', 'E');

INSERT INTO consoles (console_name) VALUES
('PS5'),
('PC'),
('XBOX'),
('Nintendo Switch');

-- God of War
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(1, 1, 10), (1, 2, 7), (1, 3, 5), (1, 4, 3);

-- Dragon's Dogma
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(2, 1, 8), (2, 2, 6), (2, 3, 4), (2, 4, 2);

-- Yakuza
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(3, 1, 7), (3, 2, 0), (3, 3, 5), (3, 4, 3);

-- NBA2K24
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(4, 1, 10), (4, 2, 0), (4, 3, 12), (4, 4, 0);

-- Forza Horizon
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(5, 1, 10), (5, 2, 0), (5, 3, 15), (5, 4, 0);

-- Call of Duty
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(6, 1, 10), (6, 2, 8), (6, 3, 0), (6, 4, 0);

-- Mortal Kombat
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(7, 1, 10), (7, 2, 0), (7, 3, 0), (7, 4, 0);

-- Battlefield
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(8, 1, 10), (8, 2, 0), (8, 3, 0), (8, 4, 0);

-- Hogwarts
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(9, 1, 0), (9, 2, 0), (9, 3, 0), (9, 4, 5);

-- Madden NFL24
INSERT INTO game_console (game_id, console_id, copies_available) VALUES
(10, 1, 10), (10, 2, 0), (10, 3, 0), (10, 4, 7);

INSERT INTO storage (cloud_service, storage_capacity, monthly_fee) VALUES
('Playstation Network Plus', 500, 24.99),
('Xbox Game Pass', 500, 24.99),
('Blizzard for PC', 1000, 14.99),
('Nintendo Switch Online', 400, 19.99)
;
