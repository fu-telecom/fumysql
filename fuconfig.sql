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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-05  0:20:31
