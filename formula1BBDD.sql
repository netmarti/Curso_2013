-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.11 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-06-10 12:10:57
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for formula1
CREATE DATABASE IF NOT EXISTS `formula1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `formula1`;


-- Dumping structure for table formula1.circuito
CREATE TABLE IF NOT EXISTS `circuito` (
  `codcir` int(11) NOT NULL DEFAULT '0',
  `nomec` varchar(50) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `km` float DEFAULT NULL,
  PRIMARY KEY (`codcir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table formula1.circuito: ~2 rows (approximately)
/*!40000 ALTER TABLE `circuito` DISABLE KEYS */;
INSERT INTO `circuito` (`codcir`, `nomec`, `ciudad`, `km`) VALUES
	(1, 'Albert Park', 'Melbourne', 5.3),
	(2, 'Montmelo', 'Montmelo', 4.6),
	(3, 'Montecarlo', 'Monaco', 3.3);
/*!40000 ALTER TABLE `circuito` ENABLE KEYS */;


-- Dumping structure for table formula1.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `codeq` int(11) NOT NULL DEFAULT '0',
  `nomeq` varchar(50) NOT NULL,
  `pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codeq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table formula1.equipo: ~4 rows (approximately)
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` (`codeq`, `nomeq`, `pais`) VALUES
	(1, 'McLaren', 'Reino Unido'),
	(2, 'Renault', 'Francia'),
	(3, 'Toyota', 'Japon'),
	(4, 'Williams', 'Alemania'),
	(5, 'Ferrari', 'Italia');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;


-- Dumping structure for table formula1.participa
CREATE TABLE IF NOT EXISTS `participa` (
  `año` int(11) NOT NULL DEFAULT '0',
  `codcir` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `puntos` int(11) DEFAULT NULL,
  PRIMARY KEY (`año`,`codcir`,`num`),
  KEY `fk_participa_num` (`num`),
  CONSTRAINT `fk_participa_a??o_codcir` FOREIGN KEY (`año`, `codcir`) REFERENCES `prueba` (`año`, `codcir`),
  CONSTRAINT `fk_participa_num` FOREIGN KEY (`num`) REFERENCES `piloto` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table formula1.participa: ~2 rows (approximately)
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
INSERT INTO `participa` (`año`, `codcir`, `num`, `puntos`) VALUES
	(2005, 1, 1, 10),
	(2005, 1, 2, 8),
	(2005, 2, 1, 8);
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;


-- Dumping structure for table formula1.piloto
CREATE TABLE IF NOT EXISTS `piloto` (
  `num` int(11) NOT NULL DEFAULT '0',
  `nomep` varchar(50) NOT NULL,
  `fecha_n` date DEFAULT NULL,
  `codeq` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_piloto` (`codeq`),
  CONSTRAINT `fk_piloto` FOREIGN KEY (`codeq`) REFERENCES `equipo` (`codeq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table formula1.piloto: ~4 rows (approximately)
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` (`num`, `nomep`, `fecha_n`, `codeq`) VALUES
	(1, 'Fernando Alonso', '1981-07-15', 2),
	(2, 'Kimi Raikonen', '1979-02-13', 1),
	(3, 'Juan Pablo Montoya', '1975-01-12', 1),
	(4, 'Michael Schumaher', '1969-10-02', 5),
	(5, 'Rubens Barrichelo', '1972-08-25', 5);
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;


-- Dumping structure for table formula1.prueba
CREATE TABLE IF NOT EXISTS `prueba` (
  `año` int(11) NOT NULL DEFAULT '0',
  `codcir` int(11) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `num_pilotos` int(11) DEFAULT NULL,
  PRIMARY KEY (`año`,`codcir`),
  KEY `fk_prueba` (`codcir`),
  CONSTRAINT `fk_prueba` FOREIGN KEY (`codcir`) REFERENCES `circuito` (`codcir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table formula1.prueba: ~2 rows (approximately)
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
INSERT INTO `prueba` (`año`, `codcir`, `fecha`, `num_pilotos`) VALUES
	(2004, 2, '2004-05-09', 0),
	(2005, 1, '2005-03-06', 2),
	(2005, 2, '2005-05-08', 1);
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
