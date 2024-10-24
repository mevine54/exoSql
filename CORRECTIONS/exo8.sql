/* ----- */
/* EXO 8 */
/* ----- */
/*
CLIENT (NumCli, Nom, Prénom, e-mail, NumCB )
VOYAGE (CodeVoyage, Destination, Durée, Prix )
RESERVATION (#NumCli, #CodeVoyage, DateRes )
*/

DROP DATABASE exo8;
CREATE DATABASE IF NOT EXISTS exo8;
USE exo8;

DROP TABLE IF EXISTS Client;

CREATE TABLE Client (
  NumCli mediumint(8) unsigned NOT NULL auto_increment,
  Nom varchar(255) default NULL,
  Prenom varchar(255) default NULL,
  e_mail varchar(255) default NULL,
  NumCB varchar(255),
  PRIMARY KEY (NumCli)
) AUTO_INCREMENT=1;

INSERT INTO Client (Nom,Prenom,e_mail,NumCB)
VALUES
  ("Vance","Cadman","vance_cadman@hotmail.net","343153554214532"),
  ("Alexander","Wallace","alexander.wallace7732@icloud.fr","514668 941642 7354"),
  ("Nelson","Pandora","pandora-nelson2236@protonmail.fr","201485272363757"),
  ("Casey","Suki","s-casey5818@outlook.couk","402 64969 15818 215"),
  ("Burns","Thor","tburns5573@outlook.ca","490542 744738 4331"),
  ("Velez","Thor","v.thor@icloud.net","3722 393145 63443"),
  ("Mcdonald","Flynn","m-flynn@google.couk","2014 447558 72511"),
  ("Mclean","Mikayla","m_mclean6737@yahoo.couk","3024 375272 57457"),
  ("Henson","Arthur","arthur-henson@google.ca","5741 463417 65321"),
  ("Gallegos","Barry","g_barry4245@yahoo.net","556263 5283329764");
  
  DROP TABLE IF EXISTS Voyage;

CREATE TABLE Voyage (
  CodeVoyage mediumint(8) unsigned NOT NULL auto_increment,
  Destination varchar(100) default NULL,
  Duree mediumint default NULL,
  Prix mediumint default NULL,
  PRIMARY KEY (CodeVoyage)
) AUTO_INCREMENT=1;

INSERT INTO Voyage (Destination,Duree,Prix)
VALUES
  ("Singapore",4,449),
  ("Turkey",4,1833),
  ("New Zealand",11,1067),
  ("Norway",14,1627),
  ("Italy",9,1260),
  ("Brazil",6,52),
  ("France",8,1289),
  ("China",5,600),
  ("Belgium",4,1560),
  ("Turkey",1,740),
  ("Italy",12,1112),
  ("Philippines",11,1448),
  ("Belgium",10,1829),
  ("United Kingdom",6,780),
  ("Nigeria",7,1433),
  ("China",13,1792),
  ("China",12,310),
  ("Belgium",8,738),
  ("Turkey",9,352),
  ("Poland",10,1252);
  
  DROP TABLE IF EXISTS Reservation;

CREATE TABLE Reservation (
  NumCli mediumint(8) unsigned NOT NULL,
  CodeVoyage mediumint(8) unsigned NOT NULL,
  DateRes varchar(255),
  CONSTRAINT FK_Client FOREIGN KEY(NumCli) REFERENCES Client(NumCli),
  CONSTRAINT FK_Voyage FOREIGN KEY(CodeVoyage) REFERENCES Voyage(CodeVoyage)
) ;

INSERT INTO Reservation (NumCli,CodeVoyage,DateRes)
VALUES
  (7,10,"2023-03-16"),
  (5,8,"2022-03-05"),
  (6,5,"2023-05-22"),
  (8,9,"2022-08-16"),
  (3,5,"2022-10-22"),
  (6,17,"2023-04-15"),
  (7,6,"2022-05-24"),
  (2,16,"2022-07-17");
  
/*Nom, prénom et e-mail des clients ayant une réservation en cours  ?*/
SELECT C.Nom, C.Prenom, C.e_mail FROM Client C
  INNER JOIN Reservation R
  ON R.NumCli=C.NumCli
  GROUP BY C.Nom, C.Prenom, C.e_mail;
  
/*Nom, prénom et e-mail des clients n’ayant aucune réservation en cours ?*/
  SELECT C.Nom, C.Prenom, C.e_mail FROM Client C
  LEFT JOIN Reservation R
  ON R.NumCli=C.NumCli
  WHERE R.CodeVoyage IS NULL;
  
/*Destination et liste des clients ayant réservés pour un voyage de plus de 10 jours et coûtant moins de 1000 € ?*/
SELECT V.Destination, C.Nom, C.Prenom FROM Voyage V
  INNER JOIN Reservation R
  ON V.CodeVoyage=R.CodeVoyage
  INNER JOIN Client C
  ON C.NumCli=R.NumCli
  WHERE V.Duree > 10 AND V.Prix<1000;

/*Numéros de tous les clients ayant réservés sur tous les voyages proposés. ?*/
SELECT NumCli FROM Reservation
  GROUP BY NumCli
  HAVING COUNT(*) = (SELECT COUNT(*) FROM Voyage);
  