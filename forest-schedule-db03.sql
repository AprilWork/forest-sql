-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.29 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for schedule_db
CREATE DATABASE IF NOT EXISTS `schedule_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schedule_db`;

-- Dumping structure for table schedule_db.classes
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `file_image_name` varchar(100) DEFAULT 'default.jpg',
  `type_id` int unsigned NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `class_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1658 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.classes: ~7 rows (approximately)
REPLACE INTO `classes` (`id`, `name`, `description`, `file_image_name`, `type_id`, `create_time`) VALUES
	(2, 'yoga level up', 'It is advanced yoga class', 'pexels-andrea-piacquadio-917732.jpg', 1, '2022-08-05 15:17:21'),
	(3, 'family zumba', 'Dance zumba with kids!', 'pexels-andrea-piacquadio-3775566.jpg', 3, '2022-08-05 15:17:21'),
	(4, 'easy pilates', 'Pilates for beginners', 'pexels-andrea-piacquadio-868483.jpg', 2, '2022-08-05 15:17:21'),
	(10, 'Yoga With Weights', 'Join us for this brand new yoga class that will get your heart pumping! We will incorporate traditional yoga poses with light weights and cardio to tone muscles and encourage weight loss.\r\nAll experience levels welcome!', 'default.jpg', 1, '2022-08-05 15:17:21'),
	(37, 'Basic Yoga with null image', 'Wonderfull yoga class for beginners. All age invited!', 'default.jpg', 1, '2022-08-09 13:54:34'),
	(1653, 'Pilates with Ball', 'You will lean!', 'default.jpg', 2, '2022-08-16 18:54:42'),
	(1656, 'Cycling for seniors', 'Be strong, be young!', 'default.jpg', 182, '2022-08-16 15:10:23');

-- Dumping structure for view schedule_db.classes_schedule_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `classes_schedule_view` (
	`session_id` INT(10) NOT NULL,
	`name_type` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`days_of_week` SET('Su','Mo','Tu','We','Th','Fr','Sa') NULL COLLATE 'utf8mb4_0900_ai_ci',
	`begin_session` TIME NULL,
	`end_session` TIME NULL,
	`state` ENUM('Book Now','Wait List','Canceled','Closed') NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Dumping structure for table schedule_db.class_type
CREATE TABLE IF NOT EXISTS `class_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name_UNIQUE` (`name_type`),
  UNIQUE KEY `category_id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.class_type: ~4 rows (approximately)
REPLACE INTO `class_type` (`id`, `name_type`) VALUES
	(182, 'Cycling'),
	(2, 'Pilates'),
	(1, 'Yoga'),
	(3, 'Zumba');

