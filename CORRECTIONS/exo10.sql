/* -------- */
/*  EXO 10  */
/* -------- */
/*
EQUIPE(CodeEquipe, NomEquipe, DirecteurSportif)
COUREUR(NuméroCoureur, NomCoureur, #CodeEquipe, #CodePays)
PAYS(CodePays, NomPays)
TYPE_ETAPE(CodeType, LibelleType)
ETAPE(NuméroEtap, DateEtape, VilleDép, VilleArr, NbKm, #CodeType)
PARTICIPER(#NuméroCoureur, #NuméroEtape, TempsRealisé)
ATTRIBUER_BONIFICATION(#NuméroEtape, #NuméroCoureur, km, Rang, NbSecondes)
*/

DROP DATABASE IF EXISTS exo10;
CREATE DATABASE exo10;
USE exo10;

DROP TABLE IF EXISTS Equipe;

CREATE TABLE Equipe (
  CodeEquipe INT(8) unsigned NOT NULL auto_increment,
  NomEquipe TEXT default NULL,
  DirecteurSportif varchar(255) default NULL,
  PRIMARY KEY (CodeEquipe)
) AUTO_INCREMENT=1;

INSERT INTO Equipe (NomEquipe,DirecteurSportif)
VALUES
  ("Festina","Maxwell Erickson"),
  ("Union_Postal","Unity Valenzuela"),
  ("T_telekom","Hayden Hammond"),
  ("Rabobank","Maia Gardner"),
  ("Saeco","Harlan Kerr");
  
  DROP TABLE IF EXISTS Pays;

CREATE TABLE Pays (
  CodePays INT unsigned NOT NULL auto_increment,
  NomPays varchar(100) default NULL,
  PRIMARY KEY (CodePays)
) AUTO_INCREMENT=1;

INSERT INTO Pays (NomPays)
VALUES
  ("Ukraine"),
  ("Turkey"),
  ("Columbia"),
  ("Australia"),
  ("Austria"),
  ("Canada"),
  ("Nigeria"),
  ("South Korea"),
  ("Canada"),
  ("France");
  
  DROP TABLE IF EXISTS Coureur;

CREATE TABLE Coureur (
  NumeroCoureur INT unsigned NOT NULL auto_increment,
  NomCoureur varchar(255) default NULL,
  CodeEquipe INT unsigned NOT NULL,
  CodePays INT unsigned NOT NULL,
  PRIMARY KEY (NumeroCoureur),
  CONSTRAINT FK_Equipe FOREIGN KEY(CodeEquipe) REFERENCES Equipe(CodeEquipe),
  CONSTRAINT FK_Pays FOREIGN KEY(CodePays) REFERENCES Pays(CodePays)
) AUTO_INCREMENT=1;

INSERT INTO Coureur (NomCoureur,CodeEquipe,CodePays)
VALUES
  ("Tad Petty",1,10),
  ("Sean Hopkins",1,6),
  ("Cairo Skinner",1,9),
  ("Ivan Tillman",1,3),
  ("Lucius Marquez",1,3),
  ("Dale Hoover",5,9),
  ("Emerson Avery",5,2),
  ("Beck Hobbs",5,6),
  ("Wayne Sweet",5,2),
  ("Peter Contreras",5,3),
  ("Hamilton Sharpe",2,8),
  ("Castor Cotton",2,8),
  ("Brian Watson",2,2),
  ("Zeus Rivers",2,8),
  ("Nicholas Gilbert",2,9),
   ("Geoffrey Abbott",3,6),
  ("Calvin Phelps",3,2),
  ("Todd Nunez",3,2),
  ("Kenyon Dixon",3,4),
  ("Eaton Bean",3,3),
  ("Oscar Pollard",4,4),
  ("Kadeem Camacho",4,3),
  ("Rigel Barber",4,4),
  ("Quamar Hood",4,2),
  ("Graham Rowe",4,8);
  
  DROP TABLE IF EXISTS Type_etape;

CREATE TABLE Type_etape (
  CodeType INT unsigned NOT NULL auto_increment,
  LibelleType TEXT default NULL,
  PRIMARY KEY (CodeType)
) AUTO_INCREMENT=1;

INSERT INTO Type_etape (LibelleType)
VALUES
  ("Contre_la_montre"),
  ("Montagne"),
  ("Plaine");
  
DROP TABLE IF EXISTS Etape;

