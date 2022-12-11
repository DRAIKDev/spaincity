create or replace table `sociosgym` (
	`identifier` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_bin',
	`vendedor` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_bin',
	`hasta` INT(11) NOT NULL,
	PRIMARY KEY (`identifier`, `hasta`) USING BTREE
)

COLLATE='utf8mb3_bin'
ENGINE=MyISAM
;