-- Dumping structure for view schedule_db.class_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `class_view` (
	`id` INT(10) NOT NULL,
	`name_type` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`description` TEXT NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Dumping structure for table schedule_db.designers
CREATE TABLE IF NOT EXISTS `designers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `user_id` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.designers: ~1 rows (approximately)
REPLACE INTO `designers` (`id`, `username`, `email`, `user_id`, `create_time`) VALUES
	(1, 'Irene Mitin', 'girafzebra@yahoo.com', 8, '2022-08-05 15:44:09');

-- Dumping structure for table schedule_db.files
CREATE TABLE IF NOT EXISTS `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `caption` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_name_UNIQUE` (`file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.files: ~11 rows (approximately)
REPLACE INTO `files` (`id`, `file_name`, `label`, `caption`) VALUES
	(1, 'pexels-andrea-piacquadio-868483.jpg', 'pilates', 'Pilates class'),
	(2, 'pexels-andrea-piacquadio-917732.jpg', 'yoga', 'Yoga class'),
	(3, 'pexels-andrea-piacquadio-3775566.jpg', 'zumba', 'Zumba Class'),
	(4, 'pexels-andrea-piacquadio-3768593.jpg', 'pilates', 'Ball'),
	(12, 'pexels-andrea-piacquadio-917526.jpg', 'blare', 'blare'),
	(18, 'pexels-ivan-samkov-4164759.jpg', 'Instructor4', 'Instructor4'),
	(20, 'pexels-andrea-piacquadio-903171.jpg', 'studio', 'studio'),
	(37, 'pexels-mikhail-nilov-6740056.jpg', 'Instructor5', 'Instructor5'),
	(39, 'pexels-karolina-grabowska-4498572.jpg', 'Instructor3', 'Instructor3'),
	(40, 'pexels-mikhail-nilov-6740747.jpg', 'Instructor2', 'Instructor2 '),
	(41, 'pexels-marta-wave-6454042.jpg', 'Instructor1', 'Instructor1');

-- Dumping structure for table schedule_db.manager
CREATE TABLE IF NOT EXISTS `manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `user_id` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.manager: ~0 rows (approximately)

-- Dumping structure for table schedule_db.role_category
CREATE TABLE IF NOT EXISTS `role_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `category_id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.role_category: ~5 rows (approximately)
REPLACE INTO `role_category` (`id`, `name`) VALUES
	(3, 'customer'),
	(4, 'developer'),
	(2, 'instructor'),
	(1, 'manager'),
	(5, 'stuff');

-- Dumping structure for table schedule_db.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL DEFAULT '1',
  `days_of_week` set('Su','Mo','Tu','We','Th','Fr','Sa') DEFAULT NULL,
  `begin_session` time DEFAULT '00:00:00',
  `end_session` time DEFAULT '00:00:00',
  `room` int DEFAULT '0',
  `state` enum('Book Now','Wait List','Canceled','Closed') DEFAULT 'Book Now',
  `capacity` int unsigned DEFAULT NULL,
  `booked` int unsigned DEFAULT NULL,
  PRIMARY KEY (`session_id`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`session_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `FK_schedule_classes` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.schedule: ~6 rows (approximately)
REPLACE INTO `schedule` (`session_id`, `class_id`, `days_of_week`, `begin_session`, `end_session`, `room`, `state`, `capacity`, `booked`) VALUES
	(5, 2, 'We,Sa', '09:30:00', '10:30:00', 2, 'Wait List', 15, 15),
	(6, 1656, 'Mo,Th', '18:30:00', '19:30:00', 2, 'Book Now', 15, 5),
	(7, 3, 'Su,Fr', '23:40:00', '00:30:00', 1, 'Book Now', 10, 6),
	(8, 4, 'Tu,Fr', '09:30:00', '10:30:00', 1, 'Book Now', 15, 8),
	(9, 3, 'Mo,Th', '18:30:00', '19:30:00', 2, 'Book Now', 10, 9),
	(11, 3, 'Mo,Fr', '18:30:00', '19:30:00', 2, 'Wait List', 15, 15);

-- Dumping structure for procedure schedule_db.Update_Schedule
DELIMITER //
CREATE PROCEDURE `Update_Schedule`()
    COMMENT 'Switch BOOKING_NOW/WAIT_LIST'
BEGIN
UPDATE schedule
SET state = 'Wait List'
WHERE capacity = booked ;
UPDATE schedule
SET state = 'Book Now'
WHERE capacity > booked ;
END//
DELIMITER ;

-- Dumping structure for table schedule_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1624 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table schedule_db.users: ~7 rows (approximately)
REPLACE INTO `users` (`id`, `email`, `username`, `password`, `create_time`) VALUES
	(1, 'frog1@yahoo.com', 'Peter Frog', '12345', '2022-08-02 21:47:46'),
	(2, 'door2@yahoo.com', 'Anna DoorStep', '23456', '2022-08-02 21:47:46'),
	(8, 'girafzebra@yahoo.com', 'Irene Mitin', 'water', '2022-08-03 16:40:01'),
	(9, 'abdula@yahoo.com', 'Abdula Salam', '12345', '2022-08-03 16:48:03'),
	(10, 'rest@yahoo.com', 'Irene Restless', 'rest', '2022-08-04 00:01:05'),
	(11, 'ford@yahoo.com', 'Peter Ford', 'ford', '2022-08-05 20:38:22'),
	(12, 'summer@yahoo.com', 'Jeen Summer', 'summer', '2022-08-05 21:55:15');

-- Dumping structure for view schedule_db.users_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `users_view` (
	`id` INT(10) NOT NULL,
	`email` VARCHAR(40) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`username` VARCHAR(40) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Dumping structure for table schedule_db.user_info
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_birth` date NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(40) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `membership` int DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`email`) USING BTREE,
  UNIQUE KEY `email_UNIQUE` (`email`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1620 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table schedule_db.user_info: ~7 rows (approximately)
REPLACE INTO `user_info` (`id`, `email`, `username`, `date_birth`, `first_name`, `last_name`, `street`, `city`, `zip`, `phone`, `membership`, `create_time`) VALUES
	(1, 'frog1@yahoo.com', 'Peter Frog', '1978-06-27', 'Peter', 'Frog', 'fgfghfghf', 'Toto', '67899', '1234567890', 0, '2022-08-02 21:47:46'),
	(2, 'door2@yahoo.com', 'Anna DoorStep', '1983-11-14', 'Anna', 'DoorStep', 'gfdfg', 'Werte', '0987', '0987654321', 0, '2022-08-02 21:47:46'),
	(8, 'girafzebra@yahoo.com', 'Irene Mitin', '1993-12-06', 'Irene', 'Mitin', 'fdgd', 'Fortesen', '34560', '1234509876', 0, '2022-08-03 16:40:01'),
	(9, 'abdula@yahoo.com', 'Abdula Salam', '1972-03-29', 'Abdula', 'Salam', 'dfg', 'Ogorkin', '45067', '5432167890', 0, '2022-08-03 16:48:03'),
	(10, 'rest@yahoo.com', 'Irene Restless', '1968-08-15', 'Irene', 'Restless', 'dgd', 'Vast', '32103', '6789012345', 0, '2022-08-04 00:01:05'),
	(11, 'ford@yahoo.com', 'Peter Ford', '1996-04-22', 'Peter', 'Ford', 'dfgd', 'Green', '67801', '1029384756', 0, '2022-08-05 20:38:22'),
	(12, 'summer@yahoo.com', 'Jeen Summer', '1957-10-16', 'Jeen', 'Summer', 'dff', 'Heidy', '23056', '564738280', 0, '2022-08-05 21:55:15');

-- Dumping structure for view schedule_db.classes_schedule_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `classes_schedule_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `classes_schedule_view` AS select `s`.`session_id` AS `session_id`,`t`.`name_type` AS `name_type`,`c`.`name` AS `name`,`s`.`days_of_week` AS `days_of_week`,`s`.`begin_session` AS `begin_session`,`s`.`end_session` AS `end_session`,`s`.`state` AS `state` from ((`class_type` `t` join `classes` `c`) join `schedule` `s`) where ((`c`.`type_id` = `t`.`id`) and (`s`.`class_id` = `c`.`id`));

-- Dumping structure for view schedule_db.class_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `class_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `class_view` AS select `c`.`id` AS `id`,`t`.`name_type` AS `name_type`,`c`.`name` AS `name`,`c`.`description` AS `description` from (`class_type` `t` join `classes` `c`) where (`c`.`type_id` = `t`.`id`) order by `t`.`name_type`;

-- Dumping structure for view schedule_db.users_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `users_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `users_view` AS select `users`.`id` AS `id`,`users`.`email` AS `email`,`users`.`username` AS `username` from `users`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
