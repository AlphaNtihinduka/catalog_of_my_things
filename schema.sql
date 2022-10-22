CREATE DATABASE my_catalog;

-- Author table
CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name varchar(200),
    last_name varchar(200),
    PRIMARY KEY (id) );


-- Game table
CREATE TABLE game (
     id INT GENERATED ALWAYS AS IDENTITY,
     name VARCHAR(200),
     source_id INT,
     multiplayer BOOLEAN,
     publish_date DATE,
    last_played_at DATE,
    archived BOOLEAN,
    PRIMARY KEY (id),
    ADD CONSTRAINT fk_game_source FOREIGN KEY (source_id) REFERENCES source(id)
);

/* Create Music_album table */
CREATE TABLE music_album(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    PRIMARY KEY(id)
)