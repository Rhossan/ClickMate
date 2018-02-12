-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: sys
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `AccountNumber` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `userdata` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (900001,100001),(900002,100002),(900003,100003),(900004,100004),(900005,100005),(900006,100006),(900007,100007),(900008,100008),(900009,100009),(900010,100010),(900011,100011),(900012,100012),(900013,100013),(900014,100014),(900015,100015),(900016,100016),(900017,100017),(900018,100018),(900019,100019),(900020,100020),(900021,100021),(900022,100022),(900023,100023),(900024,100024),(900025,100025),(900026,100026),(900027,100027),(900028,100028),(900029,100029),(900030,100030),(900031,100031),(900032,100032),(900033,100033),(900034,100034),(900035,100035),(900036,100036);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisementdata`
--

DROP TABLE IF EXISTS `advertisementdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisementdata` (
  `AdvertisementID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `AdvertisementType` char(20) DEFAULT NULL,
  `Company` varchar(20) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `NumberOfUnits` int(11) DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  PRIMARY KEY (`AdvertisementID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `advertisementdata_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employeedata` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisementdata`
--

LOCK TABLES `advertisementdata` WRITE;
/*!40000 ALTER TABLE `advertisementdata` DISABLE KEYS */;
INSERT INTO `advertisementdata` VALUES (1002,114,'Electronics','Microsoft','2016-11-02','Laptop','Asus laptop',1000,599.99),(1003,114,'Entertainment','Rockstar','2016-11-03','Video Game','GTA V',1000,59.99),(1004,114,'Entertainment','Bethesda','2016-11-04','Video Game','Skyrim',1000,59.99),(1005,114,'Entertainment','Ubisoft','2016-11-10','Video Game','Assassins Creed',1000,59.99),(1090,117,'Toys/Personal','Playboy','2016-12-25','Adult Toy','Big Black ****',1000,49.99),(1091,115,'Drugs','Playboy','2016-10-29','Male Enhancement','Extenzee',1000,49.99),(1092,115,'Dating','Subscription','2016-10-05','Dating website','Tinder',NULL,9.99),(1093,115,'Adult','Pornhub','2016-11-01','Adult Streaming','Pornhub',NULL,NULL),(2010,111,'Electronics','Cell Phone','2016-12-05','Cell Phone','IPhone 7',1000,799.99),(2011,111,'Electronics','Vizio','2016-12-05','Vizio TV','Vizio TCL 50',500,999.99),(3001,112,'Website','Amazon','2016-05-01','Video Streaming','Amazon Prime',NULL,9.99),(3002,112,'Website','Netflix','2016-05-01','Video streaming','Netflix',NULL,10.99),(3003,112,'Website','Hulu','2016-05-01','Video streaming','Hulu',NULL,9.99),(5001,113,'Food','EdibleArrangements','2016-11-01','Sweets','Chocolate bouquet',1000,29.99),(7001,113,'Electronics','Nikon','2016-10-01','Camera','COOLPIX L830 16 MP 30x',750,399.99);
/*!40000 ALTER TABLE `advertisementdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentpost`
--

DROP TABLE IF EXISTS `commentpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentpost` (
  `CommentID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  PRIMARY KEY (`CommentID`,`PostID`),
  KEY `PostID` (`PostID`),
  CONSTRAINT `commentpost_ibfk_1` FOREIGN KEY (`CommentID`) REFERENCES `commentsdata` (`CommentID`),
  CONSTRAINT `commentpost_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `postdata` (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentpost`
--

LOCK TABLES `commentpost` WRITE;
/*!40000 ALTER TABLE `commentpost` DISABLE KEYS */;
INSERT INTO `commentpost` VALUES (1,14),(2,14),(3,14),(4,14),(5,14),(6,14),(7,14),(8,14),(9,14),(10,14);
/*!40000 ALTER TABLE `commentpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentsdata`
--

DROP TABLE IF EXISTS `commentsdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentsdata` (
  `CommentID` int(11) NOT NULL,
  `DateTimeCreated` datetime DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  `LikedCount` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `Author` (`Author`),
  CONSTRAINT `commentsdata_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentsdata`
--

LOCK TABLES `commentsdata` WRITE;
/*!40000 ALTER TABLE `commentsdata` DISABLE KEYS */;
INSERT INTO `commentsdata` VALUES (1,'2016-11-11 11:11:11','SHOW ME WHAT YOU GOT',0,900030),(2,'2016-11-11 11:12:11','ALLAH HU AKHBAR',0,900023),(3,'2016-11-11 11:13:11','HEY GUY',0,900022),(4,'2016-11-11 11:14:11','DONT CALL ME GUY, BUDDY',0,900023),(5,'2016-11-11 11:15:11','DONT CALL ME BUDDY, GUY',0,900022),(6,'2016-11-11 11:15:11','I LIKE CHEESE',0,900027),(7,'2016-11-11 11:15:11','HEY! WE DONT TAKE WELL TO YOUR KIND',0,900023),(8,'2016-11-11 11:15:11','GUYS, THERE IS AN INTRUDER IN MY HOME',0,900030),(9,'2016-11-11 11:15:11','HE HAS A GUN',0,900030),(10,'2016-11-11 11:15:11','GG BRO GET REKT',0,900023);
/*!40000 ALTER TABLE `commentsdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedata`
--

DROP TABLE IF EXISTS `employeedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeedata` (
  `SSN` int(11) DEFAULT NULL,
  `EmployeeID` int(11) NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `Telephone` bigint(20) DEFAULT NULL,
  `HourlyRate` double DEFAULT NULL,
  `AuthenicationLevel` char(1) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `SSN` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedata`
--

LOCK TABLES `employeedata` WRITE;
/*!40000 ALTER TABLE `employeedata` DISABLE KEYS */;
INSERT INTO `employeedata` VALUES (345267845,111,'moal',11790,'New York','Stony Brook','32 ST, 10 AVE','Ali','Mohammad','2016-12-01',3479217900,21.5,'C'),(456346985,112,'jiha',11790,'New York','Stony Brook','35 ST, 10 AVE','Halpert','Jim','2016-03-01',347856456,23,'C'),(753287956,113,'pabe',11790,'New York','Stony Brook','37 ST, 10 AVE','Beesly','Pam','2016-09-01',347542456,21.5,'C'),(935726806,114,'dwsc',11790,'New York','Stony Brook','39 ST, 10 AVE','Schrute','Dwight','2016-11-01',718543567,21.5,'C'),(240156845,115,'kema',11790,'New York','Stony Brook','41 ST, 10 AVE','Malone','Kevin','2016-10-01',718642356,21.5,'C'),(96462678,116,'anma',11790,'New York','Stony Brook','11 ST, 08 AVE','Martin','Angela','2016-12-01',718986452,24.5,'C'),(986463569,117,'phva',11790,'New York','Stony Brook','35 ST, 08 AVE','Vance','Phyllus','2016-12-01',718563456,21.5,'C'),(436857357,118,'crbr',11790,'New York','Stony Brook','40 ST, 08 AVE','Bratton','Creed','2016-11-01',718764764,22.5,'C'),(86456786,119,'hory',11790,'New York','Stony Brook','50 ST, 08 AVE','Ryan','Howard','2016-11-01',718234654,21.5,'C'),(764368964,120,'kake',11790,'New York','Stony Brook','60 ST, 08 AVE','Kelly','Kapoor','2016-12-01',718675888,28.5,'C'),(935165890,121,'misc',11790,'New York','Stony Brook','32 ST, 10 AVE','Scott','Michael','2016-01-01',9175554455,31.5,'M');
/*!40000 ALTER TABLE `employeedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupdata`
--

DROP TABLE IF EXISTS `groupdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupdata` (
  `GroupID` int(11) NOT NULL,
  `GroupType` char(15) DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `GroupName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GroupID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `groupdata_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupdata`
--

LOCK TABLES `groupdata` WRITE;
/*!40000 ALTER TABLE `groupdata` DISABLE KEYS */;
INSERT INTO `groupdata` VALUES (200000,'Friends',900021,'My Friends'),(200001,'Friends',900001,'My Friends'),(200002,'Friends',900002,'Best Friends'),(200003,'Friends',900003,'StonyBrookGang'),(200004,'Friends',900004,'CS Folks'),(200005,'Friends',900005,'My Family'),(200006,'Groupies',900006,'Microsoft Groupies'),(200007,'SBCS',900021,'THIS IS A TEST'),(200008,'BDSM',900022,'MYLITTLEPONY'),(200009,'Dating',900023,'MidgetsR_us'),(200010,'Dating',900023,'FreaksAndGeeks'),(200011,'Dating',900023,'Tinder2.0'),(200012,'Adult Cartoons',900023,'Tentacles'),(200013,'Comedy',900023,'Seinfeld Pics'),(200014,'Miscellaneous',900023,'Food Porn'),(200015,'DarkWeb',900023,'Weed'),(200016,'Porn',900023,'TotallyNormalStuff');
/*!40000 ALTER TABLE `groupdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmembers`
--

DROP TABLE IF EXISTS `groupmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupmembers` (
  `GroupID` int(11) NOT NULL,
  `AccountNumber` int(11) NOT NULL,
  PRIMARY KEY (`GroupID`,`AccountNumber`),
  KEY `AccountNumber` (`AccountNumber`),
  CONSTRAINT `groupmembers_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `groupdata` (`GroupID`),
  CONSTRAINT `groupmembers_ibfk_2` FOREIGN KEY (`AccountNumber`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupmembers`
--

LOCK TABLES `groupmembers` WRITE;
/*!40000 ALTER TABLE `groupmembers` DISABLE KEYS */;
INSERT INTO `groupmembers` VALUES (200015,900021),(200016,900021),(200009,900022),(200011,900022),(200016,900022),(200008,900023),(200008,900024),(200010,900024),(200016,900024),(200015,900025),(200016,900025),(200008,900026),(200016,900026),(200009,900027),(200016,900027),(200010,900028),(200016,900028),(200009,900029),(200010,900029),(200011,900029),(200012,900029),(200015,900029),(200016,900029),(200008,900030),(200014,900030),(200016,900030),(200009,900031),(200016,900031),(200012,900032),(200016,900032),(200011,900033),(200013,900033),(200014,900033),(200016,900033),(200010,900034),(200011,900034),(200013,900034),(200016,900034),(200016,900035),(200016,900036);
/*!40000 ALTER TABLE `groupmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouppage`
--

DROP TABLE IF EXISTS `grouppage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouppage` (
  `GroupId` int(11) NOT NULL,
  `PageID` int(11) NOT NULL,
  `DateTimeCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`GroupId`,`PageID`),
  KEY `PageID` (`PageID`),
  CONSTRAINT `grouppage_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `groupdata` (`GroupID`),
  CONSTRAINT `grouppage_ibfk_2` FOREIGN KEY (`PageID`) REFERENCES `pagedata` (`PageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouppage`
--

LOCK TABLES `grouppage` WRITE;
/*!40000 ALTER TABLE `grouppage` DISABLE KEYS */;
INSERT INTO `grouppage` VALUES (200000,37,'2016-11-07 00:00:00'),(200001,38,'2016-11-07 00:00:00'),(200002,39,'2016-11-07 00:00:00'),(200003,40,'2016-11-07 00:00:00'),(200004,41,'2016-11-07 00:00:00'),(200005,42,'2016-11-07 00:00:00'),(200006,43,'2016-11-07 00:00:00'),(200007,44,'2016-11-07 00:00:00'),(200008,45,'2016-11-07 00:00:00'),(200009,46,'2016-11-08 00:00:00'),(200010,47,'2016-11-08 00:00:00'),(200011,48,'2016-11-08 00:00:00'),(200012,49,'2016-11-08 00:00:00'),(200013,50,'2016-11-08 00:00:00'),(200014,51,'2016-11-08 00:00:00'),(200015,52,'2016-11-08 00:00:00'),(200016,53,'2016-11-08 00:00:00');
/*!40000 ALTER TABLE `grouppage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecomment`
--

DROP TABLE IF EXISTS `likecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likecomment` (
  `CommentID` int(11) NOT NULL,
  `AccountNumber` int(11) NOT NULL,
  PRIMARY KEY (`CommentID`,`AccountNumber`),
  KEY `AccountNumber` (`AccountNumber`),
  CONSTRAINT `likecomment_ibfk_1` FOREIGN KEY (`CommentID`) REFERENCES `commentsdata` (`CommentID`),
  CONSTRAINT `likecomment_ibfk_2` FOREIGN KEY (`AccountNumber`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecomment`
--

LOCK TABLES `likecomment` WRITE;
/*!40000 ALTER TABLE `likecomment` DISABLE KEYS */;
INSERT INTO `likecomment` VALUES (2,900021),(2,900022),(2,900023),(2,900024),(2,900025),(2,900026),(2,900027),(2,900029),(2,900030),(2,900031),(2,900033);
/*!40000 ALTER TABLE `likecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likepost`
--

DROP TABLE IF EXISTS `likepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likepost` (
  `AccountNumber` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  PRIMARY KEY (`AccountNumber`,`PostID`),
  KEY `PostID` (`PostID`),
  CONSTRAINT `likepost_ibfk_1` FOREIGN KEY (`AccountNumber`) REFERENCES `accounts` (`AccountNumber`),
  CONSTRAINT `likepost_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `postdata` (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likepost`
--

LOCK TABLES `likepost` WRITE;
/*!40000 ALTER TABLE `likepost` DISABLE KEYS */;
INSERT INTO `likepost` VALUES (900022,0),(900023,0),(900024,0),(900025,0),(900026,0),(900027,0),(900028,0),(900029,0),(900030,0),(900031,0),(900032,0);
/*!40000 ALTER TABLE `likepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagesdata`
--

DROP TABLE IF EXISTS `messagesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagesdata` (
  `MessageID` int(11) NOT NULL,
  `Sender` int(11) DEFAULT NULL,
  `Receiver` int(11) DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `SubjectLine` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `Sender` (`Sender`),
  KEY `Receiver` (`Receiver`),
  CONSTRAINT `messagesdata_ibfk_1` FOREIGN KEY (`Sender`) REFERENCES `accounts` (`AccountNumber`),
  CONSTRAINT `messagesdata_ibfk_2` FOREIGN KEY (`Receiver`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagesdata`
--

LOCK TABLES `messagesdata` WRITE;
/*!40000 ALTER TABLE `messagesdata` DISABLE KEYS */;
INSERT INTO `messagesdata` VALUES (1002,900035,900036,'WHERE R U?','2016-12-21 20:25:10','WTFF!'),(1003,900036,900035,'I AM HERE WHERE R U?','2016-12-21 20:25:30','WTFF!'),(1004,900035,900036,'I will wait outside the movie theater','2016-12-21 20:25:40','WTFF!'),(1005,900035,900036,'nvm I see you','2016-12-21 20:25:45','WTFF!'),(1006,900036,900035,'Did you get the parsing working for the hw?','2016-12-23 05:30:30','320 hw'),(1007,900036,900035,'my arrays dont fill in the values correctly','2016-12-23 05:30:50','320 hw'),(1008,900035,900036,'Did you try strtok?','2016-12-23 05:31:20','320 hw'),(1009,900035,900036,'nope, ok it works like charm','2016-12-23 06:00:10','320 hw'),(1010,900036,900035,'I asked karen out','2016-12-24 12:25:10',NULL),(1011,900036,900035,'She told me to go jump off a cliff','2016-12-24 12:25:11',NULL),(1012,900035,900036,'Oh that reminds me, I asked your sister to a date.','2016-12-24 12:40:10',NULL),(1013,900035,900036,'We are going out tomorrow night. Any advice?','2016-12-24 12:40:11',NULL),(1014,900036,900035,'I hate you','2016-12-24 12:45:00',NULL);
/*!40000 ALTER TABLE `messagesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagedata`
--

DROP TABLE IF EXISTS `pagedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagedata` (
  `PageID` int(11) NOT NULL,
  `PostCount` int(11) DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `PageName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PageID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `pagedata_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagedata`
--

LOCK TABLES `pagedata` WRITE;
/*!40000 ALTER TABLE `pagedata` DISABLE KEYS */;
INSERT INTO `pagedata` VALUES (1,0,900001,NULL),(2,0,900002,NULL),(3,0,900003,NULL),(4,0,900004,NULL),(5,0,900005,NULL),(6,0,900006,NULL),(7,0,900007,NULL),(8,0,900008,NULL),(9,0,900009,NULL),(10,0,900010,NULL),(11,0,900011,NULL),(12,0,900012,NULL),(13,0,900013,NULL),(14,0,900014,NULL),(15,0,900015,NULL),(16,0,900016,NULL),(17,0,900017,NULL),(18,0,900018,NULL),(19,0,900019,NULL),(20,0,900020,NULL),(21,0,900021,NULL),(22,0,900022,NULL),(23,0,900023,NULL),(24,0,900024,NULL),(25,0,900025,NULL),(26,0,900026,NULL),(27,0,900027,NULL),(28,0,900028,NULL),(29,0,900029,NULL),(30,0,900030,NULL),(31,0,900031,NULL),(32,0,900032,NULL),(33,0,900033,NULL),(34,0,900034,NULL),(35,0,900035,NULL),(36,0,900036,NULL),(37,0,900001,NULL),(38,0,900021,NULL),(39,0,900021,NULL),(40,0,900021,NULL),(41,0,900021,NULL),(42,14,900021,NULL),(43,0,900021,NULL),(44,0,900021,NULL),(45,0,900022,NULL),(46,0,900023,NULL),(47,0,900023,NULL),(48,0,900023,NULL),(49,0,900023,NULL),(50,0,900023,NULL),(51,0,900023,NULL),(52,0,900023,NULL),(53,0,900023,NULL);
/*!40000 ALTER TABLE `pagedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postdata`
--

DROP TABLE IF EXISTS `postdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postdata` (
  `PostID` int(11) NOT NULL,
  `PageID` int(11) DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `DateTimeCreated` datetime NOT NULL,
  `CommentCount` int(11) DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PostID`),
  KEY `PageID` (`PageID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `postdata_ibfk_1` FOREIGN KEY (`PageID`) REFERENCES `pagedata` (`PageID`) ON DELETE CASCADE,
  CONSTRAINT `postdata_ibfk_2` FOREIGN KEY (`OwnerID`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postdata`
--

LOCK TABLES `postdata` WRITE;
/*!40000 ALTER TABLE `postdata` DISABLE KEYS */;
INSERT INTO `postdata` VALUES (0,42,900021,'2016-12-24 12:40:11',0,'Swiggity Wiggly SomethingSomething'),(1,42,900022,'2016-12-24 12:42:11',0,'Swiggity Wiggly SomethingSomething'),(2,42,900023,'2016-12-24 12:50:11',0,'Swiggity Swagg SomethingSomething'),(3,42,900024,'2016-12-24 12:55:11',0,'Swiggity Swagg Im Something'),(4,42,900025,'2016-12-24 13:04:11',0,'Swiggity swiggity'),(5,42,900026,'2016-12-24 14:40:11',0,'Gitty Gitty'),(6,42,900027,'2016-12-24 14:45:11',0,'Goo'),(7,42,900028,'2016-12-24 14:46:11',0,'Its quagmire, quagmire'),(8,42,900029,'2016-12-24 14:48:11',0,'Gitty'),(9,42,900030,'2016-12-24 15:54:11',0,'gitty'),(10,42,900031,'2016-12-24 16:00:11',0,'gitty'),(11,42,900032,'2016-12-24 16:20:11',0,'gitty gitty'),(12,42,900033,'2016-12-24 16:24:11',0,'Guys stop spamming'),(13,42,900034,'2016-12-24 16:30:11',0,'NEVERRRRRRRRRRRRRR. Here I have power!!!'),(14,8,900021,'2016-12-24 12:40:11',10,'Swiggity');
/*!40000 ALTER TABLE `postdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesdata`
--

DROP TABLE IF EXISTS `salesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesdata` (
  `TransactionID` int(11) NOT NULL,
  `AdvertisementID` int(11) DEFAULT NULL,
  `AccountNumber` int(11) DEFAULT NULL,
  `DateTimeCreated` datetime DEFAULT NULL,
  `NumberOfUnits` int(11) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `AdvertisementID` (`AdvertisementID`),
  KEY `AccountNumber` (`AccountNumber`),
  CONSTRAINT `salesdata_ibfk_1` FOREIGN KEY (`AdvertisementID`) REFERENCES `advertisementdata` (`AdvertisementID`),
  CONSTRAINT `salesdata_ibfk_2` FOREIGN KEY (`AccountNumber`) REFERENCES `accounts` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesdata`
--

LOCK TABLES `salesdata` WRITE;
/*!40000 ALTER TABLE `salesdata` DISABLE KEYS */;
INSERT INTO `salesdata` VALUES (1,1090,900021,'2016-12-26 11:10:11',3),(2,1091,900025,'2016-12-10 11:10:11',5),(3,1004,900029,'2016-12-01 11:10:11',1),(4,1002,900030,'2016-12-13 11:10:11',7),(5,1092,900028,'2016-12-11 11:10:11',NULL),(6,1090,900027,'2016-12-27 11:10:11',3),(7,1093,900033,'2016-12-09 11:10:11',NULL),(8,3001,900021,'2016-12-11 11:10:11',3),(9,1090,900025,'2016-12-29 11:10:11',3);
/*!40000 ALTER TABLE `salesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdata` (
  `UserID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `UPassword` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `CreditCardNumber` int(11) DEFAULT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `AccountCreationDate` date NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Preferences` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES (100001,NULL,12345,'care2cash','Collins','Michael','','Washington','DC',953245619,'Michael.Collins@cse305.stonybrook.edu','2016-12-01','M',228807080,'1997-03-14','Slacklining,Skateboarding,Surfing,Orienteering,Water,sports'),(100002,NULL,10001,'dawn4call','Rose','Aria','','New York','NY',23468923,'Aria.Rose@cse305.stonybrook.edu','2016-12-01','F',263303749,'1991-11-05','Topiary,Jogging'),(100003,NULL,12345,'date6bell','Black','Jase','','Washington','DC',562478945,'Jase.Black@cse305.stonybrook.edu','2016-12-01','M',917443776,'2012-04-26','Rugby,Roller skating,Life insurance,Rock climbing,Scouting'),(100004,NULL,11794,'able1cash','Franklin','Ellie','','Stony Brook','NY',532467844,'Ellie.Franklin@cse305.stonybrook.edu','2016-12-01','F',381870672,'2009-03-09','Cars,Skydiving,Bird watching,Sailing,Shopping,Skimboarding,Kayaking,Camping,Blacksmithing'),(100005,NULL,10001,'burn2coat','Wells','Mackenzie','','New York','NY',435678076,'Mackenzie.Wells@cse305.stonybrook.edu','2016-12-01','F',736594241,'2004-09-14','Hunting,Topiary,Nordic skating,Foraging,Metal detecting,Camping,Astronomy'),(100006,NULL,10001,'aged6area','Armstrong','Cameron','','New York','NY',765436786,'Cameron.Armstrong@cse305.stonybrook.edu','2016-12-01','M',182209299,'2010-08-14','Skydiving,Topiary,Scuba diving,Sailing,Beekeeping,Tai chi,Brazilian jiu-jitsu,Astronomy,Jogging'),(100007,NULL,11794,'been6beer','Ross','Levi','','Stony Brook','NY',345724789,'Levi.Ross@cse305.stonybrook.edu','2016-12-01','M',127536938,'1991-06-07','Urban exploration,Freestyle football'),(100008,NULL,10001,'coal3cell','West','Levi','','New York','NY',768953567,'Levi.West@cse305.stonybrook.edu	coal3cell','2016-12-01','M',699136094,'2011-02-09','BASE jumping,Letterboxing,Roller skating,Metal detecting,Swimming,Mountaineering,Sculling or Rowing,Basketball,Surfing'),(100009,NULL,11794,'bush1bone','Davies','Christian','','Stony Brook','NY',862417890,'Christian.Davies@cse305.stonybrook.edu','2016-12-01','M',364390765,'2011-05-10','BASE jumping,Driving,Mountaineering'),(100010,NULL,10001,'coat7calm','Davies','Kylie','','New York','NY',95634712,'Kylie.Davies@cse305.stonybrook.edu','2016-12-01','F',562348521,'1996-11-22','Toys,Graffiti,Skiing,Road biking,Kayaking'),(100011,NULL,11794,'area3boom','Long','Tyler','','','Stony Brook',534267894,'Tyler.Long@cse305.stonybrook.edu','2016-12-01','M',306139234,'2007-01-08','Topiary,Basketball'),(100012,NULL,12345,'boat3also','Stewart','Henry','','Washington','DC',513568346,'Henry.Stewart@cse305.stonybrook.edu','2016-12-01','M',503422119,'2006-02-11','Roller skating,Netball,Flag football,Water sports'),(100013,NULL,12345,'book6bank','Bennett','Isaiah','','Washington','DC',984532678,'Isaiah.Bennett@cse305.stonybrook.edu','2016-12-01','M',929342276,'1997-12-24','Walking,Baseball,Scuba diving,Running,Shopping'),(100014,NULL,10001,'chip2calm','Dunn','Arianna','','New York','NY',984532678,'Arianna.Dunn@cse305.stonybrook.edu','2016-12-01','F',311083148,'2003-01-27','Shooting,Ghost hunting,Horseback riding,Netball,Astronomy'),(100015,NULL,10001,'cash7bush','Powell','Victoria','','New York','NY',984532678,'Victoria.Powell@cse305.stonybrook.edu','2016-12-01','F',854902993,'1997-04-28','LARPing,Walking,Slacklining,Foraging,Rock climbing,Taekwondo,Inline skating'),(100016,NULL,12345,'bear3cope','Alexander','Blakely','','Washington','DC',235753468,'Blakely.Alexander@cse305.stonybrook.edu','2016-12-01','M',140361398,'2006-01-21','Hooping,Bird watching,Shooting,Board sports,Graffiti,Sculling or Rowing'),(100017,NULL,10001,'ball1days','Collins','Conor','','New York','NY',123456788,'Connor.Collins@cse305.stonybrook.edu','2016-12-01','M',282433780,'2005-06-23','Rugby,Skiing,Snowboarding,Rock climbing,Swimming,Skimboarding,Scouting'),(100018,NULL,10001,'code3case','Miller','Jeremiah','','New York','NY',233457835,'Jeremiah.Miller@cse305.stonybrook.edu','2016-12-01','M',533130991,'1999-11-29','Urban exploration,Roller skating,Bird watching,Skiing,Kayaking,Mushroom hunting/Mycology'),(100019,NULL,10001,'cash7born','Field','Riley','','New York','NY',562478945,'Riley.Field@cse305.stonybrook.edu','2016-12-01','F',477174572,'2003-05-02','Photography,LARPing,Shooting,Archery,Kayaking,Fishing ,Astronomy'),(100020,NULL,10001,'away2bath','Phillips','Lucy','','New York','NY',532467844,'Lucy.Phillips@cse305.stonybrook.edu','2016-12-01','F',995652638,'1996-07-25','Parkour,Rock climbing,Handball,Surfing'),(100021,NULL,11377,'pass2','Banks','Elizabeth','124 ST, 1 AVE','Astoria','New York',123456788,'lizbanks@yahoo.com','2016-12-01','F',NULL,'1983-05-01',NULL),(100022,NULL,11377,'pass3','Banks','Gabriel','124 ST, 1 AVE','Astoria','New York',233457835,'gabebanks@yahoo.com','2016-12-01','M',NULL,'1981-12-09',NULL),(100023,NULL,11377,'pass4','Banks','Renton','124 ST, 1 AVE','Astoria','New York',562478945,'Rentonbanks@yahoo.com','2016-12-01','M',NULL,'1999-08-05',NULL),(100024,NULL,11377,'pass5','Banks','Kyle','124 ST, 1 AVE','Astoria','New York',532467844,'kylebanks@yahoo.com','2016-12-01','M',NULL,'1993-01-20',NULL),(100025,NULL,11377,'pass6','Banks','Jeremy','124 ST, 1 AVE','Astoria','New York',435678076,'Jeremybanks@yahoo.com','2016-12-01','M',NULL,'1996-03-24',NULL),(100026,NULL,11377,'pass1','Banks','Rick','124 ST, 1 AVE','Astoria','New York',765436786,'rickbanks@yahoo.com','2016-12-01','M',NULL,'2000-04-20',NULL),(100027,NULL,10027,'gds112','Schmidt','Dario','126 ST, 3 AVE','Manhattan','New York',345724789,'darioschmidt@yahoo.com','2016-12-01','M',NULL,'2000-06-11',NULL),(100028,NULL,10027,'gfsds','Schmidt','Ed','126 ST, 3 AVE','Manhattan','New York',768953567,'Edschmidt@yahoo.com','2016-12-01','M',NULL,'1996-09-11',NULL),(100029,NULL,10027,'gsdfgr','Schmidt','Al','126 ST, 3 AVE','Manhattan','New York',862417890,'Alschmidt@yahoo.com','2016-12-01','M',NULL,'1996-09-11',NULL),(100030,NULL,10027,'42wtt4','Schmidt','Mike','126 ST, 3 AVE','Manhattan','New York',95634712,'mikeschmidt@yahoo.com','2016-12-01','M',NULL,'2000-03-12',NULL),(100031,NULL,10027,'thy535','Schmidt','Matt','126 ST, 3 AVE','Manhattan','New York',534267894,'mattschmidt@yahoo.com','2016-12-01','M',NULL,'1993-02-04',NULL),(100032,NULL,10027,'y5rttr','Schmidt','Chris','126 ST, 3 AVE','Manhattan','New York',513568346,'chrisschmidt@yahoo.com','2016-12-01','M',NULL,'1960-12-23',NULL),(100033,NULL,10027,'y53ry5r','Schmidt','Christine','126 ST, 3 AVE','Manhattan','New York',984532678,'christineschmidt@yahoo.com','2016-12-01','F',NULL,'1965-02-01',NULL),(100034,NULL,10027,'sfgha','Schmidt','Christine','126 ST, 3 AVE','Manhattan','New York',984532678,'christineschmidt2@yahoo.com','2016-12-01','F',NULL,'1965-02-01',NULL),(100035,NULL,10027,'sfgha','Schmidt','Kylie','126 ST, 3 AVE','Manhattan','New York',984532678,'kylieschmidt@yahoo.com','2016-12-01','M',NULL,'2000-04-20',NULL),(100036,NULL,10027,'sfgha133','Schmidt','Kyrie','126 ST, 3 AVE','Manhattan','New York',235753468,'kyrieschmidt2@yahoo.com','2016-12-01','M',NULL,'2000-04-20',NULL);
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-08 15:11:56
