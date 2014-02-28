-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.27 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para gestiónempleados
DROP DATABASE IF EXISTS `gestiónempleados`;
CREATE DATABASE IF NOT EXISTS `gestiónempleados` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gestiónempleados`;


-- Volcando estructura para tabla gestiónempleados.auditoria_empleados
DROP TABLE IF EXISTS `auditoria_empleados`;
CREATE TABLE IF NOT EXISTS `auditoria_empleados` (
  `num_emp` int(11) NOT NULL,
  `nombreEmp` varchar(50) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `jefe` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `departamento` int(11) DEFAULT NULL,
  `nnum_emp` int(11) DEFAULT NULL,
  `nnombreEmp` varchar(50) DEFAULT NULL,
  `npuesto` varchar(50) DEFAULT NULL,
  `njefe` varchar(50) DEFAULT NULL,
  `nfecha_contratacion` date DEFAULT NULL,
  `nsalario` float DEFAULT NULL,
  `ncomision` float DEFAULT NULL,
  `ndepartamento` int(11) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`num_emp`,`fechaActualizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.auditoria_empleados: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria_empleados` DISABLE KEYS */;
INSERT INTO `auditoria_empleados` (`num_emp`, `nombreEmp`, `puesto`, `jefe`, `fecha_contratacion`, `salario`, `comision`, `departamento`, `nnum_emp`, `nnombreEmp`, `npuesto`, `njefe`, `nfecha_contratacion`, `nsalario`, `ncomision`, `ndepartamento`, `usuario`, `fechaActualizacion`) VALUES
	(7369, 'SMITH', 'SECRETARIO', '7902', '1980-12-17', 1952, NULL, 20, 7369, 'SMITH', 'SECRETARIO', '7902', '1980-12-17', 100, 500, 20, 'root@localhost', '2013-06-10 00:00:00'),
	(7369, 'SMITH', 'SECRETARIO', '7902', '1980-12-17', 100, 500, 20, 7369, 'SMITH', 'SECRETARIO', '7902', '1980-12-17', 100, 1200, 20, 'root@localhost', '2013-06-10 10:34:10'),
	(7566, 'JONES', 'GERENTE', '7839', '1981-04-02', 4400, NULL, 20, 7566, 'JONES', 'GERENTE', '7839', '1981-04-02', 100, 500, 20, 'root@localhost', '2013-06-10 10:35:08'),
	(7782, 'CLARK', 'GERENTE', '7839', '1981-06-09', 3765, NULL, 10, 7782, 'CLARK', 'GERENTE', '7839', '1981-06-09', 100, 800, 10, 'root@localhost', '2013-06-10 10:35:08'),
	(7788, 'SCOTT', 'ANALISTA', '7566', '1982-12-09', 4430, NULL, 20, 7788, 'SCOTT', 'ANALISTA', '7566', '1982-12-09', 100, 500, 20, 'root@localhost', '2013-06-10 10:35:08'),
	(7839, 'KING', 'PRESIDENTE', NULL, '1981-11-17', 8000, NULL, 10, 7839, 'KING', 'PRESIDENTE', NULL, '1981-11-17', 100, 900, 10, 'root@localhost', '2013-06-10 10:35:08'),
	(7844, 'TURNER', 'VENDEDOR', '7698', '1981-09-08', 2615, 0, 30, 7844, 'TURNER', 'VENDEDOR', '7698', '1981-09-08', 100, 650, 30, 'root@localhost', '2013-06-10 10:35:08'),
	(7876, 'ADAMS', 'SECRETARIO', '7788', '1983-01-12', 2131, NULL, 20, 7876, 'ADAMS', 'SECRETARIO', '7788', '1983-01-12', 100, 750, 20, 'root@localhost', '2013-06-10 10:35:08'),
	(7900, 'JAMESS', 'SECRETARIO', '7698', '1981-12-03', 1950, NULL, 30, 7900, 'JAMESS', 'SECRETARIO', '7698', '1981-12-03', 100, 925, 30, 'root@localhost', '2013-06-10 10:35:08'),
	(8027, 'DANIEL', 'DIRECCION', '7839', '2013-05-24', 3500, 2500, 20, 8027, 'DANIEL', 'DIRECCION', '7839', '2013-05-24', 100, 4500, 20, 'root@localhost', '2013-06-10 10:35:08');
/*!40000 ALTER TABLE `auditoria_empleados` ENABLE KEYS */;


-- Volcando estructura para procedimiento gestiónempleados.cursor2
DROP PROCEDURE IF EXISTS `cursor2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor2`()
BEGIN
DECLARE fin BOOL;
DECLARE a INT;
DECLARE b INT;
DECLARE c INT;
DECLARE d INT;
DECLARE idfila INT;
DECLARE total INT;
DECLARE curs2 CURSOR FOR SELECT idalumnos,nota1,nota2,nota3 from alumnos;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
SET fin=0;
OPEN curs2;
etiquetaLOOP: LOOP
FETCH curs2 INTO idfila,a,b,c;
SET d=(a+b+c)/3;
UPDATE alumnos SET final=d WHERE idalumnos=idfila;
IF fin=1 THEN
LEAVE etiquetaLOOP;
END IF;
SET total=total +1;
END LOOP;
CLOSE curs2;
END//
DELIMITER ;


-- Volcando estructura para tabla gestiónempleados.departamentos
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `num_dept` int(10) NOT NULL DEFAULT '0',
  `nombre_dept` varchar(50) DEFAULT NULL,
  `localización` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.departamentos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`num_dept`, `nombre_dept`, `localización`) VALUES
	(10, 'Contabilidad', 'Nueva York'),
	(20, 'Investigación', 'Dallas'),
	(30, 'Ventas', 'Chicago'),
	(40, 'Operaciones', 'Boston');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;


-- Volcando estructura para tabla gestiónempleados.empleados
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `numEmp` int(10) NOT NULL,
  `nombreEmp` varchar(50) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `jefe` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `departamento` int(11) NOT NULL,
  PRIMARY KEY (`numEmp`),
  KEY `departamento` (`departamento`),
  CONSTRAINT `FK_empleados_departamentos` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`num_dept`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.empleados: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`numEmp`, `nombreEmp`, `puesto`, `jefe`, `fecha_contratacion`, `salario`, `comision`, `departamento`) VALUES
	(7369, 'SMITH', 'SECRETARIO', '7902', '1980-12-17', 100, 1200, 20),
	(7499, 'ALLEN', 'VENDEDOR', '7698', '1981-02-20', 3104, 300, 30),
	(7521, 'WARD', 'VENDEDOR', '7698', '1981-02-22', 2600, 500, 30),
	(7566, 'JONES', 'GERENTE', '7839', '1981-04-02', 100, 500, 20),
	(7654, 'MARTIN', 'VENDEDOR', '7698', '1981-09-28', 2313, 1400, 30),
	(7782, 'CLARK', 'GERENTE', '7839', '1981-06-09', 100, 800, 10),
	(7788, 'SCOTT', 'ANALISTA', '7566', '1982-12-09', 100, 500, 20),
	(7839, 'KING', 'PRESIDENTE', NULL, '1981-11-17', 100, 900, 10),
	(7844, 'TURNER', 'VENDEDOR', '7698', '1981-09-08', 100, 650, 30),
	(7876, 'ADAMS', 'SECRETARIO', '7788', '1983-01-12', 100, 750, 20),
	(7900, 'JAMESS', 'SECRETARIO', '7698', '1981-12-03', 100, 925, 30),
	(7902, 'FORD', 'ANALISTA', '7566', '1981-12-03', 4430, NULL, 20),
	(7934, 'MILLER', 'SECRETARIO', '7782', '1982-01-23', 2703, NULL, 10),
	(8025, 'MARTOS', 'DIRECCION', '7839', '2013-05-25', 3500, 1000, 20),
	(8026, 'GARCIA', 'ANALISTA', '7839', '2013-05-26', 3000, 800, 20),
	(8027, 'DANIEL', 'DIRECCION', '7839', '2013-05-24', 100, 4500, 20);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;


-- Volcando estructura para procedimiento gestiónempleados.empleadoscomision
DROP PROCEDURE IF EXISTS `empleadoscomision`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `empleadoscomision`()
BEGIN
SELECT COUNT(comision) AS "Empleados comisionistas" FROM empleados;
END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.empleadosdepartamentos
DROP PROCEDURE IF EXISTS `empleadosdepartamentos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `empleadosdepartamentos`(IN valor varchar(20))
BEGIN
SELECT e.numEmp,e.nombreEmp,d.nombre_dept 
FROM empleados e,departamentos d
WHERE e.departamento=d.num_dept AND valor=nombre_dept;
END//
DELIMITER ;