CREATE TABLE Etape (
  NumeroEtape INT unsigned NOT NULL auto_increment,
  DateEtape DATE,
  VilleDep varchar(255),
  VilleArr varchar(255),
  NbKm mediumint default NULL,
  CodeType INT unsigned NOT NULL,
  PRIMARY KEY (NumeroEtape),
  CONSTRAINT fk_type_etape FOREIGN KEY (CodeType) REFERENCES Type_etape(CodeType)
) AUTO_INCREMENT=1;

INSERT INTO Etape (DateEtape,VilleDep,VilleArr,NbKm,CodeType)
VALUES
  ("2022-07-05","Reims","Troyes",230,2),
  ("2022-07-06","Bastia","Lunel",151,3),
  ("2022-07-07","Sotteville-lès-Rouen","Poitiers",226,3),
  ("2022-07-08","Périgueux","Laon",182,2),
  ("2022-07-09","Limoges","Dole",227,2),
  ("2022-07-10","Dijon","Lille",159,2),
  ("2022-07-11","Alès","Montluçon",189,2),
  ("2022-07-12","Nancy","Ajaccio",231,3),
  ("2022-07-13","Le Havre","Soissons",173,3),
  ("2022-07-14","Troyes","Lens",174,2),
  ("2022-07-15","Sotteville-lès-Rouen","Aubagne",198,3),
  ("2022-07-16","Sarreguemines","Cherbourg-Octeville",192,2),
  ("2022-07-17","Tarbes","Colomiers",214,1),
  ("2022-07-18","Chalon-sur-Saône","Béziers",246,2),
  ("2022-07-19","La Rochelle","Montigny-lès-Metz",192,2),
  ("2022-07-20","Valenciennes","Metz",222,1),
  ("2022-07-21","Limoges","Limoges",237,2),
  ("2022-07-22","La Seyne-sur-Mer","Colmar",248,2),
  ("2022-07-23","Saint-Dizier","Schiltigheim",202,2);
  
  DROP TABLE IF EXISTS Participer;

CREATE TABLE Participer (
  NumeroCoureur INT unsigned NOT NULL,
  NumeroEtape INT unsigned NOT NULL,
  TempsRealise mediumint default NULL,
  PRIMARY KEY (NumeroCoureur,NumeroEtape),
  CONSTRAINT FK_Coureur FOREIGN KEY(NumeroCoureur) REFERENCES Coureur(NumeroCoureur),
  CONSTRAINT FK_Etape FOREIGN KEY(NumeroEtape) REFERENCES Etape(NumeroEtape)
) ;

INSERT INTO Participer (NumeroCoureur,NumeroEtape,TempsRealise)
VALUES
  (1,1,179),
  (2,1,205),
  (3,1,208),
  (4,1,204),
  (5,1,188),
  (6,1,210),
  (7,1,202),
  (8,1,181),
  (9,1,186),
  (10,1,192),
  (11,1,192),
  (12,1,200),
  (13,1,207),
  (14,1,195),
  (15,1,199),
  (16,1,198),
  (17,1,194),
  (18,1,209),
  (19,1,207),
  (20,1,180),
  (21,1,199),
  (22,1,184),
  (23,1,193),
  (24,1,208),
  (25,1,193),
  (1,2,182),
  (2,2,179),
  (3,2,206),
  (4,2,185),
  (5,2,198),
  (6,2,207),
  (7,2,199),
  (8,2,202),
  (9,2,182),
  (10,2,189),
  (11,2,185),
  (12,2,185),
  (13,2,185),
  (14,2,182),
  (15,2,209),
  (16,2,205),
  (17,2,195),
  (18,2,188),
  (19,2,195),
  (20,2,189),
  (21,2,183),
  (22,2,182),
  (23,2,192),
  (24,2,195),
  (25,2,194),
  (1,3,185),
  (2,3,188),
  (3,3,179),
  (4,3,208),
  (5,3,205),
  (6,3,188),
  (7,3,197),
  (8,3,204),
  (9,3,196),
  (10,3,194),
  (11,3,208),
  (12,3,188),
  (13,3,189),
  (14,3,187),
  (15,3,203),
  (16,3,209),
  (17,3,209),
  (18,3,201),
  (19,3,190),
  (20,3,206),
  (21,3,186),
  (22,3,203),
  (23,3,202),
  (24,3,186),
  (25,3,199),
  (1,4,205),
  (2,4,203),
  (3,4,188),
  (4,4,179),
  (5,4,194),
  (6,4,202),
  (7,4,181),
  (8,4,192),
  (9,4,197),
  (10,4,194),
  (11,4,205),
  (12,4,197),
  (13,4,190),
  (14,4,202),
  (15,4,200),
  (16,4,202),
  (17,4,189),
  (18,4,191),
  (19,4,210),
  (20,4,197),
  (21,4,189),
  (22,4,182),
  (23,4,205),
  (24,4,194),
  (25,4,193),
  (1,5,184),
  (2,5,185),
  (3,5,194),
  (4,5,179),
  (5,5,195),
  (6,5,209),
  (7,5,207),
  (8,5,193),
  (9,5,206),
  (10,5,205),
  (11,5,181),
  (12,5,189),
  (13,5,191),
  (14,5,199),
  (15,5,198),
  (16,5,182),
  (17,5,182),
  (18,5,193),
  (19,5,208),
  (20,5,189),
  (21,5,181),
  (22,5,186),
  (23,5,206),
  (24,5,195),
  (25,5,207),
  (1,6,180),
  (2,6,194),
  (3,6,187),
  (4,6,182),
  (5,6,209),
  (6,6,179),
  (7,6,185),
  (8,6,198),
  (9,6,183),
  (10,6,191),
  (11,6,195),
  (12,6,197),
  (13,6,194),
  (14,6,197),
  (15,6,181),
  (16,6,204),
  (17,6,192),
  (18,6,184),
  (19,6,193),
  (20,6,208),
  (21,6,208),
  (22,6,187),
  (23,6,196),
  (24,6,202),
  (25,6,182),
