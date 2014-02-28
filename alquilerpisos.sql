-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.29 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             7.0.0.4381
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para alquilerpisos
CREATE DATABASE IF NOT EXISTS `alquilerpisos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `alquilerpisos`;


-- Volcando estructura para tabla alquilerpisos.alquiler
CREATE TABLE IF NOT EXISTS `alquiler` (
  `codAlquiler` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Vivienda_codVivienda` int(10) unsigned NOT NULL,
  `Alquiler_Vivienda_codVivienda` int(10) unsigned NOT NULL,
  `Alquiler_codAlquiler` int(10) unsigned NOT NULL,
  `Fechainicio` date DEFAULT NULL,
  `Fechafin` date DEFAULT NULL,
  `Fianza` int(10) unsigned DEFAULT NULL,
  `Fechafirma` date DEFAULT NULL,
  `Importe_mensual` int(10) unsigned DEFAULT NULL,
  `Duracion` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codAlquiler`,`Vivienda_codVivienda`),
  KEY `Alquiler_FKIndex1` (`Vivienda_codVivienda`),
  KEY `Alquiler_FKIndex2` (`Alquiler_codAlquiler`,`Alquiler_Vivienda_codVivienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='piso en oferta';

-- Volcando datos para la tabla alquilerpisos.alquiler: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;


-- Volcando estructura para tabla alquilerpisos.inmobiliaria
CREATE TABLE IF NOT EXISTS `inmobiliaria` (
  `Codigoagencia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Vivienda_codVivienda` int(10) unsigned NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `CIF` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Codigoagencia`,`Vivienda_codVivienda`),
  KEY `Inmobiliaria_FKIndex2` (`Vivienda_codVivienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='la mas efectiva';

-- Volcando datos para la tabla alquilerpisos.inmobiliaria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inmobiliaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmobiliaria` ENABLE KEYS */;


-- Volcando estructura para tabla alquilerpisos.inquilino
CREATE TABLE IF NOT EXISTS `inquilino` (
  `Nif` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Alquiler_Vivienda_codVivienda` int(10) unsigned NOT NULL,
  `Alquiler_codAlquiler` int(10) unsigned NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Descripcion_preferencias` varchar(50) DEFAULT NULL,
  `Telefono_contacto` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Nif`),
  KEY `Inquilino_FKIndex2` (`Alquiler_codAlquiler`,`Alquiler_Vivienda_codVivienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='que paguen';

-- Volcando datos para la tabla alquilerpisos.inquilino: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inquilino` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquilino` ENABLE KEYS */;


-- Volcando estructura para tabla alquilerpisos.propietario
CREATE TABLE IF NOT EXISTS `propietario` (
  `nif` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Vivienda_codVivienda` int(10) unsigned NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Telefono` int(10) unsigned DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nif`,`Vivienda_codVivienda`),
  KEY `Propietario_FKIndex1` (`Vivienda_codVivienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilerpisos.propietario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;


-- Volcando estructura para tabla alquilerpisos.vivienda
CREATE TABLE IF NOT EXISTS `vivienda` (
  `codVivienda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Calle` varchar(50) NOT NULL,
  `Numero` int(10) unsigned DEFAULT NULL,
  `Piso` int(10) unsigned DEFAULT NULL,
  `CP` int(10) unsigned DEFAULT NULL,
  `Poblacion` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codVivienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilerpisos.vivienda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vivienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `vivienda` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
