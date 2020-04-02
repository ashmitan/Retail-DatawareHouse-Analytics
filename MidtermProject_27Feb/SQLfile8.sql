-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: adventureworksdw
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `dimscrapreason`
--

DROP TABLE IF EXISTS `dimscrapreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimscrapreason` (
  `ScrapReasonID` int NOT NULL,
  `scrapreasonkey` int NOT NULL,
  `ScrapReasonName` varchar(50) NOT NULL,
  `DI_JOB_ID` varchar(50) DEFAULT NULL,
  `DI_MODIFIED_DATE` datetime DEFAULT NULL,
  `DI_CREATED_DATE` datetime DEFAULT NULL,
  `SOR_ID` int DEFAULT NULL,
  PRIMARY KEY (`scrapreasonkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimscrapreason`
--

LOCK TABLES `dimscrapreason` WRITE;
/*!40000 ALTER TABLE `dimscrapreason` DISABLE KEYS */;
INSERT INTO `dimscrapreason` VALUES (1,1,'Brake assembly not as ordered','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(2,2,'Color incorrect','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(3,3,'Gouge in metal','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(4,4,'Drill pattern incorrect','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(5,5,'Drill size too large','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(6,6,'Drill size too small','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(7,7,'Handling damage','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(8,8,'Paint process failed','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(9,9,'Primer process failed','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(10,10,'Seat assembly not as ordered','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(11,11,'Stress test failed','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(12,12,'Thermoform temperature too high','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(13,13,'Thermoform temperature too low','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(14,14,'Trim length too long','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(15,15,'Trim length too short','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL),(16,16,'Wheel misaligned','[Unnamed Module]','2020-02-27 02:14:53','2020-02-27 02:14:53',NULL);
/*!40000 ALTER TABLE `dimscrapreason` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 15:13:21
