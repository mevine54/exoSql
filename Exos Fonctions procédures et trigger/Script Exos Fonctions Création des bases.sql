/* ----- */
/* EXO 1 */
/* ----- */

DROP DATABASE IF EXISTS fonctionsExo1;

CREATE DATABASE IF NOT EXISTS fonctionsExo1;

USE fonctionsExo1;

drop table if exists SERVICE;
  
create table SERVICE(
	SER_ID int auto_increment,
    SER_NOM varchar(30),
    SER_CHEF int,
    primary key (SER_ID)
);

lock tables SERVICE write;
INSERT INTO SERVICE (SER_NOM)
VALUES
  ("Comptabilite"),  ("Recherche"),  ("Ressource Humaine");
unlock tables;

drop table if exists EMPLOYE;

create table EMPLOYE(
	EMP_ID int auto_increment,
    EMP_NOM varchar(30),
    EMP_HEBDO int,
    EMP_SALAIRE int,
    EMP_SERV int,
    primary key(EMP_ID)
);

lock tables EMPLOYE write;
INSERT INTO EMPLOYE (EMP_NOM,EMP_HEBDO,EMP_SALAIRE,EMP_SERV)
VALUES
  ("Lee Houston",2,1894,2),  ("Thor Marquez",2,2661,2),  ("Samantha Copeland",8,2698,2),  ("Xyla Sawyer",1,2544,1),  ("Kelsie Boyle",0,2867,2),
  ("Leslie Cortez",6,2273,1),  ("Vladimir Mcmahon",7,2666,1),  ("Aiko Marquez",7,1842,2),  ("Lavinia Bird",7,2727,3),  ("Perry Walton",6,2903,3),
  ("Mary Bryant",0,2838,3),  ("Aline Hobbs",7,2029,2),  ("Kelly Knight",8,2003,1),  ("Kareem Cobb",8,2230,3),  ("Tanya Cooke",1,2899,2),
  ("Holmes Tanner",1,1554,3),  ("Dominique Torres",7,2120,2),  ("Keiko Cross",2,2425,2),  ("Grace Jarvis",1,1567,3),  ("Slade Henry",7,2048,1);
  unlock tables;
  
alter table SERVICE
add constraint FK_SER_CHEF foreign key (SER_CHEF) references EMPLOYE(EMP_ID);
update SERVICE set SER_CHEF = 1 where SER_ID = 1;
update SERVICE set SER_CHEF = 2 where SER_ID = 2;
update SERVICE set SER_CHEF = 3 where SER_ID = 3;
  
drop table if exists PROJET;

create table PROJET(
	PRO_ID int auto_increment,
    PRO_NOM varchar(30),
    PRO_RESP int,
    primary key (PRO_ID),
    constraint FK_PRO_RESP foreign key (PRO_RESP) references EMPLOYE(EMP_ID)
);

lock tables PROJET write;
INSERT INTO PROJET (PRO_NOM,PRO_RESP)
VALUES 
  ("Mega Lavage Informatique",1),  ("Cool Zero",2),  ("Lavage Informatique Zero",3),  ("Restaurant",4),  ("Bar à Tapas",5),  ("Super Cool Mega",6);
unlock tables;

drop table if exists TRAVAIL;

create table TRAVAIL(
	EMP_ID int,
    PRO_ID int,
    TRA_DUREE int,
    constraint FK_TRA_EMP foreign key (EMP_ID) references EMPLOYE(EMP_ID),
    constraint FK_TRA_PRO foreign key (PRO_ID) references PROJET(PRO_ID)
);

