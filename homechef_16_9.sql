-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: switchyard.proxy.rlwy.net    Database: railway
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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('homechef-cache-65oKutskhEPxjAaD','s:7:\"forever\";',2073073691),('homechef-cache-6h8TA16xhHi7YXeA','s:7:\"forever\";',2073325059),('homechef-cache-BfqxduhEkdFDZCuT','s:7:\"forever\";',2073327637),('homechef-cache-DtPv6nEvDMpHA2li','s:7:\"forever\";',2073326096),('homechef-cache-J5NiWUFlOLLaqBpn','s:7:\"forever\";',2073324753),('homechef-cache-OBlTXugxUzY13AN2','s:7:\"forever\";',2073327047),('homechef-cache-OfYxdd99UQp59vPg','s:7:\"forever\";',2073319008),('homechef-cache-tjc6opvWOOlu8Szb','s:7:\"forever\";',2073324725);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` enum('Vegetables','Fruits','Meat & Poultry','Seafood','Dairy & Eggs','Grains & Cereals','Spices & Herbs','Condiments & Sauces','Baking & Desserts','Beverages','Frozen Foods','Canned & Preserved','Nuts & Seeds','Oils & Fats','Other') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Other',
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (3,'Tomatoo','2','kg','Other','2025-09-17'),(6,'ewewqr','22','pieces','Other','2025-09-16'),(7,'fish','10','kg','Other','2025-10-08'),(8,'qwer','22','kg','Other','2025-10-01'),(9,'adfadf','222','oz','Other','2025-10-01'),(10,'tomato','5','kg','Other','2025-09-30'),(11,'Tomato','3','kg','Vegetables','2025-10-01'),(12,'Carrot','5','kg','Vegetables','2025-09-25'),(13,'Tomato','4','kg','Vegetables','2025-10-07'),(15,'test','22','kg','Vegetables','2025-10-10'),(16,'Apple','2','g','Fruits','2025-10-03'),(17,'Eggs','23','pieces','Dairy & Eggs','2025-10-10');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pantry`
--

DROP TABLE IF EXISTS `pantry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pantry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `ingredient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pantry_ingredient_fk` (`ingredient_id`),
  KEY `pantry_user_fk` (`user_id`),
  CONSTRAINT `pantry_ingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pantry_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pantry`
--

LOCK TABLES `pantry` WRITE;
/*!40000 ALTER TABLE `pantry` DISABLE KEYS */;
INSERT INTO `pantry` VALUES (3,18,3),(6,18,6),(7,18,7),(8,18,8),(9,18,9),(10,22,10),(11,5,11),(12,9,12),(13,9,13),(15,9,15),(16,9,16),(17,9,17);
/*!40000 ALTER TABLE `pantry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeingredients`
--

DROP TABLE IF EXISTS `recipeingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int DEFAULT NULL,
  `ingredient_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeingredients_recipe_fk` (`recipe_id`),
  KEY `recipeingredients_ingredient_fk` (`ingredient_id`),
  CONSTRAINT `recipeingredients_ingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `recipeingredients_recipe_fk` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeingredients`
--

