-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para spaincityroleplay
CREATE DATABASE IF NOT EXISTS `spaincityroleplay` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `spaincityroleplay`;

-- Volcando estructura para tabla spaincityroleplay.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=304129 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=13048 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.aircrafts
CREATE TABLE IF NOT EXISTS `aircrafts` (
  `name` varchar(60) COLLATE utf8mb3_spanish_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb3_spanish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.aircraft_categories
CREATE TABLE IF NOT EXISTS `aircraft_categories` (
  `name` varchar(60) COLLATE utf8mb3_spanish_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.baninfo
CREATE TABLE IF NOT EXISTS `baninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tokens`)),
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.banlist
CREATE TABLE IF NOT EXISTS `banlist` (
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tokens`)),
  `sourceplayername` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '1598802477',
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '1598802477',
  `permanent` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.banlisthistory
CREATE TABLE IF NOT EXISTS `banlisthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` text COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` text COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2589 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `server_id` varchar(0) DEFAULT NULL,
  `base` varchar(0) DEFAULT NULL,
  `mask` varchar(0) DEFAULT NULL,
  `name` varchar(0) DEFAULT NULL,
  `hash` varchar(0) DEFAULT NULL,
  `reason` varchar(0) DEFAULT NULL,
  `start` varchar(0) DEFAULT NULL,
  `duration` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.bansperm
CREATE TABLE IF NOT EXISTS `bansperm` (
  `id` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `steam` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `fecha` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `admin` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `razon` varchar(400) CHARACTER SET utf8mb4 NOT NULL,
  `baneado` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `panel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45586 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.cardealervanilla_vehicles
CREATE TABLE IF NOT EXISTS `cardealervanilla_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.category_tiendaveh
CREATE TABLE IF NOT EXISTS `category_tiendaveh` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.channels
CREATE TABLE IF NOT EXISTS `channels` (
  `server_id` tinyint(4) DEFAULT NULL,
  `channel_id` tinyint(4) DEFAULT NULL,
  `parent_id` varchar(0) DEFAULT NULL,
  `name` varchar(4) DEFAULT NULL,
  `inheritacl` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.channel_info
CREATE TABLE IF NOT EXISTS `channel_info` (
  `server_id` varchar(0) DEFAULT NULL,
  `channel_id` varchar(0) DEFAULT NULL,
  `key` varchar(0) DEFAULT NULL,
  `value` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.channel_links
CREATE TABLE IF NOT EXISTS `channel_links` (
  `server_id` varchar(0) DEFAULT NULL,
  `channel_id` varchar(0) DEFAULT NULL,
  `link_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=24107 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.characters_storages
CREATE TABLE IF NOT EXISTS `characters_storages` (
  `storageId` varchar(255) NOT NULL,
  `storageData` longtext NOT NULL,
  PRIMARY KEY (`storageId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.communityservice
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `actions_remaining` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  KEY `index_datastore_name` (`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.dk_vender
CREATE TABLE IF NOT EXISTS `dk_vender` (
  `seller` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `buyer` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '',
  `car` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `hour` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.favoriteanimation
CREATE TABLE IF NOT EXISTS `favoriteanimation` (
  `identifier` varchar(60) NOT NULL,
  `lib` varchar(255) DEFAULT 'mini@strip_club@idles@bouncer@base',
  `animation` varchar(255) DEFAULT 'base',
  `scenario` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.favoriteattitude
CREATE TABLE IF NOT EXISTS `favoriteattitude` (
  `identifier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.instagram_account
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) COLLATE armscii8_bin NOT NULL,
  `data` text COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.insta_stories
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.jail
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `jail_time` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `mafia` varchar(50) DEFAULT 'no',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111224 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.outfits
CREATE TABLE IF NOT EXISTS `outfits` (
  `idSteam` varchar(255) NOT NULL,
  `dad` int(11) NOT NULL DEFAULT 0,
  `mum` int(11) NOT NULL DEFAULT 0,
  `dadmumpercent` int(11) NOT NULL DEFAULT 0,
  `skinton` int(11) NOT NULL DEFAULT 0,
  `eyecolor` int(11) NOT NULL DEFAULT 0,
  `acne` int(11) NOT NULL DEFAULT 0,
  `skinproblem` int(11) NOT NULL DEFAULT 0,
  `freckle` int(11) NOT NULL DEFAULT 0,
  `wrinkle` int(11) NOT NULL DEFAULT 0,
  `wrinkleopacity` int(11) NOT NULL DEFAULT 0,
  `eyebrow` int(11) NOT NULL DEFAULT 0,
  `eyebrowopacity` int(11) NOT NULL DEFAULT 0,
  `beard` int(11) NOT NULL DEFAULT 0,
  `beardopacity` int(11) NOT NULL DEFAULT 0,
  `beardcolor` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hairtext` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL DEFAULT 0,
  `torsotext` int(11) NOT NULL DEFAULT 0,
  `leg` int(11) NOT NULL DEFAULT 0,
  `legtext` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoestext` int(11) NOT NULL DEFAULT 0,
  `accessory` int(11) NOT NULL DEFAULT 0,
  `accessorytext` int(11) NOT NULL DEFAULT 0,
  `undershirt` int(11) NOT NULL DEFAULT 0,
  `undershirttext` int(11) NOT NULL DEFAULT 0,
  `torso2` int(11) NOT NULL DEFAULT 0,
  `torso2text` int(11) NOT NULL DEFAULT 0,
  `prop_hat` int(11) NOT NULL DEFAULT 0,
  `prop_hat_text` int(11) NOT NULL DEFAULT 0,
  `prop_glasses` int(11) NOT NULL DEFAULT 0,
  `prop_glasses_text` int(11) NOT NULL DEFAULT 0,
  `prop_earrings` int(11) NOT NULL DEFAULT 0,
  `prop_earrings_text` int(11) NOT NULL DEFAULT 0,
  `prop_watches` int(11) NOT NULL DEFAULT 0,
  `prop_watches_text` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.owned_aircrafts
CREATE TABLE IF NOT EXISTS `owned_aircrafts` (
  `owner` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb3_spanish_ci NOT NULL,
  `vehicle` longtext COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `damages` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '{}',
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `garage` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'square',
  `job` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.owned_boats
CREATE TABLE IF NOT EXISTS `owned_boats` (
  `owner` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb3_spanish_ci NOT NULL,
  `vehicle` longtext COLLATE utf8mb3_spanish_ci NOT NULL,
  `damages` varchar(250) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '{}',
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `garage` varchar(225) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'square',
  `type` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'boat',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `job` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19099 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `vehicleimage` longtext DEFAULT NULL,
  `bolo` tinyint(1) DEFAULT NULL,
  `bolo_reason` longtext DEFAULT NULL,
  `bolo_officer` varchar(30) DEFAULT NULL,
  `damages` varchar(255) NOT NULL DEFAULT '{}',
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `garage` varchar(255) NOT NULL DEFAULT 'square',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tunerdata` longtext DEFAULT NULL,
  `lasthouse` int(11) DEFAULT 0,
  `storedhouse` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.owned_vehicles_mechanic
CREATE TABLE IF NOT EXISTS `owned_vehicles_mechanic` (
  `owner` varchar(22) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `vehicleimage` longtext DEFAULT NULL,
  `bolo` tinyint(1) DEFAULT NULL,
  `bolo_reason` longtext DEFAULT NULL,
  `bolo_officer` varchar(30) DEFAULT NULL,
  `damages` varchar(255) NOT NULL DEFAULT '{}',
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `garage` varchar(255) NOT NULL DEFAULT 'square',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tunerdata` longtext DEFAULT NULL,
  `lasthouse` int(11) DEFAULT 0,
  `storedhouse` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35617 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_actividad
CREATE TABLE IF NOT EXISTS `panel_actividad` (
  `Admin` varchar(1000) DEFAULT NULL,
  `Accion` varchar(1000) DEFAULT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_anuncio
CREATE TABLE IF NOT EXISTS `panel_anuncio` (
  `Nombre` varchar(500) DEFAULT NULL,
  `Rango` varchar(500) DEFAULT NULL,
  `Texto` varchar(10000) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_donadores
CREATE TABLE IF NOT EXISTS `panel_donadores` (
  `Nombre` varchar(50) DEFAULT NULL,
  `Pack` varchar(50) DEFAULT NULL,
  `Steamid` varchar(50) DEFAULT NULL,
  `Fecha` varchar(50) DEFAULT NULL,
  `Finalizacion` varchar(50) DEFAULT NULL,
  `Recibido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_mensajes
CREATE TABLE IF NOT EXISTS `panel_mensajes` (
  `Remitente` varchar(1000) DEFAULT NULL,
  `Receptor` varchar(1000) DEFAULT NULL,
  `Mensaje` varchar(1000) DEFAULT NULL,
  `Estado` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_negros
CREATE TABLE IF NOT EXISTS `panel_negros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` text CHARACTER SET utf8mb3 DEFAULT NULL,
  `inicio` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `final` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tiempo` longtext CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_opos_staff
CREATE TABLE IF NOT EXISTS `panel_opos_staff` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Discord` varchar(1000) DEFAULT NULL,
  `Steam` varchar(1000) DEFAULT NULL,
  `NombreIG` varchar(1000) DEFAULT NULL,
  `NombreOOC` varchar(1000) DEFAULT NULL,
  `EdadOOC` varchar(1000) DEFAULT NULL,
  `Disponibilidadhoras` varchar(1000) DEFAULT NULL,
  `Hasidoadmin` varchar(1000) DEFAULT NULL,
  `Pais` varchar(1000) DEFAULT NULL,
  `Unpocosobremi` varchar(1000) DEFAULT NULL,
  `Quetegustariahacer` varchar(1000) DEFAULT NULL,
  `Porqueelgirael` varchar(1000) DEFAULT NULL,
  `IP` varchar(1000) DEFAULT NULL,
  `Estado` varchar(1000) DEFAULT 'Pendiente',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_servers
CREATE TABLE IF NOT EXISTS `panel_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET latin1 NOT NULL,
  `ip` text CHARACTER SET latin1 NOT NULL,
  `puerto` int(11) NOT NULL,
  `rcon` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_tickets
CREATE TABLE IF NOT EXISTS `panel_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff` text CHARACTER SET utf8mb3 NOT NULL,
  `usuario` text CHARACTER SET utf8mb3 NOT NULL,
  `steamid` text CHARACTER SET utf8mb3 DEFAULT NULL,
  `licencia` text CHARACTER SET utf8mb3 NOT NULL,
  `razon` longtext CHARACTER SET utf8mb3 NOT NULL,
  `comentarios` longtext CHARACTER SET utf8mb3 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `tiempo` varchar(17) CHARACTER SET utf8mb3 NOT NULL DEFAULT 'Tiempo indefinido',
  `tipo` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `staff2` text CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54955 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_users
CREATE TABLE IF NOT EXISTS `panel_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USUARIO` longtext CHARACTER SET latin1 NOT NULL,
  `PASS` longtext CHARACTER SET latin1 NOT NULL,
  `STEAMID` longtext CHARACTER SET latin1 DEFAULT NULL,
  `LICENCIA` longtext CHARACTER SET latin1 DEFAULT NULL,
  `RANGO` text CHARACTER SET latin1 NOT NULL,
  `lvRANGO` int(11) NOT NULL DEFAULT 2,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT 0,
  `tiempo` longtext CHARACTER SET latin1 DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `sesionA` text CHARACTER SET latin1 DEFAULT NULL,
  `LastIP` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ModoOscuro` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10000484 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.panel_vips
CREATE TABLE IF NOT EXISTS `panel_vips` (
  `IP` varchar(500) DEFAULT NULL,
  `Estado` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_accounts
CREATE TABLE IF NOT EXISTS `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_alertjobs
CREATE TABLE IF NOT EXISTS `phone_alertjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `alerts` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_app_chat2
CREATE TABLE IF NOT EXISTS `phone_app_chat2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1358 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_calls2
CREATE TABLE IF NOT EXISTS `phone_calls2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128027 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(50) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT NULL,
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_masked` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1802 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_messages2
CREATE TABLE IF NOT EXISTS `phone_messages2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_notifies
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7229 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.phone_users_contacts2
CREATE TABLE IF NOT EXISTS `phone_users_contacts2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24817 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3679 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1298 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.player_notes
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.rented_aircrafts
CREATE TABLE IF NOT EXISTS `rented_aircrafts` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.renzu_customs
CREATE TABLE IF NOT EXISTS `renzu_customs` (
  `shop` varchar(64) NOT NULL DEFAULT '[]',
  `inventory` longtext DEFAULT '[]',
  PRIMARY KEY (`shop`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.saving_accounts
CREATE TABLE IF NOT EXISTS `saving_accounts` (
  `id` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.sociosgym
CREATE TABLE IF NOT EXISTS `sociosgym` (
  `identifier` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `vendedor` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `hasta` int(11) NOT NULL,
  PRIMARY KEY (`identifier`,`hasta`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tinder_accounts
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tinder_likes
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(10000) DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tm1_enclosures
CREATE TABLE IF NOT EXISTS `tm1_enclosures` (
  `enclosure_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `groupid` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tm1_groups
CREATE TABLE IF NOT EXISTS `tm1_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `aprove` int(11) DEFAULT 0,
  `money` int(11) DEFAULT 0,
  `armarios` int(11) DEFAULT 0,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tm1_membersgroups
CREATE TABLE IF NOT EXISTS `tm1_membersgroups` (
  `groupid` int(11) DEFAULT 0,
  `identifier` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.tm1_plants
CREATE TABLE IF NOT EXISTS `tm1_plants` (
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `finalobject` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.truck_inventory
CREATE TABLE IF NOT EXISTS `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) NOT NULL,
  `itemt` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owned` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=93136 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_account
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_accounts2
CREATE TABLE IF NOT EXISTS `twitter_accounts2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_hashtags
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_likes2
CREATE TABLE IF NOT EXISTS `twitter_likes2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`)
) ENGINE=InnoDB AUTO_INCREMENT=5654 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_mentions
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.twitter_tweets2
CREATE TABLE IF NOT EXISTS `twitter_tweets2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=5634 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT 'user',
  `permission_level` int(1) DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `tutorial` int(11) DEFAULT 0,
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT '{"heading":0.0,"x":-268.78,"y":-956.9,"z":31.22}',
  `is_dead` tinyint(1) NOT NULL DEFAULT 0,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `timeplayed` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `carcel` int(11) NOT NULL DEFAULT 0,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `house` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `bought_furniture` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_house` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `lastPosition` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mafia` varchar(50) COLLATE utf8mb4_bin DEFAULT 'no',
  `animations` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `skills` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `pet` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `pin` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `apps` text COLLATE utf8mb4_bin DEFAULT NULL,
  `widget` text COLLATE utf8mb4_bin DEFAULT NULL,
  `bt` text COLLATE utf8mb4_bin DEFAULT NULL,
  `charinfo` text COLLATE utf8mb4_bin DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `cryptocurrency` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `cryptocurrencytransfers` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`),
  KEY `license` (`license`),
  KEY `group` (`group`),
  KEY `job` (`job`),
  KEY `tutorial` (`tutorial`),
  KEY `job_grade` (`job_grade`),
  KEY `is_dead` (`is_dead`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `dateofbirth` (`dateofbirth`),
  KEY `sex` (`sex`),
  KEY `height` (`height`),
  KEY `carcel` (`carcel`),
  KEY `jail` (`jail_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17205 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehicles2
CREATE TABLE IF NOT EXISTS `vehicles2` (
  `name` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehiclesvanilla
CREATE TABLE IF NOT EXISTS `vehiclesvanilla` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehicles_for_sale
CREATE TABLE IF NOT EXISTS `vehicles_for_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) NOT NULL,
  `vehicleProps` longtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehiclevanilla_categories
CREATE TABLE IF NOT EXISTS `vehiclevanilla_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vehicle_categories2
CREATE TABLE IF NOT EXISTS `vehicle_categories2` (
  `name` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.vip
CREATE TABLE IF NOT EXISTS `vip` (
  `identifier` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `rango` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `admin` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  PRIMARY KEY (`identifier`,`desde`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.weashops2
CREATE TABLE IF NOT EXISTS `weashops2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.whatsapp_accounts
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.whatsapp_chats
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1040 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.whatsapp_groups
CREATE TABLE IF NOT EXISTS `whatsapp_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.whatsapp_groups_messages
CREATE TABLE IF NOT EXISTS `whatsapp_groups_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.whatsapp_groups_users
CREATE TABLE IF NOT EXISTS `whatsapp_groups_users` (
  `number_group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.whatsapp_stories
CREATE TABLE IF NOT EXISTS `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla spaincityroleplay.yellowpages_posts
CREATE TABLE IF NOT EXISTS `yellowpages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text NOT NULL,
  `mesaj` text NOT NULL,
  `isim` text NOT NULL,
  `telno` text NOT NULL,
  `resim` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
