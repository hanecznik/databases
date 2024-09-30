-- MySQL Script generated by MySQL Workbench
-- Mon Sep 30 07:57:56 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Book` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `ISBN` VARCHAR(35) NOT NULL,
  `category_id` INT NOT NULL,
  `published_year` DATETIME NOT NULL,
  `copies` INT NOT NULL,
  `available_copies` INT NOT NULL,
  `publisher_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Author` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Books_Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Books_Category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Subscription` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Subscription` (
  `subscription_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `plan_type` VARCHAR(30) NOT NULL,
  `status` VARCHAR(30) NOT NULL,
  `payment_method` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`subscription_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Library_Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Library_Member` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Library_Member` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books_Borrowing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Books_Borrowing` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Books_Borrowing` (
  `borrowing_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  PRIMARY KEY (`borrowing_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Library_Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Library_Staff` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Library_Staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `hire_date` DATETIME NOT NULL,
  `position` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books_Reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Books_Reservation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Books_Reservation` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`reservation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Books_Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Books_Review` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Books_Review` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `rewiev_text` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`review_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ebook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ebook` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ebook` (
  `ebook_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `ISBN` VARCHAR(30) NOT NULL,
  `author_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `published_year` DATETIME NOT NULL,
  PRIMARY KEY (`ebook_id`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book_Publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Book_Publisher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Book_Publisher` (
  `publisher_id` INT NOT NULL AUTO_INCREMENT,
  `publisher_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Penalty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Penalty` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Penalty` (
  `penalty_id` INT NOT NULL AUTO_INCREMENT,
  `borrowing_id` INT NOT NULL,
  `amount` VARCHAR(45) NOT NULL,
  `issue_date` DATETIME NOT NULL,
  PRIMARY KEY (`penalty_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
