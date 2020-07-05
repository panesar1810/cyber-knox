DROP DATABASE IF EXISTS assignment4;
CREATE DATABASE assignment4;
USE assignment4;

DROP TABLE IF EXISTS `creditcard`;
CREATE TABLE `creditcard` (
  `creditCardId` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `cvv` varchar(45) DEFAULT NULL,
  `expiryDate` varchar(45) DEFAULT NULL,
  `balance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`creditCardId`)
);

DROP TABLE IF EXISTS `debitcard`;
CREATE TABLE `debitcard` (
  `debitCardId` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `cvv` varchar(45) DEFAULT NULL,
  `expiryDate` varchar(45) DEFAULT NULL,
  `balance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`debitCardId`)
);

DROP TABLE IF EXISTS `estatement`;
CREATE TABLE `estatement` (
  `statementId` int(11) NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `transactionDate` varchar(45) DEFAULT NULL,
  `ammount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statementId`)
);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `roleName_UNIQUE` (`roleName`)
);

INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_EMPLOYEE'),(3,'ROLE_USER');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(90) DEFAULT NULL,
  `userAccountId` int(11) DEFAULT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
);

DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `userAccountId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `dateOfBirth` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `sinNumber` varchar(45) DEFAULT NULL,
  `accountNumber` varchar(45) DEFAULT NULL,
  `debitCardId` int(11) DEFAULT NULL,
  `creditCardId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userAccountId`)
);

DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles` (
  `userRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userRoleId`)
);

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employeeId` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `startDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
);

