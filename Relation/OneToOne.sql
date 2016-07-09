CREATE TABLE IF NOT EXISTS movie (
    movie_id INTEGER(4) primary key AUTO_INCREMENT,
    title VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS movie_detail (
    movie_id INTEGER(4),
    director VARCHAR(100),
    year INTEGER(4),
    synopsis TEXT,
    PRIMARY KEY(movie_id),
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);