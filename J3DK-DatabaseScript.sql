-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema J3DK
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema J3DK
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `J3DK` DEFAULT CHARACTER SET utf8 ;
USE `J3DK` ;

-- -----------------------------------------------------
-- Table `J3DK`.`Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Artist` (
  `Artist_Name` VARCHAR(20) NOT NULL,
  `Discription` MULTILINESTRING NULL,
  `Month_listeners` INT NULL,
  `Verified` TINYINT NULL,
  `Followers` INT NULL,
  `User_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Artist_Name`),
  UNIQUE INDEX `Artist_Name_UNIQUE` (`Artist_Name` ASC) VISIBLE,
  INDEX `User_idx` (`User_ID` ASC) VISIBLE,
  CONSTRAINT `User`
    FOREIGN KEY (`User_ID`)
    REFERENCES `J3DK`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`User` (
  `User_ID` VARCHAR(12) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `User_Pic` BLOB NULL,
  `EMail` VARCHAR(55) NOT NULL,
  `Is_Artist` TINYINT NOT NULL,
  `Friends` VARCHAR(45) NULL,
  `Following` VARCHAR(45) NULL,
  PRIMARY KEY (`User_ID`, `Password`),
  UNIQUE INDEX `UserID_UNIQUE` (`User_ID` ASC) VISIBLE,
  UNIQUE INDEX `EMail_UNIQUE` (`EMail` ASC) VISIBLE,
  INDEX `Following_idx` (`Following` ASC) VISIBLE,
  CONSTRAINT `Following`
    FOREIGN KEY (`Following`)
    REFERENCES `J3DK`.`Artist` (`Artist_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Playlist` (
  `Playlist_ID` INT NOT NULL AUTO_INCREMENT,
  `Playlist_Name` VARCHAR(45) NOT NULL,
  `Creater` VARCHAR(45) NOT NULL,
  `Playlist_Len` TIME NULL,
  `Num_Songs` SMALLINT NULL,
  PRIMARY KEY (`Playlist_ID`),
  UNIQUE INDEX `Playlist_ID_UNIQUE` (`Playlist_ID` ASC) VISIBLE,
  INDEX `Creater_idx` (`Creater` ASC) VISIBLE,
  CONSTRAINT `Creater`
    FOREIGN KEY (`Creater`)
    REFERENCES `J3DK`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Genres` (
  `Genre_Name` VARCHAR(45) NOT NULL,
  `Description` MULTILINESTRING NOT NULL,
  UNIQUE INDEX `Genre_Name_UNIQUE` (`Genre_Name` ASC) VISIBLE,
  PRIMARY KEY (`Genre_Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Songs` (
  `Song_Name` VARCHAR(45) NOT NULL,
  `Song_Len` TIME NULL,
  `Genre` VARCHAR(45) NOT NULL,
  `Num_Plays` INT NULL,
  `Artist` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Song_Name`),
  INDEX `Asrtist_idx` (`Artist` ASC) VISIBLE,
  INDEX `Genre_idx` (`Genre` ASC) VISIBLE,
  CONSTRAINT `Artist`
    FOREIGN KEY (`Artist`)
    REFERENCES `J3DK`.`Artist` (`Artist_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Genre`
    FOREIGN KEY (`Genre`)
    REFERENCES `J3DK`.`Genres` (`Genre_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Albums` (
  `Album_Name` VARCHAR(45) NOT NULL,
  `Artist` VARCHAR(45) NOT NULL,
  `Release_Date` DATETIME NOT NULL,
  `Num_Songs` INT NOT NULL,
  `Album_len` TIME NULL,
  `Album_Cover` BLOB NULL,
  `Discription` MULTILINESTRING NULL,
  PRIMARY KEY (`Album_Name`, `Artist`),
  INDEX `Creater_idx` (`Artist` ASC) VISIBLE,
  CONSTRAINT `Album_Creater`
    FOREIGN KEY (`Artist`)
    REFERENCES `J3DK`.`Artist` (`Artist_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Concerts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Concerts` (
  `Concert_ID` VARCHAR(45) NOT NULL,
  `Host` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(60) NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Venue_Size` INT NOT NULL,
  `Tickets_Available` INT NOT NULL,
  `Tickets_Sold` INT NOT NULL,
  PRIMARY KEY (`Concert_ID`),
  INDEX `Host_idx` (`Host` ASC) VISIBLE,
  CONSTRAINT `Host`
    FOREIGN KEY (`Host`)
    REFERENCES `J3DK`.`Artist` (`Artist_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`User_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`User_Info` (
  `User_ID` VARCHAR(45) NOT NULL,
  `EMail` VARCHAR(45) NOT NULL,
  `User_Pic` BLOB NULL,
  `Is_Artist` TINYINT NOT NULL,
  `Age` SMALLINT NULL,
  PRIMARY KEY (`User_ID`),
  CONSTRAINT `User_ID`
    FOREIGN KEY (`User_ID`)
    REFERENCES `J3DK`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Playlist_Songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Playlist_Songs` (
  `Song_Name` VARCHAR(45) NOT NULL,
  `Playlist_ID` INT NOT NULL,
  INDEX `Song_ID_idx` (`Song_Name` ASC) VISIBLE,
  INDEX `Playlist_ID_idx` (`Playlist_ID` ASC) VISIBLE,
  UNIQUE INDEX `Song_Name_UNIQUE` (`Song_Name` ASC) VISIBLE,
  UNIQUE INDEX `Playlist_ID_UNIQUE` (`Playlist_ID` ASC) VISIBLE,
  PRIMARY KEY (`Song_Name`, `Playlist_ID`),
  CONSTRAINT `Song_ID`
    FOREIGN KEY (`Song_Name`)
    REFERENCES `J3DK`.`Songs` (`Song_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Playlist_ID`
    FOREIGN KEY (`Playlist_ID`)
    REFERENCES `J3DK`.`Playlist` (`Playlist_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `J3DK`.`Album_Songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `J3DK`.`Album_Songs` (
  `Album_Name` VARCHAR(45) NOT NULL,
  `Song_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Album_Name`, `Song_Name`),
  INDEX `Song_idx` (`Song_Name` ASC) VISIBLE,
  CONSTRAINT `Album`
    FOREIGN KEY (`Album_Name`)
    REFERENCES `J3DK`.`Albums` (`Album_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Song`
    FOREIGN KEY (`Song_Name`)
    REFERENCES `J3DK`.`Songs` (`Song_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
