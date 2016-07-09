CREATE TABLE IF NOT EXISTS actor (
    actor_id INTEGER(4) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS staring (
    actor_id INTEGER(4),
    movie_id INTEGER(4),
    FOREIGN KEY(actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);