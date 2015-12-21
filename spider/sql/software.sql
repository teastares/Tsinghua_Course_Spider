-- MySQL Script generated by MySQL Workbench
-- Mon 21 Dec 2015 08:31:38 PM CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema webclock
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema webclock
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `webclock` DEFAULT CHARACTER SET utf8 ;
USE `webclock` ;

-- -----------------------------------------------------
-- Table `webclock`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webclock`.`User` (
  `user_id` VARCHAR(45) NOT NULL,
  `user_passwd` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `user_state` INT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webclock`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webclock`.`Course` (
  `course_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `course_name` VARCHAR(45) NULL,
  `course_enable` INT NULL,
  `notice_enable` INT NULL,
  `homework_enable` INT NULL,
  `file_enable` INT NULL,
  `course_url` VARCHAR(500) NULL,
  PRIMARY KEY (`course_id`, `user_id`),
  INDEX `fk_Course_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Course_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `webclock`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webclock`.`Homework`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webclock`.`Homework` (
  `send_state` INT NULL,
  `alarm_state` INT NULL,
  `url` VARCHAR(500) NULL,
  `homework_name` VARCHAR(45) NULL,
  `homework_id` VARCHAR(45) NOT NULL,
  `deadline` DATETIME NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`homework_id`, `course_id`, `user_id`),
  INDEX `fk_Homework_Course1_idx` (`course_id` ASC, `user_id` ASC),
  CONSTRAINT `fk_Homework_Course1`
    FOREIGN KEY (`course_id` , `user_id`)
    REFERENCES `webclock`.`Course` (`course_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webclock`.`File`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webclock`.`File` (
  `file_id` VARCHAR(45) NOT NULL,
  `send_state` INT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`file_id`, `course_id`, `user_id`),
  INDEX `fk_File_Course1_idx` (`course_id` ASC, `user_id` ASC),
  CONSTRAINT `fk_File_Course1`
    FOREIGN KEY (`course_id` , `user_id`)
    REFERENCES `webclock`.`Course` (`course_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

CREATE USER 'webclock'@'localhost' IDENTIFIED BY 'webclockv1.2';
GRANT ALL ON webclock.* TO 'webclock'@'localhost';
