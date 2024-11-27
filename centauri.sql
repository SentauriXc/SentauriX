-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: centauri
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add order',1,'add_order'),(2,'Can change order',1,'change_order'),(3,'Can delete order',1,'delete_order'),(4,'Can view order',1,'view_order'),(5,'Can add product',2,'add_product'),(6,'Can change product',2,'change_product'),(7,'Can delete product',2,'delete_product'),(8,'Can view product',2,'view_product'),(9,'Can add order item',3,'add_orderitem'),(10,'Can change order item',3,'change_orderitem'),(11,'Can delete order item',3,'delete_orderitem'),(12,'Can view order item',3,'view_orderitem'),(13,'Can add cart item',4,'add_cartitem'),(14,'Can change cart item',4,'change_cartitem'),(15,'Can delete cart item',4,'delete_cartitem'),(16,'Can view cart item',4,'view_cartitem'),(17,'Can add profile',5,'add_profile'),(18,'Can change profile',5,'change_profile'),(19,'Can delete profile',5,'delete_profile'),(20,'Can view profile',5,'view_profile'),(21,'Can add transaction',6,'add_transaction'),(22,'Can change transaction',6,'change_transaction'),(23,'Can delete transaction',6,'delete_transaction'),(24,'Can view transaction',6,'view_transaction'),(25,'Can add user profile',7,'add_userprofile'),(26,'Can change user profile',7,'change_userprofile'),(27,'Can delete user profile',7,'delete_userprofile'),(28,'Can view user profile',7,'view_userprofile'),(29,'Can add log entry',8,'add_logentry'),(30,'Can change log entry',8,'change_logentry'),(31,'Can delete log entry',8,'delete_logentry'),(32,'Can view log entry',8,'view_logentry'),(33,'Can add permission',9,'add_permission'),(34,'Can change permission',9,'change_permission'),(35,'Can delete permission',9,'delete_permission'),(36,'Can view permission',9,'view_permission'),(37,'Can add group',10,'add_group'),(38,'Can change group',10,'change_group'),(39,'Can delete group',10,'delete_group'),(40,'Can view group',10,'view_group'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add content type',12,'add_contenttype'),(46,'Can change content type',12,'change_contenttype'),(47,'Can delete content type',12,'delete_contenttype'),(48,'Can view content type',12,'view_contenttype'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session'),(53,'Can add card transaction',14,'add_cardtransaction'),(54,'Can change card transaction',14,'change_cardtransaction'),(55,'Can delete card transaction',14,'delete_cardtransaction'),(56,'Can view card transaction',14,'view_cardtransaction'),(57,'Can add notification',15,'add_notification'),(58,'Can change notification',15,'change_notification'),(59,'Can delete notification',15,'delete_notification'),(60,'Can view notification',15,'view_notification');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$N8Kwmv1J31kKaApM34rnBe$BgwJ9aUKBnvcKu2vAy40Pw8P3m+fs0wXrLWKEf+Y89E=','2024-11-27 04:10:51.744490',1,'centauri','centauri','centauri','centauri@gmail.com',1,1,'2024-11-25 02:00:52.866809'),(2,'pbkdf2_sha256$870000$MAslFNYTYaL47VPxHCBJKw$M8lgGLScV1qvk1R3x5bisGmgPx+VWP9b9WwuKBzOX6M=','2024-11-25 21:20:07.185126',0,'prueba','prueba111','prueba222','prueba111@gmail.com',0,1,'2024-11-25 02:02:19.630168'),(3,'pbkdf2_sha256$870000$TM71goeotdasbipcoCz0uf$VQEYAvR4k1HPom/LGlFGo2jU8bXKmf47xq6whB7E0n0=','2024-11-25 22:45:26.657850',0,'miguel-','miguel','campo','miguel@gmail.com',0,1,'2024-11-25 22:45:25.975258'),(4,'pbkdf2_sha256$870000$LXEVTyW5bYLigGKcTiEcpu$hp1SPzzcjINv8mCzX2fsKm2b8z+fLc86XK7na8kk7jU=','2024-11-25 23:01:16.662225',0,'miguel22','migeul','duarte','miguel@gmail.com',0,1,'2024-11-25 23:01:16.029514');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_cardtransaction`
--

DROP TABLE IF EXISTS `centauri_cardtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_cardtransaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `card_holder_name` varchar(100) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `expiration_date` varchar(5) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_cardtransaction_user_id_acc4a6a4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `centauri_cardtransaction_user_id_acc4a6a4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_cardtransaction`
--

