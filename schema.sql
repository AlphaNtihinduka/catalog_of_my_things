/* Create Music_album table */
CREATE TABLE music_album(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE genre (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(250) NOT NULL,
    PRIMARY KEY (id)
);