-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (arm64)
--
-- Host: localhost    Database: FinalProject
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grades` (
  `Grade_ID` int NOT NULL,
  `Grade` int DEFAULT NULL,
  `Date_Assigned` date DEFAULT NULL,
  `Student_ID` int DEFAULT NULL,
  `Subject_ID` int DEFAULT NULL,
  `Teacher_ID` int DEFAULT NULL,
  `Term` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`Grade_ID`),
  UNIQUE KEY `GradU` (`Grade`,`Date_Assigned`,`Student_ID`,`Subject_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Subject_ID` (`Subject_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Students` (`Student_ID`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`Subject_ID`) REFERENCES `Subjects` (`Subject_ID`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`Teacher_ID`) REFERENCES `Teachers` (`Teacher_ID`),
  CONSTRAINT `grades_chk_1` CHECK (((`Grade` >= 1) and (`Grade` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grades`
--

LOCK TABLES `Grades` WRITE;
/*!40000 ALTER TABLE `Grades` DISABLE KEYS */;
INSERT INTO `Grades` VALUES (1,5,'2023-04-05',101,3,2,2,2023),(2,4,'2023-04-06',101,4,1,2,2023),(3,5,'2023-04-06',102,4,1,2,2023),(4,3,'2023-04-06',201,4,1,2,2023),(5,5,'2023-04-08',101,1,1,2,2023),(6,4,'2023-05-08',101,1,1,2,2023),(7,2,'2023-05-09',102,2,2,2,2023),(8,4,'2023-06-09',101,2,2,3,2023),(9,3,'2023-06-10',201,6,2,3,2023),(10,4,'2023-06-11',201,5,2,3,2023),(11,5,'2023-06-11',103,5,2,3,2023),(12,4,'2023-06-14',202,4,1,3,2023),(13,5,'2023-06-14',203,4,1,3,2023),(14,5,'2023-06-15',203,1,1,3,2023),(15,3,'2023-06-15',202,6,2,3,2023),(16,4,'2023-06-15',301,3,2,3,2023),(17,5,'2024-06-15',301,3,2,3,2024);
/*!40000 ALTER TABLE `Grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `Student_ID` int NOT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `GRNUM` int NOT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (101,'Иванов Д.И.','2000-07-09','89156455343','IvanovDI@mail.ru',1),(102,'Петров Н.Г.','2000-05-03','89185674565','PetrovNG@mail.ru',1),(103,'Соколов Е.В.','1999-03-09','89056744545','SokolovEV@mail.ru',1),(201,'Воробьева Е.Н.','2001-06-07','89115444555','VorobevaEN@mail.ru',2),(202,'Абрамян К.А.','2001-04-12','89163453232','AbramyanKA@mail.ru',2),(203,'Николаев П.В.','2000-03-07','89265655454','NikitinPV@mail.ru',2),(301,'Корягина Ю.В.','1999-05-05','89657545454','KoryginaYV@mail.ru',3);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subjects`
--

DROP TABLE IF EXISTS `Subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subjects` (
  `Subject_ID` int NOT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Teacher_ID` int DEFAULT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Subject_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `Teachers` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subjects`
--

LOCK TABLES `Subjects` WRITE;
/*!40000 ALTER TABLE `Subjects` DISABLE KEYS */;
INSERT INTO `Subjects` VALUES (1,'Математика',1,'Математический'),(2,'Литература',2,'Гуманитарный'),(3,'Русский Язык',2,'Гуманитарный'),(4,'Геометрия',1,'Математический'),(5,'Микроэкономика',1,'Гуманитарный'),(6,'ТГП',1,'Гуманитарный');
/*!40000 ALTER TABLE `Subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teachers` (
  `Teacher_ID` int NOT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Teacher_ID`),
  UNIQUE KEY `TeachU` (`FullName`,`BirthDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers`
--

LOCK TABLES `Teachers` WRITE;
/*!40000 ALTER TABLE `Teachers` DISABLE KEYS */;
INSERT INTO `Teachers` VALUES (1,'Герасимов Н.О.','1980-03-06','89067456374','GerasimovNO@list.ru'),(2,'Никитина Е.Д.','1980-08-02','89059056767','NikitinaED@list.ru');
/*!40000 ALTER TABLE `Teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17  0:52:43
