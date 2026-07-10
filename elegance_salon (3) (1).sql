-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2026 at 09:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elegance_salon`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `stylist_id` int(11) DEFAULT NULL,
  `service_name` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Pending','Approved','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `client_id`, `stylist_id`, `service_name`, `appointment_date`, `appointment_time`, `status`, `created_at`) VALUES
(26, 37, 13, 'Hair Cut & Styling', '2026-07-05', '17:00:00', 'Cancelled', '2026-07-04 15:55:22'),
(27, 39, 13, 'Eyebrow Threading', '2026-07-16', '13:00:00', 'Completed', '2026-07-05 15:48:00'),
(28, 39, 13, 'Eyebrow Threading', '2026-07-16', '16:00:00', 'Approved', '2026-07-05 15:48:14'),
(29, 37, 13, 'Luxury Manicure', '2026-07-09', '05:25:00', 'Pending', '2026-07-05 19:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('New','Read','Replied') DEFAULT 'New',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `subject`, `message`, `status`, `created_at`) VALUES
(3, 'maria', 'mariaabdali1978@gmail.com', '02138815478', 'my review for the website', 'parhne chale jao larke bhut time waste karte ho', 'New', '2026-07-05 15:44:24'),
(4, 'maria', 'mariaabdali1978@gmail.com', '02138815478', 'my review for the website', 'uluuuuuuuuu', 'Read', '2026-07-05 15:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `threshold_quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_name`, `quantity`, `threshold_quantity`, `created_at`) VALUES
(6, 'hair spary', 5, 4, '2026-07-06 16:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('Paid','Pending') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `appointment_id`, `amount`, `payment_method`, `payment_status`, `created_at`) VALUES
(9, 29, 1800.00, 'Card', 'Paid', '2026-07-06 17:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salon_settings`
--

CREATE TABLE `salon_settings` (
  `id` int(11) NOT NULL,
  `salon_name` varchar(150) NOT NULL,
  `contact_email` varchar(150) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text DEFAULT NULL,
  `currency` varchar(20) DEFAULT 'PKR',
  `opening_time` time DEFAULT '09:00:00',
  `closing_time` time DEFAULT '21:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `salon_logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salon_settings`
--

INSERT INTO `salon_settings` (`id`, `salon_name`, `contact_email`, `phone`, `address`, `currency`, `opening_time`, `closing_time`, `updated_at`, `salon_logo`) VALUES
(1, 'Elegance Salon', 'admin@elegance.com', '03000000000', 'Karachi, Pakistan', 'PKR', '09:00:00', '21:00:00', '2026-07-06 16:28:47', 'uploads/settings/salon_logo_1783355327.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `price`, `duration`, `description`, `created_at`) VALUES
(5, 'Hair Cut & Styling', 2500.00, 60, 'Professional haircut and styling for a fresh new look.', '2026-07-04 15:52:29'),
(6, 'Hair Color & Highlights', 6000.00, 150, 'Premium hair coloring and highlights using high-quality products.', '2026-07-04 15:52:29'),
(7, 'Luxury Manicure', 1800.00, 45, 'Luxury manicure with nail shaping, cuticle care and polish.', '2026-07-04 15:52:29'),
(8, 'Spa Pedicure', 2200.00, 60, 'Relaxing spa pedicure including foot massage and exfoliation.', '2026-07-04 15:52:29'),
(9, 'Glow Facial', 3500.00, 75, 'Deep cleansing facial for radiant and healthy skin.', '2026-07-04 15:52:29'),
(10, 'Eyebrow Threading', 500.00, 15, 'Professional eyebrow threading for a perfect shape.', '2026-07-04 15:52:29'),
(11, 'Bridal Package', 25000.00, 300, 'Complete bridal makeover including hair, makeup and skincare.', '2026-07-04 15:52:29'),
(12, 'Makeup Application', 4500.00, 90, 'Professional makeup application for parties and special occasions.', '2026-07-04 15:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `phone`, `role`, `salary`, `status`, `created_at`) VALUES
(5, 'zeba khan', 'zeba@gmail.com', '09876543212', 'staff', 40000.00, 'Active', '2026-07-06 17:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `stylists`
--

CREATE TABLE `stylists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stylists`
--

INSERT INTO `stylists` (`id`, `name`, `email`, `phone`, `specialty`, `image`, `experience`, `gender`, `bio`, `address`, `status`, `created_at`) VALUES
(13, 'Manha Fatima', 'manhalearning2712@gmail.com', '03363547047', 'General', 'stylist_13_1783271862.jpg', 0, 'Female', 'stylist at elegance salon', 'Plot A 551', 'Active', '2026-07-04 15:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client','stylist','receptionist') NOT NULL DEFAULT 'client',
  `profile_image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `reset_otp` varchar(10) DEFAULT NULL,
  `reset_otp_expiry` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `profile_image`, `address`, `reset_otp`, `reset_otp_expiry`, `created_at`) VALUES
(1, 'Salon Admin', 'admin@elegance.com', NULL, '$2y$10$A31y2P4s3hUfOdf2WQz5IeNV0GiwmpBcrFhv0Mk0hDlVLclSHjSJG', 'admin', NULL, NULL, NULL, NULL, '2026-06-24 01:41:32'),
(26, 'Receptionist', 'receptionist@gmail.com', '', '123456', 'receptionist', 'uploads/receptionists/receptionist_26_1783353232.jpg', '', '340632', '2026-07-04 16:27:59', '2026-07-03 13:43:26'),
(37, 'Muhammad Hashir', 'hashirsiddiqui176@gmail.com', '03322376230', '$2y$10$ySVhNI.lK4SWPaaYaaKJB.h9ZcuUxd126DDlu/id0axPVgAfejgMq', 'client', NULL, NULL, NULL, NULL, '2026-07-04 15:43:43'),
(38, 'Manha Fatima', 'manhalearning2712@gmail.com', '03363547047', '$2y$10$Jw5vT6qLhu79jHYiysJX1uUrL8mxZwF6TWD4Dpi3Ge38inovcd0nS', 'stylist', NULL, NULL, NULL, NULL, '2026-07-04 15:49:26'),
(39, 'mariaabdali', 'mariaabdali1978@gmail.com', '09876543215', '$2y$10$GRdKlMNq6.7TPjOOK.l46OrEEUq/ut3QTFkmUUTYj5BE65dMUt1ie', 'client', NULL, NULL, NULL, NULL, '2026-07-05 15:47:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salon_settings`
--
ALTER TABLE `salon_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stylists`
--
ALTER TABLE `stylists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salon_settings`
--
ALTER TABLE `salon_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stylists`
--
ALTER TABLE `stylists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