(1,7,178),
  (2,7,191),
  (3,7,196),
  (4,7,192),
  (5,7,205),
  (6,7,207),
  (7,7,194),
  (8,7,199),
  (9,7,209),
  (10,7,203),
  (11,7,197),
  (12,7,199),
  (13,7,199),
  (14,7,191),
  (15,7,191),
  (16,7,206),
  (17,7,203),
  (18,7,200),
  (19,7,204),
  (20,7,195),
  (21,7,195),
  (22,7,206),
  (23,7,192),
  (24,7,203),
  (1,8,179),
  (2,8,187),
  (3,8,187),
  (4,8,194),
  (5,8,208),
  (6,8,202),
  (7,8,184),
  (8,8,180),
  (9,8,187),
  (10,8,204),
  (11,8,202),
  (12,8,204),
  (13,8,206),
  (14,8,197),
  (15,8,185),
  (16,8,205),
  (17,8,209),
  (18,8,190),
  (19,8,207),
  (20,8,199),
  (21,8,183),
  (22,8,208),
  (23,8,197),
  (24,8,206),
    (1,9,191),
  (2,9,184),
  (3,9,182),
  (4,9,189),
  (5,9,179),
  (6,9,209),
  (7,9,189),
  (8,9,208),
  (9,9,188),
  (10,9,196),
  (11,9,183),
  (12,9,199),
  (13,9,191),
  (14,9,198),
  (15,9,205),
  (16,9,195),
  (17,9,193),
  (18,9,193),
  (19,9,192),
  (20,9,197),
  (21,9,180),
  (22,9,188),
  (23,9,210),
  (24,9,209),
  (1,10,202),
  (2,10,197),
  (3,10,209),
  (4,10,199),
  (5,10,190),
  (6,10,199),
  (7,10,203),
  (8,10,206),
  (9,10,198),
  (10,10,206),
  (11,10,193),
  (12,10,194),
  (13,10,196),
  (14,10,180),
  (15,10,179),
  (16,10,192),
  (17,10,194),
  (18,10,194),
  (19,10,191),
  (20,10,185),
  (21,10,202),
  (22,10,191),
    (1,11,188),
  (2,11,205),
  (3,11,191),
  (4,11,199),
  (5,11,191),
  (6,11,183),
  (7,11,204),
  (8,11,180),
  (9,11,204),
  (10,11,198),
  (11,11,200),
  (12,11,193),
  (13,11,202),
  (14,11,183),
  (15,11,186),
  (16,11,188),
  (17,11,187),
  (18,11,196),
  (19,11,209),
  (20,11,194),
  (21,11,200),
  (22,11,179),
  (1,12,187),
  (2,12,183),
  (3,12,195),
  (4,12,199),
  (5,12,202),
  (6,12,208),
  (7,12,182),
  (8,12,179),
  (9,12,196),
  (10,12,193),
  (11,12,197),
  (12,12,185),
  (13,12,199),
  (14,12,188),
  (15,12,197),
  (16,12,199),
  (17,12,203),
  (18,12,194),
  (19,12,205),
  (20,12,194),
  (1,13,205),
  (2,13,208),
  (3,13,210),
  (4,13,199),
  (5,13,181),
  (6,13,208),
  (7,13,203),
  (8,13,195),
  (9,13,207),
  (10,13,195),
  (11,13,181),
  (12,13,209),
  (13,13,184),
  (14,13,181),
  (15,13,196),
  (16,13,194),
  (17,13,200),
  (18,13,181),
  (19,13,189),
  (20,13,207),
   (1,14,194),
  (2,14,188),
  (3,14,201),
  (4,14,192),
  (5,14,194),
  (6,14,188),
  (7,14,184),
  (8,14,186),
  (9,14,196),
  (10,14,198),
  (11,14,188),
  (12,14,194),
  (13,14,186),
  (14,14,207),
  (15,14,186),
  (16,14,198),
  (17,14,181),
  (18,14,179),
  (19,14,206),
  (20,14,208),
  (1,15,206),
  (2,15,192),
  (3,15,190),
  (4,15,195),
  (5,15,186),
  (6,15,196),
  (7,15,182),
  (8,15,181),
  (9,15,207),
  (10,15,194),
  (11,15,197),
  (12,15,193),
  (13,15,188),
  (14,15,187),
  (15,15,199),
  (16,15,201),
  (17,15,198),
  (18,15,182),
  (19,15,195),
  (20,15,185),
  (1,16,185),
  (2,16,190),
  (3,16,195),
  (4,16,203),
  (5,16,198),
  (6,16,181),
  (7,16,208),
  (8,16,197),
  (9,16,185),
  (10,16,206),
  (11,16,207),
  (12,16,186),
  (13,16,208),
  (14,16,186),
  (15,16,204),
  (16,16,188),
  (17,16,192),
  (18,16,189),
  (19,16,195),
  (20,16,182),
    (1,17,206),
  (2,17,187),
  (3,17,202),
  (4,17,195),
  (5,17,184),
  (6,17,201),
  (7,17,200),
  (8,17,203),
  (9,17,181),
  (10,17,185),
  (11,17,191),
  (12,17,193),
  (13,17,197),
  (14,17,201),
  (15,17,197),
  (16,17,192),
  (17,17,181),
  (18,17,207),
  (19,17,188),
  (20,17,183),
  (1,18,187),
  (2,18,210),
  (3,18,207),
  (4,18,207),
  (5,18,182),
  (6,18,189),
  (7,18,187),
  (8,18,183),
  (9,18,200),
  (10,18,203),
  (11,18,203),
  (12,18,193),
  (13,18,188),
  (14,18,185),
  (15,18,202),
  (16,18,199),
  (17,18,206),
  (18,18,185),
  (19,18,209),
  (20,18,203),
  (1,19,193),
  (2,19,198),
  (3,19,192),
  (4,19,193),
  (5,19,192),
  (6,19,199),
  (7,19,191),
  (8,19,191),
  (9,19,179),
  (10,19,194),
  (11,19,194),
  (12,19,199),
  (13,19,202),
  (14,19,209),
  (15,19,186),
  (16,19,183),
  (17,19,197),
  (18,19,206),
  (19,19,198),
  (20,19,199);
  
  DROP TABLE IF EXISTS Attribuer_Bonification;

