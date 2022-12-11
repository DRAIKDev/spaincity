INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_cnp', 'CNP', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_cnp', 'CNP', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_cnp', 'CNP', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('cnp', 'CNP', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cnp',0,'practicas','Practicas',20,'{}','{}'),
	('cnp',1,'cadete','Cadete',40,'{}','{}'),
	('cnp',2,'oficial1','Oficial I',60,'{}','{}'),
	('cnp',3,'oficial2','Oficial II',85,'{}','{}'),
	('cnp',4,'oficial3','Oficial III',20,'{}','{}'),
	('cnp',5,'sargento','Sargento',40,'{}','{}'),
	('cnp',6,'teniente','Teniente',60,'{}','{}'),
	('cnp',7,'subinspector','Sub-Inspector',85,'{}','{}'),
	('cnp',8,'inspector','Inspector',20,'{}','{}'),
	('cnp',9,'inspectorjefe','Inspector Jefe',40,'{}','{}'),
	('cnp',10,'subcomisario','Sub-Comisario',60,'{}','{}'),
	('cnp',11,'boss','Comisario',85,'{}','{}')
;