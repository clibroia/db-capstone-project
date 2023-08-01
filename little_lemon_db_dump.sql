CREATE DATABASE  IF NOT EXISTS `little_lemon_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `little_lemon_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: little_lemon_db
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTableNo` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Bookings_Customers_idx` (`CustomerID`),
  CONSTRAINT `fk_Bookings_Customers` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-01-01',1,1),(2,'2023-01-01',2,5),(3,'2023-01-03',1,2),(4,'2023-01-03',2,3),(5,'2023-01-03',3,4),(6,'2023-01-09',1,1),(7,'2023-01-09',3,4),(12,'2022-11-12',3,3),(13,'2022-10-11',2,2),(14,'2022-10-13',2,1),(15,'2023-08-01',2,3),(16,'2023-08-16',6,3),(17,'2023-08-02',3,5);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `CustomerFirstName` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `CustomerLastName` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `CustomerPhoneNo` int NOT NULL,
  `CustomerEmail` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerPhoneNo_UNIQUE` (`CustomerPhoneNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Carmine','Libroia',123756954,'paperone@gmail.com'),(2,'Leonardo','Passalacqua',145956847,'paperino@gmail.com'),(3,'Anna','De Magistris',146523456,'minnie@gmail.com'),(4,'Debora','Altavilla',264574365,'paperina@gmail.com'),(5,'Gennaro','Saltafossi',562458743,'gastone@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL,
  `EmployeeFirstName` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `EmployeeLastName` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `EmployeeAddress` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EmployeePhoneNo` int NOT NULL,
  `EmployeeEmail` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EmployeeRole` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  `EmployeeSalary` decimal(10,0) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeePhoneNo_UNIQUE` (`EmployeePhoneNo`),
  UNIQUE KEY `EmployeeEmail_UNIQUE` (`EmployeeEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Napoleone','Bonaparte','Viale della Repubblica 31, Parigi',265457845,'rivoluzione@gmail.com','Manager',75000),(2,'Isaac','Newton','Via dell\'Astronomia 90, Roma',265475123,'scoperta@gmail.com','Head Chef',60000),(3,'Albert','Einstein','Corso Austria 89, Milano',256458951,'relativo@gmail.com','Head Waiter',60000),(4,'Italo','Svevo','Via della Resistenza 17, Trieste',258456149,'inetto@gmail.com','Assistant Chef',45000),(5,'Harry','Mason','Via del Silenzio 13, Milano',257946153,'silent@gmail.com','Waiter',30000),(6,'Scrooge','McDuck','Via Bancaria 77, Milano',256847623,'cashflow@gmail.com','Cashier',30000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ItemID` int NOT NULL,
  `ItemType` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  `ItemName` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `MenuID` int NOT NULL,
  PRIMARY KEY (`ItemID`),
  UNIQUE KEY `ItemName_UNIQUE` (`ItemName`),
  KEY `fk_Items_Menus_idx` (`MenuID`),
  CONSTRAINT `fk_Items_Menus` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Starters','Ham',6),(2,'Starters','Salted Egg',6),(3,'Starters','Chips',6),(4,'Courses','Ragù alla bolognese',1),(5,'Courses','Ratatouille',3),(6,'Couses','Greek Salad',2),(7,'Courses','Falafel',4),(8,'Courses','Hot pepperoni',5),(9,'Drinks','Grappa',1),(10,'Drinks','Champagne',3),(11,'Drinks','Tequila',5),(12,'Drinks','Greek liquor',2),(13,'Drinks','Tea',4),(14,'Drinks','Tap Water',6),(15,'Drinks','Bottled Water',6),(16,'Desserts','Tiramisù',1),(17,'Desserts','Greek Cake',2),(18,'Desserts','Mousse',3),(19,'Desserts','Oasis Refresh',4),(20,'Desserts','Mexican Delicious',5);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL,
  `MenuCuisine` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Italian'),(2,'Greek'),(3,'French'),(4,'Arabic'),(5,'Mexican'),(6,'International');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `OrderID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `OrderDeliveryDate` date DEFAULT NULL,
  `OrderDeliveryTime` time DEFAULT NULL,
  `OrderDeliveryStatus` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`OrderID`,`EmployeeID`),
  KEY `fk_OrderDeliveryStatus_Orders1_idx` (`OrderID`),
  KEY `fk_OrderDeliveryStatus_Employees1_idx` (`EmployeeID`),
  CONSTRAINT `fk_OrderDeliveryStatus_Employees1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderDeliveryStatus_Orders1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystatus`
