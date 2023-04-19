-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for diaz
DROP DATABASE IF EXISTS `diaz`;
CREATE DATABASE IF NOT EXISTS `diaz` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `diaz`;


-- Dumping structure for table diaz.ancestor
DROP TABLE IF EXISTS `ancestor`;
CREATE TABLE IF NOT EXISTS `ancestor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ancestorname` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ancestorname` (`ancestorname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.ancestor: ~3 rows (approximately)
/*!40000 ALTER TABLE `ancestor` DISABLE KEYS */;
INSERT INTO `ancestor` (`id`, `ancestorname`, `country`, `details`) VALUES
	(6, 'Diaz Sifontes', '11', 'First Family to Settle here'),
	(7, 'Diaz Sifontes1', '14', 'First Family to Settle here'),
	(8, 'Diaz Three', '13', 'First Family to Settle here');
/*!40000 ALTER TABLE `ancestor` ENABLE KEYS */;


-- Dumping structure for table diaz.contactus
DROP TABLE IF EXISTS `contactus`;
CREATE TABLE IF NOT EXISTS `contactus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `yourname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `response` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.contactus: ~0 rows (approximately)
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;


-- Dumping structure for table diaz.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(255) NOT NULL,
  `countrycode` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countryname` (`countryname`),
  UNIQUE KEY `countrycode` (`countrycode`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.country: ~5 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id`, `countryname`, `countrycode`) VALUES
	(11, 'USA', 1),
	(12, 'Sweden', 2),
	(13, 'Venezuala', 3),
	(14, 'Britain', 4),
	(15, 'Italy', 5);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


-- Dumping structure for table diaz.family
DROP TABLE IF EXISTS `family`;
CREATE TABLE IF NOT EXISTS `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familyname` varchar(255) NOT NULL,
  `ancestor` varchar(25) NOT NULL,
  `location` varchar(255) NOT NULL,
  `user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `familyname` (`familyname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.family: ~0 rows (approximately)
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
/*!40000 ALTER TABLE `family` ENABLE KEYS */;


-- Dumping structure for table diaz.familyproperty
DROP TABLE IF EXISTS `familyproperty`;
CREATE TABLE IF NOT EXISTS `familyproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `family` varchar(255) NOT NULL,
  `property` varchar(255) NOT NULL,
  `unitsallocated` bigint(20) NOT NULL,
  `allocatedas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.familyproperty: ~0 rows (approximately)
/*!40000 ALTER TABLE `familyproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `familyproperty` ENABLE KEYS */;


-- Dumping structure for table diaz.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `inrelationto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupname` (`groupname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.groups: ~6 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `groupname`, `details`, `inrelationto`) VALUES
	(6, 'Son', 'Male Child', 'Father'),
	(7, 'Daughter', 'Female Child', 'Father'),
	(8, 'Sister', 'Female Sibling', 'Sibings'),
	(9, 'Brother', 'Male Sibling', 'Sibings'),
	(10, 'Grand Father', 'Male Father of my Father', 'Grand Child'),
	(11, 'Grand Mother', 'Female Parent of my Father or Mother', 'Grand Child');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


-- Dumping structure for table diaz.heritage
DROP TABLE IF EXISTS `heritage`;
CREATE TABLE IF NOT EXISTS `heritage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expense` varchar(255) NOT NULL,
  `property` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `value` double(10,2) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense` (`expense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.heritage: ~0 rows (approximately)
/*!40000 ALTER TABLE `heritage` DISABLE KEYS */;
/*!40000 ALTER TABLE `heritage` ENABLE KEYS */;


-- Dumping structure for table diaz.member
DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `groups` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `yearofbirth` year(4) NOT NULL,
  `family` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.member: ~0 rows (approximately)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- Dumping structure for table diaz.projects
DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `lifetime` varchar(255) DEFAULT NULL,
  `cost` double(10,2) NOT NULL,
  `details` text DEFAULT NULL,
  `status` varchar(255) DEFAULT 'In Progress',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectname` (`projectname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.projects: ~0 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;


-- Dumping structure for table diaz.property
DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `propertyno` bigint(20) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `units` bigint(20) NOT NULL,
  `initialvalue` double(10,2) NOT NULL,
  `sellingperunit` double(10,2) NOT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `unitsdefination` varchar(255) DEFAULT NULL,
  `family` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `propertyno` (`propertyno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.property: ~0 rows (approximately)
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
/*!40000 ALTER TABLE `property` ENABLE KEYS */;


-- Dumping structure for table diaz.trials
DROP TABLE IF EXISTS `trials`;
CREATE TABLE IF NOT EXISTS `trials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trials` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `trials` (`trials`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.trials: ~0 rows (approximately)
/*!40000 ALTER TABLE `trials` DISABLE KEYS */;
/*!40000 ALTER TABLE `trials` ENABLE KEYS */;


-- Dumping structure for table diaz.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `loggedas` enum('Member','Admin') NOT NULL DEFAULT 'Member',
  `ancestor` varchar(255) DEFAULT NULL,
  `ancestorrelation` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table diaz.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
