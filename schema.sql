/* Create Music_album table */
CREATE TABLE music_album(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL
    PRIMARY KEY(id)
)