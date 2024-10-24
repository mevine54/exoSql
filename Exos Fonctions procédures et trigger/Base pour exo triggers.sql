drop database if exists banqueTrigger;

CREATE DATABASE banqueTrigger;

use banqueTrigger;

drop table if exists AGENCES;
create table AGENCES(
	AGE_ID int auto_increment,
    AGE_NOM varchar(30),
    AGE_VILLE varchar(30),
    AGE_ACTIF int,
    AGE_TAUX_ACTIF int,
    AGE_DATE_CREATION date,
    AGE_DATE_MAJ date,
    primary key (AGE_ID)
);

lock tables banqueTrigger.agences write;
INSERT INTO AGENCES (AGE_NOM, AGE_VILLE, AGE_ACTIF, AGE_TAUX_ACTIF, AGE_DATE_CREATION, AGE_DATE_MAJ) VALUES
  ("Agence 1", "Liévin", 1, 5, "2023-01-01", "2023-01-01"),  ("Agence 2", "Hérouville-Saint-Clair", 1, 5, "2023-01-02", "2023-01-02"),  ("Agence 3", "Marseille", 1, 5, "2023-01-03", "2023-01-03"),  ("Agence 4", "Villeneuve-d'Ascq", 1, 5, "2023-01-04", "2023-01-04"),
  ("Agence 5", "Brest", 1, 5, "2023-01-05", "2023-01-05"),  ("Agence 6", "La Rochelle", 1, 5, "2023-01-06", "2023-01-06"),  ("Agence 7", "Castres", 1, 5, "2023-01-07", "2023-01-07"),  ("Agence 8", "Besançon", 1, 5, "2023-01-08", "2023-01-08"),
  ("Agence 9", "Tournefeuille", 1, 5, "2023-01-09", "2023-01-09"),  ("Agence 10", "Saint-Maur-des-Fossés", 1, 5, "2023-01-10", "2023-01-10");
  unlock tables;


drop table if exists CLIENTS;
create table CLIENTS(
	CLI_ID int auto_increment,
    CLI_NOM varchar(30),
    CLI_PRENOM varchar(30),
    CLI_SEXE  varchar(1),
    CLI_VILLE  varchar(30),
    CLI_DATE_CREATION date,
    CLI_DATE_MAJ date,
    primary key (CLI_ID)
);

lock table banqueTrigger.clients write;
INSERT INTO CLIENTS (CLI_NOM, CLI_PRENOM, CLI_SEXE, CLI_VILLE, CLI_DATE_CREATION, CLI_DATE_MAJ) VALUES
  ("Dupont", "Jean", "M", "Paris", "2023-01-01", "2023-01-01"),  ("Martin", "Marie", "F", "Marseille", "2023-01-02", "2023-01-02"),  ("Lefebvre", "Pierre", "M", "Lyon", "2023-01-03", "2023-01-03"),  ("Dubois", "Sophie", "F", "Toulouse", "2023-01-04", "2023-01-04"),
  ("Leroy", "Thomas", "M", "Nice", "2023-01-05", "2023-01-05"),  ("Moreau", "Léa", "F", "Nantes", "2023-01-06", "2023-01-06"),  ("Roux", "Lucas", "M", "Strasbourg", "2023-01-07", "2023-01-07"),  ("Garcia", "Manon", "F", "Montpellier", "2023-01-08", "2023-01-08"),
  ("Fournier", "Hugo", "M", "Bordeaux", "2023-01-09", "2023-01-09"),  ("Bertrand", "Zoé", "F", "Lille", "2023-01-10", "2023-01-10"),  ("Caron", "Chloé", "F", "Rennes", "2023-01-11", "2023-01-11"),  ("Garnier", "Romain", "M", "Reims", "2023-01-12", "2023-01-12"),
  ("Blanc", "Emma", "F", "Le Havre", "2023-01-13", "2023-01-13"),  ("Muller", "Antoine", "M", "Toulon", "2023-01-14", "2023-01-14"),  ("Morin", "Lola", "F", "Clermont-Ferrand", "2023-01-15", "2023-01-15"),  ("Petit", "Paul", "M", "Saint-Denis", "2023-01-16", "2023-01-16"),
  ("Guérin", "Camille", "F", "Avignon", "2023-01-17", "2023-01-17"),  ("Barbier", "Nathan", "M", "Nîmes", "2023-01-18", "2023-01-18"),  ("Martinez", "Inès", "F", "Aix-en-Provence", "2023-01-19", "2023-01-19"),  ("Dumas", "Victor", "M", "Limoges", "2023-01-20", "2023-01-20");
