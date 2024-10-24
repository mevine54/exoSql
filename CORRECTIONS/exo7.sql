/* ----- */
/* EXO 7 */
/* ----- */

/*
Departement (NomD, N_Dep, Directeur)
Employe (Matricule, Nom, Prénom, DateNaissance, Adresse, Salaire, #N_dep, superieur)
Projet (NomP, N_pro, Lieu, #N_Dep)
Travaille (#Matricule, #N_Proj, Heures)
*/

DROP DATABASE exo7;
CREATE DATABASE IF NOT EXISTS exo7;
USE exo7;

CREATE TABLE Employe (
  Matricule mediumint(2) unsigned NOT NULL auto_increment,
  Nom varchar(255) default NULL,
  Prenom varchar(255) default NULL,
  DateNaissance varchar(255),
  Adresse varchar(255) default NULL,
  Salaire mediumint default NULL,
  N_Dep mediumint,
  superieur mediumint(2) unsigned default NULL,
  
  CONSTRAINT FK_Superieur FOREIGN KEY (superieur) REFERENCES Employe(Matricule),
  PRIMARY KEY (Matricule)
) AUTO_INCREMENT=1;

  
CREATE TABLE Departement (
NomD VARCHAR(30)  NOT NULL,
N_Dep mediumint NOT NULL AUTO_INCREMENT,
Directeur MEDIUMINT(2) UNSIGNED DEFAULT NULL,
CONSTRAINT FK_Directeur FOREIGN KEY (Directeur) REFERENCES Employe(Matricule),
PRIMARY KEY (N_Dep)
) ;

ALTER TABLE Employe
ADD CONSTRAINT FK_Departement FOREIGN KEY (N_Dep) REFERENCES Departement(N_Dep);

INSERT INTO Employe (Nom,Prenom,DateNaissance,Adresse,Salaire,N_Dep,superieur)
VALUES
  ("Humphrey","John","1993-05-20","313-8225 Sodales. Road",1827,null,null),
  ("Mejia","Sawyer","1980-05-15","300-9104 Aliquam Rd.",1452,null,null),
  ("Black","Dane","1988-06-05","Ap #109-9549 Quam Avenue",1961,null,null);
INSERT INTO Departement (NomD,Directeur)
VALUES
  ("Comptabilite",2),
  ("Recherche",3),
  ("Ressource Humaine",1);
INSERT INTO Employe (Nom,Prenom,DateNaissance,Adresse,Salaire,N_Dep,superieur)
VALUES
  ("Dickson","August","1994-06-13","9022 Felis St.",1699,2,2),
  ("Daugherty","Kennedy","1994-05-10","475 Luctus Rd.",1484,1,1),
  ("Dean","Duncan","1986-06-26","589-2179 Nulla. Road",1746,1,2),
  ("Wiley","Evan","1988-07-25","208-1491 Metus. Ave",1984,2,4),
  ("Greer","Astra","1993-09-25","P.O. Box 795, 596 Eu, Avenue",1823,2,1),
  ("Estes","Ryder","1979-06-17","P.O. Box 592, 2951 Primis Av.",1855,3,3),
  ("Neal","Kamal","1986-09-30","285-5531 Et Rd.",1463,2,2);


CREATE TABLE Projet (
  N_Proj mediumint(8) unsigned NOT NULL auto_increment,
  NomP TEXT default NULL,
  Lieu varchar(255),
  N_Dep mediumint default NULL,
  CONSTRAINT FK_DepProjet FOREIGN KEY (N_Dep) REFERENCES Departement(N_Dep),
  PRIMARY KEY (N_Proj)
);

INSERT INTO Projet (NomP,Lieu,N_Dep)
VALUES
  ("Mega Lavage Informatique","Sachs Harbour",1),
  ("Cool Zero","Saskatoon",2),
  ("Lavage Informatique Zero","Périgueux",3),
  ("Restaurant","Paradise",2),
  ("Super Cool Mega","Mount Pearl",3);
  