-- Volcando estructura para evento gestiónempleados.evento_NuevosEmpleados
DROP EVENT IF EXISTS `evento_NuevosEmpleados`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `evento_NuevosEmpleados` ON SCHEDULE EVERY 1 MINUTE STARTS '2013-06-03 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
DROP TABLE IF EXISTS nuevosEmpleados;
CREATE TABLE nuevosEmpleados(numEmp int PRIMARY KEY,
nombreEmp varchar(50),puesto varchar(50),fecha_contratacion 
DATE);

INSERT INTO nuevosEmpleados
SELECT numEmp,nombreEmp,puesto,fecha_contratacion 
FROM empleados
WHERE fecha_contratacion>= DATE_SUB(CURRENT_DATE(),
INTERVAL 30 DAY);

END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.identificador_departamento_cursor
DROP PROCEDURE IF EXISTS `identificador_departamento_cursor`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `identificador_departamento_cursor`(IN dept VARCHAR(20))
BEGIN
SELECT e.numEmp,e.nombreEmp,e.puesto
FROM empleados e
WHERE e.puesto=dept;
END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.identificador_departamento_cursor2
DROP PROCEDURE IF EXISTS `identificador_departamento_cursor2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `identificador_departamento_cursor2`(IN dept VARCHAR(20))
BEGIN
SELECT e.numEmp,e.nombreEmp,e.puesto
FROM empleados e, departamentos d
WHERE d.nombre_dept=dept;
END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.identificador_departamento_cursor3
DROP PROCEDURE IF EXISTS `identificador_departamento_cursor3`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `identificador_departamento_cursor3`(IN dept VARCHAR(20))
BEGIN
SELECT e.numEmp,e.nombreEmp,e.puesto,d.nombre_dept
FROM empleados e, departamentos d
WHERE d.nombre_dept=dept AND d.num_dept=e.departamento;
END//
DELIMITER ;


-- Volcando estructura para vista gestiónempleados.nombresalario
DROP VIEW IF EXISTS `nombresalario`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `nombresalario` (
	`nombreSalario` VARCHAR(62) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista gestiónempleados.nombresalario1
DROP VIEW IF EXISTS `nombresalario1`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `nombresalario1` (
	`nombreSalario` VARCHAR(62) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista gestiónempleados.nombresalario5
DROP VIEW IF EXISTS `nombresalario5`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `nombresalario5` (
	`CONCAT(e.nombreEmp,e.salario)` VARCHAR(62) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista gestiónempleados.nombresalario6
DROP VIEW IF EXISTS `nombresalario6`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `nombresalario6` (
	`CONCAT(e.nombreEmp,' ',e.salario)` VARCHAR(63) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para tabla gestiónempleados.nuevosempleados
DROP TABLE IF EXISTS `nuevosempleados`;
CREATE TABLE IF NOT EXISTS `nuevosempleados` (
  `numEmp` int(11) NOT NULL,
  `nombreEmp` varchar(50) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  PRIMARY KEY (`numEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.nuevosempleados: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nuevosempleados` DISABLE KEYS */;
INSERT INTO `nuevosempleados` (`numEmp`, `nombreEmp`, `puesto`, `fecha_contratacion`) VALUES
	(8025, 'MARTOS', 'DIRECCION', '2013-05-25'),
	(8026, 'GARCIA', 'ANALISTA', '2013-05-26'),
	(8027, 'DANIEL', 'DIRECCION', '2013-05-24');
/*!40000 ALTER TABLE `nuevosempleados` ENABLE KEYS */;


-- Volcando estructura para procedimiento gestiónempleados.salario_aumento
DROP PROCEDURE IF EXISTS `salario_aumento`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `salario_aumento`()
BEGIN
DECLARE fin BOOL;
DECLARE num INT;
DECLARE sal INT;


DECLARE salario_aumento CURSOR FOR SELECT numEmp,salario FROM empleados;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

OPEN salario_aumento;

etiquetaLOOP: LOOP
FETCH salario_aumento INTO num,sal;

IF 	MOD(num,2)=0 THEN
SET sal=sal + (sal*0.1);
UPDATE empleados SET salario=sal
WHERE numEmp=num;

ELSE 
SET sal=sal + (sal*0.2);
UPDATE empleados SET salario=sal
WHERE numEmp=num;
END IF;

IF fin=1 THEN

LEAVE etiquetaLOOP;
END IF;

END LOOP;

CLOSE salario_aumento;
END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.salario_cursor
DROP PROCEDURE IF EXISTS `salario_cursor`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `salario_cursor`(IN valor int)
BEGIN
DECLARE fin BOOL;
DECLARE a INT;
DECLARE b VARCHAR(50);
DECLARE c INT;


DECLARE salario_cursor CURSOR FOR SELECT numEmp,nombreEmp,salario FROM empleados;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

OPEN salario_cursor;
DROP TABLE IF EXISTS salario_menor;
CREATE TABLE salario_menor(numero_Epmle INT PRIMARY KEY,nombrEmpl VARCHAR(50),salarioEmp INT);

DROP TABLE IF EXISTS salario_igual;
CREATE TABLE salario_igual(numero_Epmle INT PRIMARY KEY,nombrEmpl VARCHAR(50),salarioEmp INT);

DROP TABLE IF EXISTS salario_mayor;
CREATE TABLE salario_mayor(numero_Epmle INT PRIMARY KEY,nombrEmpl VARCHAR(50),salarioEmp INT);

etiquetaLOOP: LOOP
FETCH salario_cursor INTO a,b,c;

IF 	c>valor THEN INSERT INTO salario_mayor VALUES(a,b,c);

ELSEIF c=valor THEN INSERT INTO salario_igual VALUES(a,b,c);

ELSEIF c<valor THEN INSERT INTO salario_menor VALUES(a,b,c);

END IF;

IF fin=1 THEN

LEAVE etiquetaLOOP;
END IF;

END LOOP;
CLOSE salario_cursor;
END//
DELIMITER ;


-- Volcando estructura para tabla gestiónempleados.salario_igual
DROP TABLE IF EXISTS `salario_igual`;
CREATE TABLE IF NOT EXISTS `salario_igual` (
  `numero_Epmle` int(11) NOT NULL,
  `nombrEmpl` varchar(50) DEFAULT NULL,
  `salarioEmp` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_Epmle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.salario_igual: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `salario_igual` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario_igual` ENABLE KEYS */;


