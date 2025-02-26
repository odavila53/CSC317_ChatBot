-- MySQL dump 10.13  Distrib 8.0.37, for macos14 (arm64)
--
-- Host: localhost    Database: urbanquest
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `chat_title` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,1,'Chat 1','2024-05-19 20:39:27'),(2,1,'Chat 2','2024-05-19 20:40:26'),(3,1,'Chat 3','2024-05-19 20:41:39'),(4,1,'Chat 4','2024-05-19 20:45:01'),(5,1,'Chat 5','2024-05-19 20:47:22'),(6,6,'Chat 6','2024-05-19 20:48:50'),(7,1,'Chat 6','2024-05-19 20:53:19'),(8,24,'Chat 1','2024-05-19 21:19:22'),(9,24,'Chat 2','2024-05-19 21:19:58'),(10,24,'Chat 5','2024-05-19 21:20:39'),(11,24,'Chat 6','2024-05-19 21:42:07'),(12,6,'Chat 1','2024-05-19 22:12:18'),(13,6,'Chat 2','2024-05-19 22:13:38'),(14,1,'Chat 7','2024-05-19 23:24:16'),(15,1,'Chat 8','2024-05-19 23:25:15'),(16,1,'Chat 9','2024-05-19 23:26:11'),(17,1,'Chat 10','2024-05-19 23:33:42'),(18,1,'Chat 11','2024-05-19 23:33:53'),(19,27,'Chat -Infinity','2024-05-19 23:42:28'),(20,28,'Chat 1','2024-05-19 23:47:31'),(21,28,'Chat 2','2024-05-19 23:47:42'),(22,1,'Chat 13','2024-05-20 03:04:44'),(23,1,'Chat 14','2024-05-20 03:05:26'),(24,29,'Chat 1','2024-05-20 03:16:11'),(25,29,'Chat 2','2024-05-20 03:17:29'),(26,29,'Chat 3','2024-05-20 03:18:06');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chat_id` int NOT NULL,
  `sender` enum('user','urbanquest') NOT NULL,
  `message_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,'user','Hello','2024-05-19 20:40:16'),(2,1,'urbanquest','Hello! How can I assist you today?','2024-05-19 20:40:17'),(3,2,'user','How what?','2024-05-19 20:41:22'),(4,2,'urbanquest','Hello! How can I assist you today?','2024-05-19 20:41:22'),(5,3,'user','HE','2024-05-19 20:44:49'),(6,3,'urbanquest','Hello! How can I help you today?','2024-05-19 20:44:50'),(7,4,'urbanquest','I\'m just a virtual assistant, so I don\'t have feelings, but I\'m here and ready to help you. How can I assist you today?','2024-05-19 20:45:01'),(8,5,'urbanquest','Hello! How can I assist you today?','2024-05-19 20:47:22'),(9,1,'user','Hello','2024-05-19 20:53:07'),(10,1,'urbanquest','Hello! How can I assist you today?','2024-05-19 20:53:07'),(11,1,'user','Arric Sekhon?','2024-05-19 20:57:45'),(12,1,'urbanquest','I\'m sorry, I\'m not sure what you\'re referring to with \"Arric Sekhon.\" Can you please provide more context or clarify your question? I\'ll do my best to assist you.','2024-05-19 20:57:46'),(13,1,'user','How are you?','2024-05-19 20:57:56'),(14,1,'urbanquest','I\'m here and ready to help you! How can I assist you today?','2024-05-19 20:57:57'),(15,3,'user','hare tou?','2024-05-19 20:58:11'),(16,3,'urbanquest','Hello! I\'m here to help you. How can I assist you today?','2024-05-19 20:58:12'),(17,7,'user','PAvi?','2024-05-19 20:58:24'),(18,7,'urbanquest','Hello! How can I assist you today?','2024-05-19 20:58:25'),(19,8,'user','Hello','2024-05-19 21:19:50'),(20,8,'urbanquest','Hello! How can I assist you today?','2024-05-19 21:19:51'),(21,9,'user','Whats?','2024-05-19 21:20:33'),(22,9,'urbanquest','Hello! How can I assist you today?','2024-05-19 21:20:33'),(23,8,'user','hello','2024-05-19 21:36:48'),(24,8,'urbanquest','Hello! How can I assist you today?','2024-05-19 21:36:48'),(25,8,'user','hekl','2024-05-19 21:40:15'),(26,8,'urbanquest','Hello! It seems you may have mistyped \"hello.\" How can I assist you today?','2024-05-19 21:40:15'),(27,10,'user','he','2024-05-19 21:42:03'),(28,10,'urbanquest','Hello! How can I assist you today?','2024-05-19 21:42:03'),(29,12,'user','Hello','2024-05-19 22:13:28'),(30,12,'urbanquest','Hello! How can I assist you today?','2024-05-19 22:13:28'),(31,8,'user','hello','2024-05-19 22:29:32'),(32,8,'urbanquest','Hello! How can I assist you today?','2024-05-19 22:29:33'),(33,11,'user','kldfn','2024-05-19 22:29:51'),(34,11,'urbanquest','It seems like you may have typed something incorrectly. Can you please provide more information or context so I can better assist you?','2024-05-19 22:29:52'),(35,3,'user','hello','2024-05-19 22:52:04'),(36,3,'urbanquest','Hello! How can I assist you today?','2024-05-19 22:52:05'),(37,7,'user','How are you?','2024-05-19 22:52:17'),(38,7,'urbanquest','Hello! I\'m here and ready to help you. How can I assist you today?','2024-05-19 22:52:18'),(39,7,'user','hello','2024-05-19 23:05:30'),(40,7,'urbanquest','Hello! How can I assist you today?','2024-05-19 23:05:31'),(41,15,'user','How are you?','2024-05-19 23:26:04'),(42,15,'urbanquest','I\'m just a computer program, so I don\'t have feelings, but I\'m here and ready to help you with anything you need. How can I assist you today?','2024-05-19 23:26:05'),(43,17,'user','hello','2024-05-19 23:33:42'),(44,17,'urbanquest','Hello! How can I assist you today?','2024-05-19 23:33:44'),(45,18,'user','how are you?','2024-05-19 23:33:53'),(46,18,'urbanquest','I\'m just a computer program, so I don\'t have feelings, but I\'m here and ready to help you with anything you need. How can I assist you today?','2024-05-19 23:33:54'),(47,19,'user','hello','2024-05-19 23:42:28'),(48,19,'urbanquest','Hello! How can I assist you today?','2024-05-19 23:42:29'),(49,20,'user','hello','2024-05-19 23:47:31'),(50,20,'urbanquest','Hello! How can I assist you today?','2024-05-19 23:47:32'),(51,21,'user','How are you?','2024-05-19 23:47:42'),(52,21,'urbanquest','I\'m just a program, so I don\'t have feelings, but I\'m here and ready to help you. How can I assist you today?','2024-05-19 23:47:43'),(53,22,'user','tell me about San Francisco?','2024-05-20 03:04:44'),(54,22,'urbanquest','San Francisco is a city located in Northern California, known for its iconic landmarks, diverse culture, and picturesque scenery. It is famous for the Golden Gate Bridge, Alcatraz Island, cable cars, and its hilly streets. \n\nSan Francisco is a hub for technology and innovation, with many tech companies headquartered in the area, including Silicon Valley just south of the city. The city also has a thriving arts and music scene, with many galleries, theaters, and music venues to explore.\n\nThe diverse population of San Francisco has led to a rich culinary scene, with a wide variety of restaurants offering cuisines from around the world. The city is also known for its progressive values and has a long history of activism and social justice movements.\n\nOverall, San','2024-05-20 03:04:46'),(55,23,'user','What is the history of SF?','2024-05-20 03:05:26'),(56,23,'urbanquest','The history of science fiction (SF) is a rich and diverse one that spans centuries. The genre has its roots in ancient myths and tales of exploration and discovery, but it truly began to take shape in the 19th century with the works of authors like Mary Shelley, Jules Verne, and H.G. Wells. These early writers helped establish many of the themes and tropes that would come to define the genre, such as space exploration, time travel, and encounters with alien life forms.\n\nScience fiction continued to evolve and grow throughout the 20th century, with writers like Isaac Asimov, Arthur C. Clarke, and Philip K. Dick pushing the boundaries of the genre with their imaginative and thought-provoking stories. SF','2024-05-20 03:05:29'),(57,24,'user','Hello','2024-05-20 03:16:11'),(58,24,'urbanquest','Hello! How can I assist you today?','2024-05-20 03:16:12'),(59,24,'user','Tell some places to visits in SF?','2024-05-20 03:16:40'),(60,24,'urbanquest','There are many wonderful places to visit in San Francisco. Here are a few popular attractions:\n\n1. Golden Gate Bridge: Iconic symbol of San Francisco, great for sightseeing and walking.\n\n2. Alcatraz Island: Tour the historic former prison and learn about its fascinating history.\n\n3. Fisherman\'s Wharf: Popular waterfront area with shops, restaurants, and attractions like Pier 39 and Ghirardelli Square.\n\n4. Chinatown: Explore the vibrant streets of one of the oldest and largest Chinatowns in North America.\n\n5. Golden Gate Park: Massive urban park with gardens, museums, and recreational activities.\n\n6. Union Square: Shopping district with upscale boutiques, department stores, and theaters.\n\n7. Palace of Fine','2024-05-20 03:16:43'),(61,25,'user','Who is elon musk?','2024-05-20 03:17:29'),(62,25,'urbanquest','Elon Musk is a well-known entrepreneur, inventor, and engineer. He is the founder, CEO, and lead designer of SpaceX; CEO and product architect of Tesla, Inc.; and co-founder of several other companies, including Neuralink and The Boring Company. Musk is known for his ambitious vision of the future, particularly in areas such as space exploration, renewable energy, and transportation.','2024-05-20 03:17:30'),(63,26,'user','What is Carbon?','2024-05-20 03:18:06'),(64,26,'urbanquest','Carbon is a chemical element with the symbol C and atomic number 6. It is a nonmetal that is essential for life on Earth and forms the basis of all living organisms. Carbon is found in various forms, including graphite, diamond, and carbon nanotubes. It is known for its ability to form long chains and complex structures, making it a versatile element in organic chemistry.','2024-05-20 03:18:08');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'arricsekhon','example@urbanquest.com','$2b$10$08PW3zCuiVX3stmTKSQ6..wN..2moAMomG041iwoGyWwhjsaF4gca','2024-05-06 17:38:01'),(2,'One','example1@urbanquest.com','$2b$10$MqXsCL5G6XrFqwSy6XiZc.y51RKqKDeekmNFxjpswGgCMkuKxHUHW','2024-05-06 18:00:36'),(3,'second','example2@urbanquest.com','$2b$10$MOjiIHp/3X0lPZC0ABi0IeIT7WVtgTgSOv3HTkAXBaYm75E5yiD6m','2024-05-06 18:24:40'),(4,'Third','example3@urbanquest.com','$2b$10$Qj4RAjGG/UIIiKSPMF.8zObiJdbZRzEAhc9Hf5iRgVKiEe/FBr1xG','2024-05-06 20:17:04'),(5,'fifth','example5@urbanquest.com','$2b$10$eTlnDZmGIWp8HVSUhJP7E.lkqC0VsXWs45lzN9vOrTDQEYGeWtqa2','2024-05-06 23:51:05'),(6,'sixth','example6@urbanquest.com','$2b$10$ZtwXHmSFELrqi2wcqBT9k.vxCIB97ZSnM9Li.4hm0CxpjaWtSq2tW','2024-05-07 16:47:38'),(7,'seventh','example7@urbanquest.com','$2b$10$WQiruVpidF.O73RD81aLSOU.hGGs9r1jVmYUVOFDLlVeEqzvqsuxa','2024-05-07 16:48:44'),(8,'eight','example8@urbanquest.com','$2b$10$0YtRS/k7TpEQ2XgDPtJWZedKOoHL2dBcUAC6Ojct.j5x/2kOJskCu','2024-05-07 16:56:11'),(9,'ninth','example9@urbanquest.com','$2b$10$8V7AZSnRxtaTszMXUEhCeOZEIvhK4.wBEoqB9St.Xp/AWohfH0KjG','2024-05-07 16:58:17'),(10,'tenth','example10@urbanquest.com','$2b$10$L2Nkr9DrYDrHBWJ7BSOHtONztehscbXAndCrEn.AuZ/65DPOUATm6','2024-05-07 16:59:30'),(11,'urbanquest','example11@urbanquest.com','$2b$10$6huF8cMpeV0FpY4HzOQgDu..GGHRt4U9xAWwLvZSpWzlCvzFFdD1O','2024-05-07 17:05:08'),(12,'pavigrewal','example12@urbanquest.com','$2b$10$WVgcoCWO3XYX.CHj3GyRFu.YKIJKY61y8Sm8QY1zWh0kDMP7khB6u','2024-05-07 17:07:39'),(13,'gill','example13@urbanquest.com','$2b$10$FwhJy7PoDG5ILm5EspdRv.hu99NJn2cR3Pr2N6/OAHDYtoV9xd7mS','2024-05-07 17:13:47'),(14,'yash','example14@urbanquest.com','$2b$10$bSWK0NaWZbl0nek.UfLRce6De2Dpw9fyWiskiBllfDMNbWcYCwJfK','2024-05-07 17:26:44'),(15,'taran','example15@urbanquest.com','$2b$10$hRniqdf0yMpS3r85dqguEu2l/1uFrNBkVmpyqV311vy.inT2yKTQa','2024-05-07 17:27:55'),(16,'lakshay','example16@urbanquest.com','$2b$10$0tOxNCb5l3Zq01yb6chuX.l5V6Ks6dYxCTRyl3BfCanRmzn73BGX6','2024-05-07 17:32:27'),(17,'openai','example17@urbanquest.com','$2b$10$yQmMH927zK/JJi0B5cWP7u7OxFxIALyUcIo8FXhLs3jFPsUpHXWAi','2024-05-07 17:34:23'),(18,'lama','example18@urbanquest.com','$2b$10$VQzYS1YSEybNoltH0qweVuHLLBFKT1oawMdw1W1tZEhLDYrw6uTX.','2024-05-07 17:36:15'),(19,'fireworks','example19@urbanquest.com','$2b$10$g54zsifZCTUuxYu6TafkXeNMAbmaYoyR/VQ7APGFV/NhFejB7fP8a','2024-05-07 17:37:36'),(20,'Alex','example65@urbanquest.com','$2b$10$.sFyuU3lzzvwKMhcY439hevGGDqkf8OO2Jyf5VH4LcRoQVDwyxxpe','2024-05-08 18:17:14'),(21,'Maxwell','example50@urbanquest.com','$2b$10$0K1PwbzrYqv1uwmOdD9XpOVyj5uCUioiN1sTYkJHdQLMp7t5bVnG2','2024-05-08 18:37:40'),(22,'Mary Park','example43@urbanquest.com','$2b$10$xD.qj5rFk5FE3yYf3pl4P.Pbr6DvRrPsGTXeQFCfPZUHq/kMDrulC','2024-05-09 02:29:17'),(23,'Mary Ward','example60@urbanquest.com','$2b$10$OQtXzvpS0JsZnDKaWxc2/eDlDd6TI0JJG4l/A.K/ZtTuV8gTEVCeq','2024-05-09 02:37:17'),(24,'sekhon','example70@urbanquest.com','$2b$10$6tmLCPPcS72i43htQ7urS.nfE/PMqjg.n63UE2IXzkrh9tUvPFoVa','2024-05-13 18:22:23');
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

-- Dump completed on 2024-05-19 20:34:30
