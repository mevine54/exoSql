/* ----- */
/* EXO 9 */
/* ----- */
/*
VILLE (CodePostal, NomVille )
CINEMA (NumCine, NomCine, Adresse, #CodePostal )
SALLE (NumSalle, Capacité, #NumCine )
FILM (NumExploit, Titre, Durée)
PROJECTION (#NumExploit, #NumSalle, NumSemaine, Nbentrees)
*/

DROP DATABASE exo9;
CREATE DATABASE IF NOT EXISTS exo9;
USE exo9;

DROP TABLE IF EXISTS Ville;

CREATE TABLE Ville (
  CodePostal varchar(10) NOT NULL,
  NomVille varchar(255),
  PRIMARY KEY (CodePostal)
);

INSERT INTO Ville (CodePostal,NomVille)
VALUES
  ("54000","Nancy"),
  ("33600","Pessac"),
  ("52100","Saint-Dizier"),
  ("80100","Abbeville"),
  ("25000","Besançon"),
  ("03000","Moulins"),
  ("20000","Ajaccio"),
  ("76200","Dieppe"),
  ("06800","Cagnes-sur-Mer"),
  ("83500","La Seyne-sur-Mer");
  
  DROP TABLE IF EXISTS Cinema;

CREATE TABLE Cinema (
  NumCine mediumint(8) unsigned NOT NULL auto_increment,
  NomCine TEXT default NULL,
  Adresse varchar(255) default NULL,
  CodePostal varchar(10) NOT NULL,
  PRIMARY KEY (NumCine),
  CONSTRAINT FK_Ville FOREIGN KEY (CodePostal) REFERENCES Ville(CodePostal)
) AUTO_INCREMENT=1;

INSERT INTO Cinema (NomCine,Adresse,CodePostal)
VALUES
  ("HAULIHOUD","P.O. Box 514, 8604 At Avenue","54000"),
  ("CINAIMA","Ap #533-9934 Aliquam Ave","33600"),
  ("SPILBERG","P.O. Box 621, 5667 Libero. Av.","52100"),
  ("KANE","P.O. Box 986, 4600 Accumsan Rd.","80100"),
  ("LABAS","5974 Massa. Avenue","25000"),
  ("ICI","P.O. Box 611, 7910 Purus. Rd.","03000"),
  ("WTF","3591 Nulla St.","20000"),
  ("COUSCOUS","8456 Aliquet Ave","76200"),
  ("RETRO","Ap #164-3903 Sem St.","06800"),
  ("THEATRE","228-2345 Eleifend Avenue","83500");
  
  DROP TABLE IF EXISTS Salle;

CREATE TABLE Salle (
  NumSalle mediumint(8) unsigned NOT NULL auto_increment,
  Capacite mediumint default NULL,
  NumCine mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (NumSalle),
  CONSTRAINT FK_Cine FOREIGN KEY(NumCine) REFERENCES Cinema(NumCine)
) AUTO_INCREMENT=1;

INSERT INTO Salle (Capacite,NumCine)
VALUES
  (218,2),
  (175,4),
  (388,3),
  (364,3),
  (269,3),
  (276,8),
  (240,6),
  (177,10),
  (218,7),
  (455,10),
  (391,5),
  (306,7),
  (294,4),
  (318,5),
  (428,10),
  (249,2),
  (482,6),
  (177,10),
  (159,3),
  (333,4),
  (427,4),
  (357,7),
  (243,3),
  (314,4),
  (414,9),
  (300,5),
  (393,5),
  (166,7),
  (298,4),
  (409,3),
  (287,4),
  (341,4),
  (450,1),
  (407,9),
  (152,6),
  (367,7),
  (343,3),
  (323,5),
  (158,8),
  (486,3),
  (421,4),
  (436,7),
  (161,7),
  (209,4),
  (465,6),
  (363,5),
  (471,5),
  (494,4),
  (196,8),
  (388,3),
  (246,6),
  (282,6),
  (456,2),
  (296,2),
  (183,9),
  (443,5),
  (299,4),
  (468,4),
  (181,2),
  (329,7);

DROP TABLE IF EXISTS Film;

CREATE TABLE Film (
  NumExploit mediumint(8) unsigned NOT NULL auto_increment,
  Titre TEXT default NULL,
  Duree mediumint default NULL,
  PRIMARY KEY (NumExploit)
) AUTO_INCREMENT=1;

