DROP database if EXISTS exercice1;
create database exercice1;
USE exercice1;

CREATE TABLE IF NOT EXISTS Representation (
Num_Rep INT NOT NULL AUTO_INCREMENT,
titre_Rep VARCHAR (30) NOT NULL,
lieu VARCHAR (50) NOT NULL,
PRIMARY KEY (Num_Rep)
);

INSERT INTO Representation (titre_Rep, lieu)
VALUES 
('Symphony Night', 'Paris'),
('Jazz Fest', 'New York'),
('Classic Evening', 'London'),
('Opera Gala', 'Rome'),
('Rock Concert', 'Berlin'),
('Pop Explosion', 'Los Angeles'),
('Blues Night', 'Chicago'),
('Electronic Beats', 'Miami'),
('Folk Festival', 'Nashville'),
('Reggae Vibes', 'Kingston'),
('Salsa Fiesta', 'Havana'),
('Hip-Hop Summit', 'Atlanta'),
('Country Music Awards', 'Austin'),
('Heavy Metal Thunder', 'Moscow'),
('Indie Fest', 'Toronto'),
('World Music Celebration', 'Rio de Janeiro'),
('Classical Masterpieces', 'Vienna'),
('Soul Experience', 'Detroit'),
('Dance Marathon', 'Ibiza'),
('Punk Revolution', 'Tokyo'),
('Funk Fest', 'San Francisco'),
('Acoustic Lounge', 'Seattle'),
('Latin Pop Party', 'Madrid'),
('Jazz Jam Session', 'Amsterdam'),
('Opera Classics', 'Sydney'),
('Alternative Rock Bash', 'Mexico City');

CREATE TABLE IF NOT EXISTS Musicien (
Num_mus INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (50) NOT NULL,
Num_Rep INT NOT NULL,
PRIMARY KEY (Num_mus),
CONSTRAINT fk_Musicien_Num_Rep FOREIGN KEY (Num_Rep) REFERENCES Representation (Num_Rep)
);

INSERT INTO Musicien (nom, Num_Rep)
VALUES 
('John Doe', 1),
('Jane Smith', 1),
('Paul Dupont', 2),
('Emily Carter', 3),
('Albert Rossi', 4),
('Lucy Zhang', 5),
('Tom Baker', 2),
('Elena Costa', 3),
('mEVINE Costa', 20),
('James Bond', 5);




CREATE TABLE IF NOT EXISTS Programmer (
`Date` DATE NOT NULL,
tarif DOUBLE NOT NULL,
Num_Rep INT NOT NULL,
PRIMARY KEY (`Date`),
CONSTRAINT fk_Programmer_Num_Rep FOREIGN KEY (Num_Rep) REFERENCES Representation (Num_Rep)
);

INSERT INTO Programmer (`Date`, tarif, Num_Rep)
VALUES 
('2008-07-25', 50.0, 1),
('2008-02-15', 60.0, 2),
('2008-03-20', 45.0, 3),
('2008-04-05', 75.0, 4),
('2008-05-12', 55.0, 5),
('2008-06-18', 80.0, 1),
('2008-07-22', 65.0, 2),
('2008-08-30', 90.0, 3);


SELECT titre_Rep FROM representation;

SELECT titre_Rep FROM representation WHERE Lieu LIKE "Theatre Allisa";

SELECT m.nom, r.titre_Rep FROM musicien AS m INNER JOIN representation AS r ON r.Num_Rep = m.Num_Rep;

SELECT r.titre_Rep, r.lieu, p.tarif FROM programmer p INNER JOIN representation r ON r.Num_Rep = p.Num_Rep WHERE p.date = '2008/07/25';


SELECT m.nom, r.Num_Rep FROM representation r INNER JOIN musicien m ON m.Num_Rep = r.Num_Rep WHERE r.Num_Rep = 20;

select count(*) from musicien where num_rep = 20;

-- SELECT r.Num_Rep, p.date, p.tarif FROM programmer p INNER JOIN representation r ON r.Num_Rep = p.date WHERE p.tarif <= 20;


SELECT r.Num_Rep, p.date FROM representation r INNER JOIN programmer p ON p.Num_Rep = r.Num_Rep WHERE p.tarif <= 50; 
