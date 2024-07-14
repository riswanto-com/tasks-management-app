-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 06:52 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_12_055236_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KyYkyOt1YDGPe2KXxw1DnQE476jglFaqTYqJ8aLL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ1Iwekx0V3R6dThDOWlDVUpPRlp3bkZMbkI3ZHJ4OHRWODlHRkFiSSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvdGFza3M/ZHVlX2RhdGU9JnN0YXR1cz1wZW5kaW5nJnRpdGxlPSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1720975509),
('Lgy71cAo66zeabvsATDEbStPAc79k56McMP2nsAY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMEVsczExUWN4d1N4bTdPNzZLdXZyUFY2QngyT3YxTUh3Nms3RjAyOSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1OToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL3Rhc2tzP2R1ZV9kYXRlPSZzdGF0dXM9cGVuZGluZyZ0aXRsZT0iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1OToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL3Rhc2tzP2R1ZV9kYXRlPSZzdGF0dXM9cGVuZGluZyZ0aXRsZT0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1720973673),
('tRNmAaJi4cIrD6rGa5gBZEuVjPWy5WtGiSQtWizd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWE3TFdzc295YXhFNTVZSUpOVU1FV2FwMTNQa09VQVkzNWRpWEhFbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1720973676);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','in-progress','completed') NOT NULL,
  `due_date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `create_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `due_date`, `user_id`, `create_id`, `created_at`, `updated_at`) VALUES
(2, 'jiwa', 'wwwww', 'in-progress', '2024-07-19', 2, 1, '2024-07-12 15:53:37', '2024-07-13 17:43:32'),
(5, 'ddf', 'fff', 'pending', '2024-07-18', 1, 1, '2024-07-12 19:37:24', '2024-07-12 19:37:24'),
(6, 'eeee', 'eeee', 'pending', '2024-07-25', 1, 1, '2024-07-12 19:39:43', '2024-07-12 19:39:43'),
(7, 'hggg', 'gggg', 'pending', '2024-07-27', 1, 1, '2024-07-12 20:27:20', '2024-07-12 20:27:20'),
(8, 'hhh', 'hhh', 'pending', '2024-07-25', 1, 1, '2024-07-12 20:27:48', '2024-07-12 20:27:48'),
(10, 'sjsjsj', 'wwwww', 'completed', '2024-07-19', 1, 1, '2024-07-13 13:37:03', '2024-07-13 13:37:03'),
(11, 'task kedua', 'hore', 'pending', '2024-07-18', 2, 1, '2024-07-14 08:56:27', '2024-07-14 08:56:27'),
(12, 'jiwa', 'wwwww', 'in-progress', '2024-07-19', 2, 1, '2024-07-12 15:53:37', '2024-07-13 17:43:32'),
(13, 'ddf', 'fff', 'pending', '2024-07-18', 1, 1, '2024-07-12 19:37:24', '2024-07-12 19:37:24'),
(14, 'eeee', 'eeee', 'pending', '2024-07-25', 1, 1, '2024-07-12 19:39:43', '2024-07-12 19:39:43'),
(15, 'hggg', 'gggg', 'pending', '2024-07-27', 1, 1, '2024-07-12 20:27:20', '2024-07-12 20:27:20'),
(16, 'hhh', 'hhh', 'pending', '2024-07-25', 1, 1, '2024-07-12 20:27:48', '2024-07-12 20:27:48'),
(17, 'sjsjsj', 'wwwww', 'completed', '2024-07-19', 1, 1, '2024-07-13 13:37:03', '2024-07-13 13:37:03'),
(18, 'task kedua', 'hore', 'pending', '2024-07-18', 2, 1, '2024-07-14 08:56:27', '2024-07-14 08:56:27'),
(19, 'jiwa', 'wwwww', 'in-progress', '2024-07-19', 2, 1, '2024-07-12 15:53:37', '2024-07-13 17:43:32'),
(20, 'ddf', 'fff', 'pending', '2024-07-18', 1, 1, '2024-07-12 19:37:24', '2024-07-12 19:37:24'),
(21, 'eeee', 'eeee', 'pending', '2024-07-25', 1, 1, '2024-07-12 19:39:43', '2024-07-12 19:39:43'),
(22, 'hggg', 'gggg', 'pending', '2024-07-27', 1, 1, '2024-07-12 20:27:20', '2024-07-12 20:27:20'),
(23, 'hhh', 'hhh', 'pending', '2024-07-25', 1, 1, '2024-07-12 20:27:48', '2024-07-12 20:27:48'),
(24, 'sjsjsj', 'wwwww', 'completed', '2024-07-19', 1, 1, '2024-07-13 13:37:03', '2024-07-13 13:37:03'),
(25, 'task kedua', 'hore', 'pending', '2024-07-18', 2, 1, '2024-07-14 08:56:27', '2024-07-14 08:56:27'),
(26, 'jiwa', 'wwwww', 'in-progress', '2024-07-19', 2, 1, '2024-07-12 15:53:37', '2024-07-13 17:43:32'),
(27, 'ddf', 'fff', 'pending', '2024-07-18', 1, 1, '2024-07-12 19:37:24', '2024-07-12 19:37:24'),
(28, 'eeee', 'eeee', 'pending', '2024-07-25', 1, 1, '2024-07-12 19:39:43', '2024-07-12 19:39:43'),
(29, 'hggg', 'gggg', 'pending', '2024-07-27', 1, 1, '2024-07-12 20:27:20', '2024-07-12 20:27:20'),
(30, 'hhh', 'hhh', 'pending', '2024-07-25', 1, 1, '2024-07-12 20:27:48', '2024-07-12 20:27:48'),
(31, 'sjsjsj', 'wwwww', 'completed', '2024-07-19', 1, 1, '2024-07-13 13:37:03', '2024-07-13 13:37:03'),
(32, 'task kedua', 'hore', 'pending', '2024-07-18', 2, 1, '2024-07-14 08:56:27', '2024-07-14 08:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'wawan', 'wawan@gmail.com', NULL, '$2y$12$yjukK2M.haU1Nr20vdwPO./vrKU50fLnNyFyzYkPnzK5izPF/llW2', NULL, '2024-07-12 10:24:27', '2024-07-12 10:24:27'),
(2, 'Fanny', 'fanny@gmail.com', NULL, '$2y$12$JJb/2LNs5v8Fqnk/0t2so.6yqGBOgs16I7jMVeRdOfpUbR4nyBaWS', NULL, '2024-07-13 14:06:36', '2024-07-13 14:06:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
