CREATE DATABASE IF NOT EXISTS Animals;

USE Animals;

CREATE TABLE IF NOT EXISTS Cats (
    CatId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CatName VARCHAR(255),
    FavoriteToy VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Dogs (
    DogId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DogName VARCHAR(255),
    FavoriteToy VARCHAR(255)
);

INSERT INTO Cats (CatName, FavoriteToy)
VALUES ('Murphy', 'Birdie');

INSERT INTO Cats (CatName, FavoriteToy)
VALUES ('Oscar', 'String');

INSERT INTO Cats (CatName, FavoriteToy)
VALUES ('Penelope', 'Mouse');

INSERT INTO Dogs (DogName, FavoriteToy)
VALUES ('Cooper', 'Bone');

INSERT INTO Dogs (DogName, FavoriteToy)
VALUES ('Rosie', 'Tennis Ball');

INSERT INTO Dogs (DogName, FavoriteToy)
VALUES ('Cody', 'Chew Toy');