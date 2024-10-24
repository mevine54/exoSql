/* ------ */
/* EXO 12 */
/* ------ */
/*
Client (clt_num, clt_nom, clt_prenom, clt_pays, clt_loc, clt_type)
Commandes(cmd_num, cmd_date, #clt_num, #mag_num)
Magasin(mag_num, mag_loc, mag_gerant)
Ligne_cmd(#cmd_num, #art_num, lcd_qte, lcd_liv, lvd_pu, lcd_date_liv)
Article(art_num, art_nom, art_poids, art_stock, art_pa, art_pv, #art_four)
*/

DROP DATABASE IF EXISTS exo12;

CREATE DATABASE exo12;
USE exo12;

DROP TABLE IF EXISTS `exo12`;
CREATE TABLE `Fournisseur` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `Fournisseur` (`name`)
VALUES
  ("Ginger Park"),
  ("Victor Foster"),
  ("Rigel Sparks"),
  ("Clio Walker"),
  ("Barclay Ayala");
  
DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
  `clt_num` mediumint(8) unsigned NOT NULL auto_increment,
  `clt_nom` varchar(255) default NULL,
  `clt_prenom` varchar(255) default NULL,
  `clt_pays` varchar(100) default NULL,
  `clt_loc` varchar(255),
  `clt_type` TEXT default NULL,
  PRIMARY KEY (`clt_num`)
) AUTO_INCREMENT=1;

INSERT INTO `Client` (`clt_nom`,`clt_prenom`,`clt_pays`,`clt_loc`,`clt_type`)
VALUES
  ("Chambers","Tobias","Barbados","Ladysmith","Habitue"),
  ("Coffey","Sylvia","Virgin Islands, United States","Kaneohe","VIP"),
  ("Gregory","Amaya","Saint Lucia","Arviat","VIP"),
  ("Nixon","Helen","Benin","Bikaner","VIP"),
  ("Rowe","Simon","Bahamas","Dannevirke","Habitue"),
  ("Hartman","Ivan","Sri Lanka","Wandsworth","Habitue"),
  ("Marquez","Kasimir","Serbia","Culiacán","VIP"),
  ("Holden","Damon","Spain","Mariupol","Habitue"),
  ("Newman","Sheila","South Sudan","Okene","VIP"),
  ("Myers","Marshall","Isle of Man","San Pedro","Habitue"),
  ("Carrillo","Kirk","Argentina","Owerri","VIP"),
  ("Becker","Dylan","Turkmenistan","Ockelbo","Habitue"),
  ("Bass","Uriel","Armenia","Bathurst","Habitue"),
  ("Thornton","Lilah","Slovenia","Steinkjer","Habitue"),
  ("Torres","Graiden","Argentina","Palma de Mallorca","Habitue"),
  ("Mcdonald","Logan","Luxembourg","Arendal","Habitue"),
  ("Bender","Vernon","French Polynesia","Joué-lès-Tours","VIP"),
  ("Bauer","Haley","Laos","Acacías","VIP"),
  ("Dalton","Driscoll","Guinea-Bissau","Jurong East","Habitue"),
  ("Merrill","Vivien","Angola","Campbellton","Habitue");

DROP TABLE IF EXISTS `Magasin`;
CREATE TABLE `Magasin` (
  `mag_num` mediumint(8) unsigned NOT NULL auto_increment,
  `mag_loc` varchar(255),
  `mag_gerant` varchar(255) default NULL,
  PRIMARY KEY (`mag_num`)
) AUTO_INCREMENT=1;

INSERT INTO `Magasin` (`mag_loc`,`mag_gerant`)
VALUES
  ("Beijing","Delilah Alvarado"),
  ("Invercargill","Noah Martinez"),
  ("Picton","Sonia Rowe"),
  ("Sagay","Amal Rodriguez"),
  ("Yahyalı","Madonna Foley");
  
DROP TABLE IF EXISTS `Article`;
CREATE TABLE `Article` (
  `art_num` mediumint(8) unsigned NOT NULL auto_increment,
  `art_nom` TEXT default NULL,
  `art_poids` mediumint default NULL,
  `art_stock` mediumint default NULL,
  `art_pa` mediumint default NULL,
  `art_pv` mediumint default NULL,
  `art_four` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`art_num`),
  CONSTRAINT FK_Four FOREIGN KEY (art_four) REFERENCES Fournisseur(id)
) AUTO_INCREMENT=1;

INSERT INTO `Article` (`art_nom`,`art_poids`,`art_stock`,`art_pa`,`art_pv`,`art_four`)
VALUES
  ("mauris,",12,22,77,7,1),
  ("odio",15,21,35,18,1),
  ("suspendisse",14,44,85,15,4),
  ("sit",19,1,4,10,5),
  ("augue",9,43,25,41,2),
  ("amet",18,5,49,68,1),
  ("et",5,10,56,66,2),
  ("pellentesque",8,17,57,26,2),
  ("arcu",7,39,91,34,3),
  ("vestibulum",14,29,39,51,4);

DROP TABLE IF EXISTS `Commande`;
CREATE TABLE `Commande` (
  `cmd_num` mediumint(8) unsigned NOT NULL auto_increment,
  `cmd_date` DATE,
  `clt_num` mediumint(8) unsigned NOT NULL,
  `mag_num` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`cmd_num`),
  CONSTRAINT FK_clt FOREIGN KEY (clt_num) REFERENCES `Client`(clt_num),
  CONSTRAINT FK_mag FOREIGN KEY (mag_num) REFERENCES Magasin(mag_num)
) AUTO_INCREMENT=1;

