create database videogame_library;
use videogame_library;

create table customers (
customer_id int auto_increment primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
date_of_birth date not null,
phone_number varchar(15) not null,
email varchar(255) not null,
address varchar(255) not null

);

insert into customers (first_name, last_name, date_of_birth, phone_number, email, address) values 
('Remon', 'Sabuz', '2001-01-01', '123-456-7890', 'remon.cis344@lc.com', '911 Bronx st'),
('Diore', 'Lemond', '2002-02-02', '987-654-3210', 'diore.cis344@lc.com', '123 Manhattan st'),
('Arnab', 'Das', '2003-03-03', '789-123-4560', 'arnab.cis344@lc.com', '111 Brooklyn st');

alter table customers
add column address_id int,
add constraint fk_customer_address
	foreign key (address_id)
    references addresses(address_id);
    
create table employees (
employee_id int auto_increment primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
date_of_birth date not null,
phone_number varchar(15) not null,
email varchar(255) not null,
address varchar(255) not null

);

insert into employees (first_name, last_name, date_of_birth, phone_number, email, address) values 
('Yanilda', 'Peralta Ramos', '2004-04-04', '800-347-4560', 'professor.cis344@lc.com', '1 Lehman st');

alter table employees 
add column address_id int,
add constraint fk_employee_address
	foreign key (address_id)
    references addresses(address_id);
    
create table addresses (
address_id int auto_increment primary key,
street_address varchar(255) not null,
city varchar(255) not null,
state varchar(255) not null,
zip_code varchar(10) not null

);

create table games (
game_id int auto_increment primary key,
title varchar(255) not null,
genre varchar(255) not null,
price decimal(10, 2) not null,
age_rating varchar(10) not null,
console varchar(50) not null

);

insert into games (title, genre, price, age_rating, console) values
('God of War', 'Action-adventure', 59.99, 'Mature', 'PS5'),
('Dragon''s Dogma', 'RPG', 49.99, 'Teen', 'PC'),
('Yakuza', 'Action-adventure', 39.99, 'Mature', 'PS5'),
('NBA2K24', 'Sports', 59.99, 'Everyone', 'XBOX'),
('Forza Horizon', 'Racing', 59.99, 'Everyone', 'XBOX'),
('Call of Duty', 'FPS', 39.99, 'Mature', 'PC'),
('Mortal Kombat', 'Fighting', 49.99, 'Teen', 'PS5'),
('Battlefield', 'FPS', 49.99, 'Mature', 'PS5'),
('Hogwarts', 'RPG', 59.99, 'Teen', 'Nintendo switch'),
('Madden NFL24', 'Sports', 49.99, 'Everyone', 'Nintendo switch');

alter table games
add column genre_id int,
add constraint fk_games_genre
	foreign key (genre_id)
    references genre(genre_id);

alter table games
add column rating char(1) not null,
add constraint check_game_rating
	check (rating in ('E', 'T', 'M'));
    
update games
set rating = 'E' /* E for everyone */
where game_name in ('NBA2K24', 'Madden NFL24', 'Forza Horizon');

update games
set rating = 'T' /* T for teens */
where game_name in ('Dragon''s Dogma', 'Mortal Kombat', 'Hogwarts');

update games
set rating = 'M' /* M for mature */
where game_name in ('God of War', 'Yakuza', 'Call of Duty', 'Battlefield');

alter table games
add column console_id int,
add constraint fk_games_console
	foreign key (console_id)
    references console(console_id);

create table genre (
genre_id int auto_increment primary key,
genre_name varchar(255) not null

);

insert into genre (genre_name) values
('fighting'),
('action-adventure'),
('RPG'),
('FPS'),
('sports'),
('racing');

create table game_console (
game_id int,
console_id int,
primary key (game_id, console_id),
foreign key (game_id) references games(game_id),
foreign key (console_id) references consoles(console_id)

);

-- God of War
INSERT INTO game_console (game_id, console_id)
VALUES
(1, 1),   -- PS5
(1, 2),   -- PC
(1, 3),   -- Xbox
(1, 4);   -- Nintendo Switch

-- Dragon's Dogma
INSERT INTO game_console (game_id, console_id)
VALUES
(2, 1),   -- PS5
(2, 2),   -- PC
(2, 3),   -- Xbox
(2, 4);   -- Nintendo Switch

-- Yakuza
INSERT INTO game_console (game_id, console_id)
VALUES
(3, 1),   -- PS5
(3, 2),   -- PC
(3, 3),   -- Xbox
(3, 4);   -- Nintendo Switch

-- NBA2K24
INSERT INTO game_console (game_id, console_id)
VALUES
(4, 1),   -- PS5
(4, 2),   -- PC
(4, 3),   -- Xbox
(4, 4);   -- Nintendo Switch

-- Forza Horizon
INSERT INTO game_console (game_id, console_id)
VALUES
(5, 1),   -- PS5
(5, 2),   -- PC
(5, 3),   -- Xbox
(5, 4);   -- Nintendo Switch

-- Call of Duty
INSERT INTO game_console (game_id, console_id)
VALUES
(6, 1),   -- PS5
(6, 2),   -- PC
(6, 3),   -- Xbox
(6, 4);   -- Nintendo Switch

-- Mortal Kombat
INSERT INTO game_console (game_id, console_id)
VALUES
(7, 1),   -- PS5
(7, 2),   -- PC
(7, 3),   -- Xbox
(7, 4);   -- Nintendo Switch

-- Battlefield
INSERT INTO game_console (game_id, console_id)
VALUES
(8, 1),   -- PS5
(8, 2),   -- PC
(8, 3),   -- Xbox
(8, 4);   -- Nintendo Switch

-- Hogwarts
INSERT INTO game_console (game_id, console_id)
VALUES
(9, 1),   -- PS5
(9, 2),   -- PC
(9, 3),   -- Xbox
(9, 4);   -- Nintendo Switch

-- Madden NFL24
INSERT INTO game_console (game_id, console_id)
VALUES
(10, 1),   -- PS5
(10, 2),   -- PC
(10, 3),   -- Xbox
(10, 4);   -- Nintendo Switch

create table console (
console_id int auto_increment primary key,
console_name varchar(255) not null

);

insert into console (console_id) values
('PS5'),
('PC'),
('XBOX'),
('Nintendo Switch');

create table storage (
storage_id int auto_increment primary key,
cloud_service varchar(255) not null,
storage_capacity int not null,
monthly_fee decimal(10, 2) not null

);