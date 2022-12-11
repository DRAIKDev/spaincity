INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Off-Duty'),
  ('offambulance','Off-Duty'),
  ('offtaxi','Off-Duty'), 
  ('offmechanic','Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Recruit',12,'{}','{}'),
  ('offpolice',1,'officer','Officer',24,'{}','{}'),
  ('offpolice',2,'sergeant','Sergeant',36,'{}','{}'),
  ('offpolice',3,'lieutenant','Lieutenant',48,'{}','{}'),
  ('offpolice',4,'boss','Boss',0,'{}','{}'),
  ('offambulance',0,'ambulance','Ambulance',12,'{}','{}'),
  ('offambulance',1,'doctor','Doctor',24,'{}','{}'),
  ('offambulance',2,'chief_doctor','Chef',36,'{}','{}'),
  ('offambulance',3,'boss','Boss',48,'{}','{}'),
  ('offmechanic',0,'recrue','Recruit',12,'{}','{}'),
  ('offmechanic',1,'novice','Novice',24,'{}','{}'),
  ('offmechanic',2,'experienced','Experienced',36,'{}','{}'),
  ('offmechanic',3,'chief','Leader',36,'{}','{}'),
  ('offmechanic',4,'boss','Boss',48,'{}','{}'),
  ('offtaxi',0,'recrue','Recruit',12,'{}','{}'),
  ('offtaxi',1,'novice','Novice',24,'{}','{}'),
  ('offtaxi',2,'experimente','Expert',36,'{}','{}'),
  ('offtaxi',3,'uber','Uber',36,'{}','{}'),
  ('offtaxi',4,'boss','Boss',48,'{}','{}')
;
