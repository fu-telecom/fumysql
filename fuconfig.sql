-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: fuconfig
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2-log

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
-- Current Database: `fuconfig`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fuconfig` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fuconfig`;

--
-- Table structure for table `directories`
--

DROP TABLE IF EXISTS `directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directories` (
  `directory_id` int(11) NOT NULL AUTO_INCREMENT,
  `directory_name` varchar(200) NOT NULL,
  `directory_filename` varchar(200) DEFAULT NULL,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`directory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directories`
--

LOCK TABLES `directories` WRITE;
/*!40000 ALTER TABLE `directories` DISABLE KEYS */;
INSERT INTO `directories` VALUES (1,'Unlisted',NULL,0),(2,'Theme Camp Directory','campdirectory.xml',1),(3,'FUT Corporate','FUTcorpdirectory.xml',0),(4,'Volunteer Departments','departmentdirectory.xml',0),(5,'Art','artcarsdirectory.xml',0),(6,'Pay Phones','payphonedirectory.xml',0),(7,'Public Address','PAdirectory.xml',0),(8,'Ranger','rangersdirectory.xml',0);
/*!40000 ALTER TABLE `directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_types`
--

DROP TABLE IF EXISTS `number_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_types` (
  `number_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `number_type_name` varchar(45) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `number_type_system_name` varchar(45) NOT NULL,
  `exclude_from_delete` tinyint(4) NOT NULL DEFAULT '0',
  `number_type_app_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_types`
--

LOCK TABLES `number_types` WRITE;
/*!40000 ALTER TABLE `number_types` DISABLE KEYS */;
INSERT INTO `number_types` VALUES (1,'Line',1,'line',0,'SCCP'),(2,'Speed Dial',0,'speeddial',0,'SCCP'),(3,'System Custom',0,'custom',1,'SCCP'),(4,'Sip',0,'sip',0,'SIP'),(5,'Random',0,'speeddial',0,'SCCP');
/*!40000 ALTER TABLE `number_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `number_id` int(11) NOT NULL AUTO_INCREMENT,
  `callerid` varchar(255) NOT NULL,
  `number` varchar(45) NOT NULL,
  `directory_id` int(11) NOT NULL,
  `number_type_id` int(11) NOT NULL,
  `todelete_number` tinyint(4) NOT NULL DEFAULT '0',
  `altered_number` tinyint(4) NOT NULL DEFAULT '0',
  `added_number` tinyint(4) NOT NULL DEFAULT '0',
  `sccpline_id` varchar(45) DEFAULT NULL,
  `sip_user` varchar(45) DEFAULT NULL,
  `sip_pass` varchar(45) DEFAULT NULL,
  `sippeer_id` varchar(45) DEFAULT NULL,
  `password_index` int(11) DEFAULT '1',
  PRIMARY KEY (`number_id`),
  KEY `numbers_to_directory_fk_idx` (`directory_id`),
  KEY `numbers_to_number_types_fk_idx` (`number_type_id`),
  CONSTRAINT `numbers_to_directory_fk` FOREIGN KEY (`directory_id`) REFERENCES `directories` (`directory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `numbers_to_number_types_fk` FOREIGN KEY (`number_type_id`) REFERENCES `number_types` (`number_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
INSERT INTO `numbers` VALUES (4,'COLLECTIONS','2655328',3,1,0,0,0,'2655328','','',NULL,1),(5,'RANDOM','726366',1,5,0,1,1,NULL,NULL,NULL,NULL,1),(6,'FUT SALES','4383858',3,1,0,0,0,'4383858','','',NULL,1),(8,'Cust Disservice','3825968',3,1,0,0,0,'3825968','','',NULL,1),(9,'OPERATOR','0',3,1,0,0,0,'0','','',NULL,1),(42,'West Payphone','3805',6,1,0,0,0,NULL,'ATA-23L1','ATA-23L1','640',1),(46,'N.Bad Payphone','3802',6,1,0,0,0,NULL,'ATA-25L1','ATA-25L1','631',1),(47,'Effigy Payphone','334',6,1,0,0,0,NULL,'ATA-24L1','ATA-24L1','646',1),(48,'XRoads Payphone','3806',6,1,0,0,0,NULL,'ATA-17L1','ATA-17L1','633',1),(59,'East Pager','7201',1,4,0,0,0,NULL,'PA36','PA36','634',1),(61,'XRoadsPager','7202',1,4,0,0,0,NULL,'PA6','PA6','635',1),(62,'West Pager','7203',1,4,0,0,0,NULL,'PA12','PA12','636',1),(109,'Kidvil Payphone','3804',6,1,0,0,0,NULL,'ATA-27L1','ATA-27L1','637',1),(110,'Greeter Payphone','3803',6,1,0,0,0,NULL,'ATA-20L1','ATA-20L1','638',1),(111,'Tech Support','7448224',3,1,0,0,0,NULL,'shitbag','shitbag','639',1),(112,'test','111',1,1,0,0,0,'111','','',NULL,1),(114,'tester','333',1,1,0,0,0,NULL,'3efb8','3efb8','641',1),(115,'RANGERS','999',8,1,0,0,0,'999',NULL,NULL,NULL,1),(116,'CampCamp','22672267',2,1,0,0,0,'22672267',NULL,NULL,NULL,1),(117,'Curmudgeon Camp','478679',2,1,0,0,0,'478679',NULL,NULL,NULL,1),(118,'FACELAZERS','3223529377',2,1,0,0,0,'3223529377',NULL,NULL,NULL,1),(119,'YAY','929',2,1,0,0,0,'929','','',NULL,1),(120,'DHABA','34222',2,1,0,0,0,'34222',NULL,NULL,NULL,1),(121,'Snail Tinder','786',2,1,0,0,0,'786',NULL,NULL,NULL,1),(122,'PHHH','4697976',2,1,0,0,0,'4697976',NULL,NULL,NULL,1),(124,'MISFITS','15556473487',2,1,0,0,0,'15556473487',NULL,NULL,NULL,1),(126,'ILL Ananas','262627',2,1,0,0,0,'262627',NULL,NULL,NULL,1),(128,'Circle of Water','438938',2,1,0,0,0,'438938',NULL,NULL,NULL,1),(130,'SO SASSY','666',2,1,0,0,0,'666',NULL,NULL,NULL,1),(131,'Sens Station','76779',2,1,0,0,0,'76779',NULL,NULL,NULL,1),(133,'Bass Gravy','976',2,1,0,0,0,'976',NULL,NULL,NULL,1),(134,'Aquanaughties','6682782',2,1,0,0,0,'6682782',NULL,NULL,NULL,1),(135,'Chill TF Out','24455',2,1,0,0,0,'24455',NULL,NULL,NULL,1),(136,'Tiki Kiki','28887',2,1,0,0,0,'28887',NULL,NULL,NULL,1),(137,'ICE','423',4,1,0,0,0,'423',NULL,NULL,NULL,1),(138,'Jammie','526643',2,1,0,0,0,'526643',NULL,NULL,NULL,1),(139,'1 800 MEOW','18006369',2,1,0,0,0,'18006369',NULL,NULL,NULL,1),(140,'Punk in Drublic','666999',2,1,0,0,0,'666999',NULL,NULL,NULL,1),(141,'CHRISTMAS TOWN','72682',2,1,0,0,0,'72682',NULL,NULL,NULL,1),(142,'Badlands HOA','2462',2,1,0,0,0,'2462','','',NULL,1),(145,'Cosmic Creatures','267642',2,1,0,0,0,'267642',NULL,NULL,NULL,1),(148,'Arson Around','27766',2,1,0,0,0,'27766','','',NULL,1),(149,'Stamp Camp','1800782678',2,1,0,0,0,'1800782678','','',NULL,1),(151,'WonderFuckers','420',2,1,0,0,0,'420','','',NULL,1),(152,'Velvet Pocket','41187',2,1,0,0,0,NULL,'899a6','899a6','642',1),(155,'KFLIP','1005',2,4,0,0,0,NULL,'8abfa','8abfa','643',1),(156,'Lava Lounge','5282',2,1,0,0,0,NULL,'827dc','827dc','644',1),(157,'Trailer Park','872',2,1,0,0,0,NULL,'85d94','85d94','645',1);
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgs`
--

DROP TABLE IF EXISTS `orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgs` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `org_contactname` varchar(255) DEFAULT NULL,
  `org_contactemail` varchar(255) DEFAULT NULL,
  `org_contactphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgs`
--

LOCK TABLES `orgs` WRITE;
/*!40000 ALTER TABLE `orgs` DISABLE KEYS */;
INSERT INTO `orgs` VALUES (1,'1 FUT HQ','','',''),(28,'1 FUT Payphones','','',''),(29,'0 - test','ben','testing@gmail.com','1234'),(30,'1 - FUT Repeaters','','',''),(31,'1 Pagers','','',''),(33,'testing org','','',''),(34,'Ranger HQ','','',''),(35,'Camp Camp','','',''),(36,'Curmudgeons','','',''),(37,'FaceLazers','','',''),(38,'Yayborhood','','',''),(39,'Dhaba','','',''),(40,'Snail Tinder Mail','','',''),(41,'Pyropolis Hash House Harriers','','',''),(42,'Misfit Wanderland ','','',''),(43,'So Sassy','','',''),(44,'Illuminating Ananas','','',''),(45,'Sensation Station','','',''),(46,'Circle of Water','','',''),(47,'Stamp Camp','','',''),(48,'Wonderlounge Fuckers','','',''),(49,'Bass Gravy','','',''),(50,'Aquanaughties','','',''),(51,'Camp Chill the Fuck Out','','',''),(52,'Tiki Kiki','','',''),(53,'Punk in Drublic','','',''),(54,'Christmas Town!!!','','',''),(55,'Cosmic Creatures','','',''),(57,'Trampadome','','',''),(58,'Badlands HOA','','',''),(59,'CamPINK!','','',''),(60,'Jammie Camp','','',''),(61,'ICE','','',''),(62,'Arson Around','','',''),(64,'Velvet Pocket','','',''),(65,'KFLIP','','',''),(67,'Lava Lounge','','',''),(68,'Trailer Park Bois','','','');
/*!40000 ALTER TABLE `orgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_data`
--

DROP TABLE IF EXISTS `phone_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_data` (
  `phone_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_id` int(11) NOT NULL,
  `phone_data_name` varchar(255) DEFAULT NULL,
  `phone_data_contents` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`phone_data_id`),
  KEY `phones_to_phone_data_fk_idx` (`phone_id`),
  CONSTRAINT `phones_to_phone_data_fk` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`phone_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_data`
--

LOCK TABLES `phone_data` WRITE;
/*!40000 ALTER TABLE `phone_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_inventory`
--

DROP TABLE IF EXISTS `phone_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_inventory` (
  `phone_inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_inventory_tag` varchar(45) NOT NULL,
  `phone_inventory_serial` varchar(15) NOT NULL,
  `phone_inventory_type_id` int(11) DEFAULT NULL,
  `phone_inventory_model_id` int(11) DEFAULT NULL,
  `phone_inventory_available` tinyint(4) NOT NULL DEFAULT '1',
  `sip_username1` varchar(45) DEFAULT NULL,
  `sip_password1` varchar(45) DEFAULT NULL,
  `sip_username2` varchar(45) DEFAULT NULL,
  `sip_password2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`phone_inventory_id`),
  UNIQUE KEY `phone_inventory_tag_UNIQUE` (`phone_inventory_tag`),
  KEY `phone_inventory_type_fk_idx` (`phone_inventory_type_id`),
  KEY `phone_inventory_to_phone_model_fk_idx` (`phone_inventory_model_id`),
  KEY `phone_inventory_tag_INDEX` (`phone_inventory_tag`),
  CONSTRAINT `phone_inventory_to_phone_model_fk` FOREIGN KEY (`phone_inventory_model_id`) REFERENCES `phone_models` (`phone_model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phone_inventory_type_fk` FOREIGN KEY (`phone_inventory_type_id`) REFERENCES `phone_types` (`phone_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_inventory`
--

LOCK TABLES `phone_inventory` WRITE;
/*!40000 ALTER TABLE `phone_inventory` DISABLE KEYS */;
INSERT INTO `phone_inventory` VALUES (2,'V002','SEP0011BB0DE4B3',1,1,1,NULL,NULL,NULL,NULL),(4,'V003','SEP000DED0881A3',1,1,1,NULL,NULL,NULL,NULL),(5,'V004','SEP000F8F59C5D3',1,1,1,NULL,NULL,NULL,NULL),(6,'V005','SEP001E7A242E6C',1,1,1,NULL,NULL,NULL,NULL),(7,'V008','SEP000BBE7C9576',1,1,1,NULL,NULL,NULL,NULL),(8,'V034','SEP0011BB0DDBC3',1,1,1,NULL,NULL,NULL,NULL),(9,'V013','SEP000DED22F2FF',1,1,1,NULL,NULL,NULL,NULL),(10,'V010','SEP0014A8D486EF',1,1,1,NULL,NULL,NULL,NULL),(11,'V011','SEP0013C4FBBFA6',1,1,1,NULL,NULL,NULL,NULL),(12,'V012','SEP0014F2FAFD04',1,1,1,NULL,NULL,NULL,NULL),(14,'V014','SEP000F8F59C5D3',1,1,1,NULL,NULL,NULL,NULL),(15,'V015','SEP011BB0DE0F8',1,1,1,NULL,NULL,NULL,NULL),(16,'V022','SEP0015626A523F',1,1,1,NULL,NULL,NULL,NULL),(17,'V023','SEP00156247F803',1,1,1,NULL,NULL,NULL,NULL),(18,'V024','SEP001562869F5B',1,1,1,NULL,NULL,NULL,NULL),(19,'V025','SEP0015F914028C',1,1,1,NULL,NULL,NULL,NULL),(20,'V026','SEP001646806BB8',1,1,1,NULL,NULL,NULL,NULL),(21,'V027','SEP0016474B01A9',1,1,1,NULL,NULL,NULL,NULL),(22,'V028','SEP0015F914025B',1,1,1,NULL,NULL,NULL,NULL),(23,'V029','SEP0015F915297A',1,1,1,NULL,NULL,NULL,NULL),(24,'V031','SEP0011BB0DE105',1,1,1,NULL,NULL,NULL,NULL),(25,'V032','SEP0013C4E08A2B',1,1,1,NULL,NULL,NULL,NULL),(26,'V033','SEP0011BB0DE195',1,1,1,NULL,NULL,NULL,NULL),(27,'V035','SEP0013C4D1790C',1,1,1,NULL,NULL,NULL,NULL),(28,'V036','SEP00156228A41C',1,1,1,NULL,NULL,NULL,NULL),(29,'V037','SEP00156286AA23',1,1,1,NULL,NULL,NULL,NULL),(30,'V039','SEP0014A90FFFF8',1,1,1,NULL,NULL,NULL,NULL),(31,'V040','SEP001562869F9E',1,1,1,NULL,NULL,NULL,NULL),(32,'V030','SEPD0574CF79C98',1,3,1,'','','',''),(33,'V041','SEP0015F9B3928E',1,2,1,NULL,NULL,NULL,NULL),(34,'V042','SEP0016C8C3CCFE',1,2,0,NULL,NULL,NULL,NULL),(35,'V043','SEP0016C8C3CE4A',1,2,1,NULL,NULL,NULL,NULL),(36,'V044','SEP0016464BB150',1,2,1,'','','',''),(37,'V045','SEP001646776B5D',1,2,0,NULL,NULL,NULL,NULL),(38,'V046','SEP0011BB0DE191',1,1,1,NULL,NULL,NULL,NULL),(39,'V047','SEP001562695B25',1,1,1,NULL,NULL,NULL,NULL),(40,'V048','SEP000DBCCC6C63',1,1,1,NULL,NULL,NULL,NULL),(41,'V049','SEP0015629F897C',1,1,1,NULL,NULL,NULL,NULL),(42,'V050','SEP0011BB0DE47A',1,1,1,NULL,NULL,NULL,NULL),(43,'V051','SEP00156286A007',1,1,1,NULL,NULL,NULL,NULL),(44,'V052','SEP0013C4FBBF9E',1,1,1,NULL,NULL,NULL,NULL),(45,'V053','SEP0011BB0DE10B',1,1,1,NULL,NULL,NULL,NULL),(46,'V054','SEP0015626A4FCF',1,1,1,NULL,NULL,NULL,NULL),(47,'V055','SEP0015626A569D',1,1,1,NULL,NULL,NULL,NULL),(48,'V056','SEP00131AE5C78F',1,1,1,NULL,NULL,NULL,NULL),(49,'V057','SEP0013C4FBBB1E',1,1,1,NULL,NULL,NULL,NULL),(50,'V058','SEP00156286B037',1,1,1,NULL,NULL,NULL,NULL),(51,'V059','SEP0015626A51FD',1,1,1,NULL,NULL,NULL,NULL),(52,'V060','SEP0015626A5531',1,1,1,NULL,NULL,NULL,NULL),(53,'V061','SEP0011BB0DE246',1,1,1,NULL,NULL,NULL,NULL),(54,'V062','SEP0011BB0DE1D8',1,1,1,NULL,NULL,NULL,NULL),(55,'V063','SEP001562767D9D',1,1,1,NULL,NULL,NULL,NULL),(56,'V006','SEP0016C8C3C9BB',1,2,1,NULL,NULL,NULL,NULL),(57,'V007','SEP001562788A1C',1,1,1,NULL,NULL,NULL,NULL),(58,'V009','SEP000DED47D711',1,1,1,NULL,NULL,NULL,NULL),(60,'v064','SEP0011BB0DE0F8',1,1,1,NULL,NULL,NULL,NULL),(73,'test','test',2,4,1,'test','test','test','test'),(74,'ATA-15','000F9F18EBFC',2,5,1,'8ebfc','8ebfc','8ebfc1','8ebfc1'),(75,'ATA-08','000F9F1899A6',2,5,1,'899a6','899a6','899a61','899a61'),(76,'V001','SEPD0574CF794A2',1,3,1,'','','',''),(77,'v019','SEPD0574CF79C7A',1,3,1,'','','',''),(78,'v065','SEP9C57AD02F10C',1,3,1,'','','',''),(79,'v020','SEP5067AEE17403',1,3,1,'','','',''),(81,'v066','SEP002414B37A3F',1,3,1,'','','',''),(82,'ATA-14','000F9F18ABFA',2,5,1,'8abfa','8abfa','8abfa','8abfa'),(83,'ATA-05','000F9F4618DC',2,5,1,'618dc','618dc','618dc1','618dc1'),(84,'ATA-13','000F9F174286',2,5,1,'74286','74286','742861','742861'),(85,'v017','SEP000AB8F3835D',1,2,1,'','','',''),(86,'ATA-27','000B82390B7C',2,5,1,'ATA-27L1','ATA-27L1','',''),(87,'ATA-29','000B822AD51B',2,5,1,'ATA-29L1','ATA-29L1','',''),(88,'ATA-20','000B821FA53D',2,5,1,'ATA-20L1','ATA-20L1','',''),(89,'ATA-17','000B8237B10E',2,5,1,'ATA-17L1','ATA-17L1','',''),(90,'ATA-23','000B82155E5C',2,5,1,'ATA-23L1','ATA-23L1','',''),(91,'ATA-25','000B822AD51C',2,5,1,'ATA-25L1','ATA-25L1','',''),(92,'ATA-24','000B821883E6',2,5,1,'ATA-24L1','ATA-24L1','',''),(93,'PA36','',2,4,1,'PA36','PA36','',''),(94,'PA35','1234',2,4,1,'PA35','PA35','',''),(95,'PA6','PA6',2,4,1,'PA6','PA6','',''),(96,'PA12','PA12',2,4,1,'PA12','PA12','',''),(97,'zonk','zonk',2,4,1,'zonk','zonk','',''),(98,'V067','SEP000DED47DA11',1,1,1,'','','',''),(99,'v068','SEP0011BB0DDB53',1,1,1,'','','',''),(100,'v069','SEP0011BB0DE1DE',1,1,1,'','','',''),(102,'v070','SEP0011BB0DDB83',1,1,1,'','','',''),(103,'v071','SEP0011BB0DE46E',1,1,1,'','','',''),(104,'ATA-06','000F9F185D94',2,5,1,'85d94','85d94','85d941','85d941'),(105,'Will Swallow Cell','asdf',2,4,1,'will','will','',''),(106,'ATA-09','00111A53EFB8',2,5,1,'3efb8','3efb8','3efb81','3efb81'),(107,'Shitbag','shitbag',2,4,1,'shitbag','shitbag','',''),(108,'V101','SEP0014A8936901',1,1,1,'','','',''),(109,'V102','SEP0011BB0DE46E',1,1,1,'','','',''),(110,'ATA-07','000F9F1827DC',2,5,1,'827dc','827dc','826dc1','827dc2');
/*!40000 ALTER TABLE `phone_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_models`
--

DROP TABLE IF EXISTS `phone_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_models` (
  `phone_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_model_name` varchar(45) NOT NULL,
  `phone_model_max_numbers` int(11) NOT NULL DEFAULT '1',
  `phone_model_type_id` int(11) NOT NULL,
  `xml_config_filename` varchar(200) DEFAULT 'SEPdefault.cnf.xml',
  `phone_model_system_name` varchar(45) DEFAULT NULL,
  `add_button_list` tinyint(4) DEFAULT '0',
  `button_list_max` int(11) DEFAULT '28',
  `page_size` int(11) DEFAULT '12',
  PRIMARY KEY (`phone_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_models`
--

LOCK TABLES `phone_models` WRITE;
/*!40000 ALTER TABLE `phone_models` DISABLE KEYS */;
INSERT INTO `phone_models` VALUES (1,'7940',2,1,'SEPdefault.cnf.xml','7940',0,28,12),(2,'7960',6,1,'SEPdefault.cnf.xml','7960',0,28,12),(3,'7965+Addon(48)',6,1,'cisco7965default.cnf.xml','7965',1,48,12),(4,'SIP Softphone',1,2,'',NULL,0,28,12),(5,'SIP 2 Line ATA',2,2,'',NULL,0,28,12),(6,'7965/6',6,1,'cisco7965default.cnf.xml','7965',0,28,12);
/*!40000 ALTER TABLE `phone_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number_assignment`
--

DROP TABLE IF EXISTS `phone_number_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_number_assignment` (
  `phone_number_assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `number_id` int(11) DEFAULT NULL,
  `phone_id` int(11) DEFAULT NULL,
  `number_type_id` int(11) DEFAULT '1',
  `buttonconfig_id` int(11) DEFAULT NULL,
  `todelete_assignment` tinyint(4) NOT NULL DEFAULT '0',
  `added_assignment` tinyint(4) NOT NULL DEFAULT '0',
  `password_index` int(11) NOT NULL DEFAULT '1',
  `display_order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`phone_number_assignment_id`),
  UNIQUE KEY `phone_number_assignment_phone_number_pair` (`number_id`,`phone_id`),
  KEY `phone_number_assignment_phones_fk_idx` (`phone_id`),
  KEY `phone_number_assignment_number_fk_idx` (`number_id`),
  CONSTRAINT `phone_number_assignment_number_fk` FOREIGN KEY (`number_id`) REFERENCES `numbers` (`number_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phone_number_assignment_phones_fk` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`phone_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number_assignment`
--

LOCK TABLES `phone_number_assignment` WRITE;
/*!40000 ALTER TABLE `phone_number_assignment` DISABLE KEYS */;
INSERT INTO `phone_number_assignment` VALUES (4,4,2,1,NULL,0,1,1,1),(5,5,2,5,NULL,0,1,1,2),(6,6,3,1,NULL,0,1,1,1),(7,5,3,5,NULL,0,1,1,2),(10,8,5,1,NULL,0,1,1,1),(11,5,5,5,NULL,0,1,1,2),(12,9,6,1,NULL,0,1,1,1),(13,5,6,5,NULL,0,1,1,2),(78,46,45,1,NULL,0,1,1,1),(79,47,47,1,NULL,0,1,1,1),(80,48,48,1,NULL,0,1,1,1),(92,59,56,4,NULL,0,1,1,1),(94,61,61,4,NULL,0,1,1,1),(95,62,62,4,NULL,0,1,1,1),(177,109,113,1,NULL,0,1,1,1),(178,110,114,1,NULL,0,1,1,1),(179,111,115,1,NULL,0,1,1,1),(180,112,116,1,NULL,0,1,1,1),(181,42,117,1,NULL,0,1,1,1),(183,114,119,1,NULL,0,1,1,1),(184,115,120,1,NULL,0,1,1,1),(185,116,121,1,NULL,0,1,1,1),(186,5,121,5,NULL,0,1,1,2),(187,117,122,1,NULL,0,1,1,1),(188,5,122,5,NULL,0,1,1,2),(189,118,123,1,NULL,0,1,1,1),(190,5,123,5,NULL,0,1,1,2),(191,119,124,1,NULL,0,1,1,1),(192,5,124,5,NULL,0,1,1,2),(193,120,125,1,NULL,0,1,1,1),(194,5,125,5,NULL,0,1,1,2),(195,121,126,1,NULL,0,1,1,1),(197,122,127,1,NULL,0,1,1,1),(201,124,129,1,NULL,0,1,1,1),(205,126,131,1,NULL,0,1,1,1),(206,5,131,5,NULL,0,1,1,2),(207,5,127,5,NULL,0,1,1,2),(210,5,126,5,NULL,0,1,1,2),(211,128,133,1,NULL,0,1,1,1),(212,5,133,5,NULL,0,1,1,2),(215,5,129,5,NULL,0,1,1,2),(216,130,135,1,NULL,0,1,1,1),(217,5,135,5,NULL,0,1,1,2),(218,131,136,1,NULL,0,1,1,1),(219,5,136,5,NULL,0,1,1,2),(222,133,138,1,NULL,0,1,1,1),(223,5,138,5,NULL,0,1,1,2),(224,134,139,1,NULL,0,1,1,1),(225,5,139,5,NULL,0,1,1,2),(226,135,140,1,NULL,0,1,1,1),(227,5,140,5,NULL,0,1,1,2),(228,136,141,1,NULL,0,1,1,1),(229,5,141,5,NULL,0,1,1,2),(230,137,142,1,NULL,0,1,1,1),(231,138,143,1,NULL,0,1,1,1),(232,5,143,5,NULL,0,1,1,2),(233,139,143,1,NULL,0,1,1,1),(234,140,144,1,NULL,0,1,1,1),(235,5,144,5,NULL,0,1,1,2),(236,141,145,1,NULL,0,1,1,1),(237,5,145,5,NULL,0,1,1,2),(238,142,146,1,NULL,0,1,1,1),(239,5,146,5,NULL,0,1,1,2),(244,145,149,1,NULL,0,1,1,1),(245,5,149,5,NULL,0,1,1,2),(250,148,152,1,NULL,0,1,1,1),(251,5,152,5,NULL,0,1,1,2),(252,149,153,1,NULL,0,1,1,1),(253,5,153,5,NULL,0,1,1,2),(256,151,155,1,NULL,0,1,1,1),(257,5,155,5,NULL,0,1,1,2),(258,152,156,1,NULL,0,1,1,1),(261,155,159,4,NULL,0,1,1,1),(262,156,161,1,NULL,0,1,1,1),(263,157,162,1,NULL,0,1,1,1);
/*!40000 ALTER TABLE `phone_number_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_types`
--

DROP TABLE IF EXISTS `phone_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_types` (
  `phone_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`phone_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_types`
--

LOCK TABLES `phone_types` WRITE;
/*!40000 ALTER TABLE `phone_types` DISABLE KEYS */;
INSERT INTO `phone_types` VALUES (1,'SCCP'),(2,'SIP');
/*!40000 ALTER TABLE `phone_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_type_id` int(11) NOT NULL,
  `phone_model_id` int(11) NOT NULL,
  `phone_org_id` int(11) DEFAULT NULL,
  `phone_primary_number_id` int(11) DEFAULT NULL,
  `phone_is_inventory` tinyint(4) NOT NULL DEFAULT '0',
  `phone_inventory_id` int(11) DEFAULT NULL,
  `phone_serial` varchar(45) NOT NULL,
  `phone_is_deployed` tinyint(4) NOT NULL DEFAULT '0',
  `altered` tinyint(4) NOT NULL DEFAULT '0',
  `todelete_phone` tinyint(4) NOT NULL DEFAULT '0',
  `added` tinyint(4) NOT NULL DEFAULT '0',
  `errored` tinyint(4) NOT NULL DEFAULT '0',
  `sccpdevice_id` int(11) DEFAULT NULL,
  `sip_username1` varchar(45) DEFAULT NULL,
  `sip_password1` varchar(45) DEFAULT NULL,
  `sip_username2` varchar(45) DEFAULT NULL,
  `sip_password2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`phone_id`),
  UNIQUE KEY `phone_serial_UNIQUE` (`phone_serial`),
  KEY `phones_phone_types_fk_idx` (`phone_type_id`),
  KEY `phones_orges_fk_idx` (`phone_org_id`),
  KEY `phones_to_numbers_fk_idx` (`phone_primary_number_id`),
  KEY `phones_to_phone_inventory_fk_idx` (`phone_inventory_id`),
  KEY `phones_to_phone_models_fk_idx` (`phone_model_id`),
  CONSTRAINT `phones_orges_fk` FOREIGN KEY (`phone_org_id`) REFERENCES `orgs` (`org_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phones_to_numbers_fk` FOREIGN KEY (`phone_primary_number_id`) REFERENCES `numbers` (`number_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phones_to_phone_inventory_fk` FOREIGN KEY (`phone_inventory_id`) REFERENCES `phone_inventory` (`phone_inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phones_to_phone_models_fk` FOREIGN KEY (`phone_model_id`) REFERENCES `phone_models` (`phone_model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `phones_to_phone_type_fk` FOREIGN KEY (`phone_type_id`) REFERENCES `phone_types` (`phone_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES (2,1,3,1,NULL,1,79,'SEP5067AEE17403',0,0,0,0,0,1402,'','','',''),(3,1,3,1,NULL,1,77,'SEPD0574CF79C7A',0,0,0,0,0,1403,'','','',''),(5,1,3,1,NULL,1,81,'SEP002414B37A3F',0,0,0,0,0,1404,'','','',''),(6,1,3,1,NULL,1,76,'SEPD0574CF794A2',0,0,0,0,0,1405,'','','',''),(45,2,5,28,NULL,1,91,'000B822AD51C',0,0,0,0,0,NULL,'ATA-25L1','ATA-25L1','',''),(47,2,5,28,NULL,1,92,'000B821883E6',0,0,0,0,0,NULL,'ATA-24L1','ATA-24L1','',''),(48,2,5,28,NULL,1,89,'000B8237B10E',0,0,0,0,0,NULL,'ATA-17L1','ATA-17L1','',''),(56,2,4,31,NULL,1,93,'',0,0,0,0,0,NULL,'PA36','PA36','',''),(61,2,4,31,NULL,1,95,'PA6',0,0,0,0,0,NULL,'PA6','PA6','',''),(62,2,4,31,NULL,1,96,'PA12',0,0,0,0,0,NULL,'PA12','PA12','',''),(113,2,5,28,NULL,1,86,'000B82390B7C',0,0,0,0,0,NULL,'ATA-27L1','ATA-27L1','',''),(114,2,5,28,NULL,1,88,'000B821FA53D',0,0,0,0,0,NULL,'ATA-20L1','ATA-20L1','',''),(115,2,4,29,NULL,1,107,'shitbag',0,0,0,0,0,NULL,'shitbag','shitbag','',''),(116,1,2,29,NULL,1,36,'SEP0016464BB150',0,0,0,0,0,1406,'','','',''),(117,2,5,28,NULL,1,90,'000B82155E5C',0,0,0,0,0,NULL,'ATA-23L1','ATA-23L1','',''),(119,2,5,1,NULL,1,106,'00111A53EFB8',0,0,0,0,0,NULL,'3efb8','3efb8','3efb81','3efb81'),(120,1,1,34,NULL,1,23,'SEP0015F915297A',0,0,0,0,0,1407,NULL,NULL,NULL,NULL),(121,1,1,35,NULL,1,24,'SEP0011BB0DE105',0,0,0,0,0,1408,NULL,NULL,NULL,NULL),(122,1,1,36,NULL,1,45,'SEP0011BB0DE10B',0,0,0,0,0,1409,NULL,NULL,NULL,NULL),(123,1,1,37,NULL,1,60,'SEP0011BB0DE0F8',0,0,0,0,0,1410,NULL,NULL,NULL,NULL),(124,1,1,38,NULL,1,99,'SEP0011BB0DDB53',0,0,0,0,0,1411,'','','',''),(125,1,1,39,NULL,1,55,'SEP001562767D9D',0,0,0,0,0,1412,NULL,NULL,NULL,NULL),(126,1,1,40,NULL,1,54,'SEP0011BB0DE1D8',0,0,0,0,0,1413,NULL,NULL,NULL,NULL),(127,1,1,41,NULL,1,20,'SEP001646806BB8',0,0,0,0,0,1414,NULL,NULL,NULL,NULL),(129,1,1,42,NULL,1,47,'SEP0015626A569D',0,0,0,0,0,1415,NULL,NULL,NULL,NULL),(131,1,1,44,NULL,1,48,'SEP00131AE5C78F',0,0,0,0,0,1416,NULL,NULL,NULL,NULL),(133,1,1,46,NULL,1,27,'SEP0013C4D1790C',0,0,0,0,0,1417,NULL,NULL,NULL,NULL),(135,1,1,43,NULL,1,14,'SEP000F8F59C5D3',0,0,0,0,0,1418,NULL,NULL,NULL,NULL),(136,1,1,45,NULL,1,39,'SEP001562695B25',0,0,0,0,0,1419,NULL,NULL,NULL,NULL),(138,1,1,49,NULL,1,41,'SEP0015629F897C',0,0,0,0,0,1420,NULL,NULL,NULL,NULL),(139,1,1,50,NULL,1,51,'SEP0015626A51FD',0,0,0,0,0,1421,NULL,NULL,NULL,NULL),(140,1,1,51,NULL,1,22,'SEP0015F914025B',0,0,0,0,0,1422,NULL,NULL,NULL,NULL),(141,1,1,52,NULL,1,19,'SEP0015F914028C',0,0,0,0,0,1423,NULL,NULL,NULL,NULL),(142,1,1,61,NULL,1,18,'SEP001562869F5B',0,0,0,0,0,1424,NULL,NULL,NULL,NULL),(143,1,2,60,NULL,1,33,'SEP0015F9B3928E',0,0,0,0,0,1425,NULL,NULL,NULL,NULL),(144,1,2,53,NULL,1,35,'SEP0016C8C3CE4A',0,0,0,0,0,1426,NULL,NULL,NULL,NULL),(145,1,2,54,NULL,1,56,'SEP0016C8C3C9BB',0,0,0,0,0,1427,NULL,NULL,NULL,NULL),(146,1,1,58,NULL,1,102,'SEP0011BB0DDB83',0,0,0,0,0,1428,'','','',''),(149,1,1,55,NULL,1,11,'SEP0013C4FBBFA6',0,0,0,0,0,1429,NULL,NULL,NULL,NULL),(152,1,1,62,NULL,1,108,'SEP0014A8936901',0,0,0,0,0,1430,'','','',''),(153,1,1,47,NULL,1,109,'SEP0011BB0DE46E',0,0,0,0,0,1431,'','','',''),(155,1,1,48,NULL,1,100,'SEP0011BB0DE1DE',0,0,0,0,0,1432,'','','',''),(156,2,5,64,NULL,1,75,'000F9F1899A6',0,0,0,0,0,NULL,'899a6','899a6','899a61','899a61'),(159,2,5,65,NULL,1,82,'000F9F18ABFA',0,0,0,0,0,NULL,'8abfa','8abfa','8abfa','8abfa'),(161,2,5,67,NULL,1,110,'000F9F1827DC',0,0,0,0,0,NULL,'827dc','827dc','826dc1','827dc2'),(162,2,5,68,NULL,1,104,'000F9F185D94',0,0,0,0,0,NULL,'85d94','85d94','85d941','85d941');
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routers`
--

DROP TABLE IF EXISTS `routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routers` (
  `router_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `channel_24` int(11) NOT NULL DEFAULT '1',
  `channel_5` int(11) NOT NULL DEFAULT '36',
  `org_id` int(11) DEFAULT NULL,
  `router_is_deployed` int(11) NOT NULL DEFAULT '0',
  `channel_24_current` int(11) DEFAULT NULL,
  `channel_5_current` int(11) DEFAULT NULL,
  `available` int(4) NOT NULL DEFAULT '1',
  `enclosed` varchar(200) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`router_id`),
  UNIQUE KEY `number_unique` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routers`
--

LOCK TABLES `routers` WRITE;
/*!40000 ALTER TABLE `routers` DISABLE KEYS */;
INSERT INTO `routers` VALUES (1,50,1,6,149,NULL,0,6,149,1,'',''),(2,1,1,6,44,NULL,0,6,44,0,'No','home router'),(3,2,1,6,149,NULL,0,NULL,NULL,1,'No',''),(4,3,1,1,157,28,0,1,157,1,'Payphone - West','ATA23'),(5,4,1,1,149,51,0,6,149,1,'No','Camp Chill the Fuck Out'),(6,6,1,1,36,28,0,1,36,1,'Payphone @ xroads','ATA17 and PA'),(7,7,1,1,149,41,0,6,44,1,'No','Pyropolis Hash House Harriers'),(8,9,1,1,157,30,0,1,157,1,'Yes','West Central pole'),(9,10,1,6,149,42,0,1,157,1,'No','Misfit Wanderland'),(10,11,1,1,44,64,0,1,44,1,'No','Velvet Pocket'),(11,12,1,1,149,NULL,0,1,149,1,'Payphone - West','ata 29'),(12,13,1,1,157,NULL,0,1,149,1,'No','Punk in Drublic'),(13,14,1,1,149,49,0,6,149,1,'No','Bass Gravy'),(14,16,1,6,44,35,0,6,44,1,'No','Camp Camp'),(15,17,1,1,149,50,0,1,149,1,'No','Aquanaughties'),(16,18,1,6,157,65,0,6,157,1,'No','kflip'),(17,19,1,1,44,NULL,0,6,157,1,'No',''),(18,21,1,6,36,68,0,6,36,1,'','trailer p boiz'),(19,22,1,1,157,60,0,1,36,1,'No','Jammie Camp'),(20,23,1,6,157,30,0,6,157,1,'Yes','Site Ops Container'),(21,24,1,6,44,30,0,1,36,1,'Yes','East Central Pole'),(22,25,1,6,157,NULL,0,6,149,1,'No','kflip'),(23,26,1,1,157,NULL,0,6,149,1,'No','Tiki Kiki'),(24,27,1,1,36,1,0,6,36,1,'No','FUT HQ'),(25,28,1,1,149,40,0,6,149,1,'No',''),(26,29,1,11,157,NULL,0,1,157,1,'POE','POE 10'),(27,30,1,6,157,47,0,1,36,1,'No','Stamp Camp'),(28,31,1,6,149,30,0,6,44,1,'POE','POE 2'),(29,32,1,6,157,34,0,6,157,1,'No','RANGER HQ'),(46,33,1,11,44,30,0,11,44,1,'POE box','POE 1'),(47,34,1,1,36,NULL,0,NULL,NULL,0,'No','Config issues, formerly PA'),(48,35,1,1,149,NULL,0,1,157,1,'Payphone - East','ATA29 and PA (baresip autostart)'),(49,36,1,6,36,28,0,6,36,1,'Payphone-badlands N.','ATA25 (baresip autostart BAD)'),(50,37,1,6,157,30,0,6,157,1,'POE pole','POE #3 pole'),(51,38,1,1,149,67,0,6,157,1,'No','Lava'),(52,39,1,6,157,NULL,0,6,149,1,'No',''),(53,46,1,1,149,62,0,11,44,1,'','Arson Around'),(67,45,1,1,157,28,0,NULL,NULL,1,'Payphone- FEG','ATA24'),(68,47,1,11,157,46,0,11,149,1,'No','Circle of Water'),(69,48,1,6,44,NULL,0,NULL,NULL,1,'No','Tim Keller?'),(70,49,1,1,44,36,0,6,149,1,'No','Curmudgeons'),(71,60,1,1,44,NULL,0,6,44,1,'No',''),(72,51,1,1,44,37,0,1,36,1,'No','FaceLAzers'),(73,52,1,1,157,52,0,1,157,1,'No','Tiki Kiki'),(74,53,1,1,36,39,0,11,44,1,'No','Dhaba'),(75,54,1,1,157,NULL,0,NULL,NULL,1,'No',''),(76,55,1,6,157,54,0,1,149,1,'No','Christmas Town!!!'),(77,57,1,6,44,NULL,0,NULL,NULL,1,'No','Tim Keller?'),(78,58,1,1,149,NULL,0,NULL,NULL,0,'No','need downgrade'),(79,59,1,1,149,NULL,0,NULL,NULL,0,'No','need downgrade'),(80,61,1,1,149,30,0,1,149,1,'Yes','Westerer pole'),(81,62,1,1,44,NULL,0,NULL,NULL,1,'No',''),(82,63,1,6,44,28,0,6,44,1,'Payphone-Greeters','ATA20'),(83,64,1,1,149,55,0,6,149,1,'No',''),(84,65,1,6,157,61,0,11,44,1,'No','ICE'),(85,66,1,6,36,44,0,6,44,1,'No','Illuminating Ananas'),(86,67,1,6,36,NULL,0,6,36,1,'Tall Pole - 12V battery','FUCKED'),(87,68,1,1,149,NULL,0,6,44,1,'No',''),(88,69,1,1,157,53,0,1,149,1,'No','Punk in Drublic'),(89,70,1,6,149,28,0,6,149,1,'kidsville','ATA 27');
/*!40000 ALTER TABLE `routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `asteriskrealtime`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `asteriskrealtime` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `asteriskrealtime`;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('54cde9847798'),('4468b4a91372'),('39428242f7f5');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buttonconfig`
--

DROP TABLE IF EXISTS `buttonconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buttonconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(15) NOT NULL DEFAULT '',
  `instance` tinyint(4) NOT NULL DEFAULT '0',
  `type` enum('line','speeddial','service','feature','empty') NOT NULL DEFAULT 'line',
  `name` varchar(36) DEFAULT NULL,
  `options` varchar(100) DEFAULT NULL,
  `sccpdevice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buttonconfig_device` (`device`),
  KEY `buttonconfig_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23588 DEFAULT CHARSET=latin1 COMMENT='CREATE DEFINER=`asteriskuser`@`localhost` TRIGGER trg_buttonconfig BEFORE INSERT ON buttonconfig\nFOR EACH ROW\nBEGIN\n	IF NEW.`type` = ''line'' THEN\n		IF (SELECT COUNT(*) FROM `sccpline` WHERE `sccpline`.`name` = NEW.`name`) = 0\n		THEN\n			UPDATE `Foreign key contraint violated: line does not exist in sccpline` SET x=1;\n		END IF;\n	END IF;\nEND';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buttonconfig`
--

LOCK TABLES `buttonconfig` WRITE;
/*!40000 ALTER TABLE `buttonconfig` DISABLE KEYS */;
INSERT INTO `buttonconfig` VALUES (23320,'SEP5067AEE17403',1,'line','2655328','2655328',1402),(23321,'SEP5067AEE17403',2,'speeddial','RANDOM','726366',1402),(23322,'SEP5067AEE17403',3,'empty','empty','empty',NULL),(23323,'SEP5067AEE17403',4,'empty','empty','empty',NULL),(23324,'SEP5067AEE17403',5,'empty','empty','empty',NULL),(23325,'SEP5067AEE17403',6,'empty','empty','empty',NULL),(23326,'SEP5067AEE17403',7,'speeddial','COLLECTIONS','2655328',NULL),(23327,'SEP5067AEE17403',8,'speeddial','FUT SALES','4383858',NULL),(23328,'SEP5067AEE17403',9,'speeddial','Cust Disservice','3825968',NULL),(23329,'SEP5067AEE17403',10,'speeddial','OPERATOR','0',NULL),(23330,'SEP5067AEE17403',11,'speeddial','West Payphone','3805',NULL),(23331,'SEP5067AEE17403',12,'speeddial','N.Bad Payphone','3802',NULL),(23332,'SEP5067AEE17403',13,'speeddial','Effigy Payphone','3801',NULL),(23333,'SEP5067AEE17403',14,'speeddial','XRoads Payphone','3806',NULL),(23334,'SEP5067AEE17403',15,'speeddial','East Pager','7201',NULL),(23335,'SEP5067AEE17403',16,'speeddial','XRoadsPager','7202',NULL),(23336,'SEP5067AEE17403',17,'speeddial','West Pager','7203',NULL),(23337,'SEP5067AEE17403',18,'speeddial','Kidvil Payphone','3804',NULL),(23338,'SEP5067AEE17403',19,'speeddial','MISFITS','15556473487',NULL),(23339,'SEP5067AEE17403',20,'speeddial','ILL Ananas','262627',NULL),(23340,'SEP5067AEE17403',21,'speeddial','Circle of Water','438938',NULL),(23341,'SEP5067AEE17403',22,'speeddial','SO SASSY','666',NULL),(23342,'SEP5067AEE17403',23,'speeddial','Sens Station','76779',NULL),(23343,'SEP5067AEE17403',24,'speeddial','Bass Gravy','976',NULL),(23344,'SEP5067AEE17403',25,'speeddial','Aquanaughties','6682782',NULL),(23345,'SEP5067AEE17403',26,'speeddial','Chill TF Out','24455',NULL),(23346,'SEP5067AEE17403',27,'speeddial','Tiki Kiki','28887',NULL),(23347,'SEP5067AEE17403',28,'speeddial','ICE','423',NULL),(23348,'SEP5067AEE17403',29,'speeddial','Jammie','526643',NULL),(23349,'SEP5067AEE17403',30,'speeddial','1 800 MEOW','18006369',NULL),(23350,'SEP5067AEE17403',31,'speeddial','Greeter Payphone','3803',NULL),(23351,'SEP5067AEE17403',32,'speeddial','Tech Support','7448224',NULL),(23352,'SEP5067AEE17403',33,'speeddial','test','111',NULL),(23353,'SEP5067AEE17403',34,'speeddial','tester','333',NULL),(23354,'SEP5067AEE17403',35,'speeddial','RANGERS','999',NULL),(23355,'SEP5067AEE17403',36,'speeddial','CampCamp','22672267',NULL),(23356,'SEP5067AEE17403',37,'speeddial','Curmudgeon Camp','478679',NULL),(23357,'SEP5067AEE17403',38,'speeddial','FACELAZERS','3223529377',NULL),(23358,'SEP5067AEE17403',39,'speeddial','YAY','929',NULL),(23359,'SEP5067AEE17403',40,'speeddial','DHABA','34222',NULL),(23360,'SEP5067AEE17403',41,'speeddial','Snail Tinder','786',NULL),(23361,'SEP5067AEE17403',42,'speeddial','PHHH','4697976',NULL),(23362,'SEP5067AEE17403',43,'speeddial','Punk in Drublic','666999',NULL),(23363,'SEP5067AEE17403',44,'speeddial','CHRISTMAS TOWN','72682',NULL),(23364,'SEP5067AEE17403',45,'speeddial','Badlands HOA','2462',NULL),(23365,'SEP5067AEE17403',46,'speeddial','Cosmic Creatures','267642',NULL),(23366,'SEP5067AEE17403',47,'speeddial','Arson Around','27766',NULL),(23367,'SEP5067AEE17403',48,'speeddial','Stamp Camp','1800782678',NULL),(23368,'SEP5067AEE17403',49,'speeddial','WonderFuckers','420',NULL),(23369,'SEP5067AEE17403',50,'speeddial','Velvet Pocket','41187',NULL),(23370,'SEP5067AEE17403',51,'empty','empty','empty',NULL),(23371,'SEP5067AEE17403',52,'empty','empty','empty',NULL),(23372,'SEP5067AEE17403',53,'empty','empty','empty',NULL),(23373,'SEP5067AEE17403',54,'empty','empty','empty',NULL),(23374,'SEPD0574CF79C7A',1,'line','4383858','4383858',1403),(23375,'SEPD0574CF79C7A',2,'speeddial','RANDOM','726366',1403),(23376,'SEPD0574CF79C7A',3,'empty','empty','empty',NULL),(23377,'SEPD0574CF79C7A',4,'empty','empty','empty',NULL),(23378,'SEPD0574CF79C7A',5,'empty','empty','empty',NULL),(23379,'SEPD0574CF79C7A',6,'empty','empty','empty',NULL),(23380,'SEPD0574CF79C7A',7,'speeddial','COLLECTIONS','2655328',NULL),(23381,'SEPD0574CF79C7A',8,'speeddial','FUT SALES','4383858',NULL),(23382,'SEPD0574CF79C7A',9,'speeddial','Cust Disservice','3825968',NULL),(23383,'SEPD0574CF79C7A',10,'speeddial','OPERATOR','0',NULL),(23384,'SEPD0574CF79C7A',11,'speeddial','West Payphone','3805',NULL),(23385,'SEPD0574CF79C7A',12,'speeddial','N.Bad Payphone','3802',NULL),(23386,'SEPD0574CF79C7A',13,'speeddial','Effigy Payphone','3801',NULL),(23387,'SEPD0574CF79C7A',14,'speeddial','XRoads Payphone','3806',NULL),(23388,'SEPD0574CF79C7A',15,'speeddial','East Pager','7201',NULL),(23389,'SEPD0574CF79C7A',16,'speeddial','XRoadsPager','7202',NULL),(23390,'SEPD0574CF79C7A',17,'speeddial','West Pager','7203',NULL),(23391,'SEPD0574CF79C7A',18,'speeddial','Kidvil Payphone','3804',NULL),(23392,'SEPD0574CF79C7A',19,'speeddial','MISFITS','15556473487',NULL),(23393,'SEPD0574CF79C7A',20,'speeddial','ILL Ananas','262627',NULL),(23394,'SEPD0574CF79C7A',21,'speeddial','Circle of Water','438938',NULL),(23395,'SEPD0574CF79C7A',22,'speeddial','SO SASSY','666',NULL),(23396,'SEPD0574CF79C7A',23,'speeddial','Sens Station','76779',NULL),(23397,'SEPD0574CF79C7A',24,'speeddial','Bass Gravy','976',NULL),(23398,'SEPD0574CF79C7A',25,'speeddial','Aquanaughties','6682782',NULL),(23399,'SEPD0574CF79C7A',26,'speeddial','Chill TF Out','24455',NULL),(23400,'SEPD0574CF79C7A',27,'speeddial','Tiki Kiki','28887',NULL),(23401,'SEPD0574CF79C7A',28,'speeddial','ICE','423',NULL),(23402,'SEPD0574CF79C7A',29,'speeddial','Jammie','526643',NULL),(23403,'SEPD0574CF79C7A',30,'speeddial','1 800 MEOW','18006369',NULL),(23404,'SEPD0574CF79C7A',31,'speeddial','Greeter Payphone','3803',NULL),(23405,'SEPD0574CF79C7A',32,'speeddial','Tech Support','7448224',NULL),(23406,'SEPD0574CF79C7A',33,'speeddial','test','111',NULL),(23407,'SEPD0574CF79C7A',34,'speeddial','tester','333',NULL),(23408,'SEPD0574CF79C7A',35,'speeddial','RANGERS','999',NULL),(23409,'SEPD0574CF79C7A',36,'speeddial','CampCamp','22672267',NULL),(23410,'SEPD0574CF79C7A',37,'speeddial','Curmudgeon Camp','478679',NULL),(23411,'SEPD0574CF79C7A',38,'speeddial','FACELAZERS','3223529377',NULL),(23412,'SEPD0574CF79C7A',39,'speeddial','YAY','929',NULL),(23413,'SEPD0574CF79C7A',40,'speeddial','DHABA','34222',NULL),(23414,'SEPD0574CF79C7A',41,'speeddial','Snail Tinder','786',NULL),(23415,'SEPD0574CF79C7A',42,'speeddial','PHHH','4697976',NULL),(23416,'SEPD0574CF79C7A',43,'speeddial','Punk in Drublic','666999',NULL),(23417,'SEPD0574CF79C7A',44,'speeddial','CHRISTMAS TOWN','72682',NULL),(23418,'SEPD0574CF79C7A',45,'speeddial','Badlands HOA','2462',NULL),(23419,'SEPD0574CF79C7A',46,'speeddial','Cosmic Creatures','267642',NULL),(23420,'SEPD0574CF79C7A',47,'speeddial','Arson Around','27766',NULL),(23421,'SEPD0574CF79C7A',48,'speeddial','Stamp Camp','1800782678',NULL),(23422,'SEPD0574CF79C7A',49,'speeddial','WonderFuckers','420',NULL),(23423,'SEPD0574CF79C7A',50,'speeddial','Velvet Pocket','41187',NULL),(23424,'SEPD0574CF79C7A',51,'empty','empty','empty',NULL),(23425,'SEPD0574CF79C7A',52,'empty','empty','empty',NULL),(23426,'SEPD0574CF79C7A',53,'empty','empty','empty',NULL),(23427,'SEPD0574CF79C7A',54,'empty','empty','empty',NULL),(23428,'SEP002414B37A3F',1,'line','3825968','3825968',1404),(23429,'SEP002414B37A3F',2,'speeddial','RANDOM','726366',1404),(23430,'SEP002414B37A3F',3,'empty','empty','empty',NULL),(23431,'SEP002414B37A3F',4,'empty','empty','empty',NULL),(23432,'SEP002414B37A3F',5,'empty','empty','empty',NULL),(23433,'SEP002414B37A3F',6,'empty','empty','empty',NULL),(23434,'SEP002414B37A3F',7,'speeddial','COLLECTIONS','2655328',NULL),(23435,'SEP002414B37A3F',8,'speeddial','FUT SALES','4383858',NULL),(23436,'SEP002414B37A3F',9,'speeddial','Cust Disservice','3825968',NULL),(23437,'SEP002414B37A3F',10,'speeddial','OPERATOR','0',NULL),(23438,'SEP002414B37A3F',11,'speeddial','West Payphone','3805',NULL),(23439,'SEP002414B37A3F',12,'speeddial','N.Bad Payphone','3802',NULL),(23440,'SEP002414B37A3F',13,'speeddial','Effigy Payphone','3801',NULL),(23441,'SEP002414B37A3F',14,'speeddial','XRoads Payphone','3806',NULL),(23442,'SEP002414B37A3F',15,'speeddial','East Pager','7201',NULL),(23443,'SEP002414B37A3F',16,'speeddial','XRoadsPager','7202',NULL),(23444,'SEP002414B37A3F',17,'speeddial','West Pager','7203',NULL),(23445,'SEP002414B37A3F',18,'speeddial','Kidvil Payphone','3804',NULL),(23446,'SEP002414B37A3F',19,'speeddial','MISFITS','15556473487',NULL),(23447,'SEP002414B37A3F',20,'speeddial','ILL Ananas','262627',NULL),(23448,'SEP002414B37A3F',21,'speeddial','Circle of Water','438938',NULL),(23449,'SEP002414B37A3F',22,'speeddial','SO SASSY','666',NULL),(23450,'SEP002414B37A3F',23,'speeddial','Sens Station','76779',NULL),(23451,'SEP002414B37A3F',24,'speeddial','Bass Gravy','976',NULL),(23452,'SEP002414B37A3F',25,'speeddial','Aquanaughties','6682782',NULL),(23453,'SEP002414B37A3F',26,'speeddial','Chill TF Out','24455',NULL),(23454,'SEP002414B37A3F',27,'speeddial','Tiki Kiki','28887',NULL),(23455,'SEP002414B37A3F',28,'speeddial','ICE','423',NULL),(23456,'SEP002414B37A3F',29,'speeddial','Jammie','526643',NULL),(23457,'SEP002414B37A3F',30,'speeddial','1 800 MEOW','18006369',NULL),(23458,'SEP002414B37A3F',31,'speeddial','Greeter Payphone','3803',NULL),(23459,'SEP002414B37A3F',32,'speeddial','Tech Support','7448224',NULL),(23460,'SEP002414B37A3F',33,'speeddial','test','111',NULL),(23461,'SEP002414B37A3F',34,'speeddial','tester','333',NULL),(23462,'SEP002414B37A3F',35,'speeddial','RANGERS','999',NULL),(23463,'SEP002414B37A3F',36,'speeddial','CampCamp','22672267',NULL),(23464,'SEP002414B37A3F',37,'speeddial','Curmudgeon Camp','478679',NULL),(23465,'SEP002414B37A3F',38,'speeddial','FACELAZERS','3223529377',NULL),(23466,'SEP002414B37A3F',39,'speeddial','YAY','929',NULL),(23467,'SEP002414B37A3F',40,'speeddial','DHABA','34222',NULL),(23468,'SEP002414B37A3F',41,'speeddial','Snail Tinder','786',NULL),(23469,'SEP002414B37A3F',42,'speeddial','PHHH','4697976',NULL),(23470,'SEP002414B37A3F',43,'speeddial','Punk in Drublic','666999',NULL),(23471,'SEP002414B37A3F',44,'speeddial','CHRISTMAS TOWN','72682',NULL),(23472,'SEP002414B37A3F',45,'speeddial','Badlands HOA','2462',NULL),(23473,'SEP002414B37A3F',46,'speeddial','Cosmic Creatures','267642',NULL),(23474,'SEP002414B37A3F',47,'speeddial','Arson Around','27766',NULL),(23475,'SEP002414B37A3F',48,'speeddial','Stamp Camp','1800782678',NULL),(23476,'SEP002414B37A3F',49,'speeddial','WonderFuckers','420',NULL),(23477,'SEP002414B37A3F',50,'speeddial','Velvet Pocket','41187',NULL),(23478,'SEP002414B37A3F',51,'empty','empty','empty',NULL),(23479,'SEP002414B37A3F',52,'empty','empty','empty',NULL),(23480,'SEP002414B37A3F',53,'empty','empty','empty',NULL),(23481,'SEP002414B37A3F',54,'empty','empty','empty',NULL),(23482,'SEPD0574CF794A2',1,'line','0','0',1405),(23483,'SEPD0574CF794A2',2,'speeddial','RANDOM','726366',1405),(23484,'SEPD0574CF794A2',3,'empty','empty','empty',NULL),(23485,'SEPD0574CF794A2',4,'empty','empty','empty',NULL),(23486,'SEPD0574CF794A2',5,'empty','empty','empty',NULL),(23487,'SEPD0574CF794A2',6,'empty','empty','empty',NULL),(23488,'SEPD0574CF794A2',7,'speeddial','COLLECTIONS','2655328',NULL),(23489,'SEPD0574CF794A2',8,'speeddial','FUT SALES','4383858',NULL),(23490,'SEPD0574CF794A2',9,'speeddial','Cust Disservice','3825968',NULL),(23491,'SEPD0574CF794A2',10,'speeddial','OPERATOR','0',NULL),(23492,'SEPD0574CF794A2',11,'speeddial','West Payphone','3805',NULL),(23493,'SEPD0574CF794A2',12,'speeddial','N.Bad Payphone','3802',NULL),(23494,'SEPD0574CF794A2',13,'speeddial','Effigy Payphone','3801',NULL),(23495,'SEPD0574CF794A2',14,'speeddial','XRoads Payphone','3806',NULL),(23496,'SEPD0574CF794A2',15,'speeddial','East Pager','7201',NULL),(23497,'SEPD0574CF794A2',16,'speeddial','XRoadsPager','7202',NULL),(23498,'SEPD0574CF794A2',17,'speeddial','West Pager','7203',NULL),(23499,'SEPD0574CF794A2',18,'speeddial','Kidvil Payphone','3804',NULL),(23500,'SEPD0574CF794A2',19,'speeddial','MISFITS','15556473487',NULL),(23501,'SEPD0574CF794A2',20,'speeddial','ILL Ananas','262627',NULL),(23502,'SEPD0574CF794A2',21,'speeddial','Circle of Water','438938',NULL),(23503,'SEPD0574CF794A2',22,'speeddial','SO SASSY','666',NULL),(23504,'SEPD0574CF794A2',23,'speeddial','Sens Station','76779',NULL),(23505,'SEPD0574CF794A2',24,'speeddial','Bass Gravy','976',NULL),(23506,'SEPD0574CF794A2',25,'speeddial','Aquanaughties','6682782',NULL),(23507,'SEPD0574CF794A2',26,'speeddial','Chill TF Out','24455',NULL),(23508,'SEPD0574CF794A2',27,'speeddial','Tiki Kiki','28887',NULL),(23509,'SEPD0574CF794A2',28,'speeddial','ICE','423',NULL),(23510,'SEPD0574CF794A2',29,'speeddial','Jammie','526643',NULL),(23511,'SEPD0574CF794A2',30,'speeddial','1 800 MEOW','18006369',NULL),(23512,'SEPD0574CF794A2',31,'speeddial','Greeter Payphone','3803',NULL),(23513,'SEPD0574CF794A2',32,'speeddial','Tech Support','7448224',NULL),(23514,'SEPD0574CF794A2',33,'speeddial','test','111',NULL),(23515,'SEPD0574CF794A2',34,'speeddial','tester','333',NULL),(23516,'SEPD0574CF794A2',35,'speeddial','RANGERS','999',NULL),(23517,'SEPD0574CF794A2',36,'speeddial','CampCamp','22672267',NULL),(23518,'SEPD0574CF794A2',37,'speeddial','Curmudgeon Camp','478679',NULL),(23519,'SEPD0574CF794A2',38,'speeddial','FACELAZERS','3223529377',NULL),(23520,'SEPD0574CF794A2',39,'speeddial','YAY','929',NULL),(23521,'SEPD0574CF794A2',40,'speeddial','DHABA','34222',NULL),(23522,'SEPD0574CF794A2',41,'speeddial','Snail Tinder','786',NULL),(23523,'SEPD0574CF794A2',42,'speeddial','PHHH','4697976',NULL),(23524,'SEPD0574CF794A2',43,'speeddial','Punk in Drublic','666999',NULL),(23525,'SEPD0574CF794A2',44,'speeddial','CHRISTMAS TOWN','72682',NULL),(23526,'SEPD0574CF794A2',45,'speeddial','Badlands HOA','2462',NULL),(23527,'SEPD0574CF794A2',46,'speeddial','Cosmic Creatures','267642',NULL),(23528,'SEPD0574CF794A2',47,'speeddial','Arson Around','27766',NULL),(23529,'SEPD0574CF794A2',48,'speeddial','Stamp Camp','1800782678',NULL),(23530,'SEPD0574CF794A2',49,'speeddial','WonderFuckers','420',NULL),(23531,'SEPD0574CF794A2',50,'speeddial','Velvet Pocket','41187',NULL),(23532,'SEPD0574CF794A2',51,'empty','empty','empty',NULL),(23533,'SEPD0574CF794A2',52,'empty','empty','empty',NULL),(23534,'SEPD0574CF794A2',53,'empty','empty','empty',NULL),(23535,'SEPD0574CF794A2',54,'empty','empty','empty',NULL),(23536,'SEP0016464BB150',1,'line','111','111',1406),(23537,'SEP0015F915297A',1,'line','999','999',1407),(23538,'SEP0011BB0DE105',1,'line','22672267','22672267',1408),(23539,'SEP0011BB0DE105',2,'speeddial','RANDOM','726366',1408),(23540,'SEP0011BB0DE10B',1,'line','478679','478679',1409),(23541,'SEP0011BB0DE10B',2,'speeddial','RANDOM','726366',1409),(23542,'SEP0011BB0DE0F8',1,'line','3223529377','3223529377',1410),(23543,'SEP0011BB0DE0F8',2,'speeddial','RANDOM','726366',1410),(23544,'SEP0011BB0DDB53',1,'line','929','929',1411),(23545,'SEP0011BB0DDB53',2,'speeddial','RANDOM','726366',1411),(23546,'SEP001562767D9D',1,'line','34222','34222',1412),(23547,'SEP001562767D9D',2,'speeddial','RANDOM','726366',1412),(23548,'SEP0011BB0DE1D8',1,'line','786','786',1413),(23549,'SEP0011BB0DE1D8',2,'speeddial','RANDOM','726366',1413),(23550,'SEP001646806BB8',1,'line','4697976','4697976',1414),(23551,'SEP001646806BB8',2,'speeddial','RANDOM','726366',1414),(23552,'SEP0015626A569D',1,'line','15556473487','15556473487',1415),(23553,'SEP0015626A569D',2,'speeddial','RANDOM','726366',1415),(23554,'SEP00131AE5C78F',1,'line','262627','262627',1416),(23555,'SEP00131AE5C78F',2,'speeddial','RANDOM','726366',1416),(23556,'SEP0013C4D1790C',1,'line','438938','438938',1417),(23557,'SEP0013C4D1790C',2,'speeddial','RANDOM','726366',1417),(23558,'SEP000F8F59C5D3',1,'line','666','666',1418),(23559,'SEP000F8F59C5D3',2,'speeddial','RANDOM','726366',1418),(23560,'SEP001562695B25',1,'line','76779','76779',1419),(23561,'SEP001562695B25',2,'speeddial','RANDOM','726366',1419),(23562,'SEP0015629F897C',1,'line','976','976',1420),(23563,'SEP0015629F897C',2,'speeddial','RANDOM','726366',1420),(23564,'SEP0015626A51FD',1,'line','6682782','6682782',1421),(23565,'SEP0015626A51FD',2,'speeddial','RANDOM','726366',1421),(23566,'SEP0015F914025B',1,'line','24455','24455',1422),(23567,'SEP0015F914025B',2,'speeddial','RANDOM','726366',1422),(23568,'SEP0015F914028C',1,'line','28887','28887',1423),(23569,'SEP0015F914028C',2,'speeddial','RANDOM','726366',1423),(23570,'SEP001562869F5B',1,'line','423','423',1424),(23571,'SEP0015F9B3928E',1,'line','526643','526643',1425),(23572,'SEP0015F9B3928E',1,'line','18006369','18006369',1425),(23573,'SEP0015F9B3928E',2,'speeddial','RANDOM','726366',1425),(23574,'SEP0016C8C3CE4A',1,'line','666999','666999',1426),(23575,'SEP0016C8C3CE4A',2,'speeddial','RANDOM','726366',1426),(23576,'SEP0016C8C3C9BB',1,'line','72682','72682',1427),(23577,'SEP0016C8C3C9BB',2,'speeddial','RANDOM','726366',1427),(23578,'SEP0011BB0DDB83',1,'line','2462','2462',1428),(23579,'SEP0011BB0DDB83',2,'speeddial','RANDOM','726366',1428),(23580,'SEP0013C4FBBFA6',1,'line','267642','267642',1429),(23581,'SEP0013C4FBBFA6',2,'speeddial','RANDOM','726366',1429),(23582,'SEP0014A8936901',1,'line','27766','27766',1430),(23583,'SEP0014A8936901',2,'speeddial','RANDOM','726366',1430),(23584,'SEP0011BB0DE46E',1,'line','1800782678','1800782678',1431),(23585,'SEP0011BB0DE46E',2,'speeddial','RANDOM','726366',1431),(23586,'SEP0011BB0DE1DE',1,'line','420','420',1432),(23587,'SEP0011BB0DE1DE',2,'speeddial','RANDOM','726366',1432);
/*!40000 ALTER TABLE `buttonconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdr` (
  `accountcode` varchar(80) DEFAULT NULL,
  `src` varchar(80) DEFAULT NULL,
  `dst` varchar(80) DEFAULT NULL,
  `dcontext` varchar(80) DEFAULT NULL,
  `clid` varchar(80) DEFAULT NULL,
  `channel` varchar(80) DEFAULT NULL,
  `dstchannel` varchar(80) DEFAULT NULL,
  `lastapp` varchar(80) DEFAULT NULL,
  `lastdata` varchar(80) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `answer` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `billsec` int(11) DEFAULT NULL,
  `disposition` varchar(45) DEFAULT NULL,
  `amaflags` varchar(45) DEFAULT NULL,
  `userfield` varchar(256) DEFAULT NULL,
  `uniqueid` varchar(150) DEFAULT NULL,
  `linkedid` varchar(150) DEFAULT NULL,
  `peeraccount` varchar(80) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `exten` varchar(40) NOT NULL,
  `priority` int(11) NOT NULL,
  `app` varchar(40) NOT NULL,
  `appdata` varchar(256) NOT NULL,
  `sccpline_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context` (`context`,`exten`,`priority`),
  UNIQUE KEY `id` (`id`),
  KEY `sccpline_id` (`sccpline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3931 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
INSERT INTO `extensions` VALUES (3835,'default','2655328',1,'Dial','SCCP/2655328',NULL),(3836,'default','2655328',2,'Voicemail','2655328@default,u',NULL),(3837,'default','4383858',1,'Dial','SCCP/4383858',NULL),(3838,'default','4383858',2,'Voicemail','4383858@default,u',NULL),(3839,'default','3825968',1,'Dial','SCCP/3825968',NULL),(3840,'default','3825968',2,'Voicemail','3825968@default,u',NULL),(3841,'default','0',1,'Dial','SCCP/0',NULL),(3842,'default','0',2,'Voicemail','0@default,u',NULL),(3843,'default','3802',1,'Dial','SIP/ATA-25L1',NULL),(3844,'default','3802',2,'Voicemail','3802@default,u',NULL),(3845,'default','3801',1,'Dial','SIP/ATA-24L1',NULL),(3846,'default','3801',2,'Voicemail','3801@default,u',NULL),(3847,'default','3806',1,'Dial','SIP/ATA-17L1',NULL),(3848,'default','3806',2,'Voicemail','3806@default,u',NULL),(3849,'default','7201',1,'Dial','SIP/PA36',NULL),(3850,'default','7201',2,'Voicemail','7201@default,u',NULL),(3851,'default','7202',1,'Dial','SIP/PA6',NULL),(3852,'default','7202',2,'Voicemail','7202@default,u',NULL),(3853,'default','7203',1,'Dial','SIP/PA12',NULL),(3854,'default','7203',2,'Voicemail','7203@default,u',NULL),(3855,'default','3804',1,'Dial','SIP/ATA-27L1',NULL),(3856,'default','3804',2,'Voicemail','3804@default,u',NULL),(3857,'default','3803',1,'Dial','SIP/ATA-20L1',NULL),(3858,'default','3803',2,'Voicemail','3803@default,u',NULL),(3859,'default','7448224',1,'Dial','SIP/shitbag',NULL),(3860,'default','7448224',2,'Voicemail','7448224@default,u',NULL),(3861,'default','111',1,'Dial','SCCP/111',NULL),(3862,'default','111',2,'Voicemail','111@default,u',NULL),(3863,'default','3805',1,'Dial','SIP/ATA-23L1',NULL),(3864,'default','3805',2,'Voicemail','3805@default,u',NULL),(3865,'default','333',1,'Dial','SIP/3efb8',NULL),(3866,'default','333',2,'Voicemail','333@default,u',NULL),(3867,'default','999',1,'Dial','SCCP/999',NULL),(3868,'default','999',2,'Voicemail','999@default,u',NULL),(3869,'default','22672267',1,'Dial','SCCP/22672267',NULL),(3870,'default','22672267',2,'Voicemail','22672267@default,u',NULL),(3871,'default','478679',1,'Dial','SCCP/478679',NULL),(3872,'default','478679',2,'Voicemail','478679@default,u',NULL),(3873,'default','3223529377',1,'Dial','SCCP/3223529377',NULL),(3874,'default','3223529377',2,'Voicemail','3223529377@default,u',NULL),(3875,'default','929',1,'Dial','SCCP/929',NULL),(3876,'default','929',2,'Voicemail','929@default,u',NULL),(3877,'default','34222',1,'Dial','SCCP/34222',NULL),(3878,'default','34222',2,'Voicemail','34222@default,u',NULL),(3879,'default','786',1,'Dial','SCCP/786',NULL),(3880,'default','786',2,'Voicemail','786@default,u',NULL),(3881,'default','4697976',1,'Dial','SCCP/4697976',NULL),(3882,'default','4697976',2,'Voicemail','4697976@default,u',NULL),(3883,'default','15556473487',1,'Dial','SCCP/15556473487',NULL),(3884,'default','15556473487',2,'Voicemail','15556473487@default,u',NULL),(3885,'default','262627',1,'Dial','SCCP/262627',NULL),(3886,'default','262627',2,'Voicemail','262627@default,u',NULL),(3887,'default','438938',1,'Dial','SCCP/438938',NULL),(3888,'default','438938',2,'Voicemail','438938@default,u',NULL),(3889,'default','666',1,'Dial','SCCP/666',NULL),(3890,'default','666',2,'Voicemail','666@default,u',NULL),(3891,'default','76779',1,'Dial','SCCP/76779',NULL),(3892,'default','76779',2,'Voicemail','76779@default,u',NULL),(3893,'default','976',1,'Dial','SCCP/976',NULL),(3894,'default','976',2,'Voicemail','976@default,u',NULL),(3895,'default','6682782',1,'Dial','SCCP/6682782',NULL),(3896,'default','6682782',2,'Voicemail','6682782@default,u',NULL),(3897,'default','24455',1,'Dial','SCCP/24455',NULL),(3898,'default','24455',2,'Voicemail','24455@default,u',NULL),(3899,'default','28887',1,'Dial','SCCP/28887',NULL),(3900,'default','28887',2,'Voicemail','28887@default,u',NULL),(3901,'default','423',1,'Dial','SCCP/423',NULL),(3902,'default','423',2,'Voicemail','423@default,u',NULL),(3903,'default','526643',1,'Dial','SCCP/526643',NULL),(3904,'default','526643',2,'Voicemail','526643@default,u',NULL),(3905,'default','18006369',1,'Dial','SCCP/18006369',NULL),(3906,'default','18006369',2,'Voicemail','18006369@default,u',NULL),(3907,'default','666999',1,'Dial','SCCP/666999',NULL),(3908,'default','666999',2,'Voicemail','666999@default,u',NULL),(3909,'default','72682',1,'Dial','SCCP/72682',NULL),(3910,'default','72682',2,'Voicemail','72682@default,u',NULL),(3911,'default','2462',1,'Dial','SCCP/2462',NULL),(3912,'default','2462',2,'Voicemail','2462@default,u',NULL),(3913,'default','267642',1,'Dial','SCCP/267642',NULL),(3914,'default','267642',2,'Voicemail','267642@default,u',NULL),(3915,'default','27766',1,'Dial','SCCP/27766',NULL),(3916,'default','27766',2,'Voicemail','27766@default,u',NULL),(3917,'default','1800782678',1,'Dial','SCCP/1800782678',NULL),(3918,'default','1800782678',2,'Voicemail','1800782678@default,u',NULL),(3919,'default','420',1,'Dial','SCCP/420',NULL),(3920,'default','420',2,'Voicemail','420@default,u',NULL),(3921,'default','41187',1,'Dial','SIP/899a6',NULL),(3922,'default','41187',2,'Voicemail','41187@default,u',NULL),(3923,'default','1005',1,'Dial','SIP/8abfa',NULL),(3924,'default','1005',2,'Voicemail','1005@default,u',NULL),(3925,'default','5282',1,'Dial','SIP/827dc',NULL),(3926,'default','5282',2,'Voicemail','5282@default,u',NULL),(3927,'default','872',1,'Dial','SIP/85d94',NULL),(3928,'default','872',2,'Voicemail','872@default,u',NULL),(3929,'default','334',1,'Dial','SIP/ATA-24L1',NULL),(3930,'default','334',2,'Voicemail','334@default,u',NULL);
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iaxfriends`
--

DROP TABLE IF EXISTS `iaxfriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaxfriends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `dbsecret` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `regcontext` varchar(40) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `defaultip` varchar(20) DEFAULT NULL,
  `sourceaddress` varchar(20) DEFAULT NULL,
  `mask` varchar(20) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `mohinterpret` varchar(20) DEFAULT NULL,
  `mohsuggest` varchar(20) DEFAULT NULL,
  `inkeys` varchar(40) DEFAULT NULL,
  `outkeys` varchar(40) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `callerid` varchar(100) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `sendani` enum('yes','no') DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunk` enum('yes','no') DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `maxauthreq` int(11) DEFAULT NULL,
  `requirecalltoken` enum('yes','no','auto') DEFAULT NULL,
  `encryption` enum('yes','no','aes128') DEFAULT NULL,
  `transfer` enum('yes','no','mediaonly') DEFAULT NULL,
  `jitterbuffer` enum('yes','no') DEFAULT NULL,
  `forcejitterbuffer` enum('yes','no') DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `codecpriority` varchar(40) DEFAULT NULL,
  `qualify` varchar(10) DEFAULT NULL,
  `qualifysmoothing` enum('yes','no') DEFAULT NULL,
  `qualifyfreqok` varchar(10) DEFAULT NULL,
  `qualifyfreqnotok` varchar(10) DEFAULT NULL,
  `timezone` varchar(20) DEFAULT NULL,
  `adsi` enum('yes','no') DEFAULT NULL,
  `amaflags` varchar(20) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `iaxfriends_name` (`name`),
  KEY `iaxfriends_name_host` (`name`,`host`),
  KEY `iaxfriends_name_ipaddr_port` (`name`,`ipaddr`,`port`),
  KEY `iaxfriends_ipaddr_port` (`ipaddr`,`port`),
  KEY `iaxfriends_host_port` (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iaxfriends`
--

LOCK TABLES `iaxfriends` WRITE;
/*!40000 ALTER TABLE `iaxfriends` DISABLE KEYS */;
/*!40000 ALTER TABLE `iaxfriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetme`
--

DROP TABLE IF EXISTS `meetme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetme` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `confno` varchar(80) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `adminpin` varchar(20) DEFAULT NULL,
  `opts` varchar(20) DEFAULT NULL,
  `adminopts` varchar(20) DEFAULT NULL,
  `recordingfilename` varchar(80) DEFAULT NULL,
  `recordingformat` varchar(10) DEFAULT NULL,
  `maxusers` int(11) DEFAULT NULL,
  `members` int(11) NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `meetme_confno_start_end` (`confno`,`starttime`,`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetme`
--

LOCK TABLES `meetme` WRITE;
/*!40000 ALTER TABLE `meetme` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiconhold`
--

DROP TABLE IF EXISTS `musiconhold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musiconhold` (
  `name` varchar(80) NOT NULL,
  `mode` enum('custom','files','mp3nb','quietmp3nb','quietmp3') DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `digit` varchar(1) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiconhold`
--

LOCK TABLES `musiconhold` WRITE;
/*!40000 ALTER TABLE `musiconhold` DISABLE KEYS */;
/*!40000 ALTER TABLE `musiconhold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_aors`
--

DROP TABLE IF EXISTS `ps_aors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_aors` (
  `id` varchar(40) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `default_expiration` int(11) DEFAULT NULL,
  `mailboxes` varchar(80) DEFAULT NULL,
  `max_contacts` int(11) DEFAULT NULL,
  `minimum_expiration` int(11) DEFAULT NULL,
  `remove_existing` enum('yes','no') DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `maximum_expiration` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_aors_id` (`id`),
  KEY `ps_aors_qualifyfreq_contact` (`qualify_frequency`,`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_aors`
--

LOCK TABLES `ps_aors` WRITE;
/*!40000 ALTER TABLE `ps_aors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_aors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_auths`
--

DROP TABLE IF EXISTS `ps_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_auths` (
  `id` varchar(40) NOT NULL,
  `auth_type` enum('md5','userpass') DEFAULT NULL,
  `nonce_lifetime` int(11) DEFAULT NULL,
  `md5_cred` varchar(40) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `realm` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_auths_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_auths`
--

LOCK TABLES `ps_auths` WRITE;
/*!40000 ALTER TABLE `ps_auths` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_contacts`
--

DROP TABLE IF EXISTS `ps_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contacts` (
  `id` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `expiration_time` bigint(20) DEFAULT NULL,
  `qualify_frequency` int(11) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `path` text,
  `user_agent` varchar(255) DEFAULT NULL,
  `qualify_timeout` float DEFAULT NULL,
  `reg_server` varchar(20) DEFAULT NULL,
  `authenticate_qualify` enum('yes','no') DEFAULT NULL,
  `via_addr` varchar(40) DEFAULT NULL,
  `via_port` int(11) DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ps_contacts_uq` (`id`,`reg_server`),
  KEY `ps_contacts_id` (`id`),
  KEY `ps_contacts_qualifyfreq_exp` (`qualify_frequency`,`expiration_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_contacts`
--

LOCK TABLES `ps_contacts` WRITE;
/*!40000 ALTER TABLE `ps_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_domain_aliases`
--

DROP TABLE IF EXISTS `ps_domain_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_domain_aliases` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_domain_aliases_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_domain_aliases`
--

LOCK TABLES `ps_domain_aliases` WRITE;
/*!40000 ALTER TABLE `ps_domain_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_domain_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoint_id_ips`
--

DROP TABLE IF EXISTS `ps_endpoint_id_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoint_id_ips` (
  `id` varchar(40) NOT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `match` varchar(80) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoint_id_ips_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoint_id_ips`
--

LOCK TABLES `ps_endpoint_id_ips` WRITE;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_endpoint_id_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_endpoints`
--

DROP TABLE IF EXISTS `ps_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_endpoints` (
  `id` varchar(40) NOT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `aors` varchar(200) DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT NULL,
  `allow` varchar(200) DEFAULT NULL,
  `direct_media` enum('yes','no') DEFAULT NULL,
  `connected_line_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_method` enum('invite','reinvite','update') DEFAULT NULL,
  `direct_media_glare_mitigation` enum('none','outgoing','incoming') DEFAULT NULL,
  `disable_direct_media_on_nat` enum('yes','no') DEFAULT NULL,
  `dtmf_mode` enum('rfc4733','inband','info','auto') DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `force_rport` enum('yes','no') DEFAULT NULL,
  `ice_support` enum('yes','no') DEFAULT NULL,
  `identify_by` enum('username','auth_username') DEFAULT NULL,
  `mailboxes` varchar(40) DEFAULT NULL,
  `moh_suggest` varchar(40) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `rewrite_contact` enum('yes','no') DEFAULT NULL,
  `rtp_ipv6` enum('yes','no') DEFAULT NULL,
  `rtp_symmetric` enum('yes','no') DEFAULT NULL,
  `send_diversion` enum('yes','no') DEFAULT NULL,
  `send_pai` enum('yes','no') DEFAULT NULL,
  `send_rpid` enum('yes','no') DEFAULT NULL,
  `timers_min_se` int(11) DEFAULT NULL,
  `timers` enum('forced','no','required','yes') DEFAULT NULL,
  `timers_sess_expires` int(11) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `callerid_privacy` enum('allowed_not_screened','allowed_passed_screened','allowed_failed_screened','allowed','prohib_not_screened','prohib_passed_screened','prohib_failed_screened','prohib','unavailable') DEFAULT NULL,
  `callerid_tag` varchar(40) DEFAULT NULL,
  `100rel` enum('no','required','yes') DEFAULT NULL,
  `aggregate_mwi` enum('yes','no') DEFAULT NULL,
  `trust_id_inbound` enum('yes','no') DEFAULT NULL,
  `trust_id_outbound` enum('yes','no') DEFAULT NULL,
  `use_ptime` enum('yes','no') DEFAULT NULL,
  `use_avpf` enum('yes','no') DEFAULT NULL,
  `media_encryption` enum('no','sdes','dtls') DEFAULT NULL,
  `inband_progress` enum('yes','no') DEFAULT NULL,
  `call_group` varchar(40) DEFAULT NULL,
  `pickup_group` varchar(40) DEFAULT NULL,
  `named_call_group` varchar(40) DEFAULT NULL,
  `named_pickup_group` varchar(40) DEFAULT NULL,
  `device_state_busy_at` int(11) DEFAULT NULL,
  `fax_detect` enum('yes','no') DEFAULT NULL,
  `t38_udptl` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ec` enum('none','fec','redundancy') DEFAULT NULL,
  `t38_udptl_maxdatagram` int(11) DEFAULT NULL,
  `t38_udptl_nat` enum('yes','no') DEFAULT NULL,
  `t38_udptl_ipv6` enum('yes','no') DEFAULT NULL,
  `tone_zone` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `one_touch_recording` enum('yes','no') DEFAULT NULL,
  `record_on_feature` varchar(40) DEFAULT NULL,
  `record_off_feature` varchar(40) DEFAULT NULL,
  `rtp_engine` varchar(40) DEFAULT NULL,
  `allow_transfer` enum('yes','no') DEFAULT NULL,
  `allow_subscribe` enum('yes','no') DEFAULT NULL,
  `sdp_owner` varchar(40) DEFAULT NULL,
  `sdp_session` varchar(40) DEFAULT NULL,
  `tos_audio` varchar(10) DEFAULT NULL,
  `tos_video` varchar(10) DEFAULT NULL,
  `sub_min_expiry` int(11) DEFAULT NULL,
  `from_domain` varchar(40) DEFAULT NULL,
  `from_user` varchar(40) DEFAULT NULL,
  `mwi_from_user` varchar(40) DEFAULT NULL,
  `dtls_verify` varchar(40) DEFAULT NULL,
  `dtls_rekey` varchar(40) DEFAULT NULL,
  `dtls_cert_file` varchar(200) DEFAULT NULL,
  `dtls_private_key` varchar(200) DEFAULT NULL,
  `dtls_cipher` varchar(200) DEFAULT NULL,
  `dtls_ca_file` varchar(200) DEFAULT NULL,
  `dtls_ca_path` varchar(200) DEFAULT NULL,
  `dtls_setup` enum('active','passive','actpass') DEFAULT NULL,
  `srtp_tag_32` enum('yes','no') DEFAULT NULL,
  `media_address` varchar(40) DEFAULT NULL,
  `redirect_method` enum('user','uri_core','uri_pjsip') DEFAULT NULL,
  `set_var` text,
  `cos_audio` int(11) DEFAULT NULL,
  `cos_video` int(11) DEFAULT NULL,
  `message_context` varchar(40) DEFAULT NULL,
  `force_avp` enum('yes','no') DEFAULT NULL,
  `media_use_received_transport` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `user_eq_phone` enum('yes','no') DEFAULT NULL,
  `moh_passthrough` enum('yes','no') DEFAULT NULL,
  `media_encryption_optimistic` enum('yes','no') DEFAULT NULL,
  `rpid_immediate` enum('yes','no') DEFAULT NULL,
  `g726_non_standard` enum('yes','no') DEFAULT NULL,
  `rtp_keepalive` int(11) DEFAULT NULL,
  `rtp_timeout` int(11) DEFAULT NULL,
  `rtp_timeout_hold` int(11) DEFAULT NULL,
  `bind_rtp_to_media_address` enum('yes','no') DEFAULT NULL,
  `voicemail_extension` varchar(40) DEFAULT NULL,
  `mwi_subscribe_replaces_unsolicited` int(11) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `acl` varchar(40) DEFAULT NULL,
  `contact_deny` varchar(95) DEFAULT NULL,
  `contact_permit` varchar(95) DEFAULT NULL,
  `contact_acl` varchar(40) DEFAULT NULL,
  `subscribe_context` varchar(40) DEFAULT NULL,
  `fax_detect_timeout` int(11) DEFAULT NULL,
  `contact_user` varchar(80) DEFAULT NULL,
  `asymmetric_rtp_codec` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_endpoints_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_endpoints`
--

LOCK TABLES `ps_endpoints` WRITE;
/*!40000 ALTER TABLE `ps_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_globals`
--

DROP TABLE IF EXISTS `ps_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_globals` (
  `id` varchar(40) NOT NULL,
  `max_forwards` int(11) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `default_outbound_endpoint` varchar(40) DEFAULT NULL,
  `debug` varchar(40) DEFAULT NULL,
  `endpoint_identifier_order` varchar(40) DEFAULT NULL,
  `max_initial_qualify_time` int(11) DEFAULT NULL,
  `default_from_user` varchar(80) DEFAULT NULL,
  `keep_alive_interval` int(11) DEFAULT NULL,
  `regcontext` varchar(80) DEFAULT NULL,
  `contact_expiration_check_interval` int(11) DEFAULT NULL,
  `default_voicemail_extension` varchar(40) DEFAULT NULL,
  `disable_multi_domain` enum('yes','no') DEFAULT NULL,
  `unidentified_request_count` int(11) DEFAULT NULL,
  `unidentified_request_period` int(11) DEFAULT NULL,
  `unidentified_request_prune_interval` int(11) DEFAULT NULL,
  `default_realm` varchar(40) DEFAULT NULL,
  `mwi_tps_queue_high` int(11) DEFAULT NULL,
  `mwi_tps_queue_low` int(11) DEFAULT NULL,
  `mwi_disable_initial_unsolicited` enum('yes','no') DEFAULT NULL,
  `ignore_uri_user_options` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_globals_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_globals`
--

LOCK TABLES `ps_globals` WRITE;
/*!40000 ALTER TABLE `ps_globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_registrations`
--

DROP TABLE IF EXISTS `ps_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_registrations` (
  `id` varchar(40) NOT NULL,
  `auth_rejection_permanent` enum('yes','no') DEFAULT NULL,
  `client_uri` varchar(255) DEFAULT NULL,
  `contact_user` varchar(40) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `max_retries` int(11) DEFAULT NULL,
  `outbound_auth` varchar(40) DEFAULT NULL,
  `outbound_proxy` varchar(40) DEFAULT NULL,
  `retry_interval` int(11) DEFAULT NULL,
  `forbidden_retry_interval` int(11) DEFAULT NULL,
  `server_uri` varchar(255) DEFAULT NULL,
  `transport` varchar(40) DEFAULT NULL,
  `support_path` enum('yes','no') DEFAULT NULL,
  `fatal_retry_interval` int(11) DEFAULT NULL,
  `line` enum('yes','no') DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_registrations_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_registrations`
--

LOCK TABLES `ps_registrations` WRITE;
/*!40000 ALTER TABLE `ps_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_subscription_persistence`
--

DROP TABLE IF EXISTS `ps_subscription_persistence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_subscription_persistence` (
  `id` varchar(40) NOT NULL,
  `packet` varchar(2048) DEFAULT NULL,
  `src_name` varchar(128) DEFAULT NULL,
  `src_port` int(11) DEFAULT NULL,
  `transport_key` varchar(64) DEFAULT NULL,
  `local_name` varchar(128) DEFAULT NULL,
  `local_port` int(11) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `endpoint` varchar(40) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_subscription_persistence_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_subscription_persistence`
--

LOCK TABLES `ps_subscription_persistence` WRITE;
/*!40000 ALTER TABLE `ps_subscription_persistence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_subscription_persistence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_systems`
--

DROP TABLE IF EXISTS `ps_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_systems` (
  `id` varchar(40) NOT NULL,
  `timer_t1` int(11) DEFAULT NULL,
  `timer_b` int(11) DEFAULT NULL,
  `compact_headers` enum('yes','no') DEFAULT NULL,
  `threadpool_initial_size` int(11) DEFAULT NULL,
  `threadpool_auto_increment` int(11) DEFAULT NULL,
  `threadpool_idle_timeout` int(11) DEFAULT NULL,
  `threadpool_max_size` int(11) DEFAULT NULL,
  `disable_tcp_switch` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_systems_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_systems`
--

LOCK TABLES `ps_systems` WRITE;
/*!40000 ALTER TABLE `ps_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_transports`
--

DROP TABLE IF EXISTS `ps_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_transports` (
  `id` varchar(40) NOT NULL,
  `async_operations` int(11) DEFAULT NULL,
  `bind` varchar(40) DEFAULT NULL,
  `ca_list_file` varchar(200) DEFAULT NULL,
  `cert_file` varchar(200) DEFAULT NULL,
  `cipher` varchar(200) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  `external_media_address` varchar(40) DEFAULT NULL,
  `external_signaling_address` varchar(40) DEFAULT NULL,
  `external_signaling_port` int(11) DEFAULT NULL,
  `method` enum('default','unspecified','tlsv1','sslv2','sslv3','sslv23') DEFAULT NULL,
  `local_net` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `priv_key_file` varchar(200) DEFAULT NULL,
  `protocol` enum('udp','tcp','tls','ws','wss') DEFAULT NULL,
  `require_client_cert` enum('yes','no') DEFAULT NULL,
  `verify_client` enum('yes','no') DEFAULT NULL,
  `verify_server` enum('yes','no') DEFAULT NULL,
  `tos` varchar(10) DEFAULT NULL,
  `cos` int(11) DEFAULT NULL,
  `allow_reload` enum('yes','no') DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `ps_transports_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_transports`
--

LOCK TABLES `ps_transports` WRITE;
/*!40000 ALTER TABLE `ps_transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_members`
--

DROP TABLE IF EXISTS `queue_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_members` (
  `queue_name` varchar(80) NOT NULL,
  `interface` varchar(80) NOT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `state_interface` varchar(80) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(11) DEFAULT NULL,
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`queue_name`,`interface`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_members`
--

LOCK TABLES `queue_members` WRITE;
/*!40000 ALTER TABLE `queue_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_rules`
--

DROP TABLE IF EXISTS `queue_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_rules` (
  `rule_name` varchar(80) NOT NULL,
  `time` varchar(32) NOT NULL,
  `min_penalty` varchar(32) NOT NULL,
  `max_penalty` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_rules`
--

LOCK TABLES `queue_rules` WRITE;
/*!40000 ALTER TABLE `queue_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues`
--

DROP TABLE IF EXISTS `queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues` (
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `ringinuse` enum('yes','no') DEFAULT NULL,
  `setinterfacevar` enum('yes','no') DEFAULT NULL,
  `setqueuevar` enum('yes','no') DEFAULT NULL,
  `setqueueentryvar` enum('yes','no') DEFAULT NULL,
  `monitor_format` varchar(8) DEFAULT NULL,
  `membermacro` varchar(512) DEFAULT NULL,
  `membergosub` varchar(512) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_quantity1` varchar(128) DEFAULT NULL,
  `queue_quantity2` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_minute` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_callerannounce` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_to_first_user` enum('yes','no') DEFAULT NULL,
  `min_announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `announce_position` varchar(128) DEFAULT NULL,
  `announce_position_limit` int(11) DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `relative_periodic_announce` enum('yes','no') DEFAULT NULL,
  `random_periodic_announce` enum('yes','no') DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `penaltymemberslimit` int(11) DEFAULT NULL,
  `autofill` enum('yes','no') DEFAULT NULL,
  `monitor_type` varchar(128) DEFAULT NULL,
  `autopause` enum('yes','no','all') DEFAULT NULL,
  `autopausedelay` int(11) DEFAULT NULL,
  `autopausebusy` enum('yes','no') DEFAULT NULL,
  `autopauseunavail` enum('yes','no') DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` enum('ringall','leastrecent','fewestcalls','random','rrmemory','linear','wrandom','rrordered') DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `reportholdtime` enum('yes','no') DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` enum('yes','no') DEFAULT NULL,
  `defaultrule` varchar(128) DEFAULT NULL,
  `timeoutpriority` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queues`
--

LOCK TABLES `queues` WRITE;
/*!40000 ALTER TABLE `queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sccpdevice`
--

DROP TABLE IF EXISTS `sccpdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sccpdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `addon` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `tzoffset` varchar(5) DEFAULT NULL,
  `transfer` varchar(5) DEFAULT 'on',
  `cfwdall` varchar(5) DEFAULT 'on',
  `cfwdbusy` varchar(5) DEFAULT 'on',
  `imageversion` varchar(45) DEFAULT NULL,
  `deny` varchar(45) DEFAULT NULL,
  `permit` varchar(45) DEFAULT NULL,
  `dndFeature` varchar(5) DEFAULT 'off',
  `directrtp` varchar(3) DEFAULT '',
  `earlyrtp` varchar(10) DEFAULT 'progress',
  `mwilamp` varchar(5) DEFAULT 'on',
  `mwioncall` varchar(5) DEFAULT 'off',
  `pickupexten` varchar(5) DEFAULT 'on',
  `pickupcontext` varchar(100) DEFAULT '',
  `pickupmodeanswer` varchar(5) DEFAULT 'on',
  `private` varchar(5) DEFAULT 'off',
  `privacy` varchar(100) DEFAULT 'full',
  `nat` varchar(4) DEFAULT 'auto',
  `softkeyset` varchar(100) DEFAULT '',
  `audio_tos` varchar(11) DEFAULT NULL,
  `audio_cos` varchar(1) DEFAULT NULL,
  `video_tos` varchar(11) DEFAULT NULL,
  `video_cos` varchar(1) DEFAULT NULL,
  `conf_allow` varchar(3) DEFAULT 'on',
  `conf_play_general_announce` varchar(3) DEFAULT 'on',
  `conf_play_part_announce` varchar(3) DEFAULT 'on',
  `conf_mute_on_entry` varchar(3) DEFAULT 'off',
  `conf_music_on_hold_class` varchar(80) DEFAULT 'default',
  `conf_show_conflist` varchar(3) DEFAULT 'on',
  `setvar` varchar(100) DEFAULT NULL,
  `disallow` varchar(255) DEFAULT NULL,
  `allow` varchar(255) DEFAULT NULL,
  `backgroundImage` varchar(255) DEFAULT NULL,
  `ringtone` varchar(255) DEFAULT NULL,
  `name` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `sccpdevice_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sccpdevice`
--

LOCK TABLES `sccpdevice` WRITE;
/*!40000 ALTER TABLE `sccpdevice` DISABLE KEYS */;
INSERT INTO `sccpdevice` VALUES (1402,'7965',NULL,'1 FUT HQ',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP5067AEE17403'),(1403,'7965',NULL,'1 FUT HQ',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEPD0574CF79C7A'),(1404,'7965',NULL,'1 FUT HQ',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP002414B37A3F'),(1405,'7965',NULL,'1 FUT HQ',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEPD0574CF794A2'),(1406,'7960',NULL,'0 - test',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0016464BB150'),(1407,'7940',NULL,'Ranger HQ',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015F915297A'),(1408,'7940',NULL,'Camp Camp',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DE105'),(1409,'7940',NULL,'Curmudgeons',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DE10B'),(1410,'7940',NULL,'FaceLazers',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DE0F8'),(1411,'7940',NULL,'Yayborhood',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DDB53'),(1412,'7940',NULL,'Dhaba',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP001562767D9D'),(1413,'7940',NULL,'Snail Tinder Mail',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DE1D8'),(1414,'7940',NULL,'Pyropolis Hash House Harriers',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP001646806BB8'),(1415,'7940',NULL,'Misfit Wanderland ',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015626A569D'),(1416,'7940',NULL,'Illuminating Ananas',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP00131AE5C78F'),(1417,'7940',NULL,'Circle of Water',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0013C4D1790C'),(1418,'7940',NULL,'So Sassy',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP000F8F59C5D3'),(1419,'7940',NULL,'Sensation Station',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP001562695B25'),(1420,'7940',NULL,'Bass Gravy',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015629F897C'),(1421,'7940',NULL,'Aquanaughties',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015626A51FD'),(1422,'7940',NULL,'Camp Chill the Fuck Out',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015F914025B'),(1423,'7940',NULL,'Tiki Kiki',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015F914028C'),(1424,'7940',NULL,'ICE',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP001562869F5B'),(1425,'7960',NULL,'Jammie Camp',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0015F9B3928E'),(1426,'7960',NULL,'Punk in Drublic',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0016C8C3CE4A'),(1427,'7960',NULL,'Christmas Town!!!',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0016C8C3C9BB'),(1428,'7940',NULL,'Badlands HOA',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DDB83'),(1429,'7940',NULL,'Cosmic Creatures',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0013C4FBBFA6'),(1430,'7940',NULL,'Arson Around',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0014A8936901'),(1431,'7940',NULL,'Stamp Camp',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DE46E'),(1432,'7940',NULL,'Wonderlounge Fuckers',NULL,'on','on','on',NULL,NULL,NULL,'off','','progress','on','off','on','','on','off','full','auto','',NULL,NULL,NULL,NULL,'on','on','on','off','default','on',NULL,NULL,NULL,NULL,NULL,'SEP0011BB0DE1DE');
/*!40000 ALTER TABLE `sccpdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sccpdeviceconfig`
--

DROP TABLE IF EXISTS `sccpdeviceconfig`;
/*!50001 DROP VIEW IF EXISTS `sccpdeviceconfig`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sccpdeviceconfig` AS SELECT 
 1 AS `button`,
 1 AS `type`,
 1 AS `addon`,
 1 AS `description`,
 1 AS `tzoffset`,
 1 AS `transfer`,
 1 AS `cfwdall`,
 1 AS `cfwdbusy`,
 1 AS `imageversion`,
 1 AS `deny`,
 1 AS `permit`,
 1 AS `dndFeature`,
 1 AS `directrtp`,
 1 AS `earlyrtp`,
 1 AS `mwilamp`,
 1 AS `mwioncall`,
 1 AS `pickupexten`,
 1 AS `pickupcontext`,
 1 AS `pickupmodeanswer`,
 1 AS `private`,
 1 AS `privacy`,
 1 AS `nat`,
 1 AS `softkeyset`,
 1 AS `audio_tos`,
 1 AS `audio_cos`,
 1 AS `video_tos`,
 1 AS `video_cos`,
 1 AS `conf_allow`,
 1 AS `conf_play_general_announce`,
 1 AS `conf_play_part_announce`,
 1 AS `conf_mute_on_entry`,
 1 AS `conf_music_on_hold_class`,
 1 AS `conf_show_conflist`,
 1 AS `setvar`,
 1 AS `disallow`,
 1 AS `allow`,
 1 AS `backgroundImage`,
 1 AS `ringtone`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sccpline`
--

DROP TABLE IF EXISTS `sccpline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sccpline` (
  `id` varchar(30) NOT NULL,
  `pin` varchar(45) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `context` varchar(45) DEFAULT 'default',
  `incominglimit` varchar(45) DEFAULT '2',
  `transfer` varchar(45) DEFAULT 'on',
  `mailbox` varchar(45) DEFAULT NULL,
  `vmnum` varchar(45) DEFAULT '2000',
  `cid_name` varchar(45) DEFAULT NULL,
  `cid_num` varchar(45) DEFAULT NULL,
  `trnsfvm` varchar(45) DEFAULT '10',
  `secondary_dialtone_digits` varchar(45) DEFAULT NULL,
  `secondary_dialtone_tone` varchar(45) DEFAULT NULL,
  `musicclass` varchar(45) DEFAULT 'default',
  `language` varchar(45) DEFAULT 'en',
  `accountcode` varchar(45) DEFAULT NULL,
  `echocancel` varchar(45) DEFAULT 'on',
  `silencesuppression` varchar(45) DEFAULT 'on',
  `callgroup` varchar(45) DEFAULT NULL,
  `pickupgroup` varchar(45) DEFAULT NULL,
  `amaflags` varchar(45) DEFAULT NULL,
  `dnd` varchar(7) DEFAULT 'reject',
  `setvar` varchar(50) DEFAULT NULL,
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `sccpline_id` (`id`),
  KEY `sccpline_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sccpline`
--

LOCK TABLES `sccpline` WRITE;
/*!40000 ALTER TABLE `sccpline` DISABLE KEYS */;
INSERT INTO `sccpline` VALUES ('0','0','0-OPERATOR','OPERATOR','default','2','on','0','2000','OPERATOR','0','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'0'),('111','111','111-test','test','default','2','on','111','2000','test','111','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'111'),('15556473487','15556473487','15556473487-MISFITS','MISFITS','default','2','on','15556473487','2000','MISFITS','15556473487','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'15556473487'),('18006369','18006369','18006369-1 800 MEOW','1 800 MEOW','default','2','on','18006369','2000','1 800 MEOW','18006369','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'18006369'),('1800782678','1800782678','1800782678-Stamp Camp','Stamp Camp','default','2','on','1800782678','2000','Stamp Camp','1800782678','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'1800782678'),('22672267','22672267','22672267-CampCamp','CampCamp','default','2','on','22672267','2000','CampCamp','22672267','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'22672267'),('24455','24455','24455-Chill TF Out','Chill TF Out','default','2','on','24455','2000','Chill TF Out','24455','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'24455'),('2462','2462','2462-Badlands HOA','Badlands HOA','default','2','on','2462','2000','Badlands HOA','2462','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'2462'),('262627','262627','262627-ILL Ananas','ILL Ananas','default','2','on','262627','2000','ILL Ananas','262627','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'262627'),('2655328','2655328','2655328-COLLECTIONS','COLLECTIONS','default','2','on','2655328','2000','COLLECTIONS','2655328','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'2655328'),('267642','267642','267642-Cosmic Creatures','Cosmic Creatures','default','2','on','267642','2000','Cosmic Creatures','267642','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'267642'),('27766','27766','27766-Arson Around','Arson Around','default','2','on','27766','2000','Arson Around','27766','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'27766'),('28887','28887','28887-Tiki Kiki','Tiki Kiki','default','2','on','28887','2000','Tiki Kiki','28887','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'28887'),('3223529377','3223529377','3223529377-FACELAZERS','FACELAZERS','default','2','on','3223529377','2000','FACELAZERS','3223529377','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'3223529377'),('34222','34222','34222-DHABA','DHABA','default','2','on','34222','2000','DHABA','34222','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'34222'),('3825968','3825968','3825968-Cust Disservice','Cust Disservice','default','2','on','3825968','2000','Cust Disservice','3825968','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'3825968'),('420','420','420-WonderFuckers','WonderFuckers','default','2','on','420','2000','WonderFuckers','420','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'420'),('423','423','423-ICE','ICE','default','2','on','423','2000','ICE','423','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'423'),('4383858','4383858','4383858-FUT SALES','FUT SALES','default','2','on','4383858','2000','FUT SALES','4383858','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'4383858'),('438938','438938','438938-Circle of Water','Circle of Water','default','2','on','438938','2000','Circle of Water','438938','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'438938'),('4697976','4697976','4697976-PHHH','PHHH','default','2','on','4697976','2000','PHHH','4697976','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'4697976'),('478679','478679','478679-Curmudgeon Camp','Curmudgeon Camp','default','2','on','478679','2000','Curmudgeon Camp','478679','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'478679'),('526643','526643','526643-Jammie','Jammie','default','2','on','526643','2000','Jammie','526643','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'526643'),('666','666','666-SO SASSY','SO SASSY','default','2','on','666','2000','SO SASSY','666','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'666'),('666999','666999','666999-Punk in Drublic','Punk in Drublic','default','2','on','666999','2000','Punk in Drublic','666999','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'666999'),('6682782','6682782','6682782-Aquanaughties','Aquanaughties','default','2','on','6682782','2000','Aquanaughties','6682782','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'6682782'),('72682','72682','72682-CHRISTMAS TOWN','CHRISTMAS TOWN','default','2','on','72682','2000','CHRISTMAS TOWN','72682','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'72682'),('76779','76779','76779-Sens Station','Sens Station','default','2','on','76779','2000','Sens Station','76779','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'76779'),('786','786','786-Snail Tinder','Snail Tinder','default','2','on','786','2000','Snail Tinder','786','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'786'),('929','929','929-YAY','YAY','default','2','on','929','2000','YAY','929','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'929'),('976','976','976-Bass Gravy','Bass Gravy','default','2','on','976','2000','Bass Gravy','976','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'976'),('999','999','999-RANGERS','RANGERS','default','2','on','999','2000','RANGERS','999','10',NULL,NULL,'default','en',NULL,'on','on',NULL,NULL,NULL,'off',NULL,'999');
/*!40000 ALTER TABLE `sccpline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sippeers`
--

DROP TABLE IF EXISTS `sippeers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sippeers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `ipaddr` varchar(45) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(40) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT 'dynamic',
  `type` enum('friend','user','peer') DEFAULT 'friend',
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','tls','ws','wss','udp,tcp','tcp,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT 'auto',
  `directmedia` enum('yes','no','nonat','update','outgoing') DEFAULT NULL,
  `nat` varchar(29) DEFAULT 'no',
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `disallow` varchar(200) DEFAULT 'all',
  `allow` varchar(200) DEFAULT 'ulaw',
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(80) DEFAULT NULL,
  `setvar` varchar(200) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT 'yes',
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(95) DEFAULT NULL,
  `contactdeny` varchar(95) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `supportpath` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sippeers_name` (`name`),
  KEY `sippeers_name_host` (`name`,`host`),
  KEY `sippeers_ipaddr_port` (`ipaddr`,`port`),
  KEY `sippeers_host_port` (`host`,`port`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sippeers`
--

LOCK TABLES `sippeers` WRITE;
/*!40000 ALTER TABLE `sippeers` DISABLE KEYS */;
INSERT INTO `sippeers` VALUES (631,'ATA-25L1','172.16.36.128',5060,1716821876,'ATA-25L1','sip:ATA-25L1@172.16.36.128','','Grandstream HT287 1.1.0.45 DevId 000b822ad51c',0,'dynamic','friend','default',NULL,NULL,'ATA-25L1',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N.Bad Payphone',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N.Bad Payphone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(633,'ATA-17L1','172.16.6.217',5060,1716822845,'ATA-17L1','sip:ATA-17L1@172.16.6.217:5060','','Grandstream HT-502 V1.2A 1.0.5.10',0,'dynamic','friend','default',NULL,NULL,'ATA-17L1',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XRoads Payphone',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XRoads Payphone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(634,'PA36','172.16.36.1',45178,1716823552,'PA36-0x865778','sip:PA36-0xbcb778@172.16.36.1:45178','','baresip v0.4.11 (mips/linux)',0,'dynamic','friend','default',NULL,NULL,'PA36',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'East Pager',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'East Pager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(635,'PA6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dynamic','friend','default',NULL,NULL,'PA6',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XRoadsPager',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XRoadsPager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(636,'PA12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dynamic','friend','default',NULL,NULL,'PA12',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'West Pager',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'West Pager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(637,'ATA-27L1','172.16.70.234',5060,1716826606,'ATA-27L1','sip:ATA-27L1@172.16.70.234','','Grandstream HT287 1.1.0.45 DevId 000b82390b7c',0,'dynamic','friend','default',NULL,NULL,'ATA-27L1',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Kidvil Payphone',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Kidvil Payphone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(638,'ATA-20L1','172.16.63.167',5060,1716821693,'ATA-20L1','sip:ATA-20L1@172.16.63.167','','Grandstream HT287 1.1.0.45 DevId 000b821fa53d',0,'dynamic','friend','default',NULL,NULL,'ATA-20L1',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Greeter Payphone',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Greeter Payphone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(639,'shitbag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dynamic','friend','default',NULL,NULL,'shitbag',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tech Support',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tech Support',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(640,'ATA-23L1','172.16.3.158',5060,1716819445,'ATA-23L1','sip:ATA-23L1@172.16.3.158','','Grandstream HT287 1.1.0.45 DevId 000b82155e5c',0,'dynamic','friend','default',NULL,NULL,'ATA-23L1',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'West Payphone',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'West Payphone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(641,'3efb8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dynamic','friend','default',NULL,NULL,'3efb8',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tester',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tester',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(642,'899a6','172.16.11.126',5060,1716823669,'899a6','sip:899a6@172.16.11.126:5060^3Btransport=UDP^3Buser=phone','','<Motorola VT1000 mac: 000F9F1899A6 sw:VT20_01.2.d4 ln:0 cfg:3.0>',0,'dynamic','friend','default',NULL,NULL,'899a6',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Velvet Pocket',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Velvet Pocket',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(643,'8abfa','172.16.18.210',5060,1716818830,'8abfa','sip:8abfa@172.16.18.210:5060^3Btransport=UDP^3Buser=phone','','<Motorola VT1000 mac: 000F9F18ABFA sw:VT20_01.2.d4 ln:0 cfg:3.0>',0,'dynamic','friend','default',NULL,NULL,'8abfa',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'KFLIP',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'KFLIP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(644,'827dc','172.16.38.180',5060,1716817730,'827dc','sip:827dc@172.16.38.180:5060^3Btransport=UDP^3Buser=phone','','<Motorola VT1000 mac: 000F9F1827DC sw:VT20_01.2.d4 ln:0 cfg:3.0>',0,'dynamic','friend','default',NULL,NULL,'827dc',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lava Lounge',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lava Lounge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(645,'85d94','',0,0,'85d94','','','',0,'dynamic','friend','default',NULL,NULL,'85d94',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trailer Park',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trailer Park',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(646,'ATA-24L1','',0,0,'ATA-24L1','','','',0,'dynamic','friend','default',NULL,NULL,'ATA-24L1',NULL,NULL,NULL,'auto',NULL,'no',NULL,NULL,NULL,'all','ulaw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Effigy Payphone',NULL,'yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Effigy Payphone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sippeers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail`
--

DROP TABLE IF EXISTS `voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(80) NOT NULL,
  `mailbox` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `fullname` varchar(80) DEFAULT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `pager` varchar(80) DEFAULT NULL,
  `attach` enum('yes','no') DEFAULT NULL,
  `attachfmt` varchar(10) DEFAULT NULL,
  `serveremail` varchar(80) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `deletevoicemail` enum('yes','no') DEFAULT NULL,
  `saycid` enum('yes','no') DEFAULT NULL,
  `sendvoicemail` enum('yes','no') DEFAULT NULL,
  `review` enum('yes','no') DEFAULT NULL,
  `tempgreetwarn` enum('yes','no') DEFAULT NULL,
  `operator` enum('yes','no') DEFAULT NULL,
  `envelope` enum('yes','no') DEFAULT NULL,
  `sayduration` int(11) DEFAULT NULL,
  `forcename` enum('yes','no') DEFAULT NULL,
  `forcegreetings` enum('yes','no') DEFAULT NULL,
  `callback` varchar(80) DEFAULT NULL,
  `dialout` varchar(80) DEFAULT NULL,
  `exitcontext` varchar(80) DEFAULT NULL,
  `maxmsg` int(11) DEFAULT NULL,
  `volgain` decimal(5,2) DEFAULT NULL,
  `imapuser` varchar(80) DEFAULT NULL,
  `imappassword` varchar(80) DEFAULT NULL,
  `imapserver` varchar(80) DEFAULT NULL,
  `imapport` varchar(8) DEFAULT NULL,
  `imapflags` varchar(80) DEFAULT NULL,
  `stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `voicemail_mailbox` (`mailbox`),
  KEY `voicemail_context` (`context`),
  KEY `voicemail_mailbox_context` (`mailbox`,`context`),
  KEY `voicemail_imapuser` (`imapuser`)
) ENGINE=InnoDB AUTO_INCREMENT=1935 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail`
--

LOCK TABLES `voicemail` WRITE;
/*!40000 ALTER TABLE `voicemail` DISABLE KEYS */;
INSERT INTO `voicemail` VALUES (1887,'default','2655328','','1 FUT HQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1888,'default','4383858','','1 FUT HQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1889,'default','3825968','','1 FUT HQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1890,'default','0','','1 FUT HQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1891,'default','3802','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1892,'default','3801','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1893,'default','3806','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1894,'default','7201','','1 Pagers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1895,'default','7202','','1 Pagers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1896,'default','7203','','1 Pagers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1897,'default','3804','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1898,'default','3803','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1899,'default','7448224','','0 - test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1900,'default','111','','0 - test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1901,'default','3805','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1902,'default','333','','1 FUT HQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1903,'default','999','','Ranger HQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1904,'default','22672267','','Camp Camp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1905,'default','478679','','Curmudgeons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1906,'default','3223529377','','FaceLazers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1907,'default','929','','Yayborhood',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1908,'default','34222','','Dhaba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1909,'default','786','','Snail Tinder Mail',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1910,'default','4697976','','Pyropolis Hash House Harriers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1911,'default','15556473487','','Misfit Wanderland ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1912,'default','262627','','Illuminating Ananas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1913,'default','438938','','Circle of Water',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1914,'default','666','','So Sassy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1915,'default','76779','','Sensation Station',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1916,'default','976','','Bass Gravy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1917,'default','6682782','','Aquanaughties',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1918,'default','24455','','Camp Chill the Fuck Out',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1919,'default','28887','','Tiki Kiki',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1920,'default','423','','ICE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1921,'default','526643','','Jammie Camp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1922,'default','18006369','','Jammie Camp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1923,'default','666999','','Punk in Drublic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1924,'default','72682','','Christmas Town!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1925,'default','2462','','Badlands HOA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1926,'default','267642','','Cosmic Creatures',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1927,'default','27766','','Arson Around',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1928,'default','1800782678','','Stamp Camp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1929,'default','420','','Wonderlounge Fuckers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1930,'default','41187','','Velvet Pocket',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1931,'default','1005','','KFLIP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1932,'default','5282','','Lava Lounge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1933,'default','872','','Trailer Park Bois',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1934,'default','334','','1 FUT Payphones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail_messages`
--

DROP TABLE IF EXISTS `voicemail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail_messages` (
  `dir` varchar(255) NOT NULL,
  `msgnum` int(11) NOT NULL,
  `context` varchar(80) DEFAULT NULL,
  `macrocontext` varchar(80) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `origtime` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `recording` longblob,
  `flag` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `mailboxuser` varchar(30) DEFAULT NULL,
  `mailboxcontext` varchar(30) DEFAULT NULL,
  `msg_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`dir`,`msgnum`),
  KEY `voicemail_messages_dir` (`dir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voicemail_messages`
--

LOCK TABLES `voicemail_messages` WRITE;
/*!40000 ALTER TABLE `voicemail_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `fuconfig`
--

USE `fuconfig`;

DROP USER IF EXISTS 'fuconfig';
CREATE USER 'fuconfig'@'%' IDENTIFIED BY 'fuconfig';
GRANT ALL PRIVILEGES ON fuconfig.* TO 'fuconfig'@'%';
GRANT ALL PRIVILEGES ON asteriskrealtime.* TO 'fuconfig'@'%';
FLUSH PRIVILEGES;
--
-- Current Database: `asteriskrealtime`
--

USE `asteriskrealtime`;

DROP USER IF EXISTS 'asteriskuser';
CREATE USER 'asteriskuser'@'%' IDENTIFIED BY 'asteriskBlah111';
GRANT ALL PRIVILEGES ON fuconfig.* TO 'fuconfig'@'%';
GRANT ALL PRIVILEGES ON asteriskrealtime.* TO 'asteriskuser'@'%';
FLUSH PRIVILEGES;

--
-- Final view structure for view `sccpdeviceconfig`
--

/*!50001 DROP VIEW IF EXISTS `sccpdeviceconfig`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`asteriskuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sccpdeviceconfig` AS select group_concat(concat_ws(',',`buttonconfig`.`type`,`buttonconfig`.`name`,`buttonconfig`.`options`) order by `buttonconfig`.`instance` ASC separator ';') AS `button`,`sccpdevice`.`type` AS `type`,`sccpdevice`.`addon` AS `addon`,`sccpdevice`.`description` AS `description`,`sccpdevice`.`tzoffset` AS `tzoffset`,`sccpdevice`.`transfer` AS `transfer`,`sccpdevice`.`cfwdall` AS `cfwdall`,`sccpdevice`.`cfwdbusy` AS `cfwdbusy`,`sccpdevice`.`imageversion` AS `imageversion`,`sccpdevice`.`deny` AS `deny`,`sccpdevice`.`permit` AS `permit`,`sccpdevice`.`dndFeature` AS `dndFeature`,`sccpdevice`.`directrtp` AS `directrtp`,`sccpdevice`.`earlyrtp` AS `earlyrtp`,`sccpdevice`.`mwilamp` AS `mwilamp`,`sccpdevice`.`mwioncall` AS `mwioncall`,`sccpdevice`.`pickupexten` AS `pickupexten`,`sccpdevice`.`pickupcontext` AS `pickupcontext`,`sccpdevice`.`pickupmodeanswer` AS `pickupmodeanswer`,`sccpdevice`.`private` AS `private`,`sccpdevice`.`privacy` AS `privacy`,`sccpdevice`.`nat` AS `nat`,`sccpdevice`.`softkeyset` AS `softkeyset`,`sccpdevice`.`audio_tos` AS `audio_tos`,`sccpdevice`.`audio_cos` AS `audio_cos`,`sccpdevice`.`video_tos` AS `video_tos`,`sccpdevice`.`video_cos` AS `video_cos`,`sccpdevice`.`conf_allow` AS `conf_allow`,`sccpdevice`.`conf_play_general_announce` AS `conf_play_general_announce`,`sccpdevice`.`conf_play_part_announce` AS `conf_play_part_announce`,`sccpdevice`.`conf_mute_on_entry` AS `conf_mute_on_entry`,`sccpdevice`.`conf_music_on_hold_class` AS `conf_music_on_hold_class`,`sccpdevice`.`conf_show_conflist` AS `conf_show_conflist`,`sccpdevice`.`setvar` AS `setvar`,`sccpdevice`.`disallow` AS `disallow`,`sccpdevice`.`allow` AS `allow`,`sccpdevice`.`backgroundImage` AS `backgroundImage`,`sccpdevice`.`ringtone` AS `ringtone`,`sccpdevice`.`name` AS `name` from (`sccpdevice` left join `buttonconfig` on((`buttonconfig`.`device` = `sccpdevice`.`name`))) group by `sccpdevice`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06  0:28:23
