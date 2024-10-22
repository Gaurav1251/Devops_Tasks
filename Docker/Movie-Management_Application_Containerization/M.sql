-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: M
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `A_user` varchar(30) NOT NULL,
  `A_pass` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `A_user` (`A_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,'Gaurav1','123'),(2,'Gaurav','Gk');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking_12500`
--

DROP TABLE IF EXISTS `Booking_12500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking_12500` (
  `bookingId` int NOT NULL AUTO_INCREMENT,
  `bookingShowId` int NOT NULL,
  `custEmailId` varchar(200) NOT NULL,
  `bookingDate` datetime NOT NULL,
  `bookingSeats` varchar(255) NOT NULL,
  `totalBill` decimal(10,0) NOT NULL,
  PRIMARY KEY (`bookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking_12500`
--

LOCK TABLES `Booking_12500` WRITE;
/*!40000 ALTER TABLE `Booking_12500` DISABLE KEYS */;
INSERT INTO `Booking_12500` VALUES (1,17,'Bhakti87@gmail.com','2023-08-13 12:32:17','A1',190),(2,17,'gauravkondhalkar874@gmail.com','2023-08-13 12:43:04','A3',190),(3,18,'gauravkondhalkar874@gmail.com','2023-08-14 12:16:42','A2,A3',460),(4,17,'gauravkondhalkar874@gmail.com','2023-08-14 14:00:55','A7',190),(5,17,'gauravkondhalkar874@gmail.com','2023-08-14 14:24:41','B3,B4',380),(6,17,'gauravkondhalkar874@gmail.com','2023-08-14 14:26:05','A9',190),(7,17,'Bhakti87@gmail.com','2023-08-14 14:47:36','I7',190),(8,20,'Bhakti87@gmail.com','2023-08-14 14:49:10','F8',310),(9,22,'gauravkondhalkar874@gmail.com','2023-08-14 14:51:39','E5',260),(10,2,'gauravkondhalkar874@gmail.com','2023-10-04 12:01:29','A10',200);
/*!40000 ALTER TABLE `Booking_12500` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_12500`
--

DROP TABLE IF EXISTS `Customer_12500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_12500` (
  `custId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `emailId` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`custId`),
  UNIQUE KEY `emailId` (`emailId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_12500`
--

LOCK TABLES `Customer_12500` WRITE;
/*!40000 ALTER TABLE `Customer_12500` DISABLE KEYS */;
INSERT INTO `Customer_12500` VALUES (1,'Gaurav','Kondhalkar','gauravkondhalkar874@gmail.com','8668206177','Pune,Kothrud 411038','1'),(2,'Bhakti','Dahibhate','Bhakti87@gmail.com','8668206177','Pune,Kothrud 411038','123');
/*!40000 ALTER TABLE `Customer_12500` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie_12500`
--

DROP TABLE IF EXISTS `Movie_12500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie_12500` (
  `movieId` int NOT NULL AUTO_INCREMENT,
  `movieName` varchar(40) NOT NULL,
  `director` varchar(30) NOT NULL,
  `producer` varchar(30) NOT NULL,
  `writer` varchar(30) NOT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie_12500`
--

LOCK TABLES `Movie_12500` WRITE;
/*!40000 ALTER TABLE `Movie_12500` DISABLE KEYS */;
INSERT INTO `Movie_12500` VALUES (1,'Pathaan','Siddharth Anand','Aditya Chopra','Siddharth Anand','Shah Rukh Khan,Deepika Padukone,John Abraham','2023-01-25'),(2,'Ved','Riteish Deshmukh','Genelia D\'Souza','Tushar Hiranandani','Riteish Deshmukh,Genelia D\'Souza','2022-12-30'),(3,'RRR','S. S. Rajamouli','S. S. Rajamouli','D. V. V. Danayya','N. T.R,Ram Charan,Ajay Devgn,Alia Bhatt','2022-03-25'),(13,'Pink','Aniruddha Roy Chowdhury','Ronnie Lahiri,Rashmi Sharma','Ritesh Shah','Amitabh Bachchan,Taapsee Pannu','2016-09-16'),(14,'pK','Rajkumar Hirani','Rajkumar Hirani','Rajkumar Hirani',' Aamir Khan,Anushka Sharma,Sushant Singh Rajput','2014-12-19'),(15,'ABCD: Anybody Can Dance','Remo D\'Souza','Ronnie Screwvala','Tushar Hiranandani','Prabhu Deva,Ganesh Acharya','2013-02-08'),(32,'Oppenheimer','CHRISTOPHER NOLAN','EMMA THOMAS,CHRISTOPHER NOLAN','EMILY BLUNT','EMILY BLUNT,CHRISTOPHER NOLAN','2023-07-21'),(33,'Baipan Bhaari Deva','KEDAR SHINDE','Madhiri Bhosle','VAISHALI NAIK','ROHINI HATTANGADI,VANDANA GUPTE','2023-06-30'),(34,'Barbie','GRETA GERWIG','MARGOT ROBBIE','MARGOT ROBBIE','MARGOT ROBBIE, RYAN GOSLING','2023-07-21');
/*!40000 ALTER TABLE `Movie_12500` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `Show_12500`
--

DROP TABLE IF EXISTS `Show_12500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Show_12500` (
  `showId` int NOT NULL AUTO_INCREMENT,
  `show_MovieId` int NOT NULL,
  `screnn_no` int NOT NULL,
  `theatreName_loc` varchar(255) NOT NULL,
  `show_Type` varchar(255) NOT NULL,
  `showDate` date DEFAULT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`showId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Show_12500`
--

LOCK TABLES `Show_12500` WRITE;
/*!40000 ALTER TABLE `Show_12500` DISABLE KEYS */;
INSERT INTO `Show_12500` VALUES (2,15,1,'city pride,kothrud','Morning','2023-10-06','13:15','15:55',200),(9,3,4,'city pride','AfterNoon','2023-08-15','14:14','16:14',230),(11,13,4,'city pride','AfterNoon','2023-08-17','14:37','14:40',230),(14,13,1,'city pride','Morning','2023-08-14','14:48','14:48',230),(15,13,2,'city pride','Evening','2023-08-15','16:23','19:23',230),(16,13,2,'city pride','Evening','2023-08-10','16:23','19:23',230),(17,15,2,'city pride','Night','2023-08-15','19:15','21:00',190),(18,1,2,'city pride','Morning','2023-08-14','15:45','21:45',230),(19,15,2,'city pride','Morning','2023-08-12','10:58','13:58',190),(20,32,2,'city pride','Night','2023-08-16','20:30','22:30',310),(21,33,1,'city pride','AfterNoon','2023-08-17','14:35','17:35',250),(22,34,4,'city pride','Morning','2023-08-17','10:40','13:00',260);
/*!40000 ALTER TABLE `Show_12500` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22  5:47:49
