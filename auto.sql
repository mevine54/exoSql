USE autoecole;

CREATE TABLE IF NOT EXISTS Modele (
mod_id INT NOT NULL AUTO_INCREMENT,
mod_label VARCHAR (50) NOT NULL,
PRIMARY KEY (mod_id)
);

CREATE TABLE IF NOT EXISTS Vehicule (
veh_id INT NOT NULL AUTO_INCREMENT,
veh_immat VARCHAR (10) NOT NULL,
veh_label VARCHAR (50) NOT NULL,
mod_id INT NOT NULL,
PRIMARY KEY (veh_id),
CONSTRAINT fk_modele_mod_id FOREIGN KEY (mod_id) REFERENCES modele (mod_id)
);

CREATE TABLE IF NOT EXISTS Eleve (
ele_id INT NOT NULL AUTO_INCREMENT,
ele_nom VARCHAR (50) NOT NULL,
ele_prenom VARCHAR (50) NOT NULL,
PRIMARY KEY (ele_id)
);

CREATE TABLE IF NOT EXISTS Moniteur (
mon_id INT NOT NULL AUTO_INCREMENT,
mon_nom VARCHAR (50) NOT NULL,
mon_prenom VARCHAR (50),
PRIMARY KEY (mon_id)
);

CREATE TABLE IF NOT EXISTS Calendrier (
cal_id INT NOT NULL AUTO_INCREMENT,
cal_date DATETIME NOT NULL,
PRIMARY KEY (cal_id)
);

CREATE TABLE IF NOT EXISTS Lecon (
duree TIME NOT NULL,
veh_id INT NOT NULL,
ele_id INT NOT NULL,
mon_id INT NOT NULL,
cal_id INT NOT NULL,
PRIMARY KEY (veh_id, ele_id, mon_id, cal_id),
CONSTRAINT fk_vehicule_veh_id FOREIGN KEY (veh_id) REFERENCES vehicule (veh_id),
CONSTRAINT fk_eleve_ele_id FOREIGN KEY (ele_id) REFERENCES eleve (ele_id),
CONSTRAINT fk_moniteur_mon_id FOREIGN KEY (mon_id) REFERENCES moniteur (mon_id),
CONSTRAINT fk_calendrier_cal_id FOREIGN KEY (cal_id) REFERENCES calendrier (cal_id)
);
