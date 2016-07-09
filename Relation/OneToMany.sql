# 영화와 리뷰
CREATE TABLE IF NOT EXISTS movie (
    movie_id INTEGER(4) primary key AUTO_INCREMENT,
    title VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS review (
    review_id INTEGER(4) AUTO_INCREMENT,
    movie_id INTEGER(4),
    review TEXT,
    PRIMARY KEY(review_id),
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);


# 다른 예제 : 팀 - 팀원
CREATE TABLE IF NOT EXISTS team (
    team_id INTEGER(4),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(team_id)
);

CREATE TABLE IF NOT EXISTS member (
    id INTEGER(4) AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    team_id INTEGER(4),
    PRIMARY KEY(id),
    FOREIGN KEY(team_id) REFERENCES team(team_id)
);
