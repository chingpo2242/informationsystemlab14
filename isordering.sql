-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2024 at 02:55 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_log` date DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `total_cost` decimal(10,2) NOT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `product_name`, `customer_username`, `date_log`, `quantity`, `total_cost`, `product_id`) VALUES
(8, 'IPHONE 7', 'user', '2024-04-08', 2, '100.00', NULL),
(9, 'SAMSUNG', 'user', '2024-04-08', 3, '1500.00', NULL),
(10, 'IPHONE 7', 'user', NULL, 1, '50.00', NULL),
(11, 'IPHONE 7', 'user', NULL, 1, '50.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `quantity`) VALUES
(4, 'IPHONE 7', '50.00', 0),
(5, 'IPHONE 8', '150.00', 0),
(6, 'SAMSUNG', '500.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','customer') COLLATE utf8mb4_general_ci NOT NULL,
  `date_log` date DEFAULT NULL,
  `time_log` time DEFAULT NULL,
  `operation` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `date_log`, `time_log`, `operation`) VALUES
(7, 'user', '$2y$10$Gf.1.nVu5dxu2V9zmB6e1eRs/8CmaFbfxhMpQy1FxXp5SKruVu7AS', 'customer', '2024-04-13', '02:14:23', NULL),
(8, 'adminbuang', '$2y$10$CFig3HlkdsAZF2rY4tTQxOchpolh6DiglG7igJizSl0Eoov/2P4H2', 'admin', '2024-04-13', '02:14:32', NULL),
(9, 'user1', '$2y$10$cG/7Z3HfgCvbJcP2.GPrWOw.H0yIfyxXUHtB6/T/T6LSaH2V6kYq.', 'customer', '2024-04-13', '02:20:25', 'register'),
(10, 'bagares', '$2y$10$MbqDWpJnhlAXZC72ktQ.L.JQQnddHO.5hrAtpd0r087eWb.Sv5e5u', 'customer', '2024-04-13', '02:22:16', 'register');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `time_log` time NOT NULL,
  `date_log` date NOT NULL,
  `operation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
