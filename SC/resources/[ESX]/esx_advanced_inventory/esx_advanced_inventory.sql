--
-- Structure de la table `item_weight`
--

CREATE TABLE IF NOT EXISTS `item_weight` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `item_weight`
--
ALTER TABLE `item_weight`
 ADD PRIMARY KEY (`id`);


-- Exemple

--INSERT INTO `item_weight` (`id`, `item`, `weight`) VALUES
  (1, 'gazbottle', 'gazbottle', 2000),
  (2, 'fixtool', 'fixtool', 1500),
  (3, 'carotool', 'carotool', 1000),
  (4, 'blowpipe', 'Lockpick', 1200),
  (5, 'fixkit', 'Repairkit', 1500),
  (6, 'carokit', 'Kit carosserie', 1000),
  (7, 'bread', 'Burger', 125),
  (8, 'water', 'Vand', 500),
  (9, 'alive_chicken', 'Kylling', 1000),
  (10, 'slaughtered_chicken', 'Slagted kylling', 800),
  (11, 'packaged_chicken', 'pakket kylling', 600),
  (12, 'fish', 'Fisk', 300),
  (13, 'stone', 'Sten', 500),
  (14, 'washed_stone', 'Vasked sten', 450),
  (15, 'copper', 'kobber', 400),
  (16, 'iron', 'Jern', 450),
  (17, 'gold', 'Guld', 350),
  (18, 'diamond', 'Diamant', 480),
  (19, 'wood', 'Træ', 1000),
  (20, 'cutted_wood', 'udskåret træ', 750),
  (21, 'packaged_plank', 'Pakket træ', 550),
  (22, 'petrol', 'olie', 600),
  (23, 'petrol_raffin', 'Raffineret olie', 500),
  (24, 'essence', 'benzin', 250),
  (25, 'whool', 'uld', 300),
  (26, 'clothe', 'tøj', 200),
  (27, 'fabric', 'væv', 220),
  (28, 'weed', 'Weed', 800),
  (29, 'weed_pooch', 'Plade hash', 650),
  (30, 'coke', 'Coke', 600),
  (31, 'coke_pooch', '1 Gram coke', 500),
  (32, 'meth', 'Meth', 600),
  (33, 'meth_pooch', '1 Gram meth', 500),
  (34, 'opium', 'Opium', 600),
  (35, 'opium_pooch', '1 Gram opium', 500),
  (36, 'permis', 'Permis', 500),
  (37, 'bandage', 'Bandage', 250),
  (38, 'medikit', 'Medikit', 500),
  (39, 'lsd', 'Lsd', 600),
  (40, 'lsd_pooch', 'LSD Piller', 500),
  (41, 'codeine', 'Codeine', 250),
  (42, 'essence', 'Essence', 250),
  (43, 'disolvant', 'opløsningsmiddel maling', 250),
  (44, 'phosphorerouge', 'Rød fosfor GR', 250),
  (45, 'heroine', 'Heroine', 250),
  (46, 'iode', 'Iode', 250),
  (47, 'kroko_pooch', 'Krokodil', 500),
  (48, 'silencieux', 'Silencer', 1000),
  (49, 'flashlight', 'flashlight', 1000),
  (50, 'grip', 'grip', 1000),
  (51, 'yusuf', 'Skin', 500);