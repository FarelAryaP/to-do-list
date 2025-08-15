-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2025 at 01:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todo_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `status` enum('pending','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `deadline`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'testt', '123', '2025-08-09', 'high', 'completed', '2025-08-08 02:15:45', '2025-08-08 02:19:32'),
(2, 1, 'tugas', 'aaa', '2025-08-09', 'high', 'completed', '2025-08-08 02:23:28', '2025-08-08 02:36:11'),
(3, 1, 'derris', '', '2025-08-11', 'medium', 'pending', '2025-08-08 02:27:54', '2025-08-08 02:27:54'),
(4, 1, 'grid 4', 'dddd', '2025-08-12', 'low', 'pending', '2025-08-08 02:28:18', '2025-08-08 02:28:18'),
(5, 1, 'test alert', '123', '2025-08-13', 'medium', 'pending', '2025-08-08 02:28:52', '2025-08-08 02:28:52'),
(6, 1, 'cek', '', '2025-08-08', 'medium', 'pending', '2025-08-08 02:29:31', '2025-08-08 02:29:31'),
(8, 4, 'Tugas to do list', 'app to do list sederhana dengan crud task dan login register user', '2025-08-15', 'high', 'pending', '2025-08-15 08:41:24', '2025-08-15 08:41:24'),
(9, 4, 'Tugas B Jerman', 'Membuat video dialog dengan teman sebangku', '2025-08-15', 'medium', 'completed', '2025-08-15 08:43:51', '2025-08-15 09:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$QZRAK1.N2EA8K5oyB9tc0OlpwpfZnyD9ZF1/NVdCJdvJnwFU.Fs8y', '2025-08-08 02:15:11'),
(2, 'admin2', 'admin2@gmail.com', '$2y$10$gVnz0H.cZ73vp43uFTJrY.ms3DCNkddFbf.wDnfuGV1a7vflqW5YS', '2025-08-08 02:34:30'),
(3, 'sinta', 'sinta@gmail.com', '$2y$10$PDIcIKTF6ZyXWR9E9grBCOwbZreD8Lg8xbtGWFdgnJuJ1v8uWD/X.', '2025-08-08 02:37:26'),
(4, 'farel', 'farel@gmail.com', '$2y$10$nvlU03I7WmhXx.2/9tKdMOOhMusC8ZkTSLahfERo2uyUMW4uYV1sm', '2025-08-15 08:03:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
