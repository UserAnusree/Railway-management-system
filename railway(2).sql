-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2022 at 04:11 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_val` (`fname` VARCHAR(20), `lname` VARCHAR(20), `Message` VARCHAR(50))   BEGIN
insert into contact(FirstName,LastName,Message) VALUES(fname,lname,Message);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_value` (IN `fname` VARCHAR(20), IN `Sname` VARCHAR(20), IN `Uname` VARCHAR(20), IN `Gender` VARCHAR(10), IN `Email` VARCHAR(30), IN `Password` VARCHAR(20))   BEGIN
insert into passenger(Name,Surname,Username,Gender,Email,Password) VALUES(fname,Sname,Uname,Gender,Email,Password);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_data` ()   BEGIN
SELECT * from passenger;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_data2` ()   BEGIN
SELECT * from contact;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(22) NOT NULL,
  `Username` varchar(222) NOT NULL,
  `Password` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `Username`, `Password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `book_ticket`
--

CREATE TABLE `book_ticket` (
  `id` int(22) NOT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `Destination` varchar(20) DEFAULT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `arrival_date` varchar(222) NOT NULL,
  `Arrival_time` time DEFAULT NULL,
  `Dept_time` time DEFAULT NULL,
  `Train_class` varchar(20) DEFAULT NULL,
  `Station_name` varchar(20) DEFAULT NULL,
  `passenger_name` varchar(222) NOT NULL,
  `Seat_category` varchar(45) NOT NULL,
  `Payment` int(11) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_ticket`
--

