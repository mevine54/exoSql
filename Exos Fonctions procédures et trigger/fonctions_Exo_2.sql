drop database if exists biblio;

CREATE DATABASE biblio;

use biblio;

drop table if exists livre;
create table livre ( 
	numinv varchar(6) not null ,
    titre varchar(50), 
    auteur varchar(50),
    qte int(2) unsigned,
    primary key (numinv)
);

lock tables livre write;
-- Insérer 20 livres dans la table "livre"
INSERT INTO livre (numinv, titre, auteur, qte) VALUES
    ('INV001', 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', 5),    ('INV002', 'Harry Potter à l\'école des sorciers', 'J.K. Rowling', 8),    ('INV003', '1984', 'George Orwell', 10),    ('INV004', 'Le Petit Prince', 'Antoine de Saint-Exupéry', 12),
    ('INV005', 'Orgueil et Préjugés', 'Jane Austen', 7),    ('INV006', 'Les Misérables', 'Victor Hugo', 6),    ('INV007', 'Cinquante nuances de Grey', 'E.L. James', 4),    ('INV008', 'L\'Alchimiste', 'Paulo Coelho', 9),
    ('INV009', 'Le Hobbit', 'J.R.R. Tolkien', 11),    ('INV010', 'Da Vinci Code', 'Dan Brown', 14),    ('INV011', 'Le Rouge et le Noir', 'Stendhal', 8),    ('INV012', 'Guerre et Paix', 'Léon Tolstoï', 6),
    ('INV013', 'Crime et Châtiment', 'Fiodor Dostoïevski', 7),    ('INV014', 'Le Vieil Homme et la Mer', 'Ernest Hemingway', 5),    ('INV015', 'Le Guépard', 'Giuseppe Tomasi di Lampedusa', 4),    ('INV016', 'Moby Dick', 'Herman Melville', 6),
    ('INV017', 'Le Nom de la Rose', 'Umberto Eco', 8),    ('INV018', 'L\'Écume des Jours', 'Boris Vian', 6),    ('INV019', 'Le Comte de Monte-Cristo', 'Alexandre Dumas', 9),    ('INV020', 'Dune', 'Frank Herbert', 10);
unlock tables;
    
drop table if exists abonne;

create table abonne(
	numab varchar(5) not null ,
    nom varchar(15),
    prenom varchar(15), 
    primary key (numab) 
);

lock table abonne write;
-- Insérer 20 abonnés dans la table "abonne"
INSERT INTO abonne (numab, nom, prenom) VALUES
    ('A001', 'Dupont', 'Jean'),    ('A002', 'Martin', 'Marie'),    ('A003', 'Smith', 'John'),    ('A004', 'Dubois', 'Isabelle'),    ('A005', 'Garcia', 'Carlos'),
    ('A006', 'Müller', 'Andreas'),    ('A007', 'Wang', 'Li'),    ('A008', 'Kim', 'Min-jun'),    ('A009', 'Ivanov', 'Sergei'),    ('A010', 'López', 'Maria'),
    ('A011', 'Chen', 'Wei'),    ('A012', 'Kawasaki', 'Yuki'),    ('A013', 'Lee', 'Ji-hoon'),    ('A014', 'González', 'Luis'),    ('A015', 'Rodriguez', 'Ana'),
    ('A016', 'Sato', 'Takashi'),    ('A017', 'Nguyen', 'Thi'),    ('A018', 'Gupta', 'Amit'),    ('A019', 'Santos', 'André'),    ('A020', 'Ferrari', 'Giulia');
unlock tables;

drop table if exists pret;
create table pret ( 
	numinv varchar(6) not null ,
	numab varchar(5) not null ,
	datepret date,
    dureemax int,
	primary key (numinv,numab), 
	CONSTRAINT fk_abonne foreign key (numab) references abonne(numab),
    CONSTRAINT fk_livre foreign key (numinv) references livre(numinv)
);

lock table pret write;
-- Insérer 40 emprunts aléatoires
INSERT INTO pret (numinv, numab, datepret, dureemax) VALUES
    ('INV001', 'A001', '2024-10-01', 10),    ('INV002', 'A002', '2024-10-02', 10),    ('INV003', 'A003', '2024-10-03', 10),    ('INV004', 'A004', '2024-10-04', 10),    ('INV005', 'A005', '2024-10-05', 10),    ('INV006', 'A006', '2024-10-06', 10),    ('INV007', 'A007', '2024-10-07', 10),    ('INV008', 'A008', '2024-10-08', 10),    ('INV009', 'A009', '2024-10-09', 10),    ('INV010', 'A010', '2024-10-10', 10),
    ('INV011', 'A011', '2024-10-11', 10),    ('INV012', 'A012', '2024-10-12', 10),    ('INV013', 'A013', '2024-10-13', 10),    ('INV014', 'A014', '2024-10-14', 10),    ('INV015', 'A015', '2024-10-15', 10),    ('INV016', 'A016', '2024-10-16', 10),    ('INV017', 'A017', '2024-10-17', 10),    ('INV018', 'A018', '2024-10-18', 10),    ('INV019', 'A019', '2024-10-19', 10),    ('INV020', 'A020', '2024-10-20', 10),
    ('INV001', 'A002', '2024-10-21', 10),    ('INV002', 'A003', '2024-10-22', 10),    ('INV003', 'A004', '2024-10-23', 10),    ('INV004', 'A005', '2024-10-24', 10),    ('INV005', 'A006', '2024-10-25', 10),    ('INV006', 'A007', '2024-10-26', 10),    ('INV007', 'A008', '2024-10-27', 10),    ('INV008', 'A009', '2024-10-28', 10),    ('INV009', 'A010', '2024-10-29', 10),    ('INV010', 'A011', '2024-10-30', 10),
	('INV011', 'A012', '2024-10-31', 10),    ('INV012', 'A013', '2024-11-01', 10),    ('INV013', 'A014', '2024-11-02', 10),    ('INV014', 'A015', '2024-11-03', 10),    ('INV015', 'A016', '2024-11-04', 10),    ('INV016', 'A017', '2024-11-05', 10),    ('INV017', 'A018', '2024-11-06', 10);
unlock tables;










