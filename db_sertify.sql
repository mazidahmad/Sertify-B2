-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 13, 2019 at 07:49 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sertify`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `public_key` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`id`, `name`, `email`, `password`, `category`, `public_key`, `created_at`) VALUES
(1, 'Politeknik Negeri Bandung', 'polban@polban.ac.id', '123polban', 'Pendidikan', '', '2018-12-16 07:17:49'),
(2, 'TELKOM', 'telkom@telkom.com', 'telkom123', 'instansi Pemerintah', '', '2018-12-17 09:33:43'),
(3, 'HIMAKOM', 'himakom@polban.ac.id', 'himakom123', 'HIMPUNAN', '0x64eD1106245A9D161ed8A60f58209BECD04455a5', '2018-12-18 01:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `user_id` int(4) UNSIGNED NOT NULL,
  `number` varchar(20) NOT NULL,
  `file_name` varchar(55) NOT NULL,
  `digital_signature` varchar(53) NOT NULL,
  `agency_id` int(4) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'P',
  `note` varchar(255) DEFAULT NULL,
  `upload_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `number`, `file_name`, `digital_signature`, `agency_id`, `status`, `note`, `upload_at`, `verified_at`) VALUES
(3, 1, '001', '1-20181218090332_certificate.pdf', '', 3, 'P', NULL, '2018-12-18 02:03:32', '0000-00-00 00:00:00'),
(4, 1, '002', '1-20181218090602_certificate.pdf', '1-20181218102302_digsignature.txt', 3, 'S', NULL, '2018-12-18 02:06:02', '2018-12-18 10:23:02'),
(5, 1, '003', '1-20181218090739_certificate.pdf', '', 3, 'P', NULL, '2018-12-18 02:07:39', '0000-00-00 00:00:00'),
(6, 1, '004', '1-20181218090754_certificate.pdf', '', 3, 'P', NULL, '2018-12-18 02:07:54', '0000-00-00 00:00:00'),
(7, 1, '005', '1-20181218090811_certificate.pdf', '', 3, 'P', NULL, '2018-12-18 02:08:11', '0000-00-00 00:00:00'),
(8, 1, '002/200/900/21209', '1-20181218110316_certificate.pdf', '1-20181218110653_digsignature.txt', 3, 'S', NULL, '2018-12-18 04:03:16', '2018-12-18 11:06:53'),
(9, 1, '001/122/121/1414', '1-20181218113904_certificate.pdf', '', 1, 'P', NULL, '2018-12-18 04:39:04', '0000-00-00 00:00:00'),
(10, 1, '122/1414/1412/1212', '1-20181218113947_certificate.pdf', '', 1, 'P', NULL, '2018-12-18 04:39:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(4) UNSIGNED NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `created_at`) VALUES
(1, 'rahmadicenatar@gmail.com', 'Cenatar123', 'Rahmadi', '2018-12-16 09:18:35'),
(2, 'kiki.tif17@polban.ac.id', 'pratiwi123', 'Kiki Pratiwi', '2018-12-17 09:23:28'),
(3, 'mazid.ahmad.tif17@polban.ac.id', 'mazid123', 'Mazid Ahmad', '2018-12-17 09:24:27'),
(4, 'naufal.tif17@polban.ac.i', 'naufal123', 'Naufal Ferdy', '2018-12-17 09:24:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificate_number` (`number`) USING BTREE,
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

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
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`),
  ADD CONSTRAINT `certificates_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
