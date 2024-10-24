DROP DATABASE IF EXISTS gestion_projet;
CREATE DATABASE gestion_projet;
USE gestion_projet;


CREATE TABLE IF NOT EXISTS Developpeur (
	NumDev INT NOT NULL AUTO_INCREMENT,
    NomDeV VARCHAR (30) NOT NULL,
    AdrDev VARCHAR (50) NOT NULL,
    EmailDeV VARCHAR (50) NOT NULL,
    TelDev VARCHAR (15) NOT NULL,
    PRIMARY KEY (NumDev)
    );
    
CREATE TABLE IF NOT EXISTS Projet (
	NumProj INT NOT NULL AUTO_INCREMENT,
    TitreProj VARCHAR (30) NOT NULL,
    DateDeb DATE NOT NULL,
    DateFin DATE NOT NULL,
    PRIMARY KEY (NumProj)
    );
    
CREATE TABLE IF NOT EXISTS Logiciel (
	CodLog INT NOT NULL AUTO_INCREMENT,
    NomLog VARCHAR (40) NOT NULL,
	PrixLog FLOAT NOT NULL,
    NumProj INT NOT NULL,
    PRIMARY KEY (CodLog),
    CONSTRAINT fk_logiciel_Projet_NumProj FOREIGN KEY (NumProj) REFERENCES Projet (NumProj)
    );
    
CREATE TABLE IF NOT EXISTS Realisation (
	NumProj INT NOT NULL,
    NumDev INT NOT NULL,
    PRIMARY KEY (NumProj, NumDev),
    CONSTRAINT fk_realisation_projet_NumProj FOREIGN KEY (NumProj) REFERENCES projet (NumProj),
    CONSTRAINT fk_realisation_developpeur FOREIGN KEY (NumDev) REFERENCES Developpeur (NumDev)
    );
    

INSERT INTO Developpeur (NomDev,AdrDev,EmailDev,TelDev)
VALUES
  ("Moody","840-7900 Velit. St.","nunc.risus.varius@google.edu","05-35-23-28-78"),
  ("Shaw","P.O. Box 916, 4446 Lorem. St.","magna.praesent.interdum@aol.org","05-56-14-02-54"),
  ("Mcgee","Ap #351-4247 Velit St.","nisl.elementum.purus@protonmail.com","09-73-88-33-75"),
  ("Cortez","475-4072 Ridiculus Avenue","donec.luctus@icloud.net","06-93-48-85-37"),
  ("Landry","Ap #570-6304 Vivamus Ave","ornare.fusce.mollis@aol.org","08-23-55-77-12");

INSERT INTO Projet (TitreProj,DateDeb,DateFin)
VALUES
("dessin, coloriage,","2021-11-26","2023-01-29"),
  ("gestion de stock","2022-01-26","2022-10-25"),
  ("crayon, stylo,","2021-12-18","2023-02-20"),
  ("modeler, tampon,","2021-12-11","2022-03-21"),
  ("ciseaux, découpage,","2021-10-10","2022-07-03"),
  ("jeu, pion,","2022-01-09","2022-03-08"),
  ("album, titre,","2021-12-19","2022-12-11"),
  ("carré, rond,","2021-11-26","2022-08-14"),
  ("pli, colle,","2021-10-09","2023-09-14"),
  ("gomme, dessin,","2022-01-07","2023-05-03"),
  ("alphabet, appareil,","2021-12-31","2022-12-21"),
  ("ligne, mot,","2021-11-23","2023-04-14"),
  ("tambour, télécommande,","2022-01-21","2022-05-10"),
  ("peinture, pinceau,","2021-11-13","2022-09-21"),
  ("cube, perle,","2021-11-23","2023-08-18");

