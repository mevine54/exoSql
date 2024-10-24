/* ----- */
/* EXO 6 */
/* ----- */

/*
PILOTE (NUMPIL, NOMPIL, VILLE, SALAIRE)
AVION (NUMAV, NOMAV, CAPACITE, VILLE)
VOL (NUMVOL, #NUMPIL, #NUMAV, VILLE_DEP, VILLE_ARR, H_DEP, H_ARR)
*/

CREATE DATABASE IF NOT EXISTS exo6;
USE exo6;

CREATE TABLE IF NOT EXISTS PILOTE (
NUMPIL SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NOMPIL VARCHAR(50) NOT NULL,
VILLE VARCHAR(50) NOT NULL,
SALAIRE INT UNSIGNED NOT NULL,
PRIMARY KEY(NUMPIL)
);

INSERT INTO PILOTE (NOMPIL,VILLE,SALAIRE)
VALUES
  ("Maxwell Whitney","Maroc",19261),
  ("Leroy Cooley","Marrakech",28530),
  ("Scott Wilkerson","Rabat",13390),
  ("Ariana Sears","Fès",31491),
  ("Brent Langley","Meknès",14949),
  ("Julien Sublon", "Marseille", 87000);

CREATE TABLE IF NOT EXISTS AVION (
NUMAV SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NOMAV VARCHAR(50) NOT NULL,
CAPACITE INT UNSIGNED NOT NULL,
VILLE VARCHAR(50) NOT NULL,
PRIMARY KEY(NUMAV)
);

INSERT INTO AVION (NOMAV,VILLE,CAPACITE)
VALUES
  ("Craig","Meknès",413),
  ("Porter","Meknès",326),
  ("Illana","Meknès",487),
  ("Jasper","Fès",208),
  ("Cynthia","Fès",395),
  ("Donna","Marrakech",516),
  ("Kathleen","Meknès",504),
  ("Idona","Fès",171),
  ("Macy","Fès",366),
  ("Amanda","Marrakech",161);

CREATE TABLE IF NOT EXISTS VOL (
NUMVOL SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NUMPIL SMALLINT UNSIGNED NOT NULL,
NUMAV SMALLINT UNSIGNED NOT NULL,
VILLE_DEP VARCHAR(50) NOT NULL,
VILLE_ARR VARCHAR(50) NOT NULL,
H_DEP TIME NOT NULL,
H_ARR TIME NOT NULL,
CONSTRAINT FK_Pilote FOREIGN KEY (NUMPIL) REFERENCES PILOTE(NUMPIL),
CONSTRAINT FK_Avion FOREIGN KEY (NUMAV) REFERENCES AVION(NUMAV),
PRIMARY KEY(NUMVOL)
);

INSERT INTO VOL (NUMAV,VILLE_DEP,NUMPIL,VILLE_ARR,H_DEP,H_ARR)
VALUES
  (8,"Marrakech",5,"Rabat","08:16:09","02:44:51"),
  (10,"Maroc",2,"Meknès","08:53:26","10:40:25"),
  (3,"Marrakech",3,"Meknès","07:47:39","02:01:26"),
  (4,"Meknès",4,"Marrakech","04:55:49","10:30:08"),
  (1,"Marrakech",1,"Rabat","02:30:11","04:24:16");
  
/*Donnez la liste des avions dont la capacité est supérieure à 350 passagers ?*/
SELECT NOMAV FROM AVION WHERE CAPACITE>350;

/*Quels sont les numéros et noms des avions localisés à Marrakech ?*/
SELECT NUMAV, NOMAV FROM AVION WHERE VILLE LIKE 'Marrakech';

/*Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ?*/
SELECT NUMPIL, VILLE_DEP FROM VOL;

/*Donnez toutes les informations sur les pilotes de la compagnie ?*/
SELECT * FROM PILOTE;

/*Quel est le nom des pilotes domiciliés à Meknès dont le salaire est supérieur à 20000 € ?*/
SELECT NOMPIL FROM PILOTE
WHERE VILLE LIKE 'Meknès' AND SALAIRE > 20000; 

/*Quels sont les avions (numéro et nom) localisés à Marrakech OU dont la capacité est inférieure à 350 passagers ?*/
SELECT NUMAV, NOMAV FROM AVION
WHERE VILLE LIKE 'MArrakech' OR CAPACITE<350;

/*Quels sont les numéros des pilotes qui ne sont pas en service ?*/
SELECT P.NUMPIL, P.NOMPIL FROM PILOTE P
LEFT JOIN VOL V
ON V.NUMPIL = P.NUMPIL
WHERE V.NUMPIL IS NULL;

/*Donnez le numéro des vols effectués au départ de Marrakech par des pilotes de Meknès ?*/
SELECT V.NUMVOL FROM VOL V
INNER JOIN PILOTE P
ON V.NUMPIL=P.NUMPIL
WHERE V.VILLE_DEP LIKE 'Marrakech' AND P.VILLE LIKE 'Meknès';

/*Quels sont les vols effectués par un avion qui n’est pas localisé à Marrakech ?*/
SELECT V.NUMVOL FROM VOL V
INNER JOIN AVION A
ON A.NUMAV=V.NUMAV
WHERE A.VILLE NOT LIKE 'Marrakech';

/*Quelles sont les villes desservies à partir de la ville d’arrivée d’un vol au départ de Guelma ?*/ 
SELECT VILLE_ARR FROM VOL
WHERE VILLE_DEP = (SELECT VILLE_ARR FROM VOL WHERE VILLE_DEP = 'Maroc')
GROUP BY VILLE_ARR;