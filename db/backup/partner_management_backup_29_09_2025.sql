-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: partner_management
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `partner_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `registration_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (1,'ООО Ромашка','Иванов Иван','ivanov@romashka.ru','+79991234567','Москва, ул. Ленина, 1','2023-01-15','active','2025-09-28 22:28:48'),(2,'ИП Сидоров','Сидоров Петр','sidorov@mail.ru','+79997654321','СПб, Невский пр., 100','2023-02-20','active','2025-09-28 22:28:48'),(3,'ЗАО Весна','Петрова Мария','petrova@vesna.ru','+79995554433','Екатеринбург, ул. Мира, 25','2023-03-10','active','2025-09-28 22:28:48'),(4,'ООО ТехноПрофи','Смирнов Алексей','smirnov@technopro.ru','+79993332211','Новосибирск, ул. Советская, 50','2023-04-05','active','2025-09-28 22:28:48'),(5,'ИП Козлова','Козлова Анна','kozlova@mail.ru','+79994445566','Казань, ул. Баумана, 30','2023-05-12','inactive','2025-09-28 22:28:48');
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sales`
--

DROP TABLE IF EXISTS `product_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `partner_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `sale_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `delivery_status` enum('delivered','in_transit','pending') DEFAULT 'pending',
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `product_sales_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`partner_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sales`
--

LOCK TABLES `product_sales` WRITE;
/*!40000 ALTER TABLE `product_sales` DISABLE KEYS */;
INSERT INTO `product_sales` VALUES (1,1,'Продукт А',10,'2024-01-10',15000.00,'delivered','Регулярная поставка','2025-09-28 22:28:48'),(2,1,'Продукт Б',5,'2024-01-15',8000.50,'in_transit','Срочный заказ','2025-09-28 22:28:48'),(3,2,'Продукт А',8,'2024-01-12',12000.00,'delivered','','2025-09-28 22:28:48'),(4,2,'Продукт В',15,'2024-01-18',25000.75,'pending','Крупный заказ','2025-09-28 22:28:48'),(5,3,'Продукт Б',12,'2024-01-20',18000.00,'delivered','','2025-09-28 22:28:48'),(6,3,'Продукт А',20,'2024-01-25',30000.00,'delivered','Оптовая закупка','2025-09-28 22:28:48'),(7,4,'Продукт В',7,'2024-01-22',12000.25,'in_transit','','2025-09-28 22:28:48'),(8,5,'Продукт А',3,'2024-01-14',4500.00,'delivered','Пробный заказ','2025-09-28 22:28:48');
/*!40000 ALTER TABLE `product_sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29  1:42:37
