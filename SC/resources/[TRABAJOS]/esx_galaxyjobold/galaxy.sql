INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_galaxy', 'galaxy', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_galaxy', 'galaxy', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
  ('society_galaxy', 'galaxy', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('galaxy', 'galaxy-Bar', 1),
  ('offgalaxy', 'Fuera de servicio galaxy-Bar', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('galaxy',0,'novato','Ayudante',780,'{}','{}'),
  ('galaxy',1,'camarero','Camarero',840,'{}','{}'),
  ('galaxy',2,'encargado','Encargado',870,'{}','{}'),
  ('galaxy',3,'subjefe','Sub-Jefe',960,'{}','{}'),
  ('galaxy',4,'boss','Jefe',3800,'{}','{}'),
  ('offgalaxy',0,'novato','Ayudante',200,'{}','{}'),
  ('offgalaxy',1,'camarero','Camarero',220,'{}','{}'),
  ('offgalaxy',2,'encargado','Encargado',230,'{}','{}'),
  ('offgalaxy',3,'subjefe','Sub-Jefe',240,'{}','{}'),
  ('offgalaxy',4,'boss','Jefe',250,'{}','{}')
;

