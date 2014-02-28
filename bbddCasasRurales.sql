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

-- Volcando estructura de base de datos para casasrurales
DROP DATABASE IF EXISTS `casasrurales`;
CREATE DATABASE IF NOT EXISTS `casasrurales` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `casasrurales`;


-- Volcando estructura para vista casasrurales.buenos_clientes
DROP VIEW IF EXISTS `buenos_clientes`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `buenos_clientes` (
	`dni` VARCHAR(9) NOT NULL COLLATE 'latin1_swedish_ci',
	`nombre` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para tabla casasrurales.casa_rural
DROP TABLE IF EXISTS `casa_rural`;
CREATE TABLE IF NOT EXISTS `casa_rural` (
  `cod_cas` char(2) NOT NULL,
  `habitaciones` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cod_pob` int(11) NOT NULL,
  `nota_media` float DEFAULT NULL,
  PRIMARY KEY (`cod_cas`),
  KEY `fk10` (`cod_pob`),
  CONSTRAINT `fk10` FOREIGN KEY (`cod_pob`) REFERENCES `poblacion` (`cod_pob`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla casasrurales.casa_rural: ~4 rows (aproximadamente)
DELETE FROM `casa_rural`;
/*!40000 ALTER TABLE `casa_rural` DISABLE KEYS */;
INSERT INTO `casa_rural` (`cod_cas`, `habitaciones`, `precio`, `cod_pob`, `nota_media`) VALUES
	('c1', 5, 180, 16, 6),
	('c2', 4, 100, 16, 10),
	('c3', 2, 60, 45, 8),
	('c4', 8, 250, 10, NULL);
/*!40000 ALTER TABLE `casa_rural` ENABLE KEYS */;


-- Volcando estructura para tabla casasrurales.ha_estado
DROP TABLE IF EXISTS `ha_estado`;
CREATE TABLE IF NOT EXISTS `ha_estado` (
  `cod_cas` char(2) NOT NULL DEFAULT '',
  `dni` varchar(9) NOT NULL DEFAULT '',
  `veces` int(11) NOT NULL,
  PRIMARY KEY (`cod_cas`,`dni`),
  KEY `fk3` (`dni`),
  CONSTRAINT `fk3` FOREIGN KEY (`dni`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk4` FOREIGN KEY (`cod_cas`) REFERENCES `casa_rural` (`cod_cas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla casasrurales.ha_estado: ~7 rows (aproximadamente)
DELETE FROM `ha_estado`;
/*!40000 ALTER TABLE `ha_estado` DISABLE KEYS */;
INSERT INTO `ha_estado` (`cod_cas`, `dni`, `veces`) VALUES
	('c1', '1', 1),
	('c1', '2', 1),
	('c2', '1', 4),
	('c2', '2', 4),
	('c3', '1', 2),
	('c3', '3', 1),
	('c4', '1', 1);
/*!40000 ALTER TABLE `ha_estado` ENABLE KEYS */;


-- Volcando estructura para tabla casasrurales.opinion
DROP TABLE IF EXISTS `opinion`;
CREATE TABLE IF NOT EXISTS `opinion` (
  `num` int(11) NOT NULL,
  `nota` float NOT NULL,
  `cod_cas` char(2) NOT NULL,
  `dni` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `fk5` (`cod_cas`,`dni`),
  CONSTRAINT `fk5` FOREIGN KEY (`cod_cas`, `dni`) REFERENCES `ha_estado` (`cod_cas`, `dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla casasrurales.opinion: ~6 rows (aproximadamente)
DELETE FROM `opinion`;
/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
INSERT INTO `opinion` (`num`, `nota`, `cod_cas`, `dni`) VALUES
	(1, 6, 'c1', '1'),
	(2, 7, 'c1', NULL),
	(3, 5, 'c1', NULL),
	(4, 10, 'c2', '1'),
	(5, 10, 'c2', '2'),
	(6, 8, 'c3', NULL);
/*!40000 ALTER TABLE `opinion` ENABLE KEYS */;


-- Volcando estructura para tabla casasrurales.poblacion
DROP TABLE IF EXISTS `poblacion`;
CREATE TABLE IF NOT EXISTS `poblacion` (
  `cod_pob` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `habitantes` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_pob`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla casasrurales.poblacion: ~4 rows (aproximadamente)
DELETE FROM `poblacion`;
/*!40000 ALTER TABLE `poblacion` DISABLE KEYS */;
INSERT INTO `poblacion` (`cod_pob`, `nombre`, `habitantes`) VALUES
	(10, 'Cáceres', 82000),
	(16, 'Cuenca', 46000),
	(44, 'Teruel', 32000),
	(45, 'Toledo', 68000);
/*!40000 ALTER TABLE `poblacion` ENABLE KEYS */;


-- Volcando estructura para tabla casasrurales.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `cod_pob` int(11) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla casasrurales.usuario: ~3 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`dni`, `nombre`, `edad`, `cod_pob`) VALUES
	('1', 'Luisa', 48, 44),
	('2', 'Maria', 21, 45),
	('3', 'Juan', 32, 45);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Volcando estructura para vista casasrurales.usuariosmayores
DROP VIEW IF EXISTS `usuariosmayores`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `usuariosmayores` (
	`dni` VARCHAR(9) NOT NULL COLLATE 'latin1_swedish_ci',
	`nombre` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`edad` INT(11) NULL,
	`cod_pob` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista casasrurales.buenos_clientes
DROP VIEW IF EXISTS `buenos_clientes`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `buenos_clientes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`seguro`@`localhost` VIEW `casasrurales`.`buenos_clientes` AS SELECT u.dni,u.nombre
FROM usuario u
WHERE u.dni IN (SELECT o.dni FROM opinion o) 
AND NOT EXISTS(SELECT * FROM opinion o where o.dni=u.dni AND
o.nota<5)
WITH CHECK OPTION WITH CASCADED CHECK OPTION;


-- Volcando estructura para vista casasrurales.usuariosmayores
DROP VIEW IF EXISTS `usuariosmayores`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `usuariosmayores`;
CREATE ALGORITHM=UNDEFINED DEFINER=`seguro`@`localhost` VIEW `casasrurales`.`usuariosmayores` AS SELECT u.dni,u.nombre,u.edad,u.cod_pob
FROM usuario u
WHERE u.edad>40
WITH CHECK OPTION WITH CASCADED CHECK OPTION;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
