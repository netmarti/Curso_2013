claseSET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `colegio` ;
CREATE SCHEMA IF NOT EXISTS `colegio` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `colegio` ;

-- -----------------------------------------------------
-- Table `colegio`.`ESTUDIANTE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `colegio`.`ESTUDIANTE` (
  `EID` INT NOT NULL ,
  `nombre` CHAR(30) NOT NULL ,
  `especialidad` CHAR(15) NOT NULL ,
  `grado` CHAR(2) NOT NULL ,
  PRIMARY KEY (`EID`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `EID_UNIQUE` ON `colegio`.`ESTUDIANTE` (`EID` ASC) ;


-- -----------------------------------------------------
-- Table `colegio`.`CLASE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `colegio`.`CLASE` (
  `id_clase` VARCHAR(6) NOT NULL ,
  `nobre` CHAR(25) NULL ,
  `horario` VARCHAR(7) NOT NULL ,
  `aula` VARCHAR(6) NOT NULL ,
  PRIMARY KEY (`id_clase`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_clase_UNIQUE` ON `colegio`.`CLASE` (`id_clase` ASC) ;


-- -----------------------------------------------------
-- Table `colegio`.`INSCRIPCION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `colegio`.`INSCRIPCION` (
  `registro` INT NOT NULL AUTO_INCREMENT ,
  `nobre_clase` VARCHAR(6) NOT NULL ,
  `nombre_estudiante` INT(45) NOT NULL ,
  PRIMARY KEY (`registro`) ,
  CONSTRAINT `nombre_clase`
    FOREIGN KEY (`nobre_clase` )
    REFERENCES `colegio`.`CLASE` (`id_clase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_estudiante`
    FOREIGN KEY (`nombre_estudiante` )
    REFERENCES `colegio`.`ESTUDIANTE` (`EID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `registro_UNIQUE` ON `colegio`.`INSCRIPCION` (`registro` ASC) ;

CREATE INDEX `nombre_clase_idx` ON `colegio`.`INSCRIPCION` (`nobre_clase` ASC) ;

CREATE INDEX `nombre_estudiante_idx` ON `colegio`.`INSCRIPCION` (`nombre_estudiante` ASC) ;

USE `colegio` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
