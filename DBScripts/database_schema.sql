CREATE DATABASE `srinationalmedicals`

CREATE TABLE `srinationalmedicals`.`patients` (
  `patientUno` INT NOT NULL,
  `patientFirstName` VARCHAR(45) NULL,
  `patientLastName` VARCHAR(45) NULL,
  `mobileNumber` VARCHAR(20) NULL,
  `gender` VARCHAR(10) NULL,
  `birthDate` DATETIME NULL,
  `nicNumber` VARCHAR(45) NULL,
  `userUno` INT NULL,
  PRIMARY KEY (`patientUno`))
ENGINE = InnoDB;


CREATE TABLE `srinationalmedicals`.`usergroup` (
  `userGroupId` INT NOT NULL,
  `userGroupName` VARCHAR(45) NULL,
  `Description` VARCHAR(100) NULL,
  PRIMARY KEY (`userGroupId`));
  
  
  CREATE TABLE `srinationalmedicals`.`user` (
  `userUno` INT NOT NULL,
  `userName` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `userGroupId` INT NULL,
  PRIMARY KEY (`userUno`),
  INDEX `User_FK_idx` (`userGroupId` ASC),
  CONSTRAINT `User_FK`
    FOREIGN KEY (`userGroupId`)
    REFERENCES `srinationalmedicals`.`usergroup` (`userGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
	
	CREATE TABLE `srinationalmedicals`.`practitioner` (
  `practitionerUno` INT NOT NULL,
  `emailAddress` VARCHAR(50) NULL,
  `practitionerKey` VARCHAR(45) NULL,
  `fullName` VARCHAR(100) NULL,
  `registrationNumber` VARCHAR(45) NULL,
  `speciality` VARCHAR(100) NULL,
  `mobileNumber` VARCHAR(45) NULL,
  `active` CHAR(1) NULL,
  `userUno` INT NULL,
  PRIMARY KEY (`practitionerUno`),
  INDEX `Practitioner_FK_idx` (`userUno` ASC),
  CONSTRAINT `Practitioner_FK`
    FOREIGN KEY (`userUno`)
    REFERENCES `srinationalmedicals`.`user` (`userUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
	CREATE TABLE `srinationalmedicals`.`supplements` (
  `supplementUno` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL,
  `min` VARCHAR(45) NULL,
  `max` VARCHAR(45) NULL,
  PRIMARY KEY (`supplementUno`));
  
  CREATE TABLE `srinationalmedicals`.`supplementaldata` (
  `supplementDataUno` INT NOT NULL,
  `supplementVal` VARCHAR(45) NULL,
  `issuedDate` DATETIME NULL,
  `patientUno` INT NULL,
  `supplementUno` INT NULL,
  PRIMARY KEY (`supplementDataUno`),
  INDEX `SupplementalDataPtaient_FK_idx` (`patientUno` ASC),
  INDEX `SupplementalDataSup_FK_idx` (`supplementUno` ASC),
  CONSTRAINT `SupplementalDataPatient_FK`
    FOREIGN KEY (`patientUno`)
    REFERENCES `srinationalmedicals`.`patients` (`patientUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SupplementalDataSup_FK`
    FOREIGN KEY (`supplementUno`)
    REFERENCES `srinationalmedicals`.`supplements` (`supplementUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
CREATE TABLE `srinationalmedicals`.`profileaccess` (
  `practitionerUno` INT NULL,
  `patientUno` INT NULL,
  INDEX `profileAcessPractitioner_FK_idx` (`practitionerUno` ASC),
  INDEX `profileAcessPatient_FK_idx` (`patientUno` ASC),
  CONSTRAINT `profileAcessPractitioner_FK`
    FOREIGN KEY (`practitionerUno`)
    REFERENCES `srinationalmedicals`.`practitioner` (`practitionerUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profileAcessPatient_FK`
    FOREIGN KEY (`patientUno`)
    REFERENCES `srinationalmedicals`.`patients` (`patientUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `srinationalmedicals`.`function_access` (
  `functionUno` INT NOT NULL,
  `code` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `userGroupId` INT NULL,
  PRIMARY KEY (`functionUno`),
  INDEX `functionAcess_FK_idx` (`userGroupId` ASC),
  CONSTRAINT `functionAcess_FK`
    FOREIGN KEY (`userGroupId`)
    REFERENCES `srinationalmedicals`.`usergroup` (`userGroupId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `srinationalmedicals`.`otp_service` (
  `practitionerUno` INT NOT NULL,
  `patientUno` INT NULL,
  `issuedDateTime` DATETIME NULL,
  `otp` VARCHAR(45) NULL,
  PRIMARY KEY (`practitionerUno`),
  INDEX `otpServicePatient_FK_idx` (`patientUno` ASC),
  CONSTRAINT `otpServicePractitioner_FK`
    FOREIGN KEY (`practitionerUno`)
    REFERENCES `srinationalmedicals`.`practitioner` (`practitionerUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `otpServicePatient_FK`
    FOREIGN KEY (`patientUno`)
    REFERENCES `srinationalmedicals`.`patients` (`patientUno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
