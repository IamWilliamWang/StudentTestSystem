-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: testsystemdb
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_account`
--

DROP TABLE IF EXISTS `admin_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_account`
--

LOCK TABLES `admin_account` WRITE;
/*!40000 ALTER TABLE `admin_account` DISABLE KEYS */;
INSERT INTO `admin_account` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `is_choice_question` tinyint(4) unsigned NOT NULL,
  `is_single_choice_question` tinyint(4) unsigned NOT NULL,
  `option_A` varchar(100) DEFAULT NULL,
  `option_B` varchar(100) DEFAULT NULL,
  `option_C` varchar(100) DEFAULT NULL,
  `option_D` varchar(100) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'0-1=',1,1,'0','-1','-2','1','B'),(2,'5-9=',1,1,'0','-1','-2','-4','D'),(3,'5/2=',1,1,'0.5','1.5','2.5','3.5','C'),(4,'1+1=',1,1,'0','1','2','3','C'),(5,'1*3=',1,1,'0','1','2','3','D'),(6,'3/3=',1,1,'0','1','2','3','B'),(7,'5+3=',1,1,'8','4','2','12','A'),(8,'13+1=',1,1,'4','1','14','12','C'),(9,'此题选择ABC',1,0,'。。。','。。。','。。','。。','ABC'),(10,'此题选择ABCD',1,0,'。。。','。。。','。。','。。','ABCD'),(11,'此题选择ACD',1,0,'。。。','。。。','。','。。','ACD'),(12,'此题选择AD',1,0,'。。。','。。','。','。。','AD'),(13,'此题选择BD',1,0,'。。。','。。','。','。。','BD'),(14,'此题选择BCD',1,0,'。。。','。。','。','。。','BCD'),(15,'此题选择ABCD',1,0,'。','。。','。','。。','ABCD'),(16,'此题选择AD',1,0,'。','。。。。。','。','。。','AD'),(17,'1+3=4',0,0,NULL,NULL,NULL,NULL,'T'),(18,'10*2=5',0,0,NULL,NULL,NULL,NULL,'F'),(19,'10*20=200',0,0,NULL,NULL,NULL,NULL,'T'),(20,'20*6=120',0,0,NULL,NULL,NULL,NULL,'T'),(21,'20/4=10',0,0,NULL,NULL,NULL,NULL,'F'),(22,'4*6=24',0,0,NULL,NULL,NULL,NULL,'T'),(23,'6/4=1.5',0,0,NULL,NULL,NULL,NULL,'T'),(24,'5/3=2',0,0,NULL,NULL,NULL,NULL,'F'),(25,'这道题是正确的',0,0,NULL,NULL,NULL,NULL,'T'),(26,'这道题就是正确的',0,0,NULL,NULL,NULL,NULL,'T'),(27,'这道题不是正确的',0,0,NULL,NULL,NULL,NULL,'F'),(28,'这道题是错误的',0,0,NULL,NULL,NULL,NULL,'F');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_mode` tinyint(4) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(50) NOT NULL,
  `test_time` varchar(50) NOT NULL,
  PRIMARY KEY (`setting_mode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'2017-05-25 09:00:00','2:00:00');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_account`
--

DROP TABLE IF EXISTS `student_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_account`
--

LOCK TABLES `student_account` WRITE;
/*!40000 ALTER TABLE `student_account` DISABLE KEYS */;
INSERT INTO `student_account` VALUES ('10000','10000'),('123','123');
/*!40000 ALTER TABLE `student_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-31 14:04:14
