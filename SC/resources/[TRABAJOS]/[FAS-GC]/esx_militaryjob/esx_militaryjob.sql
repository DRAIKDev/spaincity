USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_military', 'military', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_military', 'military', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_military', 'military', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('military', 'Fuerzas Armadas')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('military',0,'soldado','Soldado',1800,'{}','{}'),
	('military',1,'soldado2','Soldado de Primera',1880,'{}','{}'),
	('military',2,'cabo','Cabo',1950,'{}','{}'),
	('military',3,'cabo2','Cabo Mayor',2000,'{}','{}'),
	('military',4,'sargento','Sargento',2200,'{}','{}'),
	('military',5,'sargento2','Sargento Mayor',2800,'{}','{}'),
	('military',6,'teniente','Subteniente',3000,'{}','{}'),
	('military',7,'teniente2','Teniente General',3200,'{}','{}'),
	('military',8,'boss','Capitan General',3500,'{}','{}')
;