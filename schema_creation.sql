-- MySQL Script generated by MySQL Workbench
-- 11/29/15 14:50:30
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema meFavorDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema meFavorDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meFavorDB` DEFAULT CHARACTER SET utf8 ;
USE `meFavorDB` ;

-- -----------------------------------------------------
-- Table `meFavorDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meFavorDB`.`users` (
  `user_id` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `zipcode` INT NULL,
  `rating` INT NULL,
  `gender` CHAR NULL,
  `badge` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meFavorDB`.`assign_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meFavorDB`.`assign_status` (
  `assign_id` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`assign_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meFavorDB`.`work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meFavorDB`.`work` (
  `work_id` VARCHAR(45) NOT NULL,
  `created_by` VARCHAR(45) NULL,
  `assign_status` VARCHAR(45) NULL,
  `assign_to` VARCHAR(45) NULL,
  `TS_created` TIMESTAMP NULL,
  `TS_alloted` TIMESTAMP NULL,
  `TS_expiry` TIMESTAMP NULL,
  `TS_comopleted` TIMESTAMP NULL,
  `comp_status` INT NULL,
  `start_location` VARCHAR(45) NULL,
  `end_location` VARCHAR(45) NULL,
  `cost` FLOAT NULL,
  PRIMARY KEY (`work_id`),
  INDEX `created_by_idx` (`created_by` ASC),
  INDEX `assign_to_idx` (`assign_to` ASC, `created_by` ASC),
  INDEX `assign_status_idx` (`assign_status` ASC),
  CONSTRAINT `created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `meFavorDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assign_to`
    FOREIGN KEY (`assign_to` , `created_by`)
    REFERENCES `meFavorDB`.`users` (`user_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assign_status`
    FOREIGN KEY (`assign_status`)
    REFERENCES `meFavorDB`.`assign_status` (`assign_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meFavorDB`.`logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meFavorDB`.`logs` (
  `log_id` VARCHAR(45) NOT NULL,
  `bidder_id` VARCHAR(45) NULL,
  `acceptor_id` VARCHAR(45) NULL,
  `work_id` VARCHAR(45) NULL,
  `work_status` INT NULL,
  INDEX `requestor_id_idx` (`bidder_id` ASC),
  INDEX `acceptor_id_idx` (`acceptor_id` ASC),
  INDEX `work_id_idx` (`work_id` ASC),
  PRIMARY KEY (`log_id`),
  CONSTRAINT `requestor_id`
    FOREIGN KEY (`bidder_id`)
    REFERENCES `meFavorDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `acceptor_id`
    FOREIGN KEY (`acceptor_id`)
    REFERENCES `meFavorDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `meFavorDB`.`work` (`work_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
