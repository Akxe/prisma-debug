-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: email.agereklama.cz    Database: prisma_enum_regression
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `zakazky`
--

DROP TABLE IF EXISTS `zakazky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakazky` (
  `idZak` smallint unsigned NOT NULL AUTO_INCREMENT,
  `ZNazev` varchar(45) NOT NULL,
  `zMena` enum('Kč','€','c€') NOT NULL DEFAULT 'Kč',
  `zKorp` enum('normal','prodejny','korporace') NOT NULL DEFAULT 'normal',
  `zVazba` enum('kopie','pokračování','agentura','korp agent','doplnění','prodloužení') DEFAULT NULL,
  PRIMARY KEY (`idZak`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakazky`
--

LOCK TABLES `zakazky` WRITE;
/*!40000 ALTER TABLE `zakazky` DISABLE KEYS */;
INSERT INTO `zakazky` VALUES (1,'test 1','Kč','normal',NULL),(2,'Test 2','Kč','normal',NULL),(3,'test - test klient','Kč','normal','agentura'),(4,'test 4','Kč','normal',NULL),(5,'test','Kč','normal','agentura'),(6,'test 6','Kč','normal',NULL),(7,'test 7','Kč','normal',NULL),(8,'test 6 - doplnění','Kč','normal','doplnění'),(9,'test 4','Kč','normal','pokračování'),(10,'Test EUR','€','normal',NULL),(13,'Banská Bystrica','c€','korporace','pokračování'),(14,'Bratislava','c€','korporace','pokračování'),(15,'Dunajská Streda','c€','korporace','pokračování'),(16,'Košice','c€','korporace','pokračování'),(17,'Martin','c€','korporace','pokračování'),(18,'Nitra','c€','korporace','pokračování'),(19,'Poprad','c€','korporace','pokračování'),(20,'Prešov','c€','korporace','pokračování'),(21,'Prievidza','c€','korporace','pokračování'),(22,'Trenčín','c€','korporace','pokračování'),(23,'Trnava','c€','korporace','pokračování'),(24,'Žilina','c€','korporace','pokračování'),(25,'Spišská Nová Ves','c€','korporace',NULL),(26,'Michalovce','c€','korporace',NULL),(201,'Ostrava','Kč','korporace',NULL),(202,'Cheb','Kč','korporace',NULL),(203,'Litoměřice','Kč','korporace',NULL),(204,'Lanškroun','Kč','korporace',NULL),(205,'Louny','Kč','korporace',NULL),(206,'Pardubice','Kč','korporace',NULL),(207,'Mariánské Lázně','Kč','korporace',NULL),(208,'Chomutov','Kč','korporace',NULL),(209,'Náchod','Kč','korporace',NULL),(210,'Třeboň','Kč','korporace',NULL),(211,'Děčín','Kč','korporace',NULL),(212,'Plzeň','Kč','korporace',NULL),(213,'Vrchlabí','Kč','korporace',NULL),(214,'Most','Kč','korporace',NULL),(215,'Varnsdorf','Kč','korporace',NULL),(216,'Kladno','Kč','korporace',NULL),(217,'Jaroměř','Kč','korporace',NULL),(218,'Mladá Boleslav','Kč','korporace',NULL),(219,'Brno','Kč','korporace',NULL),(220,'Zlín','Kč','korporace',NULL),(221,'Uherské Hradiště','Kč','korporace',NULL),(222,'Liberec','Kč','korporace',NULL),(223,'Hranice','Kč','korporace',NULL),(224,'Beroun','Kč','korporace',NULL),(225,'Třebíč','Kč','korporace',NULL),(226,'České Budějovice','Kč','korporace',NULL),(227,'Mělník','Kč','korporace',NULL),(228,'Třinec','Kč','korporace',NULL),(229,'Šumperk','Kč','korporace',NULL),(230,'Písek','Kč','korporace',NULL),(231,'Frýdek Místek','Kč','korporace',NULL),(232,'Přerov','Kč','korporace',NULL),(233,'Sokolov','Kč','korporace',NULL),(234,'Chrudim','Kč','korporace',NULL),(235,'Kuřim','Kč','korporace',NULL),(236,'Teplice','Kč','korporace',NULL),(237,'Znojmo','Kč','korporace',NULL),(238,'Ústí nad Labem','Kč','korporace',NULL),(239,'Prostějov','Kč','korporace',NULL),(240,'Pelhřimov','Kč','korporace',NULL),(241,'Karlovy Vary','Kč','korporace',NULL),(242,'Havířov','Kč','korporace',NULL),(243,'Domažlice','Kč','korporace',NULL),(244,'Tábor','Kč','korporace',NULL),(245,'Jihlava','Kč','korporace',NULL),(246,'Žatec','Kč','korporace',NULL),(247,'Opava','Kč','korporace',NULL),(248,'Svitavy','Kč','korporace',NULL),(249,'Jablonec nad Nisou','Kč','korporace',NULL),(250,'Benešov','Kč','korporace',NULL),(251,'Karviná','Kč','korporace',NULL),(252,'Kolín','Kč','korporace',NULL),(253,'Strakonice','Kč','korporace',NULL),(254,'Rokycany','Kč','korporace',NULL),(255,'Slaný','Kč','korporace',NULL),(256,'Trutnov','Kč','korporace',NULL),(257,'Dvůr Králové ','Kč','korporace',NULL),(258,'Hradec Králové','Kč','korporace',NULL),(259,'Uherský Brod','Kč','korporace',NULL),(260,'Kroměříž','Kč','korporace',NULL),(261,'Hodonín','Kč','korporace',NULL),(262,'Vsetín','Kč','korporace',NULL),(263,'Bohumín','Kč','korporace',NULL),(264,'Příbram','Kč','korporace',NULL),(265,'Nymburk','Kč','korporace',NULL),(266,'Brandýs n. Labem','Kč','korporace',NULL),(267,'Nový Jičín','Kč','korporace',NULL),(268,'Vyškov','Kč','korporace',NULL),(269,'Jeseník','Kč','korporace',NULL),(270,'Česká Lípa','Kč','korporace',NULL),(271,'Orlová','Kč','korporace',NULL),(272,'Blansko','Kč','korporace',NULL),(273,'Bruntál','Kč','korporace',NULL),(274,'Kopřivnice','Kč','korporace',NULL),(275,'Olomouc','Kč','korporace',NULL),(276,'Jičín','Kč','korporace',NULL);
/*!40000 ALTER TABLE `zakazky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prisma_enum_regression'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 22:06:31
