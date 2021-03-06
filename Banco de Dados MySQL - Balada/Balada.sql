-- MySQL Script generated by MySQL Workbench
-- Sun Dec 31 02:56:24 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Balada
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Balada
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Balada` DEFAULT CHARACTER SET utf8 ;
USE `Balada` ;

-- -----------------------------------------------------
-- Table `Balada`.`Pratos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Pratos` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  `tempoPreparo` INT NULL,
  `descricao` VARCHAR(80) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Cliente` (
  `cpf` VARCHAR(20) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(20) NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `clube` VARCHAR(20) NULL,
  `status` TINYINT NULL,
  `saldo` FLOAT NULL,
  `dataEntradaPrato` VARCHAR(45) NULL,
  `Pratos_codigo` INT NULL,
  `dataEntrada` VARCHAR(45) NULL,
  `dataAniversario` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Cliente_Pratos_idx` (`Pratos_codigo` ASC),
  CONSTRAINT `fk_Cliente_Pratos`
    FOREIGN KEY (`Pratos_codigo`)
    REFERENCES `Balada`.`Pratos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Funcionario` (
  `cpf` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(20) NULL,
  `endereco` VARCHAR(45) NULL,
  `salario` FLOAT NULL,
  `cargo` VARCHAR(45) NULL,
  `dataEntrada` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Mesas` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(50) NULL,
  `status` VARCHAR(20) NULL,
  `n_pedidoAtual` INT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Bebidas` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `temperaturaConsumo` INT NULL,
  `quenteFrio` VARCHAR(45) NULL,
  `quantidade` INT NULL,
  `fornecedor` VARCHAR(45) NULL,
  `validade` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  PRIMARY KEY (`codigo`, `nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf_cliente` VARCHAR(20) NULL,
  `cpf_func` VARCHAR(20) NULL,
  `id_mesa` INT NULL,
  `codigo` INT NULL,
  `data` VARCHAR(45) NULL,
  `quantidade` INT NULL,
  `Pratos_codigo` INT NULL,
  `Bebidas_codigo` INT NULL,
  INDEX `fk_Cliente_has_Cardapio_Cliente1_idx` (`cpf_cliente` ASC),
  INDEX `fk_Pedido_Mesas1_idx` (`id_mesa` ASC),
  INDEX `fk_Pedido_Funcionario1_idx` (`cpf_func` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_Pedido_Pratos1_idx` (`Pratos_codigo` ASC),
  INDEX `fk_Pedido_Bebidas1_idx` (`Bebidas_codigo` ASC),
  CONSTRAINT `fk_Cliente_has_Cardapio_Cliente1`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `Balada`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Mesas1`
    FOREIGN KEY (`id_mesa`)
    REFERENCES `Balada`.`Mesas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`cpf_func`)
    REFERENCES `Balada`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Pratos1`
    FOREIGN KEY (`Pratos_codigo`)
    REFERENCES `Balada`.`Pratos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Bebidas1`
    FOREIGN KEY (`Bebidas_codigo`)
    REFERENCES `Balada`.`Bebidas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Mantimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Mantimentos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `fornecedor` VARCHAR(45) NULL,
  `validade` VARCHAR(45) NULL,
  `metrica` VARCHAR(10) NULL,
  `quantidade` INT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`nome`, `id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Balada`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Balada`.`Login` (
  `usuario` VARCHAR(30) NOT NULL,
  `senha` VARCHAR(20) NULL,
  `cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`usuario`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
