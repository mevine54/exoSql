/* ----- */
/* EXO 5 */
/* ----- */

/*
ETUDIANT(CodeEt, NomEt, DatnEt)
MATIERE(CodeMat, NomMat, CoefMat)
ENSEIGNANT(CodeEns, NomEns, GradeEns, #CodeMat)
NOTE(#CodeEt, #CodeMat, note)
*/

CREATE DATABASE IF NOT EXISTS exo5;
USE exo5;

CREATE TABLE IF NOT EXISTS Etudiant(
CodeEt SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NomEt VARCHAR(60) NOT NULL,
DatnEt DATE NOT NULL,
PRIMARY KEY (CodeEt)
);

INSERT INTO Etudiant (NomEt,DatnEt)
VALUES
  ("Griffith Cline","2005-11-22"),
  ("Ainsley Ball","2005-09-08"),
  ("Avye Blair","2006-04-03"),
  ("Walker Hughes","2005-08-09"),
  ("Hedy Massey","2007-08-20"),
  ("Colorado Butler","2007-07-17"),
  ("Alden Levine","2008-05-24"),
  ("Cody Ellison","2005-02-12"),
  ("Jeanette Kim","2007-04-24"),
  ("Rowan Richmond","2006-11-08"),
  ("Ishmael Witt","2005-09-07"),
  ("Ivor Donaldson","2007-06-22"),
  ("Megan Pickett","2006-05-05"),
  ("Brenna Cain","2006-02-11"),
  ("Chadwick Watts","2008-08-12"),
  ("Kuame Galloway","2006-04-17"),
  ("Darryl Johns","2007-11-25"),
  ("Cain Guzman","2006-11-21"),
  ("Erich Potter","2006-12-19"),
  ("Merritt Wynn","2008-04-01"),
  ("Brody Hughes","2005-11-22"),
  ("Azalia Weeks","2008-03-22"),
  ("Kylie Johnson","2007-12-11"),
  ("Raymond Trevino","2007-08-01"),
  ("Kermit Beach","2006-05-31"),
  ("Walter Miranda","2006-09-22"),
  ("Cadman Beard","2008-04-10"),
  ("Lana O'donnell","2007-11-28"),
  ("Alika Whitfield","2007-05-26"),
  ("Neve Woodward","2008-01-21"),
  ("Katelyn Beach","2005-02-20"),
  ("Medge Perry","2008-03-15"),
  ("Todd Gentry","2007-12-30"),
  ("Elton Mccarthy","2007-04-27"),
  ("Quamar Richards","2008-02-07"),
  ("Charde Chambers","2006-12-20"),
  ("Zahir Munoz","2005-03-02"),
  ("Jamal Adams","2008-07-09"),
  ("Noelani Vega","2007-02-24"),
  ("Beck Wells","2007-12-03"),
  ("Donovan Alvarado","2008-02-25"),
  ("Tatyana Cash","2005-08-10"),
  ("Jeanette Morrison","2006-04-28"),
  ("Guinevere Bullock","2008-04-14"),
  ("April Spencer","2006-03-25"),
  ("Xander Weber","2007-11-05"),
  ("Renee Juarez","2006-10-21"),
  ("Halee Macias","2007-01-29"),
  ("Halee Justice","2008-05-06"),
  ("Shad Pierce","2005-04-12");

CREATE TABLE IF NOT EXISTS Matiere(
CodeMat SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NomMat VARCHAR(30) NOT NULL,
CoefMat SMALLINT NOT NULL,
PRIMARY KEY (CodeMat)
);

INSERT INTO Matiere (`NomMat`,`CoefMat`)
VALUES
  ("BD",3),
  ("math",2),
  ("physique",4),
  ("histoire",1),
  ("francais",2);
  
CREATE TABLE IF NOT EXISTS Enseignant(
CodeEns SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NomEns VARCHAR(50) NOT NULL,
GradeEns VARCHAR(4) NOT NULL,
CodeMat SMALLINT UNSIGNED NOT NULL,
PRIMARY KEY(CodeEns),
CONSTRAINT FK_Matiere FOREIGN KEY(CodeMat) REFERENCES Matiere(CodeMat)
);

INSERT INTO Enseignant (`NomEns`,`GradeEns`,`CodeMat`)
VALUES
  ("Anjolie Camacho","Grd3",2),
  ("Unity Sawyer","Grd1",3),
  ("Deirdre Lott","Grd3",1),
  ("Nadine Vaughan","Grd2",4),
  ("Whitney Roy","Grd4",3);

CREATE TABLE IF NOT EXISTS Note(
CodeEt SMALLINT UNSIGNED NOT NULL,
CodeMat SMALLINT UNSIGNED NOT NULL,
note SMALLINT UNSIGNED NOT NULL,
CONSTRAINT FK_Mat FOREIGN KEY(CodeMat) REFERENCES Matiere(CodeMat),
CONSTRAINT FK_Etudiant FOREIGN KEY(CodeEt) REFERENCES Etudiant(CodeEt)
);