CREATE TABLE Attribuer_Bonification (
  NumeroEtape INT unsigned NOT NULL,
  NumeroCoureur INT unsigned NOT NULL,
  km mediumint NOT NULL,
  Rang mediumint default NULL,
  NbMinutes mediumint default NULL,
  PRIMARY KEY (NumeroEtape, NumeroCoureur, km),
  CONSTRAINT FK_CoureurBonus FOREIGN KEY(NumeroCoureur) REFERENCES Coureur(NumeroCoureur),
  CONSTRAINT FK_EtapeBonus FOREIGN KEY(NumeroEtape) REFERENCES Etape(NumeroEtape)
) ;

INSERT INTO Attribuer_Bonification (NumeroEtape,NumeroCoureur,km,Rang,NbMinutes)
VALUES
  (1,6,122,1,2),
  (2,14,77,1,4),
  (3,13,182,1,4),
  (4,3,118,1,3),
  (5,7,112,1,2),
  (6,13,108,1,4),
  (7,14,66,1,3),
  (8,4,203,1,2),
  (9,14,154,1,3),
  (10,18,72,1,2),
  (11,8,206,1,3),
  (12,17,117,1,5),
  (13,9,114,1,3),
  (14,18,52,1,3),
  (15,6,70,1,2),
  (16,11,103,1,2),
  (17,3,101,1,4),
  (18,14,210,1,5),
  (19,8,120,1,4),
  (1,6,90,2,5),
  (2,6,50,2,1),
  (3,8,187,2,5),
  (4,12,98,2,4),
  (5,8,204,2,2),
  (6,14,152,2,4),
  (7,16,159,2,2),
  (8,19,69,2,2),
  (9,12,168,2,1),
  (10,14,117,2,5),
  (11,8,89,2,4),
  (12,9,191,2,2),
  (13,16,168,2,3),
  (14,8,151,2,1),
  (15,17,127,2,4),
  (16,6,203,2,1),
  (17,4,71,2,3),
  (18,10,186,2,2),
  (19,16,54,2,3),
  (1,18,165,3,4),
  (2,18,89,3,4),
  (3,1,69,3,3),
  (4,2,149,3,3),
  (5,12,91,3,1),
  (6,9,77,3,3),
  (7,9,70,3,3),
  (8,17,196,3,2),
  (9,3,145,3,1),
  (10,16,109,3,4),
  (11,14,115,3,5),
  (12,17,184,3,3),
  (13,9,157,3,2),
  (14,9,124,3,1),
  (15,18,91,3,2),
  (16,12,200,3,2),
  (17,18,171,3,5),
  (18,14,155,3,2),
  (19,2,69,3,1);
  
