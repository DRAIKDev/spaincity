CREATE TABLE `favoriteanimation` (
	`identifier` varchar(60) NOT NULL,
	`lib` varchar(255) DEFAULT 'mini@strip_club@idles@bouncer@base',
	`animation` varchar(255) DEFAULT 'base',
	`scenario` BOOLEAN NOT NULL DEFAULT FALSE,

	PRIMARY KEY (`identifier`)
);