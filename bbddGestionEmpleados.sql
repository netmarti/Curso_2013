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

-- Volcando estructura de base de datos para gestionempleados
CREATE DATABASE IF NOT EXISTS `gestionempleados` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_spanish_ci */;
USE `gestionempleados`;


-- Volcando estructura para tabla gestionempleados.departamentos
CREATE TABLE IF NOT EXISTS `departamentos` (
  `num_dept` int(10) NOT NULL,
  `nombre_dept` varchar(50) COLLATE ucs2_spanish_ci DEFAULT NULL,
  `localizacion` varchar(50) COLLATE ucs2_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`num_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish_ci;

-- Volcando datos para la tabla gestionempleados.departamentos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`num_dept`, `nombre_dept`, `localizacion`) VALUES
	(10, 'Contabilidad', 'Nueva York'),
	(20, 'Investigación', 'Dallas'),
	(30, 'Ventas', 'Chicago'),
	(40, 'Operaciones', 'Boston');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;


-- Volcando estructura para tabla gestionempleados.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `numEmp` int(10) NOT NULL,
  `nombreEmp` varchar(50) COLLATE ucs2_spanish_ci NOT NULL,
  `puesto` varchar(50) COLLATE ucs2_spanish_ci NOT NULL,
  `jefe` varchar(50) COLLATE ucs2_spanish_ci NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` float NOT NULL,
  `comision` float NOT NULL,
  `departamento` int(10) NOT NULL,
  PRIMARY KEY (`numEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish_ci;

-- Volcando datos para la tabla gestionempleados.empleados: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`numEmp`, `nombreEmp`, `puesto`, `jefe`, `fecha_contratacion`, `salario`, `comision`, `departamento`) VALUES
	(7369, 'Smith', 'Secretario', '7902', '1980-12-17', 800, 0, 20),
	(7499, 'Allen', 'Vendedor', '7698', '2013-05-08', 1600, 300, 30),
	(7521, 'Ward', 'Vendedor', '7698', '1981-02-22', 1250, 500, 30),
	(7566, 'Jones', 'Gerente', '7839', '0000-00-00', 2975, 0, 20),
	(7654, 'Martin', 'Vendedor', '7698', '1981-09-28', 1250, 1400, 30),
	(7782, 'Clark', 'Gerente', '7839', '1981-06-09', 2450, 0, 10),
	(7788, 'Scott', 'Analista', '7566', '1982-12-09', 3000, 0, 20),
	(7839, 'King', 'Presidente', '', '1981-11-17', 5000, 0, 10),
	(7844, 'Turner', 'Vendedor', '7698', '1981-09-08', 1500, 0, 30),
	(7876, 'Adams', 'Secretario', '7788', '1983-01-12', 1100, 0, 20),
	(7900, 'James', 'Secretario', '7698', '1981-12-03', 950, 0, 30),
	(7902, 'Ford', 'Analista', '7566', '1981-12-03', 3000, 0, 20),
	(7934, 'Miller', 'Secretario', '7782', '1982-01-23', 1300, 0, 10);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