-- Volcando estructura para tabla gestiónempleados.salario_mayor
DROP TABLE IF EXISTS `salario_mayor`;
CREATE TABLE IF NOT EXISTS `salario_mayor` (
  `numero_Epmle` int(11) NOT NULL,
  `nombrEmpl` varchar(50) DEFAULT NULL,
  `salarioEmp` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_Epmle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.salario_mayor: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `salario_mayor` DISABLE KEYS */;
INSERT INTO `salario_mayor` (`numero_Epmle`, `nombrEmpl`, `salarioEmp`) VALUES
	(7566, 'JONES', 2975),
	(7788, 'SCOTT', 3000),
	(7839, 'KING', 5000),
	(7902, 'FORD', 3000);
/*!40000 ALTER TABLE `salario_mayor` ENABLE KEYS */;


-- Volcando estructura para tabla gestiónempleados.salario_menor
DROP TABLE IF EXISTS `salario_menor`;
CREATE TABLE IF NOT EXISTS `salario_menor` (
  `numero_Epmle` int(11) NOT NULL,
  `nombrEmpl` varchar(50) DEFAULT NULL,
  `salarioEmp` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_Epmle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gestiónempleados.salario_menor: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `salario_menor` DISABLE KEYS */;
INSERT INTO `salario_menor` (`numero_Epmle`, `nombrEmpl`, `salarioEmp`) VALUES
	(7369, 'SMITH', 800),
	(7499, 'ALLEN', 1600),
	(7521, 'WARD', 1250),
	(7654, 'MARTIN', 1250),
	(7782, 'CLARK', 2450),
	(7844, 'TURNER', 1500),
	(7876, 'ADAMS', 1100),
	(7900, 'JAMESS', 950),
	(7934, 'MILLER', 1300);
/*!40000 ALTER TABLE `salario_menor` ENABLE KEYS */;


-- Volcando estructura para evento gestiónempleados.sumarSalarioMinutos
DROP EVENT IF EXISTS `sumarSalarioMinutos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `sumarSalarioMinutos` ON SCHEDULE EVERY 1 MINUTE STARTS '2013-06-05 12:39:10' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
UPDATE empleados SET salario=salario + 100;

END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.sumasalario
DROP PROCEDURE IF EXISTS `sumasalario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sumasalario`()
BEGIN
SELECT SUM(salario) FROM empleados;
END//
DELIMITER ;


-- Volcando estructura para procedimiento gestiónempleados.SumaSalarios
DROP PROCEDURE IF EXISTS `SumaSalarios`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SumaSalarios`()
BEGIN
DECLARE SumaTotalSalario float;

SELECT SUM(salario) INTO SumaTotalSalario FROM empleados;

SELECT SumaTotalSalario;
END//
DELIMITER ;


-- Volcando estructura para disparador gestiónempleados.auditoria_empleados
DROP TRIGGER IF EXISTS `auditoria_empleados`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `auditoria_empleados` AFTER UPDATE ON `empleados` FOR EACH ROW BEGIN
INSERT INTO auditoria_empleados VALUES
(OLD.numEmp,OLD.nombreEmp,OLD.puesto,OLD.jefe,OLD.fecha_contratacion,OLD.salario,OLD.comision,OLD.departamento,
NEW.numEmp,NEW.nombreEmp,NEW.puesto,NEW.jefe,NEW.fecha_contratacion,NEW.salario,NEW.comision,NEW.departamento,
CURRENT_USER(),NOW());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Volcando estructura para disparador gestiónempleados.comprobacion_salario
DROP TRIGGER IF EXISTS `comprobacion_salario`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `comprobacion_salario` BEFORE UPDATE ON `empleados` FOR EACH ROW BEGIN
IF NEW.salario < 0 THEN
SET NEW.salario =0;
ELSEIF NEW.salario > 100 THEN
SET NEW.salario = 100;
END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Volcando estructura para vista gestiónempleados.nombresalario
DROP VIEW IF EXISTS `nombresalario`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `nombresalario`;
CREATE ALGORITHM=UNDEFINED DEFINER=`seguro`@`localhost` SQL SECURITY DEFINER VIEW `nombresalario` AS select concat(`e`.`nombreEmp`,`e`.`salario`) AS `nombreSalario` from `empleados` `e`;


-- Volcando estructura para vista gestiónempleados.nombresalario1
DROP VIEW IF EXISTS `nombresalario1`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `nombresalario1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`seguro`@`localhost` SQL SECURITY DEFINER VIEW `nombresalario1` AS select concat(`e`.`nombreEmp`,`e`.`salario`) AS `nombreSalario` from `empleados` `e`;


-- Volcando estructura para vista gestiónempleados.nombresalario5
DROP VIEW IF EXISTS `nombresalario5`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `nombresalario5`;
CREATE ALGORITHM=UNDEFINED DEFINER=`seguro`@`localhost` SQL SECURITY DEFINER VIEW `nombresalario5` AS select concat(`e`.`nombreEmp`,`e`.`salario`) AS `CONCAT(e.nombreEmp,e.salario)` from `empleados` `e`;


-- Volcando estructura para vista gestiónempleados.nombresalario6
DROP VIEW IF EXISTS `nombresalario6`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `nombresalario6`;
CREATE ALGORITHM=UNDEFINED DEFINER=`seguro`@`localhost` SQL SECURITY DEFINER VIEW `nombresalario6` AS select concat(`e`.`nombreEmp`,' ',`e`.`salario`) AS `CONCAT(e.nombreEmp,' ',e.salario)` from `empleados` `e`;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
