-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2025 at 02:31 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webruang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `code`, `name`, `faculty_id`, `created_at`, `updated_at`) VALUES
(1, 'G41', 'Gedung W', 1, '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(2, 'G20', 'Gedung R', 1, '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(3, 'G89', 'Gedung G', 1, '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(4, 'G96', 'Gedung E', 1, '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(5, 'G50', 'Gedung J', 1, '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(6, 'ged-a', 'Gedung A', 2, '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(7, 'ged-gsg', 'Gedung GSG', 1, '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(8, 'ged-ict', 'Gedung ICT', 1, '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(9, 'ged-b', 'Gedung B', 3, '2025-11-29 12:03:24', '2025-11-29 12:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'FTIK', 'Fakultas Teknik dan Ilmu Komputer', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(2, 'FEB', 'Fakultas Ekonomi Bisnis', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(3, 'FSIP', 'Fakultas Sastra dan Ilmu Pendidikan', '2025-11-29 12:03:24', '2025-11-29 12:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_21_021606_room', 1),
(6, '2022_05_21_022039_create_rooms_table', 1),
(7, '2022_05_21_022436_create_faculties_table', 1),
(8, '2022_05_21_022459_create_buildings_table', 1),
(9, '2022_05_21_031209_create_rents_table', 1),
(10, '2022_05_21_075939_create_admins_table', 1),
(11, '2022_05_21_082546_create_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rents`
--

CREATE TABLE `rents` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `date_use` date NOT NULL,
  `time_start_use` time NOT NULL,
  `time_end_use` time NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_start` datetime NOT NULL,
  `transaction_end` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rents`
--

INSERT INTO `rents` (`id`, `room_id`, `user_id`, `date_use`, `time_start_use`, `time_end_use`, `purpose`, `transaction_start`, `transaction_end`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-12-04', '21:00:00', '22:00:00', 'tugass', '2025-12-04 20:52:58', NULL, 'dipinjam', '2025-12-04 13:52:59', '2025-12-04 13:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(2, 'mahasiswa', '2025-11-29 12:03:23', '2025-11-29 12:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` int NOT NULL,
  `building_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `capacity` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `code`, `name`, `img`, `floor`, `building_id`, `status`, `capacity`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Lab 1 GSG', 'Lab 1 GSG', 'assets/images/ruang/Lab2A.jpeg', 2, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(2, 'Lab 2 GSG', 'Lab 2 GSG', 'assets/images/ruang/LabICT.jpeg', 2, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(3, 'Lab 3 GSG', 'Lab 3 GSG', 'assets/images/ruang/LabDigital.jpeg', 3, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(4, 'Lab 4 GSG', 'Lab 4 GSG', 'assets/images/ruang/LabICT.jpeg', 3, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(5, 'Lab 1 A', 'Lab 1 A', 'assets/images/ruang/Lab2A.jpeg', 3, 1, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(6, 'Lab Bisnis Digital', 'Lab Bisnis Digital', 'assets/images/ruang/LabDigital.jpeg', 3, 1, 0, 40, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(7, 'Lab 2 A', 'Lab 2 A', 'assets/images/ruang/Lab2A.jpeg', 3, 1, 0, 40, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(8, 'Lab Bahasa', 'Lab Bahasa', 'assets/images/ruang/Lab2A.jpeg', 2, 1, 0, 40, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(9, 'Aula A', 'Aula A', 'assets/images/ruang/Lab2A.jpeg', 4, 1, 0, 100, 'Aula', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(10, '401 A', '401 A', 'assets/images/ruang/LabDigital.jpeg', 4, 1, 0, 80, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(11, '402 A', '402 A', 'assets/images/ruang/LabDigital.jpeg', 4, 1, 0, 80, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(12, '209', '209', 'assets/images/ruang/Lab2A.jpeg', 2, 1, 0, 45, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(13, '201 B', '201 B', 'assets/images/ruang/201b.jpeg', 2, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(14, '202 B', '202 B', 'assets/images/ruang/202b.jpeg', 2, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(15, '203 B', '203 B', 'assets/images/ruang/201b.jpeg', 2, 4, 0, 40, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(16, '204 B', '204 B', 'assets/images/ruang/203b.jpeg', 2, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(17, '301 B', '301 B', 'assets/images/ruang/301b.jpeg', 3, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(18, '302 B', '302 B', 'assets/images/ruang/201b.jpeg', 3, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(19, '303 B', '303 B', 'assets/images/ruang/202b.jpeg', 3, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(20, '304 B', '304 B', 'assets/images/ruang/203b.jpeg', 3, 4, 0, 40, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(21, 'Lab Software', 'Lab Software', 'assets/images/ruang/LabICT.jpeg', 2, 3, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(22, 'Lab Gambar', 'Lab Gambar', 'assets/images/ruang/LabGambar.jpeg', 1, 3, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24'),
(23, '301 ICT B', '301 ICT B', 'assets/images/ruang/301ICT.jpeg', 3, 3, 0, 100, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2025-11-29 12:03:24', '2025-11-29 12:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$EHINAFr0ZNzKsiz41LSdQ.32eTKZuya8Yq.toWCoyYq.YcoLhP3py', 1, NULL, '2025-11-29 12:03:23', '2025-11-29 12:03:23'),
(2, 'Mahasiswa', 'mahasiswa@gmail.com', NULL, '$2y$10$I.M/lYiDTplMdbBXk72kY.KrXnoIxL3j0eYyHGUIQ0FZ1NAqOXFam', 2, NULL, '2025-11-29 12:03:24', '2025-11-29 12:03:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildings_code_unique` (`code`),
  ADD UNIQUE KEY `buildings_name_unique` (`name`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculties_code_unique` (`code`),
  ADD UNIQUE KEY `faculties_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rents`
--
ALTER TABLE `rents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rooms_code_unique` (`code`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rents`
--
ALTER TABLE `rents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
