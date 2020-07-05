-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment4
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estatement`
--

DROP TABLE IF EXISTS `estatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatement` (
  `statementId` int(11) NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `transactionDate` varchar(45) DEFAULT NULL,
  `ammount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statementId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatement`
--

LOCK TABLES `estatement` WRITE;
/*!40000 ALTER TABLE `estatement` DISABLE KEYS */;
INSERT INTO `estatement` VALUES (1,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','1234'),(2,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','100'),(3,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','100'),(4,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','200'),(5,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','2000'),(6,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','2000'),(7,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','2000'),(8,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','5000'),(9,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','3000'),(10,'4772342174','Harpreet','Saund','61517 Tyson Ranch','07/12/2019','12000'),(11,'4772342174','Harpreet','Saund','61517 Tyson Ranch','07/12/2019','1234'),(12,'9496201651','Sukhpreet','Singh','26 Florence Drive, ','07/12/2019','634');
/*!40000 ALTER TABLE `estatement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-07 18:28:39
