/* ------ */
/* EXO 11 */
/* ------ */

/*Quel est le nombre de formations suivies par catégories de salariés ayant débuté au cours de la période du 01/06/2011 au 31/12/2011 ?*/
SELECT C.LibelleCategorie, COUNT(DISTINCT F.CodeFormation) FROM Formation F
INNER JOIN DateForm D ON D.Datedebutform=F.Datedebutform
INNER JOIN SUIVRE Su ON Su.CodeFormation=F.CodeFormation
INNER JOIN Salarie S ON S.Matricule=Su.Matricule
INNER JOIN Categorie C ON C.CodeCategorie=S.CodeCategorie
WHERE D.DatedebutFormation BETWEEN "2011-06-01" AND  "2011-12-31"
GROUP BY C.LibelleCategorie;
/*Quelles sont les catégories pour lesquelles le nombre d’heures de formation est supérieur
 à la moyenne du nombre d’heures des formations suivies par l’ensemble des personnels ?*/
CREATE VIEW Heure_moyenne AS
SELECT C.LibelleCategorie AS Cate, AVG(F.DureeFormation) AS moyenne FROM Formation F
INNER JOIN SUIVRE Su ON Su.CodeFormation=F.CodeFormation
INNER JOIN Salarie S ON S.Matricule=Su.Matricule
INNER JOIN Categorie C ON C.CodeCategorie=S.CodeCategorie
GROUP BY C.LibelleCategorie;

SELECT Cate FROM Heure_moyenne
WHERE moyenne > (SELECT AVG(DureeFormation) FROM Formation);

Select libelleCategorie from Suivre, salarie, categorie, formation
	WHERE suivre.matriculesal = salarie.matriculesal
    AND salarie.codecategorie = categorie.codecategorie
    AND formation.codeform = suivre.codeform
    GROUP BY libellecategorie
    HAVING SUM(Dureeform) > (Select AVG(dureeform) FROM Suivre, formation
								where suivre.codeform = formation.codeform
							);

/*le responsable des ressources humaines souhaite intégrer dans la base de données 
une nouvelle formation liée au sertissage des boîtes de conserve.*/
/*Les nouvelles données à insérer sont les suivantes : "FORM587, sertissage niveau 1, 25j, perfectionnement, 12, 525 " 
 Ecrire la requête permettant de mettre à jour la base ?*/
INSERT INTO Formation
VALUES ("FORM587", "sertissage niveau 1", "25j", "perfectionnement", 12, 525);





