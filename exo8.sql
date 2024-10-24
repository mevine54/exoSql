DROP DATABASE IF EXISTS exercice8;
CREATE DATABASE exercice8;
USE exercice8;


CREATE TABLE IF NOT EXISTS Client (
	NumCli INT NOT NULL AUTO_INCREMENT,
    Nom VARCHAR (30) NOT NULL,
    Prenom VARCHAR (30) NOT NULL,
    email VARCHAR (50) NOT NULL,
    NumCB BIGINT NOT NULL,
    PRIMARY KEY (NumCli)
    );
    
CREATE TABLE IF NOT EXISTS Voyage (
	CodeVoyage INT NOT NULL AUTO_INCREMENT,
    Destination VARCHAR (60) NOT NULL,
    Duree TIME NOT NULL,
    Prix FLOAT NOT NULL,
    PRIMARY KEY (CodeVoyage)
    );
    
CREATE TABLE IF NOT EXISTS Reservation (
	DateRes DATE NOT NULL,
    NumCli INT NOT NULL,
    CodeVoyage INT NOT NULL,
    PRIMARY KEY (NumCli, CodeVoyage),
    CONSTRAINT fk_reservation_NumCli FOREIGN KEY (NumCli) REFERENCES Client (NumCli),
    CONSTRAINT fk_reservation_CodeVoyage FOREIGN KEY (CodeVoyage) REFERENCES Voyage (CodeVoyage)
    );


INSERT INTO Client (Nom,Prenom,email,NumCB)
VALUES
  ("Vance","Cadman","vance_cadman@hotmail.net","343153554214532"),
  ("Alexander","Wallace","alexander.wallace7732@icloud.fr","5146689416427354"),
  ("Nelson","Pandora","pandora-nelson2236@protonmail.fr","201485272363757"),
  ("Casey","Suki","s-casey5818@outlook.couk","4026496915818215"),
  ("Burns","Thor","tburns5573@outlook.ca","4905427447384331"),
  ("Velez","Thor","v.thor@icloud.net","372239314563443"),
  ("Mcdonald","Flynn","m-flynn@google.couk","201444755872511"),
  ("Mclean","Mikayla","m_mclean6737@yahoo.couk","302437527257457"),
  ("Henson","Arthur","arthur-henson@google.ca","574146341765321"),
  ("Gallegos","Barry","g_barry4245@yahoo.net","5562635283329764");

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


-- Nom, prénom et e-mail des clients ayant une réservation en cours ?

SELECT c.Nom, c.Prenom, c.email, r.DateRes
FROM Client c 
JOIN Reservation r ON c.NumCli = r.NumCli
ORDER BY r.DateRes DESC;

-- Nom, prénom et e-mail des clients n’ayant aucune réservation en cours ?

SELECT 