CREATE TABLE Travaille (
  id mediumint(8) unsigned NOT NULL auto_increment,
  Matricule mediumint default NULL,
  N_Proj mediumint default NULL,
  Heures mediumint default NULL,
  PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO Travaille (Matricule,N_Proj,Heures)
VALUES
  (8,5,5),
  (4,2,23),
  (10,3,7),
  (6,4,22),
  (9,2,2),
  (9,2,5),
  (9,3,5),
  (4,2,18),
  (9,4,17),
  (9,2,17),
  (4,4,26),
  (9,5,17),
  (5,2,8),
  (1,5,15),
  (5,1,27),
  (3,4,3),
  (9,2,21);
  
/* Date de naissance et l’adresse de Taha Lamharchi ? */
SELECT DateNaissance, Adresse FROM Employe
WHERE Nom LIKE "Humphrey" AND Prenom LIKE "John";
  
/*Nom et adresse des employés qui travaillent au département de recherche ?*/
SELECT E.NOM, E.Adresse FROM Employe E
INNER JOIN Departement D
ON D.N_Dep=E.N_Dep
WHERE D.NomD LIKE "Recherche";

/* Nom et Prénom des employés dont le supérieur est Taha Lamharchi ?*/
SELECT E.Nom, E.Prenom FROM Employe E
  INNER JOIN Employe S
  ON E.Superieur=S.Matricule
  WHERE S.Nom LIKE "Humphrey" AND S.Prenom LIKE "John";
  
/* Nom des employés qui travaillent plus de 10heures sur un projet à Périgueux ?*/
  SELECT E.Nom FROM EMPLOYE E
  INNER JOIN TRAVAILLE T
  ON E.Matricule=T.Matricule
  INNER JOIN Projet P
  ON P.N_Proj=T.N_Proj
  WHERE P.Lieu LIKE "Périgueux" AND T.Heures > 10
  GROUP BY E.Nom;
  
/* Nom des projets sur lesquelles travaillent Taha Lamharchi et Dounia Mahmoud ? */
  SELECT P.NomP FROM Projet P
  INNER JOIN TRAVAILLE T
  ON P.N_Proj=T.N_Proj
  INNER JOIN Employe E
  ON E.Matricule=T.Matricule
  WHERE E.Nom LIKE "Humphrey" AND E.Prenom LIKE "John"
  AND P.NomP IN (SELECT P.NomP FROM Projet P
  INNER JOIN TRAVAILLE T
  ON P.N_Proj=T.N_Proj
  INNER JOIN Employe E
  ON E.Matricule=T.Matricule
  WHERE E.Nom LIKE "Sawyer" AND E.Prenom LIKE "Mejia");
  
/*  Nom et prénom des employés qui ne travaillent sur aucun projet ?*/
  SELECT E.Nom, E.Prenom FROM Employe E
  LEFT JOIN Travaille T
  ON T.Matricule=E.Matricule
  WHERE T.N_Proj IS NULL;
  
/*Numéro des projets qui ont au moins un participant de chaque département ?*/
  SELECT P.N_Proj FROM Projet P
  INNER JOIN Travaille T
  ON T.N_Proj=P.N_Proj
  INNER JOIN Employe E
  ON E.Matricule = T.Matricule
  GROUP BY T.N_Proj
  HAVING COUNT(DISTINCT E.N_Dep)=(SELECT COUNT(*) FROM Departement);
  
/*Nom des employés qui ne travaillent pas sur un projet à Guelmim ?*/
  SELECT Nom FROM Employe
  WHERE Matricule NOT IN (
  SELECT E.Matricule FROM Employe E
  INNER JOIN Travaille T
  ON T.Matricule=E.Matricule
  INNER JOIN Projet P
  ON T.N_Proj=P.N_Proj
  WHERE P.Lieu LIKE "Périgueux"
  GROUP BY E.Nom);