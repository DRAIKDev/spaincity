
CREATE TABLE IF NOT EXISTS `vip` (
  `identifier` varchar(50) collate utf8_bin NOT NULL,
  `rango` varchar(50) collate utf8_bin NOT NULL,
  `admin` varchar(50) collate utf8_bin NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  PRIMARY KEY  (`identifier`,`desde`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