INSERT INTO Logiciel (NomLog,PrixLog,NumProj)
VALUES
  ("Franceware Calibre Fr",24,5),
  ("softranquille malware",8,4),
  ("firme expert logi",12,4),
  ("Logistick coolsoft softranquille",21,3),
  ("Bureau and texte",6,4),
  ("ware origame jeuxworks",12,2),
  ("logi facile Ordi",6,2),
  ("virus Stratège et",36,4),
  ("Hercules Pinnaple CitronVert",35,3),
  ("Bureau and texte",13,2),
  ("Francetastic Franceware",18,3),
  ("Francetastic Franceware Calibre",1,4),
  ("virus Stratège et",28,4),
  ("Solidwork",31,5),
  ("Supergame jeuxworks no",1,2),
  ("origame jeuxworks no",3,2),
  ("Très soft soft",11,4),
  ("Stop virus Stratège",20,1),
  ("texte Francetastic Franceware",16,1),
  ("Fr Logifirm Phone",16,4),
  ("jeuxworks no way",12,1),
  ("Poubelle",32,3),
  ("expert logi facile",1,3),
  ("Ordi tranquille Logistick",24,5),
  ("Bureau and texte",7,2),
  ("Fr Logifirm Incorporated",3,1);

INSERT INTO Realisation (NumProj,NumDev)
VALUES
 
  (2,5),
  (4,4),
  (10,4),
  (3,3),
  (8,3),
  (10,5),
  (9,4),
  (5,3),
  (10,3),
  (4,3),
  (5,5),
  (3,5),
  (15,4),
  (3,4),
  (7,2),
  (12,4),
  (14,3),
  (2,3),
  (6,4),
  (5,4),
  (12,2),
  (7,4),
  (15,2),
  (1,4),
  (1,2),
  (13,4),
  (9,3),
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (6,1),
  (7,1),
  (8,1),
  (9,1),
  (10,1),
  (11,1),
  (12,1),
  (13,1),
  (14,1),
  (15,1);
  
-- D’afficher les noms et les prix des logiciels 
-- appartenant au projet ayant comme titre « gestion de 
-- stock », triés dans l’ordre décroissant des prix ?

SELECT NomLog, PrixLog FROM logiciel
JOIN Projet p ON logiciel.NumProj = p.NumProj
WHERE p.TitreProj LIKE 'gestion de stock'
ORDER BY PrixLog DESC;

-- D’afficher le total des prix des logiciels du projet 
-- numéro 10. Lors de l’affichage, le titre de la colonne 
-- sera « cours total du projet » ?

SELECT NumProj, SUM(PrixLog) AS 'cours total du projet' FROM logiciel
WHERE NumProj = 2;

-- Afficher le nombre de développeurs qui ont participé 
-- au projet intitulé « gestion de stock » ?

SELECT TitreProj, COUNT(DISTINCT NumDev) AS NombreDeveloppeur
FROM realisation r
JOIN projet p ON  r.NumProj = p.NumProj
WHERE TitreProj = 'gestion de stock'; 

-- Afficher les projets qui ont plus que 5 logiciels ?
-- Solution 1
SELECT NumProj, COUNT(DISTINCT NomLog) AS NbLogiciels 
FROM logiciel l
GROUP BY NumProj
HAVING COUNT(l.NomLog) > 5;

-- Solution 2 bon
SELECT p.TitreProj, COUNT(l.CodLog) AS NombreDeLogiciels
FROM Projet p
JOIN Logiciel l ON p.NumProj = l.NumProj
GROUP BY p.NumProj, p.TitreProj
HAVING COUNT(l.CodLog) > 5;

-- Les numéros et noms des développeurs qui ont 
-- participés dans tous les projets ?

SELECT d.NomDeV 
FROM developpeur d 
JOIN realisation r ON d.NumDev = r.NumDev
JOIN projet p ON r.NumProj = p.NumProj
GROUP BY d.NumDev, d.NomDeV
HAVING COUNT(DISTINCT r.NumProj) = (SELECT COUNT(*) FROM projet);

-- Les numéros de projets dans lesquelles tous les développeurs y participent dans sa réalisation ?

SELECT p.NumProj
FROM projet p 
JOIN realisation r ON p.NumProj = r.NumProj
GROUP BY p.NumProj
HAVING COUNT(DISTINCT r.NumDev) = (SELECT COUNT(*) FROM developpeur);




