lock tables TRAVAIL write;
INSERT INTO TRAVAIL (EMP_ID,PRO_ID,TRA_DUREE)
VALUES
  (14,3,3),  (7,5,9),  (18,3,36),  (4,1,19),  (3,2,38),  (12,4,4),  (4,1,34),  (4,1,16),  (4,2,33),  (14,1,42),  (18,2,31),  (4,1,22),  (17,3,17),  (6,4,40),  (15,3,9),  (4,5,48),  (18,2,26),  (16,3,48),  (9,3,11),  (18,5,28),
  (18,4,23),  (17,2,50),  (13,6,39),  (18,3,36),  (9,5,22),  (6,6,25),  (11,2,37),  (16,4,11),  (13,4,30),  (10,6,13),  (9,1,14),  (16,2,29),  (14,1,44),  (7,5,41),  (9,6,44),  (10,4,26),  (10,3,12),  (5,5,45),  (1,5,49),  (18,3,7),
  (9,3,19),  (1,4,42),  (20,3,16),  (15,5,45),  (16,3,48),  (11,1,34),  (17,4,46),  (11,3,29),  (13,3,17),  (18,3,21),  (18,5,43),  (6,6,8),  (8,1,1),  (11,3,44),  (3,5,31),  (19,1,31),  (4,3,34),  (4,3,7),  (2,1,44),  (15,3,4),
  (18,3,2),  (5,6,36),  (16,6,19),  (17,3,20),  (5,3,35),  (8,2,48),  (2,2,35),  (13,3,31),  (6,2,37),  (5,3,8),  (3,4,33),  (17,1,6),  (5,6,21),  (12,3,47),  (3,2,36),  (14,4,42),  (3,2,35),  (20,4,40),  (5,6,46),  (1,3,9),
  (11,5,36),  (20,2,17),  (9,4,34),  (20,3,12),  (17,2,35),  (1,5,10),  (7,4,13),  (2,5,50),  (2,3,34),  (2,3,20),  (6,4,25),  (6,4,30),  (6,3,47),  (5,3,26),  (15,1,11),  (5,4,40),  (1,5,40),  (4,4,32),  (8,5,27),  (17,2,32),
  (18,3,38),  (2,5,41),  (18,5,25),  (13,3,26),  (13,5,30),  (13,6,1),  (20,2,6),  (1,4,31),  (6,1,4),  (13,6,28),  (1,2,33),  (16,6,1),  (7,4,15),  (19,4,14),  (5,1,13),  (12,5,40),  (9,5,19),  (4,2,22),  (14,3,43),  (9,3,23);
unlock tables;

/* ----- */
/* EXO 2 */
/* ----- */

/* Q1 */
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
	primary key (numinv,numab) 
);

lock table pret write;
-- Insérer 40 emprunts aléatoires
INSERT INTO pret (numinv, numab, datepret) VALUES
    ('INV001', 'A001', '2023-10-01'),    ('INV002', 'A002', '2023-10-02'),    ('INV003', 'A003', '2023-10-03'),    ('INV004', 'A004', '2023-10-04'),    ('INV005', 'A005', '2023-10-05'),    ('INV006', 'A006', '2023-10-06'),    ('INV007', 'A007', '2023-10-07'),    ('INV008', 'A008', '2023-10-08'),    ('INV009', 'A009', '2023-10-09'),    ('INV010', 'A010', '2023-10-10'),
    ('INV011', 'A011', '2023-10-11'),    ('INV012', 'A012', '2023-10-12'),    ('INV013', 'A013', '2023-10-13'),    ('INV014', 'A014', '2023-10-14'),    ('INV015', 'A015', '2023-10-15'),    ('INV016', 'A016', '2023-10-16'),    ('INV017', 'A017', '2023-10-17'),    ('INV018', 'A018', '2023-10-18'),    ('INV019', 'A019', '2023-10-19'),    ('INV020', 'A020', '2023-10-20'),
    ('INV001', 'A002', '2023-10-21'),    ('INV002', 'A003', '2023-10-22'),    ('INV003', 'A004', '2023-10-23'),    ('INV004', 'A005', '2023-10-24'),    ('INV005', 'A006', '2023-10-25'),    ('INV006', 'A007', '2023-10-26'),    ('INV007', 'A008', '2023-10-27'),    ('INV008', 'A009', '2023-10-28'),    ('INV009', 'A010', '2023-10-29'),    ('INV010', 'A011', '2023-10-30'),
	('INV011', 'A012', '2023-10-31'),    ('INV012', 'A013', '2023-11-01'),    ('INV013', 'A014', '2023-11-02'),    ('INV014', 'A015', '2023-11-03'),    ('INV015', 'A016', '2023-11-04'),    ('INV016', 'A017', '2023-11-05'),    ('INV017', 'A018', '2023-11-06');
unlock tables;