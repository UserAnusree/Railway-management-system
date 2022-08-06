-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 06, 2022 at 02:46 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_ticket`
--

DROP TABLE IF EXISTS `book_ticket`;
CREATE TABLE IF NOT EXISTS `book_ticket` (
  `Source` varchar(20) DEFAULT NULL,
  `Destination` varchar(20) DEFAULT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `Arrival_time` time DEFAULT NULL,
  `Dept_time` time DEFAULT NULL,
  `Train_class` varchar(20) DEFAULT NULL,
  `Station_name` varchar(20) DEFAULT NULL,
  `Payment` int(11) NOT NULL,
  UNIQUE KEY `Payment` (`Payment`),
  UNIQUE KEY `Source` (`Source`),
  UNIQUE KEY `Destination` (`Destination`),
  KEY `Station_name` (`Station_name`),
  KEY `Train_class` (`Train_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Category` varchar(20) NOT NULL,
  `Seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Category`),
  KEY `Seat_no` (`Seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `Train_ID` bigint(20) DEFAULT NULL,
  `Train_class` varchar(20) NOT NULL,
  PRIMARY KEY (`Train_class`),
  KEY `Train_ID` (`Train_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  KEY `Email` (`Email`),
  KEY `Password` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
CREATE TABLE IF NOT EXISTS `meal` (
  `ID` bigint(20) DEFAULT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `Station_name` varchar(20) DEFAULT NULL,
  KEY `Train_name` (`Train_name`),
  KEY `Station_name` (`Station_name`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
CREATE TABLE IF NOT EXISTS `passenger` (
  `Name` varchar(20) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_number` bigint(20) DEFAULT NULL,
  `ID` bigint(20) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Password` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE IF NOT EXISTS `payment_status` (
  `Train_ID` bigint(20) DEFAULT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `Destination` varchar(20) DEFAULT NULL,
  `Train_class` varchar(20) DEFAULT NULL,
  `Payment` int(11) DEFAULT NULL,
  KEY `Source` (`Source`),
  KEY `Destination` (`Destination`),
  KEY `Train_class` (`Train_class`),
  KEY `Train_ID` (`Train_ID`),
  KEY `Payment` (`Payment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
CREATE TABLE IF NOT EXISTS `seat` (
  `Seat_no` varchar(11) NOT NULL,
  `Train_class` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Seat_no`),
  KEY `Train_class` (`Train_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `Station_ID` bigint(20) NOT NULL,
  `Station_name` varchar(20) DEFAULT NULL,
  `No_of_platform` int(11) DEFAULT NULL,
  PRIMARY KEY (`Station_ID`),
  UNIQUE KEY `Station_name` (`Station_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
CREATE TABLE IF NOT EXISTS `train` (
  `Train_ID` bigint(20) NOT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `Station_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Train_ID`),
  UNIQUE KEY `Train_name` (`Train_name`),
  KEY `Station_ID` (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_ticket`
--
ALTER TABLE `book_ticket`
  ADD CONSTRAINT `book_ticket_ibfk_1` FOREIGN KEY (`Station_name`) REFERENCES `station` (`Station_name`),
  ADD CONSTRAINT `book_ticket_ibfk_2` FOREIGN KEY (`Train_class`) REFERENCES `class` (`Train_class`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Seat_no`) REFERENCES `seat` (`Seat_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `passenger` (`Email`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`Password`) REFERENCES `passenger` (`Password`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`Train_name`) REFERENCES `train` (`Train_name`),
  ADD CONSTRAINT `meal_ibfk_2` FOREIGN KEY (`Station_name`) REFERENCES `station` (`Station_name`),
  ADD CONSTRAINT `meal_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `passenger` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD CONSTRAINT `payment_status_ibfk_1` FOREIGN KEY (`Source`) REFERENCES `book_ticket` (`Source`),
  ADD CONSTRAINT `payment_status_ibfk_2` FOREIGN KEY (`Destination`) REFERENCES `book_ticket` (`Destination`),
  ADD CONSTRAINT `payment_status_ibfk_3` FOREIGN KEY (`Train_class`) REFERENCES `class` (`Train_class`),
  ADD CONSTRAINT `payment_status_ibfk_4` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`),
  ADD CONSTRAINT `payment_status_ibfk_5` FOREIGN KEY (`Payment`) REFERENCES `book_ticket` (`Payment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`Train_class`) REFERENCES `class` (`Train_class`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`Station_ID`) REFERENCES `station` (`Station_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