--

LOCK TABLES `orderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `orderdeliverystatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderTime` time NOT NULL,
  `OrderQuantity` int NOT NULL,
  `OrderTotalCost` decimal(10,0) NOT NULL,
  `BookingID` int NOT NULL,
  `ItemID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Bookings1_idx` (`BookingID`),
  KEY `fk_Orders_Items_idx` (`ItemID`),
  CONSTRAINT `fk_Orders_Bookings1` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_Items` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-01-01','19:45:00',3,15,1,10),(2,'2023-01-01','19:45:00',1,5,1,4),(3,'2023-01-01','19:45:00',10,180,2,11),(4,'2023-01-03','20:10:00',5,25,3,10),(5,'2023-01-03','20:40:00',10,50,4,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderQuantity`,
 1 AS `OrderTotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'little_lemon_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `AddBooking`(IN booking_id INT, IN booking_date DATE, IN table_no INT, IN customer_id INT)
BEGIN
INSERT INTO bookings(BookingID, BookingDate, BookingTableNo, CustomerID)
             VALUES (booking_id, booking_date, table_no, customer_id);
SELECT "New booking added" AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `AddValidBooking`(IN booking_date DATE, IN table_no INT, IN customer_id INT)
BEGIN
START TRANSACTION;
SELECT MAX(BookingID) INTO @booking_id
FROM bookings;
SET @booking_id = @booking_id + 1;
IF EXISTS(SELECT BookingID
          FROM bookings
          WHERE BookingDate = booking_date AND BookingTableNo = table_no) 
          THEN
              (SELECT CONCAT("Table ", CAST(table_no AS CHAR), " is already booked - booking cancelled") AS "Booking Status");
              ROLLBACK;
ELSE
    INSERT INTO bookings(BookingID, BookingDate, BookingTableNo, CustomerID) 
                 VALUES (@booking_id, booking_date, table_no, customer_id);
	(SELECT CONCAT("Table ", CAST(table_no AS CHAR), " available - booking confirmed") AS "Booking Status");
    COMMIT;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `CancelBooking`(IN booking_id INT)
BEGIN
DELETE FROM bookings
WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", CAST(booking_id AS CHAR), " cancelled") AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
DELETE FROM orders
WHERE OrderID = order_id;
SELECT CONCAT("Order ", CAST(order_id AS CHAR), " has been cancelled") AS Confirmation; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `CheckBooking`(IN booking_date DATE, IN table_no INT)
BEGIN
SELECT CASE
WHEN NOT EXISTS (SELECT BookingID
                 FROM bookings
                 WHERE BookingDate = booking_date AND BookingTableNo = table_no) 
                 THEN CONCAT("Table ", CAST(table_no AS CHAR), " is available")
ELSE CONCAT("Table ", CAST(table_no AS CHAR), " is already booked")
END AS "Booking Status";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
SELECT MAX(OrderQuantity) AS "Max Quantity Ordered"
FROM orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dba_little_lemon`@`%` PROCEDURE `UpdateBooking`(IN booking_id INT, IN booking_date DATE)
BEGIN
UPDATE bookings
SET BookingDate = booking_date
WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", CAST(booking_id AS CHAR), " updated") AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dba_little_lemon`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`OrderQuantity` AS `OrderQuantity`,`orders`.`OrderTotalCost` AS `OrderTotalCost` from `orders` where (`orders`.`OrderQuantity` > 2) */;
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

-- Dump completed on 2023-08-01  6:50:54
