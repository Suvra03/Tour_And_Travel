
CREATE DATABASE TOURSNTRAVEL;

USE TOURSNTRAVEL;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `Booking`(
    `id` BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `package_id` BIGINT UNSIGNED NOT NULL,
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `persons` INT NOT NULL,
    `days` INT NOT NULL,
    `book_date` VARCHAR(255) NOT NULL,
    `book_time` TIME NOT NULL,
    `trip_date` VARCHAR(255) NOT NULL,
    `status` ENUM('Pending','Confirmed','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Inquiry`(
    `id` BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `date` VARCHAR(255) NOT NULL,
    `time` TIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Feedback`(
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `package_id` BIGINT UNSIGNED NOT NULL,
    `rating` INT NOT NULL,
    `feedback` TEXT NOT NULL,
    `date` VARCHAR(255) NOT NULL,
    `time` TIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Admin`(
    `username` VARCHAR(255) PRIMARY KEY NOT NULL,
    `password` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Package`(
    `id` BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `package_name` VARCHAR(255) NOT NULL,
    `package_subject` VARCHAR(255) NOT NULL,
    `package_des` LONGTEXT NOT NULL,
    `amount` DOUBLE(8, 2) NOT NULL,
    `image` BLOB NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Customer`(
    `id` BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `Booking` ADD FOREIGN KEY (`package_id`) REFERENCES `Package`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `Booking` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `Feedback` ADD FOREIGN KEY (`package_id`) REFERENCES `Package`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `Feedback` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

INSERT INTO `Admin` (`username`, `password`) VALUES 
(10001,'jefa'), 
(10002, 'hoof'), 
(10003, 'hovding'), 
(10004, 'honcho'), 
(10005, 'capa');