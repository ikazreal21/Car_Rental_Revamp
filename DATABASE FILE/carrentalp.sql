-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2023 at 08:13 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_fare` int(255) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `car_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_nameplate`, `car_fare`, `car_img`, `car_availability`) VALUES
(1, 'Audi A4', 'GA3KA6969', 1000, 'assets/img/cars/audi-a4.jpg', 'no'),
(2, 'Hyundai Creta', 'BA2CH2020', 2000, 'assets/img/cars/creta.jpg', 'yes'),
(3, 'BMW 6-Series', 'BA10PA5555', 2000, 'assets/img/cars/bmw6.jpg', 'yes'),
(4, 'Mercedes-Benz E-Class', 'BA10CH6009', 3500, 'assets/img/cars/mcec.jpg', 'yes'),
(6, 'Ford EcoSport', 'GA4PA2587', 6000, 'assets/img/cars/ecosport.png', 'yes'),
(7, 'Honda Amaze', 'PJ16YX8820', 10000, 'assets/img/cars/amaze.png', 'yes'),
(8, 'Land Rover Range Rover Sport', 'GA5KH9669', 11000, 'assets/img/cars/rangero.jpg', 'yes'),
(9, 'MG Hector', 'GA6PA6666', 1200, 'assets/img/cars/mghector.jpg', 'yes'),
(10, 'Honda CR-V', 'TN17MS1997', 6000, 'assets/img/cars/hondacr.jpg', 'yes'),
(11, 'Mahindra XUV 500', 'KA12EX1883', 9000, 'assets/img/cars/Mahindra XUV.jpg', 'yes'),
(12, 'Toyota Fortuner', 'GA08MX1997', 1000, 'assets/img/cars/Fortuner.png', 'yes'),
(13, 'Hyundai Veloster', 'BA20PA5685', 1500, 'assets/img/cars/hyundai0.png', 'yes'),
(14, 'Jaguar XF', 'GA8KH8866', 7000, 'assets/img/cars/jaguarxf.jpg', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clientcars`
--

CREATE TABLE `clientcars` (
  `car_id` int(20) NOT NULL,
  `client_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_image` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`, `status`, `id_image`, `role`) VALUES
('admin', '', '', '', '', 'adminadmin', '', '', 'admin'),
('antonio', 'Antonio M', '0785556580', 'antony@gmail.com', '2677  Burton Avenue', 'password', 'approve', 'assets/img/users_id/1079354.jpg', 'customer'),
('christine', 'Christine', '8544444444', 'chr@gmail.com', '3701  Fairway Drive', 'password', 'approve', 'assets/img/users_id/1079354.jpg', 'customer'),
('ethan', 'Ethan Hawk', '69741111110', 'thisisethan@gmail.com', '4554  Rowes Lane', 'password', 'approve', 'assets/img/users_id/1079354.jpg', 'customer'),
('james', 'James Washington', '0258786969', 'james@gmail.com', '2316  Mayo Street', 'password', 'approve', 'assets/img/users_id/1079354.jpg', 'customer'),
('lucas', 'Lucas Rhoades', '7003658500', 'lucas@gmail.com', '2737  Fowler Avenue', 'password', 'approve', 'assets/img/users_id/1079354.jpg', 'customer'),
('Zaki', 'Joaquin Zaki Soriano', '09695191665', 'joaquinzaki21@gmail.com', 'St. Therese St. Penafrancia Cupang', 'zakizaki', 'approve', 'assets/img/users_id/1079354.jpg', 'customer'),
('Zaki21', 'Joaquin Zaki Soriano', '09695191665', 'joaquinzaki21@gmail.com', 'St. Therese St. Penafrancia Cupang', 'zakizakizaki', 'decline', 'assets/img/users_id/1079354.jpg', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `message` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `e_mail`, `message`) VALUES
('Nikhil', 'nikhil@gmail.com', 'Hope this works.');

-- --------------------------------------------------------

--
-- Table structure for table `rentedcars`
--

CREATE TABLE `rentedcars` (
  `id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `car_id` int(20) NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `fare` double NOT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `distance` double DEFAULT NULL,
  `no_of_days` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL,
  `booking_status` varchar(255) NOT NULL,
  `reciept_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentedcars`
--

INSERT INTO `rentedcars` (`id`, `customer_username`, `car_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `car_return_date`, `fare`, `charge_type`, `distance`, `no_of_days`, `total_amount`, `return_status`, `booking_status`, `reciept_image`) VALUES
(574681298, 'lucas', 3, '2023-10-13', '2023-10-17', '2023-10-20', '2023-10-13', 2000, 'day', NULL, 3, 6000, 'R', 'approve', 'assets/img/reciept_image/download.jpg'),
(574681299, 'lucas', 6, '2023-10-13', '2023-10-20', '2023-10-27', '2023-10-13', 6000, 'day', NULL, 7, 42000, 'R', 'approve', 'assets/img/reciept_image/unnamed.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `car_nameplate` (`car_nameplate`);

--
-- Indexes for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_username`);

--
-- Indexes for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rentedcars`
--
ALTER TABLE `rentedcars`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574681300;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
