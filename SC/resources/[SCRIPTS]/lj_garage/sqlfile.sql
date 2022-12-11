ALTER TABLE owned_vehicles ADD COLUMN damages varchar(255) NOT NULL DEFAULT '{}';
ALTER TABLE owned_vehicles ADD state BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE owned_vehicles ADD COLUMN garage VARCHAR(255) NOT NULL DEFAULT 'square';
ALTER TABLE owned_vehicles ADD COLUMN job varchar(20) NOT NULL DEFAULT '';