INSERT INTO `Commande` (`cmd_date`,`clt_num`,`mag_num`)
VALUES
  ("2019-08-20",5,4),
  ("2019-06-23",2,3),
  ("2019-09-20",10,2),
  ("2019-07-13",19,3),
  ("2019-08-06",8,1),
  ("2019-07-26",13,5),
  ("2019-09-01",17,1),
  ("2019-08-21",8,4),
  ("2019-08-17",9,3),
  ("2019-09-04",6,5),
  ("2019-08-31",20,2),
  ("2019-09-28",15,3),
  ("2019-07-11",18,3),
  ("2019-08-08",18,1),
  ("2019-06-02",10,4),
  ("2019-06-20",7,3),
  ("2019-09-11",7,2),
  ("2019-06-19",7,2),
  ("2019-07-20",19,3),
  ("2019-08-25",8,2),
  ("2019-08-08",17,5),
  ("2019-06-06",20,2),
  ("2019-08-09",6,4),
  ("2019-07-13",5,5),
  ("2019-06-17",17,4),
  ("2019-06-01",1,3),
  ("2019-06-19",16,4),
  ("2019-09-05",7,3),
  ("2019-09-11",8,5),
  ("2019-09-23",12,3);

DROP TABLE IF EXISTS `Ligne_cmd`;
CREATE TABLE `Ligne_cmd` (
  `cmd_num` mediumint(8) unsigned NOT NULL,
  `art_num` mediumint(8) unsigned NOT NULL,
  `lcd_qte` mediumint default NULL,
  `lcd_pu` mediumint default NULL,
  `lcd_date_liv` DATE,
  CONSTRAINT FK_cmd FOREIGN KEY (cmd_num) REFERENCES Commande(cmd_num),
  CONSTRAINT FK_art FOREIGN KEY (art_num) REFERENCES Article(art_num)
) AUTO_INCREMENT=1;

INSERT INTO `Ligne_cmd`
VALUES
  (16,4,1,999,"2019-07-20"),
  (3,2,3,32,"2018-11-03"),
  (26,4,2,429,"2018-03-20"),
  (20,6,2,882,"2019-05-10"),
  (12,7,1,563,"2018-03-25"),
  (5,8,2,964,"2019-08-26"),
  (23,8,2,344,"2018-09-10"),
  (29,9,2,539,"2019-01-23"),
  (13,7,2,174,"2019-02-02"),
  (20,2,2,346,"2018-09-17"),
  (23,2,1,806,"2017-12-12"),
  (26,3,3,17,"2017-11-22"),
  (24,3,3,647,"2018-05-02"),
  (6,5,1,690,"2019-05-23"),
  (3,5,3,889,"2018-07-27"),
  (10,4,2,426,"2018-08-29"),
  (27,9,1,431,"2017-12-25"),
  (13,9,3,431,"2018-05-24"),
  (10,7,1,301,"2019-09-03"),
  (21,2,2,390,"2018-09-03");
  
/*Donner le numéro des articles vendus, avec pour chacun le prix moyen de vente et le nombre de ventes ?*/
  SELECT A.art_num AS artvendu, A.art_pv, COUNT(*) 
  FROM Article A
  INNER JOIN Ligne_cmd L
	ON L.art_Num=A.art_num
  GROUP BY A.art_num;

/*Donner par magasin les statistiques de vente en 2019, à savoir le nombre de vente, 
le nombre de clients différents, et le nombre de jours ou il y a eu des ventes ?*/
select mag_num, count(*) as "Nombre de ventes", 
	count(DISTINCT clt_num) as "Nombre de clients", 
	count(DISTINCT cmd_date) as "Nombre de jours" 
from Commandes 
where YEAR(cmd_date)=2019 group by mag_num;
  
/*Donner les numéros des clients qui ont achetés plus qu'une fois dans la semaine du 6 au 10 juin ?*/
select clt_num 
from Commandes 
where cmd_date between "2019-06-06" and "2019-06-10"
group by clt_num having count(*)>1;
  
/*Donner pour les années 2017 à 2019, le nombre de clients différents sur une année tous magasins confondus ?*/
select YEAR(cmd_date), count(DISTINCT clt_num) 
from Commandes
where YEAR(cmd_date) between 2017 and 2019 group by YEAR(cmd_date); 

/*Classer les localités en fonction du nombre décroissant de clients qui y habitent ?*/
select clt_loc from client 
group by clt_loc 
order by count(*) DESC;

/*Donner le numéro et la date d'achat des clients n'ayant acheté qu'une fois ?*/
select cmd_num, cmd_date 
from Commandes 
where clt_num in
	(select clt_num 
    from Commandes 
    group by clt_num having count(*)=1); 

/*Donner la liste des clients qui n'ont pas encore acheté des articles ?*/
select * from Client 
where clt_num not in (select distinct clt_num from Commandes);

/*Donner le numéro des articles dont ma moyenne des quantités vendues est supérieure 
à la moyenne des quantités vendues en une fois tous articles confondus ?*/
select art_num 
from Ligne_cmd 
group by art_num 
having AVG(lcd_qte)> (select AVG(lcd_qte) from Ligne_cmd);

/*Donner le numéro et le nom des articles qui ont été vendu à un prix de vente unitaire supérieur au prix de vente dans le catalogue ?*/
select A.art_num, A.art_nom 
from Article AS A join Ligne_cmd as L on A.art_num=L.art_num 
where L.lct_pu > A.art_pv 
group by A.art_num, A.art_nom;
