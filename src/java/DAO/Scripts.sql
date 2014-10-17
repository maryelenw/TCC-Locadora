-- MySQL Script generated by MySQL Workbench
-- 10/17/14 19:53:20
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bdReservaLocadora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdReservaLocadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bdReservaLocadora` ;

-- -----------------------------------------------------
-- Table `bdReservaLocadora`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdReservaLocadora`.`Filme` (
  `idFilme` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomeFilme` VARCHAR(75) NOT NULL,
  `anoFilme` INT NOT NULL,
  `generoFilme` VARCHAR(45) NOT NULL,
  `diretorFilme` VARCHAR(75) NULL,
  `codigoFilme` INT UNSIGNED NOT NULL,
  `midiaFilme` VARCHAR(45) NULL,
  `sinopseFilme` VARCHAR(1000) NULL,
  `produtoraFilme` VARCHAR(45) NULL,
  `classificacaoIndicativaFilme` VARCHAR(45) NOT NULL,
  `valorPagoLocadora` DOUBLE NULL,
  `classificacaoValorFilme` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdReservaLocadora`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdReservaLocadora`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(100) NOT NULL,
  `telefoneResidencial` VARCHAR(45) NULL,
  `telefoneCelular` VARCHAR(45) NULL,
  `telefoneRecado` VARCHAR(45) NULL,
  `email` VARCHAR(150) NULL,
  `endereco` VARCHAR(150) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `complemento` VARCHAR(100) NULL,
  PRIMARY KEY (`idCliente`, `bairro`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdReservaLocadora`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdReservaLocadora`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Filme_idFilme` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idReserva`, `Cliente_idCliente`, `Filme_idFilme`),
  UNIQUE INDEX `idReserva_UNIQUE` (`idReserva` ASC),
  INDEX `fk_Reserva_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Reserva_Filme1_idx` (`Filme_idFilme` ASC),
  CONSTRAINT `fk_Reserva_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `bdReservaLocadora`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Filme1`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `bdReservaLocadora`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdReservaLocadora`.`Acesso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdReservaLocadora`.`Acesso` (
  `idAcesso` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(150) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idAcesso`, `Cliente_idCliente`),
  INDEX `fk_Acesso_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Acesso_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `bdReservaLocadora`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
