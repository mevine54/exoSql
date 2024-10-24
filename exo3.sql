DROP DATABASE IF EXISTS exercice3;
CREATE DATABASE exercice3;
USE exercice3;

CREATE TABLE IF NOT EXISTS Etudiant (
	NEtudiant INT NOT NULL AUTO_INCREMENT,
    Nom VARCHAR (30) NOT NULL,
    Prenom VARCHAR (30) NOT NULL,
    PRIMARY KEY (NEtudiant)
    );
    
CREATE TABLE IF NOT EXISTS Matiere (
	CodeMat INT NOT NULL AUTO_INCREMENT,
    LibelleMat VARCHAR (30) NOT NULL,
    CoefMat NUMERIC (2) NOT NULL,
    PRIMARY KEY (CodeMat)
    );
    
CREATE TABLE IF NOT EXISTS Evaluer (
	`Date` DATE NOT NULL,
    Note FLOAT NOT NULL,
    NEtudiant INT NOT NULL,
    CodeMat INT NOT NULL,
    PRIMARY KEY (`Date`),
    CONSTRAINT fk_etudiant_NEtudiant FOREIGN KEY (NEtudiant) REFERENCES etudiant (NEtudiant),
    CONSTRAINT fk_matiere_CodeMat FOREIGN KEY (CodeMat) REFERENCES matiere (CodeMat)
    );
    
/* ----- */
/* EXO 3 */
/* ----- */
/* 
ETUDIANT(etu_num, etu_nom, etu_prenom)
MATIERE(mat_code, mat_libelle, mat_coef)
EVALUER(eva_num, #etu_num, #mat_code, eva_date, eva_note)
*/

insert into ETUDIANT(Nom, Prenom)
values  ("Ella","Perkins"),
        ("Sawyer","Weiss"),
        ("Summer","Joyce"),
        ("Isaiah","Montgomery");

insert into MATIERE (LibelleMat, CoefMat)
values ("Mathématiques", "5"),
        ("Français", "4"),
        ("Histoire-géographie", "4");

insert into EVALUER (NEtudiant, CodeMat, `Date`, Note)
values ("1","1","23-10-26",17),
        ("1","1","23-12-10",15),
        ("1","2","23-02-15",12),
        ("1","2","23-05-02",07),
        ("1","3","23-01-12",06),
        ("1","3","23-03-24",14),
        ("2","1","23-09-26",18),
        ("2","1","23-12-11",09),
        ("2","2","23-02-16",07),
        ("2","2","23-05-01",20),
        ("2","3","23-01-13",16),
        ("2","3","23-03-25",09),
        ("3","1","23-07-26",05),
        ("3","1","23-12-19",14),
        ("3","2","23-02-18",15),
        ("3","2","23-05-03",09),
        ("3","3","23-01-14",07),
        ("3","3","23-03-27",05),
        ("4","1","23-09-28",15),
        ("4","1","23-12-22",14),
        ("4","2","23-02-23",09),
        ("4","2","23-05-27",06),
        ("4","3","23-02-12",17),
        ("4","3","23-04-24",10);
    
    
    
-- Quel est le nombre total d’étudiants ?-- 
SELECT COUNT(*) FROM etudiant;
    
-- Quelles sont, parmi l’ensemble des notes, la note la
-- plus haute et la note la plus basse ?
SELECT MAX(Note), MIN(Note) FROM evaluer;

-- Quelles sont les moyennes de chaque étudiant dans
-- chacune des matières ? [MGETU]
SELECT etudiant.Nom,etudiant.Prenom, matiere.LibelleMat, AVG(evaluer.Note) MGETU
FROM etudiant 
JOIN evaluer ON etudiant.NEtudiant = evaluer.NEtudiant
JOIN matiere ON evaluer.CodeMat = matiere.CodeMat
GROUP BY evaluer.NEtudiant, matiere.CodeMat;

CREATE VIEW mgetu AS (
	SELECT etudiant.NEtudiant,etudiant.Nom,etudiant.Prenom,matiere.LibelleMat,matiere.CoefMat, AVG(evaluer.Note) MGETU
	FROM etudiant 
	JOIN evaluer ON etudiant.NEtudiant = evaluer.NEtudiant
	JOIN matiere ON evaluer.CodeMat = matiere.CodeMat
	GROUP BY  evaluer.NEtudiant, matiere.CodeMat
    order by etudiant.Nom
);
SELECT * FROM mgetu  ;

-- Quelles sont les moyennes par matière ? En utilisant la
-- requête MGETU de la question 3 [MOYETUMAT] ?
-- Solution 1
SELECT Matiere.LibelleMat, AVG(evaluer.Note) MOYETUMAT
FROM matiere
JOIN evaluer ON matiere.CodeMat = evaluer.CodeMat
GROUP BY matiere.CodeMat;

-- Solution 2
WITH MGETU AS (
    SELECT m.LibelleMat, AVG(ev.Note) AS Moyenne_etu
    FROM Etudiant e
    JOIN Evaluer ev ON e.NEtudiant = ev.NEtudiant
    JOIN Matiere m ON ev.CodeMat = m.CodeMat
    GROUP BY e.NEtudiant, m.CodeMat
)
SELECT LibelleMat, AVG(Moyenne_etu) AS Moyenne_Matiere
FROM MGETU
GROUP BY LibelleMat;


-- Quelle est la moyenne générale de chaque étudiant ?
-- En utilisant la requête MGETU de la question 3 (
-- MOYETUMAT) ?
-- Solution 1
CREATE VIEW moyetumat AS (
SELECT NEtudiant,nom,prenom, SUM(CoefMat * mgetu) / SUM(CoefMat) as moyenne_ge FROM mgetu GROUP BY NEtudiant
);

SELECT * from moyetumat;

-- Solution 2
WITH MGETU AS (
    SELECT e.NEtudiant, e.Nom, e.Prenom, m.CoefMat, AVG(ev.Note) AS Moyenne_etu_matiere
    FROM Etudiant e
    JOIN Evaluer ev ON e.NEtudiant = ev.NEtudiant
    JOIN Matiere m ON ev.CodeMat = m.CodeMat
    GROUP BY e.NEtudiant, m.CodeMat
)
SELECT MGETU.NEtudiant, MGETU.Nom, MGETU.Prenom, 
       SUM(MGETU.Moyenne_etu_matiere * MGETU.CoefMat) / SUM(MGETU.CoefMat) AS Moyenne_Generale
FROM MGETU
GROUP BY MGETU.NEtudiant, MGETU.Nom, MGETU.Prenom;

-- Quelle est la moyenne générale de la promotion ? En
-- utilisant la requête MGETU de la question 5 ?

SELECT AVG(moyenne_ge) from moyetumat;

-- Quels sont les étudiants qui ont une moyenne
-- générale supérieure ou égale à la moyenne générale
-- de la promotion? Avec la vue MGETU de la question 5
-- ?

SELECT * from moyetumat WHERE moyenne_ge >= (SELECT AVG(moyenne_ge) from moyetumat);




















