
CREATE TABLE auteurs (
    id INT PRIMARY KEY,
    nom VARCHAR(255),
    nationalite VARCHAR(255)
);


CREATE TABLE genres (
    id INT PRIMARY KEY,
    nom VARCHAR(255)
);


CREATE TABLE livres (
    id INT PRIMARY KEY,
    titre VARCHAR(255),
    annee_publication INT,
    auteur_id INT,
    genre_id INT,
    FOREIGN KEY (auteur_id) REFERENCES auteurs(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);


CREATE TABLE emprunteurs (
    id INT PRIMARY KEY,
    nom VARCHAR(255),
    date_emprunt DATE
);



INSERT INTO auteurs (id, nom, nationalite) VALUES
(1, 'J.K. Rowling', 'Britannique'),
(2, 'George R.R. Martin', 'Américain'),
(3, 'J.R.R. Tolkien', 'Britannique');


INSERT INTO genres (id, nom) VALUES
(1, 'Fantasy'),
(2, 'Science Fiction'),
(3, 'Mystère');


INSERT INTO livres (id, titre, annee_publication, auteur_id, genre_id) VALUES
(1, 'Harry Potter et la Pierre Philosophale', 1, 1, 1997),
(2, 'Harry Potter et la Chambre des Secrets', 1, 1, 1998),
(3, 'A Game of Thrones', 2, 1, 1996),
(4, 'A Clash of Kings', 2, 1, 1998),
(5, 'Le Seigneur des Anneaux', 3, 1, 1954);


INSERT INTO emprunteurs (id, nom, date_emprunt) VALUES
(1, 'Jean Dupont', '2023-01-15'),
(2, 'Marie Curie', '2023-02-10'),
(3, 'Albert Einstein', '2023-03-05');


SELECT titre
FROM livres
JOIN auteurs ON livres.auteur_id = auteurs.id
WHERE auteurs.nom = 'J.K. Rowling';


SELECT genres.nom, COUNT(livres.id) AS nombre_de_livres
FROM livres
JOIN genres ON livres.genre_id = genres.id
GROUP BY genres.nom;
