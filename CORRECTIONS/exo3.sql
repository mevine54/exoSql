/* ----- */
/* EXO 3 */
/* ----- */
/* 
ETUDIANT(etu_num, etu_nom, etu_prenom)
MATIERE(mat_code, mat_libeller, mat_coef)
EVALUER(eva_num, #etu_num, #mat_code, eva_date, eva_note)
*/

create database if not exists exo3;
use exo3;

create table if not exists ETUDIANT
(
etu_num int auto_increment not null,
etu_nom char (30),
etu_prenom char (30),
primary key (etu_num)
);

create table if not exists MATIERE
(
mat_code int auto_increment not null,
mat_label char(50),
mat_coef int,
primary key(mat_code)
);

create table if not exists EVALUER
(
eva_num int auto_increment not null,
etu_num int not null,
mat_code int not null,
eva_date date,
eva_note int,
primary key (eva_num),
constraint fk_ETUDIANT foreign key(etu_num) references ETUDIANT(etu_num),
constraint fk_MATIERE foreign key(mat_code) references MATIERE(mat_code)
);

insert into ETUDIANT(etu_nom, etu_prenom)
values  ("Ella","Perkins"),
        ("Sawyer","Weiss"),
        ("Summer","Joyce"),
        ("Isaiah","Montgomery");

insert into MATIERE (mat_label, mat_coef)
values ("Mathématiques", "5"),
        ("Français", "4"),
        ("Histoire-géographie", "4");

insert into EVALUER (etu_num, mat_code, eva_date, eva_note)
values ("1","1","23-09-26",17),
        ("1","1","23-12-10",15),
        ("1","2","23-02-15",12),
        ("1","2","23-05-02",07),
        ("1","3","23-01-12",06),
        ("1","3","23-03-24",14),
        ("2","1","23-09-26",18),
        ("2","1","23-12-10",09),
        ("2","2","23-02-15",07),
        ("2","2","23-05-02",20),
        ("2","3","23-01-12",16),
        ("2","3","23-03-24",09),
        ("3","1","23-09-26",05),
        ("3","1","23-12-10",14),
        ("3","2","23-02-15",15),
        ("3","2","23-05-02",09),
        ("3","3","23-01-12",07),
        ("3","3","23-03-24",05),
        ("4","1","23-09-26",15),
        ("4","1","23-12-10",14),
        ("4","2","23-02-15",09),
        ("4","2","23-05-02",06),
        ("4","3","23-01-12",17),
        ("4","3","23-03-24",10);

/*Quel est le nombre total d’étudiants ?*/
select count(*) as "nombre eleves" from etudiant;

/*Quelles sont, parmi l’ensemble des notes, la note la plus haute et la note la plus basse ?*/
select min(eva_note), max(eva_note) from evaluer;

/*Quelles sont les moyennes de chaque étudiant dans chacune des matières ? [MGETU]*/
select e.etu_num, e.etu_nom, m.mat_label, avg(ev.eva_note) as moyenne
from evaluer ev, matiere m, etudiant e 
WHERE ev.mat_code = m.mat_code
AND ev.etu_num = e.etu_num
GROUP BY e.etu_num, m.mat_code;

/*Quelles sont les moyennes par matière ? En utilisant la requête MGETU de la question 3 [MOYETUMAT] ?*/
create TEMPORARY table MGETU select e.etu_num, e.etu_nom, m.mat_label, m.mat_coef, avg(ev.eva_note) as moyenne
from evaluer ev, matiere m, etudiant e 
WHERE ev.mat_code = m.mat_code
AND ev.etu_num = e.etu_num
GROUP BY e.etu_num, m.mat_code;

select mat_label, avg(moyenne) from MGETU
GROUP BY mat_label;

/*Quelle est la moyenne générale de chaque étudiant ? En utilisant la requête MGETU de la question 3 ( MOYETUMAT)  ?*/
SELECT etu_nom, SUM(moyenne*mat_coef)/SUM(mat_coef) as moyenneGeneral
from MGETU
GROUP BY etu_nom;

/*Quelle est la moyenne générale de la promotion ? En utilisant la requête MGETU de la question 5  ?*/
SELECT avg(moyenne) as "Moyenne Promo" from MGETU;

/*Quels sont les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne générale de la promotion? Avec la vue MGETU de la question 5   ?*/
create TEMPORARY table MGPETU SELECT avg(moyenne) as "Moyenne Promo" from MGETU;

select etu_nom, SUM(moyenne*mat_coef)/SUM(mat_coef) as moygene from V_MGETU
group by etu_num
HAVING moygene >= (select * from MGPETU);

CREATE temporary table MOYETUMAT select etu_nom, SUM(moyenne*mat_coef)/SUM(mat_coef) as moyenneGeneral
FROM MGETU
GROUP BY etu_nom;

select * FROM MOYETUMAT;

CREATE temporary table Promo
select avg(moyenneGeneral)  
from MOYETUMAT; 

select etu_nom FROM MOYETUMAT
WHERE moyenneGeneral > (select * from Promo);