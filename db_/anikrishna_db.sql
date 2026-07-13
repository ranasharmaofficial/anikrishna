-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2026 at 11:06 PM
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
-- Database: `anikrishna_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admit_cards`
--

CREATE TABLE `admit_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester` varchar(255) NOT NULL,
  `session` varchar(255) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `subcourse_id` bigint(20) UNSIGNED NOT NULL,
  `exam_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admit_card_subjects`
--

CREATE TABLE `admit_card_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admit_card_id` bigint(20) UNSIGNED NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliations`
--

CREATE TABLE `affiliations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affiliations`
--

INSERT INTO `affiliations` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NSDC', 'uploads/staff/staff-20250316191646-2028.webp', 1, '2025-03-16 13:34:04', '2025-03-16 13:46:47'),
(2, 'Educational Management System', 'uploads/staff/staff-20250404163440-6779.webp', 1, '2025-04-04 11:04:40', '2025-04-04 11:04:40'),
(3, 'Continuing Professional Development (CPD)', 'uploads/staff/staff-20250712110107-6670.webp', 1, '2025-07-12 05:31:07', '2025-07-12 05:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `associates`
--

CREATE TABLE `associates` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `associates`
--

INSERT INTO `associates` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Maxable Global', 'uploads/staff/staff-20250405111318-3466.webp', 1, '2025-04-05 05:43:18', '2025-04-05 05:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `status` enum('on_time','late') DEFAULT NULL,
  `checkin_photo` varchar(255) DEFAULT NULL,
  `checkout_photo` varchar(200) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `checkout_address` varchar(200) DEFAULT NULL,
  `working_minutes` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Active,2-Pending,3-Delete,4-Removed',
  `date` varchar(55) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `district_id`, `name`, `status`, `date`, `created_at`, `updated_at`) VALUES
(1, 96, 'Lands', 1, NULL, '2026-03-17 23:37:37', '2026-06-09 17:59:29'),
(2, 96, 'K NAGAR', 1, NULL, '2026-03-18 01:29:04', '2026-03-18 01:29:04'),
(3, 96, 'Purnia East', 1, NULL, '2026-03-20 01:10:33', '2026-06-09 16:17:31'),
(4, 96, 'Banmankhi', 1, NULL, '2026-03-20 01:11:07', '2026-06-09 16:17:43'),
(5, 96, 'Kasba', 1, NULL, '2026-03-20 01:11:29', '2026-06-09 16:17:54'),
(6, 96, 'Amour', 1, NULL, '2026-03-20 01:11:51', '2026-06-09 16:18:04'),
(7, 96, 'Baisaa', 1, NULL, '2026-03-20 01:12:12', '2026-06-09 16:18:28'),
(8, 96, 'Baisi', 1, NULL, '2026-03-20 01:12:35', '2026-06-09 16:18:43'),
(9, 96, 'Dhamdha', 1, NULL, '2026-03-20 01:12:54', '2026-06-09 16:18:55'),
(10, 96, 'Rupauli', 1, NULL, '2026-03-20 01:13:13', '2026-06-09 16:19:08'),
(11, 96, 'Bhavanipur', 1, NULL, '2026-03-20 01:14:02', '2026-06-09 16:16:34'),
(12, 96, 'Barhara Kothi', 1, NULL, '2026-03-20 01:14:32', '2026-06-09 16:16:55'),
(13, 96, 'Dagarua', 1, NULL, '2026-03-20 01:14:54', '2026-06-09 16:17:06'),
(14, 96, 'Jalalgarh', 1, NULL, '2026-03-20 01:15:18', '2026-06-09 16:17:16'),
(15, 70, 'Test', 1, NULL, '2026-06-09 16:19:38', '2026-06-09 16:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `english_title` text DEFAULT NULL,
  `description` text NOT NULL,
  `blog_image` varchar(255) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '[]',
  `country` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `total_like` int(11) NOT NULL DEFAULT 0,
  `total_comment` int(11) NOT NULL DEFAULT 0,
  `total_view` int(11) NOT NULL DEFAULT 0,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `type`, `category_id`, `title`, `english_title`, `description`, `blog_image`, `tags`, `country`, `city`, `slug`, `total_like`, `total_comment`, `total_view`, `meta_tag`, `meta_title`, `meta_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'blog', 1, 'India\'s Soil Organic Carbon Content Fell From 1% To 0.3% In 70 Years', NULL, '<p>Soil Organic Carbon is the main component of the soil organic matter and gives soil its water-retention capacity, structure, and fertility, he told reporters in Nagpur, Maharashtra, on Friday evening.</p>\r\n\r\n<p>The misuse and abuse of synthetic fertilizers is responsible for many of the health problems that humans experience today. It has also contributed to a large extent to the deterioration of the environment hence farmers find it safe and efficient for using organic liquid fertilizers.</p>\r\n\r\n<p>&quot;Intensive cultivation of crops without providing proper compost to the soil is the reason</p>\r\n\r\n<p>behind the fall in SOC content,&quot; he said, adding that farmers should reduce their overdependence</p>\r\n\r\n<p>Naturally occurring vegetation and waste will always be available as it renews itself. Besides, plants can be reused to make fertilizer for the next batch once harvesting is done. Since organic farming takes care of the environment, it is safe to say that vegetation is safe for the long run.</p>\r\n\r\n<p>&quot;</p>', 'uploads/blog/blog-20240722085623-9476.webp', '[\"India\'s Soil Organic Carbon Content Fell From 1% To 0.3% In 70 Years\"]', NULL, 'Patna', 'indias-soil-organic-carbon-content-fell-from-1-to-03-in-70-years', 0, 0, 64, 'India\'s Soil Organic Carbon Content Fell From 1% To 0.3% In 70 Years', 'India\'s Soil Organic Carbon Content Fell From 1% To 0.3% In 70 Years', 'India\'s Soil Organic Carbon Content Fell From 1% To 0.3% In 70 Years', 1, 1, NULL, '2024-07-22 03:26:23', '2024-10-01 00:46:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_likes`
--

CREATE TABLE `blog_likes` (
  `id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_views`
--

CREATE TABLE `blog_views` (
  `id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blog_views`
--

INSERT INTO `blog_views` (`id`, `blog_id`, `ip_address`, `date`) VALUES
(1, 3, '::1', '2024-06-25'),
(2, 4, '::1', '2024-07-22'),
(3, 4, '152.58.135.158', '2024-07-22'),
(4, 4, '152.59.135.0', '2024-07-23'),
(5, 4, '43.224.3.239', '2024-07-23'),
(6, 4, '183.207.48.136', '2024-07-24'),
(7, 4, '40.77.167.77', '2024-07-24'),
(8, 4, '54.36.148.73', '2024-07-26'),
(9, 4, '85.237.194.165', '2024-07-26'),
(10, 4, '52.167.144.212', '2024-07-26'),
(11, 4, '47.128.52.233', '2024-07-26'),
(12, 4, '52.167.144.221', '2024-07-27'),
(13, 4, '52.167.144.24', '2024-07-27'),
(14, 4, '85.208.96.198', '2024-07-28'),
(15, 4, '52.167.144.200', '2024-07-28'),
(16, 4, '52.167.144.218', '2024-07-28'),
(17, 4, '14.224.172.200', '2024-07-29'),
(18, 4, '14.241.234.213', '2024-07-31'),
(19, 4, '47.128.56.200', '2024-08-01'),
(20, 4, '157.230.20.221', '2024-08-03'),
(21, 4, '47.128.97.141', '2024-08-04'),
(22, 4, '40.77.167.47', '2024-08-05'),
(23, 4, '54.36.148.25', '2024-08-06'),
(24, 4, '52.167.144.24', '2024-08-09'),
(25, 4, '47.128.54.41', '2024-08-09'),
(26, 4, '67.7.32.97', '2024-08-10'),
(27, 4, '35.195.187.31', '2024-08-10'),
(28, 4, '85.208.96.201', '2024-08-10'),
(29, 4, '175.8.220.229', '2024-08-12'),
(30, 4, '47.128.125.130', '2024-08-13'),
(31, 4, '54.36.149.57', '2024-08-16'),
(32, 4, '52.167.144.219', '2024-08-16'),
(33, 4, '47.128.111.77', '2024-08-18'),
(34, 4, '178.212.51.134', '2024-08-18'),
(35, 4, '203.80.166.210', '2024-08-21'),
(36, 4, '216.244.66.233', '2024-08-22'),
(37, 4, '66.249.79.69', '2024-08-23'),
(38, 4, '185.191.171.12', '2024-08-23'),
(39, 4, '47.128.53.91', '2024-08-23'),
(40, 4, '54.36.148.94', '2024-08-27'),
(41, 4, '47.128.22.160', '2024-08-29'),
(42, 4, '122.252.227.98', '2024-08-30'),
(43, 4, '177.93.45.216', '2024-08-30'),
(44, 4, '193.186.4.136', '2024-09-01'),
(45, 4, '118.179.158.142', '2024-09-05'),
(46, 4, '54.36.149.5', '2024-09-06'),
(47, 4, '51.222.253.13', '2024-09-06'),
(48, 4, '144.76.75.55', '2024-09-06'),
(49, 4, '114.5.99.66', '2024-09-08'),
(50, 4, '85.208.96.203', '2024-09-08'),
(51, 4, '51.222.253.1', '2024-09-13'),
(52, 4, '54.36.148.132', '2024-09-14'),
(53, 4, '47.128.26.29', '2024-09-17'),
(54, 4, '103.151.155.18', '2024-09-19'),
(55, 4, '47.128.48.122', '2024-09-20'),
(56, 4, '54.36.148.108', '2024-09-21'),
(57, 4, '103.92.225.252', '2024-09-21'),
(58, 4, '51.222.253.15', '2024-09-23'),
(59, 4, '165.227.42.189', '2024-09-24'),
(60, 4, '165.227.39.219', '2024-09-24'),
(61, 4, '49.13.72.134', '2024-09-26'),
(62, 4, '40.77.167.48', '2024-09-27'),
(63, 4, '54.36.148.207', '2024-09-28'),
(64, 4, '185.191.171.9', '2024-10-01'),
(65, 4, '54.36.148.116', '2024-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PURNIA', 'V2F-PUR-25001', 1, '2025-12-11 13:41:38', '2025-12-11 13:41:38'),
(2, 'KATIHAR', 'V2F-KAT-25002', 1, '2025-12-11 13:41:50', '2025-12-11 13:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `branch_products`
--

CREATE TABLE `branch_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `category` int(11) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `price_45` decimal(12,2) DEFAULT NULL,
  `price_50` decimal(12,2) DEFAULT NULL,
  `price_62` decimal(12,2) DEFAULT NULL,
  `price_80` decimal(12,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `transfer_date` date DEFAULT NULL,
  `transferred_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_products`
--

INSERT INTO `branch_products` (`id`, `branch_id`, `category`, `product_id`, `price`, `offer_price`, `price_45`, `price_50`, `price_62`, `price_80`, `stock`, `transfer_date`, `transferred_by`, `created_at`, `updated_at`) VALUES
(11, 1, 20, 65, 7.00, 87.00, 11745.00, 12150.00, 13122.00, 14580.00, -3, '2026-02-23', 1, '2026-02-23 19:56:59', '2026-05-25 16:31:36'),
(12, 1, 20, 66, NULL, NULL, 51040.00, 52800.00, 57024.00, 63360.00, -2, '2026-03-08', 1, '2026-03-08 10:35:28', '2026-05-25 16:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `branch_wallets`
--

CREATE TABLE `branch_wallets` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `current_balance` float DEFAULT NULL,
  `added_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_wallets`
--

INSERT INTO `branch_wallets` (`id`, `company_id`, `branch_id`, `type`, `current_balance`, `added_date`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'credit', 1000, '2025-12-11', 'Fund transfer from Master Fund', '2025-12-11 12:40:22', '2025-12-11 12:40:22'),
(2, 1, 1, 'credit', 1000, '2025-12-11', 'Fund transfer from Master Fund', '2025-12-11 12:40:31', '2025-12-11 12:40:31'),
(3, 1, 1, 'credit', 1000, '2025-12-11', 'Fund transfer from Master Fund', '2025-12-11 12:40:58', '2025-12-11 12:40:58'),
(4, 1, 1, 'credit', 1000, '2025-12-12', 'Fund transfer from Master Fund', '2025-12-11 12:42:59', '2025-12-11 12:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `logo`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Godrej', 'Godrej', 'uploads/brand/1765464832729.Godrej_Logo.svg.png', 1, NULL, '2025-07-15 05:51:44', '2025-12-11 14:53:52'),
(2, 'Samsung', 'Samsung', 'uploads/brand/1765464719887.Samsung-emblem.png', 1, NULL, '2025-07-15 05:52:03', '2025-12-11 14:51:59'),
(3, 'LG', 'LG', 'uploads/brand/1765464642416.LG-Logo.webp', 1, NULL, '2025-07-16 02:52:23', '2025-12-11 14:50:42'),
(4, 'Bajaj', 'Bajaj', 'uploads/brand/1765464552491.bab.png', 1, NULL, '2025-12-10 12:42:08', '2025-12-11 14:49:12'),
(5, 'VOLTAS', 'voltas', 'uploads/brand/1765464898361.VOLTAS.jpg', 1, NULL, '2025-12-11 14:54:58', '2025-12-11 14:54:58'),
(6, 'LIVFAST', 'livfast', 'uploads/brand/1765464962544.LIVFAST.jpg', 1, NULL, '2025-12-11 14:56:02', '2025-12-11 14:56:02'),
(7, 'Other', 'other', NULL, 1, NULL, '2025-12-11 14:58:25', '2025-12-11 14:58:25'),
(8, 'ALOKA', 'aloka', NULL, 1, NULL, '2026-02-23 16:32:10', '2026-02-23 16:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `field_name` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `field_name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'social_media', 'facebook', 'https://www.facebook.com/', 1, '2023-04-26 03:51:10', '2025-12-03 12:38:07'),
(2, 'social_media', 'twitter', 'https://twitter.com/', 1, '2023-04-26 03:51:10', '2025-12-03 12:38:07'),
(3, 'social_media', 'linkedin', 'https://www.linkedin.com/company/', 1, '2023-04-26 03:51:10', '2025-12-03 12:38:07'),
(4, 'social_media', 'skype', 'ficox', 1, '2023-04-26 03:51:10', '2024-04-25 05:27:41'),
(5, 'social_media', 'instagram', 'https://www.instagram.com/', 1, '2023-04-26 03:51:32', '2025-12-03 12:38:07'),
(6, 'header_setup', 'customer_support_number', '0124 428 6901', 1, '2023-04-26 06:07:49', '2023-08-07 06:37:26'),
(7, 'header_setup', 'sales_number', '+91-9876543210', 1, '2023-04-26 06:07:49', '2023-07-07 01:21:29'),
(9, 'header_setup', 'header_logo', 'uploads/logo/logo-20260609183835-1425.webp', 1, '2023-04-26 06:14:53', '2026-06-09 13:08:35'),
(10, 'footer_setup', 'footer_description', 'We don’t just sell items — we support families. V2FBaazar is approachable, reliable, and always ready to help you with your needs.', 1, '2023-04-27 00:16:16', '2025-12-03 12:32:02'),
(11, 'footer_setup', 'copyright_widget', '© 2025 V2F BAAZAR All Rights Reserved.', 1, '2023-04-27 00:16:17', '2025-12-03 12:32:02'),
(12, 'footer_setup', 'contact_address', 'N.H. 31, Kaptanpara, Below Jio Office Ground Floor, Khuskibagh Purnia - 854305', 1, '2023-04-27 00:41:17', '2025-12-03 12:34:52'),
(13, 'footer_setup', 'contact_phone', '+91 9471052961', 1, '2023-04-27 00:41:17', '2025-12-03 12:34:52'),
(14, 'footer_setup', 'contact_email', 'info@v2fbaazar.com', 1, '2023-04-27 00:41:17', '2025-12-03 12:34:52'),
(15, 'footer_setup', 'contact_working_hr', 'Monday To Saturday: 09.30am To 18.30pm<br>\r\nSunday : Closed', 1, '2023-04-27 00:41:17', '2023-08-01 00:14:01'),
(17, 'footer_setup', 'footer_logo', 'uploads/logo/logo-20251203180202-2767.webp', 1, '2023-04-27 00:44:32', '2025-12-03 12:32:02'),
(31, 'footer_widget_one_lable', 'widget_one_name', 'ABOUT BUSSINESS ONLINE SERVICE', 1, '2023-04-27 06:26:23', '2023-07-07 02:34:56'),
(32, 'footer_widget_one_links', '[\"Booking\",\"Lable 2\"]', '[\"link 1\",\"Link 2\"]', 1, '2023-04-27 06:26:23', '2023-08-01 05:20:02'),
(33, 'footer_widget_two_lable', 'widget_two_name', 'Quick Links', 1, '2023-04-27 06:56:34', '2023-04-27 06:56:34'),
(34, 'footer_widget_two_links', '[\"test lable\"]', '[\"test link\"]', 1, '2023-04-27 06:56:34', '2023-04-27 06:58:11'),
(35, 'footer_widget_three_lable', 'widget_three_name', 'NAVIGATION', 1, '2023-04-27 06:57:25', '2023-07-05 06:27:20'),
(36, 'footer_widget_three_links', '[\"About Us\",\"Blog\",\"Contact Us\",\"Gallery\",\"News\",\"Testimonial\"]', '[\"#\",\"#\",\"#\",\"#\",\"#\",\"#\"]', 1, '2023-04-27 06:57:25', '2023-07-07 01:24:21'),
(37, 'corporate_office_contact', '[\"office1@gmail.com1\",\"office2@gmail.com2\",\"gdfgd\"]', '[\"98765432101\",\"98765432112\",\"gfdgdf\"]', 1, '2023-05-23 06:16:45', '2023-05-23 06:41:45'),
(38, 'corporate_office_address', '[\"Milap Nager, Uttam Nager, 1100591\",\"Milap Nager, Uttam Nager, 1100601\",\"fdgdfg\"]', '[\"Monday\",\"regre1\",\"gdfgdfgd\"]', 1, '2023-05-23 06:18:06', '2023-05-23 06:41:45'),
(39, 'global_office_contact', '[\"testglobal@gmail.com\"]', '[\"7896541230\"]', 1, '2023-05-23 06:47:41', '2023-05-23 06:47:41'),
(40, 'global_office_address', '[\"test address\"]', '[\"test timing\"]', 1, '2023-05-23 06:47:41', '2023-05-23 06:47:41'),
(41, 'footer_setup', 'corporate_address', 'Ward No-27, Gami Tola, Katihar, Bihar - 854105', 1, '2023-04-27 00:41:17', '2024-05-05 02:21:31'),
(42, 'footer_setup', 'leads_uk_address', NULL, 1, '2023-04-27 00:41:17', '2023-08-05 01:22:14'),
(43, 'footer_setup', 'registered_address', 'Ward No-27, Gami Tola, Katihar, Bihar - 854105', 1, '2023-04-27 00:41:17', '2024-05-05 02:21:31'),
(44, 'footer_setup', 'registered_address_phone', '+91-9470 0061 69', 1, '2023-04-27 00:41:17', '2024-04-25 05:29:23'),
(45, 'footer_setup', 'leads_uk_address_phone', NULL, 1, '2023-04-27 00:41:17', '2023-08-05 01:22:14'),
(46, 'footer_setup', 'corporate_address_phone', '+91 9471052961', 1, '2023-04-27 00:41:17', '2025-12-03 12:34:52'),
(47, 'footer_setup', 'registered_address_email', 'Ficox.ee@proton.me', 1, '2023-04-27 00:41:17', '2024-05-05 02:21:31'),
(48, 'footer_setup', 'corporate_address_email', 'info@v2fbaazar.com', 1, '2023-04-27 00:41:17', '2025-12-03 12:34:52'),
(49, 'footer_setup', 'skype', 'Ficox', 1, '2023-04-27 00:41:17', '2024-05-05 02:21:31'),
(50, 'footer_setup', 'telegram', 'Ficox.ee@proton.me', 1, '2023-04-27 00:41:17', '2024-05-05 02:21:31'),
(51, 'footer_setup', 'whatsapp', '919155818830', 1, '2023-04-27 00:41:17', '2025-12-03 12:34:52'),
(52, 'header_setup', 'header_phone', '+91 9471052961', 1, '2023-08-09 03:06:15', '2025-12-03 12:28:15'),
(53, 'header_setup', 'header_email', 'info@v2fbaazar.com', 1, '2023-08-09 03:06:15', '2025-12-03 12:28:15'),
(54, 'header_setup', 'whatsapp', '+91 9155818830', 1, '2023-08-09 03:06:15', '2025-12-03 12:28:15'),
(55, 'header_setup', 'skype', NULL, 1, '2023-08-09 03:06:15', '2023-08-23 08:16:14'),
(56, 'header_setup', 'header_address', 'N.H. 31, Kaptanpara, Below Jio Office Ground Floor, Khuskibagh Purnia - 854305', 1, '2023-08-09 03:06:15', '2025-12-03 12:28:15'),
(57, 'header_setup', 'header_website', '+91 9471052961', 1, '2023-08-09 03:06:15', '2025-12-03 12:28:15'),
(58, 'header_setup', 'header_hr', '+91 9471052961', 1, '2023-08-09 03:06:15', '2025-12-03 12:28:15'),
(59, 'social_media', 'youtube', 'https://www.youtube.com/company/', 1, '2025-12-03 12:38:07', '2025-12-03 12:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `business_solutions`
--

CREATE TABLE `business_solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `banner_img1` varchar(255) DEFAULT NULL,
  `banner_img2` varchar(255) DEFAULT NULL,
  `banner_heading` varchar(255) DEFAULT NULL,
  `banner_description` text DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `advantage` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_stocks`
--

CREATE TABLE `card_stocks` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card_stocks`
--

INSERT INTO `card_stocks` (`id`, `user_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 92, 93, '2026-04-13 16:49:58', '2026-04-13 16:52:26'),
(2, 93, 10, '2026-04-24 03:26:58', '2026-04-24 03:26:58'),
(3, 112, 13, '2026-04-29 22:19:15', '2026-05-10 17:05:02'),
(4, 107, 2, '2026-05-10 17:05:02', '2026-05-10 17:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `card_transactions`
--

CREATE TABLE `card_transactions` (
  `id` bigint(20) NOT NULL,
  `from_user_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `type` enum('issue','transfer','return') DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card_transactions`
--

INSERT INTO `card_transactions` (`id`, `from_user_id`, `to_user_id`, `quantity`, `type`, `note`, `date`, `created_at`, `updated_at`) VALUES
(1, NULL, 92, 50, 'issue', 'Admin issued cards', NULL, '2026-04-13 16:49:58', '2026-04-13 16:49:58'),
(2, NULL, 92, 43, 'issue', 'Admin issued cards', NULL, '2026-04-13 16:52:26', '2026-04-13 16:52:26'),
(3, NULL, 93, 10, 'issue', 'Admin issued cards', NULL, '2026-04-24 03:26:58', '2026-04-24 03:26:58'),
(4, NULL, 112, 15, 'issue', 'Admin issued cards', NULL, '2026-04-29 22:19:15', '2026-04-29 22:19:15'),
(5, 112, 107, 2, 'transfer', 'Card transfer', NULL, '2026-05-10 17:05:02', '2026-05-10 17:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `cash_entries`
--

CREATE TABLE `cash_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `day` varchar(100) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_entries`
--

INSERT INTO `cash_entries` (`id`, `user_id`, `date`, `day`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 113, '2026-05-06', 'Wednesday', 6400.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(3, 113, '2026-05-07', 'Thursday', 6100.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `cash_entry_details`
--

CREATE TABLE `cash_entry_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note_value` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_entry_details`
--

INSERT INTO `cash_entry_details` (`id`, `cash_entry_id`, `note_value`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 500, 6, 3000.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(2, 1, 200, 10, 2000.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(3, 1, 100, 10, 1000.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(4, 1, 50, 2, 100.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(5, 1, 20, 5, 100.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(6, 1, 10, 10, 100.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(7, 1, 5, 20, 100.00, '2026-05-06 02:31:25', '2026-05-06 02:31:25'),
(8, 3, 500, 2, 1000.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09'),
(9, 3, 200, 10, 2000.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09'),
(10, 3, 100, 20, 2000.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09'),
(11, 3, 50, 8, 400.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09'),
(12, 3, 20, 5, 100.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09'),
(13, 3, 10, 10, 100.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09'),
(14, 3, 5, 100, 500.00, '2026-05-07 13:10:09', '2026-05-07 13:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `type`, `parent_id`, `title`, `icon`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'blog', 0, 'Common', NULL, 'common', 1, 1, 1, '2024-06-24 00:44:12', '2024-07-22 08:43:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `title_green` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `parent_id`, `title`, `title_green`, `page_url`, `meta_tag`, `meta_title`, `meta_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 0, 'Home', NULL, 'index', 'Home', 'Home', 'Home', 1, 1, NULL, '2026-07-06 13:53:24', '2026-07-06 13:53:24'),
(2, 0, 'About Us', NULL, 'about', 'About Us', 'About Us', 'About Us', 1, 1, NULL, '2026-07-06 13:53:24', '2026-07-06 13:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Eswatini'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `courseName` varchar(50) DEFAULT NULL,
  `courseTitle` varchar(100) DEFAULT NULL,
  `courseDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `courseImage` varchar(50) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `courseName`, `courseTitle`, `courseDetails`, `courseImage`, `slug`, `created_at`, `updated_at`, `status`) VALUES
(1, NULL, 'Computer Courses', '', 'course-1758568290.jpg', 'computer-course', '2025-08-24 07:33:31', '2025-09-22 19:11:30', 1),
(2, NULL, 'Vocational & Training Course', '', 'course-1758568321.jpg', 'vocational-training-course', '2025-09-22 19:12:01', '2025-09-22 19:12:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_leads`
--

CREATE TABLE `customer_leads` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_leads`
--

INSERT INTO `customer_leads` (`id`, `first_name`, `last_name`, `email`, `phone`, `project`, `company_name`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rudyard Mcleod', NULL, 'pawi@mailinator.com', '9199758612', 'Kumar Capital Green', NULL, NULL, 'Vel beatae et est om', 1, '2024-12-05 06:10:46', '2024-12-05 06:10:46'),
(2, 'Sumit Test', NULL, 'ranasharma880@gmail.com', '8825171386', 'kashyap Green City Phase 2', NULL, NULL, 'vfddfvfdv', 1, '2024-12-11 00:22:01', '2024-12-11 00:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `customer_posts`
--

CREATE TABLE `customer_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `section` varchar(255) NOT NULL,
  `keywords` text DEFAULT NULL,
  `abstract` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `doi` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `page_range` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `abstract_views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `contributors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`contributors`)),
  `editor_comments` longtext DEFAULT NULL,
  `status` enum('draft','submitted','approved','rejected') NOT NULL DEFAULT 'draft',
  `submitted_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_posts`
--

INSERT INTO `customer_posts` (`id`, `user_id`, `title`, `slug`, `section`, `keywords`, `abstract`, `content`, `excerpt`, `doi`, `volume`, `issue`, `page_range`, `featured_image`, `published_date`, `abstract_views`, `download_count`, `files`, `contributors`, `editor_comments`, `status`, `submitted_at`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 125, 'testing', NULL, 'Articles', 'Test', 'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '[{\"name\":\"true flame.pdf\",\"path\":\"customer-posts\\/D7EOzpSPOuSoiFJH84adZ5Y2FbOBaGwzshO1qXcz.pdf\"}]', '[{\"given\":\"Sumit\",\"family\":\"Test\",\"email\":\"ranasharma880@gmail.com\",\"country\":\"India\",\"affiliation\":\"wdwdwd\"},{\"given\":\"dw\",\"family\":\"wqdwqd\",\"email\":\"wqdwq\",\"country\":\"dwqdwd\",\"affiliation\":\"wdq\"}]', 'wdwqdwqdwd', 'submitted', '2026-07-12 17:04:31', NULL, '2026-07-12 17:02:57', '2026-07-12 17:04:31'),
(2, 125, 'Testing', NULL, 'Latest News', 'dssfsdf', 'sfsfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '[{\"name\":\"file_00000000ed1c7207be225b824b0e3893.png\",\"path\":\"customer-posts\\/JQgHyRmlkxqPqCzGdt8o4SsFTI74kwpqWiaoVxVS.png\"}]', '[{\"given\":\"sfsdfs\",\"family\":\"dfsdfs\",\"email\":\"dfsdf\",\"country\":\"sfssdfsdf\",\"affiliation\":\"sdfsf\"}]', 'sfsdf', 'submitted', '2026-07-12 17:31:19', NULL, '2026-07-12 17:16:14', '2026-07-12 17:31:19'),
(3, 125, 'Test Rana One', NULL, 'Latest News', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'draft', NULL, NULL, '2026-07-12 19:34:36', '2026-07-12 19:34:36'),
(4, 125, 'Rana Sharma', NULL, 'Latest News', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'draft', NULL, NULL, '2026-07-12 19:42:25', '2026-07-12 19:42:25'),
(5, 125, 'Hello this is a test post', 'hello-this-is-a-test-post', 'Latest News', 'Test, All, okay', '<p><b>शिक्षा प्रणाली भविष्य की पीढ़ी को प्रशिक्षित करने और तैयार करने का एक मंच है। शिक्षा के माध्यम से अर्जित ज्ञान और कौशल किसी व्यक्ति को अधिक रोजगार योग्य बनाते हैं। प्राचीन से आधुनिक शिक्षा प्रणाली की ओर संक्रमण के कारण भारतीय शिक्षा प्रणाली अन्य देशों की शिक्षा प्रणालियों की तुलना में अधिक विविध और सराही जाने वाली है। प्राचीन और मध्यकालीन शिक्षा के दौर में शिक्षक अपने विद्यार्थियों को उस समय के जीवन और परिस्थितियों में जीने और सफल होने योग्य बनाते थे। स्वतंत्रता के बाद से भारतीय शिक्षा प्रणाली ने काफी प्रगति की है और सभी क्षेत्रों में शिक्षा व प्रशिक्षण प्रदान कर रही है, फिर भी यह वैश्विक स्तर पर बाज़ार की आवश्यकताओं को पूर्ण रूप से पूरा करने में सक्षम नहीं हो पाई है। इस अध्याय में मुख्य रूप से प्राचीन और मध्यकालीन काल की भारतीय शिक्षा प्रणाली की शिक्षण पद्धति, पाठ्यक्रम, विशेषताएँ, अधिगम रणनीतियाँ और उद्देश्यों पर चर्चा की गई है। साथ ही यह भी बताया गया है कि ये काल आधुनिक शिक्षा से कैसे भिन्न थे और आधुनिक शिक्षा इनसे क्या सीख सकती है तथा उसे कैसे लागू किया जा सकता है। प्राचीन, मध्यकालीन और आधुनिक शिक्षा की खूबियों और कमियों का तुलनात्मक अध्ययन भी इन्हीं कारकों के आधार पर किया गया है। इस अध्याय के माध्यम से विद्यार्थी और शिक्षक शिक्षा प्रणाली में विद्यमान विभिन्नताओं को समझेंगे और यह भी जान पाएंगे कि भविष्य में सभी समस्याओं के समाधान हेतु और क्या परिवर्तन आवश्यक हैं।</b></p>', '<p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• शर्मा, रामनाथ (2005). भारतीय शिक्षा का इतिहास. दिल्ली: प्रकाशन केंद्र। पृ. 45–67।</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• मिश्रा, विजय कुमार (2010). प्राचीन और मध्यकालीन भारतीय शिक्षा प्रणाली. वाराणसी: ज्ञानगंगा प्रकाशन। पृ. 120–138।</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• पाण्डेय, गोविन्द चन्द्र (2008). भारतीय संस्कृति का इतिहास. दिल्ली: मोतीलाल बनारसीदास। पृ. 210–235।</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• सिंह, सुरेश कुमार (2016). आधुनिक भारतीय शिक्षा: विकास और समस्याएँ. जयपुर: विद्यार्थी प्रकाशन। पृ. 56–78।</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• चतुर्वेदी, नरेन्द्र (2012). गुरुकुल से विश्वविद्यालय तक: भारतीय शिक्षा की यात्रा. प्रयागराज: भारतीय विद्या भवन। पृ. 89–101।</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• Altekar, A. S. (1934). Education in Ancient India. Varanasi: Banaras Hindu University Press. pp. 152–175.</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• Sharma, R. N. (1996). History of Education in India. Delhi: Surjeet Publications. pp. 98–114.</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• Aggarwal, J. C. (2002). Development of Education System in India. New Delhi: Shipra Publications. pp. 65–83.</p><p style=\"line-height: 20px; margin: 10px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• Mukerji, S. N. (1966). Education in India: Today and Tomorrow. Baroda: Acharya Book Depot. pp. 34–50</p><p style=\"line-height: 20px; margin: 10px 0px 0px; text-align: justify; color: rgba(0, 0, 0, 0.87); font-family: &quot;Open Sans&quot;, Arial, &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;\">• Nurullah, S. &amp; Naik, J. P. (1951). History of Education in India (During the British Period). Bombay: Macmillan &amp; Co. pp. 200–223.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13', 1, 0, '[{\"name\":\"tfs1.png\",\"path\":\"customer-posts\\/qGsFtWtPOdZbRNxdYQKP7AdvYwfnnrLR0NQ61eOy.png\"},{\"name\":\"ChatGPT Image Jul 12, 2026, 04_51_09 PM.png\",\"path\":\"customer-posts\\/G6moQZLb50feSE3qEg1vpqop0O1gsWuqiXe0xfLx.png\"},{\"name\":\"true flame.pdf\",\"path\":\"customer-posts\\/uFAmmyz0CwycZW1ZQTKQcymkGBdeslp7YwoxQ1Mo.pdf\"}]', '[{\"given\":\"Consequatur nulla im\",\"family\":\"Reprehenderit persp\",\"public_name\":\"Elijah Nixon\",\"email\":\"cevuxel@mailinator.com\",\"country\":\"Magna ex quia minim \",\"homepage\":\"https:\\/\\/www.tiwanumopim.cm\",\"orcid\":\"Ut dolores id atque\",\"bio\":\"Testing.\",\"affiliation\":\"Sequi cillum quis cu\",\"role\":\"Translator\",\"include_publication\":true}]', 'Dr Abhishekh Kumar Pandey', 'approved', '2026-07-12 19:45:47', '2026-07-12 20:08:35', '2026-07-12 19:44:07', '2026-07-12 20:09:10'),
(6, 125, 'Testing Title by Rana', 'testing-title-by-rana', 'Events', 'Test, Rana, Sharma', '<p><b>Testing data will go here</b></p>', '', NULL, '100', '100', '100', '100', NULL, '2026-07-14', 1, 2, '[{\"name\":\"tfs1.png\",\"path\":\"customer-posts\\/IbsgW0xalNRA598rIiF7lmKiJhaLH9Y4yjsyj7jS.png\"},{\"name\":\"ChatGPT Image Jul 12, 2026, 04_51_09 PM.png\",\"path\":\"customer-posts\\/B4VkxmRHA58ML44Pj3AePyt7JSfCpLFrXtooDgt1.png\"},{\"name\":\"slider 1.png\",\"path\":\"customer-posts\\/kyeA4jH1fHeCunUJHBwjqXENaMwgVMrBiy1eDlR5.png\"}]', '[{\"given\":\"Rana\",\"family\":\"Abhishek\",\"public_name\":\"Okay\",\"email\":\"rana@gmail.com\",\"country\":\"INdia\",\"homepage\":\"https:\\/\\/ranasharma.com\",\"orcid\":\"001\",\"bio\":\"<p>Test<\\/p>\",\"affiliation\":\"apexza\",\"role\":\"Translator\",\"include_publication\":true}]', '<p>All Oaky</p>', 'approved', '2026-07-12 20:22:39', '2026-07-12 20:30:51', '2026-07-12 20:20:48', '2026-07-12 20:30:51'),
(7, 125, 'Testing Anikrishna Project', 'testing-anikrishna-project', 'Latest News', 'Rana, Sharma, Purnia', '<p><b>Testing Anikrishna Project Detail</b></p>', '', NULL, '0', '100', '100', '10', 'customer-posts/covers/SOln3PsMxRpgHl3UQkHrjQTOz2bU9hIuKrMjgNqO.png', '2026-07-14', 1, 1, '[{\"name\":\"ChatGPT Image Jul 12, 2026, 04_51_09 PM (1).png\",\"path\":\"customer-posts\\/6eUQP0U4YUK9Sy5CvnPdU6NoXgL0R1zoO8nexrZE.png\"},{\"name\":\"tfs1 (1).png\",\"path\":\"customer-posts\\/RxYBppMp73Wn1GrmoItffA0hGz2RNpbs1B4t5Dpq.png\"}]', '[{\"given\":\"Rana\",\"family\":\"Shamra\",\"public_name\":\"Sharma\",\"email\":\"iamranasharma@gmail.com\",\"country\":\"Inidia\",\"homepage\":\"https:\\/\\/ranasharma.com\",\"orcid\":\"001\",\"bio\":\"<p>Testing Anikrishna Project<\\/p>\",\"affiliation\":\"Apexza Infotech\",\"role\":\"Author\",\"include_publication\":true}]', '<p>Testing Anikrishna Project for editor</p>', 'approved', '2026-07-12 20:44:31', '2026-07-12 20:46:11', '2026-07-12 20:42:42', '2026-07-12 20:46:49'),
(8, 125, 'Test Project', 'test-project', 'Articles', 'rana, sharma', '<p>Testing Anikrishna project</p>', '', NULL, '10', '10', '10', '10', 'customer-posts/covers/AVzmawYH6FEybCWcb5jXzKgzluB3ECr8HTYvolwB.png', '2026-07-13', 1, 1, '[{\"name\":\"tfs1 (1) (1).png\",\"path\":\"customer-posts\\/x2ZlINXsIweMrn5vdDHi8yeUwSSrfNabnyrqqmPA.png\"},{\"name\":\"tfs4.png\",\"path\":\"customer-posts\\/NebdCvUlwxmym1qPU3XaHfNsFox0kt1MjBlcwbbU.png\"}]', '[{\"given\":\"Rana\",\"family\":\"Sharma\",\"public_name\":\"Amar\",\"email\":\"info@webmaker.in\",\"country\":\"India\",\"homepage\":\"https:\\/\\/ranasharma.com\",\"orcid\":\"001\",\"bio\":\"<p><span style=\\\"color: rgb(102, 116, 113); font-family: Nunito, sans-serif; font-size: 16px; font-weight: 400; display: inline !important;\\\">Testing Anikrishna project<\\/span><\\/p>\",\"affiliation\":\"Oaky\",\"role\":\"Author\",\"include_publication\":true}]', '<p><span style=\"color: rgb(102, 116, 113); font-family: Nunito, sans-serif; font-size: 16px; font-weight: 400; display: inline !important;\">Testing Anikrishna project</span></p>', 'approved', '2026-07-12 20:50:27', '2026-07-12 20:51:20', '2026-07-12 20:49:05', '2026-07-12 20:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` int(8) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state_id`, `name`, `status`) VALUES
(1, 1, 'North Andaman', 1),
(2, 1, 'South Andaman', 1),
(3, 1, 'Nicobar', 1),
(4, 2, 'Adilabad', 1),
(5, 2, 'Anantapur', 1),
(6, 2, 'Chittoor', 1),
(7, 2, 'East Godavari', 1),
(8, 2, 'Guntur', 1),
(9, 2, 'Hyderabad', 1),
(10, 2, 'Karimnagar', 1),
(11, 2, 'Khammam', 1),
(12, 2, 'Krishna', 1),
(13, 2, 'Kurnool', 1),
(14, 2, 'Mahbubnagar', 1),
(15, 2, 'Medak', 1),
(16, 2, 'Nalgonda', 1),
(17, 2, 'Nizamabad', 1),
(18, 2, 'Prakasam', 1),
(19, 2, 'Ranga Reddy', 1),
(20, 2, 'Srikakulam', 1),
(21, 2, 'Sri Potti Sri Ramulu Nellore', 1),
(22, 2, 'Vishakhapatnam', 1),
(23, 2, 'Vizianagaram', 1),
(24, 2, 'Warangal', 1),
(25, 2, 'West Godavari', 1),
(26, 2, 'Cudappah', 1),
(27, 3, 'Anjaw', 1),
(28, 3, 'Changlang', 1),
(29, 3, 'East Siang', 1),
(30, 3, 'East Kameng', 1),
(31, 3, 'Kurung Kumey', 1),
(32, 3, 'Lohit', 1),
(33, 3, 'Lower Dibang Valley', 1),
(34, 3, 'Lower Subansiri', 1),
(35, 3, 'Papum Pare', 1),
(36, 3, 'Tawang', 1),
(37, 3, 'Tirap', 1),
(38, 3, 'Dibang Valley', 1),
(39, 3, 'Upper Siang', 1),
(40, 3, 'Upper Subansiri', 1),
(41, 3, 'West Kameng', 1),
(42, 3, 'West Siang', 1),
(43, 4, 'Baksa', 1),
(44, 4, 'Barpeta', 1),
(45, 4, 'Bongaigaon', 1),
(46, 4, 'Cachar', 1),
(47, 4, 'Chirang', 1),
(48, 4, 'Darrang', 1),
(49, 4, 'Dhemaji', 1),
(50, 4, 'Dima Hasao', 1),
(51, 4, 'Dhubri', 1),
(52, 4, 'Dibrugarh', 1),
(53, 4, 'Goalpara', 1),
(54, 4, 'Golaghat', 1),
(55, 4, 'Hailakandi', 1),
(56, 4, 'Jorhat', 1),
(57, 4, 'Kamrup', 1),
(58, 4, 'Kamrup Metropolitan', 1),
(59, 4, 'Karbi Anglong', 1),
(60, 4, 'Karimganj', 1),
(61, 4, 'Kokrajhar', 1),
(62, 4, 'Lakhimpur', 1),
(63, 4, 'Morigaon', 1),
(64, 4, 'Nagaon', 1),
(65, 4, 'Nalbari', 1),
(66, 4, 'Sivasagar', 1),
(67, 4, 'Sonitpur', 1),
(68, 4, 'Tinsukia', 1),
(69, 4, 'Udalguri', 1),
(70, 5, 'Araria', 1),
(71, 5, 'Arwal', 1),
(72, 5, 'Aurangabad', 1),
(73, 5, 'Banka', 1),
(74, 5, 'Begusarai', 1),
(75, 5, 'Bhagalpur', 1),
(76, 5, 'Bhojpur', 1),
(77, 5, 'Buxar', 1),
(78, 5, 'Darbhanga', 1),
(79, 5, 'East Champaran', 1),
(80, 5, 'Gaya', 1),
(81, 5, 'Gopalganj', 1),
(82, 5, 'Jamui', 1),
(83, 5, 'Jehanabad', 1),
(84, 5, 'Kaimur', 1),
(85, 5, 'Katihar', 1),
(86, 5, 'Khagaria', 1),
(87, 5, 'Kishanganj', 1),
(88, 5, 'Lakhisarai', 1),
(89, 5, 'Madhepura', 1),
(90, 5, 'Madhubani', 1),
(91, 5, 'Munger', 1),
(92, 5, 'Muzaffarpur', 1),
(93, 5, 'Nalanda', 1),
(94, 5, 'Nawada', 1),
(95, 5, 'Patna', 1),
(96, 5, 'Purnia', 1),
(97, 5, 'Rohtas', 1),
(98, 5, 'Saharsa', 1),
(99, 5, 'Samastipur', 1),
(100, 5, 'Saran', 1),
(101, 5, 'Sheikhpura', 1),
(102, 5, 'Sheohar', 1),
(103, 5, 'Sitamarhi', 1),
(104, 5, 'Siwan', 1),
(105, 5, 'Supaul', 1),
(106, 6, 'Chandigarh', 1),
(107, 7, 'Bastar', 1),
(108, 7, 'Bijapur', 1),
(109, 7, 'Bilaspur', 1),
(110, 7, 'Dantewada', 1),
(111, 7, 'Dhamtari', 1),
(112, 7, 'Durg', 1),
(113, 7, 'Jashpur', 1),
(114, 7, 'Janjgir-Champa', 1),
(115, 7, 'Korba', 1),
(116, 7, 'Koriya', 1),
(117, 7, 'Kanker', 1),
(118, 7, 'Kabirdham (formerly Kawardha)', 1),
(119, 7, 'Mahasamund', 1),
(120, 7, 'Narayanpur', 1),
(121, 7, 'Raigarh', 1),
(122, 7, 'Rajnandgaon', 1),
(123, 7, 'Raipur', 1),
(124, 7, 'Surguja', 1),
(125, 8, 'Dadra and Nagar Haveli', 1),
(126, 9, 'Daman', 1),
(127, 9, 'Diu', 1),
(128, 10, 'Central Delhi', 1),
(129, 10, 'East Delhi', 1),
(130, 10, 'New Delhi', 1),
(131, 10, 'North Delhi', 1),
(132, 10, 'North East Delhi', 1),
(133, 10, 'North West Delhi', 1),
(134, 10, 'South Delhi', 1),
(135, 10, 'South West Delhi', 1),
(136, 10, 'West Delhi', 1),
(137, 11, 'North Goa', 1),
(138, 11, 'South Goa', 1),
(139, 12, 'Ahmedabad', 1),
(140, 12, 'Amreli district', 1),
(141, 12, 'Anand', 1),
(142, 12, 'Banaskantha', 1),
(143, 12, 'Bharuch', 1),
(144, 12, 'Bhavnagar', 1),
(145, 12, 'Dahod', 1),
(146, 12, 'The Dangs', 1),
(147, 12, 'Gandhinagar', 1),
(148, 12, 'Jamnagar', 1),
(149, 12, 'Junagadh', 1),
(150, 12, 'Kutch', 1),
(151, 12, 'Kheda', 1),
(152, 12, 'Mehsana', 1),
(153, 12, 'Narmada', 1),
(154, 12, 'Navsari', 1),
(155, 12, 'Patan', 1),
(156, 12, 'Panchmahal', 1),
(157, 12, 'Porbandar', 1),
(158, 12, 'Rajkot', 1),
(159, 12, 'Sabarkantha', 1),
(160, 12, 'Surendranagar', 1),
(161, 12, 'Surat', 1),
(162, 12, 'Tapi', 1),
(163, 12, 'Vadodara', 1),
(164, 12, 'Valsad', 1),
(165, 13, 'Ambala', 1),
(166, 13, 'Bhiwani', 1),
(167, 13, 'Faridabad', 1),
(168, 13, 'Fatehabad', 1),
(169, 13, 'Gurgaon', 1),
(170, 13, 'Hissar', 1),
(171, 13, 'Jhajjar', 1),
(172, 13, 'Jind', 1),
(173, 13, 'Karnal', 1),
(174, 13, 'Kaithal', 1),
(175, 13, 'Kurukshetra', 1),
(176, 13, 'Mahendragarh', 1),
(177, 13, 'Mewat', 1),
(178, 13, 'Palwal', 1),
(179, 13, 'Panchkula', 1),
(180, 13, 'Panipat', 1),
(181, 13, 'Rewari', 1),
(182, 13, 'Rohtak', 1),
(183, 13, 'Sirsa', 1),
(184, 13, 'Sonipat', 1),
(185, 13, 'Yamuna Nagar', 1),
(186, 14, 'Bilaspur', 1),
(187, 14, 'Chamba', 1),
(188, 14, 'Hamirpur', 1),
(189, 14, 'Kangra', 1),
(190, 14, 'Kinnaur', 1),
(191, 14, 'Kullu', 1),
(192, 14, 'Lahaul and Spiti', 1),
(193, 14, 'Mandi', 1),
(194, 14, 'Shimla', 1),
(195, 14, 'Sirmaur', 1),
(196, 14, 'Solan', 1),
(197, 14, 'Una', 1),
(198, 15, 'Anantnag', 1),
(199, 15, 'Badgam', 1),
(200, 15, 'Bandipora', 1),
(201, 15, 'Baramulla', 1),
(202, 15, 'Doda', 1),
(203, 15, 'Ganderbal', 1),
(204, 15, 'Jammu', 1),
(205, 15, 'Kargil', 1),
(206, 15, 'Kathua', 1),
(207, 15, 'Kishtwar', 1),
(208, 15, 'Kupwara', 1),
(209, 15, 'Kulgam', 1),
(210, 15, 'Leh', 1),
(211, 15, 'Poonch', 1),
(212, 15, 'Pulwama', 1),
(213, 15, 'Rajouri', 1),
(214, 15, 'Ramban', 1),
(215, 15, 'Reasi', 1),
(216, 15, 'Samba', 1),
(217, 15, 'Shopian', 1),
(218, 15, 'Srinagar', 1),
(219, 15, 'Udhampur', 1),
(220, 16, 'Bokaro', 1),
(221, 16, 'Chatra', 1),
(222, 16, 'Deoghar', 1),
(223, 16, 'Dhanbad', 1),
(224, 16, 'Dumka', 1),
(225, 16, 'East Singhbhum', 1),
(226, 16, 'Garhwa', 1),
(227, 16, 'Giridih', 1),
(228, 16, 'Godda', 1),
(229, 16, 'Gumla', 1),
(230, 16, 'Hazaribag', 1),
(231, 16, 'Jamtara', 1),
(232, 16, 'Khunti', 1),
(233, 16, 'Koderma', 1),
(234, 16, 'Latehar', 1),
(235, 16, 'Lohardaga', 1),
(236, 16, 'Pakur', 1),
(237, 16, 'Palamu', 1),
(238, 16, 'Ramgarh', 1),
(239, 16, 'Ranchi', 1),
(240, 16, 'Sahibganj', 1),
(241, 16, 'Seraikela Kharsawan', 1),
(242, 16, 'Simdega', 1),
(243, 16, 'West Singhbhum', 1),
(244, 17, 'Bagalkot', 1),
(245, 17, 'Bangalore Rural', 1),
(246, 17, 'Bangalore Urban', 1),
(247, 17, 'Belgaum', 1),
(248, 17, 'Bellary', 1),
(249, 17, 'Bidar', 1),
(250, 17, 'Bijapur', 1),
(251, 17, 'Chamarajnagar', 1),
(252, 17, 'Chikkamagaluru', 1),
(253, 17, 'Chikkaballapur', 1),
(254, 17, 'Chitradurga', 1),
(255, 17, 'Davanagere', 1),
(256, 17, 'Dharwad', 1),
(257, 17, 'Dakshina Kannada', 1),
(258, 17, 'Gadag', 1),
(259, 17, 'Gulbarga', 1),
(260, 17, 'Hassan', 1),
(261, 17, 'Haveri district', 1),
(262, 17, 'Kodagu', 1),
(263, 17, 'Kolar', 1),
(264, 17, 'Koppal', 1),
(265, 17, 'Mandya', 1),
(266, 17, 'Mysore', 1),
(267, 17, 'Raichur', 1),
(268, 17, 'Shimoga', 1),
(269, 17, 'Tumkur', 1),
(270, 17, 'Udupi', 1),
(271, 17, 'Uttara Kannada', 1),
(272, 17, 'Ramanagara', 1),
(273, 17, 'Yadgir', 1),
(274, 18, 'Alappuzha', 1),
(275, 18, 'Ernakulam', 1),
(276, 18, 'Idukki', 1),
(277, 18, 'Kannur', 1),
(278, 18, 'Kasaragod', 1),
(279, 18, 'Kollam', 1),
(280, 18, 'Kottayam', 1),
(281, 18, 'Kozhikode', 1),
(282, 18, 'Malappuram', 1),
(283, 18, 'Palakkad', 1),
(284, 18, 'Pathanamthitta', 1),
(285, 18, 'Thrissur', 1),
(286, 18, 'Thiruvananthapuram', 1),
(287, 18, 'Wayanad', 1),
(288, 19, 'Lakshadweep', 1),
(289, 20, 'Agar', 1),
(290, 20, 'Alirajpur', 1),
(291, 20, 'Anuppur', 1),
(292, 20, 'Ashok Nagar', 1),
(293, 20, 'Balaghat', 1),
(294, 20, 'Barwani', 1),
(295, 20, 'Betul', 1),
(296, 20, 'Bhind', 1),
(297, 20, 'Bhopal', 1),
(298, 20, 'Burhanpur', 1),
(299, 20, 'Chhatarpur', 1),
(300, 20, 'Chhindwara', 1),
(301, 20, 'Damoh', 1),
(302, 20, 'Datia', 1),
(303, 20, 'Dewas', 1),
(304, 20, 'Dhar', 1),
(305, 20, 'Dindori', 1),
(306, 20, 'Guna', 1),
(307, 20, 'Gwalior', 1),
(308, 20, 'Harda', 1),
(309, 20, 'Hoshangabad', 1),
(310, 20, 'Indore', 1),
(311, 20, 'Jabalpur', 1),
(312, 20, 'Jhabua', 1),
(313, 20, 'Katni', 1),
(314, 20, 'Khandwa (East Nimar)', 1),
(315, 20, 'Khargone (West Nimar)', 1),
(316, 20, 'Mandla', 1),
(317, 20, 'Mandsaur', 1),
(318, 20, 'Morena', 1),
(319, 20, 'Narsinghpur', 1),
(320, 20, 'Neemuch', 1),
(321, 20, 'Panna', 1),
(322, 20, 'Raisen', 1),
(323, 20, 'Rajgarh', 1),
(324, 20, 'Ratlam', 1),
(325, 20, 'Rewa', 1),
(326, 20, 'Sagar', 1),
(327, 20, 'Satna', 1),
(328, 20, 'Sehore', 1),
(329, 20, 'Seoni', 1),
(330, 20, 'Shahdol', 1),
(331, 20, 'Shajapur', 1),
(332, 20, 'Sheopur', 1),
(333, 20, 'Shivpuri', 1),
(334, 20, 'Sidhi', 1),
(335, 20, 'Singrauli', 1),
(336, 20, 'Tikamgarh', 1),
(337, 20, 'Ujjain', 1),
(338, 20, 'Umaria', 1),
(339, 20, 'Vidisha', 1),
(340, 21, 'Ahmednagar', 1),
(341, 21, 'Akola', 1),
(342, 21, 'Amravati', 1),
(343, 21, 'Aurangabad', 1),
(344, 21, 'Beed', 1),
(345, 21, 'Bhandara', 1),
(346, 21, 'Buldhana', 1),
(347, 21, 'Chandrapur', 1),
(348, 21, 'Dhule', 1),
(349, 21, 'Gadchiroli', 1),
(350, 21, 'Gondia', 1),
(351, 21, 'Hingoli', 1),
(352, 21, 'Jalgaon', 1),
(353, 21, 'Jalna', 1),
(354, 21, 'Kolhapur', 1),
(355, 21, 'Latur', 1),
(356, 21, 'Mumbai City', 1),
(357, 21, 'Mumbai suburban', 1),
(358, 21, 'Nanded', 1),
(359, 21, 'Nandurbar', 1),
(360, 21, 'Nagpur', 1),
(361, 21, 'Nashik', 1),
(362, 21, 'Osmanabad', 1),
(363, 21, 'Parbhani', 1),
(364, 21, 'Pune', 1),
(365, 21, 'Raigad', 1),
(366, 21, 'Ratnagiri', 1),
(367, 21, 'Sangli', 1),
(368, 21, 'Satara', 1),
(369, 21, 'Sindhudurg', 1),
(370, 21, 'Solapur', 1),
(371, 21, 'Thane', 1),
(372, 21, 'Wardha', 1),
(373, 21, 'Washim', 1),
(374, 21, 'Yavatmal', 1),
(375, 22, 'Bishnupur', 1),
(376, 22, 'Churachandpur', 1),
(377, 22, 'Chandel', 1),
(378, 22, 'Imphal East', 1),
(379, 22, 'Senapati', 1),
(380, 22, 'Tamenglong', 1),
(381, 22, 'Thoubal', 1),
(382, 22, 'Ukhrul', 1),
(383, 22, 'Imphal West', 1),
(384, 23, 'East Garo Hills', 1),
(385, 23, 'East Khasi Hills', 1),
(386, 23, 'Jaintia Hills', 1),
(387, 23, 'Ri Bhoi', 1),
(388, 23, 'South Garo Hills', 1),
(389, 23, 'West Garo Hills', 1),
(390, 23, 'West Khasi Hills', 1),
(391, 24, 'Aizawl', 1),
(392, 24, 'Champhai', 1),
(393, 24, 'Kolasib', 1),
(394, 24, 'Lawngtlai', 1),
(395, 24, 'Lunglei', 1),
(396, 24, 'Mamit', 1),
(397, 24, 'Saiha', 1),
(398, 24, 'Serchhip', 1),
(399, 25, 'Dimapur', 1),
(400, 25, 'Kiphire', 1),
(401, 25, 'Kohima', 1),
(402, 25, 'Longleng', 1),
(403, 25, 'Mokokchung', 1),
(404, 25, 'Mon', 1),
(405, 25, 'Peren', 1),
(406, 25, 'Phek', 1),
(407, 25, 'Tuensang', 1),
(408, 25, 'Wokha', 1),
(409, 25, 'Zunheboto', 1),
(410, 26, 'Angul', 1),
(411, 26, 'Boudh (Bauda)', 1),
(412, 26, 'Bhadrak', 1),
(413, 26, 'Balangir', 1),
(414, 26, 'Bargarh (Baragarh)', 1),
(415, 26, 'Balasore', 1),
(416, 26, 'Cuttack', 1),
(417, 26, 'Debagarh (Deogarh)', 1),
(418, 26, 'Dhenkanal', 1),
(419, 26, 'Ganjam', 1),
(420, 26, 'Gajapati', 1),
(421, 26, 'Jharsuguda', 1),
(422, 26, 'Jajpur', 1),
(423, 26, 'Jagatsinghpur', 1),
(424, 26, 'Khordha', 1),
(425, 26, 'Kendujhar (Keonjhar)', 1),
(426, 26, 'Kalahandi', 1),
(427, 26, 'Kandhamal', 1),
(428, 26, 'Koraput', 1),
(429, 26, 'Kendrapara', 1),
(430, 26, 'Malkangiri', 1),
(431, 26, 'Mayurbhanj', 1),
(432, 26, 'Nabarangpur', 1),
(433, 26, 'Nuapada', 1),
(434, 26, 'Nayagarh', 1),
(435, 26, 'Puri', 1),
(436, 26, 'Rayagada', 1),
(437, 26, 'Sambalpur', 1),
(438, 26, 'Subarnapur (Sonepur)', 1),
(439, 26, 'Sundergarh', 1),
(440, 27, 'Karaikal', 1),
(441, 27, 'Mahe', 1),
(442, 27, 'Pondicherry', 1),
(443, 27, 'Yanam', 1),
(444, 28, 'Amritsar', 1),
(445, 28, 'Barnala', 1),
(446, 28, 'Bathinda', 1),
(447, 28, 'Firozpur', 1),
(448, 28, 'Faridkot', 1),
(449, 28, 'Fatehgarh Sahib', 1),
(450, 28, 'Fazilka[6]', 1),
(451, 28, 'Gurdaspur', 1),
(452, 28, 'Hoshiarpur', 1),
(453, 28, 'Jalandhar', 1),
(454, 28, 'Kapurthala', 1),
(455, 28, 'Ludhiana', 1),
(456, 28, 'Mansa', 1),
(457, 28, 'Moga', 1),
(458, 28, 'Sri Muktsar Sahib', 1),
(459, 28, 'Pathankot', 1),
(460, 28, 'Patiala', 1),
(461, 28, 'Rupnagar', 1),
(462, 28, 'Ajitgarh (Mohali)', 1),
(463, 28, 'Sangrur', 1),
(464, 28, 'Shahid Bhagat Singh Nagar', 1),
(465, 28, 'Tarn Taran', 1),
(466, 29, 'Ajmer', 1),
(467, 29, 'Alwar', 1),
(468, 29, 'Bikaner', 1),
(469, 29, 'Barmer', 1),
(470, 29, 'Banswara', 1),
(471, 29, 'Bharatpur', 1),
(472, 29, 'Baran', 1),
(473, 29, 'Bundi', 1),
(474, 29, 'Bhilwara', 1),
(475, 29, 'Churu', 1),
(476, 29, 'Chittorgarh', 1),
(477, 29, 'Dausa', 1),
(478, 29, 'Dholpur', 1),
(479, 29, 'Dungapur', 1),
(480, 29, 'Ganganagar', 1),
(481, 29, 'Hanumangarh', 1),
(482, 29, 'Jhunjhunu', 1),
(483, 29, 'Jalore', 1),
(484, 29, 'Jodhpur', 1),
(485, 29, 'Jaipur', 1),
(486, 29, 'Jaisalmer', 1),
(487, 29, 'Jhalawar', 1),
(488, 29, 'Karauli', 1),
(489, 29, 'Kota', 1),
(490, 29, 'Nagaur', 1),
(491, 29, 'Pali', 1),
(492, 29, 'Pratapgarh', 1),
(493, 29, 'Rajsamand', 1),
(494, 29, 'Sikar', 1),
(495, 29, 'Sawai Madhopur', 1),
(496, 29, 'Sirohi', 1),
(497, 29, 'Tonk', 1),
(498, 29, 'Udaipur', 1),
(499, 30, 'East Sikkim', 1),
(500, 30, 'North Sikkim', 1),
(501, 30, 'South Sikkim', 1),
(502, 30, 'West Sikkim', 1),
(503, 31, 'Ariyalur', 1),
(504, 31, 'Chennai', 1),
(505, 31, 'Coimbatore', 1),
(506, 31, 'Cuddalore', 1),
(507, 31, 'Dharmapuri', 1),
(508, 31, 'Dindigul', 1),
(509, 31, 'Erode', 1),
(510, 31, 'Kanchipuram', 1),
(511, 31, 'Kanyakumari', 1),
(512, 31, 'Karur', 1),
(513, 31, 'Krishnagiri', 1),
(514, 31, 'Madurai', 1),
(515, 31, 'Nagapattinam', 1),
(516, 31, 'Nilgiris', 1),
(517, 31, 'Namakkal', 1),
(518, 31, 'Perambalur', 1),
(519, 31, 'Pudukkottai', 1),
(520, 31, 'Ramanathapuram', 1),
(521, 31, 'Salem', 1),
(522, 31, 'Sivaganga', 1),
(523, 31, 'Tirupur', 1),
(524, 31, 'Tiruchirappalli', 1),
(525, 31, 'Theni', 1),
(526, 31, 'Tirunelveli', 1),
(527, 31, 'Thanjavur', 1),
(528, 31, 'Thoothukudi', 1),
(529, 31, 'Tiruvallur', 1),
(530, 31, 'Tiruvarur', 1),
(531, 31, 'Tiruvannamalai', 1),
(532, 31, 'Vellore', 1),
(533, 31, 'Viluppuram', 1),
(534, 31, 'Virudhunagar', 1),
(535, 32, 'Dhalai', 1),
(536, 32, 'North Tripura', 1),
(537, 32, 'South Tripura', 1),
(538, 32, 'Khowai[7]', 1),
(539, 32, 'West Tripura', 1),
(540, 33, 'Agra', 1),
(541, 33, 'Aligarh', 1),
(542, 33, 'Allahabad', 1),
(543, 33, 'Ambedkar Nagar', 1),
(544, 33, 'Auraiya', 1),
(545, 33, 'Azamgarh', 1),
(546, 33, 'Bagpat', 1),
(547, 33, 'Bahraich', 1),
(548, 33, 'Ballia', 1),
(549, 33, 'Balrampur', 1),
(550, 33, 'Banda', 1),
(551, 33, 'Barabanki', 1),
(552, 33, 'Bareilly', 1),
(553, 33, 'Basti', 1),
(554, 33, 'Bijnor', 1),
(555, 33, 'Budaun', 1),
(556, 33, 'Bulandshahr', 1),
(557, 33, 'Chandauli', 1),
(558, 33, 'Chhatrapati Shahuji Maharaj Nagar[8]', 1),
(559, 33, 'Chitrakoot', 1),
(560, 33, 'Deoria', 1),
(561, 33, 'Etah', 1),
(562, 33, 'Etawah', 1),
(563, 33, 'Faizabad', 1),
(564, 33, 'Farrukhabad', 1),
(565, 33, 'Fatehpur', 1),
(566, 33, 'Firozabad', 1),
(567, 33, 'Gautam Buddh Nagar', 1),
(568, 33, 'Ghaziabad', 1),
(569, 33, 'Ghazipur', 1),
(570, 33, 'Gonda', 1),
(571, 33, 'Gorakhpur', 1),
(572, 33, 'Hamirpur', 1),
(573, 33, 'Hardoi', 1),
(574, 33, 'Hathras', 1),
(575, 33, 'Jalaun', 1),
(576, 33, 'Jaunpur district', 1),
(577, 33, 'Jhansi', 1),
(578, 33, 'Jyotiba Phule Nagar', 1),
(579, 33, 'Kannauj', 1),
(580, 33, 'Kanpur', 1),
(581, 33, 'Kanshi Ram Nagar', 1),
(582, 33, 'Kaushambi', 1),
(583, 33, 'Kushinagar', 1),
(584, 33, 'Lakhimpur Kheri', 1),
(585, 33, 'Lalitpur', 1),
(586, 33, 'Lucknow', 1),
(587, 33, 'Maharajganj', 1),
(588, 33, 'Mahoba', 1),
(589, 33, 'Mainpuri', 1),
(590, 33, 'Mathura', 1),
(591, 33, 'Mau', 1),
(592, 33, 'Meerut', 1),
(593, 33, 'Mirzapur', 1),
(594, 33, 'Moradabad', 1),
(595, 33, 'Muzaffarnagar', 1),
(596, 33, 'Panchsheel Nagar district (Hapur)', 1),
(597, 33, 'Pilibhit', 1),
(598, 33, 'Pratapgarh', 1),
(599, 33, 'Raebareli', 1),
(600, 33, 'Ramabai Nagar (Kanpur Dehat)', 1),
(601, 33, 'Rampur', 1),
(602, 33, 'Saharanpur', 1),
(603, 33, 'Sant Kabir Nagar', 1),
(604, 33, 'Sant Ravidas Nagar', 1),
(605, 33, 'Shahjahanpur', 1),
(606, 33, 'Shamli[9]', 1),
(607, 33, 'Shravasti', 1),
(608, 33, 'Siddharthnagar', 1),
(609, 33, 'Sitapur', 1),
(610, 33, 'Sonbhadra', 1),
(611, 33, 'Sultanpur', 1),
(612, 33, 'Unnao', 1),
(613, 33, 'Varanasi', 1),
(614, 34, 'Almora', 1),
(615, 34, 'Bageshwar', 1),
(616, 34, 'Chamoli', 1),
(617, 34, 'Champawat', 1),
(618, 34, 'Dehradun', 1),
(619, 34, 'Haridwar', 1),
(620, 34, 'Nainital', 1),
(621, 34, 'Pauri Garhwal', 1),
(622, 34, 'Pithoragarh', 1),
(623, 34, 'Rudraprayag', 1),
(624, 34, 'Tehri Garhwal', 1),
(625, 34, 'Udham Singh Nagar', 1),
(626, 34, 'Uttarkashi', 1),
(627, 35, 'Bankura', 1),
(628, 35, 'Bardhaman', 1),
(629, 35, 'Birbhum', 1),
(630, 35, 'Cooch Behar', 1),
(631, 35, 'Dakshin Dinajpur', 1),
(632, 35, 'Darjeeling', 1),
(633, 35, 'Hooghly', 1),
(634, 35, 'Howrah', 1),
(635, 35, 'Jalpaiguri', 1),
(636, 35, 'Kolkata', 1),
(637, 35, 'Maldah', 1),
(638, 35, 'Murshidabad', 1),
(639, 35, 'Nadia', 1),
(640, 35, 'North 24 Parganas', 1),
(641, 35, 'Paschim Medinipur', 1),
(642, 35, 'Purba Medinipur', 1),
(643, 35, 'Purulia', 1),
(644, 35, 'South 24 Parganas', 1),
(645, 35, 'Uttar Dinajpur', 1),
(646, 5, 'Purnia 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_visits`
--

CREATE TABLE `doctor_visits` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `visit_time` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_visits`
--

INSERT INTO `doctor_visits` (`id`, `doctor_id`, `visit_date`, `visit_time`, `remarks`, `picture`, `created_at`, `updated_at`) VALUES
(1, 24, '2024-12-02', '12:41 PM', 'sdfsdfsf', 'uploads/staff/staff-20241202124137-5234.webp', '2024-12-02 07:11:37', '2024-12-02 07:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `image`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, '1748112833734.Sanitary Certificate.pdf', 'Test', 1, '2025-05-24 13:23:53', '2025-05-24 13:23:53'),
(3, '1750002909361.student-admitcard_R11155524.pdf', 'ewfwefwef', 1, '2025-06-15 10:25:09', '2025-06-15 10:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `employee_targets`
--

CREATE TABLE `employee_targets` (
  `id` int(11) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` int(11) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `target` varchar(255) NOT NULL,
  `target_value` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_targets`
--

INSERT INTO `employee_targets` (`id`, `user_type`, `user_designation`, `target_type`, `target`, `target_value`, `status`, `created_at`, `updated_at`, `created_by`) VALUES
(4, 5, 2, 'yearly_target', 'Target', '250000', 1, '2026-04-17 22:52:18', '2026-04-21 08:45:19', 1),
(5, 5, 17, 'monthly_target', 'Argent', '400000', 1, '2026-04-17 23:02:31', '2026-04-17 23:02:31', 1),
(6, 5, 1, 'yearly_target', 'Target', '4800000', 1, '2026-04-21 08:44:36', '2026-04-21 08:44:36', 1),
(7, 5, 17, 'monthly_target', 'Target', '400000', 1, '2026-04-21 08:46:30', '2026-04-21 08:46:30', 1),
(9, 5, 17, '10_days_target', 'Target', '134000', 1, '2026-04-21 08:49:00', '2026-04-21 08:49:00', 1),
(10, 5, 17, 'per_day_target', 'Target', '13333', 1, '2026-04-21 08:49:30', '2026-04-21 08:49:30', 1),
(11, 6, 9, 'monthly_target', 'super', '200000', 1, '2026-04-21 23:04:24', '2026-04-21 23:04:24', 1),
(12, 5, 12, 'yearly_target', 'Yearly Target', '6000000', 1, '2026-04-29 22:44:03', '2026-04-29 22:44:03', 1),
(13, 5, 12, 'monthly_target', 'Monthly Target', '500000', 1, '2026-04-29 22:44:47', '2026-04-29 22:44:47', 1),
(14, 5, 12, '10_days_target', '10 Days Target', '166660', 1, '2026-04-29 22:47:14', '2026-04-29 22:47:14', 1),
(15, 5, 13, 'yearly_target', 'YEARLY TARGET', '6000000', 1, '2026-04-29 22:48:23', '2026-04-29 22:48:23', 1),
(16, 5, 13, 'monthly_target', 'Monthly Target', '500000', 1, '2026-04-29 22:48:59', '2026-04-29 22:48:59', 1),
(17, 5, 13, '10_days_target', '10 Days Target', '166660', 1, '2026-04-29 22:49:57', '2026-04-29 22:49:57', 1),
(18, 5, 13, 'per_day_target', 'Per Day Target', '16666', 1, '2026-04-29 22:51:10', '2026-04-29 22:51:10', 1),
(19, 5, 12, 'per_day_target', 'Per Days Target', '16666', 1, '2026-04-29 22:51:55', '2026-04-29 22:51:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_years`
--

CREATE TABLE `enrollment_years` (
  `id` int(11) NOT NULL,
  `year` varchar(100) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment_years`
--

INSERT INTO `enrollment_years` (`id`, `year`, `status`, `created_at`, `updated_at`) VALUES
(1, '23', 0, '2025-04-03 12:35:59', '2025-04-05 17:22:30'),
(2, '24', 1, '2025-04-03 13:09:29', '2025-04-05 17:22:35'),
(3, '25', 0, '2025-04-03 13:09:35', '2025-04-05 17:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `english_title` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_categories`
--

INSERT INTO `event_categories` (`id`, `parent_id`, `title`, `english_title`, `image`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Milk Day Celebration', 'Milk Day Celebration', 'uploads/all/all-20250102114842-1741.webp', 'milk-day-celebration', 1, 1, NULL, '2025-01-02 06:18:43', '2025-01-02 08:23:42', '2025-01-02 08:23:42');

-- --------------------------------------------------------

--
-- Table structure for table `event_galleries`
--

CREATE TABLE `event_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `sub_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `expense_date` date NOT NULL,
  `payment_mode` enum('cash','online','bank','upi') DEFAULT 'cash',
  `bill_file` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `group_id`, `sub_group_id`, `title`, `description`, `amount`, `expense_date`, `payment_mode`, `bill_file`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'dfghjk', 'cvbnm,', 800.00, '2026-01-16', 'upi', '1768381181.jpg', 1, NULL, '2026-01-14 03:29:41', '2026-01-14 03:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `expense_groups`
--

CREATE TABLE `expense_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_groups`
--

INSERT INTO `expense_groups` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'klookk', 1, NULL, '2026-01-14 09:30:34', '2026-01-20 01:59:25'),
(5, 'testing', 1, NULL, '2026-01-14 10:03:54', '2026-01-14 10:03:54'),
(6, 'Sarita', 1, NULL, '2026-01-14 10:09:56', '2026-01-14 10:20:55'),
(9, 'restaurant_order', 1, NULL, '2026-01-14 10:30:30', '2026-01-14 10:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `expense_sub_groups`
--

CREATE TABLE `expense_sub_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_sub_groups`
--

INSERT INTO `expense_sub_groups` (`id`, `group_id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'restaurant_orders', 1, NULL, '2026-01-14 03:29:02', '2026-01-14 04:04:33'),
(5, 4, 'fdghj', 1, NULL, '2026-01-14 10:22:18', '2026-01-14 10:22:29'),
(6, 1, 'restaurant_orders', 1, NULL, '2026-01-14 10:31:18', '2026-01-14 10:31:18'),
(7, 1, 'Sarita kumari', 1, NULL, '2026-01-14 10:32:27', '2026-01-14 10:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `e_wallets`
--

CREATE TABLE `e_wallets` (
  `id` bigint(20) NOT NULL,
  `owner_type` enum('company','branch','employee') NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `balance` decimal(12,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_wallets`
--

INSERT INTO `e_wallets` (`id`, `owner_type`, `owner_id`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'employee', 90, 1565.68, '2026-04-08 21:19:31', '2026-05-25 16:31:36'),
(2, 'employee', 92, 0.00, '2026-04-08 21:58:21', '2026-04-08 21:58:21'),
(3, 'company', 1, 0.00, '2026-04-08 21:59:43', '2026-04-08 21:59:43'),
(4, 'employee', 97, 731.37, '2026-04-11 01:21:41', '2026-04-12 00:57:55'),
(9, 'employee', 102, 251.05, '2026-04-11 21:56:10', '2026-04-12 15:59:18'),
(10, 'employee', 103, 101.00, '2026-04-11 22:11:48', '2026-04-11 22:11:48'),
(11, 'employee', 104, 101.00, '2026-04-11 22:33:33', '2026-04-11 22:33:33'),
(12, 'employee', 105, 101.00, '2026-04-11 23:43:35', '2026-04-11 23:43:35'),
(14, 'employee', 107, 251.05, '2026-04-12 00:05:33', '2026-04-12 00:57:55'),
(15, 'employee', 108, 101.00, '2026-04-12 00:27:59', '2026-04-12 00:27:59'),
(16, 'employee', 109, 101.00, '2026-04-12 00:39:45', '2026-04-12 00:39:45'),
(17, 'employee', 110, 101.00, '2026-04-12 01:03:01', '2026-04-12 01:03:01'),
(18, 'employee', 111, 101.00, '2026-04-12 16:13:55', '2026-04-12 16:13:55'),
(19, 'employee', 93, 0.00, '2026-04-15 06:11:44', '2026-04-15 06:11:44'),
(20, 'employee', 112, 0.00, '2026-04-29 21:58:16', '2026-04-29 21:58:16'),
(21, 'employee', 113, 0.00, '2026-04-29 22:34:08', '2026-04-29 22:34:08'),
(22, 'employee', 114, 101.00, '2026-05-14 18:56:41', '2026-05-14 18:56:41'),
(23, 'employee', 115, 0.00, '2026-05-21 14:22:54', '2026-05-21 14:22:54'),
(24, 'employee', 116, 804.04, '2026-05-21 15:06:20', '2026-05-25 16:31:36'),
(25, 'employee', 117, 804.04, '2026-05-21 15:07:27', '2026-05-25 16:31:36'),
(26, 'employee', 118, 804.04, '2026-05-21 15:08:38', '2026-05-25 16:31:36'),
(27, 'employee', 119, 0.00, '2026-05-21 15:27:33', '2026-05-21 15:27:33'),
(28, 'employee', 120, 0.00, '2026-05-21 15:29:10', '2026-05-21 15:29:10'),
(37, 'branch', 115, 1608.05, '2026-05-21 17:36:23', '2026-05-25 16:31:36'),
(38, 'employee', 91, 1608.05, '2026-05-21 17:36:23', '2026-05-25 16:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `e_wallet_transactions`
--

CREATE TABLE `e_wallet_transactions` (
  `id` bigint(20) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `type` enum('credit','debit') DEFAULT NULL,
  `balance_before` decimal(12,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `balance_after` decimal(12,2) NOT NULL DEFAULT 0.00,
  `credit_type` varchar(255) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_wallet_transactions`
--

INSERT INTO `e_wallet_transactions` (`id`, `wallet_id`, `type`, `balance_before`, `amount`, `balance_after`, `credit_type`, `district`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 'credit', 0.00, 150.05, 150.05, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 500723241673 | Name: SHILA DEVI | Father/Husband: Amit kumar yadav | Address: Nikhrail | Post: Nikhrail | Mobile: 7370050601', '2026-04-11 00:22:10', '2026-04-11 00:22:10'),
(2, 4, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, '101% Rs 101/- Amount received as Bonus for Prakhand Vivah Mitra Registration of SHILA DEVI (ID: 146491051)', '2026-04-11 01:21:41', '2026-04-11 01:21:41'),
(3, 4, 'credit', 0.00, 150.05, 251.05, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 504533534385 | Name: USHA DEVI | Father/Husband: RANJIT CHAUHAN | Address: GULABAG PURNEA | Post: GULABAG | Mobile: 8882973932', '2026-04-11 01:39:38', '2026-04-11 01:39:38'),
(4, 1, 'credit', 0.00, 30.17, 180.22, '3.02% Level 1 Incentive | Membership: 504533534385 | Name: USHA DEVI | Father/Husband: RANJIT CHAUHAN | Mobile: 8882973932', NULL, NULL, '2026-04-11 01:39:38', '2026-04-11 01:39:38'),
(5, 1, 'credit', 0.00, 150.05, 330.27, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 502811192005 | Name: MD LUKMAN | Father/Husband: MD JAMUDDIN | Address: Pokhariya | Post: Mufassil pokhariya | Mobile: 7519181217', '2026-04-11 13:27:53', '2026-04-11 13:27:53'),
(6, 1, 'credit', 0.00, 150.05, 480.32, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 505658470254 | Name: RANI KUMARI | Father/Husband: NA | Address: Purnea | Post: K hat | Mobile: 7667432479', '2026-04-11 21:44:16', '2026-04-11 21:44:16'),
(7, 9, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, '101% Rs 101/- Amount received as Bonus for Prakhand Vivah Mitra Registration of RANI KUMARI (ID: 141729431)', '2026-04-11 21:56:10', '2026-04-11 21:56:10'),
(8, 10, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, '101% Rs 101/- Amount received as Bonus for Prakhand Vivah Mitra Registration of MD LUKMAN (ID: 149386380)', '2026-04-11 22:11:48', '2026-04-11 22:11:48'),
(9, 1, 'credit', 0.00, 150.05, 630.37, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 502845700242 | Name: MUNNI DEVI | Father/Husband: NA | Address: MAHTA TOLA | Post: SHRI NAGAR | Mobile: 9693083570', '2026-04-11 22:30:11', '2026-04-11 22:30:11'),
(10, 11, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, '101% Rs 101/- Amount received as Bonus for Prakhand Vivah Mitra Registration of MUNNI DEVI (ID: 147237084)', '2026-04-11 22:33:33', '2026-04-11 22:33:33'),
(11, 12, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, '101% Rs 101/- Amount received as Bonus for Prakhand Vivah Mitra Registration of USHA DEVI (ID: 146273173)', '2026-04-11 23:43:35', '2026-04-11 23:43:35'),
(12, 4, 'credit', 0.00, 150.05, 401.10, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 508065153228 | Name: MUNNI DEVI | Father/Husband: PAPPU YADAV | Address: BABHANI | Post: BABHANI | Mobile: 9142095671', '2026-04-11 23:50:51', '2026-04-11 23:50:51'),
(13, 1, 'credit', 0.00, 30.17, 660.54, '3.02% Level 1 Incentive | Membership: 508065153228 | Name: MUNNI DEVI | Father/Husband: PAPPU YADAV | Mobile: 9142095671', NULL, NULL, '2026-04-11 23:50:51', '2026-04-11 23:50:51'),
(14, 14, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, 'Welcome Bonus for Panchayat Vivah Mitra Registration (Mobile: 8825171145)', '2026-04-12 00:05:33', '2026-04-12 00:05:33'),
(15, 4, 'credit', 0.00, 150.05, 551.15, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 507071472358 | Name: SIKHA DEVI | Father/Husband: DILIP DASH | Address: NIKHRAIL | Post: NIKHRAIL | Mobile: 9801080183', '2026-04-12 00:17:07', '2026-04-12 00:17:07'),
(16, 1, 'credit', 0.00, 30.17, 690.71, '3.02% Level 1 Incentive | Membership: 507071472358 | Name: SIKHA DEVI | Father/Husband: DILIP DASH | Mobile: 9801080183', NULL, NULL, '2026-04-12 00:17:07', '2026-04-12 00:17:07'),
(17, 15, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, 'Welcome Bonus for Panchayat Vivah Mitra Registration (Mobile: 9801080183)', '2026-04-12 00:27:59', '2026-04-12 00:27:59'),
(18, 4, 'credit', 0.00, 150.05, 701.20, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 506859017083 | Name: MUNNI HEMRAM | Father/Husband: ARJUN KUMAR TUDDU | Address: NAYA TOLA NIKHRAIL | Post: NIKHRAIL | Mobile: 7261887617', '2026-04-12 00:35:50', '2026-04-12 00:35:50'),
(19, 1, 'credit', 0.00, 30.17, 720.88, '3.02% Level 1 Incentive | Membership: 506859017083 | Name: MUNNI HEMRAM | Father/Husband: ARJUN KUMAR TUDDU | Mobile: 7261887617', NULL, NULL, '2026-04-12 00:35:50', '2026-04-12 00:35:50'),
(20, 16, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, 'Welcome Bonus for Panchayat Vivah Mitra Registration (Mobile: 7261887617)', '2026-04-12 00:39:45', '2026-04-12 00:39:45'),
(21, 14, 'credit', 0.00, 150.05, 251.05, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 503323669261 | Name: SUNITA DEVI | Father/Husband: PANKAJ RISHI | Address: NIKHRIL | Post: NIKHRIAL | Mobile: 9102076058', '2026-04-12 00:57:55', '2026-04-12 00:57:55'),
(22, 4, 'credit', 0.00, 30.17, 731.37, '3.02% Level 1 Incentive | Membership: 503323669261 | Name: SUNITA DEVI | Father/Husband: PANKAJ RISHI | Mobile: 9102076058', NULL, NULL, '2026-04-12 00:57:55', '2026-04-12 00:57:55'),
(23, 1, 'credit', 0.00, 10.59, 731.47, '1.06% Level 2 Incentive | Membership: 503323669261 | Name: SUNITA DEVI | Father/Husband: PANKAJ RISHI | Mobile: 9102076058', NULL, NULL, '2026-04-12 00:57:55', '2026-04-12 00:57:55'),
(24, 17, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, 'Welcome Bonus for Vivah Mitra Registration (Mobile: 9102076058)', '2026-04-12 01:03:01', '2026-04-12 01:03:01'),
(25, 9, 'credit', 0.00, 150.05, 251.05, 'physical_card_credit', NULL, '15.02% Incentive | Membership: 506915289402 | Name: RUTH TUDU | Father/Husband: EMEN SOREN | Address: BARETH  GARBANELI | Post: GARBANELI | Mobile: 7909092094', '2026-04-12 15:59:18', '2026-04-12 15:59:18'),
(26, 1, 'credit', 0.00, 30.17, 761.64, '3.02% Level 1 Incentive | Membership: 506915289402 | Name: RUTH TUDU | Father/Husband: EMEN SOREN | Mobile: 7909092094', NULL, NULL, '2026-04-12 15:59:18', '2026-04-12 15:59:18'),
(27, 18, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', NULL, 'Welcome Bonus for Panchayat Vivah Mitra Registration (Mobile: 7909092094)', '2026-04-12 16:13:55', '2026-04-12 16:13:55'),
(28, 22, 'credit', 0.00, 101.00, 101.00, 'welcome_bonus', 96, '101% Rs 101/- Amount received as Bonus for Prakhand Vivah Mitra Registration of SHILA DEVI (ID: 147464326)', '2026-05-14 18:56:41', '2026-05-14 18:56:41'),
(29, 37, 'credit', 0.00, 1255.70, 1255.70, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL, SHADI KA PACKAGE | Price: 125570', NULL, NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(30, 25, 'credit', 0.00, 627.85, 627.85, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL, SHADI KA PACKAGE | Price: 125570', NULL, NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(31, 24, 'credit', 0.00, 627.85, 627.85, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL, SHADI KA PACKAGE | Price: 125570', NULL, NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(32, 26, 'credit', 0.00, 627.85, 627.85, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL, SHADI KA PACKAGE | Price: 125570', NULL, NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(33, 38, 'credit', 0.00, 1255.70, 1255.70, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL, SHADI KA PACKAGE | Price: 125570', NULL, NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(34, 1, 'credit', 0.00, 627.85, 1389.49, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL, SHADI KA PACKAGE | Price: 125570', NULL, NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(35, 37, 'credit', 0.00, 117.45, 1373.15, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(36, 25, 'credit', 0.00, 58.73, 686.58, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(37, 24, 'credit', 0.00, 58.73, 686.58, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(38, 26, 'credit', 0.00, 58.73, 686.58, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(39, 38, 'credit', 0.00, 117.45, 1373.15, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(40, 1, 'credit', 0.00, 58.73, 1448.22, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(41, 37, 'credit', 0.00, 117.45, 1490.60, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(42, 25, 'credit', 0.00, 58.73, 745.31, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(43, 24, 'credit', 0.00, 58.73, 745.31, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(44, 26, 'credit', 0.00, 58.73, 745.31, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(45, 38, 'credit', 0.00, 117.45, 1490.60, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(46, 1, 'credit', 0.00, 58.73, 1506.95, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(47, 37, 'credit', 0.00, 117.45, 1608.05, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36'),
(48, 25, 'credit', 0.00, 58.73, 804.04, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36'),
(49, 24, 'credit', 0.00, 58.73, 804.04, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36'),
(50, 26, 'credit', 0.00, 58.73, 804.04, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36'),
(51, 38, 'credit', 0.00, 117.45, 1608.05, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36'),
(52, 1, 'credit', 0.00, 58.73, 1565.68, 'Sale Incentive | Member: RUTH TUDU | Membership: 506915289402 | Products: SHOWCASE TV MODEL | Price: 11745', NULL, NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36');

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
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `faq_type` int(11) DEFAULT NULL,
  `faq_category` int(11) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0-Common,1-Product,2-Service',
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currentdate` varchar(100) DEFAULT NULL,
  `currenttime` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `user_id`, `amount`, `currentdate`, `currenttime`, `created_at`, `updated_at`) VALUES
(1, 25, 10000, '10000', '10000', '2025-01-20 13:07:38', '2025-01-20 13:07:38'),
(2, 27, 65000, '65000', '65000', '2025-01-20 13:43:03', '2025-01-20 13:43:03'),
(3, 27, 7500, '7500', '7500', '2025-01-20 14:14:49', '2025-01-20 14:14:49'),
(4, 27, 10000, '10000', '10000', '2025-02-24 03:51:45', '2025-02-24 03:51:45'),
(5, 36, 2900, '2900', '2900', '2025-07-16 20:49:29', '2025-07-16 20:49:29'),
(6, 36, 10000, '10000', '10000', '2025-08-11 01:55:30', '2025-08-11 01:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `category_id`, `description`, `image`, `icon`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, '1756666912890.s-tech-computer-coaching-centre.jpg', NULL, 1, NULL, NULL, '2025-08-31 19:01:52', '2025-09-27 10:03:47', '2025-09-27 10:03:47'),
(2, 1, NULL, '1756666912904.19_11_2017_09_57_38_23bfbee4bc4777522b6c69c2666ec7c6_1d2b5uionj.jpg', NULL, 1, NULL, NULL, '2025-08-31 19:01:52', '2025-09-27 10:03:47', '2025-09-27 10:03:47'),
(3, 1, NULL, '1756666912360.computer-training-services-1699962656-7170586.jpeg', NULL, 1, NULL, NULL, '2025-08-31 19:01:52', '2025-09-27 10:03:47', '2025-09-27 10:03:47'),
(4, 1, NULL, '1756666912361.delhi-institute-of-computer-educ.jpg', NULL, 1, NULL, NULL, '2025-08-31 19:01:52', '2025-09-27 10:03:47', '2025-09-27 10:03:47'),
(5, 8, NULL, '1772388099956.IMG-20260301-WA0054.jpg', NULL, 1, NULL, NULL, '2026-03-01 18:01:39', '2026-03-02 18:45:07', '2026-03-02 18:45:07'),
(6, 11, NULL, '1772475846944.IMG20251128135412.jpg', NULL, 1, NULL, NULL, '2026-03-02 18:24:06', '2026-03-04 09:00:19', '2026-03-04 09:00:19'),
(7, 11, NULL, '1772475885147.IMG20260302154002.jpg', NULL, 1, NULL, NULL, '2026-03-02 18:24:45', '2026-03-04 09:00:14', '2026-03-04 09:00:14'),
(8, 11, NULL, '1772475945144.IMG_20260223_155642.jpg', NULL, 1, NULL, NULL, '2026-03-02 18:25:45', '2026-03-04 09:00:07', '2026-03-04 09:00:07'),
(9, 11, NULL, '1772475974832.IMG_20260227_134615.jpg', NULL, 1, NULL, NULL, '2026-03-02 18:26:14', '2026-03-04 09:00:02', '2026-03-04 09:00:02'),
(10, 10, NULL, '177247600545.img_1_1758537328714.jpg', NULL, 1, NULL, NULL, '2026-03-02 18:26:45', '2026-03-04 08:59:58', '2026-03-04 08:59:58'),
(11, 9, NULL, '1772476048616.IMG20260227115738.jpg', NULL, 1, NULL, NULL, '2026-03-02 18:27:28', '2026-03-04 08:59:52', '2026-03-04 08:59:52'),
(12, 19, NULL, '1772632204643.DSC_1073.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:50:04', '2026-03-30 15:32:15', '2026-03-30 15:32:15'),
(13, 19, NULL, '1772632232159.DSC_1072.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:50:32', '2026-03-30 15:32:19', '2026-03-30 15:32:19'),
(14, 19, NULL, '1772632264177.DSC_1071.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:51:04', '2026-03-30 15:31:53', '2026-03-30 15:31:53'),
(15, 19, NULL, '1772632295510.DSC_1069.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:51:35', '2026-03-30 15:31:48', '2026-03-30 15:31:48'),
(16, 19, NULL, '1772632317451.DSC_1068.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:51:57', '2026-03-30 15:31:41', '2026-03-30 15:31:41'),
(17, 19, NULL, '1772632353813.DSC_1067.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:52:33', '2026-03-30 15:32:02', '2026-03-30 15:32:02'),
(18, 19, NULL, '1772632377825.DSC_1066.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:52:57', '2026-03-30 15:29:57', '2026-03-30 15:29:57'),
(19, 19, NULL, '1772632398538.DSC_1065.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:53:18', '2026-03-30 15:32:25', '2026-03-30 15:32:25'),
(20, 19, NULL, '1772632422907.DSC_1064.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:53:42', '2026-03-30 15:29:37', '2026-03-30 15:29:37'),
(21, 19, NULL, '1772632451130.DSC_1063.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:54:11', '2026-03-30 15:29:13', '2026-03-30 15:29:13'),
(22, 19, NULL, '1772632488198.DSC_1062.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:54:48', '2026-03-30 15:29:48', '2026-03-30 15:29:48'),
(23, 19, NULL, '1772632571152.DSC_1228.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:56:11', '2026-03-30 15:29:25', '2026-03-30 15:29:25'),
(24, 19, NULL, '1772632610228.DSC_1235 - Copy.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:56:50', '2026-03-30 15:32:30', '2026-03-30 15:32:30'),
(25, 19, NULL, '1772632664319.DSC_1235 - Copy.JPG', NULL, 1, NULL, NULL, '2026-03-04 13:57:44', '2026-03-04 14:00:09', '2026-03-04 14:00:09'),
(26, 19, NULL, '1772632800163.DSC_1278.JPG', NULL, 1, NULL, NULL, '2026-03-04 14:00:01', '2026-03-30 15:28:31', '2026-03-30 15:28:31'),
(27, 19, NULL, '1772632840778.DSC_1279 - Copy.JPG', NULL, 1, NULL, NULL, '2026-03-04 14:00:40', '2026-03-30 15:28:36', '2026-03-30 15:28:36'),
(28, 19, NULL, '1772632867962.DSC_1281.JPG', NULL, 1, NULL, NULL, '2026-03-04 14:01:07', '2026-03-30 15:28:38', '2026-03-30 15:28:38'),
(29, 19, NULL, '1772632926871.DSC_1282 - Copy.JPG', NULL, 1, NULL, NULL, '2026-03-04 14:02:06', '2026-03-30 15:28:40', '2026-03-30 15:28:40'),
(30, 20, NULL, '1772633404460.ChatGPT Image Mar 4, 2026, 07_39_53 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:10:05', '2026-03-04 14:10:05', NULL),
(31, 20, NULL, '1772633468725.ChatGPT Image Mar 4, 2026, 07_40_31 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:11:08', '2026-03-04 14:11:08', NULL),
(32, 20, NULL, '1772633509634.ChatGPT Image Mar 4, 2026, 07_41_35 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:11:49', '2026-03-04 14:11:49', NULL),
(33, 20, NULL, '1772633638171.ChatGPT Image Mar 4, 2026, 07_43_54 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:13:58', '2026-03-04 14:13:58', NULL),
(34, 20, NULL, '1772633765348.ChatGPT Image Mar 4, 2026, 07_46_03 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:16:05', '2026-03-04 14:16:05', NULL),
(35, 20, NULL, '1772633918801.ChatGPT Image Mar 4, 2026, 07_46_03 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:18:38', '2026-03-04 14:19:51', '2026-03-04 14:19:51'),
(36, 20, NULL, '1772633947809.ChatGPT Image Mar 4, 2026, 07_49_04 PM.png', NULL, 1, NULL, NULL, '2026-03-04 14:19:07', '2026-03-04 14:19:07', NULL),
(37, 19, NULL, '1775930820300.webp', NULL, 1, NULL, NULL, '2026-04-11 18:07:04', '2026-04-11 18:07:04', NULL),
(38, 19, NULL, '1775930821464.webp', NULL, 1, NULL, NULL, '2026-04-11 18:07:04', '2026-04-11 18:07:04', NULL),
(39, 19, NULL, '1775930822994.webp', NULL, 1, NULL, NULL, '2026-04-11 18:07:04', '2026-04-11 18:07:04', NULL),
(40, 19, NULL, '1775930823400.webp', NULL, 1, NULL, NULL, '2026-04-11 18:07:04', '2026-04-11 18:07:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hire_teams`
--

CREATE TABLE `hire_teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `description`, `title`, `image`, `icon`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'From strong and stylish palang to modern washing machines, refrigerators, and Godrej home essentials — we bring comfort and convenience to your family..', 'Upgrade Your Home, Upgrade Your Life', 'uploads/all/1764788468462.png', NULL, 1, 1, NULL, '2025-12-03 13:11:43', '2025-12-03 13:31:08', NULL),
(4, 'Premium-quality palang, essential home appliances, and trusted brands delivered to your doorstep.!', 'Transform Your Home with Trusted Products', 'uploads/all/1764787381152.png', NULL, 1, 1, NULL, '2025-12-03 13:13:01', '2025-12-03 13:13:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_meeting_details`
--

CREATE TABLE `home_meeting_details` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `photo1` varchar(255) NOT NULL,
  `photo2` varchar(255) NOT NULL,
  `training_place` varchar(255) DEFAULT NULL,
  `training_address` text DEFAULT NULL,
  `district_name` varchar(150) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `supported_by` varchar(255) DEFAULT NULL,
  `total_vivah_mitra` int(11) DEFAULT 0,
  `total_panchayat_mitra` int(11) DEFAULT 0,
  `total_block_vivah_mitra` int(11) DEFAULT 0,
  `total_district_vivah_mitra` int(11) DEFAULT 0,
  `amount` float DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_meeting_details`
--

INSERT INTO `home_meeting_details` (`id`, `user_id`, `photo1`, `photo2`, `training_place`, `training_address`, `district_name`, `training_date`, `start_time`, `end_time`, `supported_by`, `total_vivah_mitra`, `total_panchayat_mitra`, `total_block_vivah_mitra`, `total_district_vivah_mitra`, `amount`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 90, 'uploads/members/photo11775089953.jpg', 'uploads/members/photo21775089953.jpg', 'Purnea', 'Hotel sanjay', 'Purnea', '2026-04-01', '06:01:00', '05:01:00', 'Ram ji', 2, 3, 6, 8, 30, 1, NULL, '2026-04-02 06:02:33', '2026-04-02 06:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `image_categories`
--

CREATE TABLE `image_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `english_title` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_categories`
--

INSERT INTO `image_categories` (`id`, `parent_id`, `title`, `description`, `english_title`, `image`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Nec Gallery', 'Nec Gallery', NULL, 'uploads/all/all-20250831190122-7474.webp', 'nec-gallery', 1, 1, NULL, '2025-08-31 13:31:23', '2025-09-27 10:03:47', '2025-09-27 10:03:47'),
(2, 0, '1st Batch ADCA Program Class', '1st Batch ADCA Program Class', NULL, 'uploads/all/all-20250927153433-4183.webp', '1st-batch-adca-program-class', 1, 1, NULL, '2025-09-27 10:04:33', '2025-09-28 04:15:01', '2025-09-28 04:15:01'),
(3, 0, '2nd Batch BCA Classroom Program', '2nd Batch BCA Classroom Program', NULL, 'uploads/all/all-20250927153509-264.webp', '2nd-batch-bca-classroom-program', 1, 1, NULL, '2025-09-27 10:05:09', '2025-09-28 04:14:41', '2025-09-28 04:14:41'),
(4, 0, '3rd Batch Classroom Program Photo', '3rd Batch Classroom Program Photo', NULL, 'uploads/all/all-20250927153534-8629.webp', '3rd-batch-classroom-program-photo', 1, 1, NULL, '2025-09-27 10:05:34', '2025-09-28 04:14:50', '2025-09-28 04:14:50'),
(5, 0, '1st Batch ADCA Program Class', '1st Batch ADCA Program Class', NULL, 'uploads/all/all-20250928094521-8401.webp', '1st-batch-adca-program-class', 1, 1, NULL, '2025-09-28 04:15:22', '2026-03-02 16:56:57', '2026-03-02 16:56:57'),
(6, 0, 'Hi', 'Tuuu', NULL, 'uploads/all/all-20260112235708-1703.webp', 'hi', 1, 1, NULL, '2026-01-12 23:57:08', '2026-03-04 09:01:05', '2026-03-04 09:01:05'),
(7, 0, 'Hello', 'H', NULL, 'uploads/all/all-20260301170045-8857.webp', 'hello', 1, 1, NULL, '2026-03-01 17:00:45', '2026-03-04 09:00:59', '2026-03-04 09:00:59'),
(8, 0, 'Meeting', 'Hii', NULL, 'uploads/all/all-20260301180037-7794.webp', 'meeting', 1, 1, NULL, '2026-03-01 18:00:38', '2026-03-04 09:00:55', '2026-03-04 09:00:55'),
(9, 0, 'सम्मान समारोह', 'सभी लीडर्स को यहां पर सम्मानित किया जाता है', NULL, 'uploads/all/all-20260302181852-5561.webp', 'samamana-samaraha', 1, 1, NULL, '2026-03-02 18:18:54', '2026-03-04 09:00:51', '2026-03-04 09:00:51'),
(10, 0, 'ट्रेनिंग प्रोग्राम', 'यहां सभी लीडर्स को ट्रेनिंग दी जाती है', NULL, 'uploads/all/all-20260302181959-4825.webp', 'taranaga-paragarama', 1, 1, NULL, '2026-03-02 18:19:59', '2026-03-04 09:00:47', '2026-03-04 09:00:47'),
(11, 0, 'स्टार बोनस प्रोग्राम', 'यहां पर प्रतिमा स्टार बोनस दिया जाता है', NULL, 'uploads/all/all-20260302182128-8558.webp', 'satara-bnasa-paragarama', 1, 1, NULL, '2026-03-02 18:21:28', '2026-03-04 09:00:43', '2026-03-04 09:00:43'),
(12, 0, 'विवाह मित्र प्रशिक्षण', 'विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304094700-6391.webp', 'vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 09:47:00', '2026-03-04 11:53:22', '2026-03-04 11:53:22'),
(13, 0, 'विवाह मित्र प्रशिक्षण', 'विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304115547-2568.webp', 'vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 11:55:47', '2026-03-04 11:57:56', '2026-03-04 11:57:56'),
(14, 0, 'विवाह मित्र प्रशिक्षण', 'विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304115813-5923.webp', 'vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 11:58:13', '2026-03-04 12:01:02', '2026-03-04 12:01:02'),
(15, 0, 'विवाह मित्र प्रशिक्षण', 'विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304120116-3374.webp', 'vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 12:01:16', '2026-03-04 12:01:16', NULL),
(16, 0, 'पंचायत विवाह मित्र प्रशिक्षण', 'पंचायत विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304121014-9474.webp', 'pacayata-vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 12:10:15', '2026-03-04 12:10:15', NULL),
(17, 0, 'प्रखंड विवाह मित्र प्रशिक्षण', 'प्रखंड विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304121555-2222.webp', 'parakhada-vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 12:15:55', '2026-03-04 12:15:55', NULL),
(18, 0, 'जिला विवाह मित्र प्रशिक्षण', 'जिला विवाह मित्र प्रशिक्षण', NULL, 'uploads/all/all-20260304121719-3695.webp', 'jal-vavaha-matara-parashakashhanae', 1, 1, NULL, '2026-03-04 12:17:19', '2026-03-04 12:17:19', NULL),
(19, 0, 'गिफ्ट वितरण एवं सम्मान समारोह', 'गिफ्ट वितरण एवं सम्मान समारोह', NULL, 'uploads/all/all-20260304122337-6808.webp', 'gafata-vataranae-eva-samamana-samaraha', 1, 1, NULL, '2026-03-04 12:23:37', '2026-03-04 12:23:37', NULL),
(20, 0, 'मंथली स्टार बोनस प्रोग्राम', 'मंथली स्टार बोनस प्रोग्राम', NULL, 'uploads/all/all-20260304122658-3025.webp', 'mathal-satara-bnasa-paragarama', 1, 1, NULL, '2026-03-04 12:26:59', '2026-03-04 12:26:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `industry_cms_pages`
--

CREATE TABLE `industry_cms_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industry_page_sections`
--

CREATE TABLE `industry_page_sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industry_section_datas`
--

CREATE TABLE `industry_section_datas` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1,
  `other` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_enquiries`
--

CREATE TABLE `job_enquiries` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `apply_for` varchar(255) NOT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_enquiries`
--

INSERT INTO `job_enquiries` (`id`, `first_name`, `last_name`, `phone`, `email`, `apply_for`, `gender`, `resume`, `post`, `city`, `pincode`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rana', '0', '9199758612', 'iamranasharma@gmail.com', '', NULL, 'resume-1717498679.pdf', NULL, NULL, NULL, 'ffff', 1, '2024-06-04 05:27:59', '2024-06-04 05:27:59'),
(2, 'Group Leader', '0', '9128528958', 'iamranasharma@gmail.com', 'office_boy', NULL, 'resume-1720596060.pdf', NULL, NULL, NULL, '65u56u56u56u', 1, '2024-07-10 01:51:00', '2024-07-10 01:51:00'),
(3, 'Group Leader', '0', '9128528958', 'iamranasharma@gmail.com', 'market_executive', NULL, 'resume-1720596253.pdf', NULL, NULL, NULL, 'fdgdfg', 1, '2024-07-10 01:54:13', '2024-07-10 01:54:13'),
(4, 'grsF', 'ggsV', '9631455125', 'iamranasharma@gmail.com', '21', NULL, 'resume-1721113619.pdf', NULL, NULL, NULL, 'Messagencgn', 1, '2024-07-16 01:36:59', '2024-07-16 01:36:59'),
(5, 'ronui', 'njnjnj', '9631455125', 'iamranasharma@gmail.com', 'Accountant', NULL, 'resume-1721114935.pdf', NULL, NULL, NULL, 'Message', 1, '2024-07-16 01:58:55', '2024-07-16 01:58:55'),
(6, 'ronui', 'njnjnj', '9631455125', 'iamranasharma@gmail.com', 'Accountant', NULL, 'resume-1721114948.pdf', NULL, NULL, NULL, 'Message', 1, '2024-07-16 01:59:08', '2024-07-16 01:59:08'),
(7, 'ronui', 'njnjnj', '9631455125', 'iamranasharma@gmail.com', 'Sales Executive', NULL, 'resume-1721115025.pdf', NULL, NULL, NULL, 'Messagexgxgfx', 1, '2024-07-16 02:00:25', '2024-07-16 02:00:25'),
(8, 'ronui', 'njnjnj', '9631455125', 'iamranasharma@gmail.com', 'Sales Executive', NULL, 'resume-1721115740.pdf', NULL, NULL, NULL, 'Messagexgxgfx', 1, '2024-07-16 02:12:20', '2024-07-16 02:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `kit_stocks`
--

CREATE TABLE `kit_stocks` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kit_stocks`
--

INSERT INTO `kit_stocks` (`id`, `user_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 93, 0, '2026-04-24 03:29:23', '2026-05-06 00:40:45'),
(2, 90, 0, '2026-04-24 03:40:03', '2026-05-06 00:40:45'),
(3, 112, 0, '2026-04-29 22:20:48', '2026-05-06 00:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `kit_transactions`
--

CREATE TABLE `kit_transactions` (
  `id` bigint(20) NOT NULL,
  `from_user_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `type` enum('issue','transfer','return') DEFAULT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `note` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manual_results`
--

CREATE TABLE `manual_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `franchise_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `subcourse_id` bigint(20) UNSIGNED NOT NULL,
  `result` varchar(255) NOT NULL,
  `passing_year` year(4) NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manual_results`
--

INSERT INTO `manual_results` (`id`, `student_id`, `franchise_id`, `course_id`, `subcourse_id`, `result`, `passing_year`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, 31, 16, 53, 'PASS', '2024', '1', '2025-04-05 13:44:22', '2025-04-05 13:44:22'),
(2, 1, 31, 16, 53, 'PASS', '2024', '2', '2025-04-05 13:54:30', '2025-04-05 13:54:30'),
(3, 2, 31, 16, 53, 'PASS', '2024', '1', '2025-04-05 15:23:07', '2025-04-05 15:23:07'),
(4, 2, 31, 16, 53, 'PASS', '2024', '2', '2025-04-05 15:27:26', '2025-04-05 15:27:26'),
(5, 3, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 01:52:17', '2025-04-06 01:52:17'),
(6, 3, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 02:10:02', '2025-04-06 02:10:02'),
(7, 3, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 02:21:52', '2025-04-06 02:21:52'),
(8, 4, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 04:59:36', '2025-04-06 04:59:36'),
(9, 4, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 05:03:40', '2025-04-06 05:03:40'),
(10, 5, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 05:08:13', '2025-04-06 05:08:13'),
(11, 5, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 05:11:49', '2025-04-06 05:11:49'),
(12, 6, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 05:23:54', '2025-04-06 05:23:54'),
(13, 6, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 05:27:15', '2025-04-06 05:27:15'),
(14, 7, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 05:36:39', '2025-04-06 05:36:39'),
(15, 7, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 05:39:39', '2025-04-06 05:39:39'),
(16, 8, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 05:45:31', '2025-04-06 05:45:31'),
(17, 8, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 05:48:47', '2025-04-06 05:48:47'),
(18, 9, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 06:00:46', '2025-04-06 06:00:46'),
(19, 9, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 06:04:19', '2025-04-06 06:04:19'),
(20, 10, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 06:09:34', '2025-04-06 06:09:34'),
(21, 10, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 06:14:40', '2025-04-06 06:14:40'),
(22, 11, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 06:19:04', '2025-04-06 06:19:04'),
(23, 11, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 06:23:10', '2025-04-06 06:23:10'),
(24, 12, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 06:27:29', '2025-04-06 06:27:29'),
(25, 12, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 06:29:59', '2025-04-06 06:29:59'),
(26, 13, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 06:48:23', '2025-04-06 06:48:23'),
(27, 13, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 06:51:24', '2025-04-06 06:51:24'),
(28, 14, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 06:55:47', '2025-04-06 06:55:47'),
(29, 14, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 06:58:36', '2025-04-06 06:58:36'),
(30, 15, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 07:03:26', '2025-04-06 07:03:26'),
(31, 15, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 07:06:27', '2025-04-06 07:06:27'),
(32, 16, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 07:16:15', '2025-04-06 07:16:15'),
(33, 16, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 07:20:44', '2025-04-06 07:20:44'),
(34, 17, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 07:25:49', '2025-04-06 07:25:49'),
(35, 17, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 07:30:25', '2025-04-06 07:30:25'),
(36, 18, 31, 16, 53, 'PASS', '2024', '1', '2025-04-06 07:35:24', '2025-04-06 07:35:24'),
(37, 18, 31, 16, 53, 'PASS', '2024', '2', '2025-04-06 07:38:32', '2025-04-06 07:38:32'),
(38, 19, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 05:50:59', '2025-04-07 05:50:59'),
(39, 19, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 05:58:04', '2025-04-07 05:58:04'),
(40, 20, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 06:29:53', '2025-04-07 06:29:53'),
(41, 20, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 06:44:45', '2025-04-07 06:44:45'),
(42, 21, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 07:06:02', '2025-04-07 07:06:02'),
(43, 21, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 07:18:26', '2025-04-07 07:18:26'),
(44, 22, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 07:56:15', '2025-04-07 07:56:15'),
(45, 22, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 08:00:13', '2025-04-07 08:00:13'),
(46, 23, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 11:30:38', '2025-04-07 11:30:38'),
(47, 23, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 11:35:14', '2025-04-07 11:35:14'),
(48, 24, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 11:56:13', '2025-04-07 11:56:13'),
(49, 24, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 12:03:16', '2025-04-07 12:03:16'),
(50, 25, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 12:33:41', '2025-04-07 12:33:41'),
(51, 25, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 12:40:26', '2025-04-07 12:40:26'),
(52, 26, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 13:03:27', '2025-04-07 13:03:27'),
(53, 26, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 13:08:34', '2025-04-07 13:08:34'),
(54, 33, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 13:52:34', '2025-04-07 13:52:34'),
(55, 33, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 13:57:42', '2025-04-07 13:57:42'),
(56, 27, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 22:36:22', '2025-04-07 22:36:22'),
(57, 27, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 22:39:12', '2025-04-07 22:39:12'),
(58, 28, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 22:59:44', '2025-04-07 22:59:44'),
(59, 28, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 23:03:12', '2025-04-07 23:03:12'),
(60, 29, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 23:30:04', '2025-04-07 23:30:04'),
(61, 29, 31, 16, 53, 'PASS', '2024', '2', '2025-04-07 23:38:20', '2025-04-07 23:38:20'),
(62, 30, 31, 16, 53, 'PASS', '2024', '1', '2025-04-07 23:57:07', '2025-04-07 23:57:07'),
(63, 30, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 00:04:17', '2025-04-08 00:04:17'),
(64, 31, 31, 16, 53, 'PASS', '2024', '1', '2025-04-08 00:46:42', '2025-04-08 00:46:42'),
(65, 31, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 00:55:40', '2025-04-08 00:55:40'),
(66, 32, 31, 16, 53, 'PASS', '2024', '1', '2025-04-08 01:12:10', '2025-04-08 01:12:10'),
(67, 32, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 01:16:10', '2025-04-08 01:16:10'),
(68, 34, 31, 16, 53, 'PASS', '2024', '1', '2025-04-08 01:36:09', '2025-04-08 01:36:09'),
(69, 34, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 01:40:55', '2025-04-08 01:40:55'),
(70, 35, 31, 16, 53, 'PASS', '2024', '1', '2025-04-08 02:01:52', '2025-04-08 02:01:52'),
(71, 35, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 02:22:19', '2025-04-08 02:22:19'),
(72, 36, 31, 16, 53, 'PASS', '2024', '1', '2025-04-08 03:56:40', '2025-04-08 03:56:40'),
(73, 36, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 04:00:53', '2025-04-08 04:00:53'),
(74, 37, 31, 16, 53, 'PASS', '2024', '1', '2025-04-08 04:43:56', '2025-04-08 04:43:56'),
(75, 37, 31, 16, 53, 'PASS', '2024', '2', '2025-04-08 04:48:03', '2025-04-08 04:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `manual_result_subjects`
--

CREATE TABLE `manual_result_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_id` bigint(20) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `full_marks` varchar(255) NOT NULL,
  `pass_marks` varchar(255) NOT NULL,
  `marks_obtained` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_agreements`
--

CREATE TABLE `master_agreements` (
  `id` int(11) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_agreements`
--

INSERT INTO `master_agreements` (`id`, `user_type`, `user_designation`, `title`, `file`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'Agreement 111', 'uploads/agreement/1764964207115.pdf', 1, 1, '2025-12-05 14:20:07', '2025-12-05 14:22:48'),
(2, 5, 4, 'समझौता पत्र', 'uploads/agreement/1765040091739.pdf', 1, 1, '2025-12-06 11:24:51', '2025-12-06 11:24:51'),
(3, 6, 8, 'काम कैसे करे', 'uploads/agreement/1765040138295.pdf', 1, 1, '2025-12-06 11:25:38', '2025-12-06 11:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `master_designations`
--

CREATE TABLE `master_designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `body` text DEFAULT NULL,
  `incentive` float DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_funds`
--

CREATE TABLE `master_funds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `type` enum('credit','debit') NOT NULL DEFAULT 'credit',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remarks` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_kit_numbers`
--

CREATE TABLE `master_kit_numbers` (
  `id` bigint(20) NOT NULL,
  `vivah_mitra_id` int(11) DEFAULT NULL,
  `kit_number` varchar(255) NOT NULL,
  `created_date` date DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT 0,
  `member_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `used_date` date DEFAULT NULL,
  `leader_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_old` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_kit_numbers`
--

INSERT INTO `master_kit_numbers` (`id`, `vivah_mitra_id`, `kit_number`, `created_date`, `is_used`, `member_id`, `created_by`, `used_date`, `leader_id`, `status`, `is_old`, `created_at`, `updated_at`) VALUES
(1, NULL, '14539047', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(2, NULL, '14637645', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(3, NULL, '14554504', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(4, NULL, '14842423', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(5, NULL, '14629159', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(6, NULL, '14624624', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(7, NULL, '14440993', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(8, NULL, '14029831', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(9, NULL, '14862990', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(10, NULL, '14862487', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(11, NULL, '14951958', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(12, NULL, '14232092', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(13, NULL, '14455264', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(14, NULL, '14366370', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(15, NULL, '14036132', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(16, NULL, '14597613', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(17, NULL, '14387591', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(18, NULL, '14963698', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(19, NULL, '14785754', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(20, NULL, '14573140', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(21, NULL, '14982678', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(22, NULL, '14496485', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(23, NULL, '14121075', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(24, NULL, '14602069', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(25, NULL, '14873445', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(26, NULL, '14672129', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(27, NULL, '14945219', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(28, NULL, '14691599', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(29, NULL, '14657053', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(30, NULL, '14024457', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(31, NULL, '14074835', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(32, NULL, '14721897', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(33, NULL, '14031367', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(34, NULL, '14438676', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(35, NULL, '14119853', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(36, NULL, '14417381', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(37, NULL, '14886281', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(38, NULL, '14414662', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(39, NULL, '14203547', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(40, NULL, '14947113', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(41, NULL, '14909138', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(42, NULL, '14035724', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(43, NULL, '14440920', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(44, NULL, '14384121', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(45, NULL, '14576275', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(46, NULL, '14343977', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(47, NULL, '14833430', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(48, NULL, '14784506', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(49, NULL, '14954359', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(50, NULL, '14252281', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:25:34', '2026-04-10 20:25:34'),
(51, NULL, '14677825', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(52, NULL, '14642322', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(53, NULL, '14582705', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(54, NULL, '14761251', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(55, NULL, '14321653', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(56, NULL, '14628848', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(57, NULL, '14009685', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(58, NULL, '14423382', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(59, NULL, '14472536', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(60, NULL, '14663656', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 10:47:54', '2026-04-21 10:47:54'),
(61, NULL, '14627982', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(62, NULL, '14061203', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(63, NULL, '14428774', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(64, NULL, '14192159', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(65, NULL, '14074079', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(66, NULL, '14054254', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(67, NULL, '14742984', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(68, NULL, '14898534', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(69, NULL, '14549307', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(70, NULL, '14159248', '2026-04-21', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-21 14:52:04', '2026-04-21 14:52:04'),
(71, NULL, '14528839', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(72, NULL, '14820725', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(73, NULL, '14544180', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(74, NULL, '14762938', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(75, NULL, '14359273', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(76, NULL, '14147773', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(77, NULL, '14086436', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(78, NULL, '14556425', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(79, NULL, '14422752', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25'),
(80, NULL, '14064494', '2026-04-22', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-22 21:42:25', '2026-04-22 21:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `master_memberships`
--

CREATE TABLE `master_memberships` (
  `id` bigint(20) NOT NULL,
  `vivah_mitra_id` int(11) DEFAULT NULL,
  `membership_number` varchar(255) NOT NULL,
  `created_date` date DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT 0,
  `member_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `used_date` date DEFAULT NULL,
  `leader_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_old` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_memberships`
--

INSERT INTO `master_memberships` (`id`, `vivah_mitra_id`, `membership_number`, `created_date`, `is_used`, `member_id`, `created_by`, `used_date`, `leader_id`, `status`, `is_old`, `created_at`, `updated_at`) VALUES
(1, NULL, '502479429587', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-18 20:09:41', '2025-12-18 20:09:41'),
(2, NULL, '503467413617', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(3, NULL, '509798853840', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(4, NULL, '509725941633', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(5, NULL, '500123803450', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(6, NULL, '508452781954', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(7, NULL, '505867029049', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(8, NULL, '503537642059', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(9, NULL, '506417141640', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(10, NULL, '505708164373', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(11, NULL, '503643202883', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(12, NULL, '502599592737', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(13, NULL, '509730456393', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(14, NULL, '502784066864', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(15, NULL, '502612652861', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(16, NULL, '502192609092', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(17, NULL, '507933776143', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(18, NULL, '507494150180', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(19, NULL, '507880052764', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(20, NULL, '508849603454', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(21, NULL, '508450173430', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(22, NULL, '501064824902', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(23, NULL, '507056543497', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(24, NULL, '504190036950', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(25, NULL, '502251432027', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:53:59', '2025-12-19 06:53:59'),
(26, NULL, '505648342930', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(27, NULL, '505089279984', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(28, NULL, '505124185805', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(29, NULL, '509668092941', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(30, NULL, '503543176067', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(31, NULL, '504086400333', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(32, NULL, '508630783193', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(33, NULL, '501185272472', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(34, NULL, '500895979721', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(35, NULL, '507951148063', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(36, NULL, '507684683170', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(37, NULL, '506607012385', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(38, NULL, '505056168584', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(39, NULL, '507690317522', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(40, NULL, '509295260138', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(41, NULL, '509408975387', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(42, NULL, '504594867737', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(43, NULL, '505589875448', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(44, NULL, '507114026169', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(45, NULL, '504250917013', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(46, NULL, '505277482036', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(47, NULL, '505461399452', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(48, NULL, '504164614049', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(49, NULL, '504798365651', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(50, NULL, '503667301849', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:58:52', '2025-12-19 06:58:52'),
(51, NULL, '509492958095', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(52, NULL, '505242065832', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(53, NULL, '501632752448', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(54, NULL, '508171960633', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(55, NULL, '502654865760', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(56, NULL, '508539399679', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(57, NULL, '500977486148', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(58, NULL, '501098556103', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(59, NULL, '503520075548', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(60, NULL, '503030761969', '2025-12-19', 0, 1, 1, '2025-12-23', 49, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(61, NULL, '508840617206', '2025-12-19', 0, 7, 1, '2025-12-26', 49, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(62, NULL, '509831759269', '2025-12-19', 0, 8, 1, '2025-12-30', 49, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(63, NULL, '509264135007', '2025-12-19', 0, 9, 1, '2025-12-30', 49, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(64, NULL, '504414123742', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(65, NULL, '501869078830', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(66, NULL, '503023480003', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(67, NULL, '504278012441', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(68, NULL, '505567797428', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(69, NULL, '504857119951', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(70, NULL, '504367758469', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(71, NULL, '502994165573', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(72, NULL, '500427997325', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(73, NULL, '501870351941', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(74, NULL, '509985815652', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(75, NULL, '503300925591', '2025-12-19', 0, 11, 1, '2026-01-15', 49, 0, 0, '2025-12-19 06:59:09', '2025-12-19 06:59:09'),
(76, NULL, '503213964712', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(77, NULL, '503436046364', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(78, NULL, '507930856411', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(79, NULL, '507338487173', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(80, NULL, '506192484777', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(81, NULL, '504544518737', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(82, NULL, '503478154206', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(83, NULL, '504857736869', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(84, NULL, '509971031598', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(85, NULL, '505992655106', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(86, NULL, '500144687628', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(87, NULL, '503123374052', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(88, NULL, '500653285225', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(89, NULL, '507512658311', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(90, NULL, '505049669929', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(91, NULL, '505354649375', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(92, NULL, '503021421147', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(93, NULL, '504679165389', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(94, NULL, '505889685432', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(95, NULL, '501551279684', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(96, NULL, '503894719363', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(97, NULL, '507856240957', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(98, NULL, '501205215298', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(99, NULL, '505943357811', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(100, NULL, '509795456245', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:07:38', '2025-12-19 07:07:38'),
(101, NULL, '509467684282', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(102, NULL, '507074424739', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(103, NULL, '506686191885', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(104, NULL, '507267931755', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(105, NULL, '505462025954', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(106, NULL, '505923682554', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(107, NULL, '502387258677', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(108, NULL, '504850901204', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(109, NULL, '504665345623', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(110, NULL, '503439643256', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(111, NULL, '500278570653', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(112, NULL, '505888943184', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(113, NULL, '505626095403', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(114, NULL, '500985232092', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(115, NULL, '504969826201', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(116, NULL, '504345604264', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(117, NULL, '506872676876', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(118, NULL, '507139342908', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(119, NULL, '508236932438', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(120, NULL, '505938617471', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(121, NULL, '500223431102', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(122, NULL, '502452015665', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(123, NULL, '508482850165', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(124, NULL, '503105744599', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(125, NULL, '508869799718', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:09:37', '2025-12-19 07:09:37'),
(126, NULL, '502324310687', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(127, NULL, '507820279154', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(128, NULL, '509091145754', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(129, NULL, '505449274744', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(130, NULL, '501437548143', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(131, NULL, '509104657476', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(132, NULL, '501817465325', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(133, NULL, '501309668418', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(134, NULL, '503414468559', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(135, NULL, '500048892727', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(136, NULL, '506701549486', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(137, NULL, '501529632716', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(138, NULL, '504703065342', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(139, NULL, '505751315276', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(140, NULL, '507804011665', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(141, NULL, '502515599623', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(142, NULL, '507611918158', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(143, NULL, '504260472243', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(144, NULL, '509827686354', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(145, NULL, '503196644146', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(146, NULL, '503163517160', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(147, NULL, '501466287997', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(148, NULL, '509450381687', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(149, NULL, '509109359440', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(150, NULL, '507511327592', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:14:41', '2025-12-19 07:14:41'),
(151, NULL, '501773382074', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(152, NULL, '505123673663', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(153, NULL, '505849504442', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(154, NULL, '502688236249', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(155, NULL, '503515334285', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(156, NULL, '505727874514', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(157, NULL, '507744653919', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(158, NULL, '509457717133', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(159, NULL, '502666323377', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(160, NULL, '502886643597', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(161, NULL, '505493155284', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(162, NULL, '506882460853', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(163, NULL, '506362915176', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(164, NULL, '503857397784', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(165, NULL, '507988454723', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(166, NULL, '505639877912', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(167, NULL, '509219088173', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(168, NULL, '509605405527', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(169, NULL, '508992497754', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(170, NULL, '502404768242', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(171, NULL, '504456660895', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(172, NULL, '502331159870', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(173, NULL, '501151948977', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(174, NULL, '509499816712', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(175, NULL, '506261484579', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:17:40', '2025-12-19 07:17:40'),
(176, NULL, '500602294642', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(177, NULL, '505291550030', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(178, NULL, '500393015450', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(179, NULL, '504317844836', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(180, NULL, '508184725637', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(181, NULL, '501978376875', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(182, NULL, '508288698334', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(183, NULL, '504163484802', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(184, NULL, '503528642031', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(185, NULL, '501771066035', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(186, NULL, '502823912225', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(187, NULL, '505363319864', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(188, NULL, '505095871275', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(189, NULL, '501326637055', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(190, NULL, '503806957468', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(191, NULL, '507944788852', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(192, NULL, '505840701309', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(193, NULL, '508979534941', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(194, NULL, '508395345402', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(195, NULL, '502068948775', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(196, NULL, '500271712049', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(197, NULL, '507810142328', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(198, NULL, '506021851760', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(199, NULL, '504749893412', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(200, NULL, '503576615066', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:20:19', '2025-12-19 07:20:19'),
(201, NULL, '509117066014', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(202, NULL, '500428450418', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(203, NULL, '500185631254', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(204, NULL, '503115674205', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(205, NULL, '501076746364', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(206, NULL, '508221610471', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(207, NULL, '507248499404', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(208, NULL, '501064890671', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(209, NULL, '502475713939', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(210, NULL, '500596359155', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(211, NULL, '509066762931', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(212, NULL, '504096398597', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(213, NULL, '506434626526', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(214, NULL, '503262982429', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(215, NULL, '506198183733', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(216, NULL, '507087333864', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(217, NULL, '507880856816', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(218, NULL, '503860507222', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(219, NULL, '509894344098', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(220, NULL, '504822475385', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(221, NULL, '507132163271', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(222, NULL, '503685970133', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(223, NULL, '507666403038', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(224, NULL, '509133039387', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(225, NULL, '503116942339', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:23:25', '2025-12-19 07:23:25'),
(226, NULL, '503215329655', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(227, NULL, '503352372071', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(228, NULL, '508219942590', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(229, NULL, '503609166141', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(230, NULL, '500964077487', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(231, NULL, '506912329334', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(232, NULL, '506631424484', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(233, NULL, '503219313397', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(234, NULL, '509930991576', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(235, NULL, '503863023384', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(236, NULL, '500632011971', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(237, NULL, '502242861662', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(238, NULL, '507188386054', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(239, NULL, '509190641065', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(240, NULL, '508322197369', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(241, NULL, '508918538576', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(242, NULL, '503849280771', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(243, NULL, '505065804730', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(244, NULL, '506049622337', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(245, NULL, '505743055481', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(246, NULL, '509073158201', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(247, NULL, '506532459830', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(248, NULL, '508558005303', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(249, NULL, '509161045385', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(250, NULL, '505659267331', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:28:52', '2025-12-19 07:28:52'),
(251, NULL, '508865407466', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(252, NULL, '505301708808', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(253, NULL, '506688762344', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(254, NULL, '506449565864', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(255, NULL, '502728072822', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(256, NULL, '501624761337', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(257, NULL, '503982624015', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(258, NULL, '508942320070', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(259, NULL, '506995697188', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(260, NULL, '509129233090', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(261, NULL, '501361656287', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(262, NULL, '504001206524', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(263, NULL, '509187418936', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(264, NULL, '505863126955', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(265, NULL, '508521124470', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(266, NULL, '503121245362', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(267, NULL, '507512306058', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(268, NULL, '508797834276', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(269, NULL, '505521671966', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(270, NULL, '503572854700', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(271, NULL, '508257228185', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(272, NULL, '500027228068', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(273, NULL, '504570812831', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(274, NULL, '508682348767', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(275, NULL, '500619728080', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:31:07', '2025-12-19 07:31:07'),
(276, NULL, '502322549605', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(277, NULL, '500879497078', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(278, NULL, '509344135879', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(279, NULL, '505154178312', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(280, NULL, '505451563062', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(281, NULL, '500017151069', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(282, NULL, '502733237841', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(283, NULL, '507169396376', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(284, NULL, '504220682808', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(285, NULL, '500564094022', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(286, NULL, '509411459968', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(287, NULL, '507381364190', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(288, NULL, '507353347843', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(289, NULL, '506880298005', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(290, NULL, '508396131312', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(291, NULL, '507440504487', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(292, NULL, '500708034923', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(293, NULL, '500537139077', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(294, NULL, '501266520817', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(295, NULL, '507886489843', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(296, NULL, '507991111599', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(297, NULL, '507964008711', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(298, NULL, '501421838334', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(299, NULL, '501660588105', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(300, NULL, '506809726886', '2025-12-19', 0, NULL, 1, NULL, NULL, 0, 0, '2025-12-19 07:34:11', '2025-12-19 07:34:11'),
(301, NULL, '506857702065', '2025-12-25', 0, 2, 49, '2025-12-25', 49, 0, 0, '2025-12-25 14:31:08', '2025-12-25 14:31:08'),
(302, NULL, '500674521664', '2025-12-25', 0, 3, 49, '2025-12-25', 49, 0, 0, '2025-12-25 14:37:41', '2025-12-25 14:37:41'),
(303, NULL, '509867940946', '2025-12-25', 0, 4, 49, '2025-12-25', 49, 0, 0, '2025-12-25 14:47:41', '2025-12-25 14:47:41'),
(304, NULL, '506542650251', '2025-12-26', 0, 5, 49, '2025-12-26', 49, 0, 0, '2025-12-26 12:25:22', '2025-12-26 12:25:22'),
(305, NULL, '503366609916', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(306, NULL, '500048318682', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(307, NULL, '504962698875', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(308, NULL, '500023935603', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(309, NULL, '505397896501', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(310, NULL, '505738017679', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(311, NULL, '501478171183', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(312, NULL, '505715402370', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(313, NULL, '508082975648', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(314, NULL, '500218749969', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:04:16', '2026-01-07 10:04:16'),
(315, NULL, '505334577250', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(316, NULL, '505819956486', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(317, NULL, '505858053680', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(318, NULL, '503611886091', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(319, NULL, '504087888792', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(320, NULL, '502285989034', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(321, NULL, '509677758507', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(322, NULL, '506518809065', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(323, NULL, '503031023861', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(324, NULL, '508485704104', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:07:49', '2026-01-07 10:07:49'),
(325, NULL, '505144543969', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(326, NULL, '508243300227', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(327, NULL, '503439161094', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(328, NULL, '508062321879', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(329, NULL, '506254496412', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(330, NULL, '505231317950', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(331, NULL, '503130235027', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(332, NULL, '504171619967', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(333, NULL, '509454271272', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(334, NULL, '503036785264', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 10:10:32', '2026-01-07 10:10:32'),
(335, NULL, '509238926617', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(336, NULL, '502668424626', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(337, NULL, '507800727983', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(338, NULL, '502594496563', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(339, NULL, '501950934023', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(340, NULL, '503718374862', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(341, NULL, '505277457849', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(342, NULL, '501051227599', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(343, NULL, '503260213224', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(344, NULL, '504508942863', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:32:18', '2026-01-07 11:32:18'),
(345, NULL, '509822486085', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(346, NULL, '509581100422', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(347, NULL, '500197479189', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(348, NULL, '509889931125', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(349, NULL, '501566317180', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(350, NULL, '506497762606', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(351, NULL, '501751919005', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(352, NULL, '502189724431', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(353, NULL, '507221642419', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(354, NULL, '504016014496', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:41:06', '2026-01-07 11:41:06'),
(355, NULL, '509355420630', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(356, NULL, '507081696254', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(357, NULL, '504246073146', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(358, NULL, '501225997776', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(359, NULL, '503576777066', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(360, NULL, '502799776552', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(361, NULL, '507896654957', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(362, NULL, '502723822321', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(363, NULL, '506128769455', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(364, NULL, '504623964347', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:44:32', '2026-01-07 11:44:32'),
(365, NULL, '509007253136', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(366, NULL, '504713744653', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(367, NULL, '502752630721', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(368, NULL, '500321610198', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(369, NULL, '505391176850', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(370, NULL, '501905477960', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(371, NULL, '508566918695', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(372, NULL, '505652935076', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(373, NULL, '504269581119', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(374, NULL, '508745153508', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:46:21', '2026-01-07 11:46:21'),
(375, NULL, '508932383207', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(376, NULL, '505292737393', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(377, NULL, '502523033010', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(378, NULL, '505510661228', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(379, NULL, '508209934105', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(380, NULL, '508146714066', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(381, NULL, '505013095619', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(382, NULL, '500111280562', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(383, NULL, '508599791112', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(384, NULL, '505164360457', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:48:23', '2026-01-07 11:48:23'),
(385, NULL, '503359786021', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(386, NULL, '509447306735', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(387, NULL, '507434364579', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(388, NULL, '504450175372', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(389, NULL, '501269539415', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(390, NULL, '501327634244', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(391, NULL, '508737160150', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(392, NULL, '500333755188', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(393, NULL, '506312317275', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(394, NULL, '508888115605', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:50:54', '2026-01-07 11:50:54'),
(395, NULL, '507999937244', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(396, NULL, '500567736980', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(397, NULL, '504612772145', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(398, NULL, '502398781712', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(399, NULL, '505368864298', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(400, NULL, '505291480456', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(401, NULL, '501269585436', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(402, NULL, '509819684797', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(403, NULL, '505525072476', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(404, NULL, '503493941273', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:53:21', '2026-01-07 11:53:21'),
(405, NULL, '503530778025', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(406, NULL, '508045762085', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(407, NULL, '505253353479', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(408, NULL, '505708778676', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(409, NULL, '505315513660', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(410, NULL, '507949064996', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(411, NULL, '501850425036', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(412, NULL, '506644827369', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(413, NULL, '500774755045', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(414, NULL, '509954477634', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:55:34', '2026-01-07 11:55:34'),
(415, NULL, '506910371967', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(416, NULL, '508919838015', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(417, NULL, '505926156589', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(418, NULL, '503839064583', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(419, NULL, '501610909371', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(420, NULL, '509427137724', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(421, NULL, '508393825190', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(422, NULL, '501022725336', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(423, NULL, '500168167769', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(424, NULL, '500992300843', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 11:57:16', '2026-01-07 11:57:16'),
(425, NULL, '507040436706', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(426, NULL, '504257708843', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06');
INSERT INTO `master_memberships` (`id`, `vivah_mitra_id`, `membership_number`, `created_date`, `is_used`, `member_id`, `created_by`, `used_date`, `leader_id`, `status`, `is_old`, `created_at`, `updated_at`) VALUES
(427, NULL, '507794653270', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(428, NULL, '505475154756', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(429, NULL, '500737281684', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(430, NULL, '500054712282', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(431, NULL, '506507615604', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(432, NULL, '502428542244', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(433, NULL, '505088947935', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(434, NULL, '509995360453', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:00:06', '2026-01-07 12:00:06'),
(435, NULL, '505168881531', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(436, NULL, '503044156925', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(437, NULL, '509315756229', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(438, NULL, '507603074582', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(439, NULL, '508712268063', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(440, NULL, '500258637994', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(441, NULL, '505190237551', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(442, NULL, '507327949668', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(443, NULL, '509013433342', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(444, NULL, '509194382920', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:01:44', '2026-01-07 12:01:44'),
(445, NULL, '502829275822', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(446, NULL, '501294727119', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(447, NULL, '506864968297', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(448, NULL, '500677350168', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(449, NULL, '508665320732', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(450, NULL, '501185686514', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(451, NULL, '504232223962', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(452, NULL, '500381449003', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(453, NULL, '505628445368', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(454, NULL, '509824666847', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:03:29', '2026-01-07 12:03:29'),
(455, NULL, '501223321386', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(456, NULL, '509457850707', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(457, NULL, '502775351728', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(458, NULL, '500040489611', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(459, NULL, '506544342125', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(460, NULL, '501184346213', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(461, NULL, '500424327389', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(462, NULL, '506057401348', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(463, NULL, '502942021057', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(464, NULL, '509670998351', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:05:36', '2026-01-07 12:05:36'),
(465, NULL, '509079395287', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(466, NULL, '506052217777', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(467, NULL, '506999578836', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(468, NULL, '501420619975', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(469, NULL, '503770673165', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(470, NULL, '505743311704', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(471, NULL, '501733869876', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(472, NULL, '506229555011', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(473, NULL, '504860205919', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(474, NULL, '508440588360', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:07:33', '2026-01-07 12:07:33'),
(475, NULL, '502689510514', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(476, NULL, '505585861392', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(477, NULL, '508366471981', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(478, NULL, '509883990057', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(479, NULL, '509183788938', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(480, NULL, '507548784513', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(481, NULL, '501722350579', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(482, NULL, '502687631727', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(483, NULL, '506941124403', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(484, NULL, '508425692903', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:09:08', '2026-01-07 12:09:08'),
(485, NULL, '508548526364', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(486, NULL, '501433467927', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(487, NULL, '503111614419', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(488, NULL, '502994723471', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(489, NULL, '500598069228', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(490, NULL, '502113195275', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(491, NULL, '506966240585', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(492, NULL, '504486932552', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(493, NULL, '505384122947', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(494, NULL, '507759094803', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:21:01', '2026-01-07 12:21:01'),
(495, NULL, '500405948589', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(496, NULL, '509796598120', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(497, NULL, '502776826861', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(498, NULL, '506862009807', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(499, NULL, '507427547770', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(500, NULL, '501704398998', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(501, NULL, '503138057361', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(502, NULL, '501717584372', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(503, NULL, '507123984670', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(504, NULL, '504228213606', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:23:51', '2026-01-07 12:23:51'),
(505, NULL, '509754695258', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(506, NULL, '501799298545', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(507, NULL, '503493481960', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(508, NULL, '505146191872', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(509, NULL, '503253282674', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(510, NULL, '507270962361', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(511, NULL, '507897418311', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(512, NULL, '507898764834', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(513, NULL, '509256541698', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(514, NULL, '506101009933', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:27:34', '2026-01-07 12:27:34'),
(515, NULL, '507895068058', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(516, NULL, '500098587801', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(517, NULL, '500874284699', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(518, NULL, '503952833109', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(519, NULL, '507458304404', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(520, NULL, '505836651363', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(521, NULL, '504506583670', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(522, NULL, '503312138750', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(523, NULL, '506978796082', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(524, NULL, '502788853555', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:32:44', '2026-01-07 12:32:44'),
(525, NULL, '501128615805', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(526, NULL, '506971684981', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(527, NULL, '509492119711', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(528, NULL, '501670687957', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(529, NULL, '504854518708', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(530, NULL, '501647948199', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(531, NULL, '504219655257', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(532, NULL, '503416525530', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(533, NULL, '504726637117', '2026-01-07', 0, NULL, 1, NULL, NULL, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(534, NULL, '501348630352', '2026-01-07', 0, 18, 1, '2026-03-02', 85, 0, 0, '2026-01-07 12:37:32', '2026-01-07 12:37:32'),
(535, NULL, '504449984482', '2026-01-15', 0, 10, 49, '2026-01-15', 49, 0, 0, '2026-01-15 15:22:03', '2026-01-15 15:22:03'),
(536, NULL, '507179452372', '2026-02-13', 0, 12, 85, '2026-02-13', 85, 0, 0, '2026-02-13 18:33:34', '2026-02-13 18:33:34'),
(537, NULL, '506753076309', '2026-02-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-02-14 15:59:29', '2026-02-14 15:59:29'),
(538, NULL, '501384915793', '2026-02-14', 0, 15, 1, '2026-02-24', 85, 0, 0, '2026-02-14 16:17:25', '2026-02-14 16:17:25'),
(539, NULL, '504781149972', '2026-02-21', 0, 13, 85, '2026-02-21', 85, 0, 0, '2026-02-21 17:37:57', '2026-02-21 17:37:57'),
(540, NULL, '508734090010', '2026-02-23', 0, 14, 49, '2026-02-23', 49, 0, 0, '2026-02-23 17:00:32', '2026-02-23 17:00:32'),
(541, NULL, '507745077495', '2026-02-28', 0, NULL, 1, NULL, NULL, 0, 0, '2026-02-28 10:44:22', '2026-02-28 10:44:22'),
(542, NULL, '505952629604', '2026-02-28', 0, NULL, 1, NULL, NULL, 0, 0, '2026-02-28 10:44:22', '2026-02-28 10:44:22'),
(543, NULL, '502422128771', '2026-02-28', 0, NULL, 1, NULL, NULL, 0, 0, '2026-02-28 10:44:22', '2026-02-28 10:44:22'),
(544, NULL, '507237723460', '2026-02-28', 0, NULL, 1, NULL, NULL, 0, 0, '2026-02-28 10:44:22', '2026-02-28 10:44:22'),
(545, 90, '507525014653', '2026-02-28', 1, 1, 1, '2026-03-18', 90, 0, 0, '2026-02-28 10:44:22', '2026-02-28 10:44:22'),
(546, NULL, '501113713784', '2026-03-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 17:03:54', '2026-03-02 17:03:54'),
(547, NULL, '507048612233', '2026-03-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 17:03:54', '2026-03-02 17:03:54'),
(548, NULL, '506613860721', '2026-03-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 17:03:54', '2026-03-02 17:03:54'),
(549, NULL, '504619388365', '2026-03-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 17:03:54', '2026-03-02 17:03:54'),
(550, NULL, '504082905086', '2026-03-02', 0, 17, 1, '2026-03-02', 85, 0, 0, '2026-03-02 17:03:54', '2026-03-02 17:03:54'),
(551, NULL, '502796943049', '2026-03-03', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 18:46:43', '2026-03-02 18:46:43'),
(552, NULL, '509239409257', '2026-03-03', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 18:46:43', '2026-03-02 18:46:43'),
(553, NULL, '503249587020', '2026-03-03', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-02 18:46:43', '2026-03-02 18:46:43'),
(554, NULL, '504444760746', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(555, NULL, '502360637039', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(556, NULL, '509725548415', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(557, NULL, '500442056385', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(558, NULL, '506484185232', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(559, NULL, '504266420298', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(560, NULL, '509738362153', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(561, NULL, '509465709619', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(562, NULL, '504353070074', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(563, NULL, '509861599895', '2026-03-04', 0, NULL, 1, NULL, NULL, 0, 0, '2026-03-04 08:44:12', '2026-03-04 08:44:12'),
(564, NULL, '506483670220', '2026-03-07', 0, NULL, NULL, NULL, NULL, 0, 0, '2026-03-07 17:58:13', '2026-03-07 17:58:13'),
(565, NULL, '509984090837', '2026-04-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-02 21:45:15', '2026-04-02 21:45:15'),
(566, NULL, '509029504132', '2026-04-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-02 21:45:28', '2026-04-02 21:45:28'),
(567, NULL, '507718991157', '2026-04-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-02 21:45:28', '2026-04-02 21:45:28'),
(568, NULL, '502615990431', '2026-04-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-02 21:45:28', '2026-04-02 21:45:28'),
(569, NULL, '500142485100', '2026-04-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-02 21:45:28', '2026-04-02 21:45:28'),
(570, NULL, '509660702253', '2026-04-02', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-02 21:45:28', '2026-04-02 21:45:28'),
(571, 90, '500723241673', '2026-04-10', 1, 2, 1, '2026-04-11', 90, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(572, 97, '504533534385', '2026-04-10', 1, 3, 1, '2026-04-11', 97, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(573, 90, '502811192005', '2026-04-10', 1, 4, 1, '2026-04-11', 90, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(574, 97, '507071472358', '2026-04-10', 1, 8, 1, '2026-04-12', 97, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(575, NULL, '504649690672', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(576, 97, '508065153228', '2026-04-10', 1, 7, 1, '2026-04-11', 97, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(577, NULL, '501001426972', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(578, NULL, '504458384308', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(579, NULL, '505509035409', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(580, NULL, '500174857424', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(581, NULL, '504928665348', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(582, NULL, '503286416479', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(583, NULL, '508088831565', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(584, NULL, '505877849156', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(585, NULL, '503215085234', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(586, NULL, '509773279693', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(587, 97, '506859017083', '2026-04-10', 1, 9, 1, '2026-04-12', 97, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(588, NULL, '503118402650', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(589, NULL, '501117074964', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(590, NULL, '507685515622', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(591, NULL, '503747348664', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(592, NULL, '508858538181', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(593, NULL, '501108176302', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(594, NULL, '507950708140', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(595, NULL, '502079755449', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(596, NULL, '502491307877', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(597, NULL, '503962526873', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(598, NULL, '508100719516', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(599, NULL, '509766057401', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(600, NULL, '501980809280', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(601, NULL, '506622155913', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(602, NULL, '509466971318', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(603, NULL, '501274216446', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(604, NULL, '505643658739', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(605, NULL, '501799968927', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(606, NULL, '505018623571', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(607, NULL, '506599599852', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(608, NULL, '501999433355', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(609, NULL, '508871088501', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(610, NULL, '505005508746', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(611, NULL, '505118206202', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(612, NULL, '502328331543', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(613, NULL, '507798663674', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(614, NULL, '504527876784', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(615, NULL, '500845690046', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(616, NULL, '509078761711', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(617, NULL, '502380271776', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(618, NULL, '501448881730', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(619, NULL, '503813685397', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(620, NULL, '507142743898', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(621, NULL, '508297297943', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(622, NULL, '508074325280', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(623, NULL, '501097857337', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(624, NULL, '505987436602', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(625, NULL, '506970362779', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(626, NULL, '508025385133', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(627, NULL, '508028552938', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(628, NULL, '500257463381', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(629, 102, '506915289402', '2026-04-10', 1, 11, 1, '2026-04-12', 102, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(630, NULL, '506841882229', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(631, NULL, '501415588481', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(632, NULL, '504240796091', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(633, NULL, '507809023069', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(634, NULL, '509438465509', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(635, 107, '503323669261', '2026-04-10', 1, 10, 1, '2026-04-12', 107, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(636, NULL, '509769973666', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(637, NULL, '503136216420', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(638, NULL, '503089633347', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(639, NULL, '503658101795', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(640, NULL, '502529830223', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(641, NULL, '507154295157', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(642, NULL, '504007957752', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(643, NULL, '504044124605', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(644, NULL, '503712579021', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(645, NULL, '509127800347', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(646, NULL, '502022697788', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(647, NULL, '507244871466', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(648, NULL, '500737876464', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(649, NULL, '505182019941', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(650, NULL, '503397409127', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(651, NULL, '500597144229', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(652, NULL, '509341940399', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(653, NULL, '508189948118', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(654, NULL, '504105444752', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(655, NULL, '501093021502', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(656, NULL, '500528243637', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(657, NULL, '500604295747', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(658, NULL, '505048960734', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(659, NULL, '509265925946', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(660, NULL, '502742055774', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(661, NULL, '500379125159', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(662, NULL, '503822207724', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(663, NULL, '500307027300', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(664, NULL, '501114263218', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(665, NULL, '504871493303', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(666, NULL, '500230192071', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(667, NULL, '505314360768', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(668, NULL, '501062427246', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(669, NULL, '505280835407', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(670, NULL, '500978493963', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(671, NULL, '501830987503', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(672, NULL, '501536343401', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(673, NULL, '505932583427', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(674, NULL, '501401571515', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(675, NULL, '503103117844', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(676, NULL, '503376670272', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(677, NULL, '503561681724', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(678, NULL, '504528736763', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(679, NULL, '503814994733', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(680, NULL, '508654693468', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(681, NULL, '502671891113', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(682, NULL, '504061386942', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(683, NULL, '506118161472', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(684, 90, '505658470254', '2026-04-10', 1, 5, 1, '2026-04-11', 90, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(685, 90, '502845700242', '2026-04-10', 1, 6, 1, '2026-04-11', 90, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(686, NULL, '500858558520', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(687, NULL, '504161287860', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(688, NULL, '507612780122', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(689, NULL, '505772788877', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(690, NULL, '507259370923', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(691, NULL, '505127548389', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(692, NULL, '509943518056', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(693, NULL, '505998221135', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(694, NULL, '500688921124', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(695, NULL, '504568353441', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(696, NULL, '503970432570', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(697, NULL, '503524582381', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(698, NULL, '501793799472', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(699, NULL, '500044486133', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(700, NULL, '503685090743', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(701, NULL, '503225745545', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(702, NULL, '500254477049', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(703, NULL, '500698879683', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(704, NULL, '507723735747', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(705, NULL, '500388762467', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(706, NULL, '501254125920', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(707, NULL, '500612643934', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(708, NULL, '501222790221', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(709, NULL, '507458465037', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(710, NULL, '502607559994', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(711, NULL, '503133591669', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(712, NULL, '501144838525', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(713, NULL, '509511891505', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(714, NULL, '501644702146', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(715, NULL, '509356535544', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(716, NULL, '505925975115', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(717, NULL, '504532412429', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(718, NULL, '509551508418', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(719, NULL, '501279255097', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(720, NULL, '505779178320', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(721, NULL, '509565055901', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(722, NULL, '502022533444', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(723, NULL, '505665078267', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(724, NULL, '502109847249', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(725, NULL, '504427403102', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(726, NULL, '504654406109', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(727, NULL, '501055235378', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(728, NULL, '505913907236', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(729, NULL, '500999889194', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(730, NULL, '502353223761', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(731, NULL, '508929986001', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(732, NULL, '500946801021', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(733, NULL, '501897884523', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(734, NULL, '506030686632', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(735, NULL, '505201639234', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(736, NULL, '508099588844', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(737, NULL, '502655748959', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(738, NULL, '506668258949', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(739, NULL, '507719358220', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(740, NULL, '503578862780', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(741, NULL, '502473993939', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(742, NULL, '500199020468', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(743, NULL, '501293584784', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(744, NULL, '503654637288', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(745, NULL, '505923261619', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(746, NULL, '509917790773', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(747, NULL, '509910509259', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(748, NULL, '500100641007', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(749, NULL, '503357876958', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(750, NULL, '501146984758', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(751, NULL, '508428555323', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(752, NULL, '508032690647', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(753, NULL, '507571523609', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(754, NULL, '500520089240', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(755, NULL, '503525830850', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(756, NULL, '506891547285', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(757, NULL, '506249748478', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(758, NULL, '500971098394', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(759, NULL, '503275853865', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(760, NULL, '504267227152', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(761, NULL, '508198994627', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(762, NULL, '506505779152', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(763, NULL, '501539424395', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(764, NULL, '505454987310', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(765, NULL, '501506098057', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(766, NULL, '504213671750', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(767, NULL, '505491464999', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(768, NULL, '502888204863', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(769, NULL, '509401688563', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(770, NULL, '506231796808', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-10 20:23:07', '2026-04-10 20:23:07'),
(771, NULL, '878761234560', '2026-04-10', 0, NULL, 1, NULL, NULL, 0, 1, '2026-04-10 21:58:52', '2026-04-10 21:58:52'),
(772, NULL, '500123708831', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(773, NULL, '504655542374', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(774, NULL, '505176439193', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(775, NULL, '504510151903', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(776, NULL, '500081125720', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(777, NULL, '509013047816', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(778, NULL, '508549869251', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(779, NULL, '509776145663', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(780, NULL, '500137908782', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(781, NULL, '506206351636', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(782, NULL, '504470599746', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(783, NULL, '509823619026', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(784, NULL, '508388766835', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(785, NULL, '503207927837', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(786, NULL, '504449275141', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(787, NULL, '500878809230', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(788, NULL, '505169338946', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(789, NULL, '509076871126', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(790, NULL, '508698897840', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(791, NULL, '500505519076', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(792, NULL, '506831379099', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(793, NULL, '503381168970', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(794, NULL, '500584648196', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:40', '2026-04-14 21:23:40'),
(795, NULL, '501049906120', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(796, NULL, '509940822613', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(797, NULL, '502338304905', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(798, NULL, '509596176508', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(799, NULL, '505765041253', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(800, NULL, '503842699529', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(801, NULL, '509260018555', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(802, NULL, '502368610731', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(803, NULL, '506813665417', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(804, NULL, '508143545525', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(805, NULL, '501200902502', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(806, NULL, '508438731694', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(807, NULL, '508406645227', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(808, NULL, '507038572451', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(809, NULL, '503079309389', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(810, NULL, '501393206028', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(811, NULL, '502402865833', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(812, NULL, '507245612083', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(813, NULL, '503543110671', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(814, NULL, '502704313495', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(815, NULL, '506287061699', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(816, NULL, '500772857143', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(817, NULL, '506293558356', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(818, NULL, '505644979048', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(819, NULL, '501761249172', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(820, NULL, '504369305198', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(821, NULL, '509104886827', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(822, NULL, '508669372393', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(823, NULL, '501544536498', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(824, NULL, '502790239628', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(825, NULL, '502176006940', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(826, NULL, '501002185802', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(827, NULL, '501095730871', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(828, NULL, '501379675145', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(829, NULL, '509307831888', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(830, NULL, '503721782261', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(831, NULL, '504762002516', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(832, NULL, '509454547391', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(833, NULL, '504401818888', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(834, NULL, '503389112648', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(835, NULL, '503699636647', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(836, NULL, '506683259997', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(837, NULL, '502347870070', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(838, NULL, '503177516605', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(839, NULL, '501939988219', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(840, NULL, '500824221862', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(841, NULL, '501034900384', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(842, NULL, '507932137925', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(843, NULL, '509335126292', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(844, NULL, '506262309976', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(845, NULL, '505482478505', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(846, NULL, '507657298692', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(847, NULL, '508236131341', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(848, NULL, '507700720083', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(849, NULL, '509565415556', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(850, NULL, '506839813812', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(851, NULL, '507921724309', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41');
INSERT INTO `master_memberships` (`id`, `vivah_mitra_id`, `membership_number`, `created_date`, `is_used`, `member_id`, `created_by`, `used_date`, `leader_id`, `status`, `is_old`, `created_at`, `updated_at`) VALUES
(852, NULL, '507564156285', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(853, NULL, '500268327582', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(854, NULL, '507465829391', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(855, NULL, '505750617242', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(856, NULL, '507147205474', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(857, NULL, '505786693157', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(858, NULL, '509548304998', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(859, NULL, '508559013996', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(860, NULL, '501179889898', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(861, NULL, '509446130718', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(862, NULL, '501568345058', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(863, NULL, '501641521330', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(864, NULL, '504406585496', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(865, NULL, '508456871772', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(866, NULL, '501396395866', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(867, NULL, '501280628547', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(868, NULL, '507182506776', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(869, NULL, '508832113921', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(870, NULL, '504892088285', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(871, NULL, '504745848425', '2026-04-14', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-14 21:23:41', '2026-04-14 21:23:41'),
(872, NULL, '501290792486', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(873, NULL, '503142913731', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(874, NULL, '507138743100', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(875, NULL, '503849911597', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(876, NULL, '509017581118', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(877, NULL, '505784528562', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(878, NULL, '502496246261', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(879, NULL, '502962384051', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(880, NULL, '508304533934', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(881, NULL, '503023319094', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(882, NULL, '502543968680', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(883, NULL, '501015141622', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(884, NULL, '503400893512', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(885, NULL, '503230968601', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(886, NULL, '507335508197', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(887, NULL, '502842860183', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(888, NULL, '501996827260', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(889, NULL, '505966498095', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(890, NULL, '505018293291', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(891, NULL, '507702751668', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(892, NULL, '500301811079', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(893, NULL, '508358837685', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(894, NULL, '504326375497', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(895, NULL, '503847336769', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(896, NULL, '502649916115', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(897, NULL, '506531977511', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(898, NULL, '504798252178', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(899, NULL, '509664658773', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(900, NULL, '507371590987', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(901, NULL, '503888857229', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(902, NULL, '508962093496', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(903, NULL, '509081349085', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(904, NULL, '509803039130', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(905, NULL, '500821641063', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(906, NULL, '508417834493', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(907, NULL, '502507144787', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(908, NULL, '502164283503', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(909, NULL, '504347308207', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(910, NULL, '502863271799', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(911, NULL, '509476230424', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(912, NULL, '502980111535', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(913, NULL, '508864424779', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(914, NULL, '509772089836', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(915, NULL, '508466851576', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(916, NULL, '500482615870', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(917, NULL, '508202394269', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(918, NULL, '501179779082', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(919, NULL, '507940232010', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(920, NULL, '509297810396', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(921, NULL, '500876807178', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(922, NULL, '502678482536', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(923, NULL, '503440006118', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(924, NULL, '505959273084', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(925, NULL, '504321005976', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(926, NULL, '500744305838', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(927, NULL, '507768009075', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(928, NULL, '504300231134', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(929, NULL, '508984824839', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(930, NULL, '500321623431', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(931, NULL, '509306656058', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(932, NULL, '508349905679', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(933, NULL, '501259922234', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(934, NULL, '505765373321', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(935, NULL, '504070297214', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(936, NULL, '504781796719', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(937, NULL, '503121562288', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(938, NULL, '507573826114', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(939, NULL, '500846681396', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(940, NULL, '501214919425', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(941, NULL, '500692790596', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(942, NULL, '505777593582', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(943, NULL, '500744279680', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(944, NULL, '501259607007', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(945, NULL, '507779818860', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(946, NULL, '501071653579', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(947, NULL, '503732844767', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(948, NULL, '505937778908', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(949, NULL, '504395332132', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(950, NULL, '508163904333', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(951, NULL, '501858712536', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(952, NULL, '503714151433', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(953, NULL, '504712890398', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(954, NULL, '509282035447', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(955, NULL, '504938133118', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(956, NULL, '506564350482', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(957, NULL, '508314224600', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(958, NULL, '500196182021', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(959, NULL, '502274499262', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(960, NULL, '504137565231', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(961, NULL, '507014687890', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(962, NULL, '508815644313', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(963, NULL, '500583366777', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(964, NULL, '500535739584', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(965, NULL, '509855977915', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(966, NULL, '501350445101', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(967, NULL, '506526837036', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(968, NULL, '503439794892', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(969, NULL, '508867721167', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(970, NULL, '503349652852', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(971, NULL, '507689199101', '2026-04-16', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-16 19:54:02', '2026-04-16 19:54:02'),
(972, NULL, '504766867542', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(973, NULL, '503685352543', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(974, NULL, '504815497305', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(975, NULL, '502549430983', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(976, NULL, '505211889330', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(977, NULL, '507226210598', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(978, NULL, '504739553237', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(979, NULL, '501987978155', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(980, NULL, '508644145126', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(981, NULL, '506263161968', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(982, NULL, '509314804004', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(983, NULL, '505301280997', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(984, NULL, '505694771228', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(985, NULL, '506636025672', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(986, NULL, '506996049301', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(987, NULL, '502340639830', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(988, NULL, '509880039683', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(989, NULL, '506288260025', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(990, NULL, '505670805519', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(991, NULL, '501190693974', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(992, NULL, '503669875568', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(993, NULL, '507140934443', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(994, NULL, '503663645494', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(995, NULL, '505160616622', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(996, NULL, '504166996377', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(997, NULL, '509393491490', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(998, NULL, '509898335858', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(999, NULL, '502088163233', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1000, NULL, '504546888409', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1001, NULL, '503229970882', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1002, NULL, '502601089647', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1003, NULL, '501074304992', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1004, NULL, '502416545731', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1005, NULL, '503130709050', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1006, NULL, '503582422942', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1007, NULL, '502928665112', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1008, NULL, '501118557375', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1009, NULL, '504691815753', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1010, NULL, '509617644961', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1011, NULL, '502975660848', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1012, NULL, '501950566172', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1013, NULL, '507252792303', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1014, NULL, '500584506235', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1015, NULL, '506600343655', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1016, NULL, '509804420138', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1017, NULL, '507683135954', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1018, NULL, '506830326435', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1019, NULL, '507506626937', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1020, NULL, '500442226194', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1021, NULL, '501885627967', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1022, NULL, '506404343058', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1023, NULL, '500800370796', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1024, NULL, '502005224317', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1025, NULL, '504384602174', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1026, NULL, '508292777627', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1027, NULL, '508974642256', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1028, NULL, '502809369395', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1029, NULL, '500623899832', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1030, NULL, '504239229445', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1031, NULL, '509162487282', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1032, NULL, '507796463668', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1033, NULL, '503401440430', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1034, NULL, '500793847544', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1035, NULL, '500682063925', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1036, NULL, '508534905514', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1037, NULL, '508312836918', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1038, NULL, '508058717674', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1039, NULL, '503338372706', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1040, NULL, '509944143231', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1041, NULL, '501993417226', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1042, NULL, '505914788508', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1043, NULL, '505986711013', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1044, NULL, '502969363169', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1045, NULL, '503982134567', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1046, NULL, '505504152799', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1047, NULL, '506871970619', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1048, NULL, '500423761809', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1049, NULL, '501481970323', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1050, NULL, '503928181635', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1051, NULL, '504955400079', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1052, NULL, '506279109894', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1053, NULL, '509351696242', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1054, NULL, '503880533436', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1055, NULL, '509211725179', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1056, NULL, '502729055097', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1057, NULL, '500222437620', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1058, NULL, '505121543210', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1059, NULL, '501778422058', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1060, NULL, '508985800248', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1061, NULL, '505445374168', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1062, NULL, '509584763907', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1063, NULL, '507903171992', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1064, NULL, '501406660878', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1065, NULL, '508931015796', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1066, NULL, '509460113106', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1067, NULL, '504733853077', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1068, NULL, '504596046286', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1069, NULL, '509157284791', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1070, NULL, '505964749651', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1071, NULL, '504515080778', '2026-04-17', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-17 01:17:56', '2026-04-17 01:17:56'),
(1072, NULL, '509575697670', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1073, NULL, '506434395758', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1074, NULL, '500017190495', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1075, NULL, '507569476242', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1076, NULL, '506931415742', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1077, NULL, '500163913076', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1078, NULL, '509241112863', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1079, NULL, '505792105294', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1080, NULL, '507080108266', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1081, NULL, '506618590472', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1082, NULL, '504822898138', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1083, NULL, '508292473004', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1084, NULL, '508697846751', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1085, NULL, '506014648526', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1086, NULL, '508439745109', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1087, NULL, '502555133372', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1088, NULL, '506592886781', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1089, NULL, '506250647930', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1090, NULL, '505024841290', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1091, NULL, '508437253163', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1092, NULL, '503147593679', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1093, NULL, '500408196138', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1094, NULL, '509902266634', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1095, NULL, '504072430088', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1096, NULL, '501097566466', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1097, NULL, '507338440103', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1098, NULL, '505931274455', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1099, NULL, '507115514290', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1100, NULL, '505769547589', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1101, NULL, '506408792711', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1102, NULL, '501378359161', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1103, NULL, '505796591218', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1104, NULL, '500466559064', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1105, NULL, '503662670023', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1106, NULL, '501078231498', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1107, NULL, '503863469441', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1108, NULL, '504612153784', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1109, NULL, '505764037365', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1110, NULL, '508797722519', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1111, NULL, '504706962160', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1112, NULL, '500041422510', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1113, NULL, '505725803848', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1114, NULL, '504295199723', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1115, NULL, '502642692386', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1116, NULL, '508369789513', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1117, NULL, '501469363041', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1118, NULL, '505659687140', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1119, NULL, '509098765497', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1120, NULL, '504231316225', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1121, NULL, '502331737762', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1122, NULL, '509570519183', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1123, NULL, '507747459358', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1124, NULL, '501202656495', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1125, NULL, '505394307850', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1126, NULL, '502011987329', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1127, NULL, '509634557580', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1128, NULL, '508367425503', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1129, NULL, '507108395546', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1130, NULL, '503650191970', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1131, NULL, '505246833219', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1132, NULL, '506212115639', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1133, NULL, '509711881654', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1134, NULL, '506677738617', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1135, NULL, '507783065545', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1136, NULL, '500398926786', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1137, NULL, '500830057425', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1138, NULL, '509233715078', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1139, NULL, '501864577372', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1140, NULL, '508553085456', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1141, NULL, '504506655608', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1142, NULL, '501820292014', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1143, NULL, '508374510304', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1144, NULL, '507895450979', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1145, NULL, '504405277672', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1146, NULL, '505967894051', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1147, NULL, '501409687226', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1148, NULL, '500902993242', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1149, NULL, '507196407928', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1150, NULL, '504629852154', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1151, NULL, '504039473709', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1152, NULL, '501818364613', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1153, NULL, '501178507742', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1154, NULL, '507211012745', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1155, NULL, '508328063585', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1156, NULL, '507059197661', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1157, NULL, '507108887067', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1158, NULL, '507843854345', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1159, NULL, '503081107474', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1160, NULL, '503778793432', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1161, NULL, '500186856151', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1162, NULL, '503498223375', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1163, NULL, '503819731330', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1164, NULL, '505225899928', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1165, NULL, '505086387762', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1166, NULL, '504197171171', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1167, NULL, '503189954903', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1168, NULL, '507979070441', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1169, NULL, '501331837124', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1170, NULL, '501853942726', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1171, NULL, '505373386103', '2026-04-18', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-18 14:57:29', '2026-04-18 14:57:29'),
(1172, NULL, '508428312322', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1173, NULL, '505285495610', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1174, NULL, '502856870687', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1175, NULL, '507653156020', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1176, NULL, '509313267116', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1177, NULL, '507879173353', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1178, NULL, '500638580472', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1179, NULL, '501172490799', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1180, NULL, '507887342446', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1181, NULL, '507493553911', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1182, NULL, '502746350812', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1183, NULL, '505889600110', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1184, NULL, '506324944749', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1185, NULL, '505981448462', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1186, NULL, '507640492889', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1187, NULL, '503834875589', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1188, NULL, '501334416460', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1189, NULL, '504124012688', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1190, NULL, '508613369685', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1191, NULL, '500501053052', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1192, NULL, '509145245499', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1193, NULL, '505059724848', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1194, NULL, '500570250709', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1195, NULL, '503410736982', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1196, NULL, '503860804784', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1197, NULL, '508250447037', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1198, NULL, '502066424676', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1199, NULL, '500091379589', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1200, NULL, '506174219620', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1201, NULL, '509843065271', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1202, NULL, '508341054252', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1203, NULL, '501204850223', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1204, NULL, '500871334206', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1205, NULL, '509449437672', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1206, NULL, '502986673101', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1207, NULL, '505172954181', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1208, NULL, '508909673907', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1209, NULL, '504924664364', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1210, NULL, '504316736620', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1211, NULL, '508591587926', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1212, NULL, '508313312792', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1213, NULL, '503477013061', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1214, NULL, '506444864050', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1215, NULL, '502163051726', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1216, NULL, '503815643835', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1217, NULL, '502321805857', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1218, NULL, '502945149211', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1219, NULL, '502258583065', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1220, NULL, '502383826825', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1221, NULL, '500926150720', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1222, NULL, '507278036005', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1223, NULL, '502455191936', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1224, NULL, '500109168453', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1225, NULL, '502291226358', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1226, NULL, '502832829448', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1227, NULL, '503732378323', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1228, NULL, '507060775472', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1229, NULL, '507545561149', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1230, NULL, '504981236505', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1231, NULL, '504508005417', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1232, NULL, '509115894076', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1233, NULL, '501041188273', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1234, NULL, '507940770169', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1235, NULL, '507507165959', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1236, NULL, '507048700556', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1237, NULL, '503196510439', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1238, NULL, '504341155370', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1239, NULL, '508452090545', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1240, NULL, '503095508387', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1241, NULL, '503640927027', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1242, NULL, '505779025583', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1243, NULL, '509058794109', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1244, NULL, '500326581772', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1245, NULL, '506667620991', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1246, NULL, '505405687447', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1247, NULL, '508308897668', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1248, NULL, '509223794105', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1249, NULL, '504851220896', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1250, NULL, '507511515623', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1251, NULL, '503872869417', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1252, NULL, '505838207424', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1253, NULL, '500338056047', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1254, NULL, '500519266636', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1255, NULL, '504638280510', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1256, NULL, '504565541876', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1257, NULL, '507917856270', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1258, NULL, '505166244440', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1259, NULL, '500787959603', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1260, NULL, '503759854225', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1261, NULL, '502323451625', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1262, NULL, '509286000213', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1263, NULL, '505243925411', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1264, NULL, '500729319126', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1265, NULL, '501879660409', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1266, NULL, '501804327797', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1267, NULL, '502884252805', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1268, NULL, '501819625498', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1269, NULL, '507844988371', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1270, NULL, '501356039009', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29'),
(1271, NULL, '500253106650', '2026-04-23', 0, NULL, 1, NULL, NULL, 0, 0, '2026-04-23 11:52:29', '2026-04-23 11:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `master_notices`
--

CREATE TABLE `master_notices` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(200) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_notices`
--

INSERT INTO `master_notices` (`id`, `title`, `type`, `file`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(10, 'प्रशिक्षण कार्यक्रम', 'Vivah Mitra', 'uploads/notice/1775853332551.jpeg', 1, 1, '2026-04-11 02:05:32', '2026-04-11 02:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `master_offers`
--

CREATE TABLE `master_offers` (
  `id` int(11) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` bigint(20) DEFAULT NULL,
  `offer_type` varchar(255) DEFAULT NULL,
  `shorts_video_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_offers`
--

INSERT INTO `master_offers` (`id`, `user_type`, `user_designation`, `offer_type`, `shorts_video_url`, `title`, `file`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(25, 6, 9, 'image', NULL, 'OFFER', 'uploads/offer/1775929601558.jpeg', 1, 1, '2026-04-11 23:16:41', '2026-04-11 23:16:41'),
(26, 6, 9, 'image', NULL, 'OFFER02', 'uploads/offer/1775929689420.jpeg', 1, 1, '2026-04-11 23:18:09', '2026-04-11 23:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `master_partners`
--

CREATE TABLE `master_partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `other_icon` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `table_fields` text DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_partners`
--

INSERT INTO `master_partners` (`id`, `parent_id`, `title`, `slug`, `icon`, `banner`, `other_icon`, `page_url`, `image`, `short_description`, `table_fields`, `meta_tag`, `meta_title`, `meta_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Partner & Program', 'partner-program', 'uploads/cms/cms-20230902110025-1269.webp', 'uploads/cms/cms-20230901113419-1417.webp', 'NA', NULL, NULL, '<p>NA</p>', '[\"NA\"]', 'Partner + Program', 'Partner + Program', '<p>Partner + Program</p>', 1, 1, 1, '2023-08-05 06:20:37', '2023-09-02 11:00:25', NULL),
(2, 0, 'Testing', 'testing', 'uploads/cms/cms-20230809083947-3358.png', 'uploads/cms/cms-20230809083947-9736.webp', NULL, NULL, 'uploads/cms/cms-20230809083947-7849.png', '<p>Testing</p>', '[\"NA\"]', 'Testing', 'Testing', 'Testing', 2, 1, 1, '2023-08-09 03:09:47', '2023-08-18 07:08:30', NULL),
(3, 0, 'Partners', 'partner', 'uploads/cms/cms-20230818070649-3870.png', 'uploads/cms/cms-20230818070649-3110.webp', NULL, NULL, 'uploads/cms/cms-20230818070649-1136.png', '<p>Test Short Description</p>', '[\"test\"]', 'Partners', 'Partners', 'Partners', 2, 1, 1, '2023-08-16 01:34:47', '2023-08-23 09:59:55', NULL),
(4, 0, 'New Partner', 'new-partner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-08-18 07:07:32', '2023-08-18 07:07:37', '2023-08-18 07:07:37'),
(5, 0, 'Affiliate Partners', 'affiliate-partners', 'uploads/cms/cms-20230824125749-3052.webp', 'uploads/cms/cms-20230824125749-2827.webp', NULL, NULL, NULL, '<p>Cloudware Private Cloud Solutions</p>', NULL, 'Cloudware Private Cloud Solutions', 'Cloudware Private Cloud Solutions', '<p>Cloudware Private Cloud Solutions</p>', 2, 1, 1, '2023-08-24 12:57:50', '2023-09-01 11:40:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_prices`
--

CREATE TABLE `master_prices` (
  `id` int(11) NOT NULL,
  `price_range` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_prices`
--

INSERT INTO `master_prices` (`id`, `price_range`, `status`, `created_at`, `updated_at`) VALUES
(1, '< 10,000', 1, '2026-06-18 06:04:27', NULL),
(2, '10,000 - 20,000', 1, '2026-06-18 06:04:27', NULL),
(3, '20,000 - 30,000', 1, '2026-06-18 06:04:27', NULL),
(4, '30,000 - 50,000', 1, '2026-06-18 06:04:27', NULL),
(5, '50,000 - 1 Lakh', 1, '2026-06-18 06:04:27', NULL),
(6, '1 Lakh - 3 Lakh', 1, '2026-06-18 06:04:27', NULL),
(7, '3 Lakh - 5 Lakh', 1, '2026-06-18 06:04:27', NULL),
(8, '5 Lakh - 7 Lakh', 1, '2026-06-18 06:04:27', NULL),
(9, '1', 1, '2026-06-30 11:02:25', '2026-06-30 11:02:25'),
(10, '1', 1, '2026-06-30 11:02:36', '2026-06-30 11:02:36'),
(11, '1', 1, '2026-06-30 11:28:37', '2026-06-30 11:28:37'),
(12, '1', 1, '2026-06-30 11:30:47', '2026-06-30 11:30:47'),
(13, '54', 1, '2026-06-30 11:30:57', '2026-06-30 11:30:57'),
(14, '465', 1, '2026-06-30 11:31:23', '2026-06-30 11:31:23'),
(15, '32', 1, '2026-06-30 11:35:26', '2026-06-30 11:35:26'),
(16, '460', 1, '2026-06-30 11:51:43', '2026-06-30 12:03:42'),
(17, '324333', 1, '2026-06-30 12:04:47', '2026-06-30 12:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `master_products`
--

CREATE TABLE `master_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order_no` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `other_icon` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `table_fields` text DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_properties`
--

CREATE TABLE `master_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_properties`
--

INSERT INTO `master_properties` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Plot/Land', 1, 1, '2026-06-09 12:11:26', '2026-06-12 07:33:35', NULL),
(2, 'Flat/Apartment', 1, 1, '2026-06-12 07:35:49', '2026-06-12 07:35:49', NULL),
(3, 'Residential House', 1, 1, '2026-06-12 07:36:43', '2026-06-12 07:36:43', NULL),
(4, 'Villa', 1, 1, '2026-06-12 07:36:53', '2026-06-12 07:36:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_semesters`
--

CREATE TABLE `master_semesters` (
  `id` int(11) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_semesters`
--

INSERT INTO `master_semesters` (`id`, `semester`, `created_at`, `updated_at`) VALUES
(1, '6 MONTHS', '2025-04-15 20:00:21', '2025-10-11 17:01:41'),
(2, '12 MONTHS', '2025-04-15 20:00:21', '2025-10-11 17:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `master_services`
--

CREATE TABLE `master_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `other_icon` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_services`
--

INSERT INTO `master_services` (`id`, `parent_id`, `title`, `slug`, `icon`, `banner`, `other_icon`, `page_url`, `image`, `short_description`, `meta_tag`, `meta_title`, `meta_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 0, 'Cloud Migration Service', 'cloud-migration-service', 'uploads/cms/cms-20230817083748-3344.png', 'uploads/cms/cms-20230811083428-2549.png', NULL, 'Cloud-Migration-Service', 'uploads/cms/cms-1690365714.png', '<p>Regulatory Affairs (RA) also called Government Affairs, is a profession within regulated industries, such as pharmaceuticals, medical devices, Import, Export and Cosmetics. Regulatory Affairs also has a very specific meaning within the healthcare industries (pharmaceuticals, medical devices, Biologics and functional foods). Biologics and functional foods</p>', 'cloud migration, cloud migration service, cloud data migration, on premise to cloud migration, cloud migration consulting,', 'Cloud Migration Service - Seamlessly Move to Cloud | Cloudware', '<p>Shift to the cloud effortlessly with Cloudware&#39;s reliable Cloud Migration Service. Enjoy smooth cloud migration, minimal downtime, and enhanced business scalability.</p>', 1, 1, 1, '2023-07-26 04:31:54', '2023-08-28 06:41:39', NULL),
(13, 0, 'Test Service', 'test-service', NULL, NULL, NULL, 'test-service', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2023-08-05 01:25:17', '2023-08-09 04:56:39', '2023-08-09 04:56:39'),
(14, 0, 'System Integration Services', 'system-integration-services', 'uploads/cms/cms-20230808095308-9238.png', 'uploads/cms/cms-20230822072325-515.png', NULL, 'system-integration-services', 'uploads/cms/cms-20230829072021-4911.webp', NULL, 'system integration services, system integration, integrated management system, system integrator companies', 'System Integration Services for Businesses - Cloudware', '<p>Enhance efficiency &amp; connectivity with our System Integration Services. Seamlessly unify your systems, optimize workflows, and boost your business productivity.</p>', 1, 1, 1, '2023-08-08 04:21:37', '2023-08-29 07:20:21', NULL),
(15, 0, 'Managed Services', 'managed-services', 'uploads/cms/cms-20230809102859-2507.png', 'uploads/cms/cms-20230822072451-6662.png', NULL, 'managed-services', 'uploads/cms/cms-20230829072000-1849.webp', '<p>Empower Your Business with Managed IT Services: Unleash Success, Uninterrupted</p>', 'managed it services, managed it services for small businesses, managed it services provider', 'Best Managed IT Services Provider | Cloudware', '<p>Elevate your business efficiency with the best Managed IT Services. Our experts ensure seamless technology management, empowering your growth.</p>', 1, 1, 1, '2023-08-09 04:58:59', '2023-08-29 07:20:00', NULL),
(16, 0, 'IT Consulting', 'it-consulting', 'uploads/cms/cms-20230809105009-2381.png', 'uploads/cms/cms-20230822110445-6130.png', NULL, 'it-consulting-services', 'uploads/cms/cms-20230829071943-2136.webp', NULL, 'IT Consulting Services, it consulting services provider in india', 'Expert IT Consulting Services - Cloudware', '<p>Drive success through our strategic IT consulting Services that are tailored solutions to optimize your technology and fuel your growth. Discover the difference today.</p>', 1, 1, 1, '2023-08-09 05:20:09', '2023-08-29 07:19:43', NULL),
(17, 0, 'Device on Rent OPEX Model', 'device-on-rent-opex-model', 'uploads/cms/cms-20230809105148-4666.png', 'uploads/cms/cms-20230817061927-1291.png', NULL, 'device-on-rent-opex-model', 'uploads/cms/cms-20230829071854-5871.webp', NULL, 'Device on Rent OPEX Model', 'Device On Rent - Adopt OPEX Model | Cloudware', '<p>Experience cost-efficient growth with Device On Rent/OPEX model. Explore the benefits of our OPEX model for streamlined operations and enhanced flexibility.</p>', 1, 1, 1, '2023-08-09 05:21:49', '2023-08-29 07:18:54', NULL),
(18, 0, 'Network & Security', 'network-security', 'uploads/cms/cms-20230809111149-6009.png', 'uploads/cms/cms-20230822072608-6406.png', NULL, 'network-security', NULL, NULL, 'network and security services', 'Network and Security Services to Strengthen Your Business', '<p>Elevate your business&rsquo;s protection and connectivity with our comprehensive Network and Security services. Explore tailored solutions for a secure and efficient future.</p>', 1, 1, 1, '2023-08-09 05:41:49', '2023-08-28 06:45:55', NULL),
(19, 0, 'Cost Optimization Services', 'cost-optimization-services', 'uploads/cms/cms-20230809111314-2259.png', 'uploads/cms/cms-20230811083903-2957.png', NULL, 'cost-optimization-services', NULL, NULL, 'cloud cost optimization, cost optimization,', 'Cloud Cost Optimization Services - Cloudware', '<p>Explore the power of Cloud Cost Optimization Service to maximize savings while using cloud services. It&rsquo;s a solution for efficient operations &amp; financial success.</p>', 1, 1, 1, '2023-08-09 05:43:14', '2023-08-28 06:46:39', NULL),
(20, 0, 'SAP Migration Services', 'sap-migration-services', 'uploads/cms/cms-20230809112320-8416.png', 'uploads/cms/cms-20230822072707-9030.png', NULL, 'sap-migration-services', NULL, NULL, 'sap migration services, sap data services migration', 'Best SAP Migration Service Provider - Cloudware', '<p>Cloudware offers professional SAP Migration Services for enterprises. Experience a smooth SAP cloud migration service to ensure minimal disruption &amp; maximise benefits.</p>', 1, 1, 1, '2023-08-09 05:53:20', '2023-08-28 06:47:26', NULL),
(21, 0, 'DC-DR Solutions', 'dc-dr-solutions', 'uploads/cms/cms-20230809114125-228.png', 'uploads/cms/cms-20230822072748-6475.png', NULL, 'dc-dr-solutions', NULL, NULL, 'data center disaster recovery solutions, dc dr solutions, disaster recovery,', 'Best Data Center Disaster Recovery Solutions | Cloudware', '<p>Get experts-designed Data Center Disaster Recovery (DC-DR) solutions for small businesses to enterprises that keep your operations running smoothly.</p>', 1, 1, 1, '2023-08-09 06:11:25', '2023-08-28 06:48:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_shops`
--

CREATE TABLE `master_shops` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `investor_name` varchar(255) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `shop_age` varchar(100) DEFAULT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  `shop_status` varchar(255) DEFAULT NULL,
  `investor_photo` varchar(255) DEFAULT NULL,
  `investor_agreement` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_shops`
--

INSERT INTO `master_shops` (`id`, `name`, `investor_name`, `opening_date`, `shop_age`, `stock`, `profit`, `shop_status`, `investor_photo`, `investor_agreement`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sharma Complexww', 'Rana Sharmaw', '2025-04-27', NULL, '10', '101', 'loss', 'uploads/shops/177790668033.jpg', 'uploads/shops/1777392182411.pdf', 1, NULL, '2026-04-28 16:03:02', '2026-05-04 20:28:00'),
(2, 'Bag House', 'GAF', '2025-03-02', NULL, '2', '5', 'super_duper_idea', 'uploads/shops/1777906878643.jpg', 'uploads/shops/1777719005832.pdf', 1, NULL, '2026-05-02 16:20:05', '2026-05-04 20:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `master_solutions`
--

CREATE TABLE `master_solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `other_icon` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_solutions`
--

INSERT INTO `master_solutions` (`id`, `parent_id`, `title`, `slug`, `icon`, `banner`, `other_icon`, `page_url`, `image`, `short_description`, `meta_tag`, `meta_title`, `meta_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'sdsdvsdv', 'sdsdvsdv', 'uploads/cms/cms-20230808080723-4839.png', NULL, NULL, 'sdvsdvsd--------ssssssssssss', NULL, '<p>sdv</p>', 'sdv', 'sdv', 'sdv', 2, 1, 1, '2023-08-08 02:37:23', '2023-08-11 01:18:47', '2023-08-11 01:18:47'),
(2, 0, 'Video & IPTV Streaming', 'video-iptv-streaming', 'uploads/cms/cms-20230809115643-7902.png', 'uploads/cms/cms-20230823064145-5203.png', NULL, 'video-and-iptv-streaming', NULL, NULL, 'video and iptv streaming hosting', 'Video & IPTV Streaming Hosting Solution - Cloudware', '<p>Deliver engaging content seamlessly with our advance Video &amp; IPTV Streaming Hosting Solution. Experience high-quality streaming and superior viewer experience.</p>', 1, 1, 1, '2023-08-09 06:26:43', '2023-08-28 07:04:58', NULL),
(3, 0, 'CDN & VPN Hosting', 'cdn-vpn-hosting', 'uploads/cms/cms-20230811043744-5662.png', 'uploads/cms/cms-20230823063420-777.png', NULL, 'cdn-vpn-hosting', 'uploads/cms/cms-20230811043709-3448.png', NULL, 'cdn & vpn hosting, cdn vpn hosting, cdn vpn hosting, cdn and vpn hosting solution,', 'Best CDN and VPN Hosting Solution - Cloudware', '<p>Supercharge your online presence with advanced CDN &amp; VPN Hosting solutions. Get faster content delivery and enhanced data protection for seamless user experiences.</p>', 1, 1, 1, '2023-08-10 23:07:09', '2023-08-28 07:04:19', NULL),
(4, 0, 'Ad-Tech & Mar-Tech Hosting', 'ad-tech-mar-tech-hosting', 'uploads/cms/cms-20230811043914-8578.png', 'uploads/cms/cms-20230823082446-4350.png', NULL, 'ad-tech-mar-tech-hosting', NULL, NULL, 'ad-tech & mar-tech hosting services,', 'Ad-Tech & Mar-Tech Hosting Solution - Cloudware', '<p>Strengthen your advertising and marketing strategies through our advance Ad-Tech &amp; Mar-Tech Hosting solutions.</p>', 1, 1, 1, '2023-08-10 23:09:14', '2023-08-28 07:02:44', NULL),
(5, 0, 'Laravel', 'laravel', 'uploads/cms/cms-20230811044130-2281.png', 'uploads/cms/cms-20230823115309-1734.png', NULL, 'laravel-hosting', NULL, NULL, 'laravel hosting, laravel hosting solution, best laravel hosting services,', 'Best Laravel Hosting Solution - Cloudware', '<p>Get the full potential of your Laravel project with our specialized Laravel Hosting Solution. Experience high performance, security, and scalability with us.</p>', 1, 1, 1, '2023-08-10 23:11:30', '2023-08-28 07:00:41', NULL),
(6, 0, 'Crypto Hosting', 'crypto-hosting', 'uploads/cms/cms-20230811044232-2410.png', 'uploads/cms/cms-20230825045720-3960.webp', NULL, 'crypto-hosting', NULL, NULL, 'crypto hosting, crypto hosting services, blockchain hosting, buy server with crypto, crypto mining hosting, best crypto mining hosting service,', 'Best Crypto Hosting Solutions - Cloudware', '<p>Protect your crypto projects with our specialized Crypto Hosting Solution. Experience enhanced security, performance, and reliability for your applications.</p>', 1, 1, 1, '2023-08-10 23:12:32', '2023-08-28 06:59:49', NULL),
(7, 0, 'High-Availability Clusters', 'high-availability-clusters', 'uploads/cms/cms-20230811044322-642.png', 'uploads/cms/cms-20230823083956-7026.png', NULL, 'high-availability-clusters', NULL, NULL, 'high availability cluster hosting, high availability cluster hosting solutions,', 'High-Availability Clusters Hosting - Cloudware', '<p>Experience remarkable performance with our High-Availability Clusters Hosting. It ensure seamless operations &amp; minimal downtime for your critical applications.</p>', 1, 1, 1, '2023-08-10 23:13:22', '2023-08-28 06:56:26', NULL),
(8, 0, 'File Storage Solutions', 'file-storage-solutions', 'uploads/cms/cms-20230811044459-4867.png', 'uploads/cms/cms-20230823114632-2634.png', NULL, 'file-storage-solutions', NULL, NULL, 'file storage hosting, file storage hosting solutions, cloudware,', 'File Storage Hosting Solutions - Cloudware', '<p>Optimize your data and it accessibility with our advanced File Storage Solutions. Experience secure, scalable, and efficient storage for your business needs.</p>', 1, 1, 1, '2023-08-10 23:14:59', '2023-08-28 06:55:34', NULL),
(9, 0, 'Enterprise Managed Solutions', 'enterprise-managed-solutions', 'uploads/cms/cms-20230811044610-9623.png', 'uploads/cms/cms-20230823120111-5103.png', NULL, 'enterprise-managed-solutions', NULL, NULL, 'enterprise managed solutions', 'Best Enterprise Managed Solutions | Cloudware', '<p>Streamline and empower your operations using Cloudware&rsquo;s Managed Enterprise Solutions. From optimization to growth, we&rsquo;ve got you covered everything here.</p>', 1, 1, 1, '2023-08-10 23:16:10', '2023-08-28 06:54:43', NULL),
(10, 0, '10Gbps Dedicated Server', '10gbps-dedicated-server', 'uploads/cms/cms-20230811044802-5777.png', 'uploads/cms/cms-20230811044802-8164.png', NULL, '10gbps-dedicated-server', NULL, NULL, '10gbps dedicated server, 10gbps server, 10gbps vps, cheap 10gbps dedicated server, 10gbps vps unmetered, 10gbps unmetered dedicated server, 10 gbps dedicated server, 10 gbps vps,', 'Best 10Gbps Dedicated Server with tier 4 Data Centers', '<p>Get the best 10Gbps Dedicated Server in India, which is highly reliable &amp; secure, with tier 4 Data Centers. Our 10Gbps Servers offer a 100% uptime guarantee at a cheap price.</p>', 1, 1, 1, '2023-08-10 23:18:02', '2023-08-28 06:52:28', NULL),
(11, 0, 'Dedicated Server Hosting', 'dedicated-server-hosting', 'uploads/cms/cms-20230811044904-9571.png', 'uploads/cms/cms-20230901102008-9552.webp', NULL, 'dedicated-server-hosting', NULL, NULL, 'dedicated server hosting, best dedicated server hosting, dedicated server,', 'Best Dedicated Server Hosting in India | Cloudware', '<p>Experience optimal performance &amp; 100% uptime with our dedicated hosting server solutions. Get Dedicated Hosting Server from Cloudware at the best price.</p>', 1, 1, 1, '2023-08-10 23:19:04', '2023-09-01 10:20:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_targets`
--

CREATE TABLE `master_targets` (
  `id` int(11) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` int(11) DEFAULT NULL,
  `target` varchar(255) NOT NULL,
  `target_value` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_targets`
--

INSERT INTO `master_targets` (`id`, `user_type`, `user_designation`, `target`, `target_value`, `status`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 5, 1, 'Cash Sale', '100000', 1, '2025-12-05 14:35:29', '2025-12-05 14:44:15', 1),
(2, 6, 7, 'Membership', '50000', 1, '2025-12-05 14:36:58', '2025-12-05 14:36:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_tnc_videos`
--

CREATE TABLE `master_tnc_videos` (
  `id` int(11) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_vendors`
--

CREATE TABLE `master_vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_name` varchar(150) NOT NULL,
  `owner_email` varchar(150) NOT NULL,
  `shop_name` varchar(200) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `state_id` bigint(100) NOT NULL,
  `district_id` bigint(100) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_videos`
--

CREATE TABLE `master_videos` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` int(11) DEFAULT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_videos`
--

INSERT INTO `master_videos` (`id`, `category_id`, `sub_category_id`, `video_type`, `user_type`, `user_designation`, `video_title`, `video_url`, `status`, `created_at`, `updated_at`, `created_by`) VALUES
(7, 1, 4, 'yt_shorts', 6, 9, 'SHADI KA PACKAGE', 'https://youtube.com/shorts/heFVRhwcpCI?feature=share', 1, '2026-04-11 23:08:15', '2026-04-11 23:08:15', 1),
(8, 2, 6, 'yt_shorts', 6, 9, 'OFFER', 'https://youtube.com/shorts/__elVPSpju0', 1, '2026-04-11 23:23:01', '2026-04-11 23:23:01', 1),
(9, 2, 6, 'yt_shorts', 6, 9, '15 DAYS', 'https://youtube.com/shorts/RvyXo3zv_Hw', 1, '2026-04-11 23:25:37', '2026-04-11 23:25:37', 1),
(10, 1, 5, 'yt_shorts', 6, 9, 'SUPER OFFER', 'https://youtube.com/shorts/irSYxof6edA', 1, '2026-04-11 23:28:17', '2026-04-11 23:28:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_vivahmitra_codes`
--

CREATE TABLE `master_vivahmitra_codes` (
  `id` bigint(20) NOT NULL,
  `employee_code` varchar(255) NOT NULL,
  `created_date` date DEFAULT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `used_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_vivahmitra_codes`
--

INSERT INTO `master_vivahmitra_codes` (`id`, `employee_code`, `created_date`, `is_used`, `user_id`, `created_by`, `used_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '143029253', '2025-12-16', 1, 78, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(2, '144520192', '2025-12-16', 1, 77, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(3, '146835762', '2025-12-16', 1, 76, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(4, '142022924', '2025-12-16', 1, 75, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(5, '144610558', '2025-12-16', 1, 74, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(6, '145501057', '2025-12-16', 1, 73, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(7, '145440340', '2025-12-16', 1, 72, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(8, '144265690', '2025-12-16', 1, 71, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(9, '146620180', '2025-12-16', 1, 70, 1, '2026-01-07', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(10, '141655241', '2025-12-16', 1, 60, 1, '2025-12-19', 1, '2025-12-16 12:27:27', '2025-12-16 12:27:27'),
(11, '145436607', '2025-12-18', 1, 49, 1, '2025-12-16', 1, '2025-12-16 12:39:48', '2025-12-16 12:39:48'),
(12, '141747906', '2025-12-18', 1, 50, 1, '2025-12-16', 1, '2025-12-16 12:39:48', '2025-12-16 12:39:48'),
(13, '146782003', '2025-12-18', 1, 59, 1, '2025-12-19', 1, '2025-12-16 12:39:48', '2025-12-16 12:39:48'),
(14, '142805115', '2025-12-28', 1, 58, 1, '2025-12-19', 1, '2025-12-18 10:51:19', '2025-12-18 10:51:19'),
(15, '143102285', '2025-12-28', 1, 57, 1, '2025-12-19', 1, '2025-12-18 10:51:19', '2025-12-18 10:51:19'),
(16, '141655588', '2025-12-28', 1, 56, 1, '2025-12-19', 1, '2025-12-18 10:51:19', '2025-12-18 10:51:19'),
(17, '142905076', '2025-12-28', 1, 55, 1, '2025-12-19', 1, '2025-12-18 10:51:19', '2025-12-18 10:51:19'),
(18, '147203508', '2025-12-28', 1, 54, 1, '2025-12-19', 1, '2025-12-18 10:51:19', '2025-12-18 10:51:19'),
(19, '147625762', '2025-12-27', 1, 53, 1, '2025-12-19', 1, '2025-12-18 13:06:58', '2025-12-18 13:06:58'),
(20, '142315882', '2025-12-27', 1, 51, 1, '2025-12-18', 1, '2025-12-18 13:06:58', '2025-12-18 13:06:58'),
(21, '143914642', '2025-12-19', 1, 52, 1, '2025-12-19', 1, '2025-12-18 20:06:46', '2025-12-18 20:06:46'),
(22, '142971911', '2026-01-07', 1, 69, 1, '2026-01-07', 1, '2026-01-07 08:33:18', '2026-01-07 08:33:18'),
(23, '147421729', '2026-01-07', 1, 68, 1, '2026-01-07', 1, '2026-01-07 08:34:51', '2026-01-07 08:34:51'),
(24, '144693621', '2026-01-07', 1, 67, 1, '2026-01-07', 1, '2026-01-07 08:34:51', '2026-01-07 08:34:51'),
(25, '145957137', '2026-01-07', 1, 66, 1, '2026-01-07', 1, '2026-01-07 08:34:51', '2026-01-07 08:34:51'),
(26, '148912086', '2026-01-07', 1, 65, 1, '2026-01-07', 1, '2026-01-07 08:34:51', '2026-01-07 08:34:51'),
(27, '146475955', '2026-01-07', 1, 64, 1, '2026-01-07', 1, '2026-01-07 08:36:39', '2026-01-07 08:36:39'),
(28, '146294016', '2026-01-07', 1, 63, 1, '2026-01-07', 1, '2026-01-07 08:36:39', '2026-01-07 08:36:39'),
(29, '147569413', '2026-01-07', 1, 62, 1, '2026-01-07', 1, '2026-01-07 08:36:39', '2026-01-07 08:36:39'),
(30, '145823148', '2026-01-07', 1, 61, 1, '2026-01-07', 1, '2026-01-07 08:36:39', '2026-01-07 08:36:39'),
(31, '143730020', '2026-01-07', 1, 83, 1, '2026-01-07', 1, '2026-01-07 12:16:32', '2026-01-07 12:16:32'),
(32, '144898241', '2026-01-07', 1, 82, 1, '2026-01-07', 1, '2026-01-07 12:16:32', '2026-01-07 12:16:32'),
(33, '145157333', '2026-01-07', 1, 81, 1, '2026-01-07', 1, '2026-01-07 12:16:32', '2026-01-07 12:16:32'),
(34, '144057748', '2026-01-07', 1, 80, 1, '2026-01-07', 1, '2026-01-07 12:16:32', '2026-01-07 12:16:32'),
(35, '141199330', '2026-01-07', 1, 79, 1, '2026-01-07', 1, '2026-01-07 12:16:32', '2026-01-07 12:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `master_wards`
--

CREATE TABLE `master_wards` (
  `id` int(11) NOT NULL,
  `panchayat_id` int(11) NOT NULL,
  `total_ward` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '1-Active,2-Pending,3-Deleted,4-Removed',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_yearly_bonuses`
--

CREATE TABLE `master_yearly_bonuses` (
  `id` int(11) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_designation` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_yearly_bonuses`
--

INSERT INTO `master_yearly_bonuses` (`id`, `user_type`, `user_designation`, `title`, `value`, `status`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 9, 5, 'Tour in India', '1000', 1, '2025-12-06 13:39:49', '2026-03-25 00:36:34', 1),
(2, 5, 5, '1 Child Education 500 per month', '6000', 1, '2025-12-06 13:41:04', '2025-12-06 13:41:04', 1),
(3, 5, 5, 'Hair Cutting, Shaving', '2400', 1, '2025-12-06 13:41:35', '2025-12-06 13:41:35', 1),
(4, 5, 18, 'super', '5000', 1, '2025-12-07 09:42:54', '2025-12-07 09:42:54', 1),
(5, 5, 18, 'super12', '6000', 1, '2025-12-07 09:43:25', '2025-12-07 09:43:25', 1),
(6, 5, 18, 'super33', '7000', 1, '2025-12-07 09:43:41', '2025-12-07 09:43:41', 1),
(7, 7, 19, 'EDUCATION', '25000', 1, '2025-12-11 15:41:45', '2025-12-11 15:41:45', 1),
(8, 2, 6, 'EDUCATION223', '60000', 1, '2025-12-11 16:29:49', '2025-12-11 16:29:49', 1),
(9, 6, 10, 'Test Rana', '1000', 1, '2026-03-25 01:03:01', '2026-03-25 01:03:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `membership_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `father_husband` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `ayushmati_girl_name` varchar(255) DEFAULT NULL,
  `ayushmati_age` varchar(255) DEFAULT NULL,
  `ayushmati_qualification` varchar(255) DEFAULT NULL,
  `ayushmati_father_occupation` varchar(255) DEFAULT NULL,
  `ayushmati_father_husband_name` varchar(255) DEFAULT NULL,
  `ayushmati_expected_marriage_month` varchar(255) DEFAULT NULL,
  `ayushmati_expected_marriage_year` varchar(255) DEFAULT NULL,
  `sister_name_1` varchar(255) DEFAULT NULL,
  `sister_qualification_1` varchar(255) DEFAULT NULL,
  `sister_age_1` varchar(255) DEFAULT NULL,
  `sister_name_2` varchar(255) DEFAULT NULL,
  `sister_qualification_2` varchar(255) DEFAULT NULL,
  `sister_age_2` varchar(255) DEFAULT NULL,
  `sister_name_3` varchar(255) DEFAULT NULL,
  `sister_qualification_3` varchar(255) DEFAULT NULL,
  `sister_age_3` varchar(255) DEFAULT NULL,
  `expected_marriage_package` float DEFAULT NULL,
  `added_date` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `card_price` float DEFAULT NULL,
  `received_card_amount` float DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `leader_id`, `membership_number`, `name`, `father_husband`, `address`, `post`, `state`, `district`, `pincode`, `mobile`, `whatsapp`, `ayushmati_girl_name`, `ayushmati_age`, `ayushmati_qualification`, `ayushmati_father_occupation`, `ayushmati_father_husband_name`, `ayushmati_expected_marriage_month`, `ayushmati_expected_marriage_year`, `sister_name_1`, `sister_qualification_1`, `sister_age_1`, `sister_name_2`, `sister_qualification_2`, `sister_age_2`, `sister_name_3`, `sister_qualification_3`, `sister_age_3`, `expected_marriage_package`, `added_date`, `added_by`, `status`, `card_type`, `card_price`, `received_card_amount`, `profile_pic`, `created_at`, `updated_at`) VALUES
(1, 90, '507525014653', 'KUMAR SINGH', 'KUMAR SINGH', 'KUMAR SINGH', 'KUMAR SINGH', 5, 96, '4455', '7888888888', '9999999999', 'KUMAR SINGH', '4', 'Intermediate', 'NM', NULL, '2026-03', '2026', 'KUMAR SINGH', 'Post Graduation', '6', 'KUMAR SINGH', 'Intermediate', '4', 'KUMAR SINGH', 'Intermediate', '2', 175000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1773779098.jpg', '2026-03-18 01:54:58', '2026-03-18 01:54:58'),
(2, 90, '500723241673', 'SHILA DEVI', 'Amit kumar yadav', 'Nikhrail', 'Nikhrail', 5, 96, '855105', '7370050601', '7370050601', 'NA', '22', 'Matric', NULL, NULL, '2028-04', '2028', 'NA', 'Study', '14', 'NA', 'Study', NULL, 'NA', 'Study', '12', 99000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775847130.jpg', '2026-04-11 00:22:10', '2026-04-11 00:22:10'),
(3, 97, '504533534385', 'USHA DEVI', 'RANJIT CHAUHAN', 'GULABAG PURNEA', 'GULABAG', 5, 96, '854301', '8882973932', '8882973932', 'NA', '9', 'Other', 'Teaching', NULL, '2026-12', '2033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775851778.jpeg', '2026-04-11 01:39:38', '2026-04-11 01:39:38'),
(4, 90, '502811192005', 'MD LUKMAN', 'MD JAMUDDIN', 'Pokhariya', 'Mufassil pokhariya', 5, 96, '854323', '7519181217', '7519181217', 'NA', '3', 'Study', 'NM', NULL, '2029-04', '2034', 'NA', 'Matric', '2', 'NA', 'Matric', NULL, NULL, 'Study', '6', 99000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775894273.jpg', '2026-04-11 13:27:53', '2026-04-11 13:27:53'),
(5, 90, '505658470254', 'RANI KUMARI', 'NA', 'Purnea', 'K hat', 5, 96, '854301', '7667432479', '7667432479', 'NA', '3', 'Study', 'NM', NULL, '2032-04', '2034', 'NA', 'Study', '08', 'NA', 'Matric', '06', 'NA', 'Other', '6', 99000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775924056.jpg', '2026-04-11 21:44:16', '2026-04-11 21:44:16'),
(6, 90, '502845700242', 'MUNNI DEVI', 'NA', 'MAHTA TOLA', 'SHRI NAGAR', 5, 96, '854301', '9693083570', '9898889999', 'NA', '9', 'Post Graduation', 'Other', NULL, '2026-08', '2034', 'NA', 'Post Graduation', '8', 'NA', 'Graduation', '7', 'NA', 'Matric', '15', 99000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775926811.jpeg', '2026-04-11 22:30:11', '2026-04-11 22:30:11'),
(7, 97, '508065153228', 'MUNNI DEVI', 'PAPPU YADAV', 'BABHANI', 'BABHANI', 5, 96, '854301', '9142095671', '9142095671', 'NA', '9', 'Other', 'NM', NULL, '2026-08', '2034', 'NA', 'Post Graduation', '7', 'NA', 'Post Graduation', '8', 'NA', 'Post Graduation', '8', 99000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775931651.jpeg', '2026-04-11 23:50:51', '2026-04-11 23:50:51'),
(8, 97, '507071472358', 'SIKHA DEVI', 'DILIP DASH rana', 'NIKHRAIL rana', 'NIKHRAIL rana', 5, 96, '8543012222', '9801080122', '9801080122', 'NA rana', '922', 'Post Graduation', 'Private Job', NULL, '2026-12', '2033', 'wwww', 'Intermediate', '62', 'NAww', 'Intermediate', '82', 'NAww', 'Intermediate', '163', 175000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1780771501.jpg', '2026-04-12 00:17:07', '2026-06-06 18:45:48'),
(9, 97, '506859017083', 'MUNNI HEMRAM', 'ARJUN KUMAR TUDDU', 'NAYA TOLA NIKHRAIL', 'NIKHRAIL', 5, 96, '854301', '7261887617', '7261887617', 'NA', '0', 'Other', 'Other', NULL, '2026-12', '2034', 'NA', 'Other', '0', 'NA', 'Other', '0', 'NA', 'Other', '0', 51000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775934350.jpeg', '2026-04-12 00:35:50', '2026-04-12 00:35:50'),
(10, 107, '503323669261', 'SUNITA DEVI', 'PANKAJ RISHI', 'NIKHRIL', 'NIKHRIAL', 5, 96, '854301', '9102076058', '9102076058', 'NA', '0', 'Other', 'Farmer', NULL, '2026-12', '2034', 'NA', 'Other', '0', 'NA', 'Other', '0', 'NA', 'Other', '0', 51000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775935675.jpeg', '2026-04-12 00:57:55', '2026-04-12 00:57:55'),
(11, 102, '506915289402', 'RUTH TUDU', 'EMEN SOREN', 'BARETH  GARBANELI', 'GARBANELI', 5, 96, '854325', '7909092094', '7909092094', 'NA', '0', 'Other', 'Farmer', NULL, '2028-04', '2034', 'NA', 'Other', '0', 'NA', 'Other', '0', 'NA', 'Other', '0', 51000, NULL, NULL, 1, 'physical', NULL, NULL, 'uploads/members/profile_pic_1775989758.jpg', '2026-04-12 15:59:18', '2026-04-12 15:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `member_messages`
--

CREATE TABLE `member_messages` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `membership_number` varchar(255) DEFAULT NULL,
  `messages` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_messages`
--

INSERT INTO `member_messages` (`id`, `user_id`, `member_id`, `membership_number`, `messages`, `created_at`, `updated_at`) VALUES
(1, 90, 1, '507525014653', 'प्रिय KUMAR SINGH, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 507525014653 कुल प्राप्त राशि : ₹999/-', '2026-03-18 01:54:58', '2026-03-18 01:54:58'),
(2, 90, NULL, NULL, 'प्रिय KUMAR SINGH,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 144870539\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 7888888888\nपासवर्ड : 123456789\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-03-20 01:41:58', '2026-03-20 01:41:58'),
(3, NULL, NULL, NULL, 'बधाई हो HEENA DEVI जी, आपकी ऑनबोर्डिंग प्रक्रिया सफलतापूर्वक पूर्ण कर दी गई है। अब आपको अगले 30 दिनों के भीतर 10 + 6 = 16 प्रखंड विभाग मित्र की बहाली सुनिश्चित करनी है। आपके उज्ज्वल एवं सफल कार्यकाल के लिए शुभकामनाएँ। धन्यवाद।', '2026-03-30 15:26:41', '2026-03-30 15:26:41'),
(4, 92, NULL, NULL, 'बधाई हो HEENA DEVI जी, आपकी ऑनबोर्डिंग प्रक्रिया सफलतापूर्वक पूर्ण कर दी गई है। अब आपको अगले 30 दिनों के भीतर 10 + 6 = 16 प्रखंड विभाग मित्र की बहाली सुनिश्चित करनी है। आपके उज्ज्वल एवं सफल कार्यकाल के लिए शुभकामनाएँ। धन्यवाद।', '2026-03-30 15:26:41', '2026-03-30 15:26:41'),
(5, NULL, NULL, NULL, 'बधाई हो HEENA DEVI जी, आपकी ऑनबोर्डिंग प्रक्रिया सफलतापूर्वक पूर्ण कर दी गई है। अब आपको अगले 30 दिनों के भीतर 10 + 6 = 16 प्रखंड विभाग मित्र की बहाली सुनिश्चित करनी है। आपके उज्ज्वल एवं सफल कार्यकाल के लिए शुभकामनाएँ। धन्यवाद।', '2026-04-01 00:10:08', '2026-04-01 00:10:08'),
(6, 92, NULL, NULL, 'बधाई हो HEENA DEVI जी, आपकी ऑनबोर्डिंग प्रक्रिया सफलतापूर्वक पूर्ण कर दी गई है। अब आपको अगले 30 दिनों के भीतर 10 + 6 = 16 प्रखंड विभाग मित्र की बहाली सुनिश्चित करनी है। आपके उज्ज्वल एवं सफल कार्यकाल के लिए शुभकामनाएँ। धन्यवाद।', '2026-04-01 00:10:08', '2026-04-01 00:10:08'),
(7, 90, 2, '500723241673', 'प्रिय SHILA DEVI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 500723241673 कुल प्राप्त राशि : ₹999/-', '2026-04-11 00:22:10', '2026-04-11 00:22:10'),
(8, 90, NULL, NULL, 'प्रिय SHILA DEVI,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 146491051\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 7370050601\nपासवर्ड : 123456\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-04-11 01:21:41', '2026-04-11 01:21:41'),
(9, 97, 3, '504533534385', 'प्रिय USHA DEVI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 504533534385 कुल प्राप्त राशि : ₹999/-', '2026-04-11 01:39:38', '2026-04-11 01:39:38'),
(10, 90, NULL, NULL, 'बधाई हो SHILA DEVI जी, आपकी ऑनबोर्डिंग प्रक्रिया सफलतापूर्वक पूर्ण कर दी गई है। अब आपको अगले 30 दिनों के भीतर 10 + 6 = 16 प्रखंड विभाग मित्र की बहाली सुनिश्चित करनी है। आपके उज्ज्वल एवं सफल कार्यकाल के लिए शुभकामनाएँ। धन्यवाद।', '2026-04-11 12:31:57', '2026-04-11 12:31:57'),
(11, 97, NULL, NULL, 'बधाई हो SHILA DEVI जी, आपकी ऑनबोर्डिंग प्रक्रिया सफलतापूर्वक पूर्ण कर दी गई है। अब आपको अगले 30 दिनों के भीतर 10 + 6 = 16 प्रखंड विभाग मित्र की बहाली सुनिश्चित करनी है। आपके उज्ज्वल एवं सफल कार्यकाल के लिए शुभकामनाएँ। धन्यवाद।', '2026-04-11 12:31:57', '2026-04-11 12:31:57'),
(12, 90, 4, '502811192005', 'प्रिय MD LUKMAN, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 502811192005 कुल प्राप्त राशि : ₹999/-', '2026-04-11 13:27:53', '2026-04-11 13:27:53'),
(13, 90, 5, '505658470254', 'प्रिय RANI KUMARI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 505658470254 कुल प्राप्त राशि : ₹999/-', '2026-04-11 21:44:16', '2026-04-11 21:44:16'),
(14, 90, NULL, NULL, 'प्रिय RANI KUMARI,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 141729431\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 7667432479\nपासवर्ड : 123456789\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-04-11 21:56:10', '2026-04-11 21:56:10'),
(15, 90, NULL, NULL, 'प्रिय MD LUKMAN,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 149386380\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 7519181217\nपासवर्ड : 123456789\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-04-11 22:11:48', '2026-04-11 22:11:48'),
(16, 90, 6, '502845700242', 'प्रिय MUNNI DEVI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 502845700242 कुल प्राप्त राशि : ₹999/-', '2026-04-11 22:30:11', '2026-04-11 22:30:11'),
(17, 90, NULL, NULL, 'प्रिय MUNNI DEVI,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 147237084\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 9693083570\nपासवर्ड : 123456789\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-04-11 22:33:33', '2026-04-11 22:33:33'),
(18, 97, NULL, NULL, 'प्रिय USHA DEVI,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 146273173\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 8825171386\nपासवर्ड : 123456\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-04-11 23:43:35', '2026-04-11 23:43:35'),
(19, 97, 7, '508065153228', 'प्रिय MUNNI DEVI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 508065153228 कुल प्राप्त राशि : ₹999/-', '2026-04-11 23:50:51', '2026-04-11 23:50:51'),
(20, 97, 8, '507071472358', 'प्रिय SIKHA DEVI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 507071472358 कुल प्राप्त राशि : ₹999/-', '2026-04-12 00:17:07', '2026-04-12 00:17:07'),
(21, 97, 9, '506859017083', 'प्रिय MUNNI HEMRAM, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 506859017083 कुल प्राप्त राशि : ₹999/-', '2026-04-12 00:35:50', '2026-04-12 00:35:50'),
(22, 107, 10, '503323669261', 'प्रिय SUNITA DEVI, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 503323669261 कुल प्राप्त राशि : ₹999/-', '2026-04-12 00:57:55', '2026-04-12 00:57:55'),
(23, 102, 11, '506915289402', 'प्रिय RUTH TUDU, आपका आयुष्मति मेंबरशिप फिजिकल कार्ड सफलतापूर्वक जारी कर दिया गया है। आपकी आयुष्मति मेंबरशिप संख्या : 506915289402 कुल प्राप्त राशि : ₹999/-', '2026-04-12 15:59:18', '2026-04-12 15:59:18'),
(24, 112, NULL, NULL, 'प्रिय SHILA DEVI,\n\nआपका प्रखंड विवाह मित्र पद हेतु आवेदन सफलतापूर्वक प्राप्त हो गया है।\n\n🔹 प्रखंड विवाह मित्र कोड : 147464326\n\n📲 ऐप डाउनलोड करें :\nhttps://play.google.com/store/apps/details?id=com.growciti.vivahmitra\n\n🔑 लॉग-इन विवरण:\nआईडी : 7370050602\nपासवर्ड : 123456\n\n⏳ ऑनबोर्डिंग 24–48 घंटे में पूर्ण कर दी जाएगी।\nकृपया धैर्यपूर्वक प्रतीक्षा करें।', '2026-05-14 18:56:41', '2026-05-14 18:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `route`, `icon`, `permission`, `parent_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master', '#', 'fe fe-git-branch', NULL, 0, 0, 1, '2025-12-12 12:28:13', '2025-12-12 12:28:13'),
(2, 'Session', 'admin.session', NULL, NULL, 1, 0, 1, '2025-12-12 12:57:55', '2025-12-12 12:57:55'),
(3, 'Branch', 'admin.branch', NULL, NULL, 1, 1, 1, '2025-12-12 12:58:37', '2025-12-12 12:58:37'),
(4, 'User Type', 'admin.user_type', NULL, NULL, 1, 2, 1, '2025-12-12 13:20:20', '2025-12-12 13:20:20'),
(5, 'User Designation', 'admin.designations', NULL, NULL, 1, 0, 1, '2025-12-15 11:01:32', '2025-12-15 11:01:32'),
(6, 'Set Fund', 'admin.funds', NULL, NULL, 1, 0, 1, '2025-12-15 11:02:58', '2025-12-15 11:02:58'),
(7, 'Agreement List', 'admin.agreement', NULL, NULL, 1, 5, 1, '2025-12-15 11:03:35', '2025-12-15 11:03:35'),
(8, 'Master Target', 'admin.target', NULL, NULL, 1, 0, 1, '2025-12-15 11:05:41', '2025-12-15 11:05:41'),
(9, 'Master Video List', 'admin.mvideo', NULL, NULL, 1, 0, 1, '2025-12-15 11:08:04', '2025-12-15 11:08:04'),
(10, 'Master Yearly Bonus List', 'admin.yearlyBonus', NULL, NULL, 1, 0, 1, '2025-12-15 11:10:43', '2025-12-15 11:10:43'),
(11, 'Company Fund', '#', 'ri-money-rupee-circle-line', NULL, 0, 1, 1, '2025-12-15 11:18:15', '2025-12-15 11:18:15'),
(12, 'Fund Transfer to Branch', 'admin.funds.fundTransferToBranch', '', NULL, 11, 0, 1, '2025-12-15 11:18:15', '2025-12-15 11:18:15'),
(13, 'Fund Transfer to Employee', 'admin.funds.fundTransferToEmployee', NULL, NULL, 11, 1, 1, '2025-12-15 11:52:51', '2025-12-17 12:12:07'),
(14, 'Fund Transfer to BDM', '#', NULL, NULL, 11, 2, 1, '2025-12-15 11:53:12', '2025-12-15 11:53:12'),
(15, 'Product Management', '#', 'ri-product-hunt-line', NULL, 0, 2, 1, '2025-12-15 11:55:33', '2025-12-15 11:55:33'),
(16, 'Employee Management', '#', 'ri-file-user-fill', NULL, 0, 3, 1, '2025-12-15 11:56:11', '2025-12-15 11:56:11'),
(17, 'Category', 'admin.product_categories.index', NULL, NULL, 15, 0, 1, '2025-12-15 11:58:39', '2025-12-15 11:58:39'),
(18, 'Brands', 'admin.brand.index', NULL, NULL, 15, 1, 1, '2025-12-15 11:58:59', '2025-12-15 12:47:01'),
(19, 'Products', 'admin.products.index', NULL, NULL, 15, 2, 1, '2025-12-15 11:59:22', '2025-12-15 11:59:22'),
(20, 'Employee List', 'admin.staffs.index', NULL, NULL, 16, 0, 1, '2025-12-15 12:01:10', '2025-12-15 12:01:10'),
(21, 'Vivah Mitra Management', '#', 'ri-file-user-fill', NULL, 0, 4, 1, '2025-12-15 12:02:14', '2025-12-18 14:20:24'),
(22, 'Membership Management', '#', 'ri-id-card-fill', NULL, 0, 5, 1, '2025-12-15 12:03:03', '2025-12-15 12:03:03'),
(23, 'Generate Vivah Mitra Code', 'admin.staffs.generateVivahMitraCode', NULL, NULL, 21, 0, 1, '2025-12-15 12:04:20', '2025-12-18 14:21:13'),
(24, 'Generate Membership Number', 'admin.membership.generateMembershipNumber', NULL, NULL, 22, 0, 1, '2025-12-15 12:06:07', '2025-12-15 12:06:07'),
(25, 'Add Physical Card Member', 'admin.membership.addMember', NULL, NULL, 22, 1, 1, '2025-12-15 12:06:40', '2025-12-15 12:06:40'),
(26, 'Add Digital Card Member', 'admin.membership.addDigitalCardMember', NULL, NULL, 22, 2, 1, '2025-12-15 12:08:36', '2025-12-15 12:08:36'),
(27, 'Vivah Mitra List', 'admin.staffs.vivahMitraList', NULL, NULL, 21, 2, 1, '2025-12-18 14:21:56', '2025-12-18 14:21:56'),
(28, 'Transfer Product to Branch', 'admin.product.productTransferToBranch', NULL, NULL, 15, 4, 1, '2025-12-22 14:35:04', '2025-12-22 14:35:04'),
(29, 'Branch Product List', 'admin.product.branchProductList', NULL, NULL, 15, 5, 1, '2025-12-22 14:35:59', '2025-12-22 14:35:59'),
(30, 'Sale', '#', 'fe fe-box', NULL, 0, 6, 1, '2025-12-23 13:39:27', '2025-12-23 13:39:27'),
(31, 'Sale with Incentive', 'admin.sale.incentiveSale', NULL, NULL, 30, 1, 1, '2025-12-23 13:40:21', '2025-12-23 13:40:21'),
(32, 'Cash Sale', 'admin.sale.cashSale', NULL, NULL, 30, 2, 1, '2025-12-23 13:41:38', '2025-12-23 13:41:38'),
(33, 'Incentive Sale List', 'admin.sale.incentiveSaleList', NULL, NULL, 30, 3, 1, '2025-12-24 11:57:09', '2025-12-24 11:57:09'),
(34, 'Wallet', '#', 'ri-file-user-fill', NULL, 0, 7, 1, '2025-12-25 11:01:57', '2025-12-25 11:01:57'),
(35, 'e-Wallet', 'admin.wallet.eWallet', NULL, NULL, 34, 0, 1, '2025-12-25 11:03:07', '2025-12-25 11:03:07'),
(36, 'Fund Wallet', 'admin.wallet.fundWallet', NULL, NULL, 34, 0, 1, '2025-12-25 11:03:25', '2025-12-25 11:03:25');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_16_104443_create_master_designations_table', 1),
(6, '2023_03_16_113407_create_user_designations_table', 1),
(7, '2023_03_16_113856_create_user_logins_table', 1),
(8, '2023_03_16_114715_create_user_types_table', 1),
(9, '2023_03_16_120608_create_categories_table', 1),
(10, '2023_03_16_120725_create_blogs_table', 1),
(11, '2023_03_16_120808_create_countries_table', 1),
(12, '2023_03_22_043216_create_image_categories_table', 1),
(13, '2023_03_22_052225_create_galleries_table', 1),
(38, '2023_03_16_120826_create_states_table', 1),
(39, '2023_03_16_120841_create_cities_table', 1),
(42, '2014_10_12_000000_create_users_table', 2),
(43, '2014_10_12_100000_create_password_resets_table', 2),
(44, '2019_08_19_000000_create_failed_jobs_table', 2),
(45, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(46, '2023_03_16_104443_create_master_designations_table', 2),
(47, '2023_03_16_113407_create_user_designations_table', 2),
(48, '2023_03_16_113856_create_user_logins_table', 2),
(49, '2023_03_16_114715_create_user_types_table', 2),
(50, '2023_03_16_120608_create_categories_table', 2),
(51, '2023_03_16_120725_create_blogs_table', 2),
(52, '2023_03_16_120808_create_countries_table', 2),
(53, '2023_03_22_043216_create_image_categories_table', 2),
(54, '2023_03_22_052225_create_galleries_table', 2),
(55, '2023_03_22_102335_create_menus_table', 3),
(56, '2023_03_22_103138_create_cms_pages_table', 3),
(57, '2023_03_28_044047_create_testimonials_table', 4),
(58, '2026_07_06_000001_create_property_videos_table', 5),
(59, '2026_07_12_000001_create_customer_posts_table', 6),
(60, '2026_07_13_000001_add_publication_fields_to_customer_posts_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_routines`
--

CREATE TABLE `monthly_routines` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monthly_routines`
--

INSERT INTO `monthly_routines` (`id`, `user_id`, `month`, `day`, `date`, `place`, `work`, `created_at`, `updated_at`) VALUES
(1, 113, '2026-05', 'Thursday', '2026-05-06', 'Katihar हारयािहीटाके', 'Yoll योलएलतोये', '2026-05-06 02:34:57', '2026-05-06 02:34:57'),
(3, 112, '2026-06', 'Monday', '2026-05-16', 'Purnia', 'Meeting', '2026-05-15 16:25:45', '2026-05-15 16:25:45'),
(4, 112, '2026-06', 'Tuesday', '2026-05-16', 'Purnia 2', 'Meeting 2', '2026-05-15 16:25:45', '2026-05-15 16:25:45'),
(5, 112, '2026-06', 'Monday', '2026-05-22', 'Purnia', 'Meeting', '2026-05-15 16:42:57', '2026-05-15 16:42:57'),
(6, 112, '2026-06', 'Tuesday', '2026-05-16', 'Purnia 2', 'Meeting', '2026-05-15 16:42:57', '2026-05-15 16:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `m_video_categories`
--

CREATE TABLE `m_video_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_video_categories`
--

INSERT INTO `m_video_categories` (`id`, `parent_id`, `name`, `slug`, `description`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'पहला कदम', 'pahal-kathama', NULL, NULL, 1, NULL, '2026-03-22 21:50:03', '2026-03-22 21:50:03'),
(2, NULL, 'दूसरा कदम', 'thasara-kathama', NULL, NULL, 1, NULL, '2026-03-22 21:50:25', '2026-03-22 21:50:25'),
(3, NULL, 'तीसरा कदम', 'tasara-kathama', NULL, NULL, 1, NULL, '2026-03-22 21:50:39', '2026-03-22 21:50:39'),
(4, 1, 'ट्रेनिंग प्रोग्राम विडियो', 'taranaga-paragarama-vadaya', NULL, NULL, 1, NULL, '2026-03-22 21:54:19', '2026-03-22 21:54:19'),
(5, 1, 'Super', 'super', NULL, NULL, 1, NULL, '2026-03-22 22:06:19', '2026-03-22 22:06:19'),
(6, 2, 'SUPER FAST OFFER', 'dfgdfgd', NULL, NULL, 1, NULL, '2026-03-23 21:15:23', '2026-04-11 23:23:48'),
(7, 4, 'part 22', 'part-22', NULL, NULL, 1, NULL, '2026-04-08 13:47:12', '2026-04-08 13:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `title` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `links` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_enquiries`
--

CREATE TABLE `online_enquiries` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `datetimee` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `page` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `online_enquiries`
--

INSERT INTO `online_enquiries` (`id`, `first_name`, `last_name`, `gender`, `email`, `phone`, `project`, `city`, `state`, `pincode`, `message`, `address`, `datetimee`, `status`, `page`, `subject`, `created_at`, `updated_at`) VALUES
(1, 'Sumit Test', NULL, NULL, 'ranasharma880@gmail.com', '8825171386', NULL, NULL, NULL, NULL, 'ddd', NULL, NULL, 1, NULL, '', '2024-12-31 01:47:57', '2024-12-31 01:47:57'),
(2, 'Rana Home', NULL, NULL, 'ranahome@gmail.com', '9634411260', NULL, NULL, NULL, NULL, 'Test by Rana Home', NULL, NULL, 1, 'home_enquiry_form', NULL, '2025-01-04 00:00:40', '2025-01-04 00:00:40'),
(3, 'Rana Complain', NULL, NULL, 'ranacomplian@gmail.com', '6225171386', NULL, NULL, NULL, NULL, 'Complain details', NULL, NULL, 1, NULL, '', '2025-01-04 00:26:09', '2025-01-04 00:26:09'),
(4, 'Sharma', NULL, NULL, 'ranasharma880@gmail.com', '9825171386', NULL, NULL, NULL, NULL, 'wqsqwsqwsqws', NULL, NULL, 1, 'complain_enquiry_form', NULL, '2025-01-04 00:30:03', '2025-01-04 00:30:03'),
(5, 'Rana Sharma', NULL, NULL, 'info@webmaker.in', '8825171386', NULL, NULL, NULL, NULL, 'dfbdfbdfb', NULL, NULL, 1, 'home_enquiry_form', NULL, '2026-06-24 08:55:06', '2026-06-24 08:55:06'),
(6, 'Rana Sharma', NULL, NULL, 'info@webmaker.in', '8825171386', NULL, NULL, NULL, NULL, 'Test Message', NULL, NULL, 1, 'home_enquiry_form', NULL, '2026-06-24 08:58:46', '2026-06-24 08:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_green` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `page_id`, `section_name`, `title`, `title_green`, `description`, `image`, `banner_image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'section_1', 'Section One', 'Section One', 'Section One', NULL, NULL, 1, 1, NULL, '2026-07-06 14:02:51', '2026-07-06 06:28:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `panchayats`
--

CREATE TABLE `panchayats` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '1-Active,2-Pending,3-Deleted,4-Removed',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `panchayats`
--

INSERT INTO `panchayats` (`id`, `block_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basudeopur', 0, '2026-03-17 23:39:03', '2026-03-20 01:28:09'),
(2, 1, 'Chanka (Chanka Chauka)', 0, '2026-03-17 23:39:11', '2026-03-20 01:28:10'),
(3, 1, 'Garhia Baluwa', 0, '2026-03-17 23:39:17', '2026-03-20 01:28:10'),
(4, 1, 'Jageli', 0, '2026-03-17 23:39:24', '2026-03-20 01:28:12'),
(5, 1, 'Jhunni', 0, '2026-03-17 23:39:32', '2026-03-20 01:28:14'),
(6, 1, 'Jhunni Kala', 1, '2026-03-17 23:39:38', '2026-03-17 23:39:38'),
(7, 1, 'Khokha', 1, '2026-03-17 23:39:45', '2026-03-17 23:39:45'),
(8, 1, 'Khokha North', 1, '2026-03-17 23:39:51', '2026-03-17 23:39:51'),
(9, 1, 'Khokha South', 1, '2026-03-17 23:39:57', '2026-03-17 23:39:57'),
(10, 1, 'Khuti Haseli', 1, '2026-03-17 23:40:04', '2026-03-17 23:40:04'),
(11, 1, 'Khuti Dhunaili', 1, '2026-03-17 23:40:13', '2026-03-17 23:40:13'),
(12, 1, 'Nathpur', 1, '2026-03-17 23:40:23', '2026-03-17 23:40:23'),
(13, 1, 'Nipania', 1, '2026-03-17 23:40:33', '2026-03-17 23:40:33'),
(14, 1, 'Rustampur', 1, '2026-03-17 23:40:40', '2026-03-17 23:40:40'),
(15, 1, 'Singhia', 1, '2026-03-17 23:40:50', '2026-03-17 23:40:50'),
(16, 1, 'Srinagar', 1, '2026-03-17 23:40:57', '2026-03-17 23:40:57'),
(17, 1, 'Sukhsena East', 1, '2026-03-17 23:41:04', '2026-03-17 23:41:04'),
(18, 1, 'Khokha', 1, '2026-03-17 23:41:19', '2026-03-20 01:29:27'),
(20, 13, 'अधखेली', 0, '2026-04-11 00:57:20', '2026-04-11 01:12:15'),
(21, 13, 'दरियापुर', 1, '2026-04-11 00:57:32', '2026-04-11 00:57:32'),
(22, 13, 'दुबेली', 1, '2026-04-11 00:58:05', '2026-04-11 00:58:05'),
(23, 13, 'हरखली', 1, '2026-04-11 00:58:21', '2026-04-11 00:58:21'),
(24, 13, 'इचलो', 1, '2026-04-11 00:58:46', '2026-04-11 00:58:46'),
(25, 13, 'ठठोर', 1, '2026-04-11 00:59:03', '2026-04-11 00:59:03'),
(26, 13, 'दगारुआ', 1, '2026-04-11 00:59:28', '2026-04-11 00:59:28'),
(27, 13, 'तेघड़ा', 1, '2026-04-11 01:00:44', '2026-04-11 01:00:44'),
(28, 13, 'बभनी', 1, '2026-04-11 01:13:46', '2026-04-11 01:13:46'),
(29, 13, 'बेलगाछी', 1, '2026-04-11 01:14:01', '2026-04-11 01:14:01'),
(30, 13, 'बुवारी', 1, '2026-04-11 01:14:16', '2026-04-11 01:14:16'),
(31, 13, 'चम्पी', 1, '2026-04-11 01:14:30', '2026-04-11 01:14:30'),
(32, 13, 'कोहिला', 1, '2026-04-11 01:14:46', '2026-04-11 01:14:46'),
(33, 13, 'मठौर', 1, '2026-04-11 01:14:59', '2026-04-11 01:14:59'),
(34, 13, 'मजगामा', 1, '2026-04-11 01:15:16', '2026-04-11 01:15:16'),
(35, 13, 'मकेली', 1, '2026-04-11 01:15:30', '2026-04-11 01:15:30'),
(36, 13, 'रामपुर', 1, '2026-04-11 01:15:45', '2026-04-11 01:15:45'),
(37, 13, 'तौली', 1, '2026-04-11 01:15:59', '2026-04-11 01:15:59'),
(38, 9, 'सरसी (Sarsi)', 1, '2026-04-11 21:49:05', '2026-04-11 21:49:05'),
(39, 9, 'बरदेला (Bardela)', 1, '2026-04-11 21:49:25', '2026-04-11 21:49:25'),
(40, 9, 'बरदेला (Bardela)', 1, '2026-04-11 21:49:45', '2026-04-11 21:49:45'),
(41, 9, 'बिशनपुर (Bisanpur)', 1, '2026-04-11 21:50:28', '2026-04-11 21:50:28'),
(42, 9, 'चंपावती (Champawati)', 1, '2026-04-11 21:50:38', '2026-04-11 21:50:38'),
(43, 9, 'चिकनी डुमरिया (Chikni Dumariya)', 1, '2026-04-11 21:50:48', '2026-04-11 21:50:48'),
(44, 9, 'दमगड़ा', 1, '2026-04-11 21:50:59', '2026-04-11 21:50:59'),
(45, 9, 'माली', 1, '2026-04-11 21:51:11', '2026-04-11 21:51:11'),
(46, 9, 'कुआरी', 1, '2026-04-11 21:51:27', '2026-04-11 21:51:27'),
(47, 9, 'रजो थारी', 1, '2026-04-11 21:51:41', '2026-04-11 21:51:41'),
(48, 9, 'दमैली', 1, '2026-04-11 21:51:51', '2026-04-11 21:51:51'),
(49, 9, 'रंगपुरा दक्षिण', 1, '2026-04-11 21:52:02', '2026-04-11 21:52:02'),
(50, 9, 'राजघाट गरैल', 1, '2026-04-11 21:52:11', '2026-04-11 21:52:11'),
(51, 9, 'इटहरी', 1, '2026-04-11 21:52:22', '2026-04-11 21:52:22'),
(52, 9, 'किशनपुर बलुआ  Purnea District', 1, '2026-04-11 21:52:34', '2026-04-11 21:52:34'),
(53, 5, 'बरेटा', 1, '2026-04-12 16:11:46', '2026-04-12 16:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `partner_sections`
--

CREATE TABLE `partner_sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_section_datas`
--

CREATE TABLE `partner_section_datas` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1,
  `other` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ranasharma880@gmail.com', 'afca09851eb27afe0c1df65cc7e4c8e46be0bde83fdc1358a3119928c5c9252c', '2026-07-01 07:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `payment_screenshots`
--

CREATE TABLE `payment_screenshots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_screenshots`
--

INSERT INTO `payment_screenshots` (`id`, `payment_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'screenshots/oDIC5ycG7rQFTLEMPdc8Djeymr4FOA0SMnGXuGLK.jpg', '2026-04-30 20:45:28', '2026-04-30 20:45:28'),
(2, 1, 'screenshots/jw38ChUF9V5986FE5vjg99ybq3ZYFgVHKYVi3oq3.png', '2026-04-30 20:45:28', '2026-04-30 20:45:28'),
(3, 2, 'screenshots/oDIC5ycG7rQFTLEMPdc8Djeymr4FOA0SMnGXuGLK.jpg', '2026-04-30 20:45:53', '2026-04-30 20:45:53'),
(4, 2, 'screenshots/jw38ChUF9V5986FE5vjg99ybq3ZYFgVHKYVi3oq3.png', '2026-04-30 20:45:53', '2026-04-30 20:45:53'),
(5, 3, 'uploads/pay_screenshots/1777582311_G40IONCAATvOjy2SgisstC2xeJCX5XIOtaBfXIKI.jpg', '2026-04-30 20:51:51', '2026-04-30 20:51:51'),
(6, 3, 'uploads/pay_screenshots/1777582311_sC54Bj79TswbxKT5txPXHgo6gUAl1ErmL3iVmOvK.png', '2026-04-30 20:51:51', '2026-04-30 20:51:51'),
(7, 4, 'uploads/pay_screenshots/1777582638_gJfHpmkZsnLK7W9TLNNm90QDDSTKcugf1jffApTm.png', '2026-04-30 20:57:18', '2026-04-30 20:57:18'),
(8, 4, 'uploads/pay_screenshots/1777582638_3ULUS2djglYEHxadBtJVkzvZqJ8COD8Cf69uzdNK.jpg', '2026-04-30 20:57:18', '2026-04-30 20:57:18'),
(11, 6, 'uploads/pay_screenshots/1778139349_ZI97ZDiSifrBT6yJEFfd5CmGJwAKxaUaABwUnaQX.jpg', '2026-05-07 13:05:49', '2026-05-07 13:05:49'),
(12, 6, 'uploads/pay_screenshots/1778139349_kjBkVKKSMkYpYtqltUAp9lBJdbYSCLDfeUvO4bTY.jpg', '2026-05-07 13:05:49', '2026-05-07 13:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `payment_submissions`
--

CREATE TABLE `payment_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `day` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `no_of_screenshot` int(11) NOT NULL DEFAULT 0,
  `status` enum('pending','verified') NOT NULL DEFAULT 'pending',
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_submissions`
--

INSERT INTO `payment_submissions` (`id`, `user_id`, `name`, `date`, `day`, `time`, `total_amount`, `no_of_screenshot`, `status`, `remarks`, `created_at`, `updated_at`, `verified_by`) VALUES
(1, 84, 'Rana ASM', '2026-05-01', 'Friday', '02:15:28', 1500.00, 2, 'pending', NULL, '2026-04-30 20:45:28', '2026-04-30 20:45:28', NULL),
(2, 84, 'Rana ASM', '2026-05-01', 'Friday', '02:15:53', 1500.00, 2, 'pending', NULL, '2026-04-30 20:45:53', '2026-04-30 20:45:53', NULL),
(3, 84, 'Rana ASM', '2026-05-01', 'Friday', '02:21:51', 1000.00, 2, 'pending', NULL, '2026-04-30 20:51:51', '2026-04-30 20:51:51', NULL),
(4, 84, 'Rana ASM', '2026-05-01', 'Friday', '02:27:18', 100.00, 2, 'pending', NULL, '2026-04-30 20:57:18', '2026-04-30 20:57:18', NULL),
(6, 113, 'OM PRAKASH SAH', '2026-05-07', 'Thursday', '13:05:49', 5400.00, 2, 'verified', NULL, '2026-05-07 13:05:49', '2026-05-12 21:57:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_temps`
--

CREATE TABLE `payment_temps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prakhand_vm_boxes`
--

CREATE TABLE `prakhand_vm_boxes` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `box_key` varchar(255) DEFAULT NULL,
  `is_filled` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prakhand_vm_boxes`
--

INSERT INTO `prakhand_vm_boxes` (`id`, `user_id`, `box_key`, `is_filled`, `created_at`, `updated_at`) VALUES
(1, 90, 'BOX_90_1', 1, '2026-03-13 10:39:33', '2026-03-20 01:41:58'),
(2, 90, 'BOX_90_2', 1, '2026-03-13 10:39:33', '2026-04-11 01:21:41'),
(3, 90, 'BOX_90_3', 1, '2026-03-13 10:39:33', '2026-04-11 21:56:10'),
(4, 90, 'BOX_90_4', 1, '2026-03-13 10:39:33', '2026-04-11 22:11:48'),
(5, 90, 'BOX_90_5', 1, '2026-03-13 10:39:33', '2026-04-11 22:33:33'),
(6, 90, 'BOX_90_6', 0, '2026-03-13 10:39:33', NULL),
(7, 90, 'BOX_90_7', 0, '2026-03-13 10:39:33', NULL),
(8, 90, 'BOX_90_8', 0, '2026-03-13 10:39:33', NULL),
(9, 90, 'BOX_90_9', 0, '2026-03-13 10:39:33', NULL),
(10, 90, 'BOX_90_10', 0, '2026-03-13 10:39:33', NULL),
(11, 90, 'BOX_90_11', 0, '2026-03-13 10:39:33', NULL),
(12, 90, 'BOX_90_12', 0, '2026-03-13 10:39:33', NULL),
(13, 90, 'BOX_90_13', 0, '2026-03-13 10:39:33', NULL),
(14, 90, 'BOX_90_14', 0, '2026-03-13 10:39:33', NULL),
(15, 90, 'BOX_90_15', 0, '2026-03-13 10:39:33', NULL),
(16, 90, 'BOX_90_16', 0, '2026-03-13 10:39:33', NULL),
(17, 90, 'BOX_90_17', 0, '2026-03-13 10:39:33', NULL),
(18, 90, 'BOX_90_18', 0, '2026-03-13 10:39:33', NULL),
(19, 90, 'BOX_90_19', 0, '2026-03-13 10:39:33', NULL),
(20, 90, 'BOX_90_20', 0, '2026-03-13 10:39:33', NULL),
(21, 91, 'BOX_91_1', 0, '2026-03-19 20:11:58', NULL),
(22, 91, 'BOX_91_2', 0, '2026-03-19 20:11:58', NULL),
(23, 91, 'BOX_91_3', 0, '2026-03-19 20:11:58', NULL),
(24, 91, 'BOX_91_4', 0, '2026-03-19 20:11:58', NULL),
(25, 91, 'BOX_91_5', 0, '2026-03-19 20:11:58', NULL),
(26, 91, 'BOX_91_6', 0, '2026-03-19 20:11:58', NULL),
(27, 91, 'BOX_91_7', 0, '2026-03-19 20:11:58', NULL),
(28, 91, 'BOX_91_8', 0, '2026-03-19 20:11:58', NULL),
(29, 91, 'BOX_91_9', 0, '2026-03-19 20:11:58', NULL),
(30, 91, 'BOX_91_10', 0, '2026-03-19 20:11:58', NULL),
(31, 91, 'BOX_91_11', 0, '2026-03-19 20:11:58', NULL),
(32, 91, 'BOX_91_12', 0, '2026-03-19 20:11:58', NULL),
(33, 91, 'BOX_91_13', 0, '2026-03-19 20:11:58', NULL),
(34, 91, 'BOX_91_14', 0, '2026-03-19 20:11:58', NULL),
(35, 91, 'BOX_91_15', 0, '2026-03-19 20:11:58', NULL),
(36, 91, 'BOX_91_16', 0, '2026-03-19 20:11:58', NULL),
(37, 91, 'BOX_91_17', 0, '2026-03-19 20:11:58', NULL),
(38, 91, 'BOX_91_18', 0, '2026-03-19 20:11:58', NULL),
(39, 91, 'BOX_91_19', 0, '2026-03-19 20:11:58', NULL),
(40, 91, 'BOX_91_20', 0, '2026-03-19 20:11:58', NULL),
(61, 97, 'BOX_97_1', 1, '2026-04-10 19:51:41', '2026-04-11 23:43:35'),
(62, 97, 'BOX_97_2', 1, '2026-04-10 19:51:41', '2026-04-12 00:05:33'),
(63, 97, 'BOX_97_3', 1, '2026-04-10 19:51:41', '2026-04-12 00:27:59'),
(64, 97, 'BOX_97_4', 1, '2026-04-10 19:51:41', '2026-04-12 00:39:45'),
(65, 97, 'BOX_97_5', 0, '2026-04-10 19:51:41', NULL),
(66, 97, 'BOX_97_6', 0, '2026-04-10 19:51:41', NULL),
(67, 97, 'BOX_97_7', 0, '2026-04-10 19:51:41', NULL),
(68, 97, 'BOX_97_8', 0, '2026-04-10 19:51:41', NULL),
(69, 97, 'BOX_97_9', 0, '2026-04-10 19:51:41', NULL),
(70, 97, 'BOX_97_10', 0, '2026-04-10 19:51:41', NULL),
(71, 97, 'BOX_97_11', 0, '2026-04-10 19:51:41', NULL),
(72, 97, 'BOX_97_12', 0, '2026-04-10 19:51:41', NULL),
(73, 97, 'BOX_97_13', 0, '2026-04-10 19:51:41', NULL),
(74, 97, 'BOX_97_14', 0, '2026-04-10 19:51:41', NULL),
(75, 97, 'BOX_97_15', 0, '2026-04-10 19:51:41', NULL),
(76, 97, 'BOX_97_16', 0, '2026-04-10 19:51:41', NULL),
(77, 97, 'BOX_97_17', 0, '2026-04-10 19:51:41', NULL),
(78, 97, 'BOX_97_18', 0, '2026-04-10 19:51:41', NULL),
(79, 97, 'BOX_97_19', 0, '2026-04-10 19:51:41', NULL),
(80, 97, 'BOX_97_20', 0, '2026-04-10 19:51:41', NULL),
(81, 102, 'BOX_102_1', 1, '2026-04-11 16:26:10', '2026-04-12 16:13:55'),
(82, 102, 'BOX_102_2', 0, '2026-04-11 16:26:10', NULL),
(83, 102, 'BOX_102_3', 0, '2026-04-11 16:26:10', NULL),
(84, 102, 'BOX_102_4', 0, '2026-04-11 16:26:10', NULL),
(85, 102, 'BOX_102_5', 0, '2026-04-11 16:26:10', NULL),
(86, 102, 'BOX_102_6', 0, '2026-04-11 16:26:10', NULL),
(87, 102, 'BOX_102_7', 0, '2026-04-11 16:26:10', NULL),
(88, 102, 'BOX_102_8', 0, '2026-04-11 16:26:10', NULL),
(89, 102, 'BOX_102_9', 0, '2026-04-11 16:26:10', NULL),
(90, 102, 'BOX_102_10', 0, '2026-04-11 16:26:10', NULL),
(91, 102, 'BOX_102_11', 0, '2026-04-11 16:26:10', NULL),
(92, 102, 'BOX_102_12', 0, '2026-04-11 16:26:10', NULL),
(93, 102, 'BOX_102_13', 0, '2026-04-11 16:26:10', NULL),
(94, 102, 'BOX_102_14', 0, '2026-04-11 16:26:10', NULL),
(95, 102, 'BOX_102_15', 0, '2026-04-11 16:26:10', NULL),
(96, 102, 'BOX_102_16', 0, '2026-04-11 16:26:10', NULL),
(97, 102, 'BOX_102_17', 0, '2026-04-11 16:26:10', NULL),
(98, 102, 'BOX_102_18', 0, '2026-04-11 16:26:10', NULL),
(99, 102, 'BOX_102_19', 0, '2026-04-11 16:26:10', NULL),
(100, 102, 'BOX_102_20', 0, '2026-04-11 16:26:10', NULL),
(101, 103, 'BOX_103_1', 0, '2026-04-11 16:41:48', NULL),
(102, 103, 'BOX_103_2', 0, '2026-04-11 16:41:48', NULL),
(103, 103, 'BOX_103_3', 0, '2026-04-11 16:41:48', NULL),
(104, 103, 'BOX_103_4', 0, '2026-04-11 16:41:48', NULL),
(105, 103, 'BOX_103_5', 0, '2026-04-11 16:41:48', NULL),
(106, 103, 'BOX_103_6', 0, '2026-04-11 16:41:48', NULL),
(107, 103, 'BOX_103_7', 0, '2026-04-11 16:41:48', NULL),
(108, 103, 'BOX_103_8', 0, '2026-04-11 16:41:48', NULL),
(109, 103, 'BOX_103_9', 0, '2026-04-11 16:41:48', NULL),
(110, 103, 'BOX_103_10', 0, '2026-04-11 16:41:48', NULL),
(111, 103, 'BOX_103_11', 0, '2026-04-11 16:41:48', NULL),
(112, 103, 'BOX_103_12', 0, '2026-04-11 16:41:48', NULL),
(113, 103, 'BOX_103_13', 0, '2026-04-11 16:41:48', NULL),
(114, 103, 'BOX_103_14', 0, '2026-04-11 16:41:48', NULL),
(115, 103, 'BOX_103_15', 0, '2026-04-11 16:41:48', NULL),
(116, 103, 'BOX_103_16', 0, '2026-04-11 16:41:48', NULL),
(117, 103, 'BOX_103_17', 0, '2026-04-11 16:41:48', NULL),
(118, 103, 'BOX_103_18', 0, '2026-04-11 16:41:48', NULL),
(119, 103, 'BOX_103_19', 0, '2026-04-11 16:41:48', NULL),
(120, 103, 'BOX_103_20', 0, '2026-04-11 16:41:48', NULL),
(121, 104, 'BOX_104_1', 0, '2026-04-11 17:03:33', NULL),
(122, 104, 'BOX_104_2', 0, '2026-04-11 17:03:33', NULL),
(123, 104, 'BOX_104_3', 0, '2026-04-11 17:03:33', NULL),
(124, 104, 'BOX_104_4', 0, '2026-04-11 17:03:33', NULL),
(125, 104, 'BOX_104_5', 0, '2026-04-11 17:03:33', NULL),
(126, 104, 'BOX_104_6', 0, '2026-04-11 17:03:33', NULL),
(127, 104, 'BOX_104_7', 0, '2026-04-11 17:03:33', NULL),
(128, 104, 'BOX_104_8', 0, '2026-04-11 17:03:33', NULL),
(129, 104, 'BOX_104_9', 0, '2026-04-11 17:03:33', NULL),
(130, 104, 'BOX_104_10', 0, '2026-04-11 17:03:33', NULL),
(131, 104, 'BOX_104_11', 0, '2026-04-11 17:03:33', NULL),
(132, 104, 'BOX_104_12', 0, '2026-04-11 17:03:33', NULL),
(133, 104, 'BOX_104_13', 0, '2026-04-11 17:03:33', NULL),
(134, 104, 'BOX_104_14', 0, '2026-04-11 17:03:33', NULL),
(135, 104, 'BOX_104_15', 0, '2026-04-11 17:03:33', NULL),
(136, 104, 'BOX_104_16', 0, '2026-04-11 17:03:33', NULL),
(137, 104, 'BOX_104_17', 0, '2026-04-11 17:03:33', NULL),
(138, 104, 'BOX_104_18', 0, '2026-04-11 17:03:33', NULL),
(139, 104, 'BOX_104_19', 0, '2026-04-11 17:03:33', NULL),
(140, 104, 'BOX_104_20', 0, '2026-04-11 17:03:33', NULL),
(141, 105, 'BOX_105_1', 0, '2026-04-11 18:13:35', NULL),
(142, 105, 'BOX_105_2', 0, '2026-04-11 18:13:35', NULL),
(143, 105, 'BOX_105_3', 0, '2026-04-11 18:13:35', NULL),
(144, 105, 'BOX_105_4', 0, '2026-04-11 18:13:35', NULL),
(145, 105, 'BOX_105_5', 0, '2026-04-11 18:13:35', NULL),
(146, 105, 'BOX_105_6', 0, '2026-04-11 18:13:35', NULL),
(147, 105, 'BOX_105_7', 0, '2026-04-11 18:13:35', NULL),
(148, 105, 'BOX_105_8', 0, '2026-04-11 18:13:35', NULL),
(149, 105, 'BOX_105_9', 0, '2026-04-11 18:13:35', NULL),
(150, 105, 'BOX_105_10', 0, '2026-04-11 18:13:35', NULL),
(151, 105, 'BOX_105_11', 0, '2026-04-11 18:13:35', NULL),
(152, 105, 'BOX_105_12', 0, '2026-04-11 18:13:35', NULL),
(153, 105, 'BOX_105_13', 0, '2026-04-11 18:13:35', NULL),
(154, 105, 'BOX_105_14', 0, '2026-04-11 18:13:35', NULL),
(155, 105, 'BOX_105_15', 0, '2026-04-11 18:13:35', NULL),
(156, 105, 'BOX_105_16', 0, '2026-04-11 18:13:35', NULL),
(157, 105, 'BOX_105_17', 0, '2026-04-11 18:13:35', NULL),
(158, 105, 'BOX_105_18', 0, '2026-04-11 18:13:35', NULL),
(159, 105, 'BOX_105_19', 0, '2026-04-11 18:13:35', NULL),
(160, 105, 'BOX_105_20', 0, '2026-04-11 18:13:35', NULL),
(161, 107, 'BOX_107_1', 1, '2026-04-11 18:35:33', '2026-04-12 01:03:01'),
(162, 107, 'BOX_107_2', 0, '2026-04-11 18:35:33', NULL),
(163, 107, 'BOX_107_3', 0, '2026-04-11 18:35:33', NULL),
(164, 107, 'BOX_107_4', 0, '2026-04-11 18:35:33', NULL),
(165, 107, 'BOX_107_5', 0, '2026-04-11 18:35:33', NULL),
(166, 107, 'BOX_107_6', 0, '2026-04-11 18:35:33', NULL),
(167, 107, 'BOX_107_7', 0, '2026-04-11 18:35:33', NULL),
(168, 107, 'BOX_107_8', 0, '2026-04-11 18:35:33', NULL),
(169, 107, 'BOX_107_9', 0, '2026-04-11 18:35:33', NULL),
(170, 107, 'BOX_107_10', 0, '2026-04-11 18:35:33', NULL),
(171, 107, 'BOX_107_11', 0, '2026-04-11 18:35:33', NULL),
(172, 107, 'BOX_107_12', 0, '2026-04-11 18:35:33', NULL),
(173, 107, 'BOX_107_13', 0, '2026-04-11 18:35:33', NULL),
(174, 107, 'BOX_107_14', 0, '2026-04-11 18:35:33', NULL),
(175, 107, 'BOX_107_15', 0, '2026-04-11 18:35:33', NULL),
(176, 107, 'BOX_107_16', 0, '2026-04-11 18:35:33', NULL),
(177, 107, 'BOX_107_17', 0, '2026-04-11 18:35:33', NULL),
(178, 107, 'BOX_107_18', 0, '2026-04-11 18:35:33', NULL),
(179, 107, 'BOX_107_19', 0, '2026-04-11 18:35:33', NULL),
(180, 107, 'BOX_107_20', 0, '2026-04-11 18:35:33', NULL),
(181, 108, 'BOX_108_1', 0, '2026-04-11 18:57:59', NULL),
(182, 108, 'BOX_108_2', 0, '2026-04-11 18:57:59', NULL),
(183, 108, 'BOX_108_3', 0, '2026-04-11 18:57:59', NULL),
(184, 108, 'BOX_108_4', 0, '2026-04-11 18:57:59', NULL),
(185, 108, 'BOX_108_5', 0, '2026-04-11 18:57:59', NULL),
(186, 108, 'BOX_108_6', 0, '2026-04-11 18:57:59', NULL),
(187, 108, 'BOX_108_7', 0, '2026-04-11 18:57:59', NULL),
(188, 108, 'BOX_108_8', 0, '2026-04-11 18:57:59', NULL),
(189, 108, 'BOX_108_9', 0, '2026-04-11 18:57:59', NULL),
(190, 108, 'BOX_108_10', 0, '2026-04-11 18:57:59', NULL),
(191, 108, 'BOX_108_11', 0, '2026-04-11 18:57:59', NULL),
(192, 108, 'BOX_108_12', 0, '2026-04-11 18:57:59', NULL),
(193, 108, 'BOX_108_13', 0, '2026-04-11 18:57:59', NULL),
(194, 108, 'BOX_108_14', 0, '2026-04-11 18:57:59', NULL),
(195, 108, 'BOX_108_15', 0, '2026-04-11 18:57:59', NULL),
(196, 108, 'BOX_108_16', 0, '2026-04-11 18:57:59', NULL),
(197, 108, 'BOX_108_17', 0, '2026-04-11 18:57:59', NULL),
(198, 108, 'BOX_108_18', 0, '2026-04-11 18:57:59', NULL),
(199, 108, 'BOX_108_19', 0, '2026-04-11 18:57:59', NULL),
(200, 108, 'BOX_108_20', 0, '2026-04-11 18:57:59', NULL),
(201, 109, 'BOX_109_1', 0, '2026-04-11 19:09:45', NULL),
(202, 109, 'BOX_109_2', 0, '2026-04-11 19:09:45', NULL),
(203, 109, 'BOX_109_3', 0, '2026-04-11 19:09:45', NULL),
(204, 109, 'BOX_109_4', 0, '2026-04-11 19:09:45', NULL),
(205, 109, 'BOX_109_5', 0, '2026-04-11 19:09:45', NULL),
(206, 109, 'BOX_109_6', 0, '2026-04-11 19:09:45', NULL),
(207, 109, 'BOX_109_7', 0, '2026-04-11 19:09:45', NULL),
(208, 109, 'BOX_109_8', 0, '2026-04-11 19:09:45', NULL),
(209, 109, 'BOX_109_9', 0, '2026-04-11 19:09:45', NULL),
(210, 109, 'BOX_109_10', 0, '2026-04-11 19:09:45', NULL),
(211, 109, 'BOX_109_11', 0, '2026-04-11 19:09:45', NULL),
(212, 109, 'BOX_109_12', 0, '2026-04-11 19:09:45', NULL),
(213, 109, 'BOX_109_13', 0, '2026-04-11 19:09:45', NULL),
(214, 109, 'BOX_109_14', 0, '2026-04-11 19:09:45', NULL),
(215, 109, 'BOX_109_15', 0, '2026-04-11 19:09:45', NULL),
(216, 109, 'BOX_109_16', 0, '2026-04-11 19:09:45', NULL),
(217, 109, 'BOX_109_17', 0, '2026-04-11 19:09:45', NULL),
(218, 109, 'BOX_109_18', 0, '2026-04-11 19:09:45', NULL),
(219, 109, 'BOX_109_19', 0, '2026-04-11 19:09:45', NULL),
(220, 109, 'BOX_109_20', 0, '2026-04-11 19:09:45', NULL),
(221, 111, 'BOX_111_1', 0, '2026-04-12 10:43:55', NULL),
(222, 111, 'BOX_111_2', 0, '2026-04-12 10:43:55', NULL),
(223, 111, 'BOX_111_3', 0, '2026-04-12 10:43:55', NULL),
(224, 111, 'BOX_111_4', 0, '2026-04-12 10:43:55', NULL),
(225, 111, 'BOX_111_5', 0, '2026-04-12 10:43:55', NULL),
(226, 111, 'BOX_111_6', 0, '2026-04-12 10:43:55', NULL),
(227, 111, 'BOX_111_7', 0, '2026-04-12 10:43:55', NULL),
(228, 111, 'BOX_111_8', 0, '2026-04-12 10:43:55', NULL),
(229, 111, 'BOX_111_9', 0, '2026-04-12 10:43:55', NULL),
(230, 111, 'BOX_111_10', 0, '2026-04-12 10:43:55', NULL),
(231, 111, 'BOX_111_11', 0, '2026-04-12 10:43:55', NULL),
(232, 111, 'BOX_111_12', 0, '2026-04-12 10:43:55', NULL),
(233, 111, 'BOX_111_13', 0, '2026-04-12 10:43:55', NULL),
(234, 111, 'BOX_111_14', 0, '2026-04-12 10:43:55', NULL),
(235, 111, 'BOX_111_15', 0, '2026-04-12 10:43:55', NULL),
(236, 111, 'BOX_111_16', 0, '2026-04-12 10:43:55', NULL),
(237, 111, 'BOX_111_17', 0, '2026-04-12 10:43:55', NULL),
(238, 111, 'BOX_111_18', 0, '2026-04-12 10:43:55', NULL),
(239, 111, 'BOX_111_19', 0, '2026-04-12 10:43:55', NULL),
(240, 111, 'BOX_111_20', 0, '2026-04-12 10:43:55', NULL),
(241, 112, 'BOX_112_1', 1, '2026-05-14 18:18:18', '2026-05-14 18:56:41'),
(242, 112, 'BOX_112_2', 0, '2026-05-14 18:18:18', NULL),
(243, 112, 'BOX_112_3', 0, '2026-05-14 18:18:18', NULL),
(244, 112, 'BOX_112_4', 0, '2026-05-14 18:18:18', NULL),
(245, 112, 'BOX_112_5', 0, '2026-05-14 18:18:18', NULL),
(246, 112, 'BOX_112_6', 0, '2026-05-14 18:18:18', NULL),
(247, 112, 'BOX_112_7', 0, '2026-05-14 18:18:18', NULL),
(248, 112, 'BOX_112_8', 0, '2026-05-14 18:18:18', NULL),
(249, 112, 'BOX_112_9', 0, '2026-05-14 18:18:18', NULL),
(250, 112, 'BOX_112_10', 0, '2026-05-14 18:18:18', NULL),
(251, 112, 'BOX_112_11', 0, '2026-05-14 18:18:18', NULL),
(252, 112, 'BOX_112_12', 0, '2026-05-14 18:18:18', NULL),
(253, 112, 'BOX_112_13', 0, '2026-05-14 18:18:18', NULL),
(254, 112, 'BOX_112_14', 0, '2026-05-14 18:18:18', NULL),
(255, 112, 'BOX_112_15', 0, '2026-05-14 18:18:18', NULL),
(256, 112, 'BOX_112_16', 0, '2026-05-14 18:18:18', NULL),
(257, 112, 'BOX_112_17', 0, '2026-05-14 18:18:18', NULL),
(258, 112, 'BOX_112_18', 0, '2026-05-14 18:18:18', NULL),
(259, 112, 'BOX_112_19', 0, '2026-05-14 18:18:18', NULL),
(260, 112, 'BOX_112_20', 0, '2026-05-14 18:18:18', NULL),
(261, 114, 'BOX_114_1', 0, '2026-05-14 18:56:41', NULL),
(262, 114, 'BOX_114_2', 0, '2026-05-14 18:56:41', NULL),
(263, 114, 'BOX_114_3', 0, '2026-05-14 18:56:41', NULL),
(264, 114, 'BOX_114_4', 0, '2026-05-14 18:56:41', NULL),
(265, 114, 'BOX_114_5', 0, '2026-05-14 18:56:41', NULL),
(266, 114, 'BOX_114_6', 0, '2026-05-14 18:56:41', NULL),
(267, 114, 'BOX_114_7', 0, '2026-05-14 18:56:41', NULL),
(268, 114, 'BOX_114_8', 0, '2026-05-14 18:56:41', NULL),
(269, 114, 'BOX_114_9', 0, '2026-05-14 18:56:41', NULL),
(270, 114, 'BOX_114_10', 0, '2026-05-14 18:56:41', NULL),
(271, 114, 'BOX_114_11', 0, '2026-05-14 18:56:41', NULL),
(272, 114, 'BOX_114_12', 0, '2026-05-14 18:56:41', NULL),
(273, 114, 'BOX_114_13', 0, '2026-05-14 18:56:41', NULL),
(274, 114, 'BOX_114_14', 0, '2026-05-14 18:56:41', NULL),
(275, 114, 'BOX_114_15', 0, '2026-05-14 18:56:41', NULL),
(276, 114, 'BOX_114_16', 0, '2026-05-14 18:56:41', NULL),
(277, 114, 'BOX_114_17', 0, '2026-05-14 18:56:41', NULL),
(278, 114, 'BOX_114_18', 0, '2026-05-14 18:56:41', NULL),
(279, 114, 'BOX_114_19', 0, '2026-05-14 18:56:41', NULL),
(280, 114, 'BOX_114_20', 0, '2026-05-14 18:56:41', NULL),
(281, 92, 'BOX_92_1', 0, '2026-05-16 17:19:14', NULL),
(282, 92, 'BOX_92_2', 0, '2026-05-16 17:19:14', NULL),
(283, 92, 'BOX_92_3', 0, '2026-05-16 17:19:14', NULL),
(284, 92, 'BOX_92_4', 0, '2026-05-16 17:19:14', NULL),
(285, 92, 'BOX_92_5', 0, '2026-05-16 17:19:14', NULL),
(286, 92, 'BOX_92_6', 0, '2026-05-16 17:19:14', NULL),
(287, 92, 'BOX_92_7', 0, '2026-05-16 17:19:14', NULL),
(288, 92, 'BOX_92_8', 0, '2026-05-16 17:19:14', NULL),
(289, 92, 'BOX_92_9', 0, '2026-05-16 17:19:14', NULL),
(290, 92, 'BOX_92_10', 0, '2026-05-16 17:19:14', NULL),
(291, 92, 'BOX_92_11', 0, '2026-05-16 17:19:14', NULL),
(292, 92, 'BOX_92_12', 0, '2026-05-16 17:19:14', NULL),
(293, 92, 'BOX_92_13', 0, '2026-05-16 17:19:14', NULL),
(294, 92, 'BOX_92_14', 0, '2026-05-16 17:19:14', NULL),
(295, 92, 'BOX_92_15', 0, '2026-05-16 17:19:14', NULL),
(296, 92, 'BOX_92_16', 0, '2026-05-16 17:19:14', NULL),
(297, 92, 'BOX_92_17', 0, '2026-05-16 17:19:14', NULL),
(298, 92, 'BOX_92_18', 0, '2026-05-16 17:19:14', NULL),
(299, 92, 'BOX_92_19', 0, '2026-05-16 17:19:14', NULL),
(300, 92, 'BOX_92_20', 0, '2026-05-16 17:19:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` int(11) NOT NULL,
  `common` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `common`, `product_id`, `type_id`, `fields`, `price`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '0', '40', '44', '[\"Test\",\"4\",\"8GB\",\"256GB\",\"Network prot 4\",\"windows\"]', '1999', 1, '2023-08-09 04:07:15', '2023-08-13 05:02:39', '2023-08-13 05:02:39'),
(2, '0', '40', '44', '[\"CL-BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3         8 Core\\/BC 2.60 Ghz\\/ TC 3.4 Ghz Cache 20 MB  \\\"\",\"16\",\"128 GB DDR4 2400\",\"2 * 800 GB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Centos \\/ Ubuntu\"]', '15500', 1, '2023-08-10 01:59:31', '2023-08-13 05:02:35', '2023-08-13 05:02:35'),
(3, '0', '40', '44', '[\"CL-BM-GP-16v464\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4 8 Core\\/BC 2.50 GHz\\/ TC 3.20 GHz Cache 30 MB\\\"\",\"16\",\"64 GB DDR4 2400\",\"2 * 800 GB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Centos \\/ Ubuntu\"]', '16500', 1, '2023-08-10 02:00:12', '2023-08-13 05:02:32', '2023-08-13 05:02:32'),
(4, '0', '40', '44', '[\"CL-BM-GP-20v380\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2650 v3     10 Core\\/BC 2.30 GHz\\/ TC 3.00 GHz Cache 25 MB\\\"\",\"20\",\"80 GB DDR4 2400\",\"2 * 800 GB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Centos \\/ Ubuntu\"]', '17500', 1, '2023-08-10 02:00:47', '2023-08-13 05:02:24', '2023-08-13 05:02:24'),
(5, '0', '40', '44', '[\"CL-BM-GP-20v480\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2630 v4     10 Core\\/BC 2.20 GHz\\/ TC 3.10 GHz Cache 25 MB\\\"\",\"20\",\"80 GB DDR4 2400\",\"2 * 800 GB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Centos \\/ Ubuntu\"]', '18500', 1, '2023-08-10 02:01:23', '2023-08-13 05:02:20', '2023-08-13 05:02:20'),
(6, '0', '40', '44', '[\"CL-BM-GP-24v396\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2658 v3     12 Core\\/BC 2.20 GHz\\/ TC 2.90 GHz Cache 30 MB\\\"\",\"24\",\"96 GB DDR4 2400\",\"2 * 1.6TB GB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Centos \\/ Ubuntu\"]', '19500', 1, '2023-08-10 02:56:31', '2023-08-13 05:02:16', '2023-08-13 05:02:16'),
(7, '0', '40', '46', '[\"CL-BM-MO-16v3128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3         8 Core\\/BC 2.60 Ghz\\/ TC 3.4 Ghz Cache 20 MB  \\\"\",\"16\",\"128\",\"2 * 800 GB SAS SSD\",\"2 * 10G\",\"CentOS\"]', '17825', 1, '2023-08-10 02:57:35', '2023-08-13 05:02:13', '2023-08-13 05:02:13'),
(8, '0', '40', '46', '[\"CL-BM-MO-16v4128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4 8 Core\\/BC 2.50 GHz\\/ TC 3.20 GHz Cache 30 MB\\\"\",\"16\",\"128\",\"2 * 800 GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '18975', 1, '2023-08-10 02:59:24', '2023-08-13 05:02:10', '2023-08-13 05:02:10'),
(9, '0', '40', '46', '[\"CL-BM-MO-20v3164\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2650 v3     10 Core\\/BC 2.30 GHz\\/ TC 3.00 GHz Cache 25 MB\\\"\",\"20\",\"164\",\"2 * 800 GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '20125', 1, '2023-08-10 03:00:12', '2023-08-13 05:02:06', '2023-08-13 05:02:06'),
(10, '0', '40', '46', '[\"CL-BM-MO-20v4164\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2630 v4     10 Core\\/BC 2.20 GHz\\/ TC 3.10 GHz Cache 25 MB\\\"\",\"20\",\"164\",\"2 * 800 GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '21275', 1, '2023-08-10 03:00:51', '2023-08-13 05:02:02', '2023-08-13 05:02:02'),
(11, '0', '40', '46', '[\"CL-BM-MO-24v3192\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2658 v3     12 Core\\/BC 2.20 GHz\\/ TC 2.90 GHz Cache 30 MB\\\"\",\"24\",\"192\",\"2 * 1.6TB GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '22425', 1, '2023-08-10 03:01:34', '2023-08-13 05:01:59', '2023-08-13 05:01:59'),
(12, '0', '40', '46', '[\"CL-BM-MO-24v4192\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4640 v4     12 Core\\/BC 2.10 GHz\\/ TC 2.60 GHz\\/ Cache 30 MB\\\"\",\"24\",\"192\",\"2 * 1.6TB GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '23575', 1, '2023-08-10 03:02:16', '2023-08-13 05:01:55', '2023-08-13 05:01:55'),
(13, '0', '40', '46', '[\"CL-BM-MO-24v3224\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2697 v3      14 Core\\/BC 2.60 GHz\\/ TC 3.60 GHz\\/ Cache 35 MB\\\"\",\"28\",\"224\",\"2 * 1.6TB GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '24725', 1, '2023-08-10 03:02:48', '2023-08-13 05:01:51', '2023-08-13 05:01:51'),
(14, '0', '40', '46', '[\"CL-BM-MO-28v4224\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4650 v4     14 Core\\/BC 2.20 GHz\\/ TC 2.80 GHz\\/ Cache 35 MB\\\"\",\"28\",\"224\",\"2 * 1.6TB GB SAS SSD\",\"2 * 10G\",\"Centos\"]', '25875', 1, '2023-08-10 03:03:28', '2023-08-13 05:01:48', '2023-08-13 05:01:48'),
(15, '0', '40', '44', '[\"BM-GP-16v364\",\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3        2 * 8 Core  2.60 GHz\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '15500', 1, '2023-08-13 05:47:15', '2023-08-13 05:47:26', '2023-08-13 05:47:26'),
(16, '0', '40', '44', '[\"BM-GP-128EP512\",\"AMD EPYC 7742 Processor<br>  2*64 Core 2.25 GHz\",\"128\",\"512  GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '75000', 1, '2023-08-13 05:49:21', '2024-01-01 11:51:02', NULL),
(17, '0', '40', '44', '[\"BM-GP-48EP512\",\"AMD EPYC 7642 Processor<br>  2*48 Core2.30 GHz\",\"98\",\"512  GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '65000', 1, '2023-08-13 05:50:10', '2024-01-01 11:49:15', NULL),
(18, '0', '40', '44', '[\"BM-GP-64EP512\",\"AMD EPYC 7532 Processor<br> 2* 32 Core 2.40 GHz\",\"64\",\"512  GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '55500', 1, '2023-08-13 05:51:09', '2024-01-01 11:48:28', NULL),
(19, '0', '40', '44', '[\"BM-GP-32EP256\",\"AMD EPYC 7302 Processor <br> 2* 16 Core 3.00 GHz\",\"32\",\"256  GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '35500', 1, '2023-08-13 05:54:00', '2024-01-01 11:47:51', NULL),
(20, '0', '40', '44', '[\"BM-GP-48P512\",\"Intel Xeon Platinum 8160 Processor<br>  2*24 Core 2.10 GHz\\\"\",\"48\",\"512  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '53500', 1, '2023-08-13 05:55:11', '2024-01-01 11:47:16', NULL),
(21, '0', '40', '44', '[\"BM-GP-40G512\",\"Intel Xeon Gold 6148 Processor<br> 2*20 Core 2.40 GHz\",\"40\",\"512  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '51500', 1, '2023-08-13 05:56:10', '2024-01-01 11:46:13', NULL),
(22, '0', '40', '44', '[\"BM-GP-40G512\",\"Intel Xeon Gold 6138 Processor <br> 2*20 Core 2.00 GHz\",\"40\",\"512 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '48500', 1, '2023-08-13 05:56:57', '2024-01-01 11:45:01', NULL),
(23, '0', '40', '44', '[\"BM-GP-36G512\",\"Intel Xeon Gold 6140 Processor<br> 2*18 Core 2.30 GHz\",\"36\",\"512  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '45500', 1, '2023-08-13 05:58:09', '2024-01-01 11:42:38', NULL),
(24, '0', '40', '44', '[\"BM-GP-32G512\",\"Intel Xeon Gold 6142 Processor<br>  2*16 Core 2.60 GHz\",\"32\",\"512  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '42500', 1, '2023-08-13 06:01:44', '2024-01-01 11:42:07', NULL),
(25, '0', '40', '44', '[\"BM-GP-24G256\",\"Intel Xeon Gold 6136 Processor <br>  2*12 Core 3.00 GHz\",\"24\",\"256  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', '36500', 1, '2023-08-13 06:02:40', '2024-01-01 11:41:12', NULL),
(26, '0', '40', '44', '[\"BM-GP-44v4256\",\"Intel Xeon Processor E5-4669v4<br> 2*22 Core 2.20 GHz\",\"44\",\"256  GB DDR4\",\"2 * 3.68 TB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '32500', 1, '2023-08-13 06:12:25', '2024-01-01 11:40:21', NULL),
(27, '0', '40', '44', '[\"BM-GP-36v4256\",\"Intel Xeon Processor E5-4667v4<br>2*18 Core 2.20 GHz\",\"36\",\"256  GB DDR4\",\"2 * 3.68 TB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '27500', 1, '2023-08-13 06:14:10', '2024-01-01 11:39:45', NULL),
(28, '0', '40', '44', '[\"BM-GP-36v3256\",\"Intel Xeon Processor E5-2699v3<br> 2 * 18 Core  2.30 GHz\",\"36\",\"256  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '25500', 1, '2023-08-13 06:15:10', '2024-01-01 11:37:41', NULL),
(29, '0', '40', '44', '[\"BM-GP-32v4256\",\"Intel Xeon Processor E5-4660v4<br> 2 * 16 Core 2.20 GHz\",\"32\",\"256  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '24500', 1, '2023-08-13 06:16:05', '2024-01-01 11:36:05', NULL),
(30, '0', '40', '44', '[\"BM-GP-32v3256\",\"Intel Xeon Processor E5-2698v3<br> 2 * 16 Core 2.30 GHz\",\"32\",\"256  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '23500', 1, '2023-08-13 06:18:30', '2024-01-01 11:35:25', NULL),
(31, '0', '40', '44', '[\"BM-GP-28v4128\",\"Intel Xeon Processor E5-4650v4<br> 2 * 14 Core 2.20 GHz\",\"28\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '22500', 1, '2023-08-13 06:19:22', '2024-01-01 11:31:43', NULL),
(32, '0', '40', '44', '[\"BM-GP-28v3128\",\"Intel Xeon Processor E5-2697v3<br> 2 *  14 Core 2.60 GHz\",\"28\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '21500', 1, '2023-08-13 06:20:14', '2024-01-01 11:31:03', NULL),
(33, '0', '40', '44', '[\"BM-GP-24v4128\",\"Intel Xeon Processor E5-4640v4<br> 2 * 12 Core\\/BC 2.10 GHz\",\"24\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '20500', 1, '2023-08-13 06:21:18', '2024-01-01 11:29:45', NULL),
(34, '0', '40', '44', '[\"BM-GP-24v3128\",\"Intel Xeon Processor E5-2658v3 <br> 2 *  12 Core 2.20 GHz\",\"24\",\"128  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '19500', 1, '2023-08-13 06:22:01', '2024-01-01 11:28:15', NULL),
(35, '0', '40', '44', '[\"BM-GP-20v480\",\"Intel Xeon Processor E5-2630v4<br> 2 * 10 Core  2.20 GHz\",\"20\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '18500', 1, '2023-08-13 06:22:46', '2024-01-01 11:26:20', NULL),
(36, '0', '40', '44', '[\"BM-GP-20v380\",\"Intel Xeon Processor E5-2650v3 <br> 2 *  10 Core  2.30 GHz\",\"20\",\"64  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '17500', 1, '2023-08-13 06:23:39', '2024-01-01 11:25:48', NULL),
(37, '0', '40', '44', '[\"BM-GP-16v464\",\"Intel Xeon Processor E5-4655v4 <br>2 * 8 Core 2.50 GHz\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '16500', 1, '2023-08-13 06:24:35', '2024-01-01 11:24:38', NULL),
(38, '0', '40', '44', '[\"BM-GP-16v364\",\"\\\"Intel Xeon Processor E5-2640v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', '15500', 1, '2023-08-13 06:25:27', '2024-01-01 11:21:52', NULL),
(39, '0', '40', '46', '[\"BM-GP-16v3128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3        2 * 8 Core  2.60 GHz\\\"\",\"16\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '17825', 1, '2023-08-13 06:50:50', '2023-08-13 06:51:11', '2023-08-13 06:51:11'),
(40, '0', '40', '46', '[\"BM-MO-128EP1024\",\"\\\"AMD EPYC\\u2122 7742 Processor  <br>2 * 64 Core 2.25 GHz\\\"\",\"128\",\"1024 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '86250', 1, '2023-08-13 06:53:38', '2023-08-21 06:06:46', NULL),
(41, '0', '40', '46', '[\"BM-MO-48EP1024\",\"\\\"AMD EPYC\\u2122 7642 Processor <br> 2 *  48 Core2.30 GHz\\\"\",\"96\",\"1024 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '74750', 1, '2023-08-13 06:54:41', '2023-08-18 12:40:36', NULL),
(42, '0', '40', '46', '[\"BM-MO-64EP512\",\"\\\"AMD EPYC\\u2122 7532 Processor <br> 2 *  32 Core  2.40 GHz\\\"\",\"64\",\"512 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '63825', 1, '2023-08-13 06:55:27', '2023-08-18 12:40:15', NULL),
(43, '0', '40', '46', '[\"BM-MO-32EP256\",\"\\\"AMD EPYC\\u2122 7302 Processor <br> 2 * 16 Core  3.00 GHz\\\"\",\"32\",\"256 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '40825', 1, '2023-08-13 06:57:02', '2023-08-18 12:40:04', NULL),
(44, '0', '40', '46', '[\"BM-MO-48P512\",\"\\\"Intel\\u00ae Xeon\\u00ae Platinum 8160 Processor  <br>   2 * 24 Core 2.10 GHz\\\"\",\"48\",\"512 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '61525', 1, '2023-08-13 06:57:57', '2023-08-18 12:39:57', NULL),
(45, '0', '40', '46', '[\"BM-MO-40G512\",\"\\\" Intel\\u00ae Xeon\\u00ae Gold 6148 Processor   <br>   2 * 20 Core 2.40 GHz\\\"\",\"40\",\"512 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '59225', 1, '2023-08-13 06:58:43', '2023-08-18 12:39:45', NULL),
(46, '0', '40', '46', '[\"BM-MO-40G512\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6138 Processor <br>   2 * 20 Core  2.00 GHz\\\"\",\"40\",\"512 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '55775', 1, '2023-08-13 06:59:42', '2023-08-18 12:39:36', NULL),
(47, '0', '40', '46', '[\"BM-MO-36G256\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6140 Processor   <br>   2 * 18 Core 2.30 GHz\\\"\",\"36\",\"256 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '52325', 1, '2023-08-13 07:00:27', '2023-08-18 12:39:25', NULL),
(48, '0', '40', '46', '[\"BM-MO-32G256\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6142 Processor   <br>   2 * 16 Core 2.60 GHz\\\"\",\"32\",\"256 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '48875', 1, '2023-08-13 07:01:12', '2023-08-18 12:39:14', NULL),
(49, '0', '40', '46', '[\"BM-MO-24G256\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6136 Processor<br>   2 *  12 Core\\/BC 3.00 GHz\\\"\",\"24\",\"256 GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"CentOS\"]', '41975', 1, '2023-08-13 07:02:01', '2023-08-18 12:39:05', NULL),
(50, '0', '40', '46', '[\"BM-MO-44v4512\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4669 v4  <br>  2 * 22 Core 2.20 GHz\\\"\",\"44\",\"512 GB DDR4\",\"2 * 3.68 TB SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '37375', 1, '2023-08-13 07:02:45', '2023-08-18 12:38:54', NULL),
(51, '0', '40', '46', '[\"BM-MO-36v4256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4667 v4   <br>    2 *  18 Core  2.20 GHz\\\"\",\"36\",\"256 GB DDR4\",\"2 * 3.68 TB SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '31625', 1, '2023-08-13 07:03:31', '2023-08-18 12:38:39', NULL),
(52, '0', '40', '46', '[\"BM-MO-36v3256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2699 v3 <br>  2 * 18 Core  2.30 GHz\\\"\",\"36\",\"256 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '29325', 1, '2023-08-13 07:04:29', '2023-08-18 12:38:24', NULL),
(53, '0', '40', '46', '[\"BM-MO-32v4256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4660 v4<br>  2 * 16 Core 2.20 GHz\\\"\",\"32\",\"256 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '28175', 1, '2023-08-13 07:05:14', '2023-08-18 12:38:14', NULL),
(54, '0', '40', '46', '[\"BM-MO-32v3256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2698 v3<br> 2 * 16 Core 2.30 GHz \\\"\",\"32\",\"256 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '27025', 1, '2023-08-13 07:06:10', '2023-08-18 12:38:00', NULL),
(55, '0', '40', '46', '[\"BM-MO-28v4256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4650 v4  <br>  2 * 14 Core 2.20 GHz\\\"\",\"28\",\"256 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '25875', 1, '2023-08-13 07:06:54', '2023-08-18 12:37:52', NULL),
(56, '0', '40', '46', '[\"BM-MO-28v3256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2697 v3<br> 2 *  14 Core\\/BC 2.60 GHz\\\"\",\"28\",\"256 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '24725', 1, '2023-08-13 07:07:43', '2023-08-18 12:37:40', NULL),
(57, '0', '40', '46', '[\"BM-MO-24v4192\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4640 v4 <br> 2 * 12 Core\\/BC 2.10 GHz\\\"\",\"24\",\"192 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '23575', 1, '2023-08-13 07:08:35', '2023-08-18 12:37:32', NULL),
(58, '0', '40', '46', '[\"BM-MO-24v3192\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2658 v3<br>  2 *  12 Core 2.20 GHz\\\"\",\"24\",\"192 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '22425', 1, '2023-08-13 07:09:14', '2023-08-18 12:37:18', NULL),
(59, '0', '40', '46', '[\"BM-MO-20v4164\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2630 v4<br>   2 * 10 Core  2.20 GHz\\\"\",\"20\",\"164 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '21275', 1, '2023-08-13 07:09:57', '2023-08-18 12:37:08', NULL),
(60, '0', '40', '46', '[\"BM-MO-20v3164\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2650 v3  <br>  2 *  10 Core  2.30 GHz\\\"\",\"20\",\"164 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '20125', 1, '2023-08-13 07:10:42', '2023-08-18 12:36:55', NULL),
(61, '0', '40', '46', '[\"BM-MO-16v4128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4<br>  2 * 8 Core 2.50 GHz\\\"\",\"16\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '18975', 1, '2023-08-13 07:11:34', '2023-08-18 12:36:43', NULL),
(62, '0', '40', '46', '[\"BM-MO-16v3128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3    <br>     2 * 8 Core  2.60 GHz\\\"\",\"16\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"CentOS\"]', '17825', 1, '2023-08-13 07:12:24', '2023-08-18 12:18:31', NULL),
(63, '0', '40', '45', '[\"BM-CO-16EP2256\",\"\\\"AMD EPYC\\u2122 7F32  <br>  2 * 8 Core 3.7 GHz\\\"\",\"16\",\"256 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '45500', 1, '2023-08-13 08:10:04', '2023-08-18 12:18:46', NULL),
(64, '0', '40', '45', '[\"BM-CO-32EP2512\",\"\\\"AMD EPYC\\u2122 7F52  <br>  2 * 16 Core 3.50 GHz\\\"\",\"32\",\"512 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '68500', 1, '2023-08-13 08:10:46', '2023-08-18 12:19:08', NULL),
(65, '0', '40', '45', '[\"BM-CO-24G256\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6256 Processor  <br>  2 * 12 Core  3.60 GHz\\\"\",\"24\",\"256 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '60500', 1, '2023-08-13 08:11:30', '2023-08-18 12:19:58', NULL),
(66, '0', '40', '45', '[\"BM-CO-16G2256\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6250 Processor <br>   2 * 8 Core  3.90 GHz\\\"\",\"16\",\"256 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '55000', 1, '2023-08-13 08:12:20', '2023-08-18 12:19:25', NULL),
(67, '0', '40', '45', '[\"BM-CO-32G2512\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6246R Processor <br>    2 * 16 Core  3.40 GHz\\\"\",\"8\",\"128 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '28500', 1, '2023-08-13 08:13:05', '2023-08-18 12:18:17', NULL),
(68, '0', '40', '45', '[\"BM-CO-16G1256\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6144 Processor  <br>  2 * 8 Core 3.50 GHz\\\"\",\"16\",\"256 GB DDR4\",\"3  * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '42500', 1, '2023-08-13 08:13:49', '2023-08-18 12:17:59', NULL),
(69, '0', '40', '44', '[\"BM-CO-12G1128\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6128 Processor  2 *  6 Core  3.40GHz\\\"\",\"12\",\"128 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '35500', 1, '2023-08-13 08:14:39', '2023-08-13 12:14:12', '2023-08-13 12:14:12'),
(70, '0', '40', '44', '[\"BM-CO-16v4256\",\"\\\"Intel Xeon Processor E5-1680 v4     2 * 8 Core 3.40GHz\\\"\",\"16\",\"256 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '27500', 1, '2023-08-13 08:15:20', '2023-08-13 12:13:42', '2023-08-13 12:13:42'),
(71, '0', '40', '45', '[\"BM-CO-12v4128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-1650 v4  <br>  2 * 6 Core 3.60GHz\\\"\",\"12\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '25500', 1, '2023-08-13 08:16:00', '2023-08-18 12:17:37', NULL),
(72, '0', '40', '45', '[\"BM-CO-8v4128\",\"\\\" Intel\\u00ae Xeon\\u00ae Processor E5-1630 v4  <br> 2 * 4 Core  3.7 GHz\\\"\",\"8\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '22500', 1, '2023-08-13 08:17:00', '2023-08-18 12:17:09', NULL),
(73, '0', '40', '45', '[\"BM-CO-8v4128\",\"Intel\\u00ae Xeon\\u00ae Processor E5-1620v4  <br> 2 * 4 Core 3.50GHz\",\"8\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', '20500', 1, '2023-08-13 08:17:52', '2023-08-14 02:58:33', NULL),
(74, '0', '94', '95', '[\"1\",\"11\"]', '100', 1, '2023-08-17 00:32:30', '2023-08-17 01:44:43', '2023-08-17 01:44:43'),
(75, '0', '94', '95', '[\"CLS-WS-32v128\",\"32 vCPUs\",\"128  GB DDR4\",\"1524 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '47950', 1, '2023-08-18 13:29:10', '2024-01-01 11:03:25', NULL),
(76, '0', '94', '95', '[\"CLS-Lin-32v128\",\"32 vCPUs\",\"128  GB DDR4\",\"1524 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '35200', 1, '2023-08-18 13:31:45', '2024-01-01 11:02:18', NULL),
(77, '0', '94', '95', '[\"CLS-WS-30v128\",\"30  vCPUs\",\"128 GB DDR4\",\"1424 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '44250', 1, '2023-08-18 13:32:45', '2024-01-01 11:01:42', NULL),
(78, '0', '94', '95', '[\"CLS-Lin-30v128\",\"30  vCPUs\",\"128 GB DDR4\",\"1424 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '33000', 1, '2023-08-18 13:33:35', '2024-01-01 11:00:44', NULL),
(79, '0', '94', '95', '[\"CLS-WS-28v128\",\"28 vCPUs\",\"128 GB DDR4\",\"1324 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '41300', 1, '2023-08-18 13:34:19', '2024-01-01 10:59:47', NULL),
(80, '0', '94', '95', '[\"CLS-Lin-28v128\",\"28 vCPUs\",\"128 GB DDR4\",\"1324 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '30800', 1, '2023-08-18 13:35:03', '2024-01-01 10:57:33', NULL),
(81, '0', '94', '95', '[\"CLS-WS-26v78\",\"26  vCPUs\",\"78 GB DDR4\",\"1224 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '38350', 1, '2023-08-18 13:35:48', '2024-01-01 10:56:08', NULL),
(82, '0', '94', '95', '[\"CLS-Lin-26v78\",\"26  vCPUs\",\"78 GB DDR4\",\"1224 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '28600', 1, '2023-08-18 13:36:37', '2024-01-01 10:55:02', NULL),
(83, '0', '94', '95', '[\"CLS-WS-24v72\",\"24 vCPUs\",\"72 GB DDR4\",\"1124 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '35400', 1, '2023-08-18 13:37:59', '2024-01-01 10:53:17', NULL),
(84, '0', '94', '95', '[\"CLS-Lin-24v72\",\"24 vCPUs\",\"72 GB DDR4\",\"1124 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '26400', 1, '2023-08-22 06:00:11', '2024-01-01 10:52:36', NULL),
(85, '0', '94', '95', '[\"CLS-WS-22v66\",\"22 vCPUs\",\"66 GB DDR4\",\"1024 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '32450', 1, '2023-08-22 06:00:57', '2024-01-01 10:48:46', NULL),
(86, '0', '94', '95', '[\"CLS-Lin-22v66\",\"22 vCPUs\",\"66 GB DDR4\",\"1024 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '24200', 1, '2023-08-22 06:01:42', '2024-01-01 10:46:44', NULL),
(87, '0', '94', '95', '[\"CLS-WS-20v60\",\"20 vCPUs\",\"60 GB DDR4\",\"900 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '29500', 1, '2023-08-22 06:02:17', '2024-01-01 10:45:52', NULL),
(88, '0', '94', '95', '[\"CLS-Lin-20v60\",\"20 vCPUs\",\"60 GB DDR4\",\"900 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '22000', 1, '2023-08-22 06:02:49', '2024-01-01 10:45:19', NULL),
(89, '0', '94', '95', '[\"CLS-WS-18v54\",\"18  vCPUs\",\"54 GB DDR4\",\"800 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '26550', 1, '2023-08-22 06:03:21', '2024-01-01 10:12:40', NULL),
(90, '0', '94', '95', '[\"CLS-Lin-18v54\",\"18  vCPUs\",\"54 GB DDR4\",\"800 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '19800', 1, '2023-08-22 06:03:53', '2024-01-01 10:12:05', NULL),
(91, '0', '94', '95', '[\"CLS-WS-16v48\",\"16 vCPUs\",\"48 GB DDR4\",\"700 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '23600', 1, '2023-08-22 06:04:23', '2024-01-01 10:10:20', NULL),
(92, '0', '94', '95', '[\"CLS-Lin-16v48\",\"16 vCPUs\",\"48 GB DDR4\",\"700 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '17600', 1, '2023-08-22 06:04:55', '2024-01-01 10:09:10', NULL),
(93, '0', '94', '95', '[\"CLS-WS-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '20650', 1, '2023-08-22 06:05:30', '2024-01-01 10:01:24', NULL),
(94, '0', '94', '95', '[\"CLS-Lin-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '15400', 1, '2023-08-22 06:06:01', '2024-01-01 09:59:32', NULL),
(95, '0', '94', '95', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '17700', 1, '2023-08-22 06:06:33', '2024-01-01 09:56:56', NULL),
(96, '0', '94', '95', '[\"CLS-Lin-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '13200', 1, '2023-08-22 06:07:13', '2024-01-01 09:05:19', NULL),
(97, '0', '94', '95', '[\"CLS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '14750', 1, '2023-08-22 06:07:46', '2024-01-01 09:54:55', NULL),
(98, '0', '94', '95', '[\"CLS-Lin-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '11000', 1, '2023-08-22 06:08:18', '2024-01-01 09:04:20', NULL),
(99, '0', '94', '95', '[\"CLS-WS-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '11800', 1, '2023-08-22 06:08:53', '2024-01-01 09:53:40', NULL),
(100, '0', '94', '95', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '8800', 1, '2023-08-22 06:09:23', '2024-01-01 09:00:50', NULL),
(101, '0', '94', '95', '[\"CLS-WS-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '8850', 1, '2023-08-22 06:09:53', '2024-01-01 09:52:16', NULL),
(102, '0', '94', '95', '[\"CLS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '6600', 1, '2023-08-22 06:10:28', '2023-12-27 05:30:53', NULL),
(103, '0', '94', '95', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '5900', 1, '2023-08-22 06:11:05', '2024-01-01 09:51:39', NULL),
(104, '0', '94', '95', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '4400', 1, '2023-08-22 06:11:50', '2023-12-27 05:29:26', NULL),
(105, '0', '94', '96', '[\"CLS-WS-16v48\",\"16 vCPUs\",\"48 GB DDR4\",\"700 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '22200', 1, '2023-08-22 06:13:46', '2023-08-22 06:13:46', NULL),
(106, '0', '94', '96', '[\"CLS-Lin-16v48\",\"16 vCPUs\",\"48 GB DDR4\",\"700 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '13200', 1, '2023-08-22 06:14:17', '2023-08-22 06:14:17', NULL),
(107, '0', '94', '96', '[\"CLS-WS-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '19425', 1, '2023-08-22 06:15:03', '2023-08-22 06:15:03', NULL),
(108, '0', '94', '96', '[\"CLS-Lin-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '11550', 1, '2023-08-22 06:16:21', '2023-08-22 06:16:41', NULL),
(109, '0', '94', '96', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '16650', 1, '2023-08-22 06:17:30', '2023-08-22 06:17:30', NULL),
(110, '0', '94', '96', '[\"CLS-Lin-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '9900', 1, '2023-08-22 06:18:04', '2023-08-22 06:18:04', NULL),
(111, '0', '94', '96', '[\"CLS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '13875', 1, '2023-08-22 06:18:37', '2023-08-22 06:18:37', NULL),
(112, '0', '94', '96', '[\"CLS-Lin-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '8250', 1, '2023-08-22 06:19:08', '2023-08-22 06:19:08', NULL),
(113, '0', '94', '96', '[\"CLS-WS-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '11100', 1, '2023-08-22 06:19:39', '2023-08-22 06:19:39', NULL),
(114, '0', '94', '95', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '6600', 1, '2023-08-22 06:20:11', '2023-08-22 10:03:30', '2023-08-22 10:03:30'),
(115, '0', '94', '96', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '6600', 1, '2023-08-22 06:21:14', '2023-08-22 10:06:53', NULL),
(116, '0', '94', '95', '[\"CLS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '4950', 1, '2023-08-22 06:22:27', '2023-08-22 10:03:07', '2023-08-22 10:03:07'),
(117, '0', '94', '96', '[\"CLS-WS-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '8325', 1, '2023-08-22 06:23:00', '2023-08-22 10:07:41', NULL),
(118, '0', '94', '96', '[\"CLS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '4950', 1, '2023-08-22 06:23:40', '2023-08-22 10:08:14', NULL),
(119, '0', '94', '97', '[\"CLS-WS-32v192\",\"32 vCPUs\",\"192  GB DDR4\",\"1524 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '55150', 1, '2023-08-22 06:24:58', '2024-01-03 02:10:12', NULL),
(120, '0', '94', '97', '[\"CLS-Lin-32v192\",\"32 vCPUs\",\"192 GB DDR4\",\"1524 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '42400', 1, '2023-08-22 06:25:29', '2024-01-03 02:07:01', NULL),
(121, '0', '94', '97', '[\"CLS-WS-30v180\",\"30  vCPUs\",\"180 GB DDR4\",\"1424 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '51000', 1, '2023-08-22 06:26:34', '2024-01-03 02:06:04', NULL),
(122, '0', '94', '97', '[\"CLS-Lin-30v180\",\"30  vCPUs\",\"180 GB DDR4\",\"1424 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '39750', 1, '2023-08-22 06:27:50', '2024-01-03 02:03:13', NULL),
(123, '0', '94', '97', '[\"CLS-WS-28v168\",\"28 vCPUs\",\"168 GB DDR4\",\"1324 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '47600', 1, '2023-08-22 06:29:00', '2024-01-03 02:01:48', NULL),
(124, '0', '94', '97', '[\"CLS-Lin-28v168\",\"28 vCPUs\",\"168 GB DDR4\",\"1324 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '37100', 1, '2023-08-22 06:29:43', '2024-01-03 01:58:18', NULL),
(125, '0', '94', '97', '[\"CLS-WS-26v156\",\"26  vCPUs\",\"156 GB DDR4\",\"1224 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '44200', 1, '2023-08-22 06:30:28', '2024-01-03 01:57:03', NULL),
(126, '0', '94', '97', '[\"CLS-Lin-26v156\",\"26  vCPUs\",\"156 GB DDR4\",\"1224 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '34450', 1, '2023-08-22 06:32:15', '2024-01-03 01:56:22', NULL),
(127, '0', '94', '97', '[\"CLS-WS-24v144\",\"24 vCPUs\",\"144 GB DDR4\",\"1124 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '40800', 1, '2023-08-22 06:35:36', '2024-01-03 01:55:01', NULL),
(128, '0', '94', '97', '[\"CLS-Lin-24v144\",\"24 vCPUs\",\"144 GB DDR4\",\"1124 GB SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '31800', 1, '2023-08-22 06:36:07', '2024-01-03 01:54:16', NULL),
(129, '0', '94', '97', '[\"CLS-WS-22v132\",\"22 vCPUs\",\"132 GB DDR4\",\"1024 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '37400', 1, '2023-08-22 06:36:48', '2024-01-03 01:50:11', NULL),
(130, '0', '94', '97', '[\"CLS-Lin-22v132\",\"22 vCPUs\",\"132 GB DDR4\",\"1024 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '29150', 1, '2023-08-22 06:37:43', '2024-01-03 02:19:24', NULL),
(131, '0', '94', '97', '[\"CLS-WS-20v120\",\"20 vCPUs\",\"120 GB DDR4\",\"900 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '34000', 1, '2023-08-22 06:38:15', '2024-01-03 02:18:14', NULL),
(132, '0', '94', '97', '[\"CLS-Lin-20v120\",\"20 vCPUs\",\"120 GB DDR4\",\"900 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '26500', 1, '2023-08-22 06:38:48', '2024-01-03 02:17:12', NULL),
(133, '0', '94', '97', '[\"CLS-WS-18v104\",\"18  vCPUs\",\"104 GB DDR4\",\"800 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '30600', 1, '2023-08-22 06:39:28', '2024-01-03 02:17:31', NULL),
(134, '0', '94', '97', '[\"CLS-Lin-18v104\",\"18  vCPUs\",\"104 GB DDR4\",\"800 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '23850', 1, '2023-08-22 06:40:07', '2024-01-03 02:17:49', NULL),
(135, '0', '94', '97', '[\"CLS-WS-16v96\",\"16 vCPUs\",\"96 GB DDR4\",\"700 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '27200', 1, '2023-08-22 06:40:45', '2024-01-03 02:16:42', NULL),
(136, '0', '94', '97', '[\"CLS-Lin-16v96\",\"16 vCPUs\",\"96 GB DDR4\",\"700 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '21200', 1, '2023-08-22 06:41:18', '2024-01-03 02:16:18', NULL),
(137, '0', '94', '97', '[\"CLS-WS-14v84\",\"14  vCPUs\",\"84 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '23800', 1, '2023-08-22 06:41:50', '2024-01-03 02:16:04', NULL),
(138, '0', '94', '97', '[\"CLS-Lin-14v84\",\"14  vCPUs\",\"84 GB DDR4\",\"600 GB SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '18550', 1, '2023-08-22 06:42:21', '2024-01-03 02:15:48', NULL),
(139, '0', '94', '97', '[\"CLS-WS-12v72\",\"12 vCPUs\",\"72 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '20400', 1, '2023-08-22 06:42:51', '2024-01-03 02:14:36', NULL),
(140, '0', '94', '97', '[\"CLS-Lin-12v72\",\"12 vCPUs\",\"72 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '15900', 1, '2023-08-22 06:43:24', '2024-01-03 02:14:05', NULL),
(141, '0', '94', '97', '[\"CLS-WS-10v60\",\"10 vCPUs\",\"60 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '17000', 1, '2023-08-22 06:44:00', '2024-01-03 02:13:47', NULL),
(142, '0', '94', '97', '[\"CLS-Lin-10v60\",\"10 vCPUs\",\"60 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '13250', 1, '2023-08-22 06:44:35', '2024-01-03 02:13:26', NULL),
(143, '0', '94', '97', '[\"CLS-WS-8v48\",\"8 vCPUs\",\"48 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '13600', 1, '2023-08-22 06:45:03', '2024-01-03 02:13:13', NULL),
(144, '0', '94', '97', '[\"CLS-Lin-8v48\",\"8 vCPUs\",\"48 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '10600', 1, '2023-08-22 06:45:32', '2024-01-03 02:12:47', NULL),
(145, '0', '94', '97', '[\"CLS-WS-6v36\",\"6 vCPUs\",\"36 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '10200', 1, '2023-08-22 06:46:03', '2024-01-03 02:11:31', NULL),
(146, '0', '94', '97', '[\"CLS-Lin-6v36\",\"6 vCPUs\",\"36 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '7950', 1, '2023-08-22 06:46:38', '2024-01-03 02:11:17', NULL),
(147, '0', '94', '97', '[\"CLS-WS-4v24\",\"4 vCPUs\",\"24 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '6800', 1, '2023-08-22 06:47:18', '2024-01-03 02:10:58', NULL),
(148, '0', '94', '97', '[\"CLS-Lin-4v24\",\"4 vCPUs\",\"24 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '5300', 1, '2023-08-22 06:47:48', '2024-01-03 02:10:42', NULL),
(149, '0', '41', '57', '[\"VPS-WS-32v128\",\"32 vCPUs\",\"128  GB DDR4\",\"1524 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '29600', 1, '2023-08-22 07:24:11', '2023-08-22 07:24:11', NULL),
(150, '0', '41', '57', '[\"VPS-Lin-32v128\",\"32 vCPUs\",\"128  GB DDR4\",\"1524 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '17600', 1, '2023-08-22 07:24:41', '2023-08-22 07:24:41', NULL),
(151, '0', '41', '57', '[\"VPS-WS-30v128\",\"30  vCPUs\",\"128 GB DDR4\",\"1424 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '27750', 1, '2023-08-22 07:25:12', '2023-08-22 07:25:12', NULL),
(152, '0', '41', '57', '[\"VPS-Lin-30v128\",\"30  vCPUs\",\"128 GB DDR4\",\"1424 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '16500', 1, '2023-08-22 07:25:40', '2023-08-22 07:25:40', NULL),
(153, '0', '41', '57', '[\"VPS-WS-28v128\",\"28 vCPUs\",\"128 GB DDR4\",\"1324 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '25900', 1, '2023-08-22 07:26:09', '2023-08-22 07:26:09', NULL),
(154, '0', '41', '57', '[\"VPS-Lin-28v128\",\"28 vCPUs\",\"128 GB DDR4\",\"1324 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '15400', 1, '2023-08-22 07:26:38', '2023-08-22 07:26:38', NULL),
(155, '0', '41', '57', '[\"VPS-WS-26v78\",\"26  vCPUs\",\"78 GB DDR4\",\"1224 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '24050', 1, '2023-08-22 07:27:13', '2023-08-22 07:27:13', NULL),
(156, '0', '41', '57', '[\"VPS-Lin-26v78\",\"26  vCPUs\",\"78 GB DDR4\",\"1224 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '14300', 1, '2023-08-22 07:27:47', '2023-08-22 07:27:47', NULL),
(157, '0', '41', '57', '[\"VPS-WS-24v72\",\"24 vCPUs\",\"72 GB DDR4\",\"1124 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '22200', 1, '2023-08-22 07:28:20', '2023-08-22 07:28:20', NULL),
(158, '0', '41', '57', '[\"VPS-Lin-24v72\",\"24 vCPUs\",\"72 GB DDR4\",\"1124 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '13200', 1, '2023-08-22 07:30:58', '2023-08-22 07:30:58', NULL),
(159, '0', '41', '57', '[\"VPS-WS-22v66\",\"22 vCPUs\",\"66 GB DDR4\",\"1024 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '20350', 1, '2023-08-22 07:31:45', '2023-08-22 07:31:45', NULL),
(160, '0', '41', '57', '[\"VPS-Lin-22v66\",\"22 vCPUs\",\"66 GB DDR4\",\"1024 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '12100', 1, '2023-08-22 07:32:16', '2023-08-22 07:32:16', NULL),
(161, '0', '41', '57', '[\"VPS-WS-20v60\",\"20 vCPUs\",\"60 GB DDR4\",\"900 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '18500', 1, '2023-08-22 07:32:47', '2023-08-22 07:32:47', NULL),
(162, '0', '41', '57', '[\"VPS-Lin-20v60\",\"20 vCPUs\",\"60 GB DDR4\",\"900 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '11000', 1, '2023-08-22 07:33:28', '2023-08-22 07:33:28', NULL),
(163, '0', '41', '57', '[\"VPS-WS-18v54\",\"18  vCPUs\",\"54 GB DDR4\",\"800 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '16650', 1, '2023-08-22 07:33:56', '2023-08-22 07:33:56', NULL),
(164, '0', '41', '57', '[\"VPS-Lin-18v54\",\"18  vCPUs\",\"54 GB DDR4\",\"800 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '9900', 1, '2023-08-22 07:34:28', '2023-08-22 07:34:28', NULL),
(165, '0', '41', '57', '[\"VPS-WS-16v48\",\"16 vCPUs\",\"48 GB DDR4\",\"700 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '14800', 1, '2023-08-22 07:35:08', '2023-08-22 07:35:08', NULL),
(166, '0', '41', '57', '[\"VPS-Lin-16v48\",\"16 vCPUs\",\"48 GB DDR4\",\"700 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '8800', 1, '2023-08-22 07:35:53', '2023-08-22 07:35:53', NULL),
(167, '0', '41', '57', '[\"VPS-WS-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '12950', 1, '2023-08-22 07:36:24', '2023-08-22 07:36:24', NULL),
(168, '0', '41', '57', '[\"VPS-Lin-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '7700', 1, '2023-08-22 07:36:53', '2023-08-22 07:36:53', NULL),
(169, '0', '41', '57', '[\"VPS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '11100', 1, '2023-08-22 07:37:20', '2023-08-22 07:37:20', NULL),
(170, '0', '41', '57', '[\"VPS-Lin-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '6600', 1, '2023-08-22 07:37:48', '2023-08-22 07:37:48', NULL),
(171, '0', '41', '57', '[\"VPS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '9250', 1, '2023-08-22 07:38:26', '2023-08-22 07:38:26', NULL),
(172, '0', '41', '57', '[\"VPS-Lin-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '5500', 1, '2023-08-22 07:38:53', '2023-08-22 07:38:53', NULL),
(173, '0', '41', '57', '[\"VPS-WS-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '7400', 1, '2023-08-22 07:39:24', '2023-08-22 07:39:24', NULL),
(174, '0', '41', '57', '[\"VPS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '4400', 1, '2023-08-22 07:39:52', '2023-08-22 07:39:52', NULL),
(175, '0', '41', '57', '[\"VPS-WS-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '5550', 1, '2023-08-22 07:40:21', '2023-08-22 07:40:21', NULL),
(176, '0', '41', '57', '[\"VPS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '3300', 1, '2023-08-22 07:40:58', '2023-08-22 07:40:58', NULL),
(177, '0', '41', '57', '[\"VPS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', '3700', 1, '2023-08-22 07:41:35', '2023-08-22 07:41:35', NULL),
(178, '0', '41', '57', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', '2200', 1, '2023-08-22 07:42:07', '2023-08-22 07:42:07', NULL),
(179, '0', '94', '96', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', '5550', 1, '2023-08-22 10:09:01', '2023-08-22 10:09:01', NULL),
(180, '0', '94', '96', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', '3300', 1, '2023-08-22 10:09:30', '2023-08-22 10:09:30', NULL),
(181, '0', '43', '64', '[\"BM-GPU-A40\",\"CUDA Cores\\t10752 GPU Memory\\t48 GB GDDR6 ECC Memory Interface\\t384-bit Memory Bandwidth\\t696 GB\\/s NVLink\\t2-Way, 2-Slot, 112.5 GB\\/s Bidirectional\",\"1 * 48GB\",\"16\",\"256\",\"2 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '65000', 1, '2023-09-23 15:34:32', '2023-09-23 15:34:32', NULL),
(182, '0', '43', '64', '[\"BM-GPU-2A40\",\"CUDA Cores 10752 GPU Memory 48 GB GDDR6 ECC Memory Interface 384-bit Memory Bandwidth 696 GB\\/s NVLink 2-Way, 2-Slot, 112.5 GB\\/s Bidirectional\",\"96 GB\",\"32\",\"512 DDR4 3200\",\"3 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '95000', 1, '2023-09-26 07:25:15', '2023-09-26 07:25:15', NULL),
(183, '0', '43', '64', '[\"BM-GPU-3A40\",\"CUDA Cores 10752 GPU Memory 48 GB GDDR6 ECC Memory Interface 384-bit Memory Bandwidth 696 GB\\/s NVLink 2-Way, 2-Slot, 112.5 GB\\/s Bidirectional\",\"144 GB\",\"64\",\"512 GB DDR4 3200\",\"3 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '125000', 1, '2023-09-26 07:26:25', '2023-09-26 07:26:25', NULL),
(184, '0', '43', '65', '[\"BM-GPU-A100\",\"NVIDIA A100 Tensor Core GPU features 19.5 teraflops of FP32 performance, up to 312 teraflops of TF32 performance,6,912 CUDA cores, 432 Tensor Cores, up to 80GB of graphics memory and 1.6TB\\/s of graphics memory bandwidth.Multi-Instance GPU Up to 7MIGs @10GB\",\"1 * 80 GB\",\"16\",\"256 GB DDR4 3200\",\"2 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '125000', 1, '2023-09-27 11:36:09', '2023-09-27 11:36:09', NULL),
(185, '0', '43', '65', '[\"BM-GPU-A100\",\"NVIDIA A100 Tensor Core GPU features 19.5 teraflops of FP32 performance, up to 312 teraflops of TF32 performance,6,912 CUDA cores, 432 Tensor Cores, up to 80GB of graphics memory and 1.6TB\\/s of graphics memory bandwidth.Multi-Instance GPU Up to 7MIGs @10GB\",\"1 * 80 GB\",\"32\",\"512 GB DDR4 3200\",\"3 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '135000', 1, '2023-09-27 12:24:40', '2023-09-27 12:24:40', NULL),
(186, '0', '43', '65', '[\"BM-GPU-A100\",\"NVIDIA A100 Tensor Core GPU features 19.5 teraflops of FP32 performance, up to 312 teraflops of TF32 performance,6,912 CUDA cores, 432 Tensor Cores, up to 80GB of graphics memory and 1.6TB\\/s of graphics memory bandwidth.Multi-Instance GPU Up to 7MIGs @10GB\",\"1  * 80\",\"64\",\"512 GB DDR4 3200\",\"3 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '150000', 1, '2023-09-27 12:26:17', '2023-09-27 12:26:17', NULL),
(187, '0', '43', '65', '[\"BM-GPU-2A100\",\"NVIDIA A100 Tensor Core GPU features 19.5 teraflops of FP32 performance, up to 312 teraflops of TF32 performance,6,912 CUDA cores, 432 Tensor Cores, up to 80GB of graphics memory and 1.6TB\\/s of graphics memory bandwidth.Multi-Instance GPU Up to 7MIGs @10GB\",\"2 * 80 GB\",\"16\",\"256 GB DDR4 3200\",\"2 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '225000', 1, '2023-09-27 12:27:45', '2023-09-27 12:27:45', NULL),
(188, '0', '43', '65', '[\"BM-GPU-2A100\",\"NVIDIA A100 Tensor Core GPU features 19.5 teraflops of FP32 performance, up to 312 teraflops of TF32 performance,6,912 CUDA cores, 432 Tensor Cores, up to 80GB of graphics memory and 1.6TB\\/s of graphics memory bandwidth.Multi-Instance GPU Up to 7MIGs @10GB\",\"2 * 80 GB\",\"32\",\"512 GB DDR4 3200\",\"3 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '235000', 1, '2023-09-27 12:29:04', '2023-09-27 12:29:04', NULL),
(189, '0', '43', '65', '[\"BM-GPU-2A100\",\"NVIDIA A100 Tensor Core GPU features 19.5 teraflops of FP32 performance, up to 312 teraflops of TF32 performance,6,912 CUDA cores, 432 Tensor Cores, up to 80GB of graphics memory and 1.6TB\\/s of graphics memory bandwidth.Multi-Instance GPU Up to 7MIGs @10GB\",\"2 * 80\",\"64\",\"512 GB DDR4 3200\",\"3 * 7.68 TB Gen4 NVMe\",\"Linux\"]', '245000', 1, '2023-09-27 12:30:19', '2023-09-27 12:30:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pricing_enqs`
--

CREATE TABLE `pricing_enqs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `skype` varchar(100) NOT NULL,
  `pricing_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `price` varchar(100) DEFAULT NULL,
  `full_entry` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricing_enqs`
--

INSERT INTO `pricing_enqs` (`id`, `name`, `phone`, `email`, `skype`, `pricing_id`, `message`, `price`, `full_entry`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Rana Sharma', '8825171386', 'iamranasharma@gmail.com', 'iamranasharma@gmail.com', 1, 'Test', '1999', '[\"Test\",\"4\",\"8GB\",\"256GB\",\"Network prot 4\",\"windows\"]', 1, '2023-08-09 04:26:31', '2023-08-09 04:26:31'),
(4, 'Deep', '6767579787', 'deep.chandra@gmail.com', 'deep.chandra@gmail.com', 83, 'test', '6600', '[\"CLS-Lin-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-21 09:23:15', '2023-08-21 09:23:15'),
(5, 'Deep Bhatt', '89032445335555555', 'engineersmine.mktg@gmail.com', 'engineersmine.mktg@gmail.com', 178, 'Hi test', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-22 11:44:33', '2023-08-22 11:44:33'),
(6, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'engineersmine.mktg@gmail.com', 38, 'Test', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-23 05:47:42', '2023-08-23 05:47:42'),
(7, 'test', '9876543210', 'hosting.octa@gmail.com', 'avinash@skype', 98, 'pio]\'[i\r\ni', '5500', '[\"CLS-Lin-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-23 11:53:51', '2023-08-23 11:53:51'),
(8, 'facility', '9874563210', 'avinash@orrish.com', 'avinash@skype', 93, 'asxdsa', '12950', '[\"CLS-WS-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-23 11:56:58', '2023-08-23 11:56:58'),
(9, 'test', '9876543210', 'seller@example.com', 'avinash@skype', 97, 'asfdsfsa', '9250', '[\"CLS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-23 12:00:36', '2023-08-23 12:00:36'),
(10, 'test', '9876543210', 'seller@example.com', 'avinash@skype', 97, 'asfdsfsa', '9250', '[\"CLS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-23 12:01:09', '2023-08-23 12:01:09'),
(11, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'engineersmine.mktg@gmail.com', 104, 'Test', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-24 13:13:06', '2023-08-24 13:13:06'),
(12, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'engineersmine.mktg@gmail.com', 104, 'Test', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-24 13:13:57', '2023-08-24 13:13:57'),
(13, 'Avinash', '9874563210', 'avinash@gmail.com', 'gfhfdssf', 171, 'dsfsfdf', '9250', '[\"VPS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', 1, '2023-08-25 10:40:33', '2023-08-25 10:40:33'),
(14, 'YashPal Sharma', '9560197840', 'yashpal.gautam@gmail.com', 'Cloudware', 100, 'I am Interested in this Plan', '4400', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-25 11:41:59', '2023-08-25 11:41:59'),
(15, 'Deep Bhatt', '08392833603', 'd.bhatt693@gmail.com', 'Test', 104, 'Test', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-26 07:47:57', '2023-08-26 07:47:57'),
(16, 'Test', '9784563210', 'vik@gmail.com', 'fsdg', 103, 'fdgdfg', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-26 09:31:51', '2023-08-26 09:31:51'),
(17, 'sgfdrg', '9876543210', 'dsafs@ghfg.jygbj', 'xdvxvgx', 37, 'vsdavbds', '16500', '[\"BM-GP-16v464\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4 <br>2 * 8 Core 2.50 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 09:58:08', '2023-08-26 09:58:08'),
(18, 'sgfdrg', '9876543210', 'dsafs@ghfg.jygbj', 'xdvxvgx', 37, 'vsdavbds', '16500', '[\"BM-GP-16v464\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4 <br>2 * 8 Core 2.50 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 09:58:49', '2023-08-26 09:58:49'),
(19, 'gfdh', '9988766555', 'ewtr@gbfh.ghf', 'szcdzSV', 178, 'csdaxbgdsn', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-26 09:59:19', '2023-08-26 09:59:19'),
(20, 'gfdh', '9988766555', 'ewtr@gbfh.ghf', 'szcdzSV', 178, 'csdaxbgdsn', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-26 10:00:30', '2023-08-26 10:00:30'),
(21, 'gfdh', '9988766555', 'ewtr@gbfh.ghf', 'szcdzSV', 178, 'csdaxbgdsn', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-26 10:01:13', '2023-08-26 10:01:13'),
(22, 'gfdh', '9988766555', 'ewtr@gbfh.ghf', 'szcdzSV', 178, 'csdaxbgdsn', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-26 10:03:59', '2023-08-26 10:03:59'),
(23, 'gfdh', '9988766555', 'ewtr@gbfh.ghf', 'szcdzSV', 178, 'csdaxbgdsn', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-26 10:04:12', '2023-08-26 10:04:12'),
(24, 'gfngfn', '9876543210', 'avinashsingh@gmail.com', 'xdvxvgx', 103, 'sdfsdfg', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-26 10:04:48', '2023-08-26 10:04:48'),
(25, 'gfngfn', '9876543210', 'avinashsingh@gmail.com', 'xdvxvgx', 103, 'sdfsdfg', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-26 10:05:31', '2023-08-26 10:05:31'),
(26, 'Avinash', '9876543210', 'hosting@gmail.com', 'avinash@skype', 178, 'ewfresarfw', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-26 10:18:46', '2023-08-26 10:18:46'),
(27, 'vi', '9897656433', 'info@ngo.com', 'szcdzSV', 104, 'sdfsdgs', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-26 11:13:08', '2023-08-26 11:13:08'),
(28, 'vi', '9897656433', 'info@ngo.com', 'szcdzSV', 104, 'sdfsdgs', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-26 11:17:10', '2023-08-26 11:17:10'),
(29, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:18:01', '2023-08-26 11:18:01'),
(30, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:21:08', '2023-08-26 11:21:08'),
(31, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:22:32', '2023-08-26 11:22:32'),
(32, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:25:48', '2023-08-26 11:25:48'),
(33, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:26:44', '2023-08-26 11:26:44'),
(34, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:28:47', '2023-08-26 11:28:47'),
(35, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:31:56', '2023-08-26 11:31:56'),
(36, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:34:46', '2023-08-26 11:34:46'),
(37, 'Admin', '8285324786', 'khannaushad456@gmail.com', 'cloudhost', 104, 'kkkkhadshf', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-26 11:36:35', '2023-08-26 11:36:35'),
(38, 'Residential Exterior Designing Service', '9178768656', 'deepak.ui@orrish.com', 'xdvxvgx', 38, 'dfgg', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-26 11:43:01', '2023-08-26 11:43:01'),
(39, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 37, 'Test Test', '16500', '[\"BM-GP-16v464\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4 <br>2 * 8 Core 2.50 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-28 06:00:53', '2023-08-28 06:00:53'),
(40, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 178, 'Test Test', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-28 06:24:32', '2023-08-28 06:24:32'),
(41, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 33, 'test', '20500', '[\"BM-GP-24v4128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4640 v4<br> 2 * 12 Core\\/BC 2.10 GHz\\\"\",\"24\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-28 12:16:18', '2023-08-28 12:16:18'),
(42, 'jamil', '9666619222', 'admin@example.com', 'vikash', 178, 'hi', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-28 17:12:39', '2023-08-28 17:12:39'),
(43, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 38, 'Test', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-29 04:40:32', '2023-08-29 04:40:32'),
(44, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 93, 'Test', '12950', '[\"CLS-WS-14v42\",\"14  vCPUs\",\"42 GB DDR4\",\"600 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 06:03:38', '2023-08-29 06:03:38'),
(45, 'Avi', '9876543210', 'avinash@gmail.com', 'company', 103, 'test', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:18:29', '2023-08-29 07:18:29'),
(46, 'Avi', '9876543210', 'avinash@gmail.com', 'company', 103, 'test', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:18:52', '2023-08-29 07:18:52'),
(47, 'Avi', '9876543210', 'avinash@gmail.com', 'company', 103, 'test', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:21:23', '2023-08-29 07:21:23'),
(48, 'abhishek parmar', '12453698974', 'abhi@gmail.com', 'it industries', 103, 'uhoiu', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:33:35', '2023-08-29 07:33:35'),
(49, 'yogesh', '8077560552', 'yk.dhankar@gmail.com', 'it', 104, 'sfjalkjlkfe', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:33:42', '2023-08-29 07:33:42'),
(50, 'yk', '8077', 'yk.dhankar@gmail.com', 'sdfka', 104, 'asfef', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:38:02', '2023-08-29 07:38:02'),
(51, 'yk', '8077', 'yk.dhankar@gmail.com', 'sdfka', 104, 'asfef', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:38:50', '2023-08-29 07:38:50'),
(52, 'abhishek parmar', '12453698974', 'abhi@gmail.com', 'it industries', 103, 'uhoiu', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:39:40', '2023-08-29 07:39:40'),
(53, 'test', '6207747386', 'abhi@gmail.com', 'thakur it industries', 177, 'ygujj', '3700', '[\"VPS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', 1, '2023-08-29 07:40:08', '2023-08-29 07:40:08'),
(54, 'yk', '8077', 'yk.dhankar@gmail.com', 'sdfka', 104, 'asfef', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:47:01', '2023-08-29 07:47:01'),
(55, 'yk', '8077', 'yk.dhankar@gmail.com', 'sdfka', 104, 'asfef', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:48:18', '2023-08-29 07:48:18'),
(56, 'yk', '8077', 'yk.dhankar@gmail.com', 'sdfj', 176, 'afqfe', '3300', '[\"VPS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-29 07:49:02', '2023-08-29 07:49:02'),
(57, 'test', '6207747386', 'abhi@gmail.com', 'thakur it industries', 177, 'ygujj', '3700', '[\"VPS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', 1, '2023-08-29 07:50:03', '2023-08-29 07:50:03'),
(58, 'abhishek parmar', '12453698974', 'abhi@gmail.com', 'thakur it industries', 102, 'test', '3300', '[\"CLS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:50:22', '2023-08-29 07:50:22'),
(59, 'yk', '8077', 'yk.dhankar@gmail.com', 'sdfj', 176, 'afqfe', '3300', '[\"VPS-Lin-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-29 07:50:51', '2023-08-29 07:50:51'),
(60, 'yk', '8077', 'yk.dhankar@cloudwareindia.com', 'it', 104, 'asdfafad', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 07:51:55', '2023-08-29 07:51:55'),
(61, 'Avi SIngh', '9879879874', 'avinashsingh@gmail.com', 'Orrish', 103, 'Test message', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:54:02', '2023-08-29 07:54:02'),
(62, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:59:10', '2023-08-29 07:59:10'),
(63, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 07:59:53', '2023-08-29 07:59:53'),
(64, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:00:41', '2023-08-29 08:00:41'),
(65, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:02:03', '2023-08-29 08:02:03'),
(66, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:02:55', '2023-08-29 08:02:55'),
(67, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:04:13', '2023-08-29 08:04:13'),
(68, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'sdaf', 95, 'feafd', '11100', '[\"CLS-WS-12v36\",\"12 vCPUs\",\"36 GB DDR4\",\"500 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:06:04', '2023-08-29 08:06:04'),
(69, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'fe', 100, 'feafad', '4400', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 08:06:57', '2023-08-29 08:06:57'),
(70, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'fe', 100, 'feafad', '4400', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 08:08:52', '2023-08-29 08:08:52'),
(71, 'Yogesh Kumar', '8077', 'yk.dhankar@gmail.com', 'fe', 175, 'feafad', '5550', '[\"VPS-WS-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', 1, '2023-08-29 08:11:41', '2023-08-29 08:11:41'),
(72, 'tete', '6207747386', 'abhi@gmail.com', 'thakur it industries', 178, 'ljkl', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-29 08:12:37', '2023-08-29 08:12:37'),
(73, 'yk', '8077560552', 'yk.dhankar@cloudwareindia.com', 'it', 104, 'afefe', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 08:12:52', '2023-08-29 08:12:52'),
(74, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 104, 'Test', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 08:19:52', '2023-08-29 08:19:52'),
(75, 'abhishek parmar', '1245369897', 'abhi@gmail.com', 'thakur it industries', 37, 'test', '16500', '[\"BM-GP-16v464\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4655 v4 <br>2 * 8 Core 2.50 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-29 08:20:11', '2023-08-29 08:20:11'),
(76, 'abhishek parmar', '9876543210', 'abhi@gmail.com', 'it industries', 103, 'test', '3700', '[\"CLS-WS-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:22:03', '2023-08-29 08:22:03'),
(77, 'Yogesh Kumar', '7210424601', 'yk.dhankar@gmail.com', 'NBT', 97, 'test', '9250', '[\"CLS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 08:25:24', '2023-08-29 08:25:24'),
(78, 'Test', '2343542343', 'test@gmail.com', 'Test', 178, 'Hi tesing', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-29 08:28:26', '2023-08-29 08:28:26'),
(79, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Cloudware Technologies', 178, 'Test.', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-29 08:54:32', '2023-08-29 08:54:32'),
(80, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Cloudware Technologies', 104, 'Test', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 08:56:57', '2023-08-29 08:56:57'),
(81, 'YashPal Sharma', '9560197840', 'yashpal.gautam@gmail.com', 'Cloudware', 30, 'I am Interstead', '23500', '[\"BM-GP-32v3256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2698 v3<br> 2 * 16 Core 2.30 GHz \\\"\",\"32\",\"256  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-29 09:19:00', '2023-08-29 09:19:00'),
(82, 'Deep Bhatt', '6767579787', 'engineersmine.mktg@gmail.com', 'Test', 31, 'test', '22500', '[\"BM-GP-28v4128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4650 v4<br> 2 * 14 Core 2.20 GHz\\\"\",\"28\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-29 09:19:56', '2023-08-29 09:19:56'),
(83, 'Deep Bhatt', '9870407840', 'test@gmail.com', 'test', 173, 'test', '7400', '[\"VPS-WS-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', 1, '2023-08-29 09:27:08', '2023-08-29 09:27:08'),
(84, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 38, 'Test', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-29 10:49:04', '2023-08-29 10:49:04'),
(85, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 38, 'test.', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-29 10:50:58', '2023-08-29 10:50:58'),
(86, 'YashPal Sharma', '9560197840', 'yashpal.gautam@gmail.com', 'Cloudware', 67, 'Hello', '28500', '[\"BM-CO-32G2512\",\"\\\"Intel\\u00ae Xeon\\u00ae Gold 6246R Processor <br>    2 * 16 Core  3.40 GHz\\\"\",\"8\",\"128 GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', 1, '2023-08-29 11:11:05', '2023-08-29 11:11:05'),
(87, 'Deep Bhatt', '9870407840', 'deep.chandra@gmail.com', 'Cloudware Technologies', 101, 'Hi, this is a test inquiry.', '5550', '[\"CLS-WS-6v18\",\"6 vCPUs\",\"18 GB DDR4\",\"200 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Windows Server\"]', 1, '2023-08-29 13:41:31', '2023-08-29 13:41:31'),
(88, 'Deep Bhatt', '9870407840', 'deep.chandra@gmail.com', 'Cloudware Technologies', 104, 'Hi, this is a test inquiry.', '2200', '[\"CLS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-29 13:42:09', '2023-08-29 13:42:09'),
(89, 'Test', '9870407840', 'test@gmail.com', 'Test', 21, 'test', '51500', '[\"BM-GP-40G512\",\"\\\" Intel\\u00ae Xeon\\u00ae Gold 6148 Processor<br> 2 * 20 Core 2.40 GHz\\\"\",\"40\",\"512  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', 1, '2023-08-29 13:46:20', '2023-08-29 13:46:20'),
(90, 'Avinash Singh', '9874563210', 'avinash@gmail.com', 'gfhfdssf', 178, 'retet', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-30 09:35:03', '2023-08-30 09:35:03'),
(91, 'Avinash Singh', '9874563210', 'avinash@gmail.com', 'gfhfdssf', 178, 'retet', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-30 09:43:00', '2023-08-30 09:43:00'),
(92, 'Avinash Singh', '9874563210', 'avinash@gmail.com', 'gfhfdssf', 178, 'retet', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-30 09:43:27', '2023-08-30 09:43:27'),
(93, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 178, 'test', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-08-31 04:31:50', '2023-08-31 04:31:50'),
(94, 'Yogi', '8077560552', 'yk.dhankar@gmail.com', 'IT', 34, 'test purpose', '19500', '[\"BM-GP-24v3128\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2658 v3 <br> 2 *  12 Core 2.20 GHz\\\"\",\"24\",\"128  GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-08-31 05:30:24', '2023-08-31 05:30:24'),
(95, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Cloudware Technologies', 100, 'Test..', '4400', '[\"CLS-Lin-8v24\",\"8 vCPUs\",\"24 GB DDR4\",\"300 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2023-08-31 05:31:24', '2023-08-31 05:31:24'),
(96, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Cloudware Technologies', 38, 'Test', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-09-01 04:35:36', '2023-09-01 04:35:36'),
(97, 'YashPal Sharma', '+919560197840', 'yashpal.sharma@cloudwareindia.com', 'CLOUDWARE TECHNOLOGIES PRIVATE LTD', 73, 'Hello', '20500', '[\"BM-CO-8v4128\",\"Intel\\u00ae Xeon\\u00ae Processor E5-1620v4  <br> 2 * 4 Core 3.50GHz\",\"8\",\"128 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"4 * 10G, 4 *1G\",\"Centos\"]', 1, '2023-09-01 12:16:29', '2023-09-01 12:16:29'),
(98, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Cloudware Technologies', 178, 'Hi, This is test order.', '2200', '[\"VPS-Lin-4v12\",\"4 vCPUs\",\"12 GB DDR4\",\"100 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Linux\"]', 1, '2023-09-02 10:08:44', '2023-09-02 10:08:44'),
(99, 'Deep Bhatt', '9870407840', 'engineersmine.mktg@gmail.com', 'Test', 171, 'This is test email.', '9250', '[\"VPS-WS-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"10G\",\"Unlimited\",\"Windows Server\"]', 1, '2023-09-18 05:14:04', '2023-09-18 05:14:04'),
(100, 'YashPal Sharma', '09560197840', 'yashpal.sharma@cloudwareindia.com', 'CLOUDWARE TECHNOLOGIES PRIVATE LTD', 181, 'I am Intersted in Plan GPU', '65000', '[\"BM-GPU-A40\",\"CUDA Cores\\t10752 GPU Memory\\t48 GB GDDR6 ECC Memory Interface\\t384-bit Memory Bandwidth\\t696 GB\\/s NVLink\\t2-Way, 2-Slot, 112.5 GB\\/s Bidirectional\",\"1 * 48GB\",\"16\",\"256\",\"2 * 7.68 TB Gen4 NVMe\",\"Linux\"]', 1, '2023-09-25 11:01:55', '2023-09-25 11:01:55'),
(101, 'Naushad', '86578975467', 'khannaushad456@gmail.com', 'Home', 38, 'Abcd', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-09-25 11:19:40', '2023-09-25 11:19:40'),
(102, 'URVASHI', '7290918028', 'urvashi.blog@gmail.com', 'CTPL', 38, 'want to buy server', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-10-03 04:47:08', '2023-10-03 04:47:08'),
(103, 'YashPal Sharma', '09560197840', 'yashpal.sharma@cloudwareindia.com', 'CLOUDWARE TECHNOLOGIES PRIVATE LTD', 38, 'Hello', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-10-03 08:08:32', '2023-10-03 08:08:32'),
(104, 'YashPal Sharma', '09560197840', 'yashpal.gautam@gmail.com', 'Cantik Technologies Pvt Ltd', 26, 'hello', '32500', '[\"BM-GP-44v4256\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-4669 v4<br> 2 * 22 Core 2.20 GHz\\\"\",\"44\",\"256  GB DDR4\",\"2 * 3.68 TB SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-10-05 03:21:08', '2023-10-05 03:21:08'),
(105, 'XIN', '+66808426250', 'taginternets@aol.com', 'No', 38, 'I need to buy this server\r\nPlease contact me via email, thanks!', '15500', '[\"BM-GP-16v364\",\"\\\"Intel\\u00ae Xeon\\u00ae Processor E5-2640 v3 <br> 2 * 8 Core  2.60 GHz\\\"\",\"16\",\"64 GB DDR4\",\"2 * 1.92TB  SAS SSD\",\"2 * 10G , 2 * 1G\",\"Ubuntu\"]', 1, '2023-11-07 01:40:13', '2023-11-07 01:40:13'),
(106, 'YashPal Sharma', '+919560197840', 'yashpal.sharma@cloudwareindia.com', 'Cloudware Technologies Private Limited', 18, 'I am Interested', '55500', '[\"BM-GP-64EP512\",\"AMD EPYC 7532 Processor<br> 2* 32 Core 2.40 GHz\",\"64\",\"512  GB DDR4\",\"3 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', 1, '2024-01-01 11:58:23', '2024-01-01 11:58:23'),
(107, 'YashPal Sharma', '+919560197840', 'yashpal.sharma@cloudwareindia.com', 'Cloudware Technologies Private Limited', 21, 'I am Interested', '51500', '[\"BM-GP-40G512\",\"Intel Xeon Gold 6148 Processor<br> 2*20 Core 2.40 GHz\",\"40\",\"512  GB DDR4\",\"2 * 7.68 TB Gen4 NVMe SSD\",\"4 * 10G, 4 *1G\",\"Ubuntu\"]', 1, '2024-01-01 11:59:14', '2024-01-01 11:59:14'),
(108, 'YashPal Sharma', '+919560197840', 'yashpal.sharma@cloudwareindia.com', 'CLOUDWARE TECHNOLOGIES PRIVATE LTD', 98, 'Hello', '11000', '[\"CLS-Lin-10v30\",\"10 vCPUs\",\"30 GB DDR4\",\"400 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2024-01-10 05:47:11', '2024-01-10 05:47:11'),
(109, 'abhishek parmar', '12453698974', 'abhi@gmail.com', 'thakur it industries', 148, 'test', '5300', '[\"CLS-Lin-4v24\",\"4 vCPUs\",\"24 GB DDR4\",\"100 GB  SAS SSD\",\"40G\",\"Unmetered\",\"Linux\"]', 1, '2024-01-12 03:31:49', '2024-01-12 03:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `pricing_types`
--

CREATE TABLE `pricing_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricing_types`
--

INSERT INTO `pricing_types` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Windows Dedicated Server', 'uploads/all/all-1690174891.png', 1, '2023-07-23 23:31:31', '2023-07-23 23:31:31'),
(2, 'Linux Dedicated Server', 'uploads/all/all-1690174922.png', 1, '2023-07-23 23:32:02', '2023-07-23 23:32:02'),
(3, 'Clustered Server (HA)', 'uploads/all/all-1690174959.png', 1, '2023-07-23 23:32:39', '2023-07-23 23:32:39'),
(4, 'GPU Server', 'uploads/all/all-1690174978.png', 1, '2023-07-23 23:32:58', '2023-07-23 23:32:58'),
(5, 'Database Dedicated Server', 'uploads/all/all-1690175001.png', 1, '2023-07-23 23:33:21', '2023-07-23 23:33:21'),
(6, 'Bare Mtl', 'uploads/all/all-1690636606.png', 1, '2023-07-29 07:46:46', '2023-07-29 07:46:46'),
(7, 'Bare-Metal Server', 'uploads/all/all-1690709781.png', 1, '2023-07-30 04:06:21', '2023-07-30 04:06:21'),
(8, 'VPS Hosting', 'uploads/all/all-1690781711.png', 1, '2023-07-31 00:05:11', '2023-07-31 00:05:11'),
(9, 'VPS Hosting', 'uploads/all/all-1690781749.png', 1, '2023-07-31 00:05:50', '2023-07-31 00:05:50'),
(10, 'Bare-Metal Server', 'uploads/all/all-1690782003.png', 1, '2023-07-31 00:10:03', '2023-07-31 00:10:03'),
(11, 'Bare-Metal Server', 'uploads/all/all-1690782535.png', 1, '2023-07-31 00:18:55', '2023-07-31 00:18:55'),
(12, 'Clustered Server (HA)', 'uploads/all/all-1690783152.png', 1, '2023-07-31 00:29:12', '2023-07-31 00:29:12'),
(13, 'Managed VPS Hosting', 'uploads/all/all-1690784187.jpg', 1, '2023-07-31 00:46:27', '2023-07-31 00:46:27'),
(14, 'Linux VPS Hosting', 'uploads/all/all-1690784836.png', 1, '2023-07-31 00:57:16', '2023-07-31 00:57:16'),
(15, 'Windows VPS Hosting', 'uploads/all/all-1690784950.jpg', 1, '2023-07-31 00:59:10', '2023-07-31 00:59:10'),
(16, 'Unmanaged VPS Hosting', 'uploads/all/all-1690785068.png', 1, '2023-07-31 01:01:08', '2023-07-31 01:01:08'),
(17, 'test', 'uploads/all/all-20230805072836-6051.png', 1, '2023-08-05 01:58:36', '2023-08-05 01:58:36'),
(18, 'Object Storage', 'uploads/all/all-20230805121515-3502.png', 1, '2023-08-05 06:45:15', '2023-08-05 06:45:15'),
(19, 'General Purpose', 'uploads/all/all-20230806105457-4000.png', 1, '2023-08-06 05:24:57', '2023-08-06 05:24:57'),
(20, 'CPU Optimized', 'uploads/all/all-20230806111812-9158.png', 1, '2023-08-06 05:48:12', '2023-08-06 05:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_weight` varchar(100) DEFAULT NULL,
  `product_unit` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `price_45` decimal(10,2) NOT NULL,
  `price_50` decimal(10,2) NOT NULL,
  `price_62` decimal(10,2) NOT NULL,
  `price_80` decimal(10,2) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT 0.00,
  `stock_quantity` int(11) DEFAULT 0,
  `stock_status` enum('in_stock','out_of_stock') DEFAULT 'in_stock',
  `sku` varchar(100) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `weight` decimal(8,2) DEFAULT NULL,
  `length` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_new` tinyint(1) DEFAULT 0,
  `is_best_seller` tinyint(1) DEFAULT 0,
  `num_of_sale` bigint(20) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `shop_id`, `category_id`, `brand_id`, `product_weight`, `product_unit`, `name`, `slug`, `short_description`, `description`, `purchase_price`, `price_45`, `price_50`, `price_62`, `price_80`, `price`, `offer_price`, `tax`, `stock_quantity`, `stock_status`, `sku`, `thumbnail`, `images`, `weight`, `length`, `width`, `height`, `meta_title`, `meta_keywords`, `meta_description`, `is_featured`, `is_new`, `is_best_seller`, `num_of_sale`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(55, 2, 19, 4, NULL, 'Kg', 'TEA KETTLE', 'window-curtains', 'Windows Curtains', '<p><span style=\"font-size: 14.4px;\">TEA KETTLE</span></p><p><span style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">बजाज इलेक्ट्रिक केटल्स आपको कहीं भी चाय या कॉफ़ी बनाने का एक तेज़ और कुशल तरीका प्रदान करते हैं। इसके अलावा, आप इन अद्भुत उपकरणों का उपयोग सूप, कपपा नूडल्स या पास्ता उबालने के लिए भी कर सकते हैं।</span><span style=\"font-size: 14.4px;\"></span></p>', 0.00, 0.00, 0.00, 0.00, 0.00, 1100.00, 860.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765467042466.TEA KETTLE.jpg', NULL, NULL, 100.00, 100.00, 100.00, 'Test Title', 'Test Title', 'Test Title', 1, 1, 0, 0, 1, 1, NULL, '2025-08-25 03:41:39', '2025-12-11 15:30:42'),
(56, 2, 18, 5, '555', 'Kg', 'Deep Frize', 'door-curtains', 'Door Curtains', '<p><span style=\"font-size: 14.4px;\">VOLTAS</span></p><p><span style=\"border-radius: 4px; padding: 0px 2px; background: linear-gradient(90deg, rgb(52, 69, 127) 50%, rgba(0, 0, 0, 0) 50%) 0% 0px / 200% 100% no-repeat rgb(31, 31, 31); color: rgb(255, 255, 255); animation: 0.75s cubic-bezier(0.05, 0.7, 0.1, 1) 0.25s 1 normal forwards running highlight; font-family: Arial, sans-serif; font-size: 16px;\">ल्टास हार्ड टॉप चेस्ट फ्रीजर में कुशल शीतलन प्रणाली नाशवान वस्तुओं की शेल्फ लाइफ बढ़ाती है, जिससे अपव्यय कम होता है और उपभोक्ताओं के लिए ताजगी सुनिश्चित होती है</span><span style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">&nbsp;।</span><span style=\"font-size: 14.4px;\"></span></p>', 0.00, 0.00, 0.00, 0.00, 0.00, 5500.00, 43990.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765466839310.Voltas-CVF500DD-P-Convertible-6.jpg', NULL, NULL, 100.00, 100.00, 100.00, 'Door Curtains', 'Door Curtains', 'Door Curtains', 1, 1, 0, 0, 1, 1, NULL, '2025-08-25 11:45:32', '2025-12-11 15:31:18'),
(57, 2, 18, 4, '3', 'Kg', 'HOME APPLIANCES', 'curtains-big', 'Curtains Big', '<p><span style=\"font-size: 14.4px;\">HOME APPLIANCES</span></p><ul><li><span data-huuid=\"6050393385617672327\" style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px;\"><span style=\"background-color: rgb(31, 31, 31);\">मिक्सर ग्राइंडर&nbsp;</span><mark class=\"QVRyCf\" style=\"background-image: linear-gradient(90deg, rgb(52, 69, 127) 50%, rgba(0, 0, 0, 0) 50%); background-position: 75% 0px; background-size: 200% 100%; background-repeat: no-repeat; background-attachment: scroll; background-origin: padding-box; background-clip: border-box; color: rgb(255, 255, 255); border-radius: 4px; padding: 0px 2px; animation: 0.75s cubic-bezier(0.05, 0.7, 0.1, 1) 0.25s 1 normal forwards running highlight-animation;\"><span style=\"background-color: rgb(31, 31, 31);\">एक रसोई उपकरण है जिसका </span><span style=\"background-color: rgb(255, 0, 255);\">उपयोग सामग्री को पीसने और मिलाने के लिए किया</span><span style=\"background-color: rgb(31, 31, 31);\"> जाता है</span></mark><span style=\"background-color: rgb(31, 31, 31);\">।&nbsp;</span></span><span data-huuid=\"6050393385617673466\" style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">इसमें एक मोटर बेस और अलग-अलग आकार के जार होते हैं जिनमें ब्लेड लगे होते हैं, जो इसे मसाले पीसने, चटनी बनाने, घोल बनाने, स्मूदी बनाने और अन्य रसोई कार्यों के लिए एक बहुमुखी उपकरण बनाते हैं।&nbsp;</span><span data-huuid=\"6050393385617670509\" style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">यह घर और औद्योगिक दोनों उपयोगों के लिए आता है।&nbsp;</span><span data-huuid=\"6050393385617672787\" style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\"><span jscontroller=\"JHnpme\" class=\"pjBG2e\" data-cid=\"d4702eaa-b607-4112-8a75-0cf7d6a07e51\" jsaction=\"rcuQ6b:npT2md\"><span class=\"UV3uM\" style=\"text-wrap-mode: nowrap;\">&nbsp;</span></span></span></li></ul>', 0.00, 0.00, 0.00, 0.00, 0.00, 4100.00, 3500.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765466689501.MIXC76776.jpg', NULL, NULL, 100.00, 100.00, 100.00, 'Curtains Big', 'Curtains Big', 'Curtains Big', 1, 1, 0, 0, 1, 1, NULL, '2025-08-25 11:48:37', '2025-12-11 15:24:49'),
(58, 2, 19, 6, NULL, 'Kg', 'LIVEFAST', 'curtain-tie-back', 'Curtain Tie Back', '<p><span style=\"font-size: 14.4px;\">LIVEFAST</span></p><p><span style=\"color: rgb(230, 232, 240); font-family: &quot;Google Sans&quot;, Roboto, Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">LIVE FAST\" (लिवफास्ट)&nbsp;</span><mark class=\"HxTRcb\" jscontroller=\"DfH0l\" jsuid=\"KdflNb_e\" data-processed=\"true\" style=\"color: rgb(238, 240, 255); border-radius: 4px; background-image: linear-gradient(90deg, rgb(52, 69, 127) 50%, rgba(0, 0, 0, 0) 50%); background-position: 75% 0px; background-size: 200% 100%; background-repeat: no-repeat; background-attachment: scroll; background-origin: padding-box; background-clip: border-box; padding: 0px 2px; animation: 0.75s cubic-bezier(0.05, 0.7, 0.1, 1) 0.25s 1 normal forwards running highlight-animation; font-family: &quot;Google Sans&quot;, Roboto, Arial, sans-serif; font-size: 16px;\">मुख्य रूप से भारत में एक&nbsp;<span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"KdflNb_f\" data-processed=\"true\" style=\"font-weight: bolder;\">ऊर्जा समाधान ब्रांड</span>&nbsp;है जो घर और उद्योगों के लिए इन्वर्टर, बैटरी (सोलर और यूपीएस), और सोलर उत्पाद बनाता है</mark><span style=\"color: rgb(230, 232, 240); font-family: &quot;Google Sans&quot;, Roboto, Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">, जो तेजी से चार्ज होने और लंबे बैकअप के लिए जाना जाता है, खासकर इनके स्मार्ट इन्वर्टर जो फोन से कनेक्ट होते हैं, लेकिन यह एक रेसिंग टीम (</span><a jsuid=\"KdflNb_g\" class=\"GI370e\" jsaction=\"rcuQ6b:&amp;KdflNb_g|npT2md\" jscontroller=\"CCvEPd\" data-wiz-uids=\"KdflNb_g\" data-ved=\"2ahUKEwiDmL_w6bWRAxVOSGwGHSAsKukQgK4QegQIARAE\" data-hveid=\"CAEQBA\" data-processed=\"true\" href=\"https://www.google.com/search?sca_esv=b338e4d9bf6df8e5&amp;rlz=1C1VIQF_enIN1126IN1126&amp;sxsrf=AE3TifNzaCAQoLDsjf3rzqxfSzJZSdjI9Q%3A1765466135401&amp;q=Live+Fast+Motorsports&amp;source=lnms&amp;fbs=AIIjpHzFg3sEDEykkQzYqxssy50-kxIuU0XxFRjNyNrv1J1bAlTHHRbN5IKLIUVP9MavslPkLN0rR9qFgS8-QGf1aP7ZlUqzjKwmln2SS5akCxlnjexUEKS3d1pDPx4VCzzDlYMTUWWwR5JsgtsevSOslH_FXNVr7snpbbubybbOIY4R7sOSPSk-aF85Ish1d_KlZBv5f3XhAdJi1HC396ApWVhHJXoUjyNuMFRhA0g9QpVN5lYEbag&amp;ved=2ahUKEwiDmL_w6bWRAxVOSGwGHSAsKukQgK4QegQIARAE&amp;ictx=111&amp;biw=1366&amp;bih=599&amp;dpr=1&amp;mstk=AUtExfABhedAZqRW7ZawlSKAPw2idGo7kcdLhfPKh5x6oQ5YYF1Um3oTKlB6LJ9G0s3L7ma7qYNdr2dKPnyVyKUQ_s2v7-uVYm2QKdt3TmSgWCvxrabFTxWRMzHyIyRG1_YkGCECz9QNl7EZawD4D08Y8aOosbofcXi6eO9u72gulSJ0I9FQ_Wk49GVhTUiFl1ZsgRZONwimaaFihTW-CAKntiF9hALvF5RYkmZg111hTvT4OfzqCixQQmwXpDn0bidm6vzaWwdes3KVoxMbjNS16l-vyc80BCA25mSDozaEg2EZKw&amp;csui=3\" style=\"text-decoration: underline 8% dotted rgb(158, 158, 158); -webkit-tap-highlight-color: rgba(255, 255, 255, 0.1); text-underline-offset: 10%; outline: 0px; font-family: &quot;Google Sans&quot;, Roboto, Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">Live Fast Motorsports</a><span style=\"color: rgb(230, 232, 240); font-family: &quot;Google Sans&quot;, Roboto, Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">) और संगीत से भी जुड़ा हो सकता है।</span><span jsuid=\"KdflNb_h\" class=\"uJ19be notranslate\" jsaction=\"rcuQ6b:&amp;KdflNb_h|npT2md\" jscontroller=\"udAs2b\" data-wiz-uids=\"KdflNb_h,KdflNb_i,KdflNb_j\" data-processed=\"true\" style=\"color: rgb(230, 232, 240); font-family: &quot;Google Sans&quot;, Roboto, Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\"><span class=\"vKEkVd\" data-animation-atomic=\"\" data-processed=\"true\" style=\"text-wrap-mode: nowrap; position: relative;\">&nbsp;</span></span><span style=\"font-size: 14.4px;\"></span></p>', 0.00, 0.00, 0.00, 0.00, 0.00, 300.00, 250.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765466418438.LIVE.jpg', NULL, NULL, 100.00, 100.00, 100.00, 'Curtain Tie Back', 'Curtain Tie Back', 'Curtain Tie Back', 1, 1, 0, 2, 1, 1, NULL, '2025-08-25 12:40:19', '2025-12-11 15:28:03'),
(59, 2, 18, 2, NULL, 'Kg', 'Refrigerator', 'cotton-king-size-bedsheet-with-2-pillows-cover', 'Live Beautiful Blue Paisley Cotton 145 TC King Bedsheet with 2 Pillow Covers-108 x 108 inches', '<div style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><p class=\"pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-top: 12px; width: 491.575px;\"><b><span style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; background-color: rgb(31, 31, 31);\">सैमसंग के फ्रिज&nbsp;</span><span style=\"border-radius: 4px; padding: 0px 2px; background: linear-gradient(90deg, rgb(52, 69, 127) 50%, rgba(0, 0, 0, 0) 50%) 0% 0px / 200% 100% no-repeat rgb(31, 31, 31); color: rgb(255, 255, 255); animation: 0.75s cubic-bezier(0.05, 0.7, 0.1, 1) 0.25s 1 normal forwards running highlight; font-family: Arial, sans-serif;\">विशाल और व्यवस्थित करने में आसान होते हैं क्योंकि इनमें आसानी से खिसकने वाली शेल्फ्स होती हैं</span><span style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; background-color: rgb(31, 31, 31);\">। इसका परिणाम यह है कि रेफ्रिजरेटर के अंदर कोई \'मृत स्थान\' नहीं होता। आसानी से खिसकने वाली शेल्फ्स रोलिंग हिंजेस पर बनी होती हैं, जो उन्हें सहजता से अंदर और बाहर खिसकने देती हैं।</span></b></p><p class=\"pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-top: 12px; width: 491.575px;\"><b><br></b></p><p class=\"pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-top: 12px; width: 491.575px;\"><b>Type: Flatsheet<br style=\"box-sizing: inherit;\">Thread count: 144<br style=\"box-sizing: inherit;\">Set content: 1 king bedsheet with 2 pillow covers<br style=\"box-sizing: inherit;\">Colour: Turquoise blue and white</b></p></div><div class=\"pdp-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"pdp-sizeFitDescTitle pdp-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-transform: capitalize; border: none; padding-bottom: 5px;\"><b>Size &amp; Fit</b></h4><p class=\"pdp-sizeFitDescContent pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 526.688px;\"><b>Dimensions: Bedsheet: 2.74 m x 2.74 m (Length x Width)<br style=\"box-sizing: inherit;\">Pillow Cover:&nbsp; 46 cm x 68 cm (Length x Width)</b></p></div><div class=\"pdp-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"pdp-sizeFitDescTitle pdp-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-transform: capitalize; border: none; padding-bottom: 5px;\"><b>Material &amp; Care</b></h4><p class=\"pdp-sizeFitDescContent pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 526.688px;\"><b>Cotton<br style=\"box-sizing: inherit;\">Machine Wash</b></p></div><div class=\"index-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"index-sizeFitDescTitle index-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-bottom: 12px; border: none; text-transform: capitalize;\"><b>Specifications</b></h4><div class=\"index-tableContainer\" style=\"box-sizing: inherit; display: flex; -webkit-box-pack: start; justify-content: flex-start; flex-flow: wrap; -webkit-box-orient: horizontal; -webkit-box-direction: normal;\"><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Bed Size</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>King</b></div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Quality</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>Regular</b></div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Thread Count</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>145</b></div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Type</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>Flat</b></div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Number of Pillow Covers</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>2</b></div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Number of Bedsheets</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>1</b></div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\"><b>Net Quantity</b></div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\"><b>3</b></div></div></div></div>', 0.00, 0.00, 0.00, 0.00, 0.00, 2999.00, 1889.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765465918532.SAMSANG FRI.jpg', NULL, NULL, 100.00, 100.00, 100.00, 'Cotton King Size Bedsheet with 2 Pillows cover', 'Cotton King Size Bedsheet with 2 Pillows cover', 'Cotton King Size Bedsheet with 2 Pillows cover', 1, 1, 0, 0, 1, 1, NULL, '2025-09-13 02:54:27', '2025-12-11 15:13:08'),
(60, 2, 20, 7, '112', 'Kg', 'Mdf Box Palang', 'cotton-king-size-bedsheet-with-2-pillows-cover-2', 'Live Beautiful Blue Paisley Cotton 145 TC King Bedsheet with 2 Pillow Covers-108 x 108 inches', '<div style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><p class=\"pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-top: 12px; width: 491.575px;\">Type: Flatsheet<br style=\"box-sizing: inherit;\">Thread count: 144<br style=\"box-sizing: inherit;\">Set content: 1 king bedsheet with 2 pillow covers<br style=\"box-sizing: inherit;\">Colour: Turquoise blue and white</p></div><div class=\"pdp-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"pdp-sizeFitDescTitle pdp-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; text-transform: capitalize; border: none; padding-bottom: 5px;\">Size &amp; Fit</h4><p class=\"pdp-sizeFitDescContent pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 526.688px;\">Dimensions: Bedsheet: 72 inch x 78 inch (Length x Width)<br style=\"box-sizing: inherit;\">Pillow Cover:&nbsp; 48 inch x 48 inch (Length x Width)</p></div><div class=\"pdp-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"pdp-sizeFitDescTitle pdp-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; text-transform: capitalize; border: none; padding-bottom: 5px;\">Material &amp; Care</h4><p class=\"pdp-sizeFitDescContent pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 526.688px;\">Cotton<br style=\"box-sizing: inherit;\">Machine Wash</p></div><div class=\"index-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"index-sizeFitDescTitle index-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; padding-bottom: 12px; border: none; text-transform: capitalize;\">Specifications</h4><div class=\"index-tableContainer\" style=\"box-sizing: inherit; display: flex; -webkit-box-pack: start; justify-content: flex-start; flex-flow: wrap; -webkit-box-orient: horizontal; -webkit-box-direction: normal;\"><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Bed Size</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">King</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Quality</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Thread Count</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">145</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Type</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Flat</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Number of Pillow Covers</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">2</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Number of Bedsheets</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">1</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.5125px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Net Quantity</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">50</div></div></div></div>', 0.00, 0.00, 0.00, 0.00, 0.00, 38000.00, 36600.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765465426519.mdf box plang.jpg', NULL, NULL, 100.00, 100.00, 100.00, 'mdf box plang', 'Cotton King Size Bedsheet with 2 Pillows cover', 'Cotton King Size Bedsheet with 2 Pillows cover', 1, 1, 0, 0, 1, 1, NULL, '2025-09-13 03:02:28', '2025-12-11 15:03:46'),
(61, 2, 18, 2, '22', 'Kg', 'Lg Washing Machine', 'lg-washing-machine', 'Lg Washing Machine', '<p><b>Lg Washing Machine</b></p><p><b><span style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">एलजी वॉशिंग मशीन का क्या काम है? एलजी वॉशिंग मशीन&nbsp;</span><span style=\"border-radius: 4px; padding: 0px 2px; background: linear-gradient(90deg, rgb(52, 69, 127) 50%, rgba(0, 0, 0, 0) 50%) 0% 0px / 200% 100% no-repeat rgb(31, 31, 31); color: rgb(255, 255, 255); animation: 0.75s cubic-bezier(0.05, 0.7, 0.1, 1) 0.25s 1 normal forwards running highlight; font-family: Arial, sans-serif; font-size: 16px;\">कपड़ों को डिटर्जेंट मिले पानी में हिलाकर साफ़ करने</span><span style=\"color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(31, 31, 31);\">&nbsp;के लिए डिज़ाइन की गई है। यह अलग-अलग तरह के कपड़ों और गंदगी के स्तर के हिसाब से अलग-अलग वॉश साइकल उपलब्ध कराती है, जिससे कुशल सफ़ाई मिलती है।</span></b></p>', 0.00, 0.00, 0.00, 0.00, 0.00, 28000.00, 22900.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1765465700342.LG WASIN.jpg', NULL, NULL, NULL, NULL, NULL, 'Lg Washing Machine', 'Lg Washing Machine', 'Lg Washing Machine', 1, 1, 0, 0, 1, 1, NULL, '2025-12-10 13:40:13', '2025-12-11 15:08:20'),
(63, 2, 20, 7, '70', 'pcs', 'STEEL NON BOX PLANG', 'lg-139-cm-55-inches-ua82-series-4k-ultra-hd-3840-x-2160-smart-webos-led-tv-55ua82006la', 'Resolution: 4K Ultra HD (3840x2160) | Refresh Rate: 60 Hz Native| 178-degree wide viewing angle', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: Arial, sans-serif;\"><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\">&nbsp;&nbsp;STEEL NON BOX PLANG</li></ul>', 8500.00, 12325.00, 12750.00, 13770.00, 15300.00, NULL, 12325.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1771864695778.images.jpg', NULL, NULL, NULL, NULL, NULL, 'LG 139 cm (55 inches) UA82 Series 4K Ultra HD (3840 x 2160) Smart webOS LED TV 55UA82006LA', 'LG 139 cm (55 inches) UA82 Series 4K Ultra HD (3840 x 2160) Smart webOS LED TV 55UA82006LA', 'LG 139 cm (55 inches) UA82 Series 4K Ultra HD (3840 x 2160) Smart webOS LED TV 55UA82006LA', 1, 1, 0, 0, 1, 1, NULL, '2025-12-23 11:15:52', '2026-02-23 16:38:15'),
(64, 2, 20, 8, '100', 'pcs', '3 DOOR ALMIRHA PRINTED', 'rana-sharma-electronics', 'Resoluti2160) | viewing angle', '<p>3 DOOR ALMIRHA PRINTED</p>', 21800.00, 31610.00, 32700.00, 35316.00, 39240.00, NULL, 31610.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1771864525174.GGK.jpg', NULL, NULL, NULL, NULL, NULL, 'Resolution: 4K Ultra HD (3840x2160) | Refresh Rate: 60 Hz Native| 178-degree wide viewing angle', 'Resolution: 4K Ultra HD (3840x2160) | Refresh Rate: 60 Hz Native| 178-degree wide viewing angle', 'Resolution: 4K Ultra HD (3840x2160) | Refresh Rate: 60 Hz Native| 178-degree wide viewing angle', 1, 1, 0, 0, 1, 1, NULL, '2026-02-21 18:21:55', '2026-02-23 16:35:25'),
(65, 2, 20, 7, '65', 'pcs', 'SHOWCASE TV MODEL', 'battey', 'Yes', '<p>SHOWCASE TV MODEL</p>', 8100.00, 11745.00, 12150.00, 13122.00, 14580.00, NULL, 11745.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1771864200370.D.jpg', NULL, NULL, NULL, NULL, NULL, 'Hello', 'G', 'Hgggg', 1, 1, 0, 1, 1, 1, NULL, '2026-02-21 18:31:19', '2026-05-25 16:31:36'),
(66, 2, 20, 7, '6787', 'Kg', 'SHADI KA PACKAGE', 'shadi-ka-package', 'SHADI KA PACKAGE', '<p>SHADI KA PACKAGE</p>', 35200.00, 51040.00, 52800.00, 57024.00, 63360.00, 35200.00, 51040.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/1772963009806.WhatsApp Image 2026-01-02 at 10.11.38 AM (2).jpeg', NULL, NULL, NULL, NULL, NULL, 'SHADI KA PACKAGE', 'SHADI KA PACKAGE', 'SHADI KA PACKAGE', 1, 1, 0, 0, 1, 1, NULL, '2026-03-08 09:43:29', '2026-05-25 16:17:04'),
(67, 1, 19, 2, '100', 'Kg', 'Samsung 189 L, 5 Star, Digital Inverter, Direct-Cool Single Door Refrigerator (RR21H2H25CU/HL, Camellia Blue, Base Stand Drawer, Single Touch Defrost, 2026 Model)', 'samsung-189-l-5-star-digital-inverter-direct-cool-single-door-refrigerator-rr21h2h25cuhl-camellia-blue-base-stand-drawer-single-touch-defrost-2026-model', 'Direct Cool Refrigerator: Stylish Single Door Refrigerator with Modern Camellia pattern. Enjoy powerful cooling that can last longer', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Direct Cool Refrigerator: Stylish Single Door Refrigerator with Modern Camellia pattern. Enjoy powerful cooling that can last longer</span></li><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity 189 liters: Suitable for families with 2 to 3 members</span></li><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Energy Rating : 5 Star Energy Efficiency | Annual Energy Consumption : 115 Kilowatt Hours Per Year</span></li><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Manufacturer Warranty: 1 Year comprehensive warranty and a 10 years warranty on the digital inverter compressor (Note: Brand Warranty can be availed using seller invoice, 20 Year Digital Inverter Compressor Warranty applicable for purchases done only from 1st Dec 2022 till 31st March\'26)</span></li><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Digital Inverter Compressor provides higher energy efficiency, less noise and long-lasting performance while consuming 50% less power, backed up by 10 year warranty [20 Year Digital Inverter Compressor Warranty applicable for purchases done only from 1st Dec 2022 till 31st March\'26]</span></li><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Interior Description : Fresh Food Capacity : 171 ltr | Freezer Capacity : 18 ltr | Total no. of Compartments : 1 | Shelves : 2 | Vegetable Drawers : 1 | Shelf Type : Toughened Glass Shelves | Anti Bacterial Gasket | Base stand with drawer for additional space for non-refrigerated food items</span></li><li class=\"a-spacing-mini\" style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Samsung Exclusive Features : Fresh Room | Horizontal Curve Door Design | Stabilizer Free Operation (100v - 300v) | Smart Connect Inverter (Automatic) | Up to 15 days of fresh food | Lock &amp; Key</span></li></ul>', 15000.00, 21750.00, 22500.00, 24300.00, 27000.00, NULL, 21750.00, 0.00, NULL, 'in_stock', NULL, 'uploads/products/177911790640.614KHnFjbzL._SL1500_.jpg', NULL, NULL, NULL, NULL, NULL, 'Samsung 189 L, 5 Star, Digital Inverter, Direct-Cool Single Door Refrigerator (RR21H2H25CU/HL, Camellia Blue, Base Stand Drawer, Single Touch Defrost, 2026 Model)', 'Samsung 189 L, 5 Star, Digital Inverter, Direct-Cool Single Door Refrigerator (RR21H2H25CU/HL, Camellia Blue, Base Stand Drawer, Single Touch Defrost, 2026 Model)', 'Samsung 189 L, 5 Star, Digital Inverter, Direct-Cool Single Door Refrigerator (RR21H2H25CU/HL, Camellia Blue, Base Stand Drawer, Single Touch Defrost, 2026 Model)', 1, 1, 0, 0, 1, 1, NULL, '2026-05-18 15:25:06', '2026-05-18 15:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `parent_id`, `name`, `slug`, `description`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(18, NULL, 'Home Appliances', 'Home Appliances', 'Home Appliances', 'uploads/category/1765464277793.YYYY.jpg', 1, NULL, '2025-08-14 03:40:17', '2025-12-11 14:44:37'),
(19, NULL, 'ELECTRONICS', 'ELECTRONICS', 'ELECTRONICS', 'uploads/category/1765464366262.Q121212.avif', 1, NULL, '2025-12-10 12:38:40', '2025-12-11 14:46:06'),
(20, NULL, 'Furniture', 'Furniture', 'Furniture', 'uploads/category/1765464018934.Wooden-Furniture-Manufacturer.jpg', 1, NULL, '2025-12-10 12:41:01', '2025-12-11 14:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`, `updated_at`) VALUES
(65, 55, 'uploads/products/1756113099556.cur4.jpg', '2025-08-25 09:11:39', NULL),
(66, 56, 'uploads/products/1756142132762.cur4.jpg', '2025-08-25 17:15:32', NULL),
(67, 57, 'uploads/products/175614231788.cur4.jpg', '2025-08-25 17:18:37', NULL),
(68, 57, 'uploads/products/1756142317359.cur3.jpg', '2025-08-25 17:18:37', NULL),
(69, 57, 'uploads/products/1756142317883.cur2.jpg', '2025-08-25 17:18:37', NULL),
(70, 58, 'uploads/products/175614541928.cur4.jpg', '2025-08-25 18:10:19', NULL),
(71, 60, 'uploads/products/1757752348960.1.jpg', '2025-09-13 08:32:28', NULL),
(72, 60, 'uploads/products/175775234860.2.jpg', '2025-09-13 08:32:28', NULL),
(73, 60, 'uploads/products/1757752348798.3.jpg', '2025-09-13 08:32:28', NULL),
(74, 60, 'uploads/products/1757752348942.05e069ad-3b42-4ad4-bbbe-c7fffe3e12661699475025440DDecorBlueWhiteEthnicMotifs144TCKingBedsheetwith2PillowCover4.jpg', '2025-09-13 08:32:28', NULL),
(75, 61, 'uploads/products/1765393813233.shopping.jpg', '2025-12-10 19:10:13', NULL),
(76, 63, 'uploads/products/1766508352916.81d2WyGlYUL._SL1500.jpg', '2025-12-23 16:45:52', NULL),
(80, 64, 'uploads/products/177169811540.man-user-circle-icon.png', '2026-02-21 18:21:55', NULL),
(81, 64, 'uploads/products/1771698115995.ssl issue 2.png', '2026-02-21 18:21:55', NULL),
(82, 64, 'uploads/products/1771698115482.WhatsApp Image 2026-02-04 at 10.28.06 AM.jpeg', '2026-02-21 18:21:55', NULL),
(83, 65, 'uploads/products/1771698679141.file_00000000d880720994f1110850b66868.png', '2026-02-21 18:31:19', NULL),
(84, 66, 'uploads/products/1772963009921.WhatsApp Image 2026-01-02 at 10.11.39 AM (1).jpeg', '2026-03-08 09:43:29', NULL),
(85, 67, 'uploads/products/1779117906567.71pUtQXFWNL._SL1500_.jpg', '2026-05-18 15:25:06', NULL),
(86, 67, 'uploads/products/1779117906812.71r3mXVH82L._SL1500_.jpg', '2026-05-18 15:25:06', NULL),
(87, 67, 'uploads/products/1779117906320.614KHnFjbzL._SL1500_.jpg', '2026-05-18 15:25:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sections`
--

CREATE TABLE `product_sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_section_datas`
--

CREATE TABLE `product_section_datas` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1,
  `other` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `property_type_id` bigint(20) DEFAULT NULL,
  `property_title` text DEFAULT NULL,
  `property_slug` varchar(255) DEFAULT NULL,
  `property_area` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `block_id` bigint(20) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `property_details` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-Pending,1-Approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `user_type`, `purpose`, `property_type_id`, `property_title`, `property_slug`, `property_area`, `state_id`, `city_id`, `block_id`, `locality`, `pincode`, `price`, `property_details`, `status`, `created_at`, `updated_at`) VALUES
(1, 124, '5', 'Sale', 3, 'Beautiful Flats  near Purnia Airports', 'beautiful-flats-near-purnia-airports', '5600 Sq.ft.', 5, 96, 10, 'htrthrth', '400080', '5', 'Beautiful Flats  near Purnia Airport\r\nBeautiful Flats  near Purnia Airport\r\nBeautiful Flats  near Purnia Airport\r\nBeautiful Flats  near Purnia Airport\r\nBeautiful Flats  near Purnia Airport', 1, '2026-06-15 08:41:29', '2026-07-01 06:53:47'),
(2, 124, '5', 'PG', 3, NULL, NULL, NULL, 5, 96, 2, 'Srinagar', '854301', '4', NULL, 1, '2026-06-15 08:56:36', '2026-06-16 07:48:46'),
(5, 127, '5', 'Sale', 3, '2 BHK Ready to Occupy Flat for sale in Divyasree Republic', '2-bhk-ready-to-occupy-flat-for-sale-in-divyasree-republic', '721 Sq. Ft.', 5, 96, 6, 'Rkk College', '854304', '7', 'Premium 2BHK Lux furnished apartment with customised interior of best quality ample ventilation and natural sunlight.', 1, '2026-06-18 06:48:57', '2026-06-18 07:18:57'),
(6, 128, '6', 'Rent', 3, 'Awesome Falts New Patna High Court', 'awesome-falts-new-patna-high-court', '5000 Sq. Ft.', 5, 96, 14, 'Near Block Campus', '854327', '7', 'Awesome Falts New Patna High Court', 0, '2026-07-06 06:02:30', '2026-07-06 06:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `property_enquiries`
--

CREATE TABLE `property_enquiries` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_enquiries`
--

INSERT INTO `property_enquiries` (`id`, `property_id`, `name`, `mobile`, `email`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Rana Sharma', '8825171386', 'ranasharma880@gmail.com', 'Message', 1, '2026-06-19 06:44:56', '2026-06-19 06:44:56'),
(2, 5, 'Aman Sharma', '9199758612', 'iaman@gmail.com', 'Message', 1, '2026-06-19 06:47:19', '2026-06-19 06:47:19'),
(3, 5, 'Rana Sharma', '8825171386', 'iamranasharma@gmail.com', 'sdfsdfsdfsdfsdfsdf', 1, '2026-06-19 06:52:45', '2026-06-19 06:52:45'),
(4, 5, 'Sharma', '8825171386', 'ranasharma880@gmail.com', 'fffffffffffffffffffffffffffffffffffffff', 1, '2026-06-19 06:56:31', '2026-06-19 06:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `property_features`
--

CREATE TABLE `property_features` (
  `id` bigint(20) NOT NULL,
  `property_type` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_type` varchar(50) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_features`
--

INSERT INTO `property_features` (`id`, `property_type`, `label`, `field_name`, `field_type`, `placeholder`, `options`, `is_required`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Bedroom', 'bedroom', 'select', 'Select Option', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\"]', 1, 1, '2026-06-12 11:13:29', '2026-06-13 07:31:09'),
(2, 3, 'Bathroom', 'bathroom', 'select', 'Select Option', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, 1, '2026-06-12 11:13:29', '2026-06-13 07:31:09'),
(3, 3, 'Balconies', 'balconies', 'select', 'Select Option', '[\"1\",\"2\",\"3\"]', 1, 1, '2026-06-12 11:13:29', '2026-06-13 07:31:09'),
(4, 3, 'Total Floors', 'floors', 'select', 'Select Option', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"]', 1, 1, '2026-06-12 11:13:29', '2026-06-13 07:31:09'),
(5, 3, 'Furnished Status', 'furnished_status', 'select', 'Select Option', '[\"furnished\",\"semi-furnished\",\"un-furnished\"]', 1, 1, '2026-06-12 11:13:29', '2026-06-13 07:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `property_feature_values`
--

CREATE TABLE `property_feature_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `feature_key` varchar(100) NOT NULL,
  `feature_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_feature_values`
--

INSERT INTO `property_feature_values` (`id`, `property_id`, `feature_key`, `feature_value`, `created_at`, `updated_at`) VALUES
(6, 2, 'bedroom', '15', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(7, 2, 'bathroom', '3', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(8, 2, 'balconies', '1', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(9, 2, 'floors', '5', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(10, 2, 'furnished_status', 'furnished', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(21, 5, 'bedroom', '13', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(22, 5, 'bathroom', '2', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(23, 5, 'balconies', '1', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(24, 5, 'floors', '2', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(25, 5, 'furnished_status', 'furnished', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(31, 1, 'bedroom', '12', '2026-07-01 06:52:57', '2026-07-01 06:52:57'),
(32, 1, 'bathroom', '3', '2026-07-01 06:52:57', '2026-07-01 06:52:57'),
(33, 1, 'balconies', '2', '2026-07-01 06:52:57', '2026-07-01 06:52:57'),
(34, 1, 'floors', '3', '2026-07-01 06:52:57', '2026-07-01 06:52:57'),
(35, 1, 'furnished_status', 'furnished', '2026-07-01 06:52:57', '2026-07-01 06:52:57'),
(36, 6, 'bedroom', '5', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(37, 6, 'bathroom', '2', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(38, 6, 'balconies', '2', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(39, 6, 'floors', '2', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(40, 6, 'furnished_status', 'semi-furnished', '2026-07-06 06:02:30', '2026-07-06 06:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image`, `created_at`, `updated_at`) VALUES
(6, 2, '1781513796_6a2fbe4473ff4.jpg', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(7, 2, '1781513796_6a2fbe44752a6.jpg', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(8, 2, '1781513796_6a2fbe4475fee.jpg', '2026-06-15 08:56:36', '2026-06-15 08:56:36'),
(15, 5, '1781765337_6a3394d9ecf52.jpg', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(16, 5, '1781765337_6a3394d9ee819.jpg', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(17, 5, '1781765337_6a3394d9ef781.jpg', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(18, 5, '1781765337_6a3394d9f03ec.jpg', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(19, 5, '1781765337_6a3394d9f1780.jpg', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(20, 5, '1781765337_6a3394d9f2602.jpg', '2026-06-18 06:48:57', '2026-06-18 06:48:57'),
(21, 1, '20260701121537_plndCGegdj7S.png', '2026-07-01 06:45:37', '2026-07-01 06:45:37'),
(22, 1, '20260701121537_CFm7S9rKwcKd.png', '2026-07-01 06:45:37', '2026-07-01 06:45:37'),
(23, 1, '20260701121537_UhortCTFHVF0.png', '2026-07-01 06:45:37', '2026-07-01 06:45:37'),
(24, 1, '20260701121537_ZCsb8azZIWGb.png', '2026-07-01 06:45:37', '2026-07-01 06:45:37'),
(25, 1, '20260701121537_6WZTXFxC5tLo.png', '2026-07-01 06:45:37', '2026-07-01 06:45:37'),
(26, 6, '1783317750_6a4b44f6cb3f2.png', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(27, 6, '1783317750_6a4b44f6cd276.png', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(28, 6, '1783317750_6a4b44f6ce3ac.png', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(29, 6, '1783317750_6a4b44f6cef8e.png', '2026-07-06 06:02:30', '2026-07-06 06:02:30'),
(30, 6, '1783317750_6a4b44f6cfc01.png', '2026-07-06 06:02:30', '2026-07-06 06:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `property_tours`
--

CREATE TABLE `property_tours` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `enq_date` date DEFAULT NULL,
  `enq_time` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_tours`
--

INSERT INTO `property_tours` (`id`, `property_id`, `enq_date`, `enq_time`, `name`, `mobile`, `email`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(2, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(3, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(4, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(5, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(6, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(7, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25'),
(8, 5, '2000-01-12', '21:15', 'Sumit Test', '8825171386', 'ranasharma880@gmail.com', NULL, 1, '2026-06-19 07:45:25', '2026-06-19 07:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `property_videos`
--

CREATE TABLE `property_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `video` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_videos`
--

INSERT INTO `property_videos` (`id`, `property_id`, `video`, `created_at`, `updated_at`) VALUES
(1, 6, '1783317750_6a4b44f6db8a7.mp4', '2026-07-06 06:02:30', '2026-07-06 06:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `skype` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `name`, `phone`, `email`, `skype`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vikash Kumar', '8825171386', 'sd@gmail.com', 'ssdvsdv@gmail.com', 'asc', 1, '2023-08-04 23:03:00', '2023-08-04 23:03:00'),
(2, 'Rana Sharma', '8825171386', 'iamranasharma@gmail.com', 'iamranasharma@gmail.com', 'Testing', 1, '2023-08-09 03:12:12', '2023-08-09 03:12:12'),
(3, 'shakti', '9874563210', 'avinash@gmail.com', 'dfdfdf@fgfd', 'fsfsd', 1, '2023-08-15 23:47:01', '2023-08-15 23:47:01'),
(4, 'Deep Bhatt', '4345423452', 'engineersmine.mktg@gmail.com', 'engineersmine.mktg@gmail.com', 'test', 1, '2023-08-24 11:59:30', '2023-08-24 11:59:30'),
(5, 'ZEBION', '9199758612', 'iamranasharma@gmail.com', 'JVJSD@GMAIL.COM', 'G', 1, '2024-02-17 00:23:55', '2024-02-17 00:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `recruited_students`
--

CREATE TABLE `recruited_students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `course` varchar(255) DEFAULT NULL,
  `franchise_code` varchar(100) DEFAULT NULL,
  `job_sector` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session` varchar(100) DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `franchise_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `subcourse_id` bigint(20) UNSIGNED NOT NULL,
  `result` varchar(255) NOT NULL,
  `examination` varchar(255) DEFAULT NULL,
  `passing_year` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `total_marks_obtained` varchar(100) DEFAULT NULL,
  `total_percentage` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_subjects`
--

CREATE TABLE `result_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_id` bigint(20) NOT NULL,
  `subject_code` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `full_marks` varchar(255) DEFAULT NULL,
  `pass_marks` varchar(255) DEFAULT NULL,
  `theory` varchar(255) DEFAULT NULL,
  `internal` varchar(255) DEFAULT NULL,
  `marks_obtained` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_type` enum('cash_sale','incentive_sale') NOT NULL,
  `branch` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `vivah_mitra_id` bigint(20) UNSIGNED NOT NULL,
  `panchayat_vivah_mitra` int(11) DEFAULT NULL,
  `prakhand_vivah_mitra` int(11) DEFAULT NULL,
  `district_vivah_mitra` int(11) DEFAULT NULL,
  `sales_manager` int(11) DEFAULT NULL,
  `assistant_sales_manager` int(11) DEFAULT NULL,
  `field_officer` int(11) DEFAULT NULL,
  `zonal_manager` int(11) DEFAULT NULL,
  `peon` int(11) DEFAULT NULL,
  `member_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sale_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `incentive_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_type`, `branch`, `employee_id`, `vivah_mitra_id`, `panchayat_vivah_mitra`, `prakhand_vivah_mitra`, `district_vivah_mitra`, `sales_manager`, `assistant_sales_manager`, `field_officer`, `zonal_manager`, `peon`, `member_id`, `sale_date`, `total_amount`, `incentive_amount`, `created_at`, `updated_at`) VALUES
(1, 'incentive_sale', 1, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-12-23', 3500.00, 35.00, '2025-12-23 14:58:32', '2025-12-23 14:58:32'),
(2, 'incentive_sale', 1, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-12-23', 860.00, 8.60, '2025-12-23 15:03:30', '2025-12-23 15:03:30'),
(3, 'incentive_sale', 1, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-12-25', 3500.00, 35.00, '2025-12-25 11:05:50', '2025-12-25 11:05:50'),
(4, 'incentive_sale', 1, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-12-25', 43990.00, 439.90, '2025-12-25 11:14:50', '2025-12-25 11:14:50'),
(7, 'incentive_sale', 1, 48, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, '2025-12-30', 3500.00, 35.00, '2025-12-30 12:42:44', '2025-12-30 12:42:44'),
(8, 'incentive_sale', 1, 48, 49, 74, 73, 72, 85, 84, 86, 88, 87, 9, '2026-02-01', 5000.00, 662.50, '2026-01-31 19:36:19', '2026-01-31 19:36:19'),
(9, 'incentive_sale', 1, 48, 102, 90, 89, 72, 85, 84, 86, 88, 87, 13, '2026-02-02', 5000.00, 662.50, '2026-02-02 17:53:03', '2026-02-02 17:53:03'),
(12, 'incentive_sale', 1, 115, 110, 107, 91, 90, 119, 117, 116, 118, 120, 11, '2026-05-21', 0.00, 0.00, '2026-05-21 17:36:23', '2026-05-21 17:36:23'),
(13, 'incentive_sale', 1, 115, 110, 107, 91, 90, 119, 117, 116, 118, 120, 11, '2026-05-25', 125570.00, 5022.80, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(14, 'incentive_sale', 1, 115, 110, 107, 91, 90, 119, 117, 116, 118, 120, 11, '2026-05-25', 11745.00, 469.82, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(15, 'incentive_sale', 1, 115, 110, 107, 91, 90, 119, 117, 116, 118, 120, 11, '2026-05-25', 11745.00, 469.82, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(16, 'incentive_sale', 1, 115, 110, 107, 91, 90, 119, 117, 116, 118, 120, 11, '2026-05-25', 11745.00, 469.82, '2026-05-25 16:31:36', '2026-05-25 16:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `offer_price` decimal(12,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `price`, `offer_price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 57, 4100.00, 3500.00, 1, 3500.00, '2025-12-23 14:58:32', '2025-12-23 14:58:32'),
(2, 2, 55, 1100.00, 860.00, 1, 860.00, '2025-12-23 15:03:30', '2025-12-23 15:03:30'),
(3, 3, 57, 4100.00, 3500.00, 1, 3500.00, '2025-12-25 11:05:50', '2025-12-25 11:05:50'),
(4, 4, 56, 5500.00, 43990.00, 1, 43990.00, '2025-12-25 11:14:50', '2025-12-25 11:14:50'),
(5, 7, 57, 4100.00, 3500.00, 1, 3500.00, '2025-12-30 12:42:44', '2025-12-30 12:42:44'),
(6, 10, 57, 4100.00, 3500.00, 1, 3500.00, '2026-01-15 20:53:33', '2026-01-15 20:53:33'),
(7, 11, 63, 22500.00, 21000.00, 1, 21000.00, '2026-01-15 20:56:26', '2026-01-15 20:56:26'),
(8, 12, 55, 1100.00, 860.00, 2, 1720.00, '2026-01-15 21:00:43', '2026-01-15 21:00:43'),
(9, 13, 56, 5500.00, 43990.00, 4, 175960.00, '2026-01-15 21:05:32', '2026-01-15 21:05:32'),
(10, 12, 66, 51040.00, 51040.00, 1, 0.00, '2026-05-21 17:36:23', '2026-05-21 17:36:23'),
(11, 13, 65, 11745.00, 11745.00, 2, 23490.00, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(12, 13, 66, 51040.00, 51040.00, 2, 102080.00, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(13, 14, 65, 11745.00, 11745.00, 1, 11745.00, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(14, 15, 65, 11745.00, 11745.00, 1, 11745.00, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(15, 16, 65, 11745.00, 11745.00, 1, 11745.00, '2026-05-25 16:31:36', '2026-05-25 16:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_meetings`
--

CREATE TABLE `schedule_meetings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `skype` varchar(100) NOT NULL,
  `schedule_date` varchar(100) NOT NULL,
  `schedule_time` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule_meetings`
--

INSERT INTO `schedule_meetings` (`id`, `name`, `phone`, `email`, `skype`, `schedule_date`, `schedule_time`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vikash Kumar', '8825171386', 'vikash@orrish.com', 'vikash@orrish.com', '2023-08-05', '10:34', 'Testing schedule meetings', 1, '2023-08-04 23:29:10', '2023-08-04 23:29:10'),
(2, 'test', '987456320', 'avinash@gmail.com', 'test@skype', '2023-08-16', '01:46', 'testing', 1, '2023-08-15 23:43:22', '2023-08-15 23:43:22'),
(3, 'Rwar', '3435445645', 'engineersmine.mktg@gmail.com', 'engineersmine.mktg@gmail.com', '2023-02-21', '11:11', 'tet', 1, '2023-08-24 11:57:06', '2023-08-24 11:57:06'),
(4, 'Naveen Kumar', '09821698168', 'naveen.kumar@biocube.ai', 'naveen@skype.com', '2023-11-24', '16:00', 'Hi,\r\n\r\nGreetings for the Day!\r\n\r\nWhat would you say if I told you that a single solution could streamline employee attendance and visitor access management for your organization? Amazing Right? TruNTrance can do that and much more. Let me know the most suitable time to schedule a demo.\r\n\r\nI am hoping to hear from you soon :)\r\n\r\nRegards\r\nNaveen Kumar\r\n09821698168\r\nhttps://biocube.ai/', 1, '2023-11-24 04:26:24', '2023-11-24 04:26:24'),
(5, 'Mudassir', '9396236546', 'mudassir040@gmail.com', 'drmudassir040@outlook.com', '2024-02-06', '14:00', 'Looking for a cloud server', 1, '2024-02-06 01:17:43', '2024-02-06 01:17:43'),
(6, 'ZEBION', '9199758612', 'iamranasharma@gmail.com', 'SKDBC@GMAIL.COM', '2024-01-01', '01:00', 'tEST', 1, '2024-02-17 00:24:58', '2024-02-17 00:24:58');

-- --------------------------------------------------------

--
-- Table structure for table `section_datas`
--

CREATE TABLE `section_datas` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_green` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1,
  `other` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_datas`
--

INSERT INTO `section_datas` (`id`, `page_id`, `section_id`, `title`, `title_green`, `description`, `img`, `order_number`, `other`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Renting a Home', NULL, NULL, 'uploads/cms/cms-20260706120438-9535.webp', 1, NULL, 1, 1, NULL, '2026-07-06 06:34:38', '2026-07-06 06:34:38', NULL),
(2, 1, 1, 'Invest in Real Estate', NULL, NULL, 'uploads/cms/cms-20260706121730-2589.webp', 2, NULL, 1, 1, NULL, '2026-07-06 06:47:30', '2026-07-06 07:01:11', NULL),
(3, 1, 1, 'Sell/Rent Your Property', NULL, NULL, 'uploads/cms/cms-20260706122030-834.webp', 3, NULL, 1, 1, NULL, '2026-07-06 06:50:30', '2026-07-06 07:01:14', NULL),
(4, 1, 1, 'Plots/Land', NULL, NULL, 'uploads/cms/cms-20260706122116-9881.webp', 4, NULL, 1, 1, NULL, '2026-07-06 06:51:17', '2026-07-06 07:01:17', NULL),
(5, 1, 1, 'Explore Insights', NULL, NULL, 'uploads/cms/cms-20260706122150-4897.webp', 5, NULL, 1, 1, NULL, '2026-07-06 06:51:50', '2026-07-06 07:01:22', NULL),
(6, 1, 1, 'PG and co-living', NULL, NULL, 'uploads/cms/cms-20260706122308-4944.webp', 6, NULL, 1, 1, NULL, '2026-07-06 06:53:08', '2026-07-06 07:01:25', NULL),
(7, 1, 1, 'Buy', NULL, NULL, 'uploads/cms/cms-20260706122655-7392.webp', 7, NULL, 1, 1, NULL, '2026-07-06 06:56:55', '2026-07-06 07:01:29', NULL),
(8, 1, 1, 'Commercial', NULL, NULL, 'uploads/cms/cms-20260706122847-7727.webp', 8, NULL, 1, 1, NULL, '2026-07-06 06:58:47', '2026-07-06 07:01:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_guest_meeting_details`
--

CREATE TABLE `seminar_guest_meeting_details` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `photo1` varchar(255) NOT NULL,
  `photo2` varchar(255) NOT NULL,
  `training_place` varchar(255) DEFAULT NULL,
  `training_address` text DEFAULT NULL,
  `district_name` varchar(150) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `supported_by` varchar(255) DEFAULT NULL,
  `total_vivah_mitra` int(11) DEFAULT 0,
  `total_panchayat_mitra` int(11) DEFAULT 0,
  `total_block_vivah_mitra` int(11) DEFAULT 0,
  `total_district_vivah_mitra` int(11) DEFAULT 0,
  `amount` float DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seminar_guest_meeting_details`
--

INSERT INTO `seminar_guest_meeting_details` (`id`, `user_id`, `photo1`, `photo2`, `training_place`, `training_address`, `district_name`, `training_date`, `start_time`, `end_time`, `supported_by`, `total_vivah_mitra`, `total_panchayat_mitra`, `total_block_vivah_mitra`, `total_district_vivah_mitra`, `amount`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 90, 'uploads/members/photo11775090262.jpg', 'uploads/members/photo21775090262.jpg', 'Kumarkhand', 'Araria', 'v2fbaazar v2fbaazar', '2026-04-02', '06:07:00', '06:07:00', 'Giru ji', 30, 80, 180, 3, 0, 2, 'Testing', '2026-04-02 06:07:42', '2026-04-03 00:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `service_pages`
--

CREATE TABLE `service_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `banner_img1` varchar(255) DEFAULT NULL,
  `banner_img2` varchar(255) DEFAULT NULL,
  `banner_heading` varchar(255) DEFAULT NULL,
  `banner_description` text DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `advantage` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_sections`
--

CREATE TABLE `service_sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_section_datas`
--

CREATE TABLE `service_section_datas` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1,
  `other` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, '2024-2025', 1, '2025-11-29 14:48:20', '2025-11-29 14:48:20'),
(2, '2025-2026', 1, '2025-11-29 14:48:33', '2025-11-29 14:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `solution_sections`
--

CREATE TABLE `solution_sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `section_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solution_section_datas`
--

CREATE TABLE `solution_section_datas` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 1,
  `other` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(100) DEFAULT NULL,
  `twitter_id` varchar(100) DEFAULT NULL,
  `linkedin_id` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `header_image` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `user_id`, `type`, `name`, `designation`, `profile_pic`, `facebook_id`, `twitter_id`, `linkedin_id`, `status`, `header_image`, `details`, `expertise`, `company`, `experience`, `address`, `created_by`, `created_at`, `updated_at`) VALUES
(10, NULL, 'Team', 'Dr. Sarvesh Tiwari', 'Founder & MD', 'uploads/staff/staff-20240618060737-3337.webp', 'https://www.facebook.com/SarveshTiwariBihar', 'https://x.com/SarveshSays', 'https://www.linkedin.com/in/dr-sarvesh-tiwari-0a532522', 1, 'uploads/staff/staff-20240618060738-1891.webp', '<p>Seasoned Communication professional adept at handling media, government, corporates. Identified as the best PR professional by Japanese Bank of International Corporation. Chairman Public Relations Society of Delhi.</p>', 'Entrepreneurship', 'Confianza Consulting', '20+ Years', NULL, 1, '2024-06-18 00:37:38', '2024-06-18 00:37:38'),
(11, NULL, 'Team', 'Rana', 'Sr Executive', 'uploads/staff/staff-20241202052532-6981.webp', NULL, NULL, NULL, 1, NULL, '<p>All Okay</p>', 'Sales', 'Orrish', '5 Years', 'Srinagar Road Purnia', 1, '2024-12-01 23:55:33', '2024-12-01 23:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `status`) VALUES
(1, 'Andaman and Nicobar (AN)', 1),
(2, 'Andhra Pradesh (AP)', 1),
(3, 'Arunachal Pradesh (AR)', 1),
(4, 'Assam (AS)', 1),
(5, 'Bihar (BR)', 1),
(6, 'Chandigarh (CH)', 1),
(7, 'Chhattisgarh (CG)', 1),
(8, 'Dadra and Nagar Haveli (DN)', 1),
(9, 'Daman and Diu (DD)', 1),
(10, 'Delhi (DL)', 1),
(11, 'Goa (GA)', 1),
(12, 'Gujarat (GJ)', 1),
(13, 'Haryana (HR)', 1),
(14, 'Himachal Pradesh (HP)', 1),
(15, 'Jammu and Kashmir (JK)', 1),
(16, 'Jharkhand (JH)', 1),
(17, 'Karnataka (KA)', 1),
(18, 'Kerala (KL)', 1),
(19, 'Lakshdweep (LD)', 1),
(20, 'Madhya Pradesh (MP)', 1),
(21, 'Maharashtra (MH)', 1),
(22, 'Manipur (MN)', 1),
(23, 'Meghalaya (ML)', 1),
(24, 'Mizoram (MZ)', 1),
(25, 'Nagaland (NL)', 1),
(26, 'Odisha (OD)', 1),
(27, 'Puducherry (PY)', 1),
(28, 'Punjab (PB)', 1),
(29, 'Rajasthan (RJ)', 1),
(30, 'Sikkim (SK)', 1),
(31, 'Tamil Nadu (TN)', 1),
(32, 'Tripura (TR)', 1),
(33, 'Uttar Pradesh (UP)', 1),
(34, 'Uttarakhand (UK)', 1),
(35, 'West Bengal (WB)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) NOT NULL,
  `enrollment_number` varchar(255) NOT NULL,
  `roll_number` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `franchise_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subcourse_id` int(11) NOT NULL,
  `fee` float NOT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `hindi_name` varchar(255) DEFAULT NULL,
  `fathers_name` varchar(255) DEFAULT NULL,
  `mothers_name` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `whether_handicapped` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `matric_subject` varchar(255) DEFAULT NULL,
  `matric_year` varchar(255) DEFAULT NULL,
  `matric_org` varchar(255) DEFAULT NULL,
  `matric_board` varchar(255) DEFAULT NULL,
  `matric_score` varchar(255) DEFAULT NULL,
  `matric_percent` varchar(255) DEFAULT NULL,
  `inter_subject` varchar(255) DEFAULT NULL,
  `inter_passing_year` varchar(255) DEFAULT NULL,
  `inter_org` varchar(255) DEFAULT NULL,
  `inter_board` varchar(255) DEFAULT NULL,
  `inter_score` varchar(255) DEFAULT NULL,
  `inter_percent` varchar(255) DEFAULT NULL,
  `grad_subject` varchar(255) DEFAULT NULL,
  `grad_year` varchar(255) DEFAULT NULL,
  `grad_org` varchar(255) DEFAULT NULL,
  `grad_board` varchar(255) DEFAULT NULL,
  `grad_score` varchar(255) DEFAULT NULL,
  `grad_percent` varchar(255) DEFAULT NULL,
  `other_subject` varchar(255) DEFAULT NULL,
  `other_year` varchar(255) DEFAULT NULL,
  `other_org` varchar(255) DEFAULT NULL,
  `other_board` varchar(255) DEFAULT NULL,
  `other_score` varchar(255) DEFAULT NULL,
  `other_percent` varchar(255) DEFAULT NULL,
  `father_husband_occupation` varchar(255) DEFAULT NULL,
  `name_address_guardian` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-Pending,1-Approve',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `enrollment_number`, `roll_number`, `serial_number`, `franchise_id`, `course_id`, `subcourse_id`, `fee`, `english_name`, `hindi_name`, `fathers_name`, `mothers_name`, `dob`, `gender`, `marital_status`, `nationality`, `category`, `whether_handicapped`, `aadhar_no`, `pan_no`, `blood_group`, `email`, `mobile`, `matric_subject`, `matric_year`, `matric_org`, `matric_board`, `matric_score`, `matric_percent`, `inter_subject`, `inter_passing_year`, `inter_org`, `inter_board`, `inter_score`, `inter_percent`, `grad_subject`, `grad_year`, `grad_org`, `grad_board`, `grad_score`, `grad_percent`, `other_subject`, `other_year`, `other_org`, `other_board`, `other_score`, `other_percent`, `father_husband_occupation`, `name_address_guardian`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BSA241001001', 'R11155501', '1115551', 41, 1, 3, 0, 'Sumit Test', NULL, 'DIGVIJAY NATH SINGH', 'Anamika', '2025-10-11', 'Male', 'Single', 'Indian', 'OBC', 'No', '459568406613', 'fgcpp8209m', 'o', 'ranasharma880@gmail.com', '08825171386', 'All', '2015', 'All', 'All', '500', '95', 'All', '2015', 'All', 'All', '500', '95', 'All', '2015', 'All', 'All', '500', '95', 'All', '2015', 'All', 'All', '500', '95', 'Rana Sharma', 'Srinagar Road', '1758569987385.dbc.jpg', 1, '2025-09-22 14:09:47', '2025-10-07 04:02:16'),
(2, 'BSA241001002', 'R11155502', '1115552', 41, 1, 1, 0, 'Sumit Test', NULL, 'DIGVIJAY NATH SINGH', 'Anamika', '2025-10-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ranasharma880@gmail.com', '08825171386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Srinagar Road, Janta Chowk Purnia, Srinagar Road, Janta Chowk Purnia', '1760725663581.gardapatna.jpg', 0, '2025-10-17 12:57:43', '2025-10-17 12:57:43'),
(3, 'BSA241001002', 'R11155502', '1115552', 41, 1, 1, 0, 'Sumit Test', NULL, 'DIGVIJAY NATH SINGH', 'Anamika', '2025-10-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ranasharma880@gmail.com', '08825171386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Srinagar Road, Janta Chowk Purnia, Srinagar Road, Janta Chowk Purnia', '1760725663310.gardapatna.jpg', 0, '2025-10-17 12:57:43', '2025-10-17 12:57:43'),
(4, 'BSA241001004', 'R11155504', '1115554', 41, 2, 7, 0, 'Rana Sharma', NULL, 'DIGVIJAY NATH SINGH', 'Anamika', '2025-10-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ranasharma880@gmail.com', '8825171386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Srinagar Road, Janta Chowk Purnia, Srinagar Road, Janta Chowk Purnia', '1760725712694.tlwar.jpg', 0, '2025-10-17 12:58:32', '2025-10-17 12:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `sub_course_id` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `subject_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `full_marks` varchar(100) DEFAULT NULL,
  `pass_marks` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `course_id`, `sub_course_id`, `semester`, `subject_code`, `name`, `full_marks`, `pass_marks`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, NULL, 'VIVA', '100', '30', 1, '2025-10-07 04:05:15', '2025-10-07 04:05:15'),
(2, 1, 3, 1, NULL, 'ASSIGNMENTS/PROJECTS', '100', '30', 1, '2025-10-07 04:05:15', '2025-10-07 04:05:15'),
(3, 1, 3, 1, NULL, 'PRACTICAL', '100', '30', 1, '2025-10-07 04:05:15', '2025-10-07 04:05:15'),
(4, 1, 3, 1, NULL, 'WRITTEN', '100', '30', 1, '2025-10-07 04:05:15', '2025-10-07 04:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'avinash@gmail.com', '2023-05-30 03:58:23', '2023-05-30 03:58:23'),
(2, 'avinash.orrish@gmail.com', '2023-05-30 03:59:01', '2023-05-30 03:59:01'),
(3, 'hosting.octa@gmail.com', '2023-05-30 04:02:28', '2023-05-30 04:02:28'),
(4, 'rohan008smazzkart@gmail.com', '2023-07-15 06:10:23', '2023-07-15 06:10:23'),
(5, 'sdvsdv@gmail.com', '2023-07-24 07:30:42', '2023-07-24 07:30:42'),
(6, 'casc@gmail.com', '2023-08-01 06:39:13', '2023-08-01 06:39:13'),
(7, 'abhi@gmail.com', '2023-08-19 05:25:59', '2023-08-19 05:25:59'),
(8, 'abhi@gmail.com', '2023-08-19 05:26:10', '2023-08-19 05:26:10'),
(9, 'abhi@gmail.com', '2023-08-19 05:26:14', '2023-08-19 05:26:14'),
(10, 'engineersmine.mktg@gmail.com', '2023-08-23 09:56:27', '2023-08-23 09:56:27'),
(11, 'engineersmine.mktg@gmail.com', '2023-08-24 12:56:17', '2023-08-24 12:56:17'),
(12, 'dlawrejmadin@gmail.com', '2024-02-04 05:04:34', '2024-02-04 05:04:34'),
(13, 'dlawrejmadin@gmail.com', '2024-02-04 05:04:34', '2024-02-04 05:04:34'),
(14, 'iamranasharma@gmail.com', '2024-02-17 00:17:06', '2024-02-17 00:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `sub_courses`
--

CREATE TABLE `sub_courses` (
  `id` int(11) NOT NULL,
  `course_id` int(10) DEFAULT NULL,
  `fee` float DEFAULT NULL,
  `title` text DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_courses`
--

INSERT INTO `sub_courses` (`id`, `course_id`, `fee`, `title`, `details`, `image`, `slug`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 0, 'DCA (Diploma in Computer Applications)', '<h3><a href=\"http://localhost/biharskill-html/computer-courses.php#\">DCA (Diploma in Computer Applications)</a></h3>', 'course-1758568412.jpg', 'dca-diploma-in-computer-applications', '2025-09-22 13:43:32', '2025-09-22 13:43:32', 1),
(2, 1, 0, 'ADCA (Advanced Diploma in Computer Applications)', '<h3><a href=\"http://localhost/biharskill-html/computer-courses.php#\">ADCA (Advanced Diploma in Computer Applications)</a></h3>', 'course-1758568475.jpg', 'adca-advanced-diploma-in-computer-applications', '2025-09-22 13:44:35', '2025-09-22 13:44:35', 1),
(3, 1, 0, 'Diploma in MS Office & Data Entry', '<h3><a href=\"http://localhost/biharskill-html/computer-courses.php#\">Diploma in MS Office &amp; Data Entry</a></h3>', 'course-1758568595.jpg', 'diploma-in-ms-office-data-entry', '2025-09-22 13:46:35', '2025-09-22 13:46:35', 1),
(4, 1, 0, 'Diploma in Computer Programming', '<h3><a href=\"http://localhost/biharskill-html/computer-courses.php#\">Diploma in Computer Programming</a></h3>', 'course-1758568621.jpg', 'diploma-in-computer-programming', '2025-09-22 13:47:01', '2025-09-22 13:47:01', 1),
(5, 1, 0, 'Diploma in Computer Hardware & Networking', '<h3><a href=\"http://localhost/biharskill-html/computer-courses.php#\">Diploma in Computer Hardware &amp; Networking</a></h3>', 'course-1758568643.jpg', 'diploma-in-computer-hardware-networking', '2025-09-22 13:47:23', '2025-09-22 13:47:23', 1),
(6, 1, 0, 'Diploma in Graphic Designing', '<h3><a href=\"http://localhost/biharskill-html/computer-courses.php#\">Diploma in Graphic Designing</a></h3>', 'course-1758568666.jpg', 'diploma-in-graphic-designing', '2025-09-22 13:47:46', '2025-09-22 13:47:46', 1),
(7, 2, 0, 'Diploma in Sewing Machine Operator', '<h3><a href=\"http://localhost/biharskill-html/vocational-training-courses.php#\">Diploma in Sewing Machine Operator</a></h3>', 'course-1758568725.jpg', 'diploma-in-sewing-machine-operator', '2025-09-22 13:48:46', '2025-09-22 13:48:46', 1),
(8, 2, 0, 'Diploma in Basic Beautician Course', '<h3><a href=\"http://localhost/biharskill-html/vocational-training-courses.php#\">Diploma in Basic Beautician Course</a></h3>', 'course-1758568785.jpg', 'diploma-in-basic-beautician-course', '2025-09-22 13:49:45', '2025-09-22 13:49:45', 1),
(9, 2, 0, 'Diploma in Hair Styling & Cutting', '<h3><a href=\"http://localhost/biharskill-html/vocational-training-courses.php#\">Diploma in Hair Styling &amp; Cutting</a></h3>', 'course-1758568805.jpg', 'diploma-in-hair-styling-cutting', '2025-09-22 13:50:05', '2025-09-22 13:50:05', 1),
(10, 2, 0, 'Diploma in Makeup & Grooming', '<h3><a href=\"http://localhost/biharskill-html/vocational-training-courses.php#\">Diploma in Makeup &amp; Grooming</a></h3>', 'course-1758568845.jpg', 'diploma-in-makeup-grooming', '2025-09-22 13:50:45', '2025-09-22 13:50:45', 1),
(11, 2, 0, 'Diploma in Mehndi / Henna Designing', '<h3><a href=\"http://localhost/biharskill-html/vocational-training-courses.php#\">Diploma in Mehndi / Henna Designing</a></h3>', 'course-1758568861.jpg', 'diploma-in-mehndi-henna-designing', '2025-09-22 13:51:01', '2025-09-22 13:51:01', 1),
(12, 2, 0, 'Diploma in Beauty Culture', '<h3><a href=\"http://localhost/biharskill-html/vocational-training-courses.php#\">Diploma in Beauty Culture</a></h3>', 'course-1758568883.jpg', 'diploma-in-beauty-culture', '2025-09-22 13:51:23', '2025-09-22 13:51:23', 1),
(13, 1, 0, 'Typing', '<p>Typing</p>', 'course-1760254924.jpg', 'typing', '2025-10-12 02:12:04', '2025-10-12 02:12:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `temp_cash_entries`
--

CREATE TABLE `temp_cash_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_cash_entries`
--

INSERT INTO `temp_cash_entries` (`id`, `user_id`, `subtotal`, `created_at`, `updated_at`) VALUES
(2, 113, NULL, '2026-05-06 02:31:37', '2026-05-06 02:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `temp_cash_entry_details`
--

CREATE TABLE `temp_cash_entry_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `temp_cash_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note_value` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenders`
--

CREATE TABLE `tenders` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(500) NOT NULL,
  `details` text DEFAULT NULL,
  `uploaddate` varchar(500) NOT NULL,
  `upload` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `content` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `img`, `designation`, `message`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rana Sharma', 'uploads/all/all-20240504194949-2523.webp', 'Noida', 'I am excited to express my utmost satisfaction with the Interior Design service provided by Ficox Electrical Architect Engineer Firm.', 1, 1, 1, '2023-03-28 00:00:08', '2024-05-04 14:19:49', NULL),
(8, 'Vikash Singh', 'uploads/all/all-20240504194949-2523.webp', 'Delhi', 'I am excited to express my utmost satisfaction with the Interior Design service provided by Ficox Electrical Architect Engineer Firm.', 1, 1, 1, '2023-03-28 00:00:08', '2024-05-04 14:19:49', NULL),
(9, 'Aman Srivastava', 'uploads/all/all-20240504194949-2523.webp', 'Pune', 'I am excited to express my utmost satisfaction with the Interior Design service provided by Ficox Electrical Architect Engineer Firm.', 1, 1, 1, '2023-03-28 00:00:08', '2024-05-04 14:19:49', NULL),
(10, 'Sarthak Mishra', 'uploads/all/all-20240504194949-2523.webp', 'Purlia', 'I am excited to express my utmost satisfaction with the Interior Design service provided by Ficox Electrical Architect Engineer Firm.', 1, 1, 1, '2023-03-28 00:00:08', '2024-05-04 14:19:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `training_details`
--

CREATE TABLE `training_details` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `photo1` varchar(255) NOT NULL,
  `photo2` varchar(255) NOT NULL,
  `training_place` varchar(255) DEFAULT NULL,
  `training_address` text DEFAULT NULL,
  `district_name` varchar(150) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `supported_by` varchar(255) DEFAULT NULL,
  `total_vivah_mitra` int(11) DEFAULT 0,
  `total_panchayat_mitra` int(11) DEFAULT 0,
  `total_block_vivah_mitra` int(11) DEFAULT 0,
  `total_district_vivah_mitra` int(11) DEFAULT 0,
  `amount` float DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_details`
--

INSERT INTO `training_details` (`id`, `user_id`, `photo1`, `photo2`, `training_place`, `training_address`, `district_name`, `training_date`, `start_time`, `end_time`, `supported_by`, `total_vivah_mitra`, `total_panchayat_mitra`, `total_block_vivah_mitra`, `total_district_vivah_mitra`, `amount`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 90, 'uploads/members/photo11775090118.jpeg', 'uploads/members/photo21775090118.jpg', 'Katihar', 'Kala bhawan', 'Katihar', '2026-04-02', '06:04:00', '07:04:00', 'Shree hanuman ji', 3, 9, 15, 2, 500, 1, NULL, '2026-04-02 06:05:18', '2026-04-02 06:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `paying_area` varchar(255) DEFAULT NULL,
  `utr_no` varchar(255) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `paid_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `commission` decimal(10,2) DEFAULT 0.00,
  `admin_charge` decimal(10,2) DEFAULT 0.00,
  `maintenance` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `paying_area`, `utr_no`, `screenshot`, `amount`, `type`, `status`, `paid_by`, `created_at`, `updated_at`, `commission`, `admin_charge`, `maintenance`, `total_amount`) VALUES
(1, 49, 'upi_details', 'Chshathah', 'screenshot_1772384951.png', 108.00, 'credit', 'paid', 1, '2026-03-01 17:09:11', '2026-03-01 17:09:11', 0.00, 0.00, 0.00, 0.00),
(2, 49, 'upi_details', '546457547', 'screenshot_1772613510.jpg', 100.00, 'credit', 'paid', 1, '2026-03-04 08:38:30', '2026-03-04 08:38:30', 10.00, 2.00, 2.00, 86.00),
(3, 49, 'upi_details', '8768768', 'screenshot_1772613788.jpg', 213.00, 'credit', 'paid', 1, '2026-03-04 08:43:08', '2026-03-04 08:43:08', 21.30, 4.26, 4.26, 183.18);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `user_type_id` bigint(20) NOT NULL,
  `user_designation_id` bigint(20) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `aadhar_card` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `panchayat` int(11) DEFAULT NULL,
  `ward_no` int(11) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `working_hour` float DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `training_fee` float DEFAULT NULL,
  `box_key` varchar(255) DEFAULT NULL,
  `block_reason` varchar(255) DEFAULT NULL,
  `block_date` date DEFAULT NULL,
  `unblock_reason` varchar(255) DEFAULT NULL,
  `unblock_date` date DEFAULT NULL,
  `block_by` int(11) DEFAULT NULL,
  `unblock_by` int(11) DEFAULT NULL,
  `verify_date` date DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `parent_id`, `user_type_id`, `user_designation_id`, `session`, `branch`, `aadhar_card`, `first_name`, `last_name`, `mobile`, `email`, `employee_code`, `gender`, `profile_pic`, `signature`, `email_verified_at`, `address`, `country`, `state`, `city`, `block`, `panchayat`, `ward_no`, `pincode`, `status`, `ip_address`, `created_by`, `updated_by`, `remember_token`, `experience`, `working_hour`, `in_time`, `salary`, `training_fee`, `box_key`, `block_reason`, `block_date`, `unblock_reason`, `unblock_date`, `block_by`, `unblock_by`, `verify_date`, `company_name`, `about`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, NULL, NULL, NULL, 'Admin', 'Admin', '8825171356', 'admin@gmail.com', NULL, 'Male', NULL, NULL, NULL, 'Srinagar', NULL, '0', '0', NULL, NULL, NULL, '85431', 1, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-14 15:43:46', '2024-12-02 06:35:00'),
(124, NULL, 2, 2, NULL, NULL, NULL, 'Sumit Sharma', NULL, '8825171386', 'ranasharma880@gmail.com', NULL, NULL, '1781677161_6a323c69541cb.jpg', NULL, NULL, 'Srinagar Road', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sam Softech', NULL, '2026-06-10 10:07:18', '2026-06-17 06:19:21'),
(125, NULL, 2, 5, NULL, NULL, NULL, 'Abhishek Patel', NULL, '9608080980', 'iabhipatel@gmail.com', NULL, NULL, '1781677161_6a323c69541cb.jpg', NULL, NULL, 'Kankarbagh, Boring Road, Patna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sam Softech Consultancy Pvt. Ltd.', NULL, '2026-06-10 10:07:18', '2026-07-11 09:39:01'),
(127, NULL, 2, NULL, NULL, NULL, NULL, 'ROHAN KUMAR', NULL, '9199758612', 'iamranasharma@gmail.com', NULL, NULL, 'image_file1782283760.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-18 06:48:57', '2026-07-11 09:39:05'),
(128, NULL, 2, NULL, NULL, NULL, NULL, 'Rajeev Ranjan', NULL, '7909056226', 'rajeevkumarranjan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-06 06:02:30', '2026-07-11 09:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_assigned_bonuses`
--

CREATE TABLE `user_assigned_bonuses` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `bonus_id` int(11) NOT NULL,
  `assigned_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_assigned_bonuses`
--

INSERT INTO `user_assigned_bonuses` (`id`, `user_id`, `bonus_id`, `assigned_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 42, 1, '2025-12-07', 1, '2025-12-07 09:27:07', NULL),
(2, 42, 3, '2025-12-07', 1, '2025-12-07 09:27:07', NULL),
(20, 92, 9, '2026-04-01', 1, '2026-04-01 00:10:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_assigned_videos`
--

CREATE TABLE `user_assigned_videos` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `video_id` int(11) NOT NULL,
  `assigned_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_assigned_videos`
--

INSERT INTO `user_assigned_videos` (`id`, `user_id`, `video_id`, `assigned_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 42, 3, '2025-12-07', 1, '2025-12-07 09:27:07', NULL),
(2, 42, 15, '2025-12-07', 1, '2025-12-07 09:27:07', NULL),
(3, 42, 19, '2025-12-07', 1, '2025-12-07 09:27:07', NULL),
(30, 92, 3, '2026-04-01', 1, '2026-04-01 00:10:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_designations`
--

CREATE TABLE `user_designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_designations`
--

INSERT INTO `user_designations` (`id`, `designation_id`, `user_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, 0, '2023-03-14 21:15:07', '2023-03-14 21:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `upi_details` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `to_city` varchar(255) DEFAULT NULL,
  `km1` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `to_village` varchar(255) DEFAULT NULL,
  `km2` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `to_home` varchar(255) DEFAULT NULL,
  `km3` varchar(255) DEFAULT NULL,
  `ward_member_name` varchar(255) DEFAULT NULL,
  `near_by` varchar(255) DEFAULT NULL,
  `mark_of_identification` varchar(255) DEFAULT NULL,
  `aadhar_card` varchar(255) DEFAULT NULL,
  `pan_card` varchar(255) DEFAULT NULL,
  `driving_license` varchar(255) DEFAULT NULL,
  `vehicle_rc` varchar(255) DEFAULT NULL,
  `matriculation_marksheet` varchar(255) DEFAULT NULL,
  `intermediate_marksheet` varchar(255) DEFAULT NULL,
  `graduation_marksheet` varchar(255) DEFAULT NULL,
  `security_money` varchar(255) DEFAULT NULL,
  `screenshot_of_payment` varchar(255) DEFAULT NULL,
  `uniform` varchar(255) DEFAULT NULL,
  `shoe` varchar(255) DEFAULT NULL,
  `sewing_charge` varchar(255) DEFAULT NULL,
  `insurance` varchar(255) DEFAULT NULL,
  `coat` varchar(255) DEFAULT NULL,
  `training` varchar(255) DEFAULT NULL,
  `i_card` varchar(255) DEFAULT NULL,
  `reporting_officer` int(11) DEFAULT NULL,
  `trainer_officer` int(11) DEFAULT NULL,
  `home_verification_officer` int(11) DEFAULT NULL,
  `junior_office_employee` int(11) DEFAULT NULL,
  `staff_incentive` float DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `account_number`, `ifsc_code`, `bank_name`, `branch_name`, `upi_details`, `branch`, `to_city`, `km1`, `city`, `to_village`, `km2`, `village`, `to_home`, `km3`, `ward_member_name`, `near_by`, `mark_of_identification`, `aadhar_card`, `pan_card`, `driving_license`, `vehicle_rc`, `matriculation_marksheet`, `intermediate_marksheet`, `graduation_marksheet`, `security_money`, `screenshot_of_payment`, `uniform`, `shoe`, `sewing_charge`, `insurance`, `coat`, `training`, `i_card`, `reporting_officer`, `trainer_officer`, `home_verification_officer`, `junior_office_employee`, `staff_incentive`, `status`, `created_at`, `updated_at`) VALUES
(1, 42, '36157484203', 'sbin0012640', 'sbi', 'srinagar', 'ranasharma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/user_documents/aadhar_1765119427.pdf', 'uploads/user_documents/pan_1765119427.pdf', 'uploads/user_documents/driving_license_1765119427.pdf', 'uploads/user_documents/vehicle_rc_1765119427.pdf', 'uploads/user_documents/matric_1765119427.pdf', 'uploads/user_documents/intermediate_1765119427.pdf', 'uploads/user_documents/graduation_1765119427.pdf', '2500', 'uploads/user_documents/payment_1765119427.jpg', '100', '100', '100', '100', '100', '100', '100', 44, 47, 43, 46, NULL, 1, '2025-12-07 09:27:07', '2025-12-07 09:27:07'),
(2, 43, '36157484203', 'sbin0012640', 'Canara Bank', 'srinagar', 'ranasharma', 'Purnia', 'Raipur', '1200', 'Raipur', 'Sudeen', '300', 'Marang', 'Home', '500', 'Raman', 'Petrol Pump', 'A mole', 'uploads/user_documents/aadhar_1765120577.pdf', 'uploads/user_documents/pan_1765120577.pdf', 'uploads/user_documents/driving_license_1765120577.pdf', 'uploads/user_documents/vehicle_rc_1765131791.pdf', 'uploads/user_documents/matric_1765120577.pdf', 'uploads/user_documents/intermediate_1765120577.pdf', 'uploads/user_documents/graduation_1765120577.pdf', '10100', 'uploads/user_documents/payment_1765214458.png', '5000', '100', '100', '500000', '100', '100', '100', 44, 47, NULL, 46, 1, 1, '2025-12-07 09:46:17', '2025-12-11 16:30:14'),
(3, 87, '36157484203', 'SBIN0012640', 'State bank of India', 'Srinagar', '3232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-02 17:43:01', '2026-03-02 17:43:01'),
(4, 88, '9665326598', 'sbin001245', 'STATE BANK OF INDIA', 'SRINAGAR', '6200802246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-07 15:42:36', '2026-03-07 15:42:36'),
(5, 89, '36157484203', 'SBIN0012640', 'sTATE BANK', 'purnea', '8825171386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-07 19:34:45', '2026-03-07 19:34:45'),
(6, 91, '30287055255', 'SBIN0000159', 'Sbi', 'Purnea', '6200802246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-20 01:41:58', '2026-03-20 01:41:58'),
(7, 92, '36157484203', 'SBIN0012640', 'STATE BANK', 'SRINAGAR', '8825171386', 'Purnia', 'Purnia', '2', 'Purnia', 'Purnia', '2', 'Purnia', 'Purnia', '2', 'Purnia', 'Purnia', '2', 'uploads/user_documents/aadhar_1774982408.pdf', 'uploads/user_documents/pan_1774982408.pdf', 'uploads/user_documents/driving_license_1774982408.pdf', 'uploads/user_documents/vehicle_rc_1774982408.pdf', 'uploads/user_documents/matric_1774982408.pdf', 'uploads/user_documents/intermediate_1774982408.pdf', 'uploads/user_documents/graduation_1774982408.pdf', '7100', 'uploads/user_documents/payment_1774380957.jpg', '100', '100', '100', '100', '100', '100', '100', 93, 95, 94, 96, 0.5, 1, '2026-03-25 01:05:57', '2026-04-01 00:10:08'),
(8, 97, '8965325456', 'SBIN0000159', 'Sbi', 'Purnea', '89653285666666', 'purnea', 'dugrwa', '12', 'dugrwa', 'nikhrall', '10', 'nikhrell', 'nikhral', '1', 'NA', 'NA', 'NA', 'uploads/user_documents/aadhar_1775890917.pdf', 'uploads/user_documents/pan_1775890917.pdf', 'uploads/user_documents/driving_license_1775890917.pdf', 'uploads/user_documents/vehicle_rc_1775890917.pdf', 'uploads/user_documents/matric_1775890917.pdf', 'uploads/user_documents/intermediate_1775890917.pdf', 'uploads/user_documents/graduation_1775890917.pdf', '2500', 'uploads/user_documents/payment_1775890917.jpeg', '11', '200', '00', '00', '00', '00', '0', 93, 95, 94, 96, 1, 1, '2026-04-11 01:21:41', '2026-04-11 12:31:57'),
(9, 102, '856325965321', 'SBIN0008159', 'SBI', 'Purnea', '6200802246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-11 21:56:10', '2026-04-11 21:56:10'),
(10, 103, '789898787654', 'SBIN0000159', 'PURNEA', 'PURNEA', '9989876545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-11 22:11:48', '2026-04-11 22:11:48'),
(11, 104, '878889876587', 'SBIN0000159', 'SBI', 'PURNEA', '8888989876', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-11 22:33:33', '2026-04-11 22:33:33'),
(12, 105, '36157484203', 'SBIN0012640', 'sbi', 'Srinagar', '8825171386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-11 23:43:35', '2026-04-11 23:43:35'),
(13, 107, '36157484203', 'SBIN0012640', 'State bank of India', 'Srinagar', '8825171386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-12 00:05:33', '2026-04-12 00:05:33'),
(14, 108, '9898765432', 'SBIN0000159', 'SBI', 'PURNEA', '9999987654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-12 00:27:59', '2026-04-12 00:27:59'),
(15, 109, '8787876543232', 'SBIN0000159', 'SBI', 'PURNEA', '9999876544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-12 00:39:45', '2026-04-12 00:39:45'),
(16, 110, '878766666667', 'SBIN0000159', 'SBI', 'PURNEA', '9999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-12 01:03:01', '2026-04-12 01:03:01'),
(17, 111, '1234567899', 'SBIN0000159', 'SBI', 'KADBA', '9888888987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-12 16:13:55', '2026-04-12 16:13:55'),
(18, 114, '36157484203', 'SBIN0012640', 'State Bank of India', 'Srinagar', '9199758612', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-05-14 18:56:41', '2026-05-14 18:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_districts`
--

CREATE TABLE `user_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type_id` bigint(20) NOT NULL DEFAULT 1,
  `username` varchar(255) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_time` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_type_id`, `username`, `mobile`, `password`, `status`, `last_login_time`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'admin@gmail.com', NULL, '123456', 1, '2023-03-15 09:12:22', NULL, '2023-03-14 22:12:22', '2024-10-17 20:11:26'),
(103, 124, 2, 'ranasharma880@gmail.com', '8825171386', '12345678', 1, NULL, NULL, '2026-06-10 10:07:18', '2026-07-01 06:10:35'),
(104, 125, 2, 'iabhipatel@gmail.com', '9608080980', '123456', 1, NULL, NULL, '2026-06-10 10:07:18', '2026-07-11 09:38:50'),
(105, 127, 2, 'iamranasharma@gmail.com', '9199758612', '123456', 1, NULL, NULL, '2026-06-18 06:48:57', '2026-07-11 09:38:54'),
(106, 128, 2, 'rajeevkumarranjan@gmail.com', '7909056226', '123456', 1, NULL, NULL, '2026-07-06 06:02:30', '2026-07-11 09:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `user_navigations`
--

CREATE TABLE `user_navigations` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `nav_id` bigint(20) DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_navigations`
--

INSERT INTO `user_navigations` (`id`, `user_id`, `nav_id`, `added_on`, `status`, `created_at`, `updated_at`) VALUES
(6, 48, 11, '2025-12-15', 1, '2025-12-15 15:20:11', '2025-12-15 15:20:11'),
(7, 48, 15, '2025-12-15', 1, '2025-12-15 15:20:55', '2025-12-15 15:20:55'),
(14, 48, 16, '2025-12-15', 1, '2025-12-15 15:21:01', '2025-12-15 15:21:01'),
(15, 48, 20, '2025-12-16', 1, '2025-12-16 11:09:20', '2025-12-16 11:09:20'),
(17, 48, 13, '2025-12-17', 1, '2025-12-17 12:12:44', '2025-12-17 12:12:44'),
(18, 48, 21, '2025-12-18', 1, '2025-12-18 14:23:01', '2025-12-18 14:23:01'),
(19, 48, 23, '2025-12-18', 1, '2025-12-18 14:23:02', '2025-12-18 14:23:02'),
(20, 48, 27, '2025-12-18', 1, '2025-12-18 14:23:03', '2025-12-18 14:23:03'),
(21, 54, 22, '2025-12-20', 1, '2025-12-20 09:03:34', '2025-12-20 09:03:34'),
(22, 54, 25, '2025-12-20', 1, '2025-12-20 09:03:36', '2025-12-20 09:03:36'),
(23, 54, 26, '2025-12-20', 1, '2025-12-20 09:03:36', '2025-12-20 09:03:36'),
(24, 48, 29, '2025-12-22', 1, '2025-12-22 14:36:22', '2025-12-22 14:36:22'),
(25, 48, 30, '2025-12-23', 1, '2025-12-23 13:41:55', '2025-12-23 13:41:55'),
(26, 48, 31, '2025-12-23', 1, '2025-12-23 13:41:55', '2025-12-23 13:41:55'),
(27, 48, 33, '2025-12-24', 1, '2025-12-24 11:57:34', '2025-12-24 11:57:34'),
(28, 48, 34, '2025-12-25', 1, '2025-12-25 11:04:01', '2025-12-25 11:04:01'),
(29, 48, 35, '2025-12-25', 1, '2025-12-25 11:04:02', '2025-12-25 11:04:02'),
(30, 48, 36, '2025-12-25', 1, '2025-12-25 11:04:02', '2025-12-25 11:04:02'),
(39, 115, 30, '2026-05-21', 1, '2026-05-21 14:29:49', '2026-05-21 14:29:49'),
(40, 115, 31, '2026-05-21', 1, '2026-05-21 14:29:50', '2026-05-21 14:29:50'),
(41, 115, 32, '2026-05-21', 1, '2026-05-21 14:29:50', '2026-05-21 14:29:50'),
(42, 115, 33, '2026-05-21', 1, '2026-05-21 14:29:51', '2026-05-21 14:29:51'),
(43, 115, 34, '2026-05-25', 1, '2026-05-25 16:14:44', '2026-05-25 16:14:44'),
(44, 115, 35, '2026-05-25', 1, '2026-05-25 16:14:45', '2026-05-25 16:14:45'),
(45, 115, 36, '2026-05-25', 1, '2026-05-25 16:14:46', '2026-05-25 16:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_shops`
--

CREATE TABLE `user_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `master_shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_shops`
--

INSERT INTO `user_shops` (`id`, `user_id`, `master_shop_id`, `created_at`, `updated_at`) VALUES
(1, 84, 1, NULL, NULL),
(2, 93, 1, NULL, NULL),
(3, 113, 1, NULL, NULL),
(5, 112, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_targets`
--

CREATE TABLE `user_targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `target_count` int(11) NOT NULL,
  `duration_days` int(11) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_achieved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Admin Panel', 1, 1, 0, '2023-03-14 21:15:49', '2025-12-17 18:38:57'),
(2, 'Customer', 1, 1, NULL, '2023-03-29 10:06:30', '2026-07-11 09:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `category`, `title`, `link`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, NULL, 'https://youtu.be/W-Lk1gRPn2Q?si=sUekOFMfwo9l4GPt', 1, 1, 0, '2024-06-24 03:30:43', '2024-06-24 03:46:37', '2024-06-24 03:46:37'),
(2, 3, NULL, 'https://youtu.be/W-Lk1gRPn2Q?si=sUekOFMfwo9l4GPt', 1, 1, 0, '2024-06-24 03:48:53', '2024-06-24 04:09:59', '2024-06-24 04:09:59'),
(3, 3, NULL, 'https://youtu.be/W-Lk1gRPn2Q?si=sUekOFMfwo9l4GPt', 1, 1, 0, '2024-06-24 03:52:50', '2024-06-24 04:10:04', '2024-06-24 04:10:04'),
(4, 3, NULL, 'https://www.youtube.com/embed/W-Lk1gRPn2Q?si=LR1oTdNcbmPaV8bk', 1, 1, 0, '2024-06-24 04:10:34', '2024-06-24 04:10:34', NULL),
(5, 3, NULL, 'https://www.youtube.com/embed/CXl0oPlf_MA?si=Zh3sKxlWUIb6lju9', 1, 1, 0, '2024-06-24 04:12:59', '2024-06-24 04:12:59', NULL),
(6, 3, NULL, 'https://www.youtube.com/embed/SvE8SQ5Ngns?si=8RpbEfuLs92GjmCp', 1, 1, 0, '2024-06-24 04:22:00', '2025-12-18 20:18:27', '2025-12-18 20:18:27'),
(7, 4, NULL, 'https://www.youtube.com/embed/fgdrCj_FYEE?si=z8f6DN9w-yvkXREc', 1, 1, 0, '2024-06-24 05:31:07', '2024-06-24 05:31:07', NULL),
(8, 4, NULL, 'https://youtube.com/shorts/oe0DDc_TckU?si=YxR6enNySjuyW6Sc', 1, 1, 0, '2026-01-15 16:01:00', '2026-01-15 16:01:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `video_categories`
--

CREATE TABLE `video_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_categories`
--

INSERT INTO `video_categories` (`id`, `parent_id`, `title`, `image`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 0, 'Common Video', 'uploads/all/all-20240605105544-9439.webp', 'common-video', 1, 1, NULL, '2024-06-05 05:25:44', '2024-06-24 07:54:57', NULL),
(5, 0, 'Branch Manager Video', NULL, 'branch-manager-video', 1, NULL, NULL, '2025-11-29 13:38:53', '2025-11-29 13:58:21', NULL),
(6, 0, 'Employee Videos', NULL, 'employee-videos', 1, NULL, NULL, '2025-11-29 13:40:34', '2025-11-29 13:40:34', NULL),
(7, 0, 'VIVHA MITRA', NULL, 'vivha-mitra', 1, NULL, NULL, '2026-01-15 16:01:19', '2026-01-15 16:01:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vivahmitra_categories`
--

CREATE TABLE `vivahmitra_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vivahmitra_categories`
--

INSERT INTO `vivahmitra_categories` (`id`, `parent_id`, `name`, `slug`, `description`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'संस्थान के बारे में', 'sansthana-ke-bare-mein', 'संस्थान के बारे में', 'uploads/category/1772629246803.ChatGPT Image Mar 4, 2026, 06_30_54 PM.png', 1, NULL, '2025-12-21 02:31:02', '2026-03-04 13:00:46'),
(2, NULL, 'ग्राहक के फायदे', 'garahaka-ka-fayatha', 'ग्राहक के फायदे', 'uploads/category/177262865410.ChatGPT Image Mar 4, 2026, 06_21_01 PM.png', 1, NULL, '2025-12-21 02:31:29', '2026-03-04 12:50:54'),
(3, NULL, 'विवाह मित्र के लाभ', 'vavaha-matara-ka-lbha', 'विवाह मित्र के लाभ', 'uploads/category/1772629605944.ChatGPT Image Mar 4, 2026, 06_36_54 PM.png', 1, NULL, '2025-12-21 02:31:44', '2026-03-04 13:06:45'),
(4, NULL, 'शादी के पैकेज', 'shatha-ka-pakaja', 'शादी के पैकेज', 'uploads/category/1772629574320.ChatGPT Image Mar 4, 2026, 06_35_08 PM.png', 1, NULL, '2025-12-21 02:33:08', '2026-03-04 13:06:14'),
(5, NULL, 'ग्राहकों के सुविधा', 'garahaka-ka-savathha', 'ग्राहकों के सुविधा', 'uploads/category/1772629739201.ChatGPT Image Mar 4, 2026, 06_38_55 PM.png', 1, NULL, '2025-12-21 02:34:06', '2026-03-04 13:08:59'),
(6, NULL, 'ऑफर', 'offer', 'ऑफर', 'uploads/category/1772628132872.offer_380x380.png', 1, NULL, '2025-12-21 02:35:07', '2026-03-18 00:55:03'),
(7, 1, 'उत्कृष्टता पुरस्कार', 'utakashhatata-parasakara', 'उत्कृष्टता पुरस्कार', 'uploads/category/1766304362263.building.png', 1, NULL, '2025-12-21 02:36:02', '2025-12-21 02:36:02'),
(8, 1, 'सशक्तिकरण पुरस्कार', 'sashakatakaranae-parasakara', 'सशक्तिकरण पुरस्कार', 'uploads/category/1766304383534.building.png', 1, NULL, '2025-12-21 02:36:23', '2025-12-21 02:36:23'),
(9, 1, 'सम्मान समारोह पुरस्कार', 'samamana-samaraha-parasakara', 'सम्मान समारोह पुरस्कार', 'uploads/category/1766304401896.building.png', 1, NULL, '2025-12-21 02:36:41', '2025-12-21 02:36:41'),
(10, 1, 'सेवा भाव जागृत पुरस्कार', 'sava-bhava-jagata-parasakara', 'सेवा भाव जागृत पुरस्कार', 'uploads/category/176630442051.building.png', 1, NULL, '2025-12-21 02:37:00', '2025-12-21 02:37:00'),
(11, 4, '51000/=हजार का शादी का गिफ्ट पैकेज', '51000hajara-ka-satha-ka-gafata-pakaja', '51000/=हजार का सदी का गिफ्ट पैकेज', 'uploads/category/1766307500726.building (1).png', 1, NULL, '2025-12-21 03:28:20', '2025-12-21 03:34:33'),
(12, 4, '99000/=हजार का शादी  का गिफ्ट पैकेज', '99000hajara-ka-shatha-ka-gafata-pakaja', '99000/=हजार का शादी  का गिफ्ट पैकेज', 'uploads/category/1766307568500.building (1).png', 1, NULL, '2025-12-21 03:29:28', '2025-12-21 03:29:28'),
(13, 4, '1,75,000 /=हजार का शादी  का गिफ्ट पैकेज', '175000-hajara-ka-shatha-ka-gafata-pakaja', '1,75,000 /=हजार का शादी  का गिफ्ट पैकेज', 'uploads/category/1766307598555.building (1).png', 1, NULL, '2025-12-21 03:29:58', '2025-12-21 03:29:58'),
(14, 4, 'स्वनिर्धारित का शादी  का गिफ्ट पैकेज', 'savanarathharata-ka-shatha-ka-gafata-pakaja', 'स्वनिर्धारित का शादी  का गिफ्ट पैकेज', 'uploads/category/1766307696990.building (1).png', 1, NULL, '2025-12-21 03:31:36', '2025-12-21 03:31:36'),
(15, 2, 'समय की बचत', 'samaya-ka-bcata', 'समय की बचत', 'uploads/category/176630818122.building (1).png', 1, NULL, '2025-12-21 03:39:41', '2025-12-21 03:39:41'),
(16, 2, 'मोल मोलियी का झझनत नहीं', 'mal-malya-ka-jhajhanata-naha', 'मोल मोलियी का झझनत नहीं', 'uploads/category/1766308329861.building (1).png', 1, NULL, '2025-12-21 03:42:09', '2025-12-21 03:42:09'),
(17, 2, 'भारी छूट', 'bhara-chhata', 'भारी छूट', 'uploads/category/1766308358593.building (1).png', 1, NULL, '2025-12-21 03:42:38', '2025-12-21 03:42:38'),
(18, 2, 'एक ही छत के नीचे सब कुछ', 'eka-ha-chhata-ka-naca-sab-kachha', 'एक ही छत के नीचे सब कुछ', 'uploads/category/1766308420517.building (1).png', 1, NULL, '2025-12-21 03:43:40', '2025-12-21 03:43:40'),
(19, 3, 'विवाह मित्र इंकम', 'vavaha-matara-ikama', 'विवाह मित्र इंकम', 'uploads/category/1767113219729.V2F SHADI OFFER FLEX 2 X 3 = 50 PIC NORMAL A.jpg', 1, NULL, '2025-12-30 11:16:59', '2025-12-30 11:16:59'),
(20, NULL, 'पंचायत विवाह मित्र के लाभ', 'pacayata-vavaha-matara-ka-lbha', 'पंचायत विवाह मित्र के लाभ', 'uploads/category/1772630037778.ChatGPT Image Mar 4, 2026, 06_44_05 PM.png', 1, NULL, '2025-12-30 11:26:30', '2026-03-04 13:13:57'),
(21, 20, 'पंचयत विवाह मित्र इंकम', 'pacayata-vavaha-matara-ikama', 'पंचयत विवाह मित्र इंकम', 'uploads/category/1767113865380.V2F SHADI OFFER FLEX 2 X 3 = 50 PIC NORMAL A.jpg', 1, NULL, '2025-12-30 11:27:45', '2025-12-30 11:27:45'),
(22, NULL, 'V2F बाजार', 'tapara', 'hhii', 'uploads/category/1772628192235.ChatGPT Image Mar 4, 2026, 06_09_28 PM.png', 1, NULL, '2026-01-15 18:24:36', '2026-03-04 12:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `vivahmitra_products`
--

CREATE TABLE `vivahmitra_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vivahmitra_products`
--

INSERT INTO `vivahmitra_products` (`id`, `category_id`, `name`, `slug`, `description`, `thumbnail`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(62, 11, 'Rana Sharma', 'rana-sharma', '<p>sdfsf</p><p>HKJHDKJASHDASD</p><p>ASASDHASJKDH</p><p><br></p><p>SADSALDJ</p><p><br></p>', 'uploads/products/1766311802700.building (1).png', 1, 1, NULL, '2025-12-21 04:40:02', '2025-12-21 06:09:42'),
(63, 14, 'शादी  का पैकेज-4', 'dbqwjdbjqwhbdjqwhd-qjwqwjdqwdb', '<h2 class=\"\"><b style=\"\"><font color=\"#9c00ff\" style=\"background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;शादी&nbsp; का पैकेज</font><span style=\"background-color: rgb(255, 0, 255);\">&nbsp;</span></b></h2><h2 class=\"\"><div class=\"WaaZC\" style=\"color: rgb(71, 71, 71); font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 16px;\"><div class=\"rPeykc\" data-hveid=\"CHYQAQ\" data-ved=\"2ahUKEwiN0avWv86RAxVvSmwGHTzJFpQQo_EKegQIdhAB\" style=\"margin: 0px 0px 10px;\"><span data-huuid=\"5697141785236708603\">शादी के खाने में&nbsp;<mark class=\"QVRyCf\" style=\"background-image: linear-gradient(90deg, rgb(211, 227, 253) 50%, rgba(0, 0, 0, 0) 50%); background-position: 75% 0px; background-size: 200% 100%; background-repeat: no-repeat; background-attachment: scroll; background-origin: padding-box; background-clip: border-box; color: rgb(4, 12, 40); border-radius: 4px; padding: 0px 2px; animation: 0.75s cubic-bezier(0.05, 0.7, 0.1, 1) 0.25s 1 normal forwards running highlight-animation;\">स्टार्टर्स (पकोड़े, कबाब), मुख्य व्यंजन (पनीर, चिकन/मटन करी, दाल, चावल, रोटी/नान), साइड डिश (रायता, सलाद), और मीठे (गुलाब जामुन, खीर, आइसक्रीम) का संतुलन होना चाहिए, जिसमें शाकाहारी और मांसाहारी दोनों विकल्प शामिल हों और मौसम के अनुसार मिठाइयाँ (गर्मी में कुल्फी, सर्दी में गाजर का हलवा) परोसी जाएँ</mark>।<span jscontroller=\"JHnpme\" class=\"pjBG2e\" data-cid=\"007c00fb-cdad-4a55-aca5-527f4ecbeb03\" jsaction=\"rcuQ6b:npT2md\"><span class=\"UV3uM\" style=\"text-wrap-mode: nowrap;\">&nbsp;<div class=\"NPrrbc\" data-cid=\"007c00fb-cdad-4a55-aca5-527f4ecbeb03\" data-uuids=\"5697141785236708603\" style=\"margin-inline-end: 6px; vertical-align: middle; display: inline-flex;\"><div jsname=\"HtgYJd\" class=\"BMebGe btku5b LwdV0e FR7ZSc OJeuxf\" jsaction=\"KjsqPd\" aria-label=\"View related links\" role=\"button\" tabindex=\"0\" data-hveid=\"CHIQAg\" data-ved=\"2ahUKEwiN0avWv86RAxVvSmwGHTzJFpQQ3fYKegQIchAC\" style=\"vertical-align: middle; outline: 0px; -webkit-tap-highlight-color: transparent; color: rgb(11, 87, 208); display: inline-flex !important;\"><div class=\"niO4u\" style=\"display: flex; justify-content: center; position: relative; align-items: center; width: 28px; z-index: 0; border-radius: 9999px; padding: 0px; border: 1px solid transparent; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 20px; margin: 0px auto; min-height: 20px; background-color: rgb(229, 237, 255) !important;\"><span class=\"TwMgNb Hkv2Pe\" style=\"color: rgb(31, 31, 31) !important; background: unset !important; display: flex; align-items: center;\"><span class=\"iPjmzb Sorfoc gNGSDf\" style=\"display: flex; height: unset; rotate: 135deg;\"><span class=\"z1asCe Sb7k4e\" style=\"display: inline-block; fill: currentcolor; height: 18px; line-height: 18px; position: relative; width: 18px;\"><svg focusable=\"false\" aria-hidden=\"true\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></span></span></div></div></div></span></span></span></div></div><div class=\"WaaZC\" style=\"color: rgb(71, 71, 71); font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 16px;\"><div data-hveid=\"CKoBEAE\"><div class=\"rPeykc\" data-hveid=\"CKgBEAE\" data-ved=\"2ahUKEwiN0avWv86RAxVvSmwGHTzJFpQQo_EKegUIqAEQAQ\" style=\"margin: 10px 0px;\"><span data-huuid=\"5697141785236706428\">यह वीडियो शादी के मेनू के लिए कुछ ट्रेंडिंग और खास आइटम दिखाता है:</span></div></div></div></h2><div class=\"Y3BBE\" data-sfc-cp=\"\" jsaction=\"rcuQ6b:&amp;nMbRX_i|npT2md\" jscontroller=\"zcfIf\" jsuid=\"nMbRX_i\" data-hveid=\"CAIQAA\" data-processed=\"true\" style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 16px; line-height: 24px; overflow-wrap: break-word; margin: 10px 0px 20px; color: rgb(10, 10, 10);\"><div class=\"pWvJNd\" jscontroller=\"zp3Dsd\" jsuid=\"nMbRX_3\" style=\"width: 632px;\"><div dir=\"ltr\" data-container-id=\"main-col\" data-xid=\"VpUvz\" jsname=\"KFl8ub\" class=\"mZJni Dn7Fzd\" jscontroller=\"Aoijq\" jsuid=\"nMbRX_4\" data-ved=\"2ahUKEwjj2sjWv86RAxXiR2wGHV04EWkQ3KYQegQIABAB\" style=\"width: 652px; max-width: 632px;\"><div class=\"Y3BBE\" data-sfc-cp=\"\" jsaction=\"rcuQ6b:&amp;nMbRX_1k|npT2md\" jscontroller=\"zcfIf\" jsuid=\"nMbRX_1k\" data-hveid=\"CAUQAA\" data-processed=\"true\" style=\"line-height: 24px; overflow-wrap: break-word; margin: 10px 0px 20px;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_1l\" data-processed=\"true\" style=\"font-weight: bolder;\">पैकेजों के प्रकार और कीमत (उदाहरण):</span><span jsuid=\"nMbRX_1m\" class=\"txxDge notranslate\" jsaction=\"rcuQ6b:&amp;nMbRX_1m|npT2md\" jscontroller=\"udAs2b\" data-wiz-uids=\"nMbRX_1m,nMbRX_1n,nMbRX_1o\" data-processed=\"true\" style=\"visibility: hidden;\"><span class=\"vKEkVd\" data-animation-atomic=\"\" data-wiz-attrbind=\"class=nMbRX_1m/TKHnVd;\" data-processed=\"true\" style=\"text-wrap-mode: nowrap; position: relative;\"><button jsuid=\"nMbRX_1o\" tabindex=\"0\" data-amic=\"true\" data-icl-uuid=\"d01f7d6e-e6b8-475e-aafb-b663d06d0d3d\" aria-label=\"View related links\" class=\"rBl3me\" jsaction=\"click:&amp;nMbRX_1m|S9kKve;mouseenter:&amp;nMbRX_1m|sbHm2b;mouseleave:&amp;nMbRX_1m|Tx5Rb\" data-wiz-attrbind=\"disabled=nMbRX_1m/C5gNJc;class=nMbRX_1m/UpSNec;\" data-ved=\"2ahUKEwjj2sjWv86RAxXiR2wGHV04EWkQye0OegQIBRAB\" data-processed=\"true\" style=\"margin-right: 6px; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(229, 237, 255); border-width: initial; border-style: none; border-color: initial; border-radius: 10px; height: 20px; padding: 0px; width: 28px; position: relative; outline: 0px;\"><span class=\"wiMplc ofC0Ud\" data-processed=\"true\" style=\"color: rgb(0, 29, 53); display: inline-block; transform: rotate(135deg);\"><svg style=\"margin-top: 3px;\" fill=\"currentColor\" width=\"12px\" height=\"12px\" focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></button></span></span></div><ul class=\"KsbFXc U6u95\" jscontroller=\"mPWODf\" jsuid=\"nMbRX_1p\" data-processed=\"true\" style=\"margin: 10px 0px 20px; padding: 0px; line-height: 24px; padding-inline-start: 16px;\"><li jscontroller=\"vsuOFb\" jsuid=\"nMbRX_1q\" data-hveid=\"CAYQAA\" data-processed=\"true\" style=\"margin: 0px 0px 12px; padding: 0px; list-style: disc; padding-inline-start: 4px;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_1s\" data-processed=\"true\" style=\"font-weight: bolder;\">छोटे पैकेज:</span>&nbsp;₹25,000 - ₹31,000 में 21-25 सामान.</li><li jscontroller=\"vsuOFb\" jsuid=\"nMbRX_1t\" data-hveid=\"CAYQAQ\" data-processed=\"true\" style=\"margin: 0px 0px 12px; padding: 0px; list-style: disc; padding-inline-start: 4px;\"><span class=\"T286Pc\" data-sfc-cp=\"\" jscontroller=\"fly6D\" jsuid=\"nMbRX_1u\" data-processed=\"true\" style=\"overflow-wrap: break-word;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_1v\" data-processed=\"true\" style=\"font-weight: bolder;\">मध्यम पैकेज:</span>&nbsp;₹41,000 - ₹61,000 में 24-25 सामान (डिस्काउंट के साथ).</span></li><li jscontroller=\"vsuOFb\" jsuid=\"nMbRX_1w\" data-hveid=\"CAYQAg\" data-processed=\"true\" style=\"margin: 0px 0px 12px; padding: 0px; list-style: disc; padding-inline-start: 4px;\"><span class=\"T286Pc\" data-sfc-cp=\"\" jscontroller=\"fly6D\" jsuid=\"nMbRX_1x\" data-processed=\"true\" style=\"overflow-wrap: break-word;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_1y\" data-processed=\"true\" style=\"font-weight: bolder;\">बड़े पैकेज:</span>&nbsp;₹71,000 - ₹1 लाख तक, जिसमें ज़्यादा सामान और अच्छे ब्रांडेड आइटम शामिल होते हैं (जैसे ₹1 लाख में 40 सामान).</span><span jsuid=\"nMbRX_1z\" class=\"uJ19be notranslate\" jsaction=\"rcuQ6b:&amp;nMbRX_1z|npT2md\" jscontroller=\"udAs2b\" data-wiz-uids=\"nMbRX_1z,nMbRX_20,nMbRX_21\" data-processed=\"true\"><span class=\"vKEkVd\" data-animation-atomic=\"\" data-wiz-attrbind=\"class=nMbRX_1z/TKHnVd;\" data-processed=\"true\" style=\"text-wrap-mode: nowrap; position: relative;\">&nbsp;<button jsuid=\"nMbRX_21\" tabindex=\"0\" data-amic=\"true\" data-icl-uuid=\"8cf9a7cb-8c42-4eb4-8d62-c97b87cc2068\" aria-label=\"View related links\" class=\"rBl3me\" jsaction=\"click:&amp;nMbRX_1z|S9kKve;mouseenter:&amp;nMbRX_1z|sbHm2b;mouseleave:&amp;nMbRX_1z|Tx5Rb\" data-wiz-attrbind=\"disabled=nMbRX_1z/C5gNJc;class=nMbRX_1z/UpSNec;\" data-ved=\"2ahUKEwjj2sjWv86RAxXiR2wGHV04EWkQye0OegQIBhAD\" data-processed=\"true\" style=\"margin-right: 6px; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(229, 237, 255); border-width: initial; border-style: none; border-color: initial; border-radius: 10px; height: 20px; padding: 0px; width: 28px; position: relative; outline: 0px;\"><span class=\"wiMplc ofC0Ud\" data-processed=\"true\" style=\"color: rgb(0, 29, 53); display: inline-block; transform: rotate(135deg);\"><svg style=\"margin-top: 3px;\" fill=\"currentColor\" width=\"12px\" height=\"12px\" focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></button></span></span></li></ul><div class=\"Y3BBE\" data-sfc-cp=\"\" jsaction=\"rcuQ6b:&amp;nMbRX_25|npT2md\" jscontroller=\"zcfIf\" jsuid=\"nMbRX_25\" data-hveid=\"CAcQAA\" data-processed=\"true\" style=\"line-height: 24px; overflow-wrap: break-word; margin: 10px 0px 20px;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_26\" data-processed=\"true\" style=\"font-weight: bolder;\">मुख्य बातें:</span><span jsuid=\"nMbRX_27\" class=\"txxDge notranslate\" jsaction=\"rcuQ6b:&amp;nMbRX_27|npT2md\" jscontroller=\"udAs2b\" data-wiz-uids=\"nMbRX_27,nMbRX_28,nMbRX_29\" data-processed=\"true\" style=\"visibility: hidden;\"><span class=\"vKEkVd\" data-animation-atomic=\"\" data-wiz-attrbind=\"class=nMbRX_27/TKHnVd;\" data-processed=\"true\" style=\"text-wrap-mode: nowrap; position: relative;\"><button jsuid=\"nMbRX_29\" tabindex=\"0\" data-amic=\"true\" data-icl-uuid=\"b9ee77de-597a-4689-8743-b17c95ccc357\" aria-label=\"View related links\" class=\"rBl3me\" jsaction=\"click:&amp;nMbRX_27|S9kKve;mouseenter:&amp;nMbRX_27|sbHm2b;mouseleave:&amp;nMbRX_27|Tx5Rb\" data-wiz-attrbind=\"disabled=nMbRX_27/C5gNJc;class=nMbRX_27/UpSNec;\" data-ved=\"2ahUKEwjj2sjWv86RAxXiR2wGHV04EWkQye0OegQIBxAB\" data-processed=\"true\" style=\"margin-right: 6px; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(229, 237, 255); border-width: initial; border-style: none; border-color: initial; border-radius: 10px; height: 20px; padding: 0px; width: 28px; position: relative; outline: 0px;\"><span class=\"wiMplc ofC0Ud\" data-processed=\"true\" style=\"color: rgb(0, 29, 53); display: inline-block; transform: rotate(135deg);\"><svg style=\"margin-top: 3px;\" fill=\"currentColor\" width=\"12px\" height=\"12px\" focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></button></span></span></div><ul class=\"KsbFXc U6u95\" jscontroller=\"mPWODf\" jsuid=\"nMbRX_2a\" data-processed=\"true\" style=\"margin: 10px 0px 20px; padding: 0px; line-height: 24px; padding-inline-start: 16px;\"><li jscontroller=\"vsuOFb\" jsuid=\"nMbRX_2b\" data-hveid=\"CAgQAA\" data-processed=\"true\" style=\"margin: 0px 0px 12px; padding: 0px; list-style: disc; padding-inline-start: 4px;\"><span class=\"T286Pc\" data-sfc-cp=\"\" jscontroller=\"fly6D\" jsuid=\"nMbRX_2c\" data-processed=\"true\" style=\"overflow-wrap: break-word;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_2d\" data-processed=\"true\" style=\"font-weight: bolder;\">कस्टमाइज़ेशन:</span>&nbsp;कई कंपनियां अपनी पसंद के अनुसार सामान बदलने (कस्टमाइज़) की सुविधा देती हैं.</span></li><li jscontroller=\"vsuOFb\" jsuid=\"nMbRX_2e\" data-hveid=\"CAgQAQ\" data-processed=\"true\" style=\"margin: 0px 0px 12px; padding: 0px; list-style: disc; padding-inline-start: 4px;\"><span class=\"T286Pc\" data-sfc-cp=\"\" jscontroller=\"fly6D\" jsuid=\"nMbRX_2f\" data-processed=\"true\" style=\"overflow-wrap: break-word;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_2g\" data-processed=\"true\" style=\"font-weight: bolder;\">डिलीवरी:</span>&nbsp;कई पैकेज पूरे भारत में डिलीवरी (डिस्पैच) के साथ आते हैं, कुछ में 100 किमी तक का किराया फ्री होता है.</span></li><li jscontroller=\"vsuOFb\" jsuid=\"nMbRX_2h\" data-hveid=\"CAgQAg\" data-processed=\"true\" style=\"margin: 0px 0px 12px; padding: 0px; list-style: disc; padding-inline-start: 4px;\"><span class=\"T286Pc\" data-sfc-cp=\"\" jscontroller=\"fly6D\" jsuid=\"nMbRX_2i\" data-processed=\"true\" style=\"overflow-wrap: break-word;\"><span class=\"Yjhzub\" jscontroller=\"zYmgkd\" jsuid=\"nMbRX_2j\" data-processed=\"true\" style=\"font-weight: bolder;\">गुणवत्ता:</span>&nbsp;ब्रांडेड और ओरिजिनल कंपनियों के सामान देने का दावा किया जाता है.</span><span jsuid=\"nMbRX_2k\" class=\"uJ19be notranslate\" jsaction=\"rcuQ6b:&amp;nMbRX_2k|npT2md\" jscontroller=\"udAs2b\" data-wiz-uids=\"nMbRX_2k,nMbRX_2l,nMbRX_2m\" data-processed=\"true\"><span class=\"vKEkVd\" data-animation-atomic=\"\" data-wiz-attrbind=\"class=nMbRX_2k/TKHnVd;\" data-processed=\"true\" style=\"text-wrap-mode: nowrap; position: relative;\">&nbsp;<button jsuid=\"nMbRX_2m\" tabindex=\"0\" data-amic=\"true\" data-icl-uuid=\"bd59cf38-2d1c-4a1f-96e2-5e127a2dc627\" aria-label=\"View related links\" class=\"rBl3me\" jsaction=\"click:&amp;nMbRX_2k|S9kKve;mouseenter:&amp;nMbRX_2k|sbHm2b;mouseleave:&amp;nMbRX_2k|Tx5Rb\" data-wiz-attrbind=\"disabled=nMbRX_2k/C5gNJc;class=nMbRX_2k/UpSNec;\" data-ved=\"2ahUKEwjj2sjWv86RAxXiR2wGHV04EWkQye0OegQICBAD\" data-processed=\"true\" style=\"margin-right: 6px; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(229, 237, 255); border-width: initial; border-style: none; border-color: initial; border-radius: 10px; height: 20px; padding: 0px; width: 28px; position: relative; outline: 0px;\"><span class=\"wiMplc ofC0Ud\" data-processed=\"true\" style=\"color: rgb(0, 29, 53); display: inline-block; transform: rotate(135deg);\"><svg style=\"margin-top: 3px;\" fill=\"currentColor\" width=\"12px\" height=\"12px\" focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></button></span></span></li></ul><div class=\"Y3BBE\" data-sfc-cp=\"\" jsaction=\"rcuQ6b:&amp;nMbRX_2q|npT2md\" jscontroller=\"zcfIf\" jsuid=\"nMbRX_2q\" data-hveid=\"CAkQAA\" data-processed=\"true\" style=\"line-height: 24px; overflow-wrap: break-word; margin: 10px 0px 20px;\">यह पैकेजेस नए शादीशुदा जोड़ों के लिए घर बसाने की प्रक्रिया को आसान बनाते हैं, जिससे उन्हें अलग-अलग खरीदारी करने की बजाय एक साथ सारे ज़रूरी सामान मिल जाते हैं</div></div></div></div>', 'uploads/products/1766314527461.R2.jpg', 1, 1, NULL, '2025-12-21 04:48:10', '2025-12-21 07:40:25'),
(64, 1, 'V2F Baazar को उनके उत्कृष्ट सामाजिक कार्य', 'v2f-baazar-ka-unaka-utakashhata-samajaka-karaya', '<p>V2F Baazar को उनके उत्कृष्ट सामाजिक कार्यों और महत्वपूर्ण योगदान के लिए कई प्रतिष्ठित अवार्ड और सम्मान मिले हैं। इनमें से कुछ प्रमुख अवार्ड और सम्मान निम्नलिखित हैं !</p><p>सामाजिक सेवा उत्कृष्टता पुरस्कार:- V2F Baazar को मुंबई की प्रसिद्ध फिल्म अभिनेत्री श्रीमती भाग्यश्री जी के हाथों यह पुरस्कार प्राप्त हुआ है, जो उनके उत्कृष्ट सामाजिक कार्यों के लिए दिया जाता है।</p><p><br></p>', 'uploads/products/17663150403.SS1.jpg', 1, 1, NULL, '2025-12-21 05:34:00', '2025-12-21 05:34:00'),
(65, 1, 'महिला सशक्तिकरण पुरस्कार:', 'mahal-sashakatakaranae-parasakara', '<h1 class=\"\"><b><font color=\"#ff0000\">महिला सशक्तिकरण पुरस्कार:</font></b></h1><p> V2F Baazar को मुंबई टीवी सीरियल अभिनेत्री श्रीमती नैंसी जी के हाथों यह पुरस्कार मिला है, जो उनके महिला सशक्तिकरण कार्यक्रमों के लिए प्रदान किया गया।</p>', 'uploads/products/1766315156381.A2.jpeg', 1, 1, NULL, '2025-12-21 05:35:56', '2025-12-21 05:35:56'),
(66, 9, 'महिला सशक्तिकरण पुरस्कार:', 'mahal-sashakatakaranae-parasakara-2', '<h3 class=\"\"><b><font color=\"#ff00ff\">सम्मान समारोह पुरस्कार:</font></b></h3><p> V2F Baazar को खाद्य और उपभोक्ता संरक्षण मंत्री श्री लेसी सिंह जी के हाथों यह पुरस्कार प्राप्त हुआ है, जो महिलाओं के लिए सम्मान समारोह का हिस्सा था।</p>', 'uploads/products/1766315199677.A3.jpeg', 1, 1, NULL, '2025-12-21 05:36:39', '2025-12-21 05:36:39'),
(67, 10, '4.सेवा भाव जागृत पुरस्कार: V2F Baazar  को', '4sava-bhava-jagata-parasakara-v2f-baazar-ka', '<h2 class=\"\"><b><span style=\"font-size: 44px;\"><font color=\"#397b21\">सेवा भाव जागृत पुरस्कार:</font></span> </b></h2><p>V2F Baazar&nbsp; को वृंदावन (मथुरा) के मशहूर कथा वाचक श्री अनिरुद्धा आचार्य जी के हाथों यह पुरस्कार और सम्मान प्राप्त हुआ है।</p>', 'uploads/products/1766315286569.A5.jpeg', 1, 1, NULL, '2025-12-21 05:38:06', '2025-12-21 05:38:06'),
(68, 1, 'V2F Baazar  को मुंबई फिल्म अभिनेत्री श्रीमती इशिता चौहान जी के हाथों', 'v2f-baazar-ka-mabii-falma-abhanatara-sharamata-ishata-cahana-ja-ka-hatha', '<h1 class=\"\"><b style=\"\"><font style=\"background-color: rgb(255, 255, 255);\" color=\"#311873\">सामुदायिक सेवा पुरस्कार:</font></b></h1><p> V2F Baazar&nbsp; को मुंबई फिल्म अभिनेत्री श्रीमती इशिता चौहान जी के हाथों यह पुरस्कार प्राप्त हुआ है, जो उनके सामुदायिक सेवा कार्यों के लिए दिया गया।</p>', 'uploads/products/1766315382936.A6.jpeg', 1, 1, NULL, '2025-12-21 05:39:42', '2025-12-21 05:39:42'),
(69, 3, 'इंकम', 'ikama', '<p>इंकम&nbsp;</p>', 'uploads/products/1767112909312.V2F SHADI OFFER FLEX 2 X 3 = 50 PIC NORMAL A.jpg', 1, 1, NULL, '2025-12-30 11:11:49', '2025-12-30 11:11:49'),
(70, 3, 'इंकम', 'ikama-2', '<p>इंकम&nbsp;</p>', 'uploads/products/1767112921978.V2F SHADI OFFER FLEX 2 X 3 = 50 PIC NORMAL A.jpg', 1, 1, NULL, '2025-12-30 11:12:01', '2025-12-30 11:12:01'),
(71, 21, 'पंचायत विवाह मित्र इंकम', 'ikama-3', '<p>इंकम&nbsp;</p>', 'uploads/products/1767112949832.V2F SHADI OFFER FLEX 2 X 3 = 50 PIC NORMAL A.jpg', 1, 1, NULL, '2025-12-30 11:12:29', '2025-12-30 11:29:11'),
(72, 19, 'इंकम', 'ikama-4', '<p>इंकम&nbsp;</p>', 'uploads/products/1767113113334.V2F SHADI OFFER FLEX 2 X 3 = 50 PIC NORMAL A.jpg', 1, 1, NULL, '2025-12-30 11:15:13', '2025-12-30 11:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `vivahmitra_product_images`
--

CREATE TABLE `vivahmitra_product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vivahmitra_product_images`
--

INSERT INTO `vivahmitra_product_images` (`id`, `product_id`, `image_path`, `created_at`, `updated_at`) VALUES
(76, 63, 'uploads/products/1766324992975.jpg', '2025-12-21 08:19:52', '2025-12-21 08:19:52'),
(77, 63, 'uploads/products/1766324992408.jpg', '2025-12-21 08:19:52', '2025-12-21 08:19:52'),
(78, 63, 'uploads/products/1766324992584.jpg', '2025-12-21 08:19:52', '2025-12-21 08:19:52'),
(79, 63, 'uploads/products/1766324992696.jpg', '2025-12-21 08:19:52', '2025-12-21 08:19:52'),
(80, 63, 'uploads/products/1766324992395.jpg', '2025-12-21 08:19:52', '2025-12-21 08:19:52'),
(86, 72, 'uploads/products/1767113245311.jpg', '2025-12-30 11:17:25', '2025-12-30 11:17:25'),
(87, 72, 'uploads/products/1767113245689.jpg', '2025-12-30 11:17:25', '2025-12-30 11:17:25'),
(88, 72, 'uploads/products/1767113245913.jpg', '2025-12-30 11:17:25', '2025-12-30 11:17:25'),
(89, 72, 'uploads/products/1767113245705.jpg', '2025-12-30 11:17:25', '2025-12-30 11:17:25'),
(90, 72, 'uploads/products/1767113245448.jpg', '2025-12-30 11:17:25', '2025-12-30 11:17:25'),
(91, 71, 'uploads/products/1767113951303.jpg', '2025-12-30 11:29:11', '2025-12-30 11:29:11'),
(92, 71, 'uploads/products/1767113951705.jpg', '2025-12-30 11:29:11', '2025-12-30 11:29:11'),
(93, 71, 'uploads/products/1767113951540.jpg', '2025-12-30 11:29:11', '2025-12-30 11:29:11'),
(94, 71, 'uploads/products/1767113951169.jpg', '2025-12-30 11:29:11', '2025-12-30 11:29:11'),
(95, 71, 'uploads/products/1767113951861.jpg', '2025-12-30 11:29:11', '2025-12-30 11:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `vivah_app_sliders`
--

CREATE TABLE `vivah_app_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vivah_app_sliders`
--

INSERT INTO `vivah_app_sliders` (`id`, `description`, `title`, `image`, `icon`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, NULL, NULL, 'uploads/all/1782197819917.jpg', NULL, 1, 1, NULL, '2026-06-23 06:56:59', '2026-06-23 06:56:59', NULL),
(22, NULL, NULL, 'uploads/all/1782197841501.jpg', NULL, 1, 1, NULL, '2026-06-23 06:57:21', '2026-06-23 06:57:21', NULL),
(23, NULL, NULL, 'uploads/all/1782197852973.jpg', NULL, 1, 1, NULL, '2026-06-23 06:57:32', '2026-06-23 06:57:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) NOT NULL,
  `owner_type` enum('company','branch','employee') NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `balance` decimal(12,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `owner_type`, `owner_id`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'company', 1, 1250000.00, '2026-04-08 21:19:05', '2026-05-25 16:16:58'),
(2, 'employee', 90, 41600.00, '2026-04-08 21:19:31', '2026-04-11 22:34:55'),
(3, 'employee', 92, 0.00, '2026-04-08 21:58:21', '2026-04-08 21:58:21'),
(4, 'branch', 1, 0.00, '2026-04-08 21:59:37', '2026-04-08 21:59:37'),
(5, 'employee', 97, 71600.00, '2026-04-11 01:21:41', '2026-04-12 00:53:48'),
(10, 'employee', 102, 87900.00, '2026-04-11 21:56:10', '2026-04-12 16:15:08'),
(11, 'employee', 103, 100000.00, '2026-04-11 22:11:48', '2026-04-11 22:12:33'),
(12, 'employee', 104, 100000.00, '2026-04-11 22:33:33', '2026-04-11 22:34:55'),
(13, 'employee', 105, 0.00, '2026-04-11 23:43:35', '2026-04-11 23:43:35'),
(15, 'employee', 107, 7900.00, '2026-04-12 00:05:33', '2026-04-12 01:03:01'),
(16, 'employee', 108, 0.00, '2026-04-12 00:27:59', '2026-04-12 00:27:59'),
(17, 'employee', 109, 10000.00, '2026-04-12 00:39:45', '2026-04-12 00:51:32'),
(18, 'employee', 110, 0.00, '2026-04-12 01:03:01', '2026-04-12 01:03:01'),
(19, 'employee', 111, 10000.00, '2026-04-12 16:13:55', '2026-04-12 16:15:08'),
(20, 'employee', 93, 0.00, '2026-04-15 06:11:44', '2026-04-15 06:11:44'),
(21, 'employee', 112, 98899.00, '2026-04-29 21:58:16', '2026-05-14 18:56:41'),
(22, 'employee', 113, 100000.00, '2026-04-29 22:34:08', '2026-04-29 22:39:38'),
(23, 'employee', 114, 0.00, '2026-05-14 18:56:41', '2026-05-14 18:56:41'),
(24, 'employee', 115, 0.00, '2026-05-21 14:22:54', '2026-05-21 14:22:54'),
(25, 'employee', 116, 0.00, '2026-05-21 15:06:20', '2026-05-21 15:06:20'),
(26, 'employee', 117, 0.00, '2026-05-21 15:07:27', '2026-05-21 15:07:27'),
(27, 'employee', 118, 0.00, '2026-05-21 15:08:38', '2026-05-21 15:08:38'),
(28, 'employee', 119, 0.00, '2026-05-21 15:27:33', '2026-05-21 15:27:33'),
(29, 'employee', 120, 0.00, '2026-05-21 15:29:10', '2026-05-21 15:29:10'),
(34, 'branch', 115, 439195.00, '2026-05-21 17:36:23', '2026-05-25 16:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `type` enum('credit','debit') DEFAULT NULL,
  `balance_before` decimal(12,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `balance_after` decimal(12,2) NOT NULL DEFAULT 0.00,
  `remarks` varchar(255) DEFAULT NULL,
  `debit_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `wallet_id`, `type`, `balance_before`, `amount`, `balance_after`, `remarks`, `debit_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'credit', 0.00, 500000.00, 500000.00, 'Company Fund Added: Company', NULL, '2026-04-11 00:13:15', '2026-04-11 00:13:15'),
(2, 1, 'debit', 0.00, 400000.00, 100000.00, 'Transfer to Employee : MAMTA MAHI', NULL, '2026-04-11 00:15:03', '2026-04-11 00:15:03'),
(3, 2, 'credit', 0.00, 400000.00, 400000.00, 'Received from Branch', NULL, '2026-04-11 00:15:03', '2026-04-11 00:15:03'),
(4, 2, 'debit', 0.00, 999.00, 399001.00, 'Membership Amount Deducted | Membership Number: 500723241673', NULL, '2026-04-11 00:22:10', '2026-04-11 00:22:10'),
(5, 2, 'debit', 0.00, 1101.00, 397900.00, 'Prakhand Vivah Mitra Registration | Name: SHILA DEVI | Mobile: 7370050601', NULL, '2026-04-11 01:21:41', '2026-04-11 01:21:41'),
(6, 2, 'debit', 0.00, 100000.00, 297900.00, 'Transfer to : SHILA DEVI (Prakhand Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-11 01:29:59', '2026-04-11 01:29:59'),
(7, 5, 'credit', 0.00, 100000.00, 100000.00, 'Received from : MAMTA MAHI (Jila Vivah Mitra)', NULL, '2026-04-11 01:29:59', '2026-04-11 01:29:59'),
(8, 5, 'debit', 0.00, 999.00, 99001.00, 'Membership Amount Deducted | Membership Number: 504533534385', NULL, '2026-04-11 01:39:38', '2026-04-11 01:39:38'),
(9, 2, 'debit', 0.00, 999.00, 296901.00, 'Membership Amount Deducted | Membership Number: 502811192005', NULL, '2026-04-11 13:27:53', '2026-04-11 13:27:53'),
(10, 2, 'debit', 0.00, 999.00, 295902.00, 'Membership Amount Deducted | Membership Number: 505658470254', NULL, '2026-04-11 21:44:16', '2026-04-11 21:44:16'),
(11, 2, 'debit', 0.00, 1101.00, 294801.00, 'Prakhand Vivah Mitra Registration | Name: RANI KUMARI | Mobile: 7667432479', NULL, '2026-04-11 21:56:10', '2026-04-11 21:56:10'),
(12, 2, 'debit', 0.00, 100000.00, 194801.00, 'Transfer to : RANI KUMARI (Prakhand Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-11 21:59:07', '2026-04-11 21:59:07'),
(13, 10, 'credit', 0.00, 100000.00, 100000.00, 'Received from : MAMTA MAHI (Jila Vivah Mitra)', NULL, '2026-04-11 21:59:07', '2026-04-11 21:59:07'),
(14, 2, 'debit', 0.00, 1101.00, 193700.00, 'Prakhand Vivah Mitra Registration | Name: MD LUKMAN | Mobile: 7519181217', NULL, '2026-04-11 22:11:48', '2026-04-11 22:11:48'),
(15, 2, 'debit', 0.00, 100000.00, 93700.00, 'Transfer to : MD LUKMAN (Prakhand Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-11 22:12:33', '2026-04-11 22:12:33'),
(16, 11, 'credit', 0.00, 100000.00, 100000.00, 'Received from : MAMTA MAHI (Jila Vivah Mitra)', NULL, '2026-04-11 22:12:33', '2026-04-11 22:12:33'),
(17, 1, 'debit', 0.00, 50000.00, 50000.00, 'Transfer to Employee : MAMTA MAHI', NULL, '2026-04-11 22:15:55', '2026-04-11 22:15:55'),
(18, 2, 'credit', 0.00, 50000.00, 143700.00, 'Received from Branch', NULL, '2026-04-11 22:15:55', '2026-04-11 22:15:55'),
(19, 2, 'debit', 0.00, 999.00, 142701.00, 'Membership Amount Deducted | Membership Number: 502845700242', NULL, '2026-04-11 22:30:11', '2026-04-11 22:30:11'),
(20, 2, 'debit', 0.00, 1101.00, 141600.00, 'Prakhand Vivah Mitra Registration | Name: MUNNI DEVI | Mobile: 9693083570', NULL, '2026-04-11 22:33:33', '2026-04-11 22:33:33'),
(21, 2, 'debit', 0.00, 100000.00, 41600.00, 'Transfer to : MUNNI DEVI (Prakhand Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-11 22:34:55', '2026-04-11 22:34:55'),
(22, 12, 'credit', 0.00, 100000.00, 100000.00, 'Received from : MAMTA MAHI (Jila Vivah Mitra)', NULL, '2026-04-11 22:34:55', '2026-04-11 22:34:55'),
(23, 5, 'debit', 0.00, 1101.00, 97900.00, 'Prakhand Vivah Mitra Registration | Name: USHA DEVI | Mobile: 8825171386', NULL, '2026-04-11 23:43:35', '2026-04-11 23:43:35'),
(24, 5, 'debit', 0.00, 999.00, 96901.00, 'Membership Amount Deducted | Membership Number: 508065153228', NULL, '2026-04-11 23:50:51', '2026-04-11 23:50:51'),
(25, 5, 'debit', 0.00, 1101.00, 95800.00, 'Panchayat Vivah Mitra Registration | Name: MUNNI DEVI | Mobile: 8825171145', NULL, '2026-04-12 00:05:33', '2026-04-12 00:05:33'),
(26, 5, 'debit', 0.00, 999.00, 94801.00, 'Membership Amount Deducted | Membership Number: 507071472358', NULL, '2026-04-12 00:17:07', '2026-04-12 00:17:07'),
(27, 5, 'debit', 0.00, 1101.00, 93700.00, 'Panchayat Vivah Mitra Registration | Name: SIKHA DEVI | Mobile: 9801080183', NULL, '2026-04-12 00:27:59', '2026-04-12 00:27:59'),
(28, 5, 'debit', 0.00, 999.00, 92701.00, 'Membership Amount Deducted | Membership Number: 506859017083', NULL, '2026-04-12 00:35:50', '2026-04-12 00:35:50'),
(29, 5, 'debit', 0.00, 1101.00, 91600.00, 'Panchayat Vivah Mitra Registration | Name: MUNNI HEMRAM | Mobile: 7261887617', NULL, '2026-04-12 00:39:45', '2026-04-12 00:39:45'),
(30, 5, 'debit', 0.00, 10000.00, 81600.00, 'Transfer to : MUNNI HEMRAM (Panchayat Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-12 00:51:32', '2026-04-12 00:51:32'),
(31, 17, 'credit', 0.00, 10000.00, 10000.00, 'Received from : SHILA DEVI (Prakhand Vivah Mitra)', NULL, '2026-04-12 00:51:32', '2026-04-12 00:51:32'),
(32, 5, 'debit', 0.00, 10000.00, 71600.00, 'Transfer to : MUNNI DEVI (Panchayat Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-12 00:53:48', '2026-04-12 00:53:48'),
(33, 15, 'credit', 0.00, 10000.00, 10000.00, 'Received from : SHILA DEVI (Prakhand Vivah Mitra)', NULL, '2026-04-12 00:53:48', '2026-04-12 00:53:48'),
(34, 15, 'debit', 0.00, 999.00, 9001.00, 'Membership Amount Deducted | Membership Number: 503323669261', NULL, '2026-04-12 00:57:55', '2026-04-12 00:57:55'),
(35, 15, 'debit', 0.00, 1101.00, 7900.00, 'Vivah Mitra Registration | Name: SUNITA DEVI | Mobile: 9102076058', NULL, '2026-04-12 01:03:01', '2026-04-12 01:03:01'),
(36, 10, 'debit', 0.00, 999.00, 99001.00, 'Membership Amount Deducted | Membership Number: 506915289402', NULL, '2026-04-12 15:59:18', '2026-04-12 15:59:18'),
(37, 10, 'debit', 0.00, 1101.00, 97900.00, 'Panchayat Vivah Mitra Registration | Name: RUTH TUDU | Mobile: 7909092094', NULL, '2026-04-12 16:13:55', '2026-04-12 16:13:55'),
(38, 10, 'debit', 0.00, 10000.00, 87900.00, 'Transfer to : RUTH TUDU (Panchayat Vivah Mitra)', 'transfer_to_vivah_mitra', '2026-04-12 16:15:08', '2026-04-12 16:15:08'),
(39, 19, 'credit', 0.00, 10000.00, 10000.00, 'Received from : RANI KUMARI (Prakhand Vivah Mitra)', NULL, '2026-04-12 16:15:08', '2026-04-12 16:15:08'),
(40, 1, 'credit', 0.00, 2000000.00, 2050000.00, 'Company Fund Added: ADMIN', NULL, '2026-04-29 22:13:13', '2026-04-29 22:13:13'),
(41, 1, 'debit', 0.00, 100000.00, 1950000.00, 'Transfer to Employee : MAHESH KUMAR SAH', NULL, '2026-04-29 22:14:27', '2026-04-29 22:14:27'),
(42, 21, 'credit', 0.00, 100000.00, 100000.00, 'Received from Branch', NULL, '2026-04-29 22:14:27', '2026-04-29 22:14:27'),
(43, 1, 'debit', 0.00, 100000.00, 1850000.00, 'Transfer to Employee : OM PRAKASH SAH', NULL, '2026-04-29 22:39:38', '2026-04-29 22:39:38'),
(44, 22, 'credit', 0.00, 100000.00, 100000.00, 'Received from Branch', NULL, '2026-04-29 22:39:38', '2026-04-29 22:39:38'),
(45, 21, 'debit', 0.00, 1101.00, 98899.00, 'Prakhand Vivah Mitra Registration | Name: SHILA DEVI | Mobile: 7370050602', NULL, '2026-05-14 18:56:41', '2026-05-14 18:56:41'),
(46, 34, 'debit', 0.00, 0.00, 0.00, 'Sale Amount Deducted | Sale ID: 12', NULL, '2026-05-21 17:36:23', '2026-05-21 17:36:23'),
(47, 1, 'debit', 0.00, 100000.00, 1750000.00, 'Transfer to Branch Manager : PURNIA', NULL, '2026-05-25 15:55:57', '2026-05-25 15:55:57'),
(48, 34, 'credit', 0.00, 100000.00, 100000.00, 'Received from Company', NULL, '2026-05-25 15:55:57', '2026-05-25 15:55:57'),
(49, 1, 'debit', 0.00, 500000.00, 1250000.00, 'Transfer to Branch Manager : PURNIA', NULL, '2026-05-25 16:16:58', '2026-05-25 16:16:58'),
(50, 34, 'credit', 0.00, 500000.00, 600000.00, 'Received from Company', NULL, '2026-05-25 16:16:58', '2026-05-25 16:16:58'),
(51, 34, 'debit', 0.00, 125570.00, 474430.00, 'Sale Amount Deducted | Sale ID: 13', NULL, '2026-05-25 16:17:04', '2026-05-25 16:17:04'),
(52, 34, 'debit', 0.00, 11745.00, 462685.00, 'Sale Amount Deducted | Sale ID: 14', NULL, '2026-05-25 16:26:05', '2026-05-25 16:26:05'),
(53, 34, 'debit', 0.00, 11745.00, 450940.00, 'Sale Amount Deducted | Sale ID: 15', NULL, '2026-05-25 16:28:39', '2026-05-25 16:28:39'),
(54, 34, 'debit', 0.00, 11745.00, 439195.00, 'Sale Amount Deducted | Sale ID: 16', NULL, '2026-05-25 16:31:36', '2026-05-25 16:31:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admit_cards`
--
ALTER TABLE `admit_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admit_card_subjects`
--
ALTER TABLE `admit_card_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliations`
--
ALTER TABLE `affiliations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `associates`
--
ALTER TABLE `associates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendances_user_id_date_unique` (`user_id`,`date`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_products`
--
ALTER TABLE `branch_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_branch_product` (`branch_id`,`product_id`);

--
-- Indexes for table `branch_wallets`
--
ALTER TABLE `branch_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_solutions`
--
ALTER TABLE `business_solutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_stocks`
--
ALTER TABLE `card_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_transactions`
--
ALTER TABLE `card_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_entries`
--
ALTER TABLE `cash_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_entry_details`
--
ALTER TABLE `cash_entry_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_entry_id` (`cash_entry_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_leads`
--
ALTER TABLE `customer_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_posts`
--
ALTER TABLE `customer_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_posts_slug_unique` (`slug`),
  ADD KEY `customer_posts_user_id_status_index` (`user_id`,`status`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_visits`
--
ALTER TABLE `doctor_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_targets`
--
ALTER TABLE `employee_targets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollment_years`
--
ALTER TABLE `enrollment_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `year` (`year`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_galleries`
--
ALTER TABLE `event_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_expense_group` (`group_id`),
  ADD KEY `fk_expense_sub_group` (`sub_group_id`);

--
-- Indexes for table `expense_groups`
--
ALTER TABLE `expense_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_sub_groups`
--
ALTER TABLE `expense_sub_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sub_group_group` (`group_id`);

--
-- Indexes for table `e_wallets`
--
ALTER TABLE `e_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_wallet_transactions`
--
ALTER TABLE `e_wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hire_teams`
--
ALTER TABLE `hire_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_meeting_details`
--
ALTER TABLE `home_meeting_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_categories`
--
ALTER TABLE `image_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry_cms_pages`
--
ALTER TABLE `industry_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry_page_sections`
--
ALTER TABLE `industry_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry_section_datas`
--
ALTER TABLE `industry_section_datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_enquiries`
--
ALTER TABLE `job_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kit_stocks`
--
ALTER TABLE `kit_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kit_transactions`
--
ALTER TABLE `kit_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_results`
--
ALTER TABLE `manual_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_result_subjects`
--
ALTER TABLE `manual_result_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_agreements`
--
ALTER TABLE `master_agreements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_designations`
--
ALTER TABLE `master_designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_funds`
--
ALTER TABLE `master_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_kit_numbers`
--
ALTER TABLE `master_kit_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_memberships`
--
ALTER TABLE `master_memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_notices`
--
ALTER TABLE `master_notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_offers`
--
ALTER TABLE `master_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_partners`
--
ALTER TABLE `master_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_prices`
--
ALTER TABLE `master_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_products`
--
ALTER TABLE `master_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_properties`
--
ALTER TABLE `master_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_semesters`
--
ALTER TABLE `master_semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_services`
--
ALTER TABLE `master_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_shops`
--
ALTER TABLE `master_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_solutions`
--
ALTER TABLE `master_solutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_targets`
--
ALTER TABLE `master_targets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_tnc_videos`
--
ALTER TABLE `master_tnc_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_vendors`
--
ALTER TABLE `master_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owner_email` (`owner_email`);

--
-- Indexes for table `master_videos`
--
ALTER TABLE `master_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_vivahmitra_codes`
--
ALTER TABLE `master_vivahmitra_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_wards`
--
ALTER TABLE `master_wards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_yearly_bonuses`
--
ALTER TABLE `master_yearly_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_messages`
--
ALTER TABLE `member_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_routines`
--
ALTER TABLE `monthly_routines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_video_categories`
--
ALTER TABLE `m_video_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_enquiries`
--
ALTER TABLE `online_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panchayats`
--
ALTER TABLE `panchayats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_sections`
--
ALTER TABLE `partner_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_section_datas`
--
ALTER TABLE `partner_section_datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_screenshots`
--
ALTER TABLE `payment_screenshots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payment_id` (`payment_id`);

--
-- Indexes for table `payment_submissions`
--
ALTER TABLE `payment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `payment_temps`
--
ALTER TABLE `payment_temps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prakhand_vm_boxes`
--
ALTER TABLE `prakhand_vm_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing_enqs`
--
ALTER TABLE `pricing_enqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing_types`
--
ALTER TABLE `pricing_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_products_category` (`category_id`),
  ADD KEY `fk_products_brand` (`brand_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sections`
--
ALTER TABLE `product_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_section_datas`
--
ALTER TABLE `product_section_datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_enquiries`
--
ALTER TABLE `property_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_features`
--
ALTER TABLE `property_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_feature_values`
--
ALTER TABLE `property_feature_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_tours`
--
ALTER TABLE `property_tours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_videos`
--
ALTER TABLE `property_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_videos_property_id_foreign` (`property_id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruited_students`
--
ALTER TABLE `recruited_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_subjects`
--
ALTER TABLE `result_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_meetings`
--
ALTER TABLE `schedule_meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_datas`
--
ALTER TABLE `section_datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seminar_guest_meeting_details`
--
ALTER TABLE `seminar_guest_meeting_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_pages`
--
ALTER TABLE `service_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_sections`
--
ALTER TABLE `service_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_section_datas`
--
ALTER TABLE `service_section_datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solution_sections`
--
ALTER TABLE `solution_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solution_section_datas`
--
ALTER TABLE `solution_section_datas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_courses`
--
ALTER TABLE `sub_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_cash_entries`
--
ALTER TABLE `temp_cash_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_cash_entry_details`
--
ALTER TABLE `temp_cash_entry_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temp_cash_entry_id` (`temp_cash_entry_id`);

--
-- Indexes for table `tenders`
--
ALTER TABLE `tenders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_details`
--
ALTER TABLE `training_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_assigned_bonuses`
--
ALTER TABLE `user_assigned_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_assigned_videos`
--
ALTER TABLE `user_assigned_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_designations`
--
ALTER TABLE `user_designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_districts`
--
ALTER TABLE `user_districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_district_unique` (`user_id`,`district_id`),
  ADD KEY `fk_user_districts_district` (`district_id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_navigations`
--
ALTER TABLE `user_navigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_shops`
--
ALTER TABLE `user_shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_shop_unique` (`user_id`,`master_shop_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_shop_id` (`master_shop_id`);

--
-- Indexes for table `user_targets`
--
ALTER TABLE `user_targets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_categories`
--
ALTER TABLE `video_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vivahmitra_categories`
--
ALTER TABLE `vivahmitra_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `vivahmitra_products`
--
ALTER TABLE `vivahmitra_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_vivahmitra_products_category` (`category_id`);

--
-- Indexes for table `vivahmitra_product_images`
--
ALTER TABLE `vivahmitra_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vivahmitra_product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `vivah_app_sliders`
--
ALTER TABLE `vivah_app_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admit_cards`
--
ALTER TABLE `admit_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admit_card_subjects`
--
ALTER TABLE `admit_card_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliations`
--
ALTER TABLE `affiliations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `associates`
--
ALTER TABLE `associates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_likes`
--
ALTER TABLE `blog_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_views`
--
ALTER TABLE `blog_views`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branch_products`
--
ALTER TABLE `branch_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `branch_wallets`
--
ALTER TABLE `branch_wallets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `business_solutions`
--
ALTER TABLE `business_solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_stocks`
--
ALTER TABLE `card_stocks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `card_transactions`
--
ALTER TABLE `card_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cash_entries`
--
ALTER TABLE `cash_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cash_entry_details`
--
ALTER TABLE `cash_entry_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_leads`
--
ALTER TABLE `customer_leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_posts`
--
ALTER TABLE `customer_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=647;

--
-- AUTO_INCREMENT for table `doctor_visits`
--
ALTER TABLE `doctor_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_targets`
--
ALTER TABLE `employee_targets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `enrollment_years`
--
ALTER TABLE `enrollment_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_galleries`
--
ALTER TABLE `event_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_groups`
--
ALTER TABLE `expense_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `expense_sub_groups`
--
ALTER TABLE `expense_sub_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `e_wallets`
--
ALTER TABLE `e_wallets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `e_wallet_transactions`
--
ALTER TABLE `e_wallet_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `hire_teams`
--
ALTER TABLE `hire_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `home_meeting_details`
--
ALTER TABLE `home_meeting_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image_categories`
--
ALTER TABLE `image_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `industry_cms_pages`
--
ALTER TABLE `industry_cms_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industry_page_sections`
--
ALTER TABLE `industry_page_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industry_section_datas`
--
ALTER TABLE `industry_section_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_enquiries`
--
ALTER TABLE `job_enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kit_stocks`
--
ALTER TABLE `kit_stocks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kit_transactions`
--
ALTER TABLE `kit_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manual_results`
--
ALTER TABLE `manual_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `manual_result_subjects`
--
ALTER TABLE `manual_result_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_agreements`
--
ALTER TABLE `master_agreements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_designations`
--
ALTER TABLE `master_designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_funds`
--
ALTER TABLE `master_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_kit_numbers`
--
ALTER TABLE `master_kit_numbers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `master_memberships`
--
ALTER TABLE `master_memberships`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1272;

--
-- AUTO_INCREMENT for table `master_notices`
--
ALTER TABLE `master_notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `master_offers`
--
ALTER TABLE `master_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `master_partners`
--
ALTER TABLE `master_partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_prices`
--
ALTER TABLE `master_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `master_products`
--
ALTER TABLE `master_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_properties`
--
ALTER TABLE `master_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_semesters`
--
ALTER TABLE `master_semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_services`
--
ALTER TABLE `master_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `master_shops`
--
ALTER TABLE `master_shops`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_solutions`
--
ALTER TABLE `master_solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `master_targets`
--
ALTER TABLE `master_targets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_tnc_videos`
--
ALTER TABLE `master_tnc_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `master_vendors`
--
ALTER TABLE `master_vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_videos`
--
ALTER TABLE `master_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `master_vivahmitra_codes`
--
ALTER TABLE `master_vivahmitra_codes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `master_wards`
--
ALTER TABLE `master_wards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_yearly_bonuses`
--
ALTER TABLE `master_yearly_bonuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `member_messages`
--
ALTER TABLE `member_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `monthly_routines`
--
ALTER TABLE `monthly_routines`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_video_categories`
--
ALTER TABLE `m_video_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `online_enquiries`
--
ALTER TABLE `online_enquiries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `panchayats`
--
ALTER TABLE `panchayats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `partner_sections`
--
ALTER TABLE `partner_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_section_datas`
--
ALTER TABLE `partner_section_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_screenshots`
--
ALTER TABLE `payment_screenshots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_submissions`
--
ALTER TABLE `payment_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_temps`
--
ALTER TABLE `payment_temps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prakhand_vm_boxes`
--
ALTER TABLE `prakhand_vm_boxes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `pricing_enqs`
--
ALTER TABLE `pricing_enqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `pricing_types`
--
ALTER TABLE `pricing_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `product_sections`
--
ALTER TABLE `product_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_section_datas`
--
ALTER TABLE `product_section_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property_enquiries`
--
ALTER TABLE `property_enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `property_features`
--
ALTER TABLE `property_features`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `property_feature_values`
--
ALTER TABLE `property_feature_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `property_tours`
--
ALTER TABLE `property_tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `property_videos`
--
ALTER TABLE `property_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recruited_students`
--
ALTER TABLE `recruited_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `result_subjects`
--
ALTER TABLE `result_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `schedule_meetings`
--
ALTER TABLE `schedule_meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `section_datas`
--
ALTER TABLE `section_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seminar_guest_meeting_details`
--
ALTER TABLE `seminar_guest_meeting_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_pages`
--
ALTER TABLE `service_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_sections`
--
ALTER TABLE `service_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_section_datas`
--
ALTER TABLE `service_section_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `solution_sections`
--
ALTER TABLE `solution_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solution_section_datas`
--
ALTER TABLE `solution_section_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sub_courses`
--
ALTER TABLE `sub_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `temp_cash_entries`
--
ALTER TABLE `temp_cash_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `temp_cash_entry_details`
--
ALTER TABLE `temp_cash_entry_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tenders`
--
ALTER TABLE `tenders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `training_details`
--
ALTER TABLE `training_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `user_assigned_bonuses`
--
ALTER TABLE `user_assigned_bonuses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_assigned_videos`
--
ALTER TABLE `user_assigned_videos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_designations`
--
ALTER TABLE `user_designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_districts`
--
ALTER TABLE `user_districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_navigations`
--
ALTER TABLE `user_navigations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_shops`
--
ALTER TABLE `user_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_targets`
--
ALTER TABLE `user_targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `video_categories`
--
ALTER TABLE `video_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vivahmitra_categories`
--
ALTER TABLE `vivahmitra_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `vivahmitra_products`
--
ALTER TABLE `vivahmitra_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `vivahmitra_product_images`
--
ALTER TABLE `vivahmitra_product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `vivah_app_sliders`
--
ALTER TABLE `vivah_app_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cash_entry_details`
--
ALTER TABLE `cash_entry_details`
  ADD CONSTRAINT `cash_entry_details_ibfk_1` FOREIGN KEY (`cash_entry_id`) REFERENCES `cash_entries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_screenshots`
--
ALTER TABLE `payment_screenshots`
  ADD CONSTRAINT `fk_payment_screenshots_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_videos`
--
ALTER TABLE `property_videos`
  ADD CONSTRAINT `property_videos_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_cash_entry_details`
--
ALTER TABLE `temp_cash_entry_details`
  ADD CONSTRAINT `temp_cash_entry_details_ibfk_1` FOREIGN KEY (`temp_cash_entry_id`) REFERENCES `temp_cash_entries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_districts`
--
ALTER TABLE `user_districts`
  ADD CONSTRAINT `fk_user_districts_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_districts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vivahmitra_products`
--
ALTER TABLE `vivahmitra_products`
  ADD CONSTRAINT `fk_vivahmitra_products_category` FOREIGN KEY (`category_id`) REFERENCES `vivahmitra_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vivahmitra_product_images`
--
ALTER TABLE `vivahmitra_product_images`
  ADD CONSTRAINT `vivahmitra_product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `vivahmitra_products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
