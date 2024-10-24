USE clubtourisme;

CREATE TABLE IF NOT EXISTS Pays (
pay_id INT NOT NULL AUTO_INCREMENT,
pay_nom VARCHAR (50) NOT NULL,
PRIMARY KEY (pay_id)
);
CREATE TABLE IF NOT EXISTS Village (
vil_id INT NOT NULL AUTO_INCREMENT,
vil_nom VARCHAR (50) NOT NULL,
vil_places NUMERIC (4) NOT NULL,
pay_id INT NOT NULL,
PRIMARY KEY (vil_id, pay_id),
CONSTRAINT fk_pays_pay_id FOREIGN KEY (pay_id) REFERENCES pays (pay_id)
);

CREATE TABLE IF NOT EXISTS Activite (
act_id INT NOT NULL AUTO_INCREMENT,
act_nom VARCHAR (20) NOT NULL,
PRIMARY KEY (act_id)
);

CREATE TABLE IF NOT EXISTS Periode (
per_id INT NOT NULL AUTO_INCREMENT,
per_annee NUMERIC (4) NOT NULL,
per_debut INT NOT NULL,
per_fin INT NOT NULL,
per_label VARCHAR (25) NOT NULL,
PRIMARY KEY (per_id)
);

CREATE TABLE IF NOT EXISTS Semaine (
sem_id INT NOT NULL AUTO_INCREMENT,
per_id INT NOT NULL,
PRIMARY KEY (sem_id),
CONSTRAINT fk_periode_per_id FOREIGN KEY (per_id) REFERENCES periode (per_id)
);

CREATE TABLE IF NOT EXISTS Adherent (
adh_id INT NOT NULL AUTO_INCREMENT,
adh_nom VARCHAR (50) NOT NULL,
adh_prenom VARCHAR (50) NOT NULL,
adh_adresse VARCHAR (100) NOT NULL,
adh_date DATE NOT NULL,
PRIMARY KEY (adh_id)
);

CREATE TABLE IF NOT EXISTS Reserver (
res_places NUMERIC (4) NOT NULL,
vil_id INT NOT NULL,
adh_id INT NOT NULL,
sem_id INT NOT NULL,
PRIMARY KEY (vil_id, adh_id, sem_id),
CONSTRAINT fk_village_vil_id FOREIGN KEY (vil_id) REFERENCES village(vil_id),
CONSTRAINT fk_adherent_adh_id FOREIGN KEY (adh_id) REFERENCES adherent(adh_id),
CONSTRAINT fk_semaine_sem_id FOREIGN KEY (sem_id) REFERENCES semaine(sem_id)
); 

CREATE TABLE IF NOT EXISTS Proposer (
vil_id INT NOT NULL,
act_id INT NOT NULL,
PRIMARY KEY (vil_id, act_id),
CONSTRAINT fk_village_vil_id FOREIGN KEY (vil_id) REFERENCES village(vil_id),
CONSTRAINT fk_activite_act_id FOREIGN KEY (act_id) REFERENCES activite(act_id)
);

CREATE TABLE IF NOT EXISTS Offrir (
prix FLOAT NOT NULL,
vil_id INT NOT NULL,
per_id INT NOT NULL,
PRIMARY KEY (vil_id, per_id),
CONSTRAINT fk_village_vil_id FOREIGN KEY (vil_id) REFERENCES village (vil_id),
CONSTRAINT fk_periode_per_id FOREIGN KEY (per_id) REFERENCES periode (per_id)
);