INSERT INTO `book_ticket` (`id`, `Source`, `Destination`, `Train_name`, `arrival_date`, `Arrival_time`, `Dept_time`, `Train_class`, `Station_name`, `passenger_name`, `Seat_category`, `Payment`, `status`) VALUES
(12, 'Comilla', 'Dhaka', 'Turna Express', '2022-05-06', '00:00:00', '09:08:00', 'AC', 'Dhaka', 'Anusree', 'Adult', 500, 'Pending'),
(14, 'Comilla', 'Comilla', 'Banalata Express', '2022-11-29', '00:00:00', '09:00:00', 'AC', 'Chattogram', 'Test', 'Adult', 500, 'Reject'),
(15, 'Comilla', 'Comilla', 'parabat', '2022-11-29', '00:00:00', '09:08:00', 'Non-AC', 'Chattogram', 'Tazniba', 'child', 500, 'Approve'),
(16, 'Comilla', 'Chattogram', 'Banalata Express', '2022-11-15', '00:00:00', '09:00:00', 'Non-AC', 'Chattogram', 'Anusree', 'child', 500, 'Approve'),
(17, 'Dhaka', 'Dhaka', 'Ekota Express', '2022-09-30', '00:00:00', '09:08:00', 'Non-AC', 'Dhaka', 'Anusree', 'Disable', 500, 'Approve'),
(18, 'Khulna', 'Barishal', 'Banalata Express', '2022-11-29', '00:00:00', '09:08:00', 'Souvan Chair', 'Barishal', 'Anusree', 'Ladies', 5000, 'Pending'),
(19, 'Comilla', 'Comilla', 'parabat', '2022-11-23', '00:00:00', '09:08:00', 'AC', 'Dhaka', 'Tazniba', 'Ladies', 500, 'Reject'),
(20, 'Comilla', 'Barishal', 'Banalata Express', '2022-11-15', '00:00:00', '04:05:00', 'Souvan Chair', 'Dhaka', 'Asma', 'Ladies', 500, 'Reject');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category` varchar(20) NOT NULL,
  `Seat_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `Train_ID` bigint(20) DEFAULT NULL,
  `Train_class` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Message` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`ID`, `FirstName`, `LastName`, `Message`) VALUES
(2, 'Anusree', 'Das', 'Hello everyone'),
(3, 'Anni', 'Das', 'Hi guys'),
(4, 'Pushpita', 'Das', 'Hello everyone\r\n'),
(5, 'Pushpita', 'Das', 'hi'),
(6, 'Tazniba', 'Jafar', 'Please send me the ticket confirmation message. '),
(7, 'Asma', 'Binte', 'hello'),
(8, 'Amrita', 'Roy', 'Hello '),
(9, 'Pushpita', 'Das', 'hi'),
(10, 'Tazniba', 'Jafar', 'Hi everyone'),
(11, 'Tanvir', 'Mahtab', 'Hello'),
(12, 'Hassan', 'Mohammad', 'I want a general ticket urgently.'),
(13, 'Pushpita', 'Das', 'hello'),
(15, 'Najim', 'Karim', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `Name` varchar(20) DEFAULT NULL,
  `Surname` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`Name`, `Surname`, `Username`, `Gender`, `Email`, `Password`) VALUES
('', 'Sname', '', '', 'rahim11@gmail.com', '123456'),
('Test', 'Karim', 'Imtiaz', 'male', 'testkarim@gmail.com', '123456'),
('Anusree', 'Das', 'Anusree', 'Female', 'dasanusree976@gmail.com', 'abc1234'),
('Najim', 'Karim', 'admin', 'male', 'imtiazriad793@gmail.com', 'admin'),
('Amit', 'Das', 'Amit', 'Male', 'amitdas12345@gmail.com', 'amityou123'),
('Anita', 'Das', 'Anita', 'Female', 'anitadas234@gmail.com', 'Anita123'),
('Anni', 'Das', 'Anni', 'Female', 'dasanni123@gmail.com', 'anni123'),
('Antu', 'Das', 'Antu', 'Male', 'dasantu123@gmail.com', 'antu1234'),
('Asma', 'Binte', 'Eva', 'Female', 'asmaeva123@gmail.com', 'eva12345'),
('Trey', 'Jones', 'Trey', 'Male', 'smith200@gmail.com', 'Jones12345'),
('Pushpita', 'Das', 'Khusi', 'Female', 'khusi843@gmail.com', 'Khushictg'),
('Tazniba', 'Jafar', 'Prima', 'Female', 'prima1234@gamail.com', 'prima156'),
('Anwesha', 'Barua', 'Proma', 'Female', 'anwesha123@gmail.com', 'Promalab'),
('Sreoshi', 'Mitra', 'Sri', 'Female', 'sri1245@gmail.com', 'sri1234'),
('prima', 'tazina', 'jafar', 'female', 'rahim@gmail.com', 'rahim'),
('Anusree', 'Das', 'Anusree', 'Female', 'anusreee123@gmail.com', '98765'),
('Tazniba', 'Jafar ', 'prima', 'Female', 'prima123@gmail.com', '98765'),
('Anusree', 'Das', 'Anusree', 'Female', 'anusreee123@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `Train_ID` bigint(20) DEFAULT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `Destination` varchar(20) DEFAULT NULL,
  `Train_class` varchar(20) DEFAULT NULL,
  `Payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `Seat_no` varchar(11) NOT NULL,
  `Train_class` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `Station_ID` bigint(20) NOT NULL,
  `Station_name` varchar(20) DEFAULT NULL,
  `No_of_platform` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_ID` bigint(20) NOT NULL,
  `Train_name` varchar(20) DEFAULT NULL,
  `Station_ID` bigint(20) DEFAULT NULL,
  `available` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `train_id` int(22) NOT NULL,
  `train_name` varchar(222) NOT NULL,
  `station_name` varchar(222) NOT NULL,
  `available` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`train_id`, `train_name`, `station_name`, `available`) VALUES
(4, 'Turna Express', 'Dhaka', 'Available'),
(5, 'parabat', 'Sylhet', 'Available'),
(6, 'chattala Express', 'Comilla', 'Not Available'),
(7, 'Lalmoni Express', 'Barishal', 'Not Available'),
(8, 'Banalata Express', 'Dhaka', 'Available'),
(9, 'Ekota Express', 'Chattogram', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_ticket`
--
ALTER TABLE `book_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category`),
  ADD KEY `Seat_no` (`Seat_no`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`Train_class`),
  ADD KEY `Train_ID` (`Train_ID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Password`),
  ADD KEY `Email` (`Email`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`Payment`),
  ADD KEY `Source` (`Source`),
  ADD KEY `Destination` (`Destination`),
  ADD KEY `Train_class` (`Train_class`),
  ADD KEY `Train_ID` (`Train_ID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`Seat_no`),
  ADD KEY `Train_class` (`Train_class`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`Station_ID`),
  ADD UNIQUE KEY `Station_name` (`Station_name`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_ID`),
  ADD KEY `train_ibfk_1` (`Station_ID`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`train_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book_ticket`
--
ALTER TABLE `book_ticket`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `train_id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

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