LOCK TABLES `recipeingredients` WRITE;
/*!40000 ALTER TABLE `recipeingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `cuisine_origin` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preparation_time` int DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_user_fk` (`created_by`),
  CONSTRAINT `recipes_user_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('859llU4qcT1UGLnSuApxxW2Zciu1tEfDAGDP61ZL',NULL,'100.64.0.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGpJcXpPYVNCc0lPZmpzbm9SWlhRb1dNZ0RIN0p4ZWw3andyTmthYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757784204),('lsNj3ZJOUGHzAR39gt25n3k7K1HJzANHwYUMkTvy',NULL,'100.64.0.2','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoib2pZRVJrNE9QY0dsRW10MmVWNFY0VzdYQmxEcm02OFlIaEJPcHJhYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757902469),('LvzkicoSKPL6Ki5us2bIGDTMyGWgXiARDh0UzuDu',NULL,'100.64.0.4','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXlaTzVsN0xWZVlGNHNMZE5xdlVtc09jN01GM1p3RzRvNVR2dW5IbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757784209),('NCe1w9xiwiGqjBLVNobfUCy314nFeDyeNS42sKmv',NULL,'100.64.0.2','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVpQQWMyODl3R1FnQ2ZoOVNEVUc0R0FqQ1A4TVVNV2NoMkU0VmFIUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757778754),('VJON8LHzX5v9Rmv9L0EY5plqxlW6varM61ZQHp9F',NULL,'100.64.0.4','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVgwWW9SY0JYM09WZ0xaZ3MxYlJIbnRvUFNubzA2WXdpWUZwamNzUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757778807),('yXwQvpmJ3ZWtiVEv3jopJvUDqtEahM7qeYtteHD9',NULL,'100.64.0.2','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkkydWoxdTFxbEhCNzJhV0xvOTVFT2gxNVJab0kyZGNRR2doS0xNMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757784150),('ZA2EV6wt4eqopAg8xcz5IA9jIY3PHTjZyQSouHo2',NULL,'100.64.0.2','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHh6RmNEN3Q0aWlBUG92Wk9xQ3RJR0tsNDZ6NzZyQTk4Q0RlUzVDbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1757712344),('zRZFrp9m3ZLxFpxlBfAawPr2I15c5neZi9h6FgfK',NULL,'100.64.0.2','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzlxU3ltMEVrMjNGbGJJZlYyR1ExRkJjMGxoVzVNRzR6MEN6anUyRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9ob21lY2hlZjM2MC1wcm9kdWN0aW9uLnVwLnJhaWx3YXkuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758023933);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `onboardingComplete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Omar Ali','omar@example.com','$2y$12$aTOcNvFjurv3rEuuzTZIF.PP3HugEKKHjtrgNKMKUTJ5XqJ59sTPm','admin','2025-09-05 09:06:22','2025-09-05 09:06:22',0),(2,'Samar Mahmoud','samar@example.com','$2y$12$tIFMVhI3.0fiMu8DA.tY6uWJaYLQeQ7fmfZoqINRPmnccaCrdd43.','user','2025-09-05 09:12:21','2025-09-05 09:12:21',0),(3,'Ahmed Mahmoud','ahmed@example.com','$2y$12$tCpsfQ2DxOfk5DJTE2o/J.aVCJCuTIwaCX2RHGj2pUwzQVt0dz12i','user','2025-09-05 10:29:58','2025-09-05 10:29:58',0),(4,'Ali Yahya','ali@example.com','$2y$12$eY3tyklv3/zLYie.MjMRd.rQ/WRw9EicDSP8i/kGq1VHedr/LJK/.','admin','2025-09-05 11:23:54','2025-09-05 11:23:54',0),(5,'Reem','reem@example.com','$2y$12$x97rdrjjtjuEs6P95mOha.mUeSpe436h6b2iYL.imyqN0Om8bS31e','user','2025-09-12 21:28:04','2025-09-15 02:15:37',1),(6,'Omar Yahya','omaryahya@example.com','$2y$12$PdQFbBaYFoQLp2FF44kTHe4rOt8j6LAhMLrgj0Gdm3/AJjJWROmUe','user','2025-09-12 21:40:18','2025-09-12 21:40:18',0),(7,'x','x@example.com','$2y$12$2MGy5/6.4jbb8FZsD6mbYeNLE0jAgPCKZNP3iWgLZYjoeNnZbPvbq','user','2025-09-12 22:59:27','2025-09-12 22:59:27',0),(8,'Youssef','youssef@gmail.com','$2y$12$hdNOVZ6Z5lGrtm94D3J76.Z76JtnBXmg5Nyr2XXKoxJ3lXqxR2DQC','user','2025-09-12 23:01:44','2025-09-12 23:01:44',0),(9,'mostafa','mostafa@gmail.com','$2y$12$3LZ4kKaZ42tYRloflUKOlOZLLSnb6tE0FyszBEhPKSJ076QJvd23y','user','2025-09-12 23:39:38','2025-09-15 02:50:15',1),(10,'youssefff','youssefff@gmail.com','$2y$12$uZkCD.6426lbZcduy2ILQemXIvPMw1Cyqxs5jIPHnNnANwWmbTcJG','user','2025-09-13 16:09:35','2025-09-13 16:09:35',0),(11,'xs','xs@gmail.com','$2y$12$U9EmxkqO5Iq5dLgNW2jrJ.DKnNpVnuiPGMsblLhaRWcGOVCunPRk2','user','2025-09-14 16:53:05','2025-09-14 16:53:05',0),(12,'x','xz@example.com','$2y$12$xpGC3usMbwFWo2DMojzBoeD/3qljU6ATntUJedqQ9tA3Y1Q0CwazO','user','2025-09-15 02:21:06','2025-09-15 02:21:06',0),(13,'new','new@gmail.com','$2y$12$YYQ/hVA1RyXqKPb/SfG2DuM/iNxb5BmZPuuo.2xKVSCXIKQJuP00u','user','2025-09-15 02:38:36','2025-09-15 02:48:34',1),(14,'new','new1@gmail.com','$2y$12$9CW4V5sAWnSlVf.LpS0CS.oLf4K10hfuOPan/x0AanWzq7fazaQ9W','user','2025-09-15 02:55:16','2025-09-15 02:55:39',1),(15,'yy','yy@gmail.com','$2y$12$qGEOZ9XIbjWKdDVQ5ozDLO0f4kDFiWVVRhYeBH5x7lMKlJYI9PGTy','user','2025-09-15 02:56:20','2025-09-15 03:02:53',1),(16,'xa','xa@gmail.com','$2y$12$OPp7LC/JRlLIFA6Raa9gguOxLKEFq9VkdIYh0FYUe9GYhzTPm4k3C','user','2025-09-15 03:04:52','2025-09-15 03:10:45',1),(17,'na','na@gmail.com','$2y$12$oWuTmRBWCGCmYJkhpudxE.4aCMMYgyj1wRYBG2tejkiRPJvISg54.','user','2025-09-15 05:56:11','2025-09-15 15:07:02',1),(18,'youssef','youssefnabil@gmail.com','$2y$12$lIStMU511wNvSzaOP1j.zOI8YksQsbE1qQPS/T9hnNqJha.fXMHQW','user','2025-09-15 17:29:35','2025-09-15 19:31:15',1),(19,'Omar','omar@gmail.com','$2y$12$Ld9Zji5NBw4/QcCWBv4zJ.m9x/ZjaJ6HXXKjanc84leFySRNmCMhW','user','2025-09-15 19:33:18','2025-09-15 19:37:29',1),(20,'test','testt@gmail.com','$2y$12$Oy02Pvsu/d6Uqxm8sGWNP.knqpXrmh3d0keb3EB3r8DEpcLGePsne','user','2025-09-15 19:38:05','2025-09-15 19:54:31',1),(21,'testtt','teqfda@gmail.com','$2y$12$vAT4UvdqPbwFA.Xz.QNqBunDwBKkhANvm6QNAHPCxqatChJieO6ta','user','2025-09-15 19:55:10','2025-09-15 19:55:10',0),(22,'abdo','abdo@gmail.com','$2y$12$KZOIB4F3FzPWQ3eFjC9sIeKDGs7A.tP2iDW0Z7XikSMs3sVeY506.','user','2025-09-15 20:11:54','2025-09-15 20:12:54',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `dietary_type` varchar(255) DEFAULT NULL,
  `allergies` json DEFAULT NULL,
  `dislikes` json DEFAULT NULL,
  `servings` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_preferences_user_fk` (`user_id`),
  CONSTRAINT `user_preferences_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,5,'vegetarian','[\"nuts\", \"milk\"]','[\"onion\"]','2','2025-09-15 02:15:37','2025-09-15 02:15:37'),(2,13,'keto','[\"shellfish\"]','[\"beets\"]','4','2025-09-15 02:42:51','2025-09-15 02:48:34'),(3,9,'low carb','[\"egg\"]','[\"pork\"]','2','2025-09-15 02:50:15','2025-09-15 02:50:15'),(4,14,'paleo','[\"tree nut\"]','[\"avocado\"]','4','2025-09-15 02:55:39','2025-09-15 02:55:39'),(5,15,'paleo','[\"tree nut\", \"peanut\", \"egg\"]','[\"cabbage\"]','2','2025-09-15 03:02:53','2025-09-15 03:02:53'),(6,16,'classic','[\"sesame\", \"mustard\"]','[\"eggplant\"]','4','2025-09-15 03:10:45','2025-09-15 03:10:45'),(7,17,'vegetarian','[\"nightshade\"]','[]','6','2025-09-15 15:07:02','2025-09-15 15:07:02'),(8,18,'keto','[\"nightshade\"]','[\"eggplant\"]','1','2025-09-15 17:29:47','2025-09-15 17:29:47'),(9,19,'vegan','[\"gluten\", \"dairy\", \"nightshade\"]','[]','4','2025-09-15 19:37:29','2025-09-15 19:37:29'),(10,20,'classic','[\"mustard\", \"nightshade\"]','[\"avocado\", \"fish\"]','4','2025-09-15 19:54:31','2025-09-15 19:54:31'),(11,22,'keto','[\"peanut\", \"tree nut\"]','[\"fish\"]','1','2025-09-15 20:12:54','2025-09-15 20:12:54');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2025-09-16 18:06:39