INSERT INTO Note (`CodeEt`,`CodeMat`,`note`)
VALUES
  (3,4,7),
  (15,5,2),
  (34,1,5),
  (7,3,7),
  (20,4,8),
  (32,3,8),
  (21,3,5),
  (6,4,14),
  (49,4,9),
  (23,5,8),
  (36,4,14),
  (33,4,2),
  (44,2,11),
  (37,2,16),
  (4,1,6),
  (18,5,9),
  (17,3,7),
  (13,4,19),
  (47,2,8),
  (30,3,4),
  (34,2,2),
  (20,2,11),
  (34,3,5),
  (10,1,19),
  (10,2,17),
  (19,4,16),
  (11,1,9),
  (32,2,8),
  (41,3,17),
  (18,4,9),
  (24,4,16),
  (47,4,10),
  (2,1,5),
  (48,5,11),
  (11,5,16),
  (14,3,10),
  (31,1,10),
  (6,3,11),
  (33,3,11),
  (40,4,9),
  (47,2,9),
  (13,5,1),
  (4,3,7),
  (8,4,13),
  (19,2,19),
  (42,4,19),
  (42,2,15),
  (48,3,13),
  (38,5,14),
  (20,4,16),
  (19,5,14),
  (46,2,2),
  (36,1,11),
  (9,2,17),
  (2,3,19),
  (14,4,1),
  (42,1,6),
  (3,2,20),
  (34,2,9),
  (27,2,12),
  (33,4,16),
  (39,4,18),
  (24,1,1),
  (35,5,13),
  (25,5,6),
  (49,1,1),
  (1,2,11),
  (19,3,7),
  (26,3,14),
  (33,3,17),
  (30,2,5),
  (33,5,6),
  (36,2,4),
  (2,3,11),
  (40,2,19),
  (38,2,16),
  (26,5,1),
  (1,3,1),
  (41,4,17),
  (49,4,8),
  (3,4,8),
  (9,5,8),
  (9,4,12),
  (32,4,11),
  (36,3,10),
  (41,2,7),
  (48,2,3),
  (14,4,7),
  (12,2,5),
  (16,3,12),
  (27,4,12),
  (26,3,1),
  (42,1,10),
  (23,2,3),
  (35,4,1),
  (9,3,19),
  (15,2,17),
  (44,5,16),
  (23,4,15),
  (36,4,7),
  (20,3,2),
  (38,1,1),
  (36,3,9),
  (30,4,3),
  (48,2,8),
  (29,2,17),
  (47,2,0),
  (15,3,18),
  (25,5,15),
  (46,3,18),
  (4,4,17),
  (33,5,18),
  (48,5,9),
  (39,1,16),
  (38,3,16),
  (49,4,17),
  (44,3,3),
  (6,2,2),
  (17,2,10),
  (20,5,6),
  (17,5,12),
  (12,3,10),
  (34,5,5),
  (3,2,16),
  (3,4,14),
  (50,1,4),
  (12,4,13),
  (43,5,3),
  (47,2,7),
  (49,3,8),
  (17,2,16),
  (42,2,12),
  (7,4,20),
  (18,1,12),
  (34,1,13),
  (5,2,16),
  (11,3,9),
  (32,4,15),
  (46,2,12),
  (33,3,13),
  (35,3,3),
  (47,4,15),
  (37,5,4),
  (30,2,6),
  (3,1,10),
  (29,2,18),
  (18,2,3),
  (30,4,19),
  (10,5,6),
  (7,2,19),
  (26,5,12),
  (30,2,3),
  (4,4,9),
  (27,4,9),
  (25,5,4),
  (8,2,7),
  (38,4,8),
  (38,2,18),
  (29,3,12),
  (43,2,2),
  (24,1,17),
  (41,4,9),
  (23,2,4),
  (29,1,18),
  (27,4,19),
  (30,3,10),
  (47,4,8),
  (20,2,14),
  (41,5,18),
  (9,5,7),
  (28,3,8),
  (5,2,12),
  (4,1,19),
  (37,4,19),
  (22,1,14),
  (2,1,15),
  (26,2,16),
  (25,5,5),
  (29,4,17),
  (15,2,4),
  (9,2,3),
  (50,5,17),
  (45,5,7),
  (35,4,10),
  (36,4,9),
  (29,4,14),
  (40,4,10),
  (45,3,13),
  (17,4,10),
  (5,2,10),
  (39,2,16),
  (22,4,3),
  (24,4,11),
  (46,4,9),
  (1,3,10),
  (42,3,18),
  (33,2,9),
  (12,4,9),
  (28,4,0),
  (4,3,15);

/* Les informations relatives aux étudiants (Code, Nom et Date de naissance) selon l’ordre alphabétique croisant du nom ? */
SELECT CodeEt AS id, NomEt AS NOM, DatnEt AS DATE_DE_NAISSANCE FROM Etudiant
ORDER BY NOM ASC;

/* Les noms et les grades des enseignants de la matière dont le nom est ‘BD’ ? */
SELECT E.NomEns, E. GradeEns FROM Enseignant E
INNER JOIN Matiere M
ON M.CodeMat=E.CodeMat
WHERE M.NomMat LIKE 'BD';

/* La liste distincte formée des noms et les coefficients des différentes matières 
qui sont enseignées par des enseignants de grade ‘Grd3’ ? */
SELECT DISTINCT M.NomMat, M.CoefMat FROM Matiere M
INNER JOIN Enseignant E
ON M.CodeMat=E.CodeMat
WHERE E.GradeEns LIKE 'Grd3';

/* La liste des matières (Nom et Coefficient) qui sont suivies par l’étudiant de code ‘23’ ?*/
SELECT M.NomMat AS MATIERE, M.CoefMat AS COEFFICIENT FROM Matiere M
INNER JOIN Note N ON N.CodeMat=M.CodeMat
WHERE N.CodeEt=23
GROUP BY M.NomMat;

/*Le nombre d’enseignants de la matière dont le nom est ‘Informatique’ ?*/
SELECT COUNT(E.CodeEns) FROM Enseignant E
INNER JOIN Matiere M ON M.CodeMat=E.CodeMat
WHERE M.NomMat LIKE 'physique';