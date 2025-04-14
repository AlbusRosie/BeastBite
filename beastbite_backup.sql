-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: beastbite
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `item_description` varchar(255) DEFAULT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_status` tinyint(1) unsigned DEFAULT 1,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Salmon Donburi','Japanese rice bowl topped with fresh salmon.',10.99,1),(2,'Bibimbap Origin','Traditional Korean mixed rice with vegetables.',8.99,1),(3,'Bibimbap Shrimp','Korean mixed rice with shrimp and vegetables.',9.99,1),(4,'Bibimbap Vegetables','Vegetarian Bibimbap with a variety of fresh vegetables.',7.99,1),(5,'Cheese Takoyaki','Takoyaki balls with melted cheese topping.',6.99,1),(6,'Katsudon','Japanese rice bowl with crispy pork cutlet and egg.',9.99,1),(7,'Kimchi','Traditional Korean fermented cabbage.',3.99,1),(8,'Miso Ramen','Japanese ramen noodles in miso-based soup.',7.99,1),(9,'Noodles','Simple noodles served with soy-based sauce.',4.99,1),(10,'Ramen','Classic Japanese ramen with pork and vegetables.',7.99,1),(11,'Shiitake Rice','Rice cooked with shiitake mushrooms.',5.99,1),(12,'Udon','Thick wheat noodles served in a savory broth.',6.99,1);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,1,10.99),(2,1,3,1,9.99),(3,2,1,1,10.99),(6,4,1,1,10.99),(10,3,1,5,54.95),(11,3,6,3,29.97),(12,5,3,1,9.99),(13,5,5,3,20.97),(14,6,1,3,32.97),(15,7,2,1,8.99),(16,8,2,2,17.98),(17,9,3,4,39.96),(18,10,1,3,32.97);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paymentmethod` enum('Cash','Credit Card') DEFAULT NULL,
  `status` enum('Pending','Ordered','Completed','Canceled') DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,NULL,'2024-11-14 07:56:09',20.98,NULL,'Completed'),(2,5,NULL,'2024-11-14 07:58:51',10.99,NULL,'Completed'),(3,6,NULL,'2024-11-14 08:48:16',84.92,NULL,'Completed'),(4,7,NULL,'2024-11-14 08:55:59',10.99,NULL,'Pending'),(5,6,NULL,'2024-11-14 09:16:43',30.96,NULL,'Pending'),(6,8,NULL,'2024-11-24 04:51:25',32.97,'Cash','Ordered'),(7,1,NULL,'2024-11-24 04:27:27',8.99,NULL,'Completed'),(8,1,NULL,'2024-11-24 04:33:58',17.98,'Cash','Ordered'),(9,9,NULL,'2024-11-24 05:02:33',39.96,'Cash','Ordered'),(10,9,NULL,'2024-11-24 05:03:15',32.97,NULL,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` enum('Customer','Staff','Admin') NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Customer'),(2,'Staff'),(3,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `userrole` int(11) DEFAULT 1,
  `username` varchar(255) NOT NULL,
  `userbirthday` date NOT NULL,
  `userphone` varchar(10) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `userpwd` varchar(255) NOT NULL,
  `useraddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userphone` (`userphone`),
  UNIQUE KEY `useremail` (`useremail`),
  KEY `fk_role` (`userrole`),
  CONSTRAINT `fk_role` FOREIGN KEY (`userrole`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Hoai Thuong','2000-04-10','1234567890','thuong@gmail.com','1','123 Elm St'),(2,2,'Thanh Tam','2000-09-22','0987654321','tam@gmail.com','1','456 Maple Ave'),(3,3,'Nhat Hao','2000-04-10','0997654321','hao@gmail.com','1','123 Elm St'),(4,1,'Hao1','1990-01-01','0123456767','hao1@example.com','1','123 Main Street'),(5,1,'hao','2003-02-03','0963258741','nhathao@gmail.com','1','a'),(6,1,'Nguyễn Thị Hoài Thương','2003-01-01','0999999999','t@gmail.com','1','Can Tho'),(7,1,'Nguyễn Nhật Hào','2003-12-12','0333333333','h@gmail.com','1','a'),(8,1,'thuongg','2003-12-07','0359866651','thuongg@gmail.com','1','aa'),(9,1,'thuong712@gmail.com','2003-03-03','0356232242','thuong712@gmail.com','1','a');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'beastbite'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_item_toCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_item_toCart`(
    IN p_userid INT,
    IN p_item_id INT,
    IN p_quantity INT,
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE v_order_id INT;
    DECLARE v_item_price DECIMAL(10, 2);
    DECLARE v_total_price DECIMAL(10, 2);
    DECLARE v_order_exists INT DEFAULT 0;

    START TRANSACTION;
    SELECT order_id INTO v_order_id
    FROM orders
    WHERE userid = p_userid
      AND status = 'Pending'
    LIMIT 1;

    IF v_order_id IS NOT NULL THEN
        SET v_order_exists = 1;
    END IF;

    IF v_order_exists = 0 THEN
        INSERT INTO orders (userid, total_price, status)
        VALUES (p_userid, 0, 'Pending');
        -- Lấy order_id mới tạo
        SET v_order_id = LAST_INSERT_ID();
    END IF;

    SELECT item_price INTO v_item_price
    FROM menu_items
    WHERE item_id = p_item_id;

    SET v_total_price = v_item_price * p_quantity;

    -- Kiểm tra xem món đó đã tồn tại trong đơn hàng chưa
    IF EXISTS (SELECT * FROM Order_Item WHERE order_id = v_order_id AND item_id = p_item_id) THEN
        -- Nếu đã tồn tại, cập nhật số lượng và giá
        UPDATE Order_Item
        SET quantity = quantity + p_quantity,
            price = price + v_total_price
        WHERE order_id = v_order_id AND item_id = p_item_id;
    ELSE
        -- Nếu chưa tồn tại, thêm mới vào chi tiết đơn hàng
        INSERT INTO Order_Item (order_id, item_id, quantity, price)
        VALUES (v_order_id, p_item_id, p_quantity, v_total_price);
    END IF;

    UPDATE orders
    SET total_price = total_price + v_total_price
    WHERE order_id = v_order_id;
    COMMIT;
    SET p_message = CONCAT('Item ', p_item_id, ' has been added to order ', v_order_id, ' successfully.');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_menu_item`(
    IN p_item_name VARCHAR(255),
    IN p_item_description VARCHAR(255),
    IN p_item_price DECIMAL(10, 2),
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE existing INT DEFAULT 0;

    SELECT COUNT(*) INTO existing FROM menu_items WHERE item_name = p_item_name;
    IF existing > 0 THEN
        SET p_message = 'Item already exists';
    ELSE
        INSERT INTO menu_items (item_name, item_description, item_price, item_status)
        VALUES (p_item_name, p_item_description, p_item_price, 1);
        SET p_message = 'Item added successfully';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu_item`(
    IN p_item_id INT,
    OUT p_message VARCHAR(255)
)
BEGIN
    -- Kiểm tra nếu món ăn tồn tại
    IF EXISTS (SELECT * FROM menu_items WHERE item_id = p_item_id) THEN
        -- Xóa món ăn
        DELETE FROM menu_items WHERE item_id = p_item_id;
        SET p_message = 'Item deleted successfully';
    ELSE
        SET p_message = 'Item does not exist';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getcart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcart`(IN p_userid INT)
BEGIN
    SELECT 
        o.order_id,
        mi.item_name,
        oi.quantity,
        oi.price,
        (oi.quantity * oi.price) AS total_item_price,
        o.total_price AS total_order_price,
        o.status
    FROM orders o
    JOIN order_item oi ON o.order_id = oi.order_id
    JOIN menu_items mi ON oi.item_id = mi.item_id
    WHERE o.userid = p_userid AND o.status = 'Pending';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_item_byID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_item_byID`(
    IN p_item_id INT,
    OUT p_item_name VARCHAR(255),
    OUT p_item_description VARCHAR(255),
    OUT p_item_price DECIMAL(10, 2),
    OUT p_item_status TINYINT(1)
)
BEGIN
    SELECT item_name, item_description, item_price, item_status
    INTO p_item_name, p_item_description, p_item_price, p_item_status
    FROM menu_items
    WHERE item_id = p_item_id;

    IF p_item_name IS NULL THEN
        SET p_item_name = 'Item not found';
        SET p_item_description = 'N/A';
        SET p_item_price = 0.00;
        SET p_item_status = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_menu`()
BEGIN
    SELECT item_id, item_name, item_description, item_price, item_status
    FROM menu_items;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_menu_items_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_menu_items_by_name`(
    IN p_item_name VARCHAR(255)
)
BEGIN
    -- Select multiple items based on name pattern
    SELECT item_id, item_name, item_description, item_price, item_status
    FROM menu_items
    WHERE item_name LIKE CONCAT('%', p_item_name, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_transaction_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_transaction_history`(
    IN p_userid INT,
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE v_order_exists INT DEFAULT 0;

    -- Kiểm tra xem người dùng có bất kỳ hóa đơn nào không
    SELECT COUNT(*) INTO v_order_exists
    FROM orders
    WHERE userid = p_userid;

    IF v_order_exists = 0 THEN
        SET p_message = 'No orders found for the user.';
    ELSE
        -- Truy vấn lấy thông tin tất cả các hóa đơn của người dùng
        SELECT o.order_id, o.order_date, o.total_price, o.paymentmethod, o.status AS order_status,
               oi.item_id, m.item_name, oi.quantity, oi.price AS item_price
        FROM orders o
        LEFT JOIN Order_Item oi ON o.order_id = oi.order_id
        LEFT JOIN menu_items m ON oi.item_id = m.item_id
        WHERE o.userid = p_userid
        ORDER BY o.order_date DESC;
        SET p_message = 'Transaction history retrieved successfully.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
    IN p_useremail VARCHAR(255),
    IN p_userpwd VARCHAR(255),
    OUT p_userid INT,
    OUT p_userrole INT,
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE existing INT DEFAULT 0;
    SELECT COUNT(*), userid, userrole INTO existing, p_userid, p_userrole 
    FROM users
    WHERE useremail = p_useremail AND userpwd = p_userpwd;

    IF existing = 0 THEN
        SET p_message = 'Email does not exist or password is incorrect';
        SET p_userid = NULL;
        SET p_userrole = NULL;
    ELSE
        SET p_message = 'Login successful';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(
    IN p_username VARCHAR(255),
    IN p_useremail VARCHAR(255),
    IN p_userpwd VARCHAR(255),
    IN p_userphone VARCHAR(10),
    IN p_userbirthday DATE,
    IN p_useraddress VARCHAR(255),
    OUT p_message VARCHAR(255))
BEGIN
    DECLARE existing INT DEFAULT 0;
    SELECT COUNT(*) INTO existing 
    FROM users 
    WHERE useremail = p_useremail OR userphone = p_userphone;
    IF existing > 0 THEN
        SET p_message = 'Email or phone number already exists!';
    ELSE
        INSERT INTO users (username, useremail, userpwd, userphone, userbirthday, useraddress, userrole)
        VALUES (p_username, p_useremail, p_userpwd, p_userphone, p_userbirthday, p_useraddress, 1);
        SET p_message = 'Registered successfully!';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_item_fromCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_item_fromCart`(
    IN p_userid INT,
    IN p_item_id INT,
    IN p_remove_quantity INT,
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE v_order_id INT;
    DECLARE v_item_price DECIMAL(10, 2);
    DECLARE v_quantity INT;
    DECLARE v_total_price DECIMAL(10, 2);
    DECLARE v_remove_price DECIMAL(10, 2);

    DECLARE exit_procedure BOOL DEFAULT FALSE;

    START TRANSACTION;
    -- Kiểm tra nếu người dùng có giỏ hàng đang chờ
    SELECT order_id INTO v_order_id
    FROM orders
    WHERE userid = p_userid 
    AND status = 'Pending'
    LIMIT 1;

    IF v_order_id IS NULL THEN
        SET p_message = 'You do not have any cart';
        ROLLBACK;
        SET exit_procedure = TRUE;
    END IF;

    -- Nếu giỏ hàng đã tồn tại, tiếp tục kiểm tra item trong giỏ
    IF NOT exit_procedure THEN
        SELECT quantity, price INTO v_quantity, v_total_price
        FROM Order_Item
        WHERE order_id = v_order_id AND item_id = p_item_id;

        IF v_quantity IS NULL THEN
            SET p_message = CONCAT('Item ', p_item_id, ' not found in the cart.');
            ROLLBACK;
            SET exit_procedure = TRUE;
        END IF;
    END IF;

    -- Kiểm tra số lượng muốn xóa có hợp lệ không
    IF NOT exit_procedure AND p_remove_quantity > v_quantity THEN
        SET p_message = 'The quantity you need to remove is not valid.';
        ROLLBACK;
        SET exit_procedure = TRUE;
    END IF;

    -- Nếu không có lỗi, thực hiện xóa hoặc cập nhật số lượng
    IF NOT exit_procedure THEN
        SET v_item_price = v_total_price / v_quantity;
        SET v_remove_price = v_item_price * p_remove_quantity;

        IF p_remove_quantity = v_quantity THEN
            DELETE FROM Order_Item
            WHERE order_id = v_order_id AND item_id = p_item_id;
        ELSE
            UPDATE Order_Item
            SET quantity = quantity - p_remove_quantity,
                price = price - v_remove_price
            WHERE order_id = v_order_id AND item_id = p_item_id;
        END IF;

        -- Cập nhật lại tổng giá trị giỏ hàng
        UPDATE orders
        SET total_price = total_price - v_remove_price
        WHERE order_id = v_order_id;

        -- Kiểm tra xem giỏ hàng còn item nào không
        IF (SELECT COUNT(*) FROM Order_Item WHERE order_id = v_order_id) = 0 THEN
            SET p_message = 'The cart has no items.';
        ELSE
            SET p_message = CONCAT('Successfully removed ', p_remove_quantity, ' item(s) ', p_item_id, ' from the cart ', v_order_id);
        END IF;
        COMMIT;
    END IF;
    IF exit_procedure THEN
        ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item`(
    IN p_item_id INT,
    IN p_item_name VARCHAR(255),
    IN p_item_description VARCHAR(255),
    IN p_item_price DECIMAL(10, 2),
    OUT p_message VARCHAR(255)
)
BEGIN
    IF EXISTS (SELECT * FROM menu_items WHERE item_id = p_item_id) THEN
        UPDATE menu_items
        SET item_name = p_item_name,
            item_description = p_item_description,
            item_price = p_item_price
        WHERE item_id = p_item_id;
        SET p_message = CONCAT('Item with ID ', p_item_id, ' has been updated successfully.');
    ELSE
        SET p_message = CONCAT('Item with ID ', p_item_id, ' does not exist.');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verify` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verify`(
    IN p_userid INT,
    IN p_paymentmethod ENUM('Cash', 'Credit Card'),
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE v_order_id INT;
    DECLARE v_total_price DECIMAL(10, 2);
    DECLARE v_item_count INT;
    START TRANSACTION;

    SELECT order_id, total_price INTO v_order_id, v_total_price
    FROM orders
    WHERE userid = p_userid AND status = 'Pending'
    LIMIT 1;

    IF v_order_id IS NULL THEN
        SET p_message = 'You do not have any pending orders to place.';
        ROLLBACK;
    END IF;
    
    SELECT COUNT(*) INTO v_item_count
    FROM Order_Item
    WHERE order_id = v_order_id;

    IF v_item_count = 0 THEN
        SET p_message = 'Your cart is empty. Please add items before placing the order.';
        ROLLBACK;
    END IF;

    UPDATE orders
    SET status = 'Ordered',
        paymentmethod = p_paymentmethod,
        order_date = NOW()
    WHERE order_id = v_order_id;
    COMMIT;
    SET p_message = CONCAT('Order ', v_order_id, ' has been successfully placed.');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 12:06:47
