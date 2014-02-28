-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.8 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para natacion
DROP DATABASE IF EXISTS `natacion`;
CREATE DATABASE IF NOT EXISTS `natacion` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `natacion`;


-- Volcando estructura para tabla natacion.grupo
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `cod_gru` varchar(10) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_gru`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla natacion.grupo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
REPLACE INTO `grupo` (`cod_gru`, `capacidad`, `nivel`) VALUES
	('G1', 10, 'Inicial'),
	('G2', 15, 'Medio'),
	('G3', 15, 'Alto');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


-- Volcando estructura para tabla natacion.monitor
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE IF NOT EXISTS `monitor` (
  `numero` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `formacion` varchar(50) NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla natacion.monitor: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `monitor` DISABLE KEYS */;
REPLACE INTO `monitor` (`numero`, `nombre`, `formacion`) VALUES
	(1, 'Alfonso Peris', 'Monitor-T1'),
	(2, 'Maria Llopis', 'Monitor-T2'),
	(3, 'Juan Cruz', 'Monitor-T1'),
	(4, 'Pedro Rius', 'Socorrista');
/*!40000 ALTER TABLE `monitor` ENABLE KEYS */;


-- Volcando estructura para tabla natacion.monitorgrupo
DROP TABLE IF EXISTS `monitorgrupo`;
CREATE TABLE IF NOT EXISTS `monitorgrupo` (
  `cod_gru` varchar(10) NOT NULL DEFAULT '',
  `numero` int(10) NOT NULL,
  `limite` int(10) NOT NULL,
  PRIMARY KEY (`cod_gru`,`numero`),
  KEY `fk1` (`numero`),
  CONSTRAINT `fk1` FOREIGN KEY (`numero`) REFERENCES `monitor` (`numero`) ON DELETE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`cod_gru`) REFERENCES `grupo` (`cod_gru`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla natacion.monitorgrupo: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `monitorgrupo` DISABLE KEYS */;
REPLACE INTO `monitorgrupo` (`cod_gru`, `numero`, `limite`) VALUES
	('G1', 1, 4),
	('G1', 2, 6),
	('G2', 3, 7),
	('G2', 4, 4),
	('G3', 3, 7);
/*!40000 ALTER TABLE `monitorgrupo` ENABLE KEYS */;


-- Volcando estructura para tabla natacion.nino
DROP TABLE IF EXISTS `nino`;
CREATE TABLE IF NOT EXISTS `nino` (
  `codigo` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `cod_gru` varchar(10) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_niño_grupo` (`cod_gru`),
  KEY `FK_niño_monitor` (`numero`),
  CONSTRAINT `FK_niño_grupo` FOREIGN KEY (`cod_gru`) REFERENCES `grupo` (`cod_gru`) ON UPDATE CASCADE,
  CONSTRAINT `FK_niño_monitor` FOREIGN KEY (`numero`) REFERENCES `monitor` (`numero`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla natacion.nino: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `nino` DISABLE KEYS */;
REPLACE INTO `nino` (`codigo`, `nombre`, `edad`, `cod_gru`, `numero`) VALUES
	(1111, 'Juan', 7, 'G1', NULL),
	(2222, 'Luisa', 8, 'G1', NULL),
	(3333, 'Pedro', 8, 'G2', NULL),
	(4444, 'Maria', 8, 'G2', 3),
	(5555, 'Luis', 10, 'G3', 3);
/*!40000 ALTER TABLE `nino` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