/* Quelle est la composition de l’équipe Festina (Numéro, nom et pays des coureurs) ?*/
SELECT C.NumeroCoureur, C.NomCoureur, P.NomPays FROM Coureur C
  INNER JOIN Pays P
  ON P.CodePays=C.CodePays
  INNER JOIN Equipe E
  ON E.CodeEquipe=C.CodeEquipe
WHERE E.NomEquipe LIKE "Festina";

/* Quel est le nombre de kilomètres total du Tour de France 97 ?*/
SELECT SUM(NbKm) AS Longueur_du_parcours FROM Etape;

/* Quel est le nombre de kilomètres total des étapes de type "Haute Montagne" ?*/
SELECT SUM(E.NbKm) AS Longueur_montagne FROM Etape E
	INNER JOIN Type_Etape T	
	ON T.CodeType=E.CodeType
WHERE T.LibelleType LIKE "Montagne";

/* Quels sont les noms des coureurs qui n’ont pas obtenu de bonifications  ?*/
SELECT C.NomCoureur FROM Coureur C
	LEFT JOIN Attribuer_Bonification A
	ON C.NumeroCoureur=A.NumeroCoureur
WHERE A.NumeroEtape IS NULL;

/* Quels sont les noms des coureurs qui ont participé à toutes les étapes ?*/
SELECT C.NomCoureur FROM Coureur C
	INNER JOIN Participer P
	ON P.NumeroCoureur=C.NumeroCoureur
GROUP BY C.NomCoureur
HAVING COUNT(*) = (SELECT COUNT(*) FROM Etape);

/* Quel est le classement général des coureurs (nom, code équipe, code pays et temps des coureurs) 
à l’issue des 13 premières étapes sachant que les bonifications ont été intégrées dans les temps réalisés à chaque étape ?*/
SELECT C.NomCoureur, C.CodeEquipe, C.CodePays, SUM(P.TempsRealise) FROM Coureur C
	INNER JOIN Participer P
	ON P.NumeroCoureur=C.NumeroCoureur
WHERE P.NumeroEtape <= 13 
GROUP BY C.NomCoureur
	HAVING COUNT(*) = 13
ORDER BY SUM(P.TempsRealise);

/* Quel est le classement par équipe à l’issue des 13 premières étapes (nom et temps des équipes) ?*/
DROP VIEW IF EXISTS Temps_Coureur;
CREATE VIEW Temps_Coureur AS
SELECT C.NomCoureur, E.NomEquipe AS Equipe, C.CodePays, SUM(P.TempsRealise) AS Temps_total FROM Coureur C
INNER JOIN Participer P
ON P.NumeroCoureur=C.NumeroCoureur
INNER JOIN Equipe E
ON E.CodeEquipe = C.CodeEquipe
WHERE P.NumeroEtape <= 13 
GROUP BY C.NomCoureur
HAVING COUNT(*) = 13
ORDER BY SUM(P.TempsRealise);

SELECT Equipe, SUM(Temps_Total) FROM Temps_Coureur
GROUP BY Equipe;

SELECT NomEquipe , SUM(TempsRealise) AS Total
FROM PARTICIPER A, COUREUR B, EQUIPE C
WHERE A.NumeroCoureur=B.NumeroCoureur And B.CodeEquipe=C.CodeEquipe  And NumeroEtape <=13
GROUP BY NomEquipe 
ORDER BY Total ;