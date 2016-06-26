-- MySQL dump 10.13  Distrib 5.5.20, for Win32 (x86)
--
-- Host: localhost    Database: phd
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `orderstatus` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,27,'2015-03-13 18:37:04','Order Completed',800),(2,27,'2015-03-13 18:38:39','Order Completed',800),(3,27,'2015-03-13 18:38:46','Order Completed',800),(4,27,'2015-03-13 18:39:12','Order Completed',800),(5,27,'2015-03-13 18:39:16','Order Completed',800),(6,27,'2015-03-13 18:39:59','Order Completed',1250),(7,27,'2015-03-13 18:40:10','Order Dispatched',1250),(8,27,'2015-03-13 18:40:15','Order Completed',1250),(9,27,'2015-03-13 18:42:07','Order Placed',450),(10,27,'2015-03-13 18:54:50','Order Completed',550),(11,27,'2015-03-13 19:03:59','Order Completed',500),(12,27,'2015-03-13 20:00:21','Order Dispatched',850),(13,27,'2015-03-13 20:23:52','Order Completed',450),(14,27,'2015-03-13 20:26:36','Order Completed',700),(15,27,'2015-03-13 20:30:07','Order Completed',700),(16,27,'2015-03-13 20:31:38','Order Completed',400),(17,27,'2015-03-14 13:44:44','Order Dispatched',350),(18,27,'2015-03-15 00:11:50','Order Completed',150),(19,27,'2015-03-15 03:08:05','Order Placed',1600),(20,27,'2015-03-15 11:43:10','Order Placed',950),(21,27,'2015-03-15 11:53:25','Order Placed',1450),(22,27,'2015-03-15 12:13:54','Order Completed',900),(23,27,'2015-03-15 13:08:35','Order Completed',400),(24,27,'2015-03-15 17:37:36','Order Completed',350);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzamenu`
--

DROP TABLE IF EXISTS `pizzamenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizzamenu` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzamenu`
--

LOCK TABLES `pizzamenu` WRITE;
/*!40000 ALTER TABLE `pizzamenu` DISABLE KEYS */;
INSERT INTO `pizzamenu` VALUES (1,1,'Regular',100),(2,1,'Medium',150),(3,1,'Large',200),(4,2,'Regular',150),(5,2,'Medium',200),(6,2,'Large',250),(7,3,'Regular',200),(8,3,'Medium',250),(9,3,'Large',350),(10,4,'Regular',250),(11,4,'Medium',350),(12,4,'Large',500),(13,5,'Regular',250),(14,5,'Medium',450),(15,5,'Large',600),(16,6,'Regular',300),(17,6,'Medium',500),(18,6,'Large',700);
/*!40000 ALTER TABLE `pizzamenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizzas` (
  `pid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
INSERT INTO `pizzas` VALUES (1,'Plain Cheese','Veg','A hugely popular margherita, with a deliciously tangy single cheese topping','images/veg1.jpg'),(2,'Country Special','Veg','For all those with a partiality for veggies, this one\'s loaded - crunchy onions, crisp capsicum and fresh juicy tomatoes','images/veg2.jpg'),(3,'SPICY TRIPLE TANGO','Veg','Get ready for a triple flavor treat! Sweet golden corn mingled with tangy Gherkins and luscious red paprika will make your taste buds do the tango','images/veg3.jpg'),(4,'Deluxe Veggie','Veg','For a vegetarian looking for a BIG treat that goes easy on the spices, this one\'s got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.','images/veg4.jpg'),(5,'Veg Wonder','Veg','Our chef\'s have put together the choicest vegetables to give you a fine dining pizza experience. Bite into a blend of tender Mushrooms, tangy Gherkins, crunchy Babycorn, Crisp Capsicum, fiery Red Paprika, Paneer and yummy liquid cheesy sauce. Yes, all in one pizza. Wonder indeed!','images/veg5.jpg'),(6,'Cloud 9 Pizza','Veg','A fully loaded hurricane of tasty vegetables, this pizza is one for all seasons and reasons. Onions,juicy tomatoes, crunchy baby corn, crisp capsicum, hot jalapeno and every vegetarian\'s first love: Paneer! ','images/veg6.jpg');
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `phoneno` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (27,'Amandeep Singh','8552071939','203,E-4, Shivshrushti Apartment, Shivaji Housing Society, SB Road','sudhirverma@gmail.com','sudhirverma','sudhirverma'),(28,'asdfasdf','1111111111','a','asdf@asdf.com','14030142005','asdfasdf'),(29,'Sudhir Verma','9999999999','203,E-4, , aaaaaaaaaa, SB Road','assssss014@gmail.com','kokokokoko','klklhjgjkgg'),(30,'Assssss','0855207193','203,E-4, Sdddddddddd, Shivaji Housing Society, SB Road','amddddd014@g885mail.com','amfffffffsingh','asdflkjh'),(31,'Sudhir Verma','9999999999','..','sudhirverma@gmail.com','pizzaadmin','asdfasdf');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-15 17:49:46
