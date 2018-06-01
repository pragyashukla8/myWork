CREATE DATABASE  IF NOT EXISTS `hplus` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hplus`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hplus
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `billingdata`
--

DROP TABLE IF EXISTS `billingdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingdata` (
  `CUSTOMERID` int(11) NOT NULL,
  `CARDDETAIL` varchar(20) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `expirydate` varchar(7) NOT NULL,
  PRIMARY KEY (`CUSTOMERID`,`CARDDETAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingdata`
--

LOCK TABLES `billingdata` WRITE;
/*!40000 ALTER TABLE `billingdata` DISABLE KEYS */;
INSERT INTO `billingdata` VALUES (1,'123456789','123','12/2022'),(2,'766876783','345','11/2020'),(3,'566758688','10/2020','123');
/*!40000 ALTER TABLE `billingdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingdata`
--

DROP TABLE IF EXISTS `bookingdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingdata` (
  `ORDERID` int(11) NOT NULL,
  `CUSTOMERID` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `SERVICEID` int(11) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `COST` decimal(10,2) NOT NULL,
  `QUANTITY` int(8) NOT NULL,
  `orderdate` varchar(10) NOT NULL,
  PRIMARY KEY (`ORDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingdata`
--

LOCK TABLES `bookingdata` WRITE;
/*!40000 ALTER TABLE `bookingdata` DISABLE KEYS */;
INSERT INTO `bookingdata` VALUES (1,1,2,1,'camry',20000.00,1,'04/23/2018'),(2,1,2,2,'Speed Sensor',2500.00,2,'04/20/2018'),(3,2,1,2,'Series 33-2260',1500.00,4,'04/22/2018'),(4,2,1,2,'REPC320703 Automatic Transmission Solenoid',4000.00,2,'04/23/2018'),(5,1,2,1,'Camry',25000.00,1,'04/24/2018'),(6,1,2,2,'Brake Pad Sensor',3500.00,1,'04/24/2018'),(7,1,2,1,'Camry',25000.00,1,'04/24/2018'),(8,1,2,2,'Brake Pad Sensor',3500.00,1,'04/24/2018'),(9,1,2,1,'Camry',25000.00,1,'04/24/2018'),(10,1,2,2,'Brake Pad Sensor',3500.00,1,'04/24/2018'),(11,1,2,1,'Camry',25000.00,1,'04/24/2018'),(12,1,2,2,'Brake Pad Sensor',3500.00,1,'04/24/2018'),(13,1,2,1,'Civic',35000.00,1,'04/25/2018'),(14,1,2,2,'Brake Pad Sensor',3500.00,1,'04/25/2018'),(15,1,2,1,'Civic',35000.00,1,'04/25/2018'),(16,2,1,2,'REPC320703 Automatic Transmission Solenoid',1500.00,1,'04/26/2018'),(17,2,2,2,'Brake Pad Sensor',3500.00,1,'04/26/2018'),(18,2,2,2,'Brake Pad Sensor',3500.00,1,'04/26/2018');
/*!40000 ALTER TABLE `bookingdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carinventory`
--

DROP TABLE IF EXISTS `carinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carinventory` (
  `CARID` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `SERVICEID` int(11) NOT NULL,
  `CARMODEL` varchar(50) NOT NULL,
  `CARMAKE` varchar(50) NOT NULL,
  `MILEAGE` varchar(10) NOT NULL,
  `YEARMAKE` varchar(4) NOT NULL,
  `STATUS` varchar(8) NOT NULL,
  `KMRUN` decimal(10,2) NOT NULL,
  `COST` decimal(10,2) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `COLOR` varchar(20) NOT NULL,
  `IMAGEPATH` varchar(300) NOT NULL,
  PRIMARY KEY (`CARID`,`PROVIDERID`,`SERVICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carinventory`
--

LOCK TABLES `carinventory` WRITE;
/*!40000 ALTER TABLE `carinventory` DISABLE KEYS */;
INSERT INTO `carinventory` VALUES (1,1,1,'Civic','Honda','20','2014','Used',45000.00,16000.00,'Good condition','Grey','images/civic-grey.jpg'),(2,2,1,'Camry','Toyota','20','2018','New',0.00,25000.00,'New car','Black','images/camry-black.jpeg'),(3,1,1,'K900','Kia','18','2016','Used',35000.00,10000.00,'hjkjhkj','White','images/k900-white.jpg'),(4,2,1,'V90','Volvo','20','2018','Used',20000.00,20000.00,'jhjkhk','Grey','images/v90-grey.jpg'),(5,2,1,'Corolla','Toyota','15','2013','Used',55000.00,15000.00,'hkjhjk','White','images/corolla-white.jpg'),(6,2,1,'Civic','Honda','25','2018','New',0.00,35000.00,'New vehicle','Grey','images/civic-grey.jpg'),(7,2,1,'XC60','Volvo','15','2015','Used',45000.00,16000.00,'hkjk','White','images/xc60-white.jpg'),(8,2,1,'V90','Kia','12','2011','Used',60000.00,9000.00,'hjhj','Grey','images/v90-grey.jpg');
/*!40000 ALTER TABLE `carinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carserviceregister`
--

DROP TABLE IF EXISTS `carserviceregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carserviceregister` (
  `CUSTOMERID` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `SERVICEID` int(11) NOT NULL,
  `CARID` int(11) NOT NULL,
  `CARMODEL` varchar(10) NOT NULL,
  `COST` decimal(10,2) NOT NULL,
  `BOOKINGDATE` date NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `UPDATIONDATE` date DEFAULT NULL,
  PRIMARY KEY (`CUSTOMERID`,`PROVIDERID`,`SERVICEID`,`CARID`,`BOOKINGDATE`),
  KEY `CARSERVICEREGISTER_FK1` (`SERVICEID`),
  KEY `CARSERVICEREGISTER_FK2` (`CARID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carserviceregister`
--

LOCK TABLES `carserviceregister` WRITE;
/*!40000 ALTER TABLE `carserviceregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `carserviceregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `CARTID` int(11) NOT NULL,
  `CUSTOMERID` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `SERVICEID` int(11) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `COST` decimal(10,2) NOT NULL,
  `QUANTITY` int(8) NOT NULL,
  PRIMARY KEY (`CARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `USERNAME` varchar(10) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `EMAILID` varchar(30) NOT NULL,
  `SECRETQUESTION` varchar(400) NOT NULL,
  `SECRETANSWER` varchar(400) NOT NULL,
  `USERTYPE` varchar(10) NOT NULL,
  PRIMARY KEY (`USERNAME`,`PASSWORD`,`EMAILID`),
  UNIQUE KEY `LOGIN_UK` (`EMAILID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','admin','admin@gmail.com','What was your birth city?','kanpur','Admin'),('pragya','12345','pshukla5@hawk.iit.edu','What was your birth city?','kanpur','Provider'),('pshukla5','Vikas@1627','pragya.shukla9@gmail.com','What was your first school?','vsec','Customer'),('vikasm','456','vikasm415@gmail.com','What was your birth city?','dehradun','Provider');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'mineralwater-blueberry','images/mineralwater-blueberry.jpg','2017-03-07','admin'),(2,'mineralwater-lemonlime','images/mineralwater-lemonlime.jpg','2017-06-01','admin'),(3,'mineralwater-blueberry','images/mineralwater-blueberry.jpg','2017-10-23','admin'),(4,'vitamin-bcomplex.jpg','images/vitamin-bcomplex.jpg','2016-12-02','admin'),(5,'proteinbar-peanutbutter.jpg','images/proteinbar-peanutbutter.jpg','2015-07-15','admin');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partinventory`
--

DROP TABLE IF EXISTS `partinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partinventory` (
  `PARTID` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `SERVICEID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `COST` decimal(10,2) NOT NULL,
  `STATUS` varchar(8) NOT NULL,
  `CATEGORY` varchar(50) NOT NULL,
  `imagepath` varchar(300) NOT NULL,
  PRIMARY KEY (`PARTID`,`PROVIDERID`,`SERVICEID`),
  KEY `PARTINVENTORY_FK1` (`SERVICEID`),
  KEY `PARTINVENTORY_FK2` (`PROVIDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partinventory`
--

LOCK TABLES `partinventory` WRITE;
/*!40000 ALTER TABLE `partinventory` DISABLE KEYS */;
INSERT INTO `partinventory` VALUES (5,1,2,'Brake','New',2000.00,'New','Brake','images/brake1.JPG'),(6,1,2,'REPF382401 EGR Line','njlklk',3000.00,'Used','Exhaust','images/exhaust2.JPG'),(7,2,2,'Brake','good condition',3500.00,'Used','Brake','images/brake1.JPG'),(8,2,2,'REPF382401 EGR Line','hkjhkjh',3000.00,'New','Exhaust','images/exhaust2.JPG'),(9,2,2,'REPF382401 EGR Line','New',3000.00,'New','Exhaust','images/exhaust2.JPG'),(10,1,2,'Series 33-2260','jhkhk',2000.00,'Used','Air Filter','images/air1.JPG'),(11,1,2,'REPF382401 EGR Line','jhkj',4000.00,'New','Exhaust','images/exhaust2.JPG'),(12,1,2,'Brake Pad Sensor','In good condition',2000.00,'Used','Brake','images/brake1.JPG');
/*!40000 ALTER TABLE `partinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partserviceregister`
--

DROP TABLE IF EXISTS `partserviceregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partserviceregister` (
  `CUSTOMERID` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `SERVICEID` int(11) NOT NULL,
  `PARTID` int(11) NOT NULL,
  `COST` decimal(10,2) NOT NULL,
  `BOOKINGDATE` date NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `UPDATIONDATE` date DEFAULT NULL,
  PRIMARY KEY (`CUSTOMERID`,`PROVIDERID`,`SERVICEID`,`PARTID`,`BOOKINGDATE`),
  KEY `PARTSERVICEREGISTER_FK1` (`SERVICEID`),
  KEY `PARTSERVICEREGISTER_FK2` (`PARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partserviceregister`
--

LOCK TABLES `partserviceregister` WRITE;
/*!40000 ALTER TABLE `partserviceregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `partserviceregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'mineralwater-blueberry','images/mineralwater-blueberry.jpg'),(2,'mineralwater-lemonlime','images/mineralwater-lemonlime.jpg'),(3,'mineralwater-orange','images/mineralwater-orange.jpg'),(4,'mineralwater-peach','images/mineralwater-peach.jpg'),(5,'mineralwater-raspberry','images/mineralwater-raspberry.jpg'),(6,'mineralwater-strawberry','images/mineralwater-strawberry.jpg'),(7,'proteinbar-chocolate','images/proteinbar-chocolate.jpg'),(8,'proteinbar-lemon','images/proteinbar-lemon.jpg'),(9,'proteinbar-peanutbutter','images/proteinbar-peanutbutter.jpg'),(10,'vitamin-a','images/vitamin-a.jpg'),(11,'vitamin-bcomplex','images/vitamin-bcomplex.jpg'),(12,'vitamin-calcium','images/vitamin-c.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `SERVICEID` int(11) NOT NULL,
  `SERVICENAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`SERVICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Car Sell','Able to sell Cars'),(2,'Part Sell','Able to sell parts');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USERID` int(11) NOT NULL,
  `FNAME` varchar(10) NOT NULL,
  `MNAME` varchar(10) DEFAULT NULL,
  `LNAME` varchar(10) NOT NULL,
  `CONTACT` varchar(10) NOT NULL,
  `ADDRESS` varchar(400) NOT NULL,
  `EMAILID` varchar(30) NOT NULL,
  `GENDER` varchar(6) NOT NULL,
  `ROLE` varchar(10) NOT NULL,
  `SERVICEID` int(11) DEFAULT NULL,
  `dateofbirth` varchar(10) NOT NULL,
  PRIMARY KEY (`USERID`),
  KEY `USERS_FK1` (`EMAILID`),
  KEY `USERS_FK2` (`SERVICEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Pragya','','Shukla','2242563656','5441NEastRiverRoad','pragya.shukla9@gmail.com','Female','Customer',0,'16/06/1989'),(2,'Vikas','','Mishra','2243230098','5441NEastRiverRoad','vikasm415@gmail.com','Male','Provider',0,'27/02/1986'),(3,'Pragya','','Shukla','2242563858','5441 N East river road APT 1208','pshukla5@hawk.iit.edu','Female','Provider',0,'06/16/1989'),(4,'admin',NULL,'admin','2242563858','5441 rive road','admin@gmail.com','Female','Admin',0,'06/16/1989');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hplus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-26 14:31:34