INSERT INTO Film (Titre,Duree)
VALUES
  ("REVENGE SUPERMAN",112),
  ("WORLD FANTASY",113),
  ("DEAD ALIVE BACK",106),
  ("BATMAN WORLD",137),
  ("DEAD",139),
  ("Hypnose",144),
  ("ALIVE BACK",118),
  ("ALIVE BACK RETURN",119);
  
  DROP TABLE IF EXISTS Projection;

CREATE TABLE Projection (
  NumExploit mediumint(8) unsigned NOT NULL,
  NumSalle mediumint(8) unsigned NOT NULL,
  NumSemaine mediumint default NULL,
  Nbentrees mediumint default NULL,
  CONSTRAINT FK_Film FOREIGN KEY (NumExploit) REFERENCES Film(NumExploit),
  CONSTRAINT FK_Salle FOREIGN KEY (NumSalle) REFERENCES Salle(NumSalle)
) ;

INSERT INTO Projection (NumExploit,NumSalle,NumSemaine,Nbentrees)
VALUES
  (5,18,19,265),
  (3,14,19,65),
  (3,49,26,66),
  (2,43,17,33),
  (3,31,3,51),
  (7,35,38,278),
  (6,33,48,154),
  (5,17,31,313),
  (7,50,22,168),
  (8,16,50,199),
  (2,50,7,293),
  (3,21,18,227),
  (5,12,37,321),
  (6,5,19,65),
  (8,25,9,161),
  (6,59,41,230),
  (6,23,50,294),
  (6,48,36,286),
  (3,21,2,164),
  (4,35,28,373),
  (7,53,17,235),
  (3,55,41,107),
  (3,50,27,39),
  (5,41,26,190),
  (7,58,25,221),
  (8,48,41,254),
  (3,34,45,261),
  (7,59,41,240),
  (8,30,45,221),
  (5,44,35,91),
  (5,32,50,247),
  (5,52,40,307),
  (8,20,40,203),
  (3,17,43,40),
  (5,7,7,138),
  (4,20,9,91),
  (4,21,26,170),
  (7,45,31,23),
  (6,7,51,103),
  (4,44,26,304);
  

/*Titre des films dont la durée est supérieure ou égale à deux heures ?*/
SELECT Titre FROM Film
WHERE Duree >= 120;
  
/*Nom des villes abritant un cinéma nommé « RIF » ?*/
SELECT V.NomVille FROM VILLE V
INNER JOIN Cinema C
	ON C.CodePostal=V.CodePostal
WHERE C.NomCine LIKE "%RIF%";
  
/*Nom des cinémas situés à Meknès ou contenant au moins une salle de plus 100 places ?*/
SELECT C.NomCine FROM Cinema C
  INNER JOIN Ville V
  ON V.CodePostal=C.CodePostal
  INNER JOIN Salle S
  ON C.NumCine=S.NumCine
WHERE V.NomVille LIKE "Meknès" OR S.Capacite > 100
GROUP BY C.NomCine;

SELECT NomCine FROM Cinema 
WHERE CodePostal=(SELECT CodePostal FROM VILLE WHERE NomVille="Meknès") 
OR NumCine IN (SELECT NumCine FROM SALLE WHERE Capacite>=100) ;
  
/*Nom, adresse et ville des cinémas dans lesquels on joue le film « Hypnose » la semaine 18 ?*/
SELECT C.NomCine, C.Adresse, V.NomVille FROM Cinema C
  INNER JOIN Ville V
  ON V.CodePostal=C.CodePostal
  INNER JOIN Salle S
  ON S.NumCine=C.NumCine
  INNER JOIN Projection P
  ON P.NumSalle=S.NumSalle
  INNER JOIN Film F
  ON F.NumExploit=P.NumExploit
WHERE F.Titre LIKE "Hypnose" AND P.NumSemaine=36;
  
/*Numéro d’exploitation des films projetés dans toutes les salles ?*/
SELECT NumExploit FROM Projection
GROUP BY NumExploit
HAVING Count(*) = (SELECT COUNT(*) FROM Salle);
  
/*Titre des films qui n’ont pas été projetés ?*/
SELECT F.Titre FROM Film F
  LEFT JOIN Projection P
	ON F.NumExploit=P.NumExploit
WHERE P.NumSalle IS NULL;