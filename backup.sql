-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: myschool
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cronograma`
--

DROP TABLE IF EXISTS `cronograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cronograma` (
  `id_cronograma` int NOT NULL AUTO_INCREMENT,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id_cronograma`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronograma`
--

LOCK TABLES `cronograma` WRITE;
/*!40000 ALTER TABLE `cronograma` DISABLE KEYS */;
INSERT INTO `cronograma` VALUES (1,2024);
/*!40000 ALTER TABLE `cronograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_cronograma`
--

DROP TABLE IF EXISTS `detalle_cronograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cronograma` (
  `id_detalle_cronograma` int NOT NULL AUTO_INCREMENT,
  `id_cronograma` int DEFAULT NULL,
  `desc_pension` varchar(50) DEFAULT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `fecha_venci` date DEFAULT NULL,
  `id_grado` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_cronograma`),
  KEY `fk_detalle_cronograma_cronograma` (`id_cronograma`),
  CONSTRAINT `fk_detalle_cronograma_cronograma` FOREIGN KEY (`id_cronograma`) REFERENCES `cronograma` (`id_cronograma`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cronograma`
--

LOCK TABLES `detalle_cronograma` WRITE;
/*!40000 ALTER TABLE `detalle_cronograma` DISABLE KEYS */;
INSERT INTO `detalle_cronograma` VALUES (11,1,'marzo',300.00,'2024-03-31',1),(12,1,'abril',300.00,'2024-04-30',1),(13,1,'mayo',300.00,'2024-05-31',1),(14,1,'junio',300.00,'2024-06-30',1),(15,1,'julio',300.00,'2024-07-31',1),(16,1,'agosto',300.00,'2024-08-31',1),(17,1,'setiembre',300.00,'2024-09-30',1),(18,1,'octubre',300.00,'2024-10-30',1),(19,1,'noviembre',300.00,'2024-11-30',1),(20,1,'diciembre',300.00,'2024-12-30',1),(21,1,'matricula',300.00,'2024-03-31',1),(22,1,'matricula',450.00,'2024-03-31',5),(23,1,'marzo',450.00,'2024-03-31',5),(24,1,'abril',450.00,'2024-04-30',5),(25,1,'mayo',450.00,'2024-03-31',5),(26,1,'junio',450.00,'2024-03-30',5),(27,1,'julio',450.00,'2024-03-31',5),(28,1,'agosto',450.00,'2024-03-31',5),(29,1,'setiembre',450.00,'2024-03-30',5),(30,1,'octubre',450.00,'2024-03-30',5),(31,1,'noviembre',450.00,'2024-03-30',5),(32,1,'diciembre',450.00,'2024-03-30',5);
/*!40000 ALTER TABLE `detalle_cronograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `nid_grado` int NOT NULL AUTO_INCREMENT,
  `desc_grado` varchar(30) DEFAULT NULL,
  `nivel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nid_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,'2 años','INI'),(2,'3 años','INI'),(3,'4 años','INI'),(4,'5 años','INI'),(5,'Primero','PRI'),(6,'Segundo','PRI'),(7,'Tercero','PRI'),(8,'Cuarto','PRI'),(9,'Quinto','PRI'),(10,'Sexto','SEC'),(11,'Primero','SEC'),(12,'Segundo','SEC'),(13,'Tercero','SEC'),(14,'Cuarto','SEC'),(15,'Quinto','SEC');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `tipo_movimiento` varchar(20) DEFAULT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha_pago` timestamp NULL DEFAULT NULL,
  `id_persona` int DEFAULT NULL,
  `id_detalle_cronograma` int DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_movimiento_detalle_cronograma` (`id_detalle_cronograma`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `fk_movimiento_detalle_cronograma` FOREIGN KEY (`id_detalle_cronograma`) REFERENCES `detalle_cronograma` (`id_detalle_cronograma`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`nid_persona`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (276,'INGRESO',300.00,'POR PAGAR',NULL,52,11),(277,'INGRESO',300.00,'POR PAGAR',NULL,52,12),(278,'INGRESO',300.00,'POR PAGAR',NULL,52,13),(279,'INGRESO',300.00,'POR PAGAR',NULL,52,14),(280,'INGRESO',300.00,'POR PAGAR',NULL,52,15),(281,'INGRESO',300.00,'POR PAGAR',NULL,52,16),(282,'INGRESO',300.00,'POR PAGAR',NULL,52,17),(283,'INGRESO',300.00,'POR PAGAR',NULL,52,18),(284,'INGRESO',300.00,'POR PAGAR',NULL,52,19),(285,'INGRESO',300.00,'POR PAGAR',NULL,52,20),(286,'INGRESO',300.00,'PAGADO','2024-02-10 05:00:00',52,21),(287,'INGRESO',300.00,'POR PAGAR',NULL,53,11),(288,'INGRESO',300.00,'POR PAGAR',NULL,53,12),(289,'INGRESO',300.00,'POR PAGAR',NULL,53,13),(290,'INGRESO',300.00,'POR PAGAR',NULL,53,14),(291,'INGRESO',300.00,'POR PAGAR',NULL,53,15),(292,'INGRESO',300.00,'POR PAGAR',NULL,53,16),(293,'INGRESO',300.00,'POR PAGAR',NULL,53,17),(294,'INGRESO',300.00,'POR PAGAR',NULL,53,18),(295,'INGRESO',300.00,'POR PAGAR',NULL,53,19),(296,'INGRESO',300.00,'POR PAGAR',NULL,53,20),(297,'INGRESO',300.00,'PAGADO','2024-02-10 05:00:00',53,21),(298,'INGRESO',450.00,'PAGADO','2024-02-10 05:00:00',54,22),(299,'INGRESO',450.00,'POR PAGAR',NULL,54,23),(300,'INGRESO',450.00,'POR PAGAR',NULL,54,24),(301,'INGRESO',450.00,'POR PAGAR',NULL,54,25),(302,'INGRESO',450.00,'POR PAGAR',NULL,54,26),(303,'INGRESO',450.00,'POR PAGAR',NULL,54,27),(304,'INGRESO',450.00,'POR PAGAR',NULL,54,28),(305,'INGRESO',450.00,'POR PAGAR',NULL,54,29),(306,'INGRESO',450.00,'POR PAGAR',NULL,54,30),(307,'INGRESO',450.00,'POR PAGAR',NULL,54,31),(308,'INGRESO',450.00,'POR PAGAR',NULL,54,32),(309,'INGRESO',300.00,'POR PAGAR',NULL,55,11),(310,'INGRESO',300.00,'POR PAGAR',NULL,55,12),(311,'INGRESO',300.00,'POR PAGAR',NULL,55,13),(312,'INGRESO',300.00,'POR PAGAR',NULL,55,14),(313,'INGRESO',300.00,'POR PAGAR',NULL,55,15),(314,'INGRESO',300.00,'POR PAGAR',NULL,55,16),(315,'INGRESO',300.00,'POR PAGAR',NULL,55,17),(316,'INGRESO',300.00,'POR PAGAR',NULL,55,18),(317,'INGRESO',300.00,'POR PAGAR',NULL,55,19),(318,'INGRESO',300.00,'POR PAGAR',NULL,55,20),(319,'INGRESO',300.00,'PAGADO','2024-02-10 05:00:00',55,21),(320,'INGRESO',450.00,'PAGADO','2024-02-10 05:00:00',56,22),(321,'INGRESO',450.00,'POR PAGAR',NULL,56,23),(322,'INGRESO',450.00,'POR PAGAR',NULL,56,24),(323,'INGRESO',450.00,'POR PAGAR',NULL,56,25),(324,'INGRESO',450.00,'POR PAGAR',NULL,56,26),(325,'INGRESO',450.00,'POR PAGAR',NULL,56,27),(326,'INGRESO',450.00,'POR PAGAR',NULL,56,28),(327,'INGRESO',450.00,'POR PAGAR',NULL,56,29),(328,'INGRESO',450.00,'POR PAGAR',NULL,56,30),(329,'INGRESO',450.00,'POR PAGAR',NULL,56,31),(330,'INGRESO',450.00,'POR PAGAR',NULL,56,32),(331,'INGRESO',450.00,'PAGADO','2024-02-10 05:00:00',57,22),(332,'INGRESO',450.00,'POR PAGAR',NULL,57,23),(333,'INGRESO',450.00,'POR PAGAR',NULL,57,24),(334,'INGRESO',450.00,'POR PAGAR',NULL,57,25),(335,'INGRESO',450.00,'POR PAGAR',NULL,57,26),(336,'INGRESO',450.00,'POR PAGAR',NULL,57,27),(337,'INGRESO',450.00,'POR PAGAR',NULL,57,28),(338,'INGRESO',450.00,'POR PAGAR',NULL,57,29),(339,'INGRESO',450.00,'POR PAGAR',NULL,57,30),(340,'INGRESO',450.00,'POR PAGAR',NULL,57,31),(341,'INGRESO',450.00,'POR PAGAR',NULL,57,32);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `nid_persona` int NOT NULL AUTO_INCREMENT,
  `nom_persona` varchar(50) DEFAULT NULL,
  `ape_pate_pers` varchar(50) DEFAULT NULL,
  `ape_mate_pers` varchar(50) DEFAULT NULL,
  `nid_grado` int DEFAULT NULL,
  `fecha_naci` date DEFAULT NULL,
  `foto_ruta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nid_persona`),
  KEY `fk_persona_grado` (`nid_grado`),
  CONSTRAINT `fk_persona_grado` FOREIGN KEY (`nid_grado`) REFERENCES `grado` (`nid_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (52,'Cristano Ronaldo','Dos Santos','Aveiro',1,'1985-02-21',NULL),(53,'Zinédine','Yazid','Zidane',1,'1985-02-22','/uploads/personas/c9a17cd8-d78f-4a66-b2e6-0192ab4f03ea_unnamed.png'),(54,'Roberto','Carlos','Da Silva',5,'1990-02-28','/uploads/personas/be4a17aa-7975-4153-ab22-3920d327ed4f_1bwDn0-LogoMakr.png'),(55,'David Robert','Joseph','Beckham',1,'1981-02-18','/uploads/personas/10b53420-3487-4c76-8f90-ac8591f6e812_logo_fastmarket.png'),(56,'Luka','Modrić','Zadar',5,'1962-02-14','/uploads/personas/f68423f1-1adf-43ba-bafb-5b12287c0341_1bwDn0-LogoMakr.png'),(57,'Paolo','Cesare','Maldini',5,'1937-02-25',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-10 12:24:45
