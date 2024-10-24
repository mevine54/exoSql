/* ----- */
/* EXO 2 */
/* ----- */
/* 
Départements : ( DNO, DNOM, DIR, VILLE)
Employés : ( ENO, ENOM, PROF, DATEEMB, SAL, COMM, #DNO)
*/
CREATE DATABASE exo2; 
USE exo2;

CREATE TABLE departement (
	dno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dnom VARCHAR(50) NOT NULL,
	dir VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL
);

CREATE TABLE employes (
	eno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	enom VARCHAR(50),
	prof VARCHAR(50),
    dateemb date, 
    sal int,
    comm int,
    dno INT NOT NULL,
    CONSTRAINT fk_dno FOREIGN KEY (dno) REFERENCES departement(dno)
);

insert into departement (dnom, dir, ville) 
values ("production", "jero", "nancy"), ("rh", "jero", "nancy");

insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("boebion", "dev", "2020-08-12",2000, 1000, 1);
insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("john", "dev", "2020-08-12",2500, 1500, 1);
insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("marie", "rh", "2020-08-12",1500, null, 1);
insert into employes (enom, prof, dateemb, sal, comm, dno) 
values ("julie", "rh", "2020-08-12",1500, null, 1);

/*Donnez la liste des employés ayant une commission*/
select * from employes where comm is not null;

/*Donnez les noms, emplois et salaires des employés par emploi croissant, et pour chaque emploi, par salaire décroissant ?*/
select enom, prof, sal 
from employes
order by prof asc, sal desc;

/*Donnez le salaire moyen des employés ?*/
select avg(sal) from employes;

/*Donnez le salaire moyen du département Production ?*/
select avg(e.sal) 
from employes e
inner join departement d
	on d.dno = e.dno
where d.dnom like "production";

/*Donnez les numéros de département et leur salaire maximum ?*/
select e.dno, d.dnom, max(sal) from employes e  
inner join departement d on d.dno =  e.dno
group by dno;

/*Donnez les différentes professions et leur salaire moyen ?*/
SELECT prof, avg(sal) from employes group by prof;

/*Donnez le salaire moyen par profession le plus bas  ?*/
select prof, avg(sal) as moy 
from employes
group by prof
order by moy asc
limit 1;

/*Donnez le ou les emplois ayant le salaire moyen le plus bas, ainsi que ce salaire moyen ?*/
select prof, avg(sal) from employes
group by prof
having avg(sal) = ( 
	select avg(sal) as moy 
	from employes
	group by prof
	order by moy asc
	limit 1);