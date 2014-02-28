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

-- Volcando estructura para tabla competiciones_navales.barco
drop database if exists competiciones_navales;

create database competiciones_navales;

use competiciones_navales;

DROP TABLE IF EXISTS `barco`;
CREATE TABLE IF NOT EXISTS `barco` (
  `bcod` varchar(10),
  `nombre` varchar(30) not null,
  `peso` int(11),
  `nºpartes` int(11),
  PRIMARY KEY (`bcod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla competiciones_navales.barco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `barco` DISABLE KEYS */;
/*!40000 ALTER TABLE `barco` ENABLE KEYS */;


-- Volcando estructura para tabla competiciones_navales.competicion
DROP TABLE IF EXISTS `competicion`;
CREATE TABLE IF NOT EXISTS `competicion` (
  `ccod` varchar(10),
  `anyo` year(4) ,
  `nombre` varchar(50) not NULL,
  `premio` int(11) ,
  PRIMARY KEY (`ccod`,`anyo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla competiciones_navales.competicion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `competicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `competicion` ENABLE KEYS */;


-- Volcando estructura para tabla competiciones_navales.participa
DROP TABLE IF EXISTS `participa`;
CREATE TABLE IF NOT EXISTS `participa` (
  `bcod` varchar(10),
  `rcod` varchar(10) ,
  `puntuacion` int(11) ,
  PRIMARY KEY (`bcod`,`rcod`),
  KEY `FK_participa_regata` (`rcod`),
  CONSTRAINT `FK_participa_regata` FOREIGN KEY (`rcod`) REFERENCES `regata` (`rcod`),
  CONSTRAINT `FK_participa_barco` FOREIGN KEY (`bcod`) REFERENCES `barco` (`bcod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla competiciones_navales.participa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;


-- Volcando estructura para tabla competiciones_navales.regata
DROP TABLE IF EXISTS `regata`;
CREATE TABLE IF NOT EXISTS `regata` (
  `rcod` varchar(10),
  `ccod` varchar(10) not NULL,
  `anyo` year(4) not NULL,
  `lugar` varchar(20) ,
  `distancia` float ,
  `ganador` varchar(10),
  PRIMARY KEY (`rcod`),
  KEY `FK_regata_competicion` (`ccod`,`anyo`),
  CONSTRAINT `FK_regata_competicion` FOREIGN KEY (`ccod`, `anyo`) REFERENCES `competicion` (`ccod`, `anyo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla competiciones_navales.regata: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `regata` DISABLE KEYS */;
/*!40000 ALTER TABLE `regata` ENABLE KEYS */;


-- Volcando estructura para tabla competiciones_navales.tripulante
DROP TABLE IF EXISTS `tripulante`;
CREATE TABLE IF NOT EXISTS `tripulante` (
  `tcod` varchar(10) NOT NULL,
  `nombre` varchar(50) not NULL,
  `funcion` varchar(20),
  `fecha` date not NULL,
  `bcod` varchar(20),
  PRIMARY KEY (`tcod`),
  KEY `FK__barco` (`bcod`),
  CONSTRAINT `FK__barco` FOREIGN KEY (`bcod`) REFERENCES `barco` (`bcod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into barco values('SUI90','Alinghi',2580,0);
insert into barco values('USA98','BMW Oracle',2601,1);
insert into barco values('NZL92','New Zealand',2602,1);
insert into barco values('ESP97','Desafio Español',2490,2);

insert into competicion values('CLV',2003,'Copa Louis Vuitton',9);
insert into competicion values('CA',2003,'Americas Çup',45);
insert into competicion values('CA',2007,'Americas Cup',50);
insert into competicion values('CLV',2007,'Copa Louis Vuitton',10);

insert into participa values('NZL92','002',2);
insert into participa values('ESP97','002',0);
insert into participa values('USA98','003',0);
insert into participa values('ESP97','003',2);

insert into regata values('001','CA',2007,'Valencia',null,null);
insert into regata values('002','CLV',2007,'Valencia',12.6,'NZL92');
insert into regata values('003','CLV',2007,'Valencia',12.6,'ESP97');

insert into tripulante values('FIP','INSA PASTOR,FRANCISCO JOSE','Caña','2000/03/31','ESP97');
insert into tripulante values('MIP','MOLINOS IBAÑEZ,LOURDES','Navegante','1999-08-04','ESP97');
insert into tripulante values('GJR','JARA-RON,GUILLAUME','Caña','2003-03-31','NZL92');
insert into tripulante values('BRB','BRUTTERWOTH BRAD','Patron','2000-06-06','SUI90');
insert into tripulante values('CHD','DICKSON,CHRIS','Patron','2002-03-03','USA98');
insert into tripulante values('MTK','KOSONEN,TOMI MARKUS',NULL,'2000-09-17',NULL);


-- Volcando datos para la tabla competiciones_navales.tripulante: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tripulante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tripulante` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