LOCK TABLES `centauri_cardtransaction` WRITE;
/*!40000 ALTER TABLE `centauri_cardtransaction` DISABLE KEYS */;
INSERT INTO `centauri_cardtransaction` VALUES (1,'jean pier campo','1231313131413123','12/27','123',25000.00,'DECLINED','2024-11-25 02:25:44.549831',1),(2,'jean pier campo','1231321312313131','12/27','123',25000.00,'DECLINED','2024-11-25 02:26:01.377998',1),(3,'jean pier campo','1231321312313131','12/27','123',0.00,'DECLINED','2024-11-25 02:26:10.372313',1),(4,'jean pier campo','5541123123123131','12/26','123',25000.00,'DECLINED','2024-11-25 02:33:25.795434',1),(5,'jean pier campo','5541121212341234','12/26','123',25000.00,'DECLINED','2024-11-25 02:33:54.706720',1),(6,'jean pier campo','4111111111111111','12/26','123',25000.00,'APPROVED','2024-11-25 02:35:40.918481',1),(7,'jean pier campo','4111111111111111','12/26','123',50000.00,'APPROVED','2024-11-25 02:43:21.713298',1),(8,'jean pier campo','4111111111111111','12/23','123',25000.00,'APPROVED','2024-11-25 02:43:45.655761',1);
/*!40000 ALTER TABLE `centauri_cardtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_cartitem`
--

DROP TABLE IF EXISTS `centauri_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_cartitem_user_id_d483541d_fk_auth_user_id` (`user_id`),
  KEY `centauri_cartitem_product_id_b4c258e5_fk_centauri_product_id` (`product_id`),
  CONSTRAINT `centauri_cartitem_product_id_b4c258e5_fk_centauri_product_id` FOREIGN KEY (`product_id`) REFERENCES `centauri_product` (`id`),
  CONSTRAINT `centauri_cartitem_user_id_d483541d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `centauri_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_cartitem`
--

LOCK TABLES `centauri_cartitem` WRITE;
/*!40000 ALTER TABLE `centauri_cartitem` DISABLE KEYS */;
INSERT INTO `centauri_cartitem` VALUES (10,1,'2024-11-25 03:07:44.149220',1,1);
/*!40000 ALTER TABLE `centauri_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_notification`
--

DROP TABLE IF EXISTS `centauri_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_notification_user_id_4fbb4e9c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `centauri_notification_user_id_4fbb4e9c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_notification`
--

LOCK TABLES `centauri_notification` WRITE;
/*!40000 ALTER TABLE `centauri_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `centauri_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_order`
--

DROP TABLE IF EXISTS `centauri_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_order_user_id_d59f765e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `centauri_order_user_id_d59f765e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_order`
--

LOCK TABLES `centauri_order` WRITE;
/*!40000 ALTER TABLE `centauri_order` DISABLE KEYS */;
INSERT INTO `centauri_order` VALUES (1,'2024-11-25 02:05:14.321902',25000.00,'pendiente',1),(2,'2024-11-25 02:26:05.666666',25000.00,'pendiente',1),(3,'2024-11-25 02:35:40.921818',25000.00,'pendiente',1),(4,'2024-11-25 02:43:21.716596',50000.00,'pendiente',1),(5,'2024-11-25 02:43:45.659537',25000.00,'pendiente',1),(6,'2024-11-25 02:57:04.851160',50000.00,'pendiente',1),(7,'2024-11-25 02:57:36.045230',25000.00,'pendiente',1),(8,'2024-11-25 02:58:26.006525',25000.00,'pendiente',1),(9,'2024-11-25 03:07:21.045998',25000.00,'pendiente',1),(10,'2024-11-25 03:20:50.946702',25000.00,'pendiente',2);
/*!40000 ALTER TABLE `centauri_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_orderitem`
--

DROP TABLE IF EXISTS `centauri_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_orderitem_order_id_520c2e82_fk_centauri_order_id` (`order_id`),
  KEY `centauri_orderitem_product_id_78e64991_fk_centauri_product_id` (`product_id`),
  CONSTRAINT `centauri_orderitem_order_id_520c2e82_fk_centauri_order_id` FOREIGN KEY (`order_id`) REFERENCES `centauri_order` (`id`),
  CONSTRAINT `centauri_orderitem_product_id_78e64991_fk_centauri_product_id` FOREIGN KEY (`product_id`) REFERENCES `centauri_product` (`id`),
  CONSTRAINT `centauri_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_orderitem`
--

LOCK TABLES `centauri_orderitem` WRITE;
/*!40000 ALTER TABLE `centauri_orderitem` DISABLE KEYS */;
INSERT INTO `centauri_orderitem` VALUES (1,1,25000.00,1,1),(2,1,25000.00,2,1),(3,1,25000.00,3,1),(4,2,25000.00,4,1),(5,1,25000.00,5,1),(6,2,25000.00,6,1),(7,1,25000.00,7,1),(8,1,25000.00,8,1),(9,1,25000.00,9,1),(10,1,25000.00,10,1);
/*!40000 ALTER TABLE `centauri_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_product`
--

DROP TABLE IF EXISTS `centauri_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `condition` varchar(10) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `seller_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_product_seller_id_22e636f2_fk_auth_user_id` (`seller_id`),
  CONSTRAINT `centauri_product_seller_id_22e636f2_fk_auth_user_id` FOREIGN KEY (`seller_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_product`
--

LOCK TABLES `centauri_product` WRITE;
/*!40000 ALTER TABLE `centauri_product` DISABLE KEYS */;
INSERT INTO `centauri_product` VALUES (1,'Pantalon cafe','Pantalon cafe',20000.00,'fair','products/OIP.jpg','pantalones','2024-11-25 02:03:55.669281',1),(2,'Camiseta blanca','Camiseta blanca',22000.00,'like_new','products/OIP_1_4K0a0KR.jfif','camisetas','2024-11-25 04:08:37.945471',1),(3,'Medias azules','Elegantes medias azul profundo, perfectas para complementar cualquier look con estilo y comodidad. Su tejido suave y elástico asegura un ajuste impecable para todo el día.',12000.00,'new','products/MEDIAS-REF3603PLNAVY_540x_p8aC93w.jpg','ropa_interior','2024-11-25 21:35:37.020852',2);
/*!40000 ALTER TABLE `centauri_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_profile`
--

DROP TABLE IF EXISTS `centauri_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bio` longtext NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `centauri_profile_user_id_58a18b26_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_profile`
--

LOCK TABLES `centauri_profile` WRITE;
/*!40000 ALTER TABLE `centauri_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `centauri_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_transaction`
--

DROP TABLE IF EXISTS `centauri_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `transaction_date` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `buyer_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centauri_transaction_buyer_id_d8a0c81b_fk_auth_user_id` (`buyer_id`),
  KEY `centauri_transaction_product_id_37ee0ac6_fk_centauri_product_id` (`product_id`),
  CONSTRAINT `centauri_transaction_buyer_id_d8a0c81b_fk_auth_user_id` FOREIGN KEY (`buyer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `centauri_transaction_product_id_37ee0ac6_fk_centauri_product_id` FOREIGN KEY (`product_id`) REFERENCES `centauri_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_transaction`
--

LOCK TABLES `centauri_transaction` WRITE;
/*!40000 ALTER TABLE `centauri_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `centauri_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centauri_userprofile`
--

DROP TABLE IF EXISTS `centauri_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centauri_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `address` longtext NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `centauri_userprofile_user_id_a50e2a22_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centauri_userprofile`
--

LOCK TABLES `centauri_userprofile` WRITE;
/*!40000 ALTER TABLE `centauri_userprofile` DISABLE KEYS */;
INSERT INTO `centauri_userprofile` VALUES (1,'3333333333','','profile_pics/images_jsBmzc1.jfif',2),(2,'2222222222222','','profile_pics/img_trubies_20160621-122345_imagenes_lv_otras_fuentes_luna3_P91Aykk.jpg',1),(3,'312312312313','','profile_pics/OIP_7_Rw1XPQc.jfif',3),(4,'1232131231','','',4);
/*!40000 ALTER TABLE `centauri_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-25 02:03:55.670130','1','Pantalon cafe',1,'[{\"added\": {}}]',2,1),(2,'2024-11-25 02:05:07.043049','1','Pantalon cafe',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(10,'auth','group'),(9,'auth','permission'),(11,'auth','user'),(14,'centauri','cardtransaction'),(4,'centauri','cartitem'),(15,'centauri','notification'),(1,'centauri','order'),(3,'centauri','orderitem'),(2,'centauri','product'),(5,'centauri','profile'),(6,'centauri','transaction'),(7,'centauri','userprofile'),(12,'contenttypes','contenttype'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-25 01:58:55.267758'),(2,'auth','0001_initial','2024-11-25 01:58:55.891216'),(3,'admin','0001_initial','2024-11-25 01:58:56.044964'),(4,'admin','0002_logentry_remove_auto_add','2024-11-25 01:58:56.056285'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-25 01:58:56.063992'),(6,'contenttypes','0002_remove_content_type_name','2024-11-25 01:58:56.144840'),(7,'auth','0002_alter_permission_name_max_length','2024-11-25 01:58:56.216040'),(8,'auth','0003_alter_user_email_max_length','2024-11-25 01:58:56.241457'),(9,'auth','0004_alter_user_username_opts','2024-11-25 01:58:56.250314'),(10,'auth','0005_alter_user_last_login_null','2024-11-25 01:58:56.319451'),(11,'auth','0006_require_contenttypes_0002','2024-11-25 01:58:56.322658'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-25 01:58:56.330907'),(13,'auth','0008_alter_user_username_max_length','2024-11-25 01:58:56.403266'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-25 01:58:56.477239'),(15,'auth','0010_alter_group_name_max_length','2024-11-25 01:58:56.497689'),(16,'auth','0011_update_proxy_permissions','2024-11-25 01:58:56.507166'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-25 01:58:56.590832'),(18,'centauri','0001_initial','2024-11-25 01:58:57.355174'),(19,'sessions','0001_initial','2024-11-25 01:58:57.391354'),(20,'centauri','0002_cardtransaction','2024-11-25 02:25:17.354404'),(21,'centauri','0003_notification','2024-11-25 03:14:09.433310');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jyhg9vhdhncyldagwvxzeuilwvt8nyij','.eJxVjEEOwiAQRe_C2hAgQBmX7j0DmQFGqoYmpV013t026UK3_733NxFxXWpce5njmMVVaHH53QjTq7QD5Ce2xyTT1JZ5JHko8qRd3qdc3rfT_Tuo2OteF1N8sL5YbRnZq2AtAgMzJVDkkiNDnlkFlwgVDxDQBJ0B9giUH8TnC_ZAN_c:1tG9O7:QhFiKceQ8VTiXAKU6o-15dwVAT1RsDiSBOhqJWFDyog','2024-12-11 04:10:51.757212');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 23:28:21
