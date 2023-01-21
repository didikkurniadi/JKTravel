-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (arm64)
--
-- Host: localhost    Database: tourism
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
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORY` (
  `ID` tinyint NOT NULL,
  `NAMA_KATEGORI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'Wisata Sejarah'),(2,'Wisata Keluarga'),(3,'Wisata Alam');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DETAIL_WISATA`
--

DROP TABLE IF EXISTS `DETAIL_WISATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DETAIL_WISATA` (
  `ID_WISATA` int NOT NULL,
  `NAMA` varchar(255) DEFAULT NULL,
  `ID_KATEGORY` tinyint DEFAULT NULL,
  `ID_WILAYAH` int DEFAULT NULL,
  `HARGA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_WISATA`),
  KEY `ID_WILAYAH` (`ID_WILAYAH`),
  KEY `ID_KATEGORY` (`ID_KATEGORY`),
  CONSTRAINT `detail_wisata_ibfk_1` FOREIGN KEY (`ID_WILAYAH`) REFERENCES `WILAYAH` (`ID`),
  CONSTRAINT `detail_wisata_ibfk_2` FOREIGN KEY (`ID_KATEGORY`) REFERENCES `CATEGORY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETAIL_WISATA`
--

LOCK TABLES `DETAIL_WISATA` WRITE;
/*!40000 ALTER TABLE `DETAIL_WISATA` DISABLE KEYS */;
INSERT INTO `DETAIL_WISATA` VALUES (1,'Museum Bahari',1,1,'Rp. 20.000,-'),(2,'Allianz Eco Park',2,1,'Rp. -'),(3,'Atlantis Water Park Ancol',2,1,'Rp. 150.000,-'),(4,'Dunia Fantasi',2,1,'Rp. 200.000,-'),(5,'Fauna Land Ancol',2,1,'Rp. 150.000,-'),(6,'Sea World Ancol',2,1,'Rp. 200.000,-'),(7,'Taman Impian Jaya Ancol',2,1,'Rp. 20.000,-'),(8,'Bidadari Island',3,1,'Rp. 80.000,-'),(9,'Pantai Marunda',3,1,'Rp. 50.000,-'),(10,'Pantai Pasir Putih',3,1,'Rp. 70.000,-'),(11,'Taman Wisata Alam Mangrove',3,1,'Rp. 25.000,-'),(12,'Tidung Island',3,1,'Rp. 10.000,-'),(13,'Kota Tua',1,2,'Rp. -'),(14,'Museum Bank Indonesia',1,2,'Rp. 20.000,-'),(15,'Museum MACAN',1,2,'Rp. 70.000,-'),(16,'Museum of Textile',1,2,'Rp. 30.000,-'),(17,'Museum Wayang',1,2,'Rp. 20.000,-'),(18,'Jakarta Aquarium & Safari',2,2,'Rp. 130.000,-'),(19,'Taman Cattelya',2,2,'Rp. -'),(20,'Tribeca Park',2,2,'Rp. -'),(21,'Monumen Pancasila Sakti',1,3,'Rp. 25.000,-'),(22,'Museum Perangko Indonesia',1,3,'Rp. 25.000,-'),(23,'Taman Mini Indonesia Indah',1,3,'Rp. 20.000,-'),(24,'Galeri Nasional Indonesia',1,4,'Rp. 25.000,-'),(25,'Monumen Nasional',1,4,'Rp. -'),(26,'Museum Kebangkitan Nasional',1,4,'Rp. 20.000,-'),(27,'Museum MOJA',1,4,'Rp. 50.000,-'),(28,'Museum Nasional Indonesia',1,4,'Rp. 35.000,-'),(29,'Museum Sumpah Pemuda',1,4,'Rp. 20.000,-'),(30,'Grand Indonesia',2,4,'Rp. -'),(31,'Jakarta Planetarium',2,4,'Rp. -'),(32,'Taman Lapangan Banteng',2,4,'Rp. -'),(33,'Taman Situ Lembang',2,4,'Rp. -'),(34,'Taman Suropati',2,4,'Rp. -'),(35,'Hutan Kota GBK',3,4,'Rp. -'),(36,'Museum Layang-Layang Indonesia',1,5,'Rp. 20.000,-'),(37,'Ragunan Zoo',2,5,'Rp. 10.000-'),(38,'Taman Barito',2,5,'Rp. -'),(39,'Tebet Eco Park',2,5,'Rp. -'),(40,'Setu Babakan',3,5,'Rp. 10.000,-');
/*!40000 ALTER TABLE `DETAIL_WISATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WILAYAH`
--

DROP TABLE IF EXISTS `WILAYAH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WILAYAH` (
  `ID` int NOT NULL,
  `NAMA_WILAYAH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WILAYAH`
--

LOCK TABLES `WILAYAH` WRITE;
/*!40000 ALTER TABLE `WILAYAH` DISABLE KEYS */;
INSERT INTO `WILAYAH` VALUES (1,'Jakarta Utara'),(2,'Jakarta Barat'),(3,'Jakarta Timur'),(4,'Jakarta Pusat'),(5,'Jakarta Selatan');
/*!40000 ALTER TABLE `WILAYAH` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-21 14:40:40
