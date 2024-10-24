USE fonctionsExo1;
-- Exercice 1
-- 1)
DROP PROCEDURE IF EXISTS mettre_salaire_a_jour;

DELIMITER |
CREATE PROCEDURE mettre_salaire_a_jour (
	IN p_EMP_ID INT,
    IN p_nouveau_salaire DECIMAL(10, 2)
)
BEGIN
	UPDATE Employe
    SET EMP_SALAIRE = p_nouveau_salaire
    WHERE EMP_ID = p_EMP_ID;
END |
DELIMITER ;

CALL mettre_salaire_a_jour(4, 4850);



-- 2)
-- - Écrire une fonction qui compte le nombre d’employés participant à un projet donné.

SELECT COUNT(DISTINCT EMP_ID) FROM travail
WHERE PRO_ID = 1;


DROP FUNCTION IF EXISTS fonctionsexo1.compter_Employes_Par_Projet;

DELIMITER |
CREATE FUNCTION fonctionsexo1.compter_Employes_Par_Projet (p_PRO_ID INT)
RETURNS INT DETERMINISTIC
BEGIN

	RETURN (SELECT COUNT(DISTINCT EMP_ID) FROM travail
WHERE PRO_ID = p_PRO_ID);
END |

DELIMITER ;

SELECT fonctionsexo1.compter_Employes_Par_Projet(1) AS nombre_employes;




-- 3- Écrire une fonction qui compte le nombre de projets supervisés par les employés d’un service donné.
-- SELECT COUNT(DISTINCT PRO_RESP) FROM travail
--     WHERE EMP_ID = 5;

DROP FUNCTION IF EXISTS compter_Projets_Supervises_Par_Employes;

DELIMITER |
CREATE FUNCTION compter_Projets_Supervises_Par_Employes(SERVICE_ID INT)
RETURNS INT DETERMINISTIC
BEGIN

	RETURN (
        SELECT COUNT(p.pro_ID) AS `nombre de projets supervisés`
		FROM projet p 
		INNER JOIN employe e ON p.pro_resp = e.emp_id
		WHERE e.emp_serv = SERVICE_ID
		);
END |

DELIMITER ;
    
SELECT compter_Projets_Supervises_Par_Employes(1) AS nombre_projets_supervises;



-- 4- Écrire une fonction qui compte le nombre de projets auxquels participe l’employé donné.
SELECT COUNT(DISTINCT PRO_ID) FROM travail
WHERE EMP_ID = 1;

DROP FUNCTION IF EXISTS compter_Projets_Auxquels_Participe_Employes;

DELIMITER |
CREATE FUNCTION compter_Projets_Auxquels_Participe_Employes(p_EMP_ID INT)
RETURNS INT DETERMINISTIC
BEGIN
	RETURN (
    SELECT COUNT(DISTINCT PRO_ID) 
    FROM travail
    WHERE EMP_ID = p_EMP_ID
    );
END |

DELIMITER ;

SELECT compter_Projets_Auxquels_Participe_Employes(18) AS nombre_projets_participation_employes;

-- 5- Écrire une fonction qui renvoie la chaîne ‘Salaire faible’ si le salaire de l’employé donné est supérieur à 2000$ sinon retourner ‘Bon salaire‘.
SELECT EMP_ID, EMP_SALAIRE FROM employe WHERE EMP_ID = 3;


DROP FUNCTION IF EXISTS salaire_faible_ou_bon_salaire;

DELIMITER |
CREATE FUNCTION salaire_faible_ou_bon_salaire(EMPLOYE_ID INT)
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE salaire INT;
    
	SELECT EMP_SALAIRE 
    FROM employe 
    WHERE EMP_ID = EMPLOYE_ID
    INTO salaire
    ;
    IF salaire < 2000 THEN
		RETURN 'Salaire faible';
	ELSE
		RETURN 'Bon salaire';
	END IF;
    
END |

DELIMITER ;

SELECT salaire_faible_ou_bon_salaire(1) AS Statut_salaire;


-- 6- Écrire une fonction, qui compte le nombre d’employés qui prennent en charge plus que le nombre de projets donné.

SELECT count(*) AS nb_EMP_SUP from (SELECT PRO_RESP, COUNT(PRO_ID) AS PROJ_PAR_EMP
FROM PROJET
GROUP BY PRO_RESP
HAVING COUNT(PRO_ID) > 1) AS T
;

DROP FUNCTION IF EXISTS nb_employes_qui_prennent_en_charge_plus_que_le_nb_projet;

DELIMITER |

CREATE FUNCTION nb_employes_qui_prennent_en_charge_plus_que_le_nb_projet(nb_projeT INT)
RETURNS INT DETERMINISTIC
BEGIN

	RETURN (
		SELECT count(*) AS nb_EMP_SUP from (SELECT PRO_RESP, COUNT(PRO_ID) AS PROJ_PAR_EMP
		FROM PROJET
		GROUP BY PRO_RESP
		HAVING COUNT(PRO_ID) > nb_projeT) AS T
    );
END |

DELIMITER ;

SELECT nb_employes_qui_prennent_en_charge_plus_que_le_nb_projet(13) ;


-- 7- Écrire une procédure qui insère l’employé donné dans une table de sauvegarde nommée ‘ALERT_EMPLOYE‘.

DROP PROCEDURE IF EXISTS inserer_emp_dans_tab_sauvegarde_alert_employe;

DROP TEMPORARY TABLE IF  EXISTS ALERTE_EMPLOYE;

DELIMITER |

CREATE PROCEDURE inserer_emp_dans_tab_sauvegarde_alert_employe(p_EMP_ID INT, p_EMP_NOM VARCHAR(30))
BEGIN
	-- CREATE TEMPORARY TABLE IF NOT EXISTS ALERTE_EMPLOYE (EMP_ID INT, EMP_NOM VARCHAR(30));
	CREATE TEMPORARY TABLE IF NOT EXISTS ALERTE_EMPLOYE LIKE  employe;

	INSERT INTO ALERTE_EMPLOYE (EMP_ID, EMP_NOM)
	VALUES (p.EMP_ID, p.EMP_NOM);
    
    SELECT * FROM ALERTE_EMPLOYE ;
END |

DELIMITER ;
    
CALL inserer_emp_dans_tab_sauvegarde_alert_employe(25, 'MEVINE');