unlock tables;


drop table if exists COMPTE;
create table COMPTES(
	COM_ID int auto_increment,
    COM_SOLDE int,
    COM_DATE_CREATION date,
    COM_DATE_MAJ date,
    CLI_ID int,
    AGE_ID int,
    primary key (COM_ID),
    constraint FK_COM_CLI foreign key (CLI_ID) references CLIENTS(CLI_ID),
    constraint FK_COM_AGE foreign key (AGE_ID) references AGENCES(AGE_ID)
);

lock table banqueTrigger.comptes write;
INSERT INTO COMPTES (COM_SOLDE, COM_DATE_CREATION, COM_DATE_MAJ, CLI_ID, AGE_ID) VALUES
  (10000, "2023-01-01", "2023-01-01", 1, 1),  (15000, "2023-01-02", "2023-01-02", 2, 2),  (20000, "2023-01-03", "2023-01-03", 3, 3),  (8000, "2023-01-04", "2023-01-04", 4, 4),  (12000, "2023-01-05", "2023-01-05", 5, 5),  (9000, "2023-01-06", "2023-01-06", 6, 6),  (18000, "2023-01-07", "2023-01-07", 7, 7),  (22000, "2023-01-08", "2023-01-08", 8, 8),
  (25000, "2023-01-09", "2023-01-09", 9, 9),  (3000, "2023-01-10", "2023-01-10", 10, 10),  (28000, "2023-01-11", "2023-01-11", 11, 1),  (5000, "2023-01-12", "2023-01-12", 12, 2),  (35000, "2023-01-13", "2023-01-13", 13, 3),  (1500, "2023-01-14", "2023-01-14", 14, 4),  (22000, "2023-01-15", "2023-01-15", 15, 5),  (17000, "2023-01-16", "2023-01-16", 16, 6),
  (2000, "2023-01-17", "2023-01-17", 17, 7),  (25000, "2023-01-18", "2023-01-18", 18, 8),  (40000, "2023-01-19", "2023-01-19", 19, 9),  (6000, "2023-01-20", "2023-01-20", 20, 10);
unlock tables;

drop table if exists EMPRUNT;
create table EMPRUNTS(
	EMP_ID int auto_increment,
    EMP_MONTANT int,
    EMP_DATE_CREATION date,
    EMP_DATE_MAJ date,
    CLI_ID int,
    AGE_ID int,
    primary key (EMP_ID),
    constraint FK_EMP_CLI foreign key (CLI_ID) references CLIENTS(CLI_ID),
    constraint FK_EMP_AGE foreign key (AGE_ID) references AGENCES(AGE_ID)
);

lock table banqueTrigger.emprunts write;
INSERT INTO EMPRUNTS (EMP_MONTANT, EMP_DATE_CREATION, EMP_DATE_MAJ, CLI_ID, AGE_ID) VALUES
  (5000, "2023-01-01", "2023-01-01", 1, 1),  (8000, "2023-01-02", "2023-01-02", 2, 2),  (10000, "2023-01-03", "2023-01-03", 3, 3),  (4000, "2023-01-04", "2023-01-04", 4, 4),  (6000, "2023-01-05", "2023-01-05", 5, 5),  (4500, "2023-01-06", "2023-01-06", 6, 6),  (9000, "2023-01-07", "2023-01-07", 7, 7),  (11000, "2023-01-08", "2023-01-08", 8, 8),
  (12500, "2023-01-09", "2023-01-09", 9, 9),  (1500, "2023-01-10", "2023-01-10", 10, 10),  (14000, "2023-01-11", "2023-01-11", 11, 1),  (2500, "2023-01-12", "2023-01-12", 12, 2),  (17000, "2023-01-13", "2023-01-13", 13, 3),  (750, "2023-01-14", "2023-01-14", 14, 4),  (11000, "2023-01-15", "2023-01-15", 15, 5),  (8500, "2023-01-16", "2023-01-16", 16, 6),
  (1000, "2023-01-17", "2023-01-17", 17, 7),  (12500, "2023-01-18", "2023-01-18", 18, 8),  (20000, "2023-01-19", "2023-01-19", 19, 9),  (3000, "2023-01-20", "2023-01-20", 20, 10);
unlock tables;






