DROP DATABASE IF EXISTS exercice2;
CREATE DATABASE exercice2;
USE exercice2;
        
        
/* ----- */
/* EXO 2 */
/* ----- */
/* 
Départements : ( DNO, DNOM, DIR, VILLE)
Employés : ( ENO, ENOM, PROF, DATEEMB, SAL, COMM, #DNO)
*/

CREATE TABLE Departements (
		dno INT NOT NULL AUTO_INCREMENT,
        dnom VARCHAR (30) NOT NULL,
        dir VARCHAR (30) NOT NULL,
        ville VARCHAR (30) NOT NULL,
        PRIMARY KEY (dno)
        );
        
        
CREATE TABLE Employes (
		eno INT NOT NULL AUTO_INCREMENT,
        enom VARCHAR (30) NOT NULL,
        prof VARCHAR (50) NOT NULL,
        dateemb DATE NOT NULL,
        sal FLOAT NOT NULL,
        comm FLOAT,
        dno INT NOT NULL,
        PRIMARY KEY (eno),
        CONSTRAINT fk_departements_dno FOREIGN KEY (dno) REFERENCES departements(dno)
        );
        
        

insert into departements (dnom, dir, ville) 
values ("production", "mevi", "nancy"), ("rh", "mevi", "nancy");

insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("veeren", "dev", "2020-08-12",2000, 1000, 1);
insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("john", "dev", "2020-08-12",2500, 1500, 1);
insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("marie", "rh", "2020-08-12",1500, null, 1);
insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("julie", "rh", "2020-08-12",1500, null, 2);

-- Donnez la liste des employés ayant une commission
SELECT enom 
FROM employes 
WHERE comm >= 0;

-- Donnez les noms, emplois et salaires des employés 
-- par emploi croissant, et pour chaque emploi, par 
-- salaire décroissant ?
SELECT enom, prof, sal 
FROM employes 
ORDER BY prof, sal 
DESC;

-- Donnez le salaire moyen des employés ?
SELECT AVG (sal) 
FROM employes;

-- Donnez le salaire moyen du département Production ?
SELECT AVG (sal) FROM employes AS e INNER JOIN ( SELECT * FROM departements WHERE dnom = 'production') AS d ON e.dno = d.dno;

-- SELECT AVG(sal) 
-- FROM employes e
-- INNER JOIN departements d 
-- ON e.dno = d.dno
-- WHERE d.dnom = 'production';

-- Donnez les numéros de département et leur salaire 
-- maximum ?
SELECT d.dno, MAX(sal)
FROM employes e 
INNER JOIN departements d
ON e.dno = d.dno
GROUP BY d.dno;

-- Donnez les différentes professions et leur salaire 
-- moyen ?
SELECT prof, AVG(sal)
FROM employes e
INNER JOIN departements d
ON e.dno = d.dno
GROUP BY prof;

-- Donnez le salaire moyen par profession le plus bas ?
SELECT e.prof, AVG(e.sal) AS salaire_moyen
FROM employes e
INNER JOIN departements d ON e.dno = d.dno 
GROUP BY e.prof
ORDER BY salaire_moyen ASC
LIMIT 1;

-- Donnez-le ou les emplois ayant le salaire moyen le 
-- plus bas, ainsi que ce salaire moyen ?
SELECT e.prof, AVG(e.sal) AS salaire_moyen
FROM employes e
INNER JOIN departements d ON e.dno = d.dno
GROUP BY e.prof
HAVING AVG(e.sal) = (
	SELECT MIN(salaire_moyen)
    FROM (SELECT AVG(sal) AS salaire_moyen
    FROM employes
    GROUP BY prof
    ) AS sous_requete
);

WITH salaire_moyen_par_prof AS (
    SELECT e.prof, AVG(e.sal) AS salaire_moyen
    FROM employes e
    INNER JOIN departements d ON e.dno = d.dno
    GROUP BY e.prof
),
salaire_min AS (
    SELECT MIN(salaire_moyen) AS salaire_moyen_min
    FROM salaire_moyen_par_prof
)
SELECT smp.prof, smp.salaire_moyen
FROM salaire_moyen_par_prof smp
JOIN salaire_min sm ON smp.salaire_moyen = sm.salaire_moyen_min;


