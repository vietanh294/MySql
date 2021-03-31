-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema web_sach_cu_01
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema web_sach_cu_01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `web_sach_cu_01` DEFAULT CHARACTER SET utf8 ;
USE `web_sach_cu_01` ;

-- -----------------------------------------------------
-- Table `web_sach_cu_01`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `web_sach_cu_01`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_phone` VARCHAR(10) NULL,
  `user_password` VARCHAR(45) NULL,
  `user_email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `web_sach_cu_01`.`catogue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `web_sach_cu_01`.`catogue` (
  `catogue_id` INT NOT NULL AUTO_INCREMENT,
  `catogue_stype` VARCHAR(45) NULL,
  PRIMARY KEY (`catogue_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `web_sach_cu_01`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `web_sach_cu_01`.`book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_name` VARCHAR(200) NULL,
  `book_picture` VARCHAR(45) NULL,
  `book_year` VARCHAR(45) NULL,
  `book_description` VARCHAR(45) NULL,
  `book_author` VARCHAR(45) NULL,
  `book_price` INT NULL,
  `catogue_catogue_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_book_catogue1_idx` (`catogue_catogue_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_catogue1`
    FOREIGN KEY (`catogue_catogue_id`)
    REFERENCES `web_sach_cu_01`.`catogue` (`catogue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `web_sach_cu_01`.`user_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `web_sach_cu_01`.`user_book` (
  `user_book_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`user_book_id`),
  INDEX `fk_user_book_user_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_user_book_book1_idx` (`book_book_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_book_user`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `web_sach_cu_01`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_book_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `web_sach_cu_01`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `web_sach_cu_01`.`user_collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `web_sach_cu_01`.`user_collection` (
  `user_collection_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`user_collection_id`),
  INDEX `fk_user_collection_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_user_collection_book1_idx` (`book_book_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_collection_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `web_sach_cu_01`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_collection_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `web_sach_cu_01`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
