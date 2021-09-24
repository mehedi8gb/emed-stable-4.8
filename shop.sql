-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2021 at 02:41 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4.8`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(1, 'delivery_boy', 'delivery_boy', '1.0', 1, 'delivery_boy.png', '2021-06-26 01:24:04', '2021-06-26 01:24:04'),
(2, 'OTP', 'otp_system', '1.4', 0, 'otp_system.jpg', '2021-06-26 01:36:18', '2021-07-29 13:29:59'),
(3, 'affiliate', 'affiliate_system', '1.6', 1, 'affiliate_banner.jpg', '2021-06-26 01:41:35', '2021-06-26 01:41:35'),
(4, 'Point of Sale', 'pos_system', '1.5', 1, 'pos_banner.jpg', '2021-06-26 01:42:06', '2021-06-26 01:42:06'),
(5, 'Seller Subscription System', 'seller_subscription', '1.0', 0, 'seller_subscription.jpg', '2021-07-07 22:16:44', '2021-08-20 16:42:16'),
(6, 'Offline Payment', 'offline_payment', '1.3', 1, 'offline_banner.jpg', '2021-07-07 22:40:49', '2021-07-07 22:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `city`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(1, 8, 'sanarpar collage road', 'Bangladesh', 'Dhaka', '1360', '01635354223', 0, '2021-06-27 19:14:55', '2021-06-28 12:34:55'),
(2, 8, 'West box nogar, Shantidhara Abashik elaka, Safiuddin Market - Sanarper College Rd', 'Bangladesh', 'Dhaka', '1361', '01902549358', 0, '2021-06-27 19:15:10', '2021-06-27 19:15:10'),
(3, 8, 'damra', 'Bangladesh', 'Dhaka', '1361', '01635 354223', 0, '2021-06-27 21:51:33', '2021-06-28 12:26:49'),
(4, 12, 'East Boxnagor, Sarulia, Demra, Dhaka-1361', 'Bangladesh', 'Dhaka', '1361', '01777049429', 0, '2021-08-20 07:51:26', '2021-08-20 07:51:26'),
(5, 8, 'kalihati tangail', 'Bangladesh', 'Dhaka', '454', '01715153033', 0, '2021-08-20 08:02:33', '2021-08-20 08:02:33'),
(6, 3, 'East Boxnagor, Sarulia, Demra, Dhaka-1361', 'Bangladesh', 'Dhaka', '1361', '01777049429', 0, '2021-08-28 19:17:14', '2021-08-28 19:17:14'),
(7, 9, 'East Boxnagor, Sarulia, Demra, Dhaka-1361', 'Bangladesh', 'Dhaka', '1361', '01777049429', 0, '2021-09-21 00:12:01', '2021-09-21 00:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]', '2020-03-09 09:56:21', '2020-03-09 04:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_logs`
--

CREATE TABLE `affiliate_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `referred_by_user` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `affiliate_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_options`
--

INSERT INTO `affiliate_options` (`id`, `type`, `details`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'user_registration_first_purchase', NULL, 20, 1, '2020-03-03 05:08:37', '2020-03-05 03:56:30'),
(3, 'product_sharing', NULL, 20, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32'),
(4, 'category_wise_affiliate', NULL, 0, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_payments`
--

INSERT INTO `affiliate_payments` (`id`, `affiliate_user_id`, `amount`, `payment_method`, `payment_details`, `created_at`, `updated_at`) VALUES
(2, 1, 20.00, 'Paypal', NULL, '2020-03-10 02:04:30', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_stats`
--

CREATE TABLE `affiliate_stats` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `no_of_click` int(11) NOT NULL DEFAULT 0,
  `no_of_order_item` int(11) NOT NULL DEFAULT 0,
  `no_of_delivered` int(11) NOT NULL DEFAULT 0,
  `no_of_cancel` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `paypal_email`, `bank_information`, `user_id`, `informations`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demo@gmail.com', '123456', 8, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]', 30.00, 1, '2020-03-09 05:35:07', '2021-08-21 20:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdraw_requests`
--

CREATE TABLE `affiliate_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'EMed Ltd', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 16:39:15', '2019-08-04 16:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2020-02-24 05:55:07', '2020-02-24 05:55:07'),
(2, 'Fabric', '2020-02-24 05:55:13', '2020-02-24 05:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `color_code` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `url`, `position`, `published`, `created_at`, `updated_at`) VALUES
(4, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-03-12 05:58:23', '2019-06-11 04:56:50'),
(5, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-03-12 05:58:41', '2019-03-12 05:58:57'),
(6, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-03-12 05:58:52', '2019-03-12 05:58:57'),
(7, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-05-26 05:16:38', '2019-05-26 05:17:34'),
(8, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-06-11 05:00:06', '2019-06-11 05:00:27'),
(9, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-06-11 05:00:15', '2019-06-11 05:00:29'),
(10, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-06-11 05:00:24', '2019-06-11 05:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_img` int(11) DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `slug`, `short_description`, `description`, `banner`, `meta_title`, `meta_img`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Pakistani Arabic Bridal', 'pakistani-arabic-bridal', 'erger', '<p>ergerg</p>', NULL, 'erg', NULL, 'erg', 'erg', 1, '2021-07-04 19:49:24', '2021-08-21 20:59:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `top`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(0, '', NULL, 0, '', NULL, '', '2021-08-23 11:50:46', '2021-08-23 11:50:46'),
(3, 'Beximco Pharmaceuticals Ltd', '2', 0, 'Beximco-Pharmaceuticals-Ltd-A4v8b', 'Beximco Pharmaceuticals Ltd', 'Beximco Pharmaceuticals Ltd', '2021-07-08 02:07:05', '2021-07-08 02:07:05'),
(4, 'ACME Laboratories Ltd.', '15', 0, 'acme-laboratories-ltd-9pc9b', 'ACME Laboratories Ltd.', NULL, '2021-07-29 14:48:11', '2021-07-29 14:49:13'),
(5, 'Healthcare Pharmaceuticals Ltd.', NULL, 0, 'Healthcare-Pharmaceuticals-Ltd-qJK38', 'Healthcare Pharmaceuticals Ltd.', NULL, '2021-07-29 15:31:14', '2021-07-29 15:31:14'),
(6, 'Beacon Pharmaceuticals Ltd.', NULL, 0, 'Beacon-Pharmaceuticals-Ltd-DcYEc', 'Beacon Pharmaceuticals Ltd.', NULL, '2021-07-29 15:36:38', '2021-07-29 15:36:38'),
(7, 'Square Pharmaceuticals Ltd.', NULL, 0, 'Square-Pharmaceuticals-Ltd-kKEDD', 'Square Pharmaceuticals Ltd.', NULL, '2021-07-29 15:39:07', '2021-07-29 15:39:07'),
(8, 'ZAS Corporation', NULL, 0, 'ZAS-Corporation-dsPuJ', 'ZAS Corporation', NULL, '2021-07-31 15:57:40', '2021-07-31 15:57:40'),
(9, 'Techno Drugs Ltd.', NULL, 0, 'Techno-Drugs-Ltd-VHU5K', 'Techno Drugs Ltd.', NULL, '2021-07-31 16:19:57', '2021-07-31 16:19:57'),
(10, 'Drug International Ltd.', NULL, 0, 'Drug-International-Ltd-Lrvgu', 'Drug International Ltd.', NULL, '2021-07-31 16:20:18', '2021-07-31 16:20:18'),
(11, 'Eskayef Pharmaceuticals Ltd.', NULL, 0, 'Eskayef-Pharmaceuticals-Ltd-s4GTY', 'Eskayef Pharmaceuticals Ltd.', NULL, '2021-07-31 16:20:44', '2021-07-31 16:20:44'),
(13, 'Prime Pharmaceuticals Ltd.', NULL, 0, 'Prime-Pharmaceuticals-Ltd-B5hSH', 'Prime Pharmaceuticals Ltd.', 'Prime Pharmaceuticals Ltd.', '2021-08-06 13:44:29', '2021-08-06 13:44:29'),
(14, 'Incepta Pharmaceuticals Ltd.', NULL, 0, 'Incepta-Pharmaceuticals-Ltd-TgA2m', 'Incepta Pharmaceuticals Ltd.', NULL, '2021-08-23 11:47:29', '2021-08-23 11:47:29'),
(15, 'Opsonin Pharma Ltd.', NULL, 0, 'Opsonin-Pharma-Ltd-Bxshj', NULL, 'Opsonin Pharma Ltd.', '2021-08-23 11:50:46', '2021-08-23 11:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand_translations`
--

INSERT INTO `brand_translations` (`id`, `brand_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 3, 'Beximco Pharmaceuticals Ltd', 'en', '2021-07-08 02:07:05', '2021-07-08 02:07:05'),
(2, 4, 'ACME Laboratories Ltd.', 'en', '2021-07-29 14:48:11', '2021-07-29 14:48:11'),
(3, 5, 'Healthcare Pharmaceuticals Ltd.', 'en', '2021-07-29 15:31:14', '2021-07-29 15:31:14'),
(4, 6, 'Beacon Pharmaceuticals Ltd.', 'en', '2021-07-29 15:36:38', '2021-07-29 15:36:38'),
(5, 7, 'Square Pharmaceuticals Ltd.', 'en', '2021-07-29 15:39:07', '2021-07-29 15:39:07'),
(6, 8, 'ZAS Corporation', 'en', '2021-07-31 15:57:40', '2021-07-31 15:57:40'),
(7, 9, 'Techno Drugs Ltd.', 'en', '2021-07-31 16:19:57', '2021-07-31 16:19:57'),
(8, 10, 'Drug International Ltd.', 'en', '2021-07-31 16:20:18', '2021-07-31 16:20:18'),
(9, 11, 'Eskayef Pharmaceuticals Ltd.', 'en', '2021-07-31 16:20:44', '2021-07-31 16:20:44'),
(11, 13, 'Prime Pharmaceuticals Ltd.', 'en', '2021-08-06 13:44:29', '2021-08-06 13:44:29'),
(12, 14, 'Incepta Pharmaceuticals Ltd.', 'en', '2021-08-23 11:47:29', '2021-08-23 11:47:29'),
(13, 15, 'Opsonin Pharma Ltd.', 'en', '2021-08-23 11:50:46', '2021-08-23 11:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '27', '2018-10-16 01:35:52', '2021-06-26 01:15:47'),
(2, 'system_default_currency', '27', '2018-10-16 01:36:58', '2021-06-26 01:15:47'),
(3, 'currency_format', '1', '2018-10-17 03:01:59', '2018-10-17 03:01:59'),
(4, 'symbol_format', '1', '2018-10-17 03:01:59', '2019-01-20 02:10:55'),
(5, 'no_of_decimals', '2', '2018-10-17 03:01:59', '2021-07-06 00:30:13'),
(6, 'product_activation', '1', '2018-10-28 01:38:37', '2019-02-04 01:11:41'),
(7, 'vendor_system_activation', '1', '2018-10-28 07:44:16', '2019-02-04 01:11:38'),
(8, 'show_vendors', '1', '2018-10-28 07:44:47', '2019-02-04 01:11:13'),
(9, 'paypal_payment', '1', '2018-10-28 07:45:16', '2021-06-26 11:20:49'),
(10, 'stripe_payment', '0', '2018-10-28 07:45:47', '2018-11-14 01:51:51'),
(11, 'cash_payment', '1', '2018-10-28 07:46:05', '2019-01-24 03:40:18'),
(12, 'payumoney_payment', '0', '2018-10-28 07:46:27', '2019-03-05 05:41:36'),
(13, 'best_selling', '1', '2018-12-24 08:13:44', '2019-02-14 05:29:13'),
(14, 'paypal_sandbox', '1', '2019-01-16 12:44:18', '2021-07-06 01:14:20'),
(15, 'sslcommerz_sandbox', '1', '2019-01-16 12:44:18', '2019-03-14 00:07:26'),
(16, 'sslcommerz_payment', '1', '2019-01-24 09:39:07', '2021-06-26 11:20:47'),
(17, 'vendor_commission', '20', '2019-01-31 06:18:04', '2019-04-13 06:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]', '2019-02-03 11:36:58', '2019-02-16 06:14:42'),
(19, 'google_analytics', '0', '2019-02-06 12:22:35', '2019-02-06 12:22:35'),
(20, 'facebook_login', '1', '2019-02-07 12:51:59', '2021-06-26 11:20:57'),
(21, 'google_login', '0', '2019-02-07 12:52:10', '2021-08-29 01:08:08'),
(22, 'twitter_login', '0', '2019-02-07 12:52:20', '2019-02-08 02:32:56'),
(23, 'payumoney_payment', '1', '2019-03-05 11:38:17', '2019-03-05 11:38:17'),
(24, 'payumoney_sandbox', '1', '2019-03-05 11:38:17', '2019-03-05 05:39:18'),
(36, 'facebook_chat', '1', '2019-04-15 11:45:04', '2021-08-29 01:15:41'),
(37, 'email_verification', '1', '2019-04-30 07:30:07', '2021-06-26 11:20:40'),
(38, 'wallet_system', '0', '2019-05-19 08:05:44', '2021-07-13 11:51:00'),
(39, 'coupon_system', '0', '2019-06-11 09:46:18', '2021-08-25 09:46:20'),
(40, 'current_version', '4.8', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(41, 'instamojo_payment', '0', '2019-07-06 09:58:03', '2019-07-06 09:58:03'),
(42, 'instamojo_sandbox', '1', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(43, 'razorpay', '0', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(44, 'paystack', '0', '2019-07-21 13:00:38', '2019-07-21 13:00:38'),
(45, 'pickup_point', '1', '2019-10-17 11:50:39', '2021-08-29 01:10:55'),
(46, 'maintenance_mode', '0', '2019-10-17 11:51:04', '2019-10-17 11:51:04'),
(47, 'voguepay', '0', '2019-10-17 11:51:24', '2019-10-17 11:51:24'),
(48, 'voguepay_sandbox', '0', '2019-10-17 11:51:38', '2019-10-17 11:51:38'),
(50, 'category_wise_commission', '1', '2020-01-21 07:22:47', '2021-08-29 01:11:45'),
(51, 'conversation_system', '1', '2020-01-21 07:23:21', '2021-08-29 01:13:07'),
(52, 'guest_checkout_active', '1', '2020-01-22 07:36:38', '2020-01-22 07:36:38'),
(53, 'facebook_pixel', '0', '2020-01-22 11:43:58', '2020-01-22 11:43:58'),
(55, 'classified_product', '0', '2020-05-13 13:01:05', '2021-08-29 01:10:50'),
(56, 'pos_activation_for_seller', '1', '2020-06-11 09:45:02', '2020-06-11 09:45:02'),
(57, 'shipping_type', 'product_wise_shipping', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(58, 'flat_rate_shipping_cost', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(59, 'shipping_cost_admin', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(60, 'payhere_sandbox', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(61, 'payhere', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(62, 'google_recaptcha', '0', '2020-08-17 07:13:37', '2021-09-08 11:43:37'),
(63, 'ngenius', '0', '2020-09-22 10:58:21', '2020-09-22 10:58:21'),
(64, 'header_logo', '1', '2020-11-16 07:26:36', '2021-06-26 13:25:35'),
(65, 'show_language_switcher', 'on', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(66, 'show_currency_switcher', NULL, '2020-11-16 07:26:36', '2021-06-26 11:28:00'),
(67, 'header_stikcy', 'on', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(68, 'footer_logo', '1', '2020-11-16 07:26:36', '2021-06-26 13:26:22'),
(69, 'about_us_description', 'Lorem Ipsum is simply a dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-11-16 07:26:36', '2021-08-24 00:12:45'),
(70, 'contact_address', 'East Boxnagor, Sarulia, Demra, Dhaka-1361', '2020-11-16 07:26:36', '2021-08-24 00:11:04'),
(71, 'contact_phone', '+8801777049429', '2020-11-16 07:26:36', '2021-08-29 00:46:38'),
(72, 'contact_email', 'support@emed.com.bd', '2020-11-16 07:26:36', '2021-08-24 00:11:04'),
(73, 'widget_one_labels', '[\"Our Labs\",\"Career\",\"Meet a Doctor\",\"Privacy Policy\",\"Terms & Conditions\"]', '2020-11-16 07:26:36', '2021-08-29 01:36:06'),
(74, 'widget_one_links', '[\"http:\\/\\/localhost\\/4.8\\/labs\",\"http:\\/\\/localhost\\/4.8\\/career\",\"http:\\/\\/localhost\\/4.8\\/doctors\",\"https:\\/\\/www.emed.com.bd\\/privacypolicy\",\"https:\\/\\/www.emed.com.bd\\/terms\"]', '2020-11-16 07:26:36', '2021-08-29 01:36:06'),
(75, 'widget_one', 'Quick Links', '2020-11-16 07:26:36', '2021-08-29 00:16:38'),
(76, 'frontend_copyright_text', '<p>&nbsp;®&nbsp; ALL RIGHTS RESERVED BY EMED HEALTH TECHNOLOGY PRIVATE LTD.</p>', '2020-11-16 07:26:36', '2021-08-29 01:54:38'),
(77, 'show_social_links', 'on', '2020-11-16 07:26:36', '2021-08-29 00:39:18'),
(78, 'facebook_link', 'https://www.facebook.com/emed.com.bd', '2020-11-16 07:26:36', '2021-08-29 00:39:18'),
(79, 'twitter_link', '#', '2020-11-16 07:26:36', '2021-08-29 00:39:18'),
(80, 'instagram_link', '#', '2020-11-16 07:26:36', '2021-08-29 00:39:18'),
(81, 'youtube_link', '#', '2020-11-16 07:26:36', '2021-08-29 00:39:18'),
(82, 'linkedin_link', '#', '2020-11-16 07:26:36', '2021-08-29 00:39:18'),
(83, 'payment_method_images', '58,59,61,63', '2020-11-16 07:26:36', '2021-08-29 00:43:34'),
(84, 'home_slider_images', '[\"35\",\"40\",\"41\",\"42\",\"32\"]', '2020-11-16 07:26:36', '2021-08-21 10:30:38'),
(85, 'home_slider_links', '[null,null,null,null,null]', '2020-11-16 07:26:36', '2021-08-21 10:30:38'),
(86, 'home_banner1_images', '[]', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(87, 'home_banner1_links', '[]', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(88, 'home_banner2_images', '[]', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(89, 'home_banner2_links', '[]', '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(90, 'home_categories', '[\"1\",\"6\",\"7\",\"8\"]', '2020-11-16 07:26:36', '2021-08-20 16:12:13'),
(91, 'top10_categories', '[\"1\",\"6\",\"7\",\"8\"]', '2020-11-16 07:26:36', '2021-08-20 16:12:31'),
(92, 'top10_brands', '[\"3\",\"4\",\"5\",\"6\",\"7\"]', '2020-11-16 07:26:36', '2021-08-20 16:12:31'),
(93, 'website_name', 'eMed', '2020-11-16 07:26:36', '2021-06-26 11:26:12'),
(94, 'site_motto', 'The Best Ecommerce Platform on the internet.', '2020-11-16 07:26:36', '2021-06-26 11:26:12'),
(95, 'site_icon', '1', '2020-11-16 07:26:36', '2021-06-26 11:26:12'),
(96, 'base_color', '#25bcf1', '2020-11-16 07:26:36', '2021-08-07 01:38:25'),
(97, 'base_hov_color', '#377dff', '2020-11-16 07:26:36', '2021-08-07 01:38:25'),
(98, 'meta_title', 'eMed', '2020-11-16 07:26:36', '2021-08-26 19:59:47'),
(99, 'meta_description', 'The Best Ecommerce Platform on the internet.', '2020-11-16 07:26:36', '2021-08-26 19:59:47'),
(100, 'meta_keywords', 'emed,', '2020-11-16 07:26:36', '2021-08-26 19:59:47'),
(101, 'meta_image', '35', '2020-11-16 07:26:36', '2021-08-26 19:59:47'),
(102, 'site_name', 'Emed', '2020-11-16 07:26:36', '2021-06-26 11:21:48'),
(103, 'system_logo_white', '1', '2020-11-16 07:26:36', '2021-06-26 11:21:48'),
(104, 'system_logo_black', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(105, 'timezone', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(106, 'admin_login_background', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(107, 'iyzico_sandbox', '1', '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(108, 'iyzico', '1', '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(109, 'decimal_separator', '1', '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(110, 'nagad', '0', '2021-01-22 10:30:03', '2021-08-25 09:33:37'),
(111, 'bkash', '1', '2021-01-22 10:30:03', '2021-06-26 11:20:53'),
(112, 'bkash_sandbox', '1', '2021-01-22 10:30:03', '2021-01-22 10:30:03'),
(113, 'header_menu_labels', '[\"Home\",\"Blogs\",\"Company\",\"Categories\",\"Career\",\"Generics\",\"Find Doctors\"]', '2021-02-16 02:43:11', '2021-08-23 17:33:54'),
(114, 'header_menu_links', '[\"http:\\/\\/localhost\\/4.8\\/\",\"http:\\/\\/localhost\\/4.8\\/blog\",\"http:\\/\\/localhost\\/4.8\\/companys\",\"http:\\/\\/localhost\\/4.8\\/categories\",\"http:\\/\\/localhost\\/4.8\\/career\",\"http:\\/\\/localhost\\/4.8\\/generics\",\"http:\\/\\/localhost\\/4.8\\/doctors\"]', '2021-02-16 02:43:11', '2021-09-09 15:42:37'),
(115, 'proxypay', '1', '2021-06-20 11:25:42', '2021-08-25 09:33:16'),
(116, 'proxypay_sandbox', '1', '2021-06-20 11:25:42', '2021-06-20 11:25:42'),
(117, 'product_manage_by_admin', '1', '2021-06-26 11:20:43', '2021-06-26 11:20:43'),
(118, 'show_website_popup', 'on', '2021-06-26 11:26:53', '2021-06-26 11:26:53'),
(119, 'website_popup_content', '<h2 style=\"text-align: center; \"><img src=\"https://1h9jiodkw7zmc.cdn.shift8web.ca/wp-content/uploads/2018/10/Under.jpg\" style=\"width: 100%;\"><br></h2>', '2021-06-26 11:26:53', '2021-09-07 17:10:34'),
(120, 'show_subscribe_form', 'on', '2021-06-26 11:26:53', '2021-06-26 11:26:53'),
(121, 'topbar_banner', NULL, '2021-06-26 11:28:00', '2021-08-20 07:25:12'),
(122, 'topbar_banner_link', 'http://emed.test/', '2021-06-26 11:28:00', '2021-08-07 01:36:03'),
(123, 'play_store_link', 'https://play.google.com/store/apps/details?id=com.twgbd.dims&hl=en&gl=US', '2021-06-26 13:26:22', '2021-08-24 00:12:00'),
(124, 'app_store_link', 'https://play.google.com/store/apps/details?id=com.twgbd.dims&hl=en&gl=US', '2021-06-26 13:26:22', '2021-08-24 00:12:00'),
(125, 'compare_option', '0', '2021-08-25 09:40:19', '2021-08-29 01:11:59'),
(126, 'symbol', '৳', '2021-08-25 21:38:52', '2021-08-25 21:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `temp_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT 0.00,
  `tax` double(8,2) DEFAULT 0.00,
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `shipping_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pickup_point` int(11) DEFAULT NULL,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_applied` tinyint(4) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT 0,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `level`, `name`, `order_level`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Medicine', 1, 10.00, '31', '31', 1, 1, 0, 'drugs', 'drugs', 'drugs', '2021-08-21 10:41:19', '2021-08-21 10:41:19'),
(6, 0, 0, 'Baby', 2, 0.00, '33', '33', 1, 0, 0, 'baby-isexj', 'baby', NULL, '2021-08-20 07:39:48', '2021-08-20 07:39:48'),
(7, 0, 0, 'Lab Tests', 0, 20.00, '32', '32', 1, 0, 1, 'lab-upjvq', 'lab', NULL, '2021-08-26 20:37:35', '2021-08-26 20:37:35'),
(8, 0, 0, 'Flash', 5, 0.00, '29', '29', 1, 0, 0, 'flash-bnvku', 'Flash', NULL, '2021-08-20 07:28:39', '2021-08-20 07:28:39'),
(9, 7, 1, 'HEALTH TEST AT YOUR HOME', 10, 10.00, '32', '19', 0, 0, 1, 'HEALTH-TEST-AT-YOUR-HOME-U63EA', 'HEALTH TEST AT YOUR HOME', 'HEALTH TEST AT YOUR HOME', '2021-08-29 02:06:25', '2021-08-29 02:06:25'),
(10, 7, 1, 'VISIT A LAB NEAR YOU', 5, 10.00, '32', '19', 0, 0, 1, 'VISIT-A-LAB-NEAR-YOU-aH11Z', 'VISIT A LAB NEAR YOU', 'VISIT A LAB NEAR YOU', '2021-08-26 20:41:43', '2021-08-26 20:41:43'),
(11, 0, 0, 'Health Kit', 10, 0.00, '65', '65', 1, 0, 0, 'Health-Kit-Ex4y8', 'Health Kit', 'Health Kit', '2021-08-29 02:06:25', '2021-08-29 02:06:25'),
(12, 0, 0, 'Doctors', 0, 0.00, '66', '66', 1, 0, 0, 'Doctors-2ALMg', 'doctors', NULL, '2021-08-29 02:15:32', '2021-08-29 02:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(2, 1, 'Medicine', 'en', '2021-07-08 02:09:50', '2021-08-21 10:41:19'),
(4, 6, 'Baby', 'en', '2021-07-16 04:27:44', '2021-08-20 07:31:50'),
(5, 7, 'Lab Tests', 'en', '2021-07-16 04:28:16', '2021-08-20 07:36:38'),
(6, 8, 'Flash', 'en', '2021-07-16 04:28:53', '2021-08-20 07:28:39'),
(7, 9, 'HEALTH TEST AT YOUR HOME', 'en', '2021-08-26 20:40:51', '2021-08-26 20:40:51'),
(8, 10, 'VISIT A LAB NEAR YOU', 'en', '2021-08-26 20:41:43', '2021-08-26 20:41:43'),
(9, 11, 'Health Kit', 'en', '2021-08-29 02:06:19', '2021-08-29 02:06:19'),
(10, 12, 'Doctors', 'en', '2021-08-29 02:13:56', '2021-08-29 02:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ch_messages`
--

INSERT INTO `ch_messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1659175311, 'admin', 9, 8, '', NULL, 1, '2021-08-06 19:42:40', '2021-08-13 15:28:40'),
(1682047481, 'customer', 8, 18, 'dsdsdf', NULL, 1, '2021-08-17 21:23:08', '2021-08-17 21:23:37'),
(1693532854, 'user', 8, 13, 'hello sir, I have a problem', NULL, 0, '2021-08-22 14:28:38', '2021-08-22 14:28:38'),
(1699899137, 'customer', 8, 18, 'dsdsdf', NULL, 1, '2021-08-17 21:25:43', '2021-08-17 21:29:51'),
(1702876612, 'admin', 9, 11, 'hello', NULL, 1, '2021-08-03 03:32:57', '2021-08-04 15:38:39'),
(1713172210, 'user', 9, 8, '', '{\"new_name\":\"e713ba6a-5e71-4691-b587-0459bfefb81d.png\",\"old_name\":\"Screenshot (2).png\"}', 1, '2021-07-16 05:14:09', '2021-07-16 05:14:19'),
(1715531095, 'customer', 8, 8, 'Vai ai test ta kno kore?', NULL, 0, '2021-08-27 15:14:39', '2021-08-27 15:14:39'),
(1718122844, 'customer', 8, 15, 'hello dr Tanisha', NULL, 0, '2021-08-03 14:37:09', '2021-08-03 14:37:09'),
(1718830727, 'user', 8, 18, 'sss', NULL, 1, '2021-08-17 21:22:58', '2021-08-17 21:22:59'),
(1720977055, 'customer', 8, 18, 'hii', NULL, 1, '2021-08-17 21:29:59', '2021-08-17 21:30:07'),
(1768783089, 'user', 12, 9, '', '{\"new_name\":\"0c5af4ab-a09b-4fa3-8b45-d295fd503a17.jpg\",\"old_name\":\"132043947_413399763185515_34093595081080057_n.jpg\"}', 1, '2021-08-04 17:25:31', '2021-08-06 19:42:53'),
(1768864601, 'admin', 9, 11, 'ssss', NULL, 1, '2021-08-03 03:30:04', '2021-08-04 15:38:39'),
(1783683073, 'admin', 9, 8, '', NULL, 1, '2021-08-06 19:50:39', '2021-08-13 15:28:40'),
(1792518467, 'user', 8, 9, 'hello', NULL, 1, '2021-07-29 12:36:59', '2021-08-03 02:39:12'),
(1826117548, 'customer', 8, 15, 'yes', NULL, 0, '2021-08-17 21:04:10', '2021-08-17 21:04:10'),
(1858732165, 'admin', 9, 13, 'adesdads', NULL, 0, '2021-08-03 03:41:29', '2021-08-03 03:41:29'),
(1870548026, 'customer', 8, 18, 'hello', NULL, 1, '2021-08-17 21:40:00', '2021-08-17 21:40:09'),
(1875092773, 'customer', 8, 18, 'kkk', NULL, 1, '2021-08-17 21:18:54', '2021-08-17 21:19:06'),
(1927705237, 'customer', 8, 18, 'dsdsdf', NULL, 1, '2021-08-17 21:27:14', '2021-08-17 21:29:51'),
(1939011599, 'customer', 8, 15, 'yes', NULL, 0, '2021-08-17 21:04:34', '2021-08-17 21:04:34'),
(1943420888, 'admin', 9, 9, 'gaergqer', '{\"new_name\":\"5a9cae39-698f-41e6-b347-c90ccf73b0df.jpg\",\"old_name\":\"mockup-graphics--msTEzGwKJs-unsplash.jpg\"}', 0, '2021-08-23 18:56:57', '2021-08-23 18:56:57'),
(1967560076, 'customer', 8, 15, 'yes', NULL, 0, '2021-08-17 21:06:12', '2021-08-17 21:06:12'),
(1977328293, 'admin', 9, 8, 'i got it thank you', '{\"new_name\":\"c5f8116a-65d6-4faf-90f8-cefc60b6a421.jpg\",\"old_name\":\"unnamed.jpg\"}', 0, '2021-09-01 07:37:26', '2021-09-01 07:37:26'),
(1980600206, 'admin', 9, 8, 'dfdgsagr', NULL, 1, '2021-08-06 20:22:32', '2021-08-13 15:28:40'),
(1997380335, 'customer', 8, 18, 'dsdsdf', NULL, 1, '2021-08-17 21:24:19', '2021-08-17 21:29:51'),
(2018120860, 'user', 9, 8, 'hello', NULL, 1, '2021-07-16 05:12:46', '2021-07-16 05:13:20'),
(2048557096, 'customer', 8, 11, 'hello doctor mehedi', NULL, 1, '2021-08-03 14:24:20', '2021-08-04 15:08:49'),
(2059578916, 'admin', 9, 11, 'hello', NULL, 1, '2021-08-03 03:34:47', '2021-08-04 15:38:39'),
(2064355324, 'user', 9, 8, 'okay i got it hold on', NULL, 1, '2021-08-13 15:29:39', '2021-08-13 15:29:40'),
(2077064135, 'user', 8, 15, 'Actually I want to see you', NULL, 0, '2021-08-05 10:44:22', '2021-08-05 10:44:22'),
(2084019121, 'customer', 8, 17, 'hello', NULL, 1, '2021-08-22 14:31:29', '2021-08-22 14:38:50'),
(2115851526, 'customer', 8, 13, 'Hello sir.', '{\"new_name\":\"4b2193c8-c83f-42cb-8493-62878e873762.jpg\",\"old_name\":\"istockphoto-1147787504-612x612.jpg\"}', 0, '2021-08-22 14:28:13', '2021-08-22 14:28:13'),
(2167848239, 'admin', 9, 8, 'sdfhgsthsfgnxfgjhat', '{\"new_name\":\"37798966-ab11-4393-9f87-527c9db1c88d.jpg\",\"old_name\":\"misty.jpg\"}', 1, '2021-08-06 21:13:49', '2021-08-13 15:28:40'),
(2237904891, 'admin', 9, 11, 'ssss', NULL, 1, '2021-08-03 03:29:45', '2021-08-04 15:38:39'),
(2253246909, 'admin', 9, 8, 'sthth', NULL, 1, '2021-08-06 20:11:06', '2021-08-13 15:28:40'),
(2318089563, 'user', 8, 9, 'hii', NULL, 1, '2021-07-16 05:13:25', '2021-07-16 05:13:25'),
(2336617987, 'user', 18, 8, 'hi', NULL, 1, '2021-08-17 21:18:11', '2021-08-17 21:18:17'),
(2361548229, 'user', 8, 9, 'Amar prescription.id 10', NULL, 1, '2021-08-13 15:28:56', '2021-08-13 15:29:24'),
(2413703943, 'admin', 9, 13, 'adesdads', NULL, 0, '2021-08-03 03:22:20', '2021-08-03 03:22:20'),
(2414987834, 'user', 12, 9, 'hello', NULL, 1, '2021-08-04 17:25:25', '2021-08-06 19:42:53'),
(2436411325, 'admin', 9, 8, 'sthth', NULL, 1, '2021-08-06 20:10:27', '2021-08-13 15:28:40'),
(2456537671, 'user', 18, 8, 'hii', NULL, 1, '2021-08-17 21:40:12', '2021-08-17 21:40:13'),
(2460823780, 'admin', 9, 8, 'hello', '{\"new_name\":\"61ce17a5-6b69-405f-8214-e5af5557209e.jpg\",\"old_name\":\"2_2.jpg\"}', 1, '2021-08-06 20:05:38', '2021-08-13 15:28:40'),
(2468354629, 'customer', 8, 18, 'hi', NULL, 1, '2021-08-17 21:17:30', '2021-08-17 21:17:46'),
(2490336840, 'admin', 9, 11, 'hello', NULL, 1, '2021-08-03 03:24:27', '2021-08-04 15:38:39'),
(2516117661, 'user', 8, 18, 'hi', NULL, 1, '2021-08-17 21:18:20', '2021-08-17 21:18:21'),
(2580950976, 'admin', 9, 8, 'dddddd', NULL, 1, '2021-08-06 19:51:48', '2021-08-13 15:28:40'),
(2584234143, 'admin', 9, 11, 'hello', NULL, 1, '2021-08-03 03:32:12', '2021-08-04 15:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `name`, `cost`, `created_at`, `updated_at`) VALUES
(1, 18, 'Dhaka', 100.00, '2021-06-26 01:26:41', '2021-06-26 01:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `commission_histories`
--

CREATE TABLE `commission_histories` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `admin_commission` double(25,2) NOT NULL,
  `seller_earning` double(25,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `receiver_id`, `title`, `sender_viewed`, `receiver_viewed`, `created_at`, `updated_at`) VALUES
(1, 8, 9, 'Napa', 1, 1, '2021-07-09 16:17:02', '2021-07-09 16:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'DS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(20,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `type`, `code`, `details`, `discount`, `discount_type`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'product_base', 'check', '[{\"product_id\":\"4\"}]', 100.00, 'percent', 1626112800, 1657648800, '2021-07-13 11:50:24', '2021-07-13 11:50:24');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(1, 8, 1, '2021-07-13 11:52:25', '2021-07-13 11:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 1, 'USD', '2018-10-09 11:35:08', '2018-10-17 05:50:52'),
(27, 'Taka', 'MRP ', 84.00000, 1, 'BDT', '2018-10-09 11:35:08', '2018-12-02 05:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 8, '2019-08-01 10:35:09', '2019-08-01 10:35:09'),
(5, 12, '2021-07-09 20:12:46', '2021-07-09 20:12:46'),
(6, 24, '2021-09-01 03:10:28', '2021-09-01 03:10:28'),
(7, 25, '2021-09-08 11:45:01', '2021-09-08 11:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_packages`
--

INSERT INTO `customer_packages` (`id`, `name`, `amount`, `product_upload`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'starter package', 500.00, 100, '1', '2021-07-07 22:09:13', '2021-07-07 22:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_payments`
--

CREATE TABLE `customer_package_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_translations`
--

CREATE TABLE `customer_package_translations` (
  `id` bigint(20) NOT NULL,
  `customer_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_package_translations`
--

INSERT INTO `customer_package_translations` (`id`, `customer_package_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'starter package', 'en', '2021-07-07 22:09:13', '2021-07-07 22:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(20,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_product_translations`
--

CREATE TABLE `customer_product_translations` (
  `id` bigint(20) NOT NULL,
  `customer_product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `total_collection` double(25,2) NOT NULL DEFAULT 0.00,
  `earning` double(25,2) NOT NULL DEFAULT 0.00,
  `total_earning` int(11) DEFAULT NULL,
  `monthly_salary` double(25,2) DEFAULT NULL,
  `order_commission` double(25,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_boys`
--

INSERT INTO `delivery_boys` (`id`, `user_id`, `name`, `total_collection`, `earning`, `total_earning`, `monthly_salary`, `order_commission`, `created_at`, `updated_at`) VALUES
(3, 22, 'Boy', 328.50, 0.00, 60, NULL, NULL, '2021-08-27 17:11:47', '2021-09-20 06:19:51'),
(6, 28, 'SobuZ', 114.99, 0.00, 30, NULL, NULL, '2021-09-21 00:08:35', '2021-09-21 00:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_status` varchar(255) NOT NULL,
  `delivery_history_date` date DEFAULT NULL,
  `payment_type` varchar(20) NOT NULL,
  `collection` int(11) DEFAULT NULL,
  `earning` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `delivery_boy_id`, `order_id`, `delivery_status`, `delivery_history_date`, `payment_type`, `collection`, `earning`, `created_at`, `updated_at`) VALUES
(1, 22, 21, 'pending', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-15 18:00:00', '2021-09-16 18:39:29'),
(2, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 18:00:00', '2021-09-16 19:15:56'),
(3, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:10:54', '2021-09-16 19:10:54'),
(4, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:12:17', '2021-09-16 19:12:17'),
(5, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:12:41', '2021-09-16 19:12:41'),
(6, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:15:13', '2021-09-16 19:15:13'),
(7, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:20:02', '2021-09-16 19:20:02'),
(8, 35865261, 21, 'confirmed', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:21:03', '2021-09-16 19:21:03'),
(9, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:22:03', '2021-09-16 19:22:03'),
(10, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:22:43', '2021-09-16 19:22:43'),
(11, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:24:38', '2021-09-16 19:24:38'),
(12, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:24:38', '2021-09-16 19:24:38'),
(13, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:25:57', '2021-09-16 19:25:57'),
(14, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:26:59', '2021-09-16 19:26:59'),
(15, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:27:40', '2021-09-16 19:27:40'),
(16, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 19:31:56', '2021-09-16 19:31:56'),
(17, 22, 21, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:00:20', '2021-09-16 20:00:20'),
(18, 22, 21, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:01:13', '2021-09-16 20:01:13'),
(19, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:03:26', '2021-09-16 20:03:26'),
(20, 22, 21, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:03:31', '2021-09-16 20:03:31'),
(21, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:21:47', '2021-09-16 20:21:47'),
(22, 22, 21, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:21:52', '2021-09-16 20:21:52'),
(23, 22, 21, 'delivered', NULL, 'cash_on_delivery', 110, NULL, '2021-09-16 20:21:57', '2021-09-16 20:21:57'),
(24, 35865261, 20, 'pending', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:41:34', '2021-09-16 20:42:35'),
(25, 35865261, 20, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:51:03', '2021-09-16 20:51:03'),
(26, 35865261, 20, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:51:16', '2021-09-16 20:51:16'),
(27, 35865261, 20, 'delivered', NULL, 'cash_on_delivery', 169, NULL, '2021-09-16 20:51:23', '2021-09-16 20:51:23'),
(28, 35865261, 19, 'pending', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:56:01', '2021-09-16 20:56:01'),
(29, 35865261, 19, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:56:55', '2021-09-16 20:56:55'),
(30, 35865261, 19, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-16 20:57:03', '2021-09-16 20:57:03'),
(31, 35865261, 19, 'delivered', NULL, 'cash_on_delivery', 110, 30, '2021-09-16 20:57:09', '2021-09-16 20:57:09'),
(32, 35865261, 22, 'pending', NULL, 'bkash', NULL, NULL, '2021-09-20 06:12:43', '2021-09-20 06:12:43'),
(33, 22, 22, 'confirmed', NULL, 'bkash', NULL, NULL, '2021-09-20 06:14:18', '2021-09-20 06:14:18'),
(34, 22, 21, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-20 06:16:33', '2021-09-20 06:16:33'),
(35, 22, 21, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-20 06:16:53', '2021-09-20 06:16:53'),
(36, 22, 21, 'delivered', NULL, 'cash_on_delivery', 110, 30, '2021-09-20 06:17:09', '2021-09-20 06:17:09'),
(37, 22, 22, 'picked_up', NULL, 'bkash', NULL, NULL, '2021-09-20 06:19:33', '2021-09-20 06:19:33'),
(38, 22, 22, 'on_the_way', NULL, 'bkash', NULL, NULL, '2021-09-20 06:19:39', '2021-09-20 06:19:39'),
(39, 22, 22, 'delivered', NULL, 'bkash', NULL, 30, '2021-09-20 06:19:52', '2021-09-20 06:19:52'),
(40, 22, 13, 'pending', NULL, 'bkash', NULL, NULL, '2021-09-21 00:06:40', '2021-09-21 00:06:58'),
(41, 28, 24, 'pending', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-21 00:12:43', '2021-09-21 00:12:57'),
(42, 28, 24, 'picked_up', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-21 00:13:21', '2021-09-21 00:13:21'),
(43, 28, 24, 'on_the_way', NULL, 'cash_on_delivery', NULL, NULL, '2021-09-21 00:13:27', '2021-09-21 00:13:27'),
(44, 28, 24, 'delivered', NULL, 'cash_on_delivery', 115, 30, '2021-09-21 00:13:32', '2021-09-21 00:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(2) UNSIGNED NOT NULL,
  `DivisionId` int(2) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `DivisionId`, `name`) VALUES
(1, 1, 'Dhaka'),
(2, 1, 'Kishoreganj'),
(3, 1, 'Narayanganj'),
(4, 1, 'Munshiganj'),
(5, 1, 'Narsingdi'),
(6, 1, 'Gazipur'),
(7, 1, 'Rajbari'),
(8, 1, 'Faridpur'),
(9, 1, 'Madaripur'),
(10, 1, 'Shariatpur'),
(11, 1, 'Gopalganj'),
(12, 1, 'Manikganj'),
(13, 1, 'Tangail'),
(14, 2, 'Bandarban'),
(15, 2, 'Brahmanbaria'),
(16, 2, 'Chandpur'),
(17, 2, 'Chattogram'),
(18, 2, 'Comilla'),
(19, 2, 'Cox\'s Bazar'),
(20, 2, 'Feni'),
(21, 2, 'Noakhali'),
(22, 2, 'Khagrachari'),
(23, 2, 'Lakshmipur'),
(24, 2, 'Rangamati'),
(25, 3, 'Barguna'),
(26, 3, 'Barishal'),
(27, 3, 'Bhola'),
(28, 3, 'Jhalokati'),
(29, 3, 'Patuakhali'),
(30, 3, 'Pirojpur'),
(31, 4, 'Bagerhat'),
(32, 4, 'Chuadanga'),
(33, 4, 'Jashore'),
(34, 4, 'Jhenaidah'),
(35, 4, 'Khulna'),
(36, 4, 'Kushtia'),
(37, 4, 'Magura'),
(38, 4, 'Meherpur'),
(39, 4, 'Narail'),
(40, 4, 'Satkhira'),
(41, 5, 'Jamalpur'),
(42, 5, 'Mymensingh'),
(43, 5, 'Netrakona'),
(44, 5, 'Sherpur'),
(45, 6, 'Bogura'),
(46, 6, 'Chapai Nawabganj'),
(47, 6, 'Joypurhat'),
(48, 6, 'Naogaon'),
(49, 6, 'Natore'),
(50, 6, 'Pabna'),
(51, 6, 'Rajshahi'),
(52, 6, 'Sirajganj'),
(53, 7, 'Habiganj'),
(54, 7, 'Moulvibazar'),
(55, 7, 'Sunamganj'),
(56, 7, 'Sylhet'),
(57, 8, 'Dinajpur'),
(58, 8, 'Gaibandha'),
(59, 8, 'Kurigram'),
(60, 8, 'Lalmonirhat'),
(61, 8, 'Nilphamari'),
(62, 8, 'Rangpur'),
(63, 8, 'Thakurgaon'),
(64, 8, 'Panchagarh');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(2) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`) VALUES
(1, 'Dhaka'),
(2, 'Chittagong'),
(3, 'Barishal'),
(4, 'Khulna'),
(5, 'Mymensingh'),
(6, 'Rajshahi'),
(7, 'Sylhet'),
(8, 'Rangpur');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE `educations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(191) NOT NULL,
  `added_by` int(11) NOT NULL,
  `degree` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institute` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `board` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passing_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `user_id`, `added_by`, `degree`, `institute`, `board`, `subject`, `passing_year`, `result`, `set_default`, `created_at`, `updated_at`) VALUES
(3, 16, 0, 'dddd', 'ddddd', '', '', '', '', 0, '2021-08-03 16:15:51', NULL),
(4, 16, 0, 'ffffff', 'ffffff', '', '', '', '', 0, '2021-08-03 16:17:21', NULL),
(5, 16, 0, 'new data', 'new data', '', '', '', '', 0, '2021-08-03 16:21:37', NULL),
(6, 16, 0, 'nsfgbsdf', 'dfbasdfb', '', '', '', '', 0, '2021-08-03 16:22:22', NULL),
(7, 15, 0, 'MBBS', 'Dhaka Medical', '', '', '', '', 0, '2021-08-03 18:22:14', NULL),
(8, 17, 0, 'ergerg', 'ergerge', '', '', '', '', 0, '2021-08-03 19:24:45', NULL),
(9, 20, 0, 'MBBS, M.S.', 'Kasturba Medical College, Mangalore', '', '', '', '', 0, '2021-08-23 23:40:38', NULL),
(10, 20, 0, 'FRCS', 'Royal college of Surgeons', '', '', '', '', 0, '2021-08-23 23:41:27', NULL),
(14, 25, 0, 'Honor’s', 'PRIMEASIA UNIVERSITY', NULL, 'BIOCHEMISTRY', '2020', '3.55', 0, '2021-09-08 12:11:27', NULL),
(15, 8, 0, 'Higher Secondary School Certificate', 'HATEM ALI COLLAGE HATEM HATEM ALI COLLAGEALI COLLAGE', 'Barishal', 'SCIENCE', '2016', '4.80', 0, '2021-09-08 12:12:29', NULL),
(16, 25, 0, 'Secondary School Certificate', 'DARUNNAZAT SIDDIKIA KAMIL MADRASHA', 'Madrasha', 'SCIENCE', '2014', '5.00', 0, '2021-09-08 12:14:00', NULL),
(19, 8, 0, 'Secondary School Certificate', 'ddd', 'Barishal', 'Dental', '2018', '5.00', 1, '2021-09-09 18:29:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employment_period_start` date NOT NULL,
  `employment_period_end` date NOT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `user_id`, `hospital`, `employment_period_start`, `employment_period_end`, `department`, `designation`, `description`, `organization`, `set_default`, `created_at`, `updated_at`) VALUES
(1, '87', 'dfsdf', '2021-01-20', '2021-01-12', 'medicine', 'doctor', 'yes this is descriptoojm', 'Dhaka medical', 0, '2021-08-03 19:22:25', '2021-09-08 10:51:08'),
(2, '87', 'asfdasdf', '0000-00-00', '0000-00-00', 'sdfsdfsdf', 'sfsdf', NULL, NULL, 1, '2021-08-03 19:55:08', '2021-09-08 10:51:08'),
(3, '20', 'B M Birla Heart Research Centre, Kolkata, India', '1989-01-01', '1996-12-30', 'Cardiology', 'Senior consultant cardiac surgeon', NULL, NULL, 0, '2021-08-23 23:57:17', NULL),
(4, '20', 'Manipal Heart Foundation, Bangalore, India', '1996-01-01', '2001-01-31', 'Cardiology', 'Senior consultant cardiac surgeon', NULL, NULL, 0, '2021-08-23 23:58:27', NULL),
(5, '20', 'Founder, Chairman and Senior Consultant', '2001-01-01', '2021-08-24', 'Cardiology', 'Senior consultant cardiac surgeon', NULL, NULL, 0, '2021-08-23 23:59:49', NULL),
(6, '25', '', '2026-08-13', '2030-07-10', '', 'SENEOR LARAVEL DEVELOPER', 'I HAD WORKING AS A SENIOR LARAVEL DEVELOPER', 'FUTURE ACADEMIC CARE', 0, '2021-09-08 12:17:34', NULL),
(8, '82', '', '2020-08-03', '2021-09-16', '', 'Senior consultant cardiac surgeon', 'yes this is my work experience', 'Dhaka Medical', 1, '2021-09-09 18:12:44', '2021-09-09 18:14:42'),
(9, '8', '', '2023-06-08', '2021-09-07', '', 'Senior consultant cardiac surgeon', 'des', 'Dhaka Medical', 1, '2021-09-09 18:27:03', '2021-09-09 18:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'World Health Day', 1630000800, 1630778340, 1, 1, '#E3FFFD', 'dark', '41', 'world-health-day-bhosa', '2021-08-26 18:30:10', '2021-08-26 18:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(20,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 1, 60, 0.00, NULL, '2021-08-26 18:30:10', '2021-08-26 18:30:10'),
(2, 1, 57, 0.00, NULL, '2021-08-26 18:30:10', '2021-08-26 18:30:10'),
(3, 1, 55, 0.00, NULL, '2021-08-26 18:30:10', '2021-08-26 18:30:10'),
(4, 1, 54, 0.00, NULL, '2021-08-26 18:30:10', '2021-08-26 18:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_translations`
--

CREATE TABLE `flash_deal_translations` (
  `id` bigint(20) NOT NULL,
  `flash_deal_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_translations`
--

INSERT INTO `flash_deal_translations` (`id`, `flash_deal_id`, `title`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'World Health Day', 'en', '2021-08-26 18:30:10', '2021-08-26 18:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `footer_logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'default', 'uploads/logo/pfdIuiMeXGkDAIpPEUrvUCbQrOHu484nbGfz77zB.png', NULL, 'uploads/admin_logo/wCgHrz0Q5QoL1yu4vdrNnQIr4uGuNL48CXfcxOuS.png', NULL, NULL, 'uploads/favicon/uHdGidSaRVzvPgDj6JFtntMqzJkwDk9659233jrb.png', 'Active Ecommerce CMS', 'Demo Address', 'Active eCommerce CMS is a Multi vendor system is such a platform to build a border less marketplace.', '1234567890', 'admin@example.com', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', 'https://www.googleplus.com', '2019-03-13 08:01:06', '2019-03-13 02:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `generics`
--

CREATE TABLE `generics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` int(11) DEFAULT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generics`
--

INSERT INTO `generics` (`id`, `active`, `name`, `description`, `meta`, `slug`, `created_at`, `updated_at`) VALUES
(0, 0, '', '', 0, '', '2021-08-23 12:39:28', '2021-08-23 12:39:28'),
(2, 1, 'Drucil', '<div class=\"generic-data-container en\">\r\n<div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">It is indicated for the treatment of upper respiratory tract infections (pharyngitis and tonsillitis) caused by Streptococcus pyogenes (group-A beta-hemolytic Streptococci) and Streptococcus pneumoniae; urinary tract infections caused by E. coli, Proteus mirabilis, and Klebsiella species and skin &amp; soft tissue infections caused by Staphylococci (including penicillinase producing bacteria) and Streptococci.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">First generation Cephalosporins</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"description\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Description</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cefadroxil is an acid-stable and semi-synthetic oral cephalosporin. It is rapidly absorbed after oral administration. Urine concentration of this antibiotic, following a 1 gm dose, is maintained well above the MIC of susceptible urinary pathogens for 20 to 22 hours.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cefadroxil inhibits bacterial cell wall synthesis by binding to 1 or more of the penicillin-binding proteins (PBPs) which in turn inhibit the final transpeptidation step of peptidoglycan synthesis in bacterial cell walls, thus inhibiting cell wall biosynthesis and arresting cell wall assembly resulting in bacterial cell death.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Adult:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Pharyngitis and Tonsillitis: 1 g per day in one or two divided doses.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Urinary Tract Infections: 1 or 2 g per day in one or two divided doses.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Skin and Skin Structure Infections: 1 g per day in one or two divided doses.</li>\r\n</ul>\r\nChildren: 30 mg/kg daily in divided doses every 12 hours.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />It may be taken with meals or on empty stomach. Administration with food may be helpful in diminishing potential gastrointestinal complaints.</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">There is no significant drug interaction with other drugs.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cefadroxil is contraindicated in patients with a history of hypersensitivity to Cefadroxil or any of the ingredients of it.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Generally Cefadroxil is well tolerated. However, the most commonly reported side effects are gastrointestinal disturbances and hypersensitivity phenomena.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">US FDA pregnancy category of Cefadroxil is B. There are, however, no adequate and well-controlled studies in pregnant women. Because animal reproduction studies are not always predictive of human response, this drug should be used during pregnancy only if clearly needed. Cefadroxil have been shown to be excreted in human milk. So, caution should be exercised when Cefadroxil is administered during lactation.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Use of this antibiotic may cause pseudomembranous colitis; so caution should be taken during diagnosis in patients who develop diarrhea in association with Cefadroxil therapy.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Keep in a dry place away from light and heat. Keep out of the reach of children.</div>\r\n</div>\r\n</div>\r\n</div>', 0, 'drucil', '2021-08-23 12:39:28', '2021-08-23 12:39:28'),
(4, 1, 'Carnival', '<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">It is indicated for the treatment of upper respiratory tract infections (pharyngitis and tonsillitis) caused by Streptococcus pyogenes (group-A beta-hemolytic Streptococci) and Streptococcus pneumoniae; urinary tract infections caused by E. coli, Proteus mirabilis, and Klebsiella species and skin &amp; soft tissue infections caused by Staphylococci (including penicillinase producing bacteria) and Streptococci.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">First generation Cephalosporins</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"description\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Description</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cefadroxil is an acid-stable and semi-synthetic oral cephalosporin. It is rapidly absorbed after oral administration. Urine concentration of this antibiotic, following a 1 gm dose, is maintained well above the MIC of susceptible urinary pathogens for 20 to 22 hours.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cefadroxil inhibits bacterial cell wall synthesis by binding to 1 or more of the penicillin-binding proteins (PBPs) which in turn inhibit the final transpeptidation step of peptidoglycan synthesis in bacterial cell walls, thus inhibiting cell wall biosynthesis and arresting cell wall assembly resulting in bacterial cell death.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Adult:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Pharyngitis and Tonsillitis: 1 g per day in one or two divided doses.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Urinary Tract Infections: 1 or 2 g per day in one or two divided doses.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Skin and Skin Structure Infections: 1 g per day in one or two divided doses.</li>\r\n</ul>\r\nChildren: 30 mg/kg daily in divided doses every 12 hours.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />It may be taken with meals or on empty stomach. Administration with food may be helpful in diminishing potential gastrointestinal complaints.</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">There is no significant drug interaction with other drugs.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cefadroxil is contraindicated in patients with a history of hypersensitivity to Cefadroxil or any of the ingredients of it.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Generally Cefadroxil is well tolerated. However, the most commonly reported side effects are gastrointestinal disturbances and hypersensitivity phenomena.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">US FDA pregnancy category of Cefadroxil is B. There are, however, no adequate and well-controlled studies in pregnant women. Because animal reproduction studies are not always predictive of human response, this drug should be used during pregnancy only if clearly needed. Cefadroxil have been shown to be excreted in human milk. So, caution should be exercised when Cefadroxil is administered during lactation.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Use of this antibiotic may cause pseudomembranous colitis; so caution should be taken during diagnosis in patients who develop diarrhea in association with Cefadroxil therapy.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Keep in a dry place away from light and heat. Keep out of the reach of children.</div>\r\n</div>', 0, 'carnival', '2021-08-23 12:39:41', '2021-08-23 12:39:41'),
(5, 1, 'Paracetamol', '<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Paracetamol is indicated for fever, common cold and influenza, headache, toothache, earache, bodyache, myalgia, neuralgia, dysmenorrhoea, sprains, colic pain, back pain, post-operative pain, postpartum pain, inflammatory pain and post vaccination pain in children. It is also indicated for rheumatic &amp; osteoarthritic pain and stiffness of joints.</div>\r\n</div>\r\n<div class=\"center-align mt-10 mb-20 hidden-sm hidden-xs campaign-block\" style=\"box-sizing: border-box; display: flex; justify-content: center; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5; text-align: center !important; margin-top: 10px !important; margin-bottom: 20px !important;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Non opioid analgesics</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Paracetamol has analgesic and antipyretic properties with weak anti-inflammatory activity. Paracetamol (Acetaminophen) is thought to act primarily in the CNS, increasing the pain threshold by inhibiting both isoforms of cyclooxygenase, COX-1, COX-2, and COX-3 enzymes involved in prostaglandin (PG) synthesis. Paracetamol is a para aminophenol derivative, has analgesic and antipyretic properties with weak anti-inflammatory activity. Paracetamol is one of the most widely used, safest and fast acting analgesic. It is well tolerated and free from various side effects of aspirin.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Tablet:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Adult</span>: 1-2 tablets every 4 to 6 hours up to a maximum of 4 gm (8 tablets) daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children (6-12 years)</span>:&nbsp;&frac12; to 1 tablet 3 to 4 times daily. For long term treatment it is wise not to exceed the dose beyond 2.6 gm/day.</li>\r\n</ul>\r\nExtended Release Tablet:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Adults &amp; Children over 12 years</span>: Two tablets, swallowed whole, every 6 to 8 hours (maximum of 6 tablets in any 24 hours).The tablet must not be crushed.</li>\r\n</ul>\r\nSyrup/Suspension:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children under 3 months</span>: 10 mg/kg body weight (reduce to 5 mg/kg if jaundiced) 3 to 4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">3 months to below 1 yea</span>r: &frac12; to 1 teaspoonful 3 to 4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">1-5 years</span>: 1 -2 teaspoonful 3 to 4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">6-12 years</span>: 2-A teaspoonful 3 to 4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Adults</span>: 4-8 teaspoonful 3 to 4 times daily.</li>\r\n</ul>\r\nSuppository:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children 3-12 months</span>: 60-120 mg,4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children 1-5 years</span>: 125-250 mg 4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children 6-12 years</span>: 250-500 mg 4 times daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Adults &amp; children over 12 years</span>: 0.5-1 gm 4 times daily.</li>\r\n</ul>\r\nPaediatric Drop:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children Upto 3 months</span>: 0.5 ml (40 mg)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">4 to 11 months</span>: 1.0 ml (80 mg)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">7 to 2 years</span>: 1.5 ml (120 mg). Do not exceed more than 5 dose daily for a maximum of 5 days.</li>\r\n</ul>\r\n<span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Paracetamol tablet with actizorb technology</span>: It dissolves up to five times faster than standard Paracetamol tablets. It is a fast acting and safe analgesic with marked antipyretic property. It is specially suitable for patients who, for any reason, can not tolerate aspirin or other analgesics.<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Adults and children (aged 12 years and over)</span>: Take 1 to 2 Tablets every four to six hours as needed. Do not take more than 8 caplets in 24 hours.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #006400;\">Children (7 to 11 years)</span>: Take &frac12;-1 Tablet every four to six hours as needed. Do not take more than 4 caplets in 24 hours. Not recommended in children under 7 years.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Patients who have taken barbiturates, tricyclic antidepressants and alcohol may show diminished ability to metabolise large doses of Paracetamol. Alcohol can increase the hepatotoxicity of Paracetamol overdosage. Chronic ingestion of anticonvulsants or oral steroid contraceptives induce liver enzymes and may prevent attainment of therapeutic Paracetamol levels by increasing first-pass metabolism or clearance.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">It is contraindicated in known hypersensitivity to Paracetamol.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Side effects of paracetamol are usually mild, though haematological reactions including thrombocytopenia, leucopenia, pancytopenia, neutropenia, and agranulocytosis have been reported. Pancreatitis, skin rashes, and other allergic reactions occur occasionally.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Pregnancy category B according to USFDA. This drug should be used during pregnancy only if clearly needed</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Paracetamol should be given with caution to patients with impaired kidney or liver function. Paracetamol should be given with care to patients taking other drugs that affect the liver.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Symptoms of Paracetamol overdose in the first 24 hours are pallor, nausea, vomiting, anorexia and abdominal pain. Liver damage may become apparent 12-48 hours after ingestion. Abnormalities of glucose metabolism and metabolic acidosis may occur.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #283848; background: inherit; margin-top: -8px; padding: 10px 8px;\">Keep in a dry place away from light and heat. Keep out of the reach of children.</div>\r\n</div>', 0, 'paracetamol', '2021-08-23 12:39:08', '2021-08-23 12:39:08');
INSERT INTO `generics` (`id`, `active`, `name`, `description`, `meta`, `slug`, `created_at`, `updated_at`) VALUES
(6, 1, 'Montelukast Sodium', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Montelukast Sodium is indicated for:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Prophylaxis and chronic treatment of asthma</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Acute prevention of Exercise-Induced Bronchoconstriction (EIB)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Relief of symptoms of Allergic Rhinitis (AR): Seasonal &amp; Perennial Allergic Rhinitis</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"center-align mt-10 mb-20 hidden-sm hidden-xs campaign-block\" style=\"box-sizing: border-box; display: flex; justify-content: center; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5; text-align: center !important; margin-top: 10px !important; margin-bottom: 20px !important;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Montelukast is a selective and orally active leukotriene receptor antagonist that inhibits the cysteinyl leukotriene receptor (CysLT<span style=\"box-sizing: border-box; font-size: 10.5px; line-height: 0; position: relative; vertical-align: baseline; bottom: -0.25em;\">1</span>). The cysteinyl leukotrienes (LTC<span style=\"box-sizing: border-box; font-size: 10.5px; line-height: 0; position: relative; vertical-align: baseline; bottom: -0.25em;\">4</span>, LTD<span style=\"box-sizing: border-box; font-size: 10.5px; line-height: 0; position: relative; vertical-align: baseline; bottom: -0.25em;\">4</span>, LTE<span style=\"box-sizing: border-box; font-size: 10.5px; line-height: 0; position: relative; vertical-align: baseline; bottom: -0.25em;\">4</span>) are products of arachidonic acid metabolism and are released from various cells, including mast cells and eosinophils. Cysteinyl leukotrienes and leukotriene receptor occupation have been correlated with the pathophysiology of asthma &amp; allergic rhinitis, including airway edema, smooth muscle contraction, and altered cellular activity associated with the inflammatory process, which contribute to the signs and symptoms of asthma.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Adults &amp; adolescents (15 years &amp; older)-<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Asthma &amp; Allergic Rhinitis</span>: 10 mg/day&nbsp;</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Exercise-Induced Bronchoconstriction</span>: 10 mg/day</li>\r\n</ul>\r\nPediatric patients (6 to 14 years)-<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Asthma &amp; Allergic Rhinitis</span>: 5 mg/day&nbsp;</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Exercise-Induced Bronchoconstriction</span>: 5 mg/day</li>\r\n</ul>\r\nPediatric patients (6 months to 5 years)-<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Asthma &amp; Allergic Rhinitis</span>: 4 mg/day&nbsp;</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Exercise-Induced Bronchoconstriction</span>: Not recommended</li>\r\n</ul>\r\nPatients with both asthma and allergic rhinitis should take only one dose daily in the evening. For prevention of Acute prevention of Exercise-Induced Bronchoconstriction, a single dose should be taken at least 2 hours before exercise.</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"administration\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Route of administration: Oral. Montelukast may be taken with or without food or as directed by the physician.</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">With medicine</span>: No dose adjustment is needed when montelukast is co-administered with theophylline, prednisone, prednisolone, terfenadine, digoxin, warfarin, gemfibrozil, itraconazole, thyroid hormones, sedative-hypnotics, non-steroidal anti-inflammatory agents, benzodiazepines, decongestants, oral contraceptives, and Cytochrome P450 (CYP) enzyme inducers.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">With food and others</span>: Bioavailability and other conditions were not significantly observed with food &amp; other conditions.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Montelukast is contraindicated in patients who are hypersensitive to any component of this product.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Common</span>: Diarrhoea, fever, gastrointestinal discomfort, headache, nausea, vomiting, skin reactions, upper respiratory tract infection.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Uncommon</span>: Akathisia, anxiety, arthralgia, asthenia, abnormal behavior, depression, dizziness, drowsiness, dry mouth, haemorrhage, irritability, malaise, muscle complaints, oedema, seizure, abnormal sensation, sleep disorders.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Rare</span>: Angioedema, concentration impaired, disorientation, eosinophilic granulomatosis with polyangiitis, erythema nodosum, hallucination, hepatic disorders, memory loss, palpitations, pulmonary eosinophilia, suicidal tendencies, tremor.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">There are no adequate and well-controlled studies in pregnant women. Montelukast should be used during pregnancy only if clearly needed. Montelukast is excreted in breast milk. So caution should be exercised when Montelukast is given to a nursing mother.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Montelukast is not indicated for use in the reversal of bronchospasm in acute asthma attacks, including status asthmatic. Neuropsychiatric events including agitation, hostility, anxiousness, depression, disorientation, disturbance in attention, dream abnormalities, hallucinations, insomnia, irritability, memory impairment, restlessness, somnambulism, suicidal thinking and behavior (including suicide) and tremor.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">There were no adverse experiences in the majority of overdosage reports. The most frequently occurring adverse experiences were consistent with the safety profile of Montelukast and included abdominal pain, somnolence, thirst, headache, vomiting and psychomotor hyperactivity. In the event of overdose, it is reasonable to employ the usual supportive measures; e.g., remove unabsorbed material from the gastrointestinal tract, employ clinical monitoring, and institute supportive therapy, if required.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Leukotriene receptor antagonists</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Store in cool &amp; dry place below 30&deg;C, protect from light &amp; moisture. Keep out of reach of children.</div>\r\n</div>', 0, 'montelukast-sodium', '2021-08-23 12:39:00', '2021-08-23 12:39:00'),
(7, 1, '5-Fluorouracil [5-FU]', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Fluorouracil is indicated alone or in combination for-&nbsp;<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Carcinoma of the colon or rectum</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Carcinoma of the stomach and exocrine pancreas</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Carcinoma of the liver</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Carcinoma of the breast</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Carcinoma of the bladder</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Carcinoma of the lung</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Epithelial ovarian carcinoma</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Cervical carcinoma.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Fluorouracil is inactive as such in mammalian cells but is converted into the active 5-fluorodeoxyuridine monophosphate (FdUMP) by a variety of different metabolic pathways. The drug works by inhibiting the enzyme thymidylate kinase which results in reduced formation of thymidine and thus of DNA. The active metabolite FdUMP appears to form a stable complex with the folate cofactor N-5, 10-methylene tetrahydrofolate which inactivates thymidylate kinase. Fluorouracil as FdUMP is also incorporated into RNA which results in fluorination of RNA. The effect of fluorouracil on living cells is limited mainly to those in the proliferative phase but while cells in the G2 and S phase are most affected there may be effects at any stage of the cell cycle.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Intravenous 5-fluorouracil can be delivered by rapid intravenous bolus injection or slow infusion. The vial contents can rapidly be injected directly into a peripheral vein, the commonest schedules being: 12-13.5 mg/Kg (500 mg/m2) daily for 5 days repeated at 4-weekly intervals. Slow intravenous infusion requires the drug, to be diluted in 500 ml of dextrose 5% solution, then infused over 2-3 hr on 5 successive days.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">For palliative management of cancer</span>: Initial Dose: 12 mg/kg intravenously once daily for 4 successive days. Maximum Dose: 800 mg/day. If no toxicity is observed, 6 mg/kg may be administered on the 6th, 8th, 10th, and 12th day (No therapy is given on days 5, 7, 9, or 11). Discontinue at the end of day 12, even with no apparent toxicity.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Poor risk patients and those who are not in an adequate nutritional state</span>: Initial Dose: 6 mg/kg/day for 3 days. Maximum Dose: 400 mg/day. If no toxicity is observed, 3 mg/kg may be administered on days 5, 7, and 9 (No therapy is to be administered on days 4, 6, or 8). Discontinue at the end of day 9, even with no apparent toxicity.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Maintenance therapy</span>: In instances where toxicity has not been a problem, it is recommended that therapy be continued using either of the following schedules:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Repeat the dosage of the first course every 30 days after the last day of the previous course, or</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">When the toxic signs resulting from the initial course of therapy have subsided, administer a maintenance dose of 10 to 15 mg/kg/week as a single dose. Maximum Dose: 1g/week .The reaction by the patient to the previous course of therapy should be taken into account and the dosage should be adjusted accordingly.</li>\r\n</ul>\r\n<span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Usual adult dose for cervical cancer</span>: In combination with cisplatin 1 gm/m2 IV on day 1. The cycle is repeated every 21 days.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Usual pediatric dose for malignant disease</span>: The manufacturer has reported that the safety and effectiveness of fluorouracil have not been established in children. However, the drug has been used in children following adult guidelines.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Intra-arterial infusion</span>: Fluorouracil has also been given by intra-arterial infusion for adult in doses of 5 to 7.5 mg/kg body weight is dissolved in 20-100 ml of 5% Dextrose solution and administered 10-20 days by using an infusion pump.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Combination with radiation</span>: Usual adult daily dose of 5-10 mg/kg body weight is given in combination with radiation according to systemic administration method or intra-arterial infusion method.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Combination with other anticancer drugs</span>: Fluorouracil is used alone or in combination in the adjuvant treatment of breast and gastro-intestinal cancer, and palliation of inoperable malignant neoplasms, especially those of the gastro-intestinal tract, breast, head and neck, liver, genito-urinary system, and pancreas. It is also used with cyclophosphamide and methotrexate in the combination chemotherapy of breast cancer. A usual adult dose of 5 to 10 mg/kg body weight daily is given in combination with other anticancer drugs every day or intermittently once to twice a week by systemic administration method or intra-arterial infusion method.</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Pre-treatment with cimetidine for 4 weeks led to increased plasma concentrations of fluorouracil following intravenous and oral administration in 6 patients. The effect was probably due to a combination of hepatic enzyme inhibition and reduced hepatic blood flow.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">It is contraindicated in patients that are severely debilitated or in patients with bone marrow suppression due to either radiotherapy or chemotherapy. It is likewise contraindicated in pregnant or breastfeeding women. It should also be avoided in patients that do not have malignant illnesses.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Potentially life-threatening effects</span>: Severe effects from 5-fluorouracil are related to the dosage and duration of therapy.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Cardiac effects</span>: Occasional case reports associating 5-fluorouracil therapy with \'ischemic cardiac events\' evidence against the autoimmune phenomenon is the fact that in several cases cardiotoxicity occurred within several hours of the first dose.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Hematological effects</span>: Potentially lethal effects caused by severe hematological toxicity may develop within the first 10 days of treatment being instituted but generally resolves within 3 weeks. At the recommended dose and schedule it is rather uncommon for hematological toxicity to be severe. Any ontribute to severe effects from 5-fluorouracil on the blood-forming cells. Thus extensive prior irradiation or the concomitant use of cytotoxic drugs tend to exacerbate the severity of the hematological side effects of 5-fluorouracil.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Neurological effects</span>: Effects on the central nervous system have been occasionally reported and cerebral ataxia is dose-dependent with an incidence of between 3.1 and 7%. Acute cerebellar syndromes and myelopathy have been described following intrathecal 5-fluorouracil. Neurological syndromes may occur rarely after carotid artery perfusion in head and neck cancer. Other effects Allergic reaction (including difficulty in breathing, closing of the throat, swelling of the lips, tongue, or face, or hives), decreased bone marrow function and blood problems (extreme fatigue, easy bruising or bleeding, black, bloody or tarry stools, or fever, chills, or signs of infection), hand-foot syndrome (tingling, pain, redness, swelling or tenderness of the hands and feet), severe vomiting, diarrhoea, frequent bowel movements or watery stools, or sores in the mouth or throat, or stomach pain or heartburn or black, bloody or tarry stools. Other less serious side effects may include mild to moderate nausea, vomiting or loss of appetite, balance problems, confusion, rash and itching, or temporary hair loss. Conjunctivitis, both acute and chronic can proceed to tear duct stenosis and ectropion following prolonged administration. Very chronic administration, extending beyond 3 months, of low dosage has been associated with low systemic toxicity but includes the possibility of painful and tender hands and feet associated with erythema of the extremities.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Fluorouracil is contraindicated throughout pregnancy. The literature pertaining to pregnancy and cytotoxic drugs is necessarily limited but it appears in general that risk of teratogenesis diminishes with the advancement of pregnancy. Therefore most cytotoxic drugs are absolutely contraindicated in the first trimester and 5-fluorouracil, used in the first trimester has been reported to cause multiple congenital abnormalities. There are many case reports, however, of pregnancy being conducted successfully with combination chemotherapy being given to the mother during the second and third trimesters. Because of the age of the population and the natural history of the tumors treated, most of the data on long-term follow-up pertain to therapy for leukemias. More data need to be accrued on the subsequent development of neonates before it is certain that any of these compounds are free of late effects.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />It is not known whether fluorouracil is excreted in human milk. Because fluorouracil inhibits DNA, RNA and protein synthesis, mothers should not nurse while receiving this drug.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">5-fluorouracil is highly toxic drug with a narrow margin of safety. Therefore patients should be carefully supervised, since therapeutic response is unlikely to occur without some evidence of toxicity. Daily dose should not exceed 1 gram. Treatment should be discontinued promptly when one of the following signs of toxicity appears: Leucopenia (WBC under 3500/mm3). Thrombocytopenia (platelet under 100000/mm3). Stomatitis ( the first small ulceration at the inner margin of the lips is a signal for stopping treatment). Severe diarrhoea (frequent bowel movements and watery stools). Gastro-intestinal ulceration and bleeding.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pediatric_uses\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Use in Special Populations</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Neonates</span>: No dosage recommendations are made for neonates.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Children</span>: Safety and effectiveness in children have not been established.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">The elderly</span>: No special precautions are required, doses being adjusted for the patient\'s weight and height.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cases of deliberate overdose are unknown but excessive toxicity because of the hematological effects as described above. There is no specific antidote to 5-fluorouracil toxicity; treatment consists in supportive care. In addition to the hematological toxicity other toxicities will occur with overdose. Sign and symptoms are qualitatively similar to the side effects. Treatment should be performed promptly and appropriate drugs are given to control symptoms of overdose.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cytotoxic Chemotherapy</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"reconstitution\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Reconstitution</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">5-Fluorouracil is a cytotoxic anticancer drug and, caution should be exercised in handling 5-Fluorouracil. Special, trained personnel should reconstitute the drug. Preparation requires a room reserved for this purpose. The work surface should be covered with disposable plastic-backed absorbent paper. Smoking, eating and drinking are prohibited in the room. The handling staff must have a set of appropriate equipment, particularly long-sleeved coats, protective masks, caps, protective goggles, sterile disposable gloves, worktop protection sheets and waste collection containers and bags. If 5-Fluorouracil solution contacts the skin, wash the skin immediately and thoroughly with soap and water. Following topical exposure, events have included tingling, burning and redness. If 5-Fluorouracil contacts mucous membranes, the membranes should be flashed thoroughly with water. Pregnant women must be warned and avoid handling cytotoxic agents. All broken containers must be treated with the same precautions and regarded as contaminated waste. Contaminated waste is to be disposed of by incineration in rigid containers labeled for this purpose or must be destroyed as per the government rules.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Store the vial in original carton not exceeding 25℃. Do not refrigerate. Protect from light.</div>\r\n</div>', 5, '5-fluorouracil-5-fu', '2021-08-23 12:38:49', '2021-08-23 12:38:49');
INSERT INTO `generics` (`id`, `active`, `name`, `description`, `meta`, `slug`, `created_at`, `updated_at`) VALUES
(8, 1, 'Abacavir + Lamivudine + Zidovudine', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">This is indicated in combination with other antiretrovirals or alone for the treatment of human immunodeficiency virus type 1 (HIV-1) infection.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Abacavir is a carbocyclic synthetic nucleoside analogue and an antiviral agent. Intracellularly, abacavir is converted by cellular enzymes to the active metabolite carbovir triphosphate, an analogue of deoxyguanosine-5\'-triphosphate (dGTP). Carbovir triphosphate inhibits the activity of HIV-1 reverse transcriptase (RT) both by competing with the natural substrate dGTP and by its incorporation into viral DNA. Viral DNA growth is terminated because the incorporated nucleotide lacks a 3\'-OH group, which is needed to form the 5&prime; to 3&prime; phosphodiester linkage essential for DNA chain elongation.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Lamivudine is a synthetic nucleoside analogue and is phosphorylated intracellularly to its active 5\'-triphosphate metabolite, lamivudine triphosphate (L-TP). This nucleoside analogue is incorporated into viral DNA by HIV reverse transcriptase and HBV polymerase, resulting in DNA chain termination.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Zidovudine, a structural analog of thymidine, is a prodrug that must be phosphorylated to its active 5&prime;-triphosphate metabolite, zidovudine triphosphate (ZDV-TP). It inhibits the activity of HIV-1 reverse transcriptase (RT) via DNA chain termination after incorporation of the nucleotide analogue. It competes with the natural substrate dGTP and incorporates itself into viral DNA. It is also a weak inhibitor of cellular DNA polymerase &alpha; and &gamma;.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Recommended dosage for adults and pediatric patients weighing at least 40 kg: The recommended dosage is one tablet taken orally twice daily with or without food.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Due to fixed-dose tablet and cannot be dose adjusted, this is not recommended for:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Pediatric patients who weigh less than 40 kg.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Patients with creatinine clearance less than 50 ml/minute</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Patients with mild hepatic impairment.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Abacavir: In a trial of 11 HIV-1-infected subjects receiving methadone-maintenance therapy with 600 mg twice daily (twice the currently recommended dose), oral methadone clearance increased. This alteration will not result in a methadone dose modification in the majority of patients; however, an increased methadone dose may be required in a small number of patients.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Lamivudine: Coadministration of single doses of lamivudine and sorbitol resulted in a sorbitol dose-dependent reduction in lamivudine exposures. When possible, avoid use of sorbitol-containing medicines with lamivudine-containing medicines<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Zidovudine: Concomitant use of zidovudine with the following drugs should be avoided since an antagonistic relationship has been demonstrated in vitro: Stavudine, Doxorubicin, Nucleoside analogues, e.g., ribavirin</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">This is contraindicated in patients:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Who have the HLA-B*5701 allele</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">With prior hypersensitivity reaction to abacavir, lamivudine, or zidovudine.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">With moderate or severe hepatic impairment.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The most commonly reported adverse reactions (incidence at least 10%) in clinical trials were nausea, headache, malaise and fatigue, and nausea and vomiting.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Pregnancy Category C. There are no adequate and well-controlled studies of this preparation in pregnant women. This drug should be used during pregnancy only if the potential benefits outweigh the risks. Women infected with HIV should be instructed not to breastfeed due to potential for HIV transmission.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Serious and sometimes fatal hypersensitivity reactions have occurred with abacavir, a component of this preparation. These hypersensitivity reactions have included multi-organ failure and anaphylaxis and typically occurred within the first 6 weeks of treatment with abacavir (median time to onset was 9 days); although abacavir hypersensitivity reactions have occurred any time during. Patients who carry the HLA-B*5701 allele are at a higher risk of abacavir hypersensitivity reactions; although, patients who do not carry the HLA-B*5701 allele have developed hypersensitivity reactions. Hypersensitivity to abacavir was reported in approximately 206 (8%) of 2,670 patients in 9 clinical trials with abacavir-containing products where HLA-B*5701 screening was not performed. The incidence of suspected abacavir hypersensitivity reactions in clinical trials was 1% when subjects carrying the HLA-B*5701 allele were excluded. In any patient treated with abacavir, the clinical diagnosis of hypersensitivity reaction must remain the basis of clinical decision making.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">There is no known specific treatment for overdose with this preparation. If overdose occurs, the patient should be monitored and standard supportive treatment applied as required.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Drugs for HIV / Anti-retroviral drugs</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Store at a dry and cool place. Protect from light and moisture. Keep the medicine out of the reach of children.</div>\r\n</div>', 0, 'abacavir--lamivudine--zidovudine', '2021-08-23 12:38:38', '2021-08-23 12:38:38'),
(9, 1, 'Abiraterone Acetate', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Abiraterone Acetate is a CYP17 inhibitor indicated in combination with prednisone for the treatment of patients with<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Metastatic castration-resistant prostate cancer (CRPC).</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Metastatic high-risk castration-sensitive prostate cancer (CSPC).</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Abiraterone is an orally active inhibitor of the steroidal enzyme CYP17A1 (17 alpha-hydroxylase/C17,20 lyase). It inhibits CYP17A1 in a selective and irreversible manner via covalent binding mechanism. CYP17A1 is an enzyme that catalyzes the biosynthesis of androgen and is highly expressed in testicular, adrenal, and prostatic tumor tissue. More specifically, abiraterone inhibits the conversion of 17-hydroxyprognenolone to dehydroepiandrosterone (DHEA) by the enzyme CYP17A1 to decrease serum levels of testosterone and other androgens.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Metastatic castration-resistant prostate cancer</span>: Abiraterone 1,000 mg orally once daily with prednisone 5 mg orally twice daily.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Metastatic castration-sensitive prostate cancer</span>: Abiraterone 1,000 mg orally once daily with prednisone 5 mg orally once daily.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Patients receiving Abiraterone should also receive a gonadotropin-releasing hormone (GnRH) analog concurrently or should have had bilateral orchiectomy. Abiraterone must be taken on an empty stomach with water at least 1 hour before or 2 hours after a meal. Do not crush or chew tablets.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Dose Modification:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">For patients with baseline moderate hepatic impairment (Child-Pugh Class B), reduce the Abiraterone starting dose to 250 mg once daily.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">For patients who develop hepatotoxicity during treatment, hold Abiraterone until recovery. Retreatment may be initiated at a reduced dose. Abiraterone should be discontinued if patients develop severe hepatotoxicity.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">CYP3A4 Inducers</span>: Avoid concomitant strong CYP3A4 inducers during Abiraterone treatment. If a strong CYP3A4 inducer must be co-administered, increase the Abiraterone dosing frequency.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">CYP2D6 Substrates</span>: Avoid co-administration of Abiraterone with CYP2D6 substrates that have a narrow therapeutic index. If an alternative treatment cannot be used, exercise caution and consider a dose reduction of the concomitant CYP2D6 substrate.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Hypersensitivity to the Abiraterone acetate or to any of the excipients of Abiraterone.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The most common adverse reactions are fatigue, arthralgia, hypertension, nausea, edema, hypokalemia, hot flush, diarrhea, vomiting, upper respiratory infection, cough, and headache.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The safety and efficacy of Abiraterone have not been established in females. Based on findings from animal studies and the mechanism of action, Abiraterone can cause fetal harm and potential loss of pregnancy. There are no human data on the use of Abiraterone in pregnant women. The safety and efficacy of Abiraterone have not been established in females. There is no information available on the presence of abiraterone acetate in human milk, or on the effects on the breastfed child or milk production.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Mineralocorticoid excess</span>: Closely monitor patients with cardiovascular disease. Control hypertension and correct hypokalemia before treatment. Monitor blood pressure, serum potassium and symptoms of fluid retention at least monthly.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Adrenocortical insufficiency</span>: Monitor for symptoms and signs of adrenocortical insufficiency. Increased dosage of corticosteroids may be indicated before, during and after stressful situations.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Hepatotoxicity</span>: Can be severe and fatal. Monitor liver function and modify, interrupt, or discontinue Abiraterone dosing as recommended.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Increased fractures and mortality in combination with radium Ra 223 dichloride</span>: Use of Abiraterone plus prednisone/prednisolone in combination with radium Ra 223 dichloride is not recommended.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Embryo-Fetal Toxicity</span>: Abiraterone can cause fetal harm. Advise males with female partners of reproductive potential to use effective contraception.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Human experience of overdose with Abiraterone is limited. There is no specific antidote. In the event of an overdose, stop Abiraterone, undertake general supportive measures, including monitoring for arrhythmias and cardiac failure and assess liver function.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Cytotoxic Chemotherapy</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Keep below 30&deg;C temperature, away from light &amp; moisture. Keep out of the reach of children.</div>\r\n</div>', 0, 'abiraterone-acetate', '2021-08-23 12:38:19', '2021-08-23 12:38:19'),
(10, 1, 'Acarbose', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Acarbose is indicated as an adjunct to diet and exercise to improve glycemic control in adults with type 2&nbsp;diabetes mellitus.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">In contrast to sulfonylureas, Acarbose&nbsp;does not enhance insulin secretion. The antihyperglycemic action of acarbose results from a competitive, reversible inhibition of pancreatic alpha-amylase and membrane-bound intestinal alpha-glucoside hydrolase enzymes. Pancreatic alpha-amylase hydrolyzes complex starches to oligosaccharides in the lumen of the small intestine, while the membrane-bound intestinal alpha-glucosidases hydrolyze oligosaccharides, trisaccharides, and disaccharides to glucose and other monosaccharides in the brush border of the small intestine. In diabetic patients, this enzyme inhibition results in a delayed glucose absorption and a lowering of postprandial hyperglycemia. Because its mechanism of action is different, the effect of Acarbose&nbsp;to enhance glycemic control is additive to that of sulfonylureas, insulin or metformin when used in combination. In addition, Acarbose&nbsp;diminishes the insulinotropic and weight-increasing effects of sulfonylureas. Acarbose has no inhibitory activity against lactase and consequently would not be expected to induce lactose intolerance.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The recommended starting dosage of Acarbose&nbsp;is 25 mg given orally three times daily at the start (with the first bite) of each main meal. However, some patients may benefit from more gradual dose titration to minimize gastrointestinal side effects. This may be achieved by initiating treatment at 25 mg once per day and subsequently increasing the frequency of administration to achieve 25 mg t.i.d. Maintenance Dosage Once a 25 mg t.i.d. dosage regimen is reached, dosage of Acarbose&nbsp;should be adjusted at 4&ndash;8 week intervals based on one-hour postprandial glucose or glycosylated hemoglobin levels, and on tolerance. The dosage can be increased from 25 mg t.i.d. to 50 mg t.i.d. Some patients may benefit from further increasing the dosage to 100 mg t.i.d. The maintenance dose ranges from 50 mg t.i.d. to 100 mg t.i.d.</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Certain drugs tend to produce hyperglycemia and may lead to loss of blood glucose control. These drugs include the thiazides and other diuretics, corticosteroids, phenothiazines, thyroid products, estrogens, oral contraceptives, phenytoin, nicotinic acid, sympathomimetics, calcium channel-blocking drugs, and isoniazid. When such drugs are administered to a patient receiving Acarbose, the patient should be closely observed for loss of blood glucose control. When such drugs are withdrawn from patients receiving Acarbose&nbsp;in combination with sulfonylureas or insulin, patients should be observed closely for any evidence of hypoglycemia.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Patients Receiving Sulfonylureas or Insulin: Sulfonylurea agents or insulin may cause hypoglycemia. Acarbose&nbsp;given in combination with a sulfonylurea or insulin may cause a further lowering of blood glucose and may increase the potential for hypoglycemia. If hypoglycemia occurs, appropriate adjustments in the dosage of these agents should be made. Very rarely, individual cases of hypoglycemic shock have been reported in patients receiving Acarbose&nbsp;therapy in combination with sulfonylureas and/or insulin.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Acarbose&nbsp;is contraindicated in patients with known hypersensitivity to the drug. Precose is contraindicated in patients with diabetic ketoacidosis or cirrhosis. Acarbose&nbsp;is also contraindicated in patients with inflammatory bowel disease, colonic ulceration, partial intestinal obstruction or in patients predisposed to intestinal obstruction. In addition, Acarbose&nbsp;is contraindicated in patients who have chronic intestinal diseases associated with marked disorders of digestion or absorption and in patients who have conditions that may deteriorate as a result of increased gas formation in the intestine.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Diarrhea, gas, upset stomach, constipation, or stomach pain may occur in the first few weeks of treatment as your body adjusts to this medication but usually improve with time. Follow your prescribed diet to help lessen these side effects. If any of these effects persist or worsen, tell your doctor or pharmacist promptly.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Pregnancy Category B. The safety of Acarbose&nbsp;in pregnant women has not been established. A small amount of radioactivity has been found in the milk of lactating rats after administration of radiolabeled acarbose. It is not known whether this drug is excreted in human milk. Because many drugs are excreted in human milk, Acarbose&nbsp;should not be administered to a nursing woman.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Because of its mechanism of action, Acarbose when administered alone should not cause hypoglycemia in the fasted or postprandial state. Sulfonylurea agents or insulin may cause hypoglycemia. Because Acarbose given in combination with a sulfonylurea or insulin will cause a further lowering of blood glucose, it may increase the potential for hypoglycemia. Hypoglycemia does not occur in patients receiving metformin alone under usual circumstances of use, and no increased incidence of hypoglycemia was observed in patients when Acarbose was added to metformin therapy.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />Oral glucose (dextrose), whose&nbsp;absorption&nbsp;is not inhibited by Acarbose, should be used instead of sucrose (cane sugar) in the treatment of mild to moderate hypoglycemia. Sucrose, whose hydrolysis to glucose and&nbsp;fructose&nbsp;is inhibited by Acarbose, is unsuitable for the rapid correction of hypoglycemia. Severe hypoglycemia may require the use of either&nbsp;intravenous&nbsp;glucose infusion or glucagon injection.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pediatric_uses\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Use in Special Populations</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Pediatric Use</span>: safety and effectiveness of Acarbose&nbsp;in pediatric patients have not been established.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Geriatric Use</span>: of the total number of subjects in clinical studies of Acarbose&nbsp;in the United States, 27% were 65 and over, while 4% were 75 and over. No overall differences in safety and effectiveness were observed between these subjects and younger subjects.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Unlike sulfonylureas or insulin, an overdose of Acarbose&nbsp;will not result in hypoglycemia. An overdose may result in transient increases in flatulence, diarrhea, and abdominal discomfort which shortly subside. In cases of overdosage the patient should not be given drinks or meals containing carbohydrates (polysaccharides, oligosaccharides and disaccharides) for the next 4&ndash;6 hours.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Alpha-Glucosidase inhibitor</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Store below 25&deg; C. Protect from moisture.</div>\r\n</div>', 0, 'acarbose', '2021-08-23 12:37:58', '2021-08-23 12:37:58');
INSERT INTO `generics` (`id`, `active`, `name`, `description`, `meta`, `slug`, `created_at`, `updated_at`) VALUES
(11, 1, 'Aceclofenac', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Aceclofenac is indicated for the relief of pain and inflammation in osteoarthritis, rheumatoid arthritis, ankylosing spondylitis, toothache, trauma and lumbago.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\">Aceclofenac is a non-steroidal drug with anti-inflammatory and analgesic properties. It is a potent inhibitor of the enzyme cyclooxygenase, which is involved in the production of prostaglandin. After oral administration, it is rapidly and completely absorbed an unchanged drug.</p>\r\n</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Extended release tablet</span>: The recommended dose in adults is one 200 mg Aceclofenac tablet daily or as prescribed by the physician.<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Film coated tablet</span>: The recommended dose in adults is 100 mg, twice daily.</p>\r\n</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">No significant drug interactions has not been observed but close monitoring of patients is required when it is used with:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Lithium and Digoxin</span>: may increase plasma concentration of lithium and digoxin.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Diuretics</span>: may interact the activity of diuretics.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Anticoagulants</span>: may enhance the activity of anticoagulant.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Methotrexate</span>: may increase the plasma level of methotrexate.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\">Aceclofenac is contraindicated in patients with known hypersensitivity to it or in whom aspirin or NSAIDs precipitate attacks of asthma.</p>\r\n</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\">Aceclofenac is a non-steroidal drug with anti-inflammatory and analgesic properties. It is a potent inhibitor of the enzyme cyclooxygenase, which is involved in the production of prostaglandin. After oral administration, it is rapidly and completely absorbed an unchanged drug.</p>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\">The use of Aceclofenac should be avoided in pregnancy and lactation unless the potential benefits to the other outweigh the possible risks to the fetus.</p>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\">Caution should be exercised to patients with active or suspected peptic ulcer or gastro-intestinal bleeding moderate to severe hepatic impairment and cardiac or renal impairment. Caution should also be exercised in patients suffering from dizziness or urticaria.</p>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pediatric_uses\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Use in Special Populations</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">There are no clinical data on the use of Aceclofenac in children.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Drugs for Osteoarthritis, Drugs used for Rheumatoid Arthritis, Non-steroidal Anti-inflammatory Drugs (NSAIDs)</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; line-height: 1.7;\">keep in a dry place away from light and heat. Keep out of the reach of children.</p>\r\n</div>\r\n</div>', 0, 'aceclofenac', '2021-08-23 12:38:11', '2021-08-23 12:38:11'),
(12, 1, 'Acemetacin', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Acemetacin is indicated in<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Pain &amp; inflammation associated with musculoskeletal &amp; joint disorders. Such as: Rheumatoid arthritis, Osteoarthritis, Low back pain.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Pain after an operation.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Acemetacin is a non-steroidal anti-inflammatory drug. It is also known as an NSAID. It works by blocking a substance in the body called cyclooxygenase (also known as COX) which is involved in the production of certain irritant chemicals in response to injury or rheumatic disease. By blocking the action of COX, Acemetacin reduces the symptoms of pain and inflammation.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The recommended starting dose is 120mg/day in divided doses, increasing to 180mg/day in divided doses, depending on patient response. For the treatment of elderly patients, adjustment of dosage is not normally required. However, NSAIDs should be used with particular care in older patients who may be more prone to adverse reactions. Acemetacin should be taken with food, milk or an antacid to reduce the possibility of gastro-intestinal disturbance</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Acemetacin reduces the antihypertensive effect of b-blockers. Increase risk of convulsion when used with quinolone. Concurrent use with aspirin, NSAIDs or corticosteroids may increase risk of GI bleeding. Increased risk of methotrexate toxicity when used together.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Acemetacin is contraindicated to known hypersensitivity to Acemetacin or Indomethacin; peptic ulcer; safety in children is not established.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Common side effects include anorexia, nausea, vomiting, diarrhoea and constipation, peptic ulceration, headache, dizziness &amp; vertigo. Rarely confusion, depressed mood, oedema, chest pain, blood urea elevation are found.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The safety of this medicine in human pregnancy and lactation has not been established. Some animal reproduction studies showed some toxic/ teratogenic effects on fetus. Therefore, use of this drug during pregnancy and lactation period is not recommended.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Caution should be taken in elderly people, history of disorders affecting the stomach or intestines, inflammatory bowel disease such as Crohn\'s disease or ulcerative colitis, kidney disease, liver disease, heart failure.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Non-steroidal Anti-inflammatory Drugs (NSAIDs)</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Store in a cool and dry place, below 25℃ and away from light.</div>\r\n</div>', 0, 'acemetacin', '2021-08-23 12:37:49', '2021-08-23 12:37:49'),
(13, 1, 'Albendazole', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Albendazole is indicated in single and mixed infestations of-<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Hookworm (Ancylostoma, Necator)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Roundworm (Ascaris)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Threadworm (Enterobius)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Whipworm (Trichuris)</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Strongyloides</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Tapeworm</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Opisthorchi</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Hydatid.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"description\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Description</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Albendazole is a benzimidazole anthelmintic, active against most nematodes and some cestodes. It is used in the treatment of intestinal nematode infections and in higher doses in the treatment of hydatid disease. Albendazole exhibits vermicidal, ovicidal, and larvicidal activity. The principal mode of action of Albendazole is its inhibitory effect on tubulin polymerization, which results in the loss of cytoplasmic microtubules.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Albendazole is a broad spectrum anthelmintic. Albendazole exhibits vermicidal, ovicidal and larvicidal activities. The drug is thought to exert its anthelmintic effect by blocking glucose uptake in the susceptible helminths, thereby depleting the energy level until it becomes inadequate for survival. Immobilization is followed by the parasite. These events may be a consequence of the binding and subsequent inhibition of parasite tubulin polymerization by Albendazole and its metabolites, although the drug also binds to human tubulin. Albendazole is extensively metabolized, probably in the liver. Albendazole is poorly absorbed from the gastrointestinal tract but rapidly undergoes extensive first-pass metabolism. The principal metabolite albendazole sulphoxide has anthelmintic activity and a plasma half-life of about 8.5 hrs. It is excreted in the urine together with other metabolites.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Adults &amp; children over 2 years</span>:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">400 mg (1 tablet or 10 ml suspension) as a single dose in cases of Enterobius vermicularis, Trichuris trichiura, Ascaris lumbricoides, Ancylostoma duodenale and Necator americanus.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">In cases of strongyloidiasis or taeniasis, 400 mg (1 tablet or 10 ml suspension) daily should be given for 3 consecutive days. If the patient is not cured on follow-up after three weeks, a second course of treatment is indicated.&nbsp;</li>\r\n</ul>\r\n<span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Children of 1-2 years</span>: Recommended dose is a single dose of 200 mg (5 ml suspension).<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Children under 1 year</span>: Not recommended.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">In Hydatid disease (Echinococcosis)</span>:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">Albendazole is given by mouth with meals in a dose of 400 mg twice daily for 28 days for patients weighing over 60 kg.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">A dose of 15 mg/kg body weight daily in two divided doses (to a maximum total daily dose of 800 mg) is used for patients weighing less than 60 kg.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">For cystic echinococcosis, the 28 days course may be repeated after 14 days without treatment, to a total of 3 treatment cycles.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">For alveolar echinococcosis, cycles of 28 days of treatment followed by 14 days without treatment, may need to continue for months or years.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">In giardiasis, 400 mg (1 tablet or 10 ml suspension) once daily for five days is used.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">No interaction involving Albendazole, either pharmacodynamic or pharmacokinetic, has been reported.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Neonates</span>: Albendazole is not normally used in neonates.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Children</span>: Reduction of the dose from 400 mg to 200 mg may be indicated in children weighing less than 10 kg but there are no grounds for a general reduction in dosage to children.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Pregnant woman</span>: Albendazole should not be given during pregnancy or women thought to be pregnant. No information is available on placental transfer.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Concurrent disease</span>: There is no evidence to suggest that dose should be altered in renal, hepatic or cardiac failure.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Gastrointestinal disturbances, headache, dizziness, changes in liver enzymes, rarely reversible alopecia; rash, fever, blood disorders including leucopenia and pancytopenia reported; allergic shock if cyst leakage; convulsion and meningism in cerebral disease.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">US FDA Pregnancy category of Albendazole is C. So, Albendazole should be avoided in pregnancy and lactation unless the potential benefits to the other outweigh the possible risks to the fetus.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Blood counts and liver function tests before treatment and twice during each cycle; breastfeeding; exclude pregnancy before starting treatment. Albendazole should only be used in the treatment of Echinococcosis if there is constant medical supervision with regular monitoring of serum-transaminase concentrations and of leucocyte and platelet counts</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Anthelmintic</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Keep in a dry place, away from light and heat. Keep out of the reach of children.</div>\r\n</div>', 0, 'albendazole', '2021-08-23 12:37:35', '2021-08-23 12:37:35');
INSERT INTO `generics` (`id`, `active`, `name`, `description`, `meta`, `slug`, `created_at`, `updated_at`) VALUES
(14, 1, 'Clonazepam', '<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"indications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Indications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">It is indicated for the treatment of panic disorder, with or without agoraphobia. Panic disorder is characterized by the occurrence of unexpected panic attacks and associated concern about having additional attacks, worry about the implications or consequences of the attacks.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />It is also indicated alone or as an adjunct in the treatment of the Lennox-Gastaut Syndrome (petit mal variant), akinetic and myoclonic seizures. It may be indicated in patients with absence seizures (petit mal) who have failed to respond to succinimides.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />The effectiveness of Clonazepam in long-term use, that is, for more than 9 weeks, has not been systematically studied in controlled clinical trials. The physician who elects to use Clonazepam for extended periods should periodically reevaluate the long-term usefulness of the drug for the individual patient.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"mode_of_action\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pharmacology</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Clonazepam exhibits pharmacological properties which are common to benzodiazepines and include anticonvulsive, sedative, muscle relaxing and anxiolytic effects. The central actions of benzodiazepines are mediated through an enhancement of the GABAergic neurotransmission at inhibitory synapses. In the presence of benzodiazepines the affinity of the GABA receptor for the neurotransmitter is enhanced through positive allosteric modulation resulting in an increased action of released GABA on the postsynaptic transmembrane chloride ion flux.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />There are also animal data showing an effect of clonazepam on serotonin. Animal data and electroencephalographic investigations in man have shown that clonazepam rapidly suppresses many types of paroxysmal activity including the spike and wave discharge in absences seizures (petit mal), slow spike wave, generalized spike wave, spikes with temporal or other locations as well as irregular spikes and waves. Generalized EEG abnormalities are more regularly suppressed than focal abnormalities. According to these findings clonazepam has beneficial effects in generalized and focal epilepsies.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"dosage\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Dosage &amp; Administration</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Oral:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Adults</span>: The initial dose for adults with seizure disorders should not exceed 1.5 mg/day divided into three doses. Dosage may be increased in increments of 0.5 to 1 mg every 3 days until seizures are adequately controlled or until side effects preclude any further increase. Maintenance dosage must be individualized for each patient depending upon response. Maximum recommended daily dose is 20 mg.</li>\r\n</ul>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\">The initial dose for adults with panic disorder is 0.25 mg given in two divided dose. An increase to the target dose for most patients of 1 mg/day may be made after 3 days.</li>\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Pediatric Patients</span>: In order to minimize drowsiness, the initial dose for infants and children (up to 10 years of age or 30 kg of body weight) should be between 0.01 and 0.03 mg/kg/day but not to exceed 0.05 mg/kg/day given in two or three divided doses.</li>\r\n</ul>\r\n<br style=\"box-sizing: border-box;\" />Injection:<br style=\"box-sizing: border-box;\" />\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Infants and children</span>: half of a vial (0.5 mg) by slow IV injection or by IV infusion.</li>\r\n</ul>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 9px;\">\r\n<li style=\"box-sizing: border-box; list-style-type: square;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Adults</span>: 1 vial (1 mg) by slow IV injection or by IV infusion. This dose can be repeated as required (1-4 mg are usually sufficient to reverse the status). In adults, the rate of injection must not exceed 0.25 - 0.5 mg per minute (0.5-1.0 ml of the prepared solution) and a total dose of 10 mg should not be exceeded.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"tx-0-9 mt-5 mb-15\" style=\"box-sizing: border-box; font-size: 0.9em; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; background-color: #f5f5f5; margin-top: 5px !important; margin-bottom: 15px !important;\"><a style=\"box-sizing: border-box; background-color: transparent; text-decoration-line: none; transition: color 0.2s ease 0s;\" href=\"https://medex.com.bd/news/104/danger-of-taking-medication-without-doctors-advice\" target=\"_blank\" rel=\"noopener\"><em style=\"box-sizing: border-box;\">* চিকিৎসকের পরামর্শ মোতাবেক ঔষধ সেবন করুন</em></a>\'</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"interaction\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Interaction</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Clonazepam does not appear to alter the pharmacokinetics of phenytoin, carbamazepine or phenobarbital. The effect of Clonazepam on the metabolism of other drugs has not been investigated.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"contraindications\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Contraindications</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">It should not be used in patients with a history of hypersensitivity to benzodiazepines, nor in patients with clinical or biochemical evidence of significant liver disease. It may be used in patients with open angle glaucoma who are receiving appropriate therapy but is contraindicated in acute narrow angle glaucoma.</div>\r\n</div>\r\n<div class=\"margin-tb-5\" style=\"box-sizing: border-box; margin-top: 5px; margin-bottom: 5px; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">&nbsp;</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"side_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Side Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">The most frequently occurring side effects of Clonazepam are referable to CNS depression. Experience in treatment of seizures has shown that drowsiness has occurred in approximately 50% of patients and ataxia in approximately 30%. In some cases, these may diminish with time; behavior problems have been noted in approximately 25% of patients. Abnormal eye movements, aphonia, coma, tremor, vertigo, confusion, depression, amnesia, hallucinations, hysteria, increased libido, insomnia, psychosis &amp; palpitations may also occur.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pregnancy_cat\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Pregnancy &amp; Lactation</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Pregnancy</span>: From preclinical studies it cannot be excluded that clonazepam possesses the possibility of producing congenital malformations. From epidemiological evaluations there is evidence that anticonvulsant drugs act as teratogens. However, it is difficult to determine from published epidemiological reports which drug or combination of drugs is responsible for defects in the newborn. The possibility also exists that other factors e.g. genetic factors or the epileptic condition itself may be more important than drug therapy in leading to birth defects. Under these circumstances, the drug should only be administered to pregnant women if the potential benefits outweigh the risk to the foetus. During pregnancy, Clonazepam may be administered only if there is a compelling indication. Administration of high doses in the last trimester of pregnancy or during labour can cause irregularities in the heartbeat of the unborn child and hypothermia, hypotonia, mild respiratory depression and poor feeding in the neonate. It should be borne in mind that both pregnancy itself and abrupt discontinuation of the medication can cause exacerbation of epilepsy. Withdrawal symptoms in newborn infants have occasionally been reported with benzodiazepines.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Nursing Mothers</span>: Although the active ingredient of Clonazepam has been found to pass into the maternal milk in small amounts only, mothers undergoing treatment with this drug should not breastfeed. If there is a compelling indication for Clonazepam, breastfeeding should be discontinued.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"precautions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Precautions &amp; Warnings</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">When used in patients in whom several different types of seizure disorders coexist, Clonazepam may increase the incidence or precipitate the onset of generalized tonic-clonic seizures. This may require the addition of appropriate anticonvulsants or an increase in their dosages. The concomitant use of valproic acid and Clonazepam may produce absence status.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"pediatric_uses\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Use in Special Populations</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Pediatric Use</span>: In infants and small children Rivotril may cause increased production of saliva and bronchial secretion. Therefore special attention must be paid to maintaining patency of the airways.&nbsp;<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Geriatric Use</span>: Benzodiazepine pharmacologic effects appear to be greater in elderly patients than in younger patients even at similar plasma benzodiazepine concentrations, possibly because of age-related changes in drug&ndash;receptor interactions, post-receptor mechanisms and organ function.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Renal Impairment</span>: Renal impairment does not affect the pharmacokinetics of clonazepam. Based on pharmacokinetic criteria, no dose adjustment is required in patients with renal impairment.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Hepatic Impairmen</span>t: Plasma protein binding of clonazepam in cirrhotic patients is significantly different from that in healthy subjects (free fraction 17.1&plusmn;1.0% vs 13.9&plusmn;0.2%). Although the influence of hepatic impairment on clonazepam pharmacokinetics has not been further investigated, experience with another closely related nitrobenzodiazepine (nitrazepam) indicates that clearance of unbound clonazepam might be reduced in liver cirrhosis.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"overdose_effects\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Overdose Effects</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Symptoms</span>: Benzodiazepines commonly cause drowsiness, ataxia, dysarthria and nystagmus. Overdose of Clonazepam is seldom life-threatening if the drug is taken alone, but may lead to areflexia, apnoea, hypotension, cardiorespiratory depression and coma. Coma, if it occurs, usually lasts a few hours but it may be more protracted and cyclical, particularly in elderly patients. Increased frequency of seizures may occur in patients at supratherapeutic plasma concentrations. Benzodiazepine respiratory depressant effects are more serious in patients with respiratory disease. Benzodiazepines increase the effects of other central nervous system depressants, including alcohol.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Treatment</span>: Monitor the patient&rsquo;s vital signs and institute supportive measures as indicated by the patient&rsquo;s clinical state. In particular, patients may require symptomatic treatment for cardiorespiratory effects or central nervous system effects. Further absorption should be prevented using an appropriate method e.g. treatment within 1-2 hours with activated charcoal. If activated charcoal is used airway protection is imperative for drowsy patients. In case of mixed ingestion gastric lavage may be considered, however not as a routine measure. If CNS depression is severe consider the use of flumazenil, a benzodiazepine antagonist. This should only be administered under closely monitored conditions. It has a short half-life (about an hour), therefore patients administered flumazenil will require monitoring after its effects have worn off. Flumazenil is to be used with extreme caution in the presence of drugs that reduce seizure threshold (e.g. tricyclic antidepressants). Refer to the prescribing information for flumazenil, for further information on the correct use of this drug.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"drug_classes\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Therapeutic Class</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Adjunct anti-epileptic drugs, Benzodiazepine hypnotics</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"reconstitution\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Reconstitution</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\"><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Slow intravenous injection</span>: The contents of the vial must be diluted with 1 ml of water for injection prior to administration so as to avoid local irritation of the veins. The injection solution should be prepared immediately before use. IV injection should be administered slowly with continuous monitoring of EEG, respiration and blood pressure.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Intravenous infusion</span>: Clonazepam (the vial) can be diluted for infusion in a ratio of 1 vial (1 mg) to at least 85 ml diluting media. The diluting media can be any of the following: sodium chloride 0.9%; sodium chloride 0.45% + glucose 2.5%; glucose 5% or glucose 10%. These mixtures are stable for 24 hours at room temperature. Infusion bags other than PVC should be used for infusing Clonazepam. If PVC infusion bags are used then the mixture should be infused immediately or within 4 hours. The infusion time should not exceed 8 hours. Do not prepare Clonazepam infusions using sodium bicarbonate solution, as precipitation of the solution may occur.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; font-weight: 600; color: #397950;\">Intramuscular injection</span>: The IM route should be used only in exceptional cases or if IV administration is not feasible.</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; color: #828282; font-family: n7z, \'Open Sans\', sans-serif; font-size: 14px; background-color: #f5f5f5;\">\r\n<div id=\"storage_conditions\" style=\"box-sizing: border-box;\">\r\n<h4 class=\"ac-header\" style=\"box-sizing: border-box; font-family: \'Bahnschrift Regular\', sans-serif; font-weight: 500; line-height: 1.1; color: #334e52; margin-top: 9px; margin-bottom: 9px; font-size: 19px; background: rgba(54, 76, 99, 0.25); padding: 8px;\">Storage Conditions</h4>\r\n</div>\r\n<div class=\"ac-body\" style=\"box-sizing: border-box; margin-bottom: 7px; color: #3f5264; background: inherit; margin-top: -8px; padding: 10px 8px;\">Keep in a dry place away from light and heat. Keep out of the reach of children.</div>\r\n</div>', 0, 'clonazepam', '2021-08-23 12:36:31', '2021-08-23 12:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\"]', 1, '2019-03-12 06:38:23', '2019-03-12 06:38:23'),
(2, 2, '[\"10\"]', 1, '2019-03-12 06:44:54', '2019-03-12 06:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `location_id` int(100) NOT NULL,
  `added_by` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vacancy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_status` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(10) NOT NULL,
  `age` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application_deadline` date DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_img` int(11) DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(191) NOT NULL DEFAULT 0,
  `deadline` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `category_id`, `location_id`, `added_by`, `digital`, `user_id`, `email`, `phone`, `company`, `education`, `experience`, `salary`, `vacancy`, `employment_status`, `address`, `address2`, `gender`, `age`, `application_deadline`, `job_title`, `slug`, `short_description`, `job_description`, `banner`, `meta_title`, `meta_img`, `meta_description`, `meta_keywords`, `status`, `deadline`, `deleted_at`, `created_at`, `updated_at`) VALUES
(46, 5, 11, '', 0, 8, '', '', 'Labaid Cancer Hospital', 'MBBS and MPH (Hospital Management), A board certification in family medicine and emergency care.', 'At least 15 year(s)', '10000', '4', 'Full Time', '', NULL, 3, '22 to 20 years', NULL, 'Medical Director', 'medical-director', 'Medical Director', '<div class=\"job_des\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Job Responsibilities</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 40px; padding: 0px;\"><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Examining and coordinating the facility\'s activities to guarantee medical quality.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Ensuring that the medical staff and facility comply with the rules, regulations and codes.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Assisting with training, continuing education, and promotion of subordinate staff.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Managing the facility\'s budget.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Updating, amending, and replacing medical policies with the advice of the medical board.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Evaluating and managing any disfunction of medical units.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Keeping medical knowledge, experience and licenses up to date.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Monitor and guide the medical teams with guidance for operational excellence.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Assist in train and evaluate performance for medical and non-medical employees.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Coordinate with every department to ensure high quality medical services.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Coordinate with the doctors for patient care.</li></ul></div><div class=\"job_nat\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Employment Status</h4><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 20px; line-height: 24px; color: rgb(92, 92, 92);\">Full-time</p></div><div class=\"edu_req\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Educational Requirements</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 40px; padding: 0px;\"><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">MBBS and MPH (Hospital Management), A board certification in family medicine and emergency care.</li></ul></div><div class=\"edu_req\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Experience Requirements</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 40px; padding: 0px;\"><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">At least 15 year(s)</li></ul></div><div class=\"job_req\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Additional Requirements</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 40px; padding: 0px;\"><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Work experience of minimum 15 years in hospital industry.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Should have experience of minimum 5 years in hospital administration.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Strong communication, interpersonal, and presentation skill.</li><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">Competencies : Leadership, Teamwork, Communication, Moving Forward in Changing Environment.</li></ul></div><div class=\"job_loc \" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px; line-height: 24px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Job Location</h4><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 20px; line-height: 24px; color: rgb(92, 92, 92);\">Dhaka (Dhanmondi)</p></div><div class=\"salary_range\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Salary</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 40px; padding: 0px;\">Negotiable</ul></div><div class=\"oth_ben\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif, solaimanlipi; font-size: 14px;\"><h4 style=\"font-family: inherit; font-weight: bold; line-height: 1.1; color: rgb(92, 92, 92); margin: 20px 0px 6px; font-size: 14px;\">Compensation &amp; Other Benefits</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 40px; padding: 0px;\"><li style=\"color: rgb(92, 92, 92); line-height: 24px; padding-bottom: 5px;\">As per company policy</li></ul></div>', 1, NULL, NULL, NULL, NULL, 1, '2021-09-29', '2021-05-21 20:29:12', '2021-05-20 10:39:18', '2021-05-21 20:29:12'),
(47, 10, 11, '', 0, 9, '', '', 'MS ToTo', 'BSc in CSE', 'At least 15 year(s)', 'Negotiable', '4', 'Part Time', 'sanarpar collage road', 'army villa', 2, '22 to 28 years', NULL, 'DOT Net developer Needed', 'dot-net-developer-needed', 'NET Software Developer is a software developer who specialises in building software for Microsoft\'s Windows platform. They work with programming languages compatible with Microsoft\'s . NET framework, including VB.NET, C# (C sharp) and F# (F sharp).', '<p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><em style=\"outline: none;\"><span style=\"outline: none; font-weight: 700;\">NOTE: The following information is excerpted from&nbsp;</span></em><span style=\"outline: none; font-weight: 700;\"><em style=\"outline: none;\"><a href=\"http://www.softwarespecialists.com/5-skills-every-net-developer-needs-in-2016/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"outline: none; color: rgb(96, 195, 34);\">5 Skills Every .NET Developer Needs In 2016</a>&nbsp;</em></span><em style=\"outline: none;\"><span style=\"outline: none; font-weight: 700;\">via Software Specialists.&nbsp;</span></em></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><span style=\"outline: none; font-weight: 700;\">“The most important skills for a great .NET developer include…”</span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><span style=\"outline: none; font-weight: 700;\">1. Database Administration</span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\">Data is rapidly becoming one of the&nbsp;<em style=\"outline: none;\">most</em>&nbsp;important aspects of development, and .NET is no exception. .NET developers should be well-versed not only in Microsoft’s own SQL databases but also emerging technology such as NoSQL.</p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><span style=\"outline: none; font-weight: 700;\">2. Mobile Development</span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBMSExMSFBQVFxQVGBIVEhkTEhoZEhcSGhkZGBcXFxkaHywjGh0pHhcXJDYlKi0vNDMzGiI4PjgwPSwyMy8BCwsLDw4PHRISHjIgIiAyMi8yMjIyLzQyMi8yLy8yMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABQECAwQGBwj/xABHEAACAQIBBwYKBwcDBQEAAAABAgADEQQFBhITITFRQWFxkZLRFBYiMlJTgZOhsTM0QnKywdIVI0NUYuHic6LwBzWjs8Jj/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAECBAMFBv/EADIRAAIBAgEICgIDAQEAAAAAAAABAgMRIQQSEzFRUpGhFDIzQWFxgbHR4QXBFULwwjT/2gAMAwEAAhEDEQA/APQIiJ0OYiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIibVHAu221h/V3b5ANWJJDJR5X/wBv95Y+S2G5gekW74uibM0Il9SkyecLfLrlkkgREQBERAEREAREQBERAEREAREQDBrTKa0yyIIMq1CSBM0103ibEEiIiAYncgyzWmK2+WQQX60xrTLIgF+tMa0yyVgF2tMa0y2UgF+uMa0zJh8G9TzV2cTsXr5ZvLkVuVlHQCe6LolJsjdaZejMxCgXJ2ATbq5IqDaCrdGw/Hvm3kfCFQXYWY7ACNoHL1yLoJM2MFgwgBNi3KeQcw75uxEodBMdRuSZJrsbmAUKg7DtHPIrH4Up5a+byjlH9pLSjC+w7jv6JKdiGrnNa0xrTMmMoatyvJvXoP8Az4TBLnMv1pjWmWxALtaY1xlk08oZTpUNHWMRpX0QFJOzfu6RLKLk7LEiUlFXbsb+tMy02uJz/jNhfTbsGZKedOEA89uw0voKu6+D+Dn0ilvLiifiQfjXhPTbsNHjXhPTbsNGgq7r4P4HSKW8uKJp2sLzDrTIl86cIRbTbsNGFy7h6jqiMdJvNuhAJ32vI0NRYuL4MKvTbspLiiW1pjWmWROZ1KzVyni9RSero6WgL2va5JAG3k2mbMis5/qlboX8ay8FeST72Vm7QbWxkGufBB+gHvv8Jk8fT/Lr77/CSOZKg4QbB9JU5OiT+gOA6pslCknbN5s85VqrV87kjj/H0/y6++/wjx9P8uvvv8J2GgOA6o0BwHVIzaW7zZOlq73JHFtnySb6hfff4TNh872e/wC5AA//AG5ezOu0BwHVMyoANw6pDjS3ebJVSq/7ckcl40H1Q95/jHjOfUjt/wCM6/QHAdU5vPNRq6Wz7TfKRGMG7ZpaVSqlfO5IlqL6aq/pBW6xeZJgwX0VP7qfhEzzI9ZuWoTfyZgtYdJvMH+48OiR86vDUgiqo5AOvlPXKtloq5eqgCwFgN1pfE8uztzwxlDF1aNJ1REKKo0FYm6KxJLA7bkyaVKVR2iRVrRpK8j1GJ4t4+ZR9cvuqf6ZTx8yj65fdU/0zR0KptXP4M/T6Xjy+T2qJ4r4+ZR9cvuqf6Y8fMo+uX3VP9MdCqeHP4HT6Xjy+T2aoeSY546c+8oeuX3NP9MePWUPWr7mn+mOg1Nq5/BH8hS2Pl8nsUTzLNbPDF1sXRo1HV0csrDVqpHkkggqBtuBPTZnq0pU3ZmmlWjVjeJF5aTYjdK/mPkZFyYyyfIX735GQ8iOomWsRESSCk5bPAeXQ6Kv5TqZy+d/n4foq/8AzNOSdsvX2Zjy/wD88v8Ad5BaA4DqjQHAdUuie0fMXNmhkqrUXSp0HddoutMstxv2gTJ+wsT/AC1X3LfpkjknOqthqYpItMqCxBcMWuTc7iJu+PmJ9Cj1N+qZpSr3ebFW8zfCnkjinKck+/D6OaoZOqVL6ukz6OxtCmWseBsNkrklR4TQt6R+UkskZxVsKHCKh1hu2mrHbt3WYcZHZK+s0PvH5S03PNndYWw4MpRUFUp5rbd8fDHCx3crETwz6cpIrOf6pW6F/GslZFZz/VK3Qv41nSl14+aKVepLyfsYcyPqg/1Kn5ToJz+ZH1Qf6lT8p0E2T6zPMh1UIiJUsXoJklALSsozqlYTm89Po6X3m+U6Sc3np9HS+83ylodZFZ9Vklgvoqf3U/CJnAmrhGYJRAW4KppG4GiNAWNuXbsknkdahOnqb6KOR+8XZVFtFPaDv3CY5YHorUiQwOSgLNU2neF5B08TJeR74mtZiKFyERlGtUaTk+Wl+TR47jL2r1QSBRuBURQdYovTIGlUtyaJuNHebTmzobs8Oz7/AO44n71P/wBST3GeHZ9/9xxP3qf/AKkmvIe0fl+0YvyHZrz/AEzn53uEyHRxGS6ARFGKdcRUpuFAeoadRgaZblJVtg/p5py+Tcj66hiK+tprqAp0HPlvfhw4DidknK2UTQyfkurTYaylUxL2vt899jDfYgkdBmys72UXin/y3wMVBZt3JYOPLOS4mnlDC01yThaoRRUetWV3CgVGUGpYFt5AsOqdTl+lqKqpQyVRrIURy4wzMNM6VxdVtyA+2R2e+IoPgKDUGGjUrVKugCNJGqK7OpA3WYtJbOXC4utVVsLjKdOnq0BXwor5QLXOiuzcV280zOV7N4K8td/A1xjm3UcbKOq3jtwOXzayrReslBsHh3Fat5zJdkSow8hL/ZUHZKZ34+kKlfCJhaFPQqaIqU00all5NnGR+Q6OpyhQRmXyK6KzK3keS4BIPDZvludjhsbiSCCDVaxBuCOYzSoR0uGy/ft+DK6k9C77balqt5bTLmV9fw33z+Bp7ZPE8yvr+G++fwNPaqjEKxUaRAJUXtc22C53X4zJl3aLy/bNn4/s35/pF008Tk9H3DRbiN3tEo2JrWJFC5CU2A1q7ajHy0vyaI233GXmvV0iNVs1ioDprtpkXNW3MdmjvmM26yErUmRirDaOojiJZJHH6yoik0bEa0k6xToqvm9OmNvNIY1alr6rbohrawefyp/eXRRo2JyWe9TRaiw5A/zWdO1R7n93s0lAOmNqnzm9nDlnK5+fweh/mk0ZL2q9fZmTLOxfp7o5nw5o8OaakT1c5ni6KGw2/Dmjw5pI5KyZhqlMPUraDksCusQbAdmxheboyHg/5n/y0u6VdWxbQR2IgfDmkjkCuXxNG/I35GYsk4ChUFTWVdDRICeWi6Q27fK3+yUzY+s0ukfIyJyvGS8H7FqdOMZxaXevc9KlZSVnin0BSRWc/wBUrdC/jWS0ic5/qlb7q/jWXp9ePmilXqS8n7GHMj6oP9Sp+U6CcDkDOWnhqOram7HSZrqRbbbj0ST8d6XqqnWs9CVOTbwPKjOKSxOrl6CciM9qZ2aqp2lm6udlMD6J+0spKErai8ZxvrOlic5420/Vv2ljxtp+rftLKZkth00kdp0c5vPT6Ol95vlK+NtP1b9pZFZdyyuJVFVGXRJJ0iDe4tyS0ISUlgUnOLi8TpsF9FT+6n4ROpyQtqS85YnrI/Kctgvoqf3U/CJ0mRKl6ZXlUnqO0fG8wTPVh3EnEROZ0E8Tz8w7jKGIJR7MabKdE2ZdWguDyi4I9k9sidqFbRSva5wr0NNHNvY+ctQ/oN2TGpf0W7Jn0bKGaunvd5mT+OW9y+z5z1L+g3ZMpqG9Fuoz6ILXmnkzEGpSVy6uTp+UisqmzEbA23kt7I6e93n9D+OW9y+zwTUv6DdkxqX9Fuoz6GvF46e93n9D+OW9y+zxfMnDucfhyFayszMdE2ChG2k8g3dc9ni8TLXraWV7WNdCjoY5t7iIicTuCL7Jy9p0lepoKzcAT7eSc1LRKSE5DPoXNHof5pOwnH59/wAHoqfNJqyXtV6+zMeWdi/T3RyOrPD4xqzw+MsieoePiX6s8PiI1Z4fES6nhnYXVHI4qhI6wJd4FU9U/u27owJszHqzw+Ikrm0pGJpX4j5GRdOgzX0UZrb9FSbdNpJZsfWaXSPkZWfVfk/YtTTz4+a9z0qVlJWeKe+Ja6ggggEHYQRcEcCJdKQDXTJ1C4/c0vdr3S+rgKKkWw1NuinT/ObCbxNiTnMjNWwjkwtEG/gi+ynSH5zZ/c/yS9inNiIzmTZf5I1mahuODXsU5pnD0uSh1pT75u1t8si7IzUayYamb3oqOlE29Uv8DperTsL3TNKxdiyKTYwWJNNg3JuYcR3zBEgk6ylUDAMpuDumScph8S1M3U9IPmnpEkqeWvSTsn8jKZpfORMxIr9tL6LfDvj9tL6LfDvizJuiVmOoeSR37aT0H+HfLGyuh+y3w74sxdEhNXJpbVLpazSu99cFFTzjbSC7OjmtMIysnot8O+aeS8pU1pKoS1i+xKmsXzidjsbmLMXRORI79rJ6LfDvj9rJ6LfDvizF0SMSO/ayei3w75xmcf8A1FbDYsUqVJalNFGuDEq+sO2yMLgWW28G5PJaLC6PRInJZLz/AMHiLKt0c/YqkKb8FbaG9hvzTexOOd9nmrwH5nlhK4ckjPlPFh/IU+SN54nukfKSsujm3cTj8/P4PQ/zSdfIfL+RjitCzBSmkNq3BBtw6J2yeSjUTeGv2M+UwlOk1HF4e6Z5vE6/xNb1idg98yLmSx/jJ2T3z0OkUt73+DzejVt32+SEydl6pQQU1RCAWN2vfab8hm142VfV0/8Ad3yT8R29anYbvjxIb1qdhu+V0tDaufwW0FfdfL5OdyZlmphxUCqp0zpHSvsO3dY88vzY+s0ukfIydbMhgL61Owe+bGS81zRqpVLqQpvYKbk2IG0nniValmuz1rxJhk9bOV46mtnydLKykrPLPXEpKykAvTeJsTXTeJsQSIiIBgrb5jmStvmOCCsREAREQBERAKREE22ncN8ASsh/GTC+sPYbujxlwvpnsP3Troam6+By09LeXFExNfAn92u0HztyaA3n7PJI/wAZcL6Z7D90spZw4VVC612tfayOW332nRjQ1N18Bp6W8uJNykiPGXC+sPYbujxlwvrD2H7o0NTdfAaelvLiTE5DOLMKrUd8RRqKWcl3pVPJIY79F923gbW4zq8j41K506baQBKtdSLEAE7COBHXNvL+Gq1cNWp0WVaroUUuSFAOxtoBIOjcA8l55+U1ZU5qGrbc2UYxnHO1+R4GR/zeJ33/AE+yu76eGqMWCLp0iTchQQrJfh5SkcNvNI/L+ZvgtPCKtQvia7im1PZoaWjpMyEC+ipsCTxvs3TsciZBo4RRoKDU0bPUI8tr2JA9FbgbBwE0Qkpq8dRzmrYMloiJcoJSViAUmeju9swTPR3e2AZIiIJLKu7qmvNiru6prwQViIgCUiIBem8TYmum8TYgkREQDBW3zHL62+WQQViUiAViUiAJW0o26eXjEuf4jds980UKGlvjaxmyjKVRtdXv9HqNpjreY/3W+RnmfhD+m3aPfO8ySxbCISSToNtJueUSa2TOkk73K0MrVZtWtZHnoiBBnsPWeEtRWUmpeLymcdMzxNuJZQ3e2XyyKPBnY5nY1KVFy1REJc+cwBI0V5DOwwGMFUBlIKm9iu42NjPKMNuMncjZeqYa62DpY2VjbRY7bg8L7xPnPyWTupNuOu/I+l/H1c2lFPVY7HKz0lqU2c0xUs4ps+iH0TbSCsdtt2yWKb7RtHNunC5RyjUxD6dRr2uFAFlUcAJgoV3pm6MVP9Jt18Yo0nCmovuOlSedJs9BlZF5Eyka6ENbWJbStuIO5ubcZJzoVKxKRIAmeju9swTPR3e2AZIiIJLKu7qmvNiru6prwQViUiAZtTzxqeeZYgkxrTsb3mSIgCIiAWOlze8t1PPMsQDFqeeNTzzLEAxannjU88yxAMJo7Dt4zyVdwnr53HoM8gXcJ6GQf29P2eV+S/p6/oT0XIlO+DQ3+w/zaedT0rIC3wdMDeVcD2lp0y7qLzKfje0l5fs81ESX8W8Z6k+8T9UeLeM9SfeJ+qaXVp7y4mNUKtuq+DOeYWMpMuIpsjujCzKzKw4MDYjZzzFILGxSGyXytGmxUECZqeHdmCqt2YgKL7ydgEnSQWDa4lXRqPHNfBmTDbjMssSkyEqwswJBF9xGw7ucS+eVXadSTR7WTpqlFPYJUKSC3ILA+29vkZSbeHq0xRrIxOm5pavZs8kktc8mwzkdyRzTP7519KmesMveZ1+p55w+bdTRxNPn0161P52neyrLIxannjU88yxIJMWp55eq2l0QBERAKOtxaY9TzzLEAxannjVc8yxAEREAREQBERAEREAQTaJqZUwxq0KtNbaVSnURdLzbspAvzbYBsa1fSXtCNavpL2hPKMpZvVMO4puaZJUN5BJFiSOVRwM1P2c39PX/AGk5pXOPYTVSx8pdx+0J5Ep2CYv2c/BeuPAX4DrmmhW0V8L3MuU5PprY2t67DNeek5uVFGEo+Uvmn7Q9Izy/wJ+EocE3D4f2k16+lja1iuT5NoZN3vfwsey61fSXtCQ+JzqwlN2pmoSVJVtFGIuNhANts8x8DbgOo90r4K3/AC/dM8VHvx/3kzU3Luw5/tGfKddalatUXzXqVHW4sdFmJGzoM1Zd4M3NHg55prWVWVrc/oxPI7u7ly+yTyfVpaIFSpoAb7IWO/kAsPjOryU+Cp6NRTUdvss43chsuy04Dwc80eDHmmebUne1vX6NcE4qzd7eH2zvsJVwyvUaoivp1ajeWmkVp7SoXbsYs1yeAmfFNk9qbhKZD6LaBFxZ9uj9rjaedeDHmjwY80zOinLOu+LOyqNK1lwOip4N22Ar2pnpZLdiAXpryXLH8hOW8GPNHgx5p2OZ6PknISUqi1HqoxW+iF2DSta5JO3fOg1q+kvaE8Y8GP8ATLqWCLMqjRuxVRfdcmw5JFi1z2dXB3EHoN5WQGaeRamDSolQoS7Kw1ZJFgLbbgSflSRERBIiIgCIiAIiIAiIgCIiAIiIAiIgCIiAcZnf9Ov+mv4nkFES61FGIiIAiIgCIiAItEQCmiOA6pTQHAdURAGrXgOqU1S8BEQCmpXhGpXh8YiAU1C8/XMuDoDWU9/n0/xCViAenmIiULiIiAIiIAiIgCIiAf/Z\" style=\"width: 300px;\"><span style=\"outline: none; font-weight: 700;\"><br></span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\">Developers who truly want to prepare for the future will develop their mobile application skills, including developing .NET applications for Windows Phone operating systems.</p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><span style=\"outline: none; font-weight: 700;\">3. ASP.Net&nbsp;MVC</span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\">.NET developers who are looking to improve their frameworks and development speed may want to exp lore&nbsp;<a href=\"https://stackify.com/asp-net-razor-pages-vs-mvc/\" style=\"outline: none; color: rgb(96, 195, 34);\">ASP.Net MVC</a>, its advantages, and its disadvantages; even if you ultimately decide to use a different framework, the&nbsp;<em style=\"outline: none;\">knowledge</em>&nbsp;is still incredibly important.</p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><span style=\"outline: none; font-weight: 700;\">4. Web Development</span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\">A .NET developer who knows HTML, CSS, and JavaScript can build&nbsp;<em style=\"outline: none;\">both</em>&nbsp;sides of an application, making them a versatile and useful member of any team. Client-side web knowledge will also help a developer tie in their application back-ends more effectively.</p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><span style=\"outline: none; font-weight: 700;\">5. Microsoft Certification</span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\"><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/-U4bmHHNj_k\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe><span style=\"outline: none; font-weight: 700;\"><br></span></p><p style=\"outline: none; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; text-rendering: optimizelegibility; font-size: 21.328px; font-family: ForoSans-Light, sans-serif !important;\">When considering two similar candidates, hiring managers will almost always select the candidate that has advanced certifications. For a .NET developer, a Microsoft Certified Solutions Developer or a Microsoft Most Valuable Professional certification will open quite a lot of doors, especially if the developer doesn’t have formal education or training.</p>', 8, 'dot net', 8, 'NOTE: The following information is excerpted from 5 Skills Every .NET Developer Needs In 2016 via Software Specialists. \r\n\r\n“The most important skills for a great .NET developer include…”\r\n\r\n1. Database Administration\r\n\r\nData is rapidly becoming one of the most important aspects of development, and .NET is no exception. .NET developers should be well-versed not only in Microsoft’s own SQL databases but also emerging technology such as NoSQL.\r\n\r\n2. Mobile Development\r\n\r\nDevelopers who truly want to prepare for the future will develop their mobile application skills, including developing .NET applications for Windows Phone operating systems.\r\n\r\n3. ASP.Net MVC\r\n\r\n.NET developers who are looking to improve their frameworks and development speed may want to exp lore ASP.Net MVC, its advantages, and its disadvantages; even if you ultimately decide to use a different framework, the knowledge is still incredibly important.\r\n\r\n4. Web Development\r\n\r\nA .NET developer who knows HTML, CSS, and JavaScript can build both sides of an application, making them a versatile and useful member of any team. Client-side web knowledge will also help a developer tie in their application back-ends more effectively.\r\n\r\n5. Microsoft Certification\r\n\r\nWhen considering two similar candidates, hiring managers will almost always select the candidate that has advanced certifications. For a .NET developer, a Microsoft Certified Solutions Developer or a Microsoft Most Valuable Professional certification will open quite a lot of doors, especially if the developer doesn’t have formal education or training.', 'dot net', 0, NULL, '2021-09-11 06:17:38', '2021-05-20 20:51:03', '2021-09-11 06:17:38'),
(48, 5, 7, NULL, 0, 3, '', '', 'Md. Nurul Haque', 'BS in CSE', '2 years', '1,00000', '5', 'Full Time', 'malekpur', 'swgaresg', 3, '22 to 20 years', NULL, 'wow its working', 'wow-its-woaerrking', 'aergaergaergrgaergeaerg', '<p>aergaergaerg</p>', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-05-21 21:04:18', '2021-05-20 21:52:42', '2021-05-21 21:04:18'),
(49, 8, 8, NULL, 0, 8, '', '', 'selise', 'BS in CSE', '2 years', 'Negotiable', '5', 'Part Time', 'Jerusalem', 'ssssss', 3, '22 to 20 years', NULL, 'Dot NET is a Microsoft framework', 'dot-net-is-a-microsoft-framework', 'sssss', '<p>sssss</p>', 10, NULL, 10, NULL, NULL, 0, NULL, '2021-09-11 06:17:43', '2021-05-21 20:23:00', '2021-09-11 06:17:43'),
(50, 5, 7, NULL, 0, 13, '', '', 'MS ToTo', 'BS in CSE', '2 years', 'Negotiable', '5', 'Full Time', 'sanarpar collage road', 'sssss', 3, '22 to 20 years', NULL, 'new data', 'new-data', 'ssssss', '<p>sssssss</p>', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-05-21 20:28:48', '2021-05-21 20:25:44', '2021-05-21 20:28:48'),
(51, 7, 8, NULL, 0, 9, '', '', 'emed', 'MBBS and MPH (Hospital Management), A board certification in family medicine and emergency care.', '2 years', 'Negotiable', '5', 'Part Time', 'sssss', 'ssssss', 3, '22 to 28 years', NULL, 'Website Developer', 'website-developer', 'sssssss', '<p>sssssss</p>', 69, 'sssss', NULL, 'ssssss', 'ssssss', 1, '2021-02-28', '2021-09-11 06:27:00', '2021-05-21 20:46:25', '2021-09-11 06:27:00'),
(52, 8, 4, NULL, 0, 8, 'admin@admin.com', '', 'MS ToTo', 'BS in CSE', '2 years', 'Negotiable', '5', 'Full Time', 'sanarpar collage road', NULL, 3, NULL, NULL, 'laravel developer', 'laravel-developer', 'adasdasd', '<p>adsadsa</p>', 10, NULL, NULL, NULL, NULL, 1, NULL, '2021-09-11 06:26:56', '2021-05-31 08:52:59', '2021-09-11 06:26:56'),
(53, 5, 4, NULL, 0, 8, 'emp@admin.com', '01816275108', 'Beximco Pharma ltd', 'Master\'s/Graduate in any discipline', 'At lest 5 Years', '35,000-40,000 BDT', 'Not specific', 'Full Time', 'East Boxnagor, Sarulia, Demra, Dhaka-1361', NULL, 3, 'Age at most 30 years', NULL, 'Medical Promotion Officer', 'medical-promotion-officer', 'there\'s no specific college major required to become an SA teacher. Success Academy provides world-class training and unparalleled support to help teachers reach their highest potential.', '<p>there\'s no specific college major required to become an SA teacher. Success Academy provides world-class training and unparalleled support to help teachers reach their highest potential.here\'s no specific college major required to become an SA teacher. Success Academy provides world-class training and unparalleled support to help teachers reach their highest potential.here\'s no specific college major required to become an SA teacher. Success Academy provides world-class training and unparalleled support to help teachers reach their highest potential.here\'s no specific college major required to become an SA teacher. Success Academy provides world-class training and unparalleled support to help teachers reach their highest potential.</p>', 2, 'Medical Promotion Officer', NULL, 'here\'s no specific college major required to become an SA teacher. Success Academy provides world-class training and unparalleled support to help teachers reach their highest potential.', 'Medical Promotion Officer', 1, '2021-10-25', '2021-09-11 06:26:50', '2021-08-12 06:35:59', '2021-09-11 06:26:50'),
(54, 8, 4, NULL, 0, 9, 'support@emed.com.bd', '01777049429', 'eMed Health Technology Private Ltd.', 'Not mandatory, If you are good, you don’t need a certificate.', 'At lest 1 Year', 'Around 15,000 to 25,000', '1', 'Full Time', 'East Boxnagor, Sarulia, Demra, Dhaka-1361', NULL, 3, '18 to 32 Years', NULL, 'Full Time Flutter Developer', 'full-time-flutter-developer', 'Our company is hiring a Full time Mid level Flutter Developer to working for ongoing eMed\'s project- available on both iOS and Android. We require an experienced developer who will build and finish the platform from scratch to developed at all levels.', '<ul><li>Must have at least two years of Experience in Flutter App Development.\r\n</li><li>Building apps for Android, IOS &amp; Web, primarily using Flutter\r\n</li><li>Must have experience with API-based implementations.\r\n</li><li>Must have knowledge about Real-time GEO Locations.\r\n</li><li>Must have good knowledge about Admob, Unity Ads, and other third-party ad providers.\r\n</li><li>Design &amp; implement new app modules based on the product requirements using the Flutter framework.\r\n</li><li>Maintain existing codebases\r\n</li><li>Build reusable code and libraries for future use\r\n</li><li>Integrate user-interfaces elements developed by other developers and UI/UX designers\r\n</li><li>Integration of data storage solutions\r\n</li><li>Integrate various APIs from third parties\r\n</li><li>Debug existing apps components, fix issues and avoid regressions\r\n</li><li>Collaborate closely with the teams of UI/UX designers, PMs, QAs, and other developers\r\n</li><li>Optimize application for maximum speed and scalability.\r\n</li><li>48 hours of work per week\r\n</li><li>Must have the ability to handle projects individually.</li><li>Must have knowledge of web scraping using flutter &amp; Laravel.\r\n</li></ul><h6><b>Application Requirements \r\n</b></h6><ul><li>Knowledge about Dart and Flutter\r\n</li><li>At least one personal Flutter Project\r\n</li><li>The idea about any version control system.e.g. Git\r\n</li><li>Knowledge about MVC patterns plus Laravel is a plus point.</li></ul><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 1, 'Full Time Flutter Developer', NULL, 'Our company is hiring a Full time Mid level Flutter Developer to working for ongoing eMed\'s project- available on both iOS and Android. We require an experienced developer who will build and finish the platform from scratch to developed at all levels.', 'flutter job, app development job, ios developer job, android developer job, ui/ux flutter job, PWA job', 1, '2021-09-20', NULL, '2021-09-09 19:58:59', '2021-09-11 06:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `circuler_id` int(11) DEFAULT NULL,
  `job_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `father_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `skill` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_division` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_thana` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_road` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_house` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_postal_code` int(11) NOT NULL,
  `permanent_division` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_thana` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_road` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_house` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_postal_code` int(11) NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkdin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `user_id`, `category_id`, `circuler_id`, `job_title`, `location_id`, `user_name`, `name`, `status`, `father_name`, `mother_name`, `about`, `gender`, `skill`, `present_division`, `present_district`, `present_thana`, `present_area`, `present_road`, `present_house`, `present_postal_code`, `permanent_division`, `permanent_district`, `permanent_thana`, `permanent_area`, `permanent_road`, `permanent_house`, `permanent_postal_code`, `nationality`, `marital`, `nid`, `email`, `mobile`, `facebook`, `linkdin`, `date`, `agree`, `photo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1631294437, '8', 8, 54, 'Full Time Flutter Developer', 4, 'Mr. Customer', 'MD. ASRAFUZZAMAN MAHTAF', '1', 'ALTAF HOSSAIN', 'HONUFA BEGUM', 'I am a highly competent IT professional with a proven track record in designing websites, networking and managing databases. I have strong technical skills as well as excellent interpersonal skills, enabling me to interact with a wide range of clients. I am eager to be challenged in order to grow and further improve my IT skills. My greatest passion is in life is using my technical know-how to benefit other people and organisations.', NULL, 'laravel,HTML,CSS,Java', NULL, NULL, NULL, NULL, NULL, NULL, 1361, 'Dhaka', 'Dhaka', 'Dhaka', 'Boxnagor', '12', '05', 1820, 'Bangladesh', 'In a Relationship', '345678912345', 'mahtabakon01@gmail.com', '01777049429', 'https://www.facebook.com/f666999/', 'https://www.facebook.com/f666999/', '15-12-1998', 1, 'public/uploads/apply_photo/105455700_2374645076168024_4727825555335665432_n.jpg-1710529042246784.jpg', NULL, '2021-09-10 15:26:55', '2021-09-11 17:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `category_name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'pharmasist', 'pharmasist', '2021-05-12 05:06:46', '2021-05-11 16:00:09', '2021-05-12 05:06:46'),
(5, 'medical', 'medical', NULL, '2021-05-11 16:49:42', '2021-05-11 16:49:42'),
(7, 'pharmasist', 'pharmasist', NULL, '2021-05-12 04:52:52', '2021-05-14 12:59:48'),
(8, 'Software', 'Software', NULL, '2021-05-14 14:36:03', '2021-05-14 14:36:03'),
(9, 'python', 'python', NULL, '2021-05-16 11:54:35', '2021-05-16 11:54:35'),
(10, 'DOT NET', 'DOT-NET', NULL, '2021-05-20 20:38:44', '2021-05-21 21:03:29'),
(11, 'Flutter', 'Flutter', NULL, '2021-05-21 21:01:18', '2021-05-21 21:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `job_locations`
--

CREATE TABLE `job_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_locations`
--

INSERT INTO `job_locations` (`id`, `location`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'Dhaka', 'Dhaka', '2021-05-17 16:52:38', '2021-05-17 16:52:38'),
(5, 'Chittagong', 'Chittagong', '2021-05-17 16:52:49', '2021-05-17 16:52:49'),
(7, 'Rajshahi', 'Rajshahi', '2021-05-18 08:56:08', '2021-05-18 08:56:08'),
(8, 'Barishal', 'Barishal', '2021-05-18 08:57:27', '2021-05-18 08:57:27'),
(9, 'Khulna', 'Khulna', '2021-05-18 08:59:39', '2021-05-18 08:59:39'),
(10, 'Rangpur', 'Rangpur', '2021-05-18 09:00:52', '2021-05-18 09:00:52'),
(11, 'Sylhet', 'Sylhet', '2021-05-20 18:26:13', '2021-05-20 18:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 12:13:20', '2019-01-20 12:13:20'),
(3, 'Bangla', 'bd', 0, '2019-02-17 06:35:37', '2019-02-18 06:49:51'),
(4, 'Arabic', 'sa', 1, '2019-04-28 18:34:12', '2019-04-28 18:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manual_payment_methods`
--

CREATE TABLE `manual_payment_methods` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 'i have some problem', '2021-07-09 16:17:02', '2021-07-09 16:17:02'),
(2, 1, 9, 'what is this', '2021-07-09 16:18:54', '2021-07-09 16:18:54'),
(3, 1, 8, 'yes', '2021-07-09 21:35:26', '2021-07-09 21:35:26'),
(4, 1, 8, 'hello any anyone there', '2021-07-09 22:49:25', '2021-07-09 22:49:25'),
(5, 1, 11, 'ok', '2021-07-14 13:26:05', '2021-07-14 13:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2021_06_27_164859_create_job_applications_table', 2),
(7, '2021_06_28_033712_create_educations_table', 2),
(8, '2021_06_29_191540_create_postoffices_table', 2),
(9, '2021_06_30_193407_create_minor_group_ids_table', 2),
(10, '2021_06_30_233924_create_generics_table', 3),
(11, '2021_07_09_223718_create_prescriptions_table', 4),
(12, '2019_09_22_192348_create_messages_table', 5),
(13, '2019_10_16_211433_create_favorites_table', 5),
(14, '2019_10_18_223259_add_avatar_to_users', 5),
(15, '2019_10_20_211056_add_messenger_color_to_users', 5),
(16, '2019_10_22_000539_add_dark_mode_to_users', 5),
(17, '2019_10_25_214038_add_active_status_to_users', 5),
(18, '2021_07_11_080517_create_doctors_table', 5),
(19, '2021_08_04_010829_create_experiences_table', 6),
(20, '2021_08_10_024359_create_seller_stocks_table', 7),
(21, '2021_08_21_020126_create_seller_company_based_discounts_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `minor_group_ids`
--

CREATE TABLE `minor_group_ids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` int(11) DEFAULT NULL,
  `commision_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `minor_group_ids`
--

INSERT INTO `minor_group_ids` (`id`, `type`, `meta`, `name`, `icon`, `commision_rate`, `order_level`, `slug`, `created_at`, `updated_at`) VALUES
(0, '', '', '', NULL, NULL, NULL, '', '2021-07-11 00:50:26', '2021-08-16 16:48:45'),
(6, 'Physical', 'capsule', 'capsule', 5, NULL, NULL, 'capsule-pFXU2', '2021-07-11 00:50:26', '2021-08-16 16:48:45'),
(7, '0', 'Powder for Suspension', 'Powder for Suspension', 6, NULL, NULL, 'Powder-for-Suspension-a9NGX', '2021-07-11 01:51:37', '2021-07-11 01:51:37'),
(8, '0', 'Tablet', 'Tablet', 3, NULL, NULL, 'Tablet-jM3dF', '2021-07-29 14:51:01', '2021-07-29 14:51:01'),
(9, '0', 'Chewable Tablet', 'Chewable Tablet', 3, NULL, NULL, 'Chewable-Tablet-t10Pf', '2021-07-29 15:37:31', '2021-07-29 15:37:31'),
(10, '0', 'IV Injection or Infusion', 'IV Injection or Infusion', 19, NULL, NULL, 'IV-Injection-or-Infusion-KyMRc', '2021-07-31 16:01:20', '2021-07-31 16:01:20'),
(11, '0', 'Infusion', 'Infusion', 20, NULL, NULL, 'Infusion-WAbaV', '2021-07-31 16:18:30', '2021-07-31 16:18:30'),
(15, '0', 'Orally Dispersible Tablet', 'Orally Dispersible Tablet', 3, NULL, NULL, 'Orally-Dispersible-Tablet-eFoUa', '2021-08-23 20:49:19', '2021-08-23 20:49:19'),
(16, '0', 'Suppository', 'Suppository', 43, NULL, NULL, 'Suppository-ClgFo', '2021-08-23 20:55:53', '2021-08-23 20:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `func` int(11) NOT NULL DEFAULT 0,
  `months` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `func`, `months`) VALUES
(1, 0, 'jan'),
(2, 1, 'fab'),
(3, 0, 'mar'),
(5, 1, 'apr'),
(6, 0, 'may'),
(7, 1, 'jun'),
(8, 0, 'jul'),
(9, 0, 'aug'),
(10, 1, 'sep'),
(11, 0, 'oct'),
(12, 1, 'nov'),
(13, 0, 'dec');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 04:51:13', '2019-07-30 04:51:13', '2020-07-30 10:51:13'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:00:04', '2019-08-04 06:00:04', '2020-08-04 12:00:04'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 06:44:28', '2019-07-13 06:44:28', '2020-07-13 12:44:28'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:23:06', '2019-08-04 07:23:06', '2020-08-04 13:23:06'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:32:12', '2019-08-04 07:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 02:35:26', '2019-08-08 02:35:26', '2020-08-08 08:35:26'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:29:44', '2019-08-04 07:29:44', '2020-08-04 13:29:44'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 02:07:47', '2019-07-22 02:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:05:05', '2019-08-04 06:05:05', '2020-08-04 12:05:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:44:35', '2019-08-04 06:44:35', '2020-08-04 12:44:35'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:14:32', '2019-08-04 07:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 01:45:31', '2019-07-30 01:45:31', '2020-07-30 07:45:31'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 05:02:59', '2019-08-05 05:02:59', '2020-08-05 11:02:59'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 02:53:40', '2019-07-15 02:53:40', '2020-07-15 08:53:40'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 06:36:45', '2019-07-13 06:36:45', '2020-07-13 12:36:45'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:22:01', '2019-08-04 07:22:01', '2020-08-04 13:22:01'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 06:38:49', '2019-07-30 06:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:28:55', '2019-08-04 07:28:55', '2020-08-04 13:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `cancel_request` int(1) NOT NULL,
  `assign_delivery_boy` int(11) DEFAULT NULL,
  `delivery_history_date` date DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_payment` int(1) NOT NULL DEFAULT 0,
  `manual_payment_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `coupon_discount` double(20,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `seller_id`, `cancel_request`, `assign_delivery_boy`, `delivery_history_date`, `shipping_address`, `delivery_status`, `payment_type`, `manual_payment`, `manual_payment_data`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(12, 7, NULL, 9, 0, 22, NULL, '{\"id\":5,\"user_id\":8,\"address\":\"kalihati tangail\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"454\",\"phone\":\"01715153033\",\"set_default\":0,\"created_at\":\"2021-08-20 14:02:33\",\"updated_at\":\"2021-08-20 14:02:33\",\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\"}', 'cancelled', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 15.00, 0.00, '20210823-20160697', 1629728166, 0, 0, 1, 0, '2021-08-23 14:16:06', '2021-08-27 17:57:58'),
(13, 8, NULL, 9, 0, 22, '2021-09-21', '{\"id\":2,\"user_id\":8,\"address\":\"West box nogar, Shantidhara Abashik elaka, Safiuddin Market - Sanarper College Rd\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1361\",\"phone\":\"01902549358\",\"set_default\":0,\"created_at\":\"2021-06-28 01:15:10\",\"updated_at\":\"2021-06-28 01:15:10\",\"name\":\"Mr. Customer\",\"email\":\"customer@example.com\"}', 'pending', 'bkash', 0, NULL, 'unpaid', NULL, 0.40, 0.00, '20210828-09274260', 1630121262, 0, 1, 1, 0, '2021-08-28 03:27:42', '2021-09-21 00:06:58'),
(15, 9, NULL, 9, 0, NULL, NULL, '{\"id\":8,\"user_id\":9,\"address\":\"East Boxnagor, Sarulia, Demra, Dhaka-1361\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1361\",\"phone\":\"01777049429\",\"set_default\":0,\"created_at\":\"2021-09-15 04:40:51\",\"updated_at\":\"2021-09-15 04:40:51\",\"name\":\"Admin\",\"email\":\"admin@admin.com\"}', 'pending', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 36.30, 0.00, '20210915-04410743', 1631659267, 0, 0, 0, 0, '2021-09-14 22:41:07', '2021-09-14 22:41:07'),
(17, 8, NULL, 9, 0, NULL, NULL, '{\"id\":10,\"user_id\":8,\"address\":\"Baqrishal\",\"country\":\"Bangladesh\",\"city\":\"Barishal\",\"postal_code\":\"1361\",\"phone\":\"01777049429\",\"set_default\":0,\"created_at\":\"2021-09-15 08:32:59\",\"updated_at\":\"2021-09-15 08:33:07\",\"name\":\"Mr. Customer\",\"email\":\"mahtabakon01@gmail.com\"}', 'pending', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 397.50, 0.00, '20210915-08353447', 1631673334, 0, 0, 0, 0, '2021-09-15 02:35:34', '2021-09-21 00:11:13'),
(19, 8, NULL, 9, 0, 35865261, '2021-09-17', '{\"id\":1,\"user_id\":8,\"address\":\"sanarpar collage road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1360\",\"phone\":\"01635354223\",\"set_default\":0,\"created_at\":\"2021-06-28 01:14:55\",\"updated_at\":\"2021-06-28 18:34:55\",\"name\":\"Mr. Customer\",\"email\":\"mahtabakon01@gmail.com\"}', 'delivered', 'cash_on_delivery', 0, NULL, 'paid', NULL, 109.50, 0.00, '20210916-03073837', 1631740058, 0, 0, 0, 1, '2021-09-15 21:07:38', '2021-09-16 20:57:09'),
(20, 8, NULL, 9, 0, 35865261, '2021-09-17', '{\"id\":1,\"user_id\":8,\"address\":\"sanarpar collage road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1360\",\"phone\":\"01635354223\",\"set_default\":0,\"created_at\":\"2021-06-28 01:14:55\",\"updated_at\":\"2021-06-28 18:34:55\",\"name\":\"Mr. Customer\",\"email\":\"mahtabakon01@gmail.com\"}', 'delivered', 'cash_on_delivery', 0, NULL, 'paid', NULL, 169.00, 0.00, '20210916-03103131', 1631740231, 0, 1, 1, 1, '2021-09-15 21:10:31', '2021-09-16 20:59:05'),
(21, 8, NULL, 9, 0, 22, '2021-09-20', '{\"id\":1,\"user_id\":8,\"address\":\"sanarpar collage road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1360\",\"phone\":\"01635354223\",\"set_default\":0,\"created_at\":\"2021-06-28 01:14:55\",\"updated_at\":\"2021-06-28 18:34:55\",\"name\":\"Mr. Customer\",\"email\":\"mahtabakon01@gmail.com\"}', 'delivered', 'cash_on_delivery', 0, NULL, 'paid', NULL, 109.50, 3.00, '20210916-03210718', 1631740867, 0, 1, 1, 1, '2021-09-15 21:21:07', '2021-09-20 06:18:49'),
(22, 8, NULL, 9, 0, 22, '2021-09-20', '{\"id\":11,\"user_id\":8,\"address\":\"Pinky Villa,l East Boxnagor\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1361\",\"phone\":\"01909518322\",\"set_default\":0,\"created_at\":\"2021-09-20 12:04:40\",\"updated_at\":\"2021-09-20 12:04:40\",\"name\":\"Mr. Customer\",\"email\":\"mahtabakon01@gmail.com\"}', 'delivered', 'bkash', 0, NULL, 'unpaid', NULL, 71.78, 0.00, '20210920-12080845', 1632118088, 0, 1, 1, 0, '2021-09-20 06:08:08', '2021-09-20 06:21:38'),
(24, 9, NULL, 9, 0, 28, '2021-09-21', '{\"id\":7,\"user_id\":9,\"address\":\"East Boxnagor, Sarulia, Demra, Dhaka-1361\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1361\",\"phone\":\"01777049429\",\"set_default\":0,\"created_at\":\"2021-09-21 06:12:01\",\"updated_at\":\"2021-09-21 06:12:01\",\"name\":\"Admin\",\"email\":\"admin@admin.com\"}', 'delivered', 'cash_on_delivery', 0, NULL, 'paid', NULL, 114.99, 0.00, '20210921-06121344', 1632183133, 0, 0, 1, 1, '2021-09-21 00:12:13', '2021-09-21 00:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(13, 12, 9, 54, '', 15.00, 0.00, 0.00, 1, 'unpaid', 'confirmed', 'home_delivery', NULL, NULL, '2021-08-23 14:16:06', '2021-08-27 17:57:58'),
(14, 13, 9, 60, '', 0.40, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-08-28 03:27:42', '2021-08-31 05:58:55'),
(16, 15, 9, 59, '', 36.30, 0.00, 0.00, 10, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-09-14 22:41:07', '2021-09-14 22:41:07'),
(18, 17, 9, 63, '', 297.50, 0.00, 100.00, 5, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-09-15 02:35:34', '2021-09-21 00:11:13'),
(20, 19, 9, 63, '', 59.50, 0.00, 50.00, 1, 'unpaid', 'delivered', 'home_delivery', NULL, NULL, '2021-09-15 21:07:38', '2021-09-16 20:57:09'),
(21, 20, 9, 63, '', 119.00, 0.00, 50.00, 2, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2021-09-15 21:10:31', '2021-09-16 20:51:23'),
(22, 21, 9, 63, '', 59.50, 3.00, 50.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2021-09-15 21:21:07', '2021-09-20 06:17:09'),
(23, 22, 9, 59, '', 21.78, 0.00, 50.00, 6, 'unpaid', 'delivered', 'home_delivery', NULL, NULL, '2021-09-20 06:08:08', '2021-09-20 06:19:51'),
(24, 24, 9, 55, '', 14.99, 0.00, 100.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2021-09-21 00:12:13', '2021-09-21 00:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `otp_configurations`
--

CREATE TABLE `otp_configurations` (
  `id` int(11) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_configurations`
--

INSERT INTO `otp_configurations` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'nexmo', '0', '2020-03-22 09:19:07', '2021-05-11 16:11:47'),
(2, 'otp_for_order', '1', '2020-03-22 09:19:07', '2020-03-22 09:19:07'),
(3, 'otp_for_delivery_status', '1', '2020-03-22 09:19:37', '2020-03-22 09:19:37'),
(4, 'otp_for_paid_status', '1', '2020-03-22 09:19:37', '2021-07-06 00:38:53'),
(5, 'twillo', '0', '2020-03-22 09:54:03', '2021-07-06 00:38:50'),
(6, 'ssl_wireless', '1', '2020-03-22 09:54:03', '2021-07-06 00:38:49'),
(7, 'fast2sms', '0', '2020-03-22 09:54:03', '2021-07-06 00:38:47'),
(8, 'mimo', '0', '2020-12-27 09:54:03', '2020-12-28 03:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(1, 'home_page', 'Home Page', 'home', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:13:20', '2020-11-04 10:13:20'),
(2, 'seller_policy_page', 'Seller Policy Pages', 'sellerpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 12:19:30'),
(3, 'return_policy_page', 'Return Policy Page', 'returnpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 10:14:41'),
(4, 'support_policy_page', 'Support Policy Page', 'supportpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:59', '2020-11-04 10:14:59'),
(5, 'terms_conditions_page', 'Term Conditions Page', 'terms', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:15:29', '2020-11-04 10:15:29'),
(6, 'privacy_policy_page', 'Privacy Policy Page', 'privacypolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:15:55', '2020-11-04 10:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `seller_id`, `amount`, `payment_details`, `payment_method`, `txn_code`, `created_at`, `updated_at`) VALUES
(1, 1, 78.00, NULL, 'cash', NULL, '2021-08-21 20:52:50', '2021-08-21 20:52:50'),
(2, 1, 0.40, NULL, 'cash', NULL, '2021-08-21 20:53:37', '2021-08-21 20:53:37');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_point_translations`
--

CREATE TABLE `pickup_point_translations` (
  `id` bigint(20) NOT NULL,
  `pickup_point_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 12:54:45', '2019-01-22 05:13:15'),
(2, 'return_policy', NULL, '2019-10-29 12:54:47', '2019-01-24 05:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 12:54:49', '2019-02-04 17:50:15'),
(5, 'terms', NULL, '2019-10-29 12:54:51', '2019-10-28 18:00:00'),
(6, 'privacy_policy', NULL, '2019-10-29 12:54:54', '2019-10-28 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `postoffices`
--

CREATE TABLE `postoffices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `proceed_by` int(11) NOT NULL DEFAULT 2,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `action_taken_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `user_id`, `viewed`, `proceed_by`, `name`, `message`, `prescription`, `created_at`, `updated_at`, `action_taken_at`) VALUES
(4, '9', 1, 9, 'Admin', '', '8', NULL, '2021-08-07 00:40:28', '2021-08-07 00:40:28'),
(8, '8', 0, 9, 'Mr. Customer', '', '7', NULL, '2021-08-07 00:40:37', '2021-08-07 00:40:37'),
(10, '8', 1, 9, 'Mr. Customer', '', '18', NULL, '2021-08-14 06:27:51', '2021-08-14 06:27:51'),
(11, '8', 1, 9, 'Mr. Customer', '', '22', NULL, '2021-08-07 00:41:01', '2021-08-07 00:41:01'),
(12, '8', 1, 9, 'Mr. Customer', 'hello dear', '23', '2020-08-05 20:20:44', '2021-08-07 00:39:40', '2021-08-07 00:39:40'),
(14, '8', 1, 9, 'Mr. Customer', 'hello dear', '4', '2021-08-06 17:42:36', '2021-08-23 13:43:30', '2021-08-23 13:43:30'),
(15, '8', 1, 9, 'Mr. Customer', 'gggggg', '27', '2021-08-06 18:21:48', '2021-08-07 00:40:12', '2021-08-07 00:40:12'),
(25, '8', 1, 9, 'Mr. Customer', 'Golam', 'public/uploads/prescriptions/1708266985666352.jpg', '2021-08-16 16:12:29', '2021-08-21 10:37:03', '2021-08-21 10:37:03'),
(26, '8', 0, 2, 'Mr. Customer', 'Amar 1 maser ousodh lagve', 'public/uploads/prescriptions/1709306309562857.jpg', '2021-08-28 03:32:06', NULL, NULL),
(27, '8', 0, 2, 'Mr. Customer', 'Amar 1 maser ousodh lagve', 'public/uploads/prescriptions/1709306310003875.jpg', '2021-08-28 03:32:06', NULL, NULL),
(28, '8', 0, 2, 'Mr. Customer', 'Amar 1 maser ousodh lagve', 'public/uploads/prescriptions/1709306311238274.jpg', '2021-08-28 03:32:07', NULL, NULL),
(29, '8', 1, 9, 'Mr. Customer', 'hello', 'public/uploads/prescriptions/1709683932832281.png', '2021-09-01 07:34:15', '2021-09-08 12:50:58', '2021-09-08 12:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `minor_group_id` int(11) NOT NULL DEFAULT 0,
  `generic_id` int(11) NOT NULL DEFAULT 0,
  `indicates` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pack_size` text COLLATE utf8_unicode_ci NOT NULL,
  `item_strength` text COLLATE utf8_unicode_ci NOT NULL,
  `trade_price` int(11) DEFAULT NULL,
  `company_discount` int(11) DEFAULT NULL,
  `other_discount` int(11) DEFAULT NULL,
  `vat` int(11) NOT NULL,
  `pack_price` int(11) NOT NULL,
  `selling_unit_price` int(11) DEFAULT NULL,
  `buying_price` int(11) DEFAULT NULL,
  `selling_unit_buying_price` int(11) DEFAULT NULL,
  `flat_unit_price` int(11) DEFAULT NULL,
  `flat_pack_price` int(11) DEFAULT NULL,
  `flat_selling_unit_buying_price` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT 0,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `stock_visibility_state` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'quantity',
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = On, 0 = Off',
  `featured` int(11) NOT NULL DEFAULT 0,
  `seller_featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `low_stock_quantity` int(11) DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_start_date` int(11) DEFAULT NULL,
  `discount_end_date` int(11) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_quantity_multiplied` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Mutiplied with shipping cost',
  `est_shipping_days` int(11) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `minor_group_id`, `generic_id`, `indicates`, `pack_size`, `item_strength`, `trade_price`, `company_discount`, `other_discount`, `vat`, `pack_price`, `selling_unit_price`, `buying_price`, `selling_unit_buying_price`, `flat_unit_price`, `flat_pack_price`, `flat_selling_unit_buying_price`, `brand_id`, `photos`, `thumbnail_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `stock_visibility_state`, `cash_on_delivery`, `featured`, `seller_featured`, `current_stock`, `unit`, `min_qty`, `low_stock_quantity`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `is_quantity_multiplied`, `est_shipping_days`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(54, 'Aeron', 'admin', 9, 1, 8, 6, 'Cough', '30', '10mg', 420, 13, 3, 50, 450, 15, 403, 13, NULL, NULL, NULL, 5, '47', '47', 'youtube', NULL, 'Aeron', NULL, 15.00, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 25.00, 'percent', 1630000800, 1630778340, NULL, NULL, 'free', '0', 0, NULL, 1, 'Aeron', '', '47', NULL, 'aeron-ee4mz', 0.00, '123456789562', 0, NULL, NULL, '2021-08-23 13:36:51', '2021-08-26 18:30:10'),
(55, 'Monocast', 'admin', 9, 1, 8, 6, 'Monocast', '20', '10mg', 280, 13, 3, 20, 300, 15, 255, 13, NULL, NULL, NULL, 3, '48', '48', 'youtube', NULL, 'Monocast', NULL, 14.99, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 10.00, 'amount', 1630000800, 1630778340, NULL, NULL, 'free', '0', 0, NULL, 1, 'Monocast', '', '48', NULL, 'monocast-dfyv0', 0.00, '123456789542', 0, NULL, NULL, '2021-08-23 20:45:27', '2021-09-21 00:12:13'),
(56, 'Montene', 'admin', 9, 1, 9, 6, 'Montene', '20', '4mg', 100, 13, 3, 20, 120, 6, 104, 5, NULL, NULL, NULL, 7, '49', '49', 'youtube', NULL, 'Montene', NULL, 6.02, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, 'free', '0', 0, NULL, 0, 'Montene', '', '49', NULL, 'montene-fzgky', 0.00, '123456789542', 0, NULL, NULL, '2021-08-23 20:48:04', '2021-08-26 16:36:51'),
(57, 'Aeron FT', 'admin', 9, 1, 15, 6, 'cough', '30', '4mg', 150, 13, 3, 20, 180, 6, 146, 5, NULL, NULL, NULL, 5, '50', '50', 'youtube', NULL, 'aeron FT', NULL, 6.00, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 75.00, 'percent', 1630000800, 1630778340, NULL, NULL, 'free', '0', 0, NULL, 0, 'Aeron FT', '', '50', NULL, 'aeron-ft-ijiu4', 0.00, '123456789542', 0, NULL, NULL, '2021-08-23 20:51:55', '2021-08-26 18:30:10'),
(58, 'Ace', 'admin', 9, 1, 8, 5, 'pain,feaver', '500', '500mg', 400, 13, 3, 20, 400, 1, 356, 1, NULL, NULL, NULL, 7, '46', '46', 'youtube', NULL, 'ace', NULL, 2.00, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 5.00, 'amount', 0, 0, NULL, NULL, 'free', '0', 0, NULL, 0, 'Ace', '', '46', NULL, 'ace-7nfzm', 0.00, '123456789542', 0, NULL, NULL, '2021-08-23 20:54:29', '2021-08-26 16:36:52'),
(59, 'Ace', 'admin', 9, 1, 16, 5, 'pain,feaver', '20', '125mg', 70, 13, 3, 10, 81, 4, 69, 3, NULL, NULL, NULL, 7, '52', '52', 'youtube', NULL, 'ace,paracetamol', NULL, 4.03, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 10.00, 'percent', 0, 0, NULL, NULL, 'free', '0', 0, NULL, 0, 'Ace', '', '52', NULL, 'ace-0nvmd', 0.00, '123456789542', 0, NULL, NULL, '2021-08-23 20:57:54', '2021-08-26 18:19:42'),
(60, 'Napa', 'admin', 9, 1, 8, 5, 'pain,feaver', '510', '500mg', 380, 13, 3, 60, 408, 1, 379, 1, NULL, NULL, NULL, 3, '53', '53', 'youtube', NULL, 'napa', NULL, 0.80, NULL, 0, '[]', '[]', '[]', NULL, 1, 1, 'quantity', 1, 1, 0, 0, NULL, 1, 1, 50.00, 'percent', 1630000800, 1630778340, NULL, NULL, 'free', '0', 0, NULL, 1, 'Napa', '', '53', NULL, 'Napa-C5dZP', 0.00, '12456354872', 0, NULL, NULL, '2021-08-23 21:00:00', '2021-08-28 03:27:42'),
(61, 'CBC', 'admin', 9, 9, 0, 0, NULL, '', '', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '54', '54', NULL, NULL, 'CBC,Blood Test', '<p>Overview\r\n</p><p>What is IgE?\r\n</p><p>Total IgE test is also known as Quantitative IgE test. This test measures the amount of IgE in the blood. It is done to screen for an allergic disease or parasitic infection.\r\n</p><p>Why is IgE done?\r\n</p><p>In case of symptoms of allergies \r\n</p><p>In case of doubt of parasitic infection\r\n</p><p>To evaluate children having a family history of allergies\r\n</p><p>To evaluate in case of suspected allergic respiratory disease\r\n</p><p>To confirm sensitivity to foods in patients of asthma, angioedema, or cutaneous disease\r\n</p><p>To evaluate sensitivity to insect venom allergens\r\n</p><p>What does IgE Measure?\r\n</p><p>IgE test measures the amount of IgE (immunoglobulin E) in the blood. It is an antibody produced by the immune system in response to danger. Normally, it is present in very small amounts in the blood. It belongs to the class of immunoglobulins which include five types of immunoglobulins:  IgA, IgG, IgM, IgD, and IgE. \r\n</p><p>Immunoglobulins are produced by plasma cells (specific immune cells) when the body recognizes bacteria, viruses, other microorganisms or any other unknown substances as harmful foreign antigens to the immune system. \r\n</p><p>The production of IgE is seen in cases of response to allergens such as asthma and response to parasitic infections. Other allergens can include plant pollen, eggs, peanuts, bee venom, strawberries, and other allergens substances. \r\n</p><p>These IgE antibodies, once produced, bind to white blood cells and lead to the release of substances like histamine. This further causes constriction of bronchi in the lungs in allergic or asthmatic persons. Other signs and symptoms which can develop in these patients include running nose, skin itching, itchy eyes. \r\n</p><p>The severity of the reaction depends upon the body’s exposure to allergens which can be observed from mild reddening and itching of skin to problems in breathing (respiratory distress) to vomiting and diarrhea to conditions of shock. \r\n</p><p>Interpreting IgE results\r\n</p><p>Interpretations\r\n</p><p>IgE &lt; 64.0o kUA/L \r\n</p><p>*Reference range may vary from lab to lab\r\n</p><p><br></p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 250.00, 240.00, 0, '[]', NULL, NULL, NULL, 0, 1, 'quantity', 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, 0.00, 'amount', 'flat_rate', NULL, 0, NULL, 0, 'CBC', 'CBC', NULL, NULL, 'CBC-37210', 0.00, NULL, 1, '54', NULL, '2021-08-26 20:44:30', '2021-08-26 20:44:30'),
(62, 'monocast', 'admin', 9, 1, 8, 6, 'cough,buk betha,sas kosto,bedona', '30', '10mg', 450, 12, 2, 30, 450, 15, 416, 14, NULL, NULL, NULL, 3, '67', '67', 'youtube', NULL, 'monocast,respiratory infection', NULL, 15.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 'quantity', 1, 0, 0, 0, NULL, 1, 1, 0.00, 'amount', NULL, NULL, NULL, NULL, 'free', '0', 0, NULL, 0, 'Monocast', '', '67', NULL, 'monocast-egnTB', 0.00, '123456789561', 0, NULL, NULL, '2021-09-09 17:59:07', '2021-09-09 17:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `image`, `created_at`, `updated_at`) VALUES
(90, 58, '', NULL, 2.00, 500, NULL, '2021-08-25 22:19:11', '2021-08-25 22:19:11'),
(91, 54, '', NULL, 15.00, 30, NULL, '2021-08-26 16:24:45', '2021-08-27 17:57:47'),
(92, 55, '', NULL, 14.99, 19, NULL, '2021-08-26 16:27:11', '2021-09-21 00:12:13'),
(93, 56, '', NULL, 6.02, 20, NULL, '2021-08-26 16:28:57', '2021-08-26 16:28:57'),
(94, 57, '', NULL, 6.00, 30, NULL, '2021-08-26 16:30:33', '2021-08-26 16:30:33'),
(99, 60, '', NULL, 0.80, 509, NULL, '2021-08-26 16:35:34', '2021-08-28 03:27:42'),
(100, 59, '', NULL, 4.03, 20, NULL, '2021-08-26 18:19:29', '2021-08-26 18:19:29'),
(101, 61, '', '', 250.00, 5, NULL, '2021-08-26 20:44:30', '2021-08-26 20:44:30'),
(102, 62, '', NULL, 15.00, 20000, NULL, '2021-09-09 17:59:07', '2021-09-09 17:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax` double(20,2) NOT NULL,
  `tax_type` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_taxes`
--

INSERT INTO `product_taxes` (`id`, `product_id`, `tax_id`, `tax`, `tax_type`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 0.00, 'amount', '2021-06-27 19:25:26', '2021-06-27 19:25:26'),
(4, 2, 3, 0.00, 'amount', '2021-06-30 10:10:00', '2021-06-30 10:10:00'),
(5, 3, 3, 0.00, 'amount', '2021-07-05 21:15:45', '2021-07-05 21:15:45'),
(9, 4, 3, 0.00, 'amount', '2021-07-29 12:03:12', '2021-07-29 12:03:12'),
(14, 8, 3, 0.00, 'amount', '2021-07-29 15:35:22', '2021-07-29 15:35:22'),
(16, 7, 3, 0.00, 'amount', '2021-07-29 15:37:54', '2021-07-29 15:37:54'),
(17, 9, 3, 0.00, 'amount', '2021-07-29 15:40:16', '2021-07-29 15:40:16'),
(18, 6, 3, 0.00, 'amount', '2021-07-29 15:42:47', '2021-07-29 15:42:47'),
(19, 10, 3, 0.00, 'amount', '2021-08-05 23:34:03', '2021-08-05 23:34:03'),
(20, 11, 3, 0.00, 'amount', '2021-08-05 23:42:39', '2021-08-05 23:42:39'),
(21, 12, 3, 0.00, 'amount', '2021-08-06 15:56:01', '2021-08-06 15:56:01'),
(22, 13, 3, 0.00, 'amount', '2021-08-07 01:47:30', '2021-08-07 01:47:30'),
(23, 14, 3, 0.00, 'amount', '2021-08-12 09:23:35', '2021-08-12 09:23:35'),
(24, 23, 3, 0.00, 'amount', '2021-08-18 21:27:55', '2021-08-18 21:27:55'),
(25, 24, 3, 0.00, 'amount', '2021-08-23 11:42:30', '2021-08-23 11:42:30'),
(26, 25, 3, 0.00, 'amount', '2021-08-23 11:49:57', '2021-08-23 11:49:57'),
(27, 26, 3, 0.00, 'amount', '2021-08-23 11:52:19', '2021-08-23 11:52:19'),
(28, 27, 3, 0.00, 'amount', '2021-08-23 11:53:33', '2021-08-23 11:53:33'),
(29, 28, 3, 0.00, 'amount', '2021-08-23 11:55:17', '2021-08-23 11:55:17'),
(30, 50, 3, 0.00, 'amount', '2021-08-23 12:54:21', '2021-08-23 12:54:21'),
(31, 51, 3, 0.00, 'amount', '2021-08-23 13:16:13', '2021-08-23 13:16:13'),
(32, 52, 3, 0.00, 'amount', '2021-08-23 13:24:46', '2021-08-23 13:24:46'),
(35, 53, 3, 0.00, 'amount', '2021-08-23 13:33:21', '2021-08-23 13:33:21'),
(53, 58, 3, 0.00, 'amount', '2021-08-25 22:19:11', '2021-08-25 22:19:11'),
(54, 54, 3, 0.00, 'amount', '2021-08-26 16:24:45', '2021-08-26 16:24:45'),
(55, 55, 3, 0.00, 'amount', '2021-08-26 16:27:11', '2021-08-26 16:27:11'),
(56, 56, 3, 0.00, 'amount', '2021-08-26 16:28:57', '2021-08-26 16:28:57'),
(57, 57, 3, 0.00, 'amount', '2021-08-26 16:30:33', '2021-08-26 16:30:33'),
(62, 60, 3, 0.00, 'amount', '2021-08-26 16:35:34', '2021-08-26 16:35:34'),
(63, 59, 3, 0.00, 'amount', '2021-08-26 18:19:29', '2021-08-26 18:19:29'),
(64, 62, 3, 0.00, 'amount', '2021-09-09 17:59:07', '2021-09-09 17:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `name`, `unit`, `description`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'napa', '500mg', '<p>napa</p>', 'en', '2021-06-27 19:23:25', '2021-06-27 19:23:25'),
(2, 2, 'napa', '500mg', '<p>napa</p>', 'en', '2021-06-30 10:10:00', '2021-06-30 10:10:00'),
(14, 24, 'Monas', NULL, NULL, 'en', '2021-08-23 11:42:30', '2021-08-23 11:42:30'),
(15, 25, 'disopan', NULL, NULL, 'en', '2021-08-23 11:49:57', '2021-08-23 11:49:57'),
(16, 26, 'Pase', NULL, NULL, 'en', '2021-08-23 11:52:19', '2021-08-23 11:52:19'),
(17, 27, 'Ace', NULL, NULL, 'en', '2021-08-23 11:53:33', '2021-08-23 11:53:33'),
(18, 28, 'Napa', NULL, NULL, 'en', '2021-08-23 11:55:17', '2021-08-23 11:55:17'),
(21, 52, 'osud', NULL, NULL, 'en', '2021-08-23 13:24:46', '2021-08-23 13:24:46'),
(23, 54, 'Aeron', NULL, NULL, 'en', '2021-08-23 13:36:51', '2021-08-23 13:36:51'),
(24, 55, 'Monocast', NULL, NULL, 'en', '2021-08-23 20:45:27', '2021-08-23 20:45:27'),
(25, 56, 'Montene', NULL, NULL, 'en', '2021-08-23 20:48:04', '2021-08-23 20:48:04'),
(26, 57, 'Aeron FT', NULL, NULL, 'en', '2021-08-23 20:51:55', '2021-08-23 20:51:55'),
(27, 58, 'Ace', NULL, NULL, 'en', '2021-08-23 20:54:29', '2021-08-23 20:54:29'),
(28, 59, 'Ace', NULL, NULL, 'en', '2021-08-23 20:57:54', '2021-08-23 20:57:54'),
(29, 60, 'Napa', NULL, NULL, 'en', '2021-08-23 21:00:00', '2021-08-23 21:00:00'),
(30, 61, 'CBC', NULL, '<p>Overview\r\n</p><p>What is IgE?\r\n</p><p>Total IgE test is also known as Quantitative IgE test. This test measures the amount of IgE in the blood. It is done to screen for an allergic disease or parasitic infection.\r\n</p><p>Why is IgE done?\r\n</p><p>In case of symptoms of allergies \r\n</p><p>In case of doubt of parasitic infection\r\n</p><p>To evaluate children having a family history of allergies\r\n</p><p>To evaluate in case of suspected allergic respiratory disease\r\n</p><p>To confirm sensitivity to foods in patients of asthma, angioedema, or cutaneous disease\r\n</p><p>To evaluate sensitivity to insect venom allergens\r\n</p><p>What does IgE Measure?\r\n</p><p>IgE test measures the amount of IgE (immunoglobulin E) in the blood. It is an antibody produced by the immune system in response to danger. Normally, it is present in very small amounts in the blood. It belongs to the class of immunoglobulins which include five types of immunoglobulins:  IgA, IgG, IgM, IgD, and IgE. \r\n</p><p>Immunoglobulins are produced by plasma cells (specific immune cells) when the body recognizes bacteria, viruses, other microorganisms or any other unknown substances as harmful foreign antigens to the immune system. \r\n</p><p>The production of IgE is seen in cases of response to allergens such as asthma and response to parasitic infections. Other allergens can include plant pollen, eggs, peanuts, bee venom, strawberries, and other allergens substances. \r\n</p><p>These IgE antibodies, once produced, bind to white blood cells and lead to the release of substances like histamine. This further causes constriction of bronchi in the lungs in allergic or asthmatic persons. Other signs and symptoms which can develop in these patients include running nose, skin itching, itchy eyes. \r\n</p><p>The severity of the reaction depends upon the body’s exposure to allergens which can be observed from mild reddening and itching of skin to problems in breathing (respiratory distress) to vomiting and diarrhea to conditions of shock. \r\n</p><p>Interpreting IgE results\r\n</p><p>Interpretations\r\n</p><p>IgE &lt; 64.0o kUA/L \r\n</p><p>*Reference range may vary from lab to lab\r\n</p><p><br></p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2021-08-26 20:44:30', '2021-08-26 20:44:30'),
(31, 62, 'monocast', NULL, NULL, 'en', '2021-09-09 17:59:07', '2021-09-09 17:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `proxypay_payments`
--

CREATE TABLE `proxypay_payments` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `reference_id` varchar(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(25,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `doctor_id`, `user_id`, `name`, `email`, `rating`, `comment`, `status`, `viewed`, `created_at`, `updated_at`) VALUES
(7, NULL, 15, 8, 'Mr. Customer', 'customer@example.com', 4, 'ssss', 1, 0, '2021-08-18 00:18:27', '2021-08-18 00:18:27'),
(8, NULL, 15, 8, 'Mr. Customer', 'customer@example.com', 3, 'asfaef', 1, 0, '2021-08-18 00:22:11', '2021-08-18 00:22:11'),
(9, NULL, 15, 8, 'Mr. Customer', 'customer@example.com', 2, 'afdgearg', 1, 0, '2021-08-18 00:24:23', '2021-08-18 00:24:23'),
(10, NULL, 15, 8, 'Mr. Customer', 'customer@example.com', 5, 'okay', 1, 0, '2021-08-18 00:45:43', '2021-08-18 00:45:43'),
(11, NULL, 15, 3, 'Mr. Seller', 'seller@example.com', 4, 'oww', 1, 0, '2021-08-18 00:46:27', '2021-08-18 00:46:27'),
(12, NULL, 15, 8, 'Mr. Customer', 'customer@example.com', 5, 'wowow', 1, 0, '2021-08-18 15:27:33', '2021-08-18 15:27:33'),
(13, NULL, 15, 8, 'Mr. Customer', 'customer@example.com', 1, 'wwwwww', 1, 0, '2021-08-18 15:27:50', '2021-08-18 15:27:50'),
(14, NULL, 15, 9, 'Admin', 'admin@admin.com', 5, 'dhshwthwe', 1, 0, '2021-08-23 17:42:18', '2021-08-23 17:42:18'),
(15, NULL, 15, 3, 'Mr. Seller', 'seller@example.com', 1, 'ghilfguil', 1, 0, '2021-08-25 17:46:39', '2021-08-25 17:46:39'),
(16, NULL, 15, 8, 'Mr. Customer', 'mahtabakon01@gmail.com', 5, 'dtgyjty', 1, 0, '2021-09-01 08:41:14', '2021-09-01 08:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"4\"]', '2018-10-10 04:39:47', '2018-10-10 04:51:37'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 04:52:09', '2018-10-10 04:52:09'),
(3, 'Doctor', '[\"12\"]', '2021-07-09 16:27:10', '2021-07-09 16:29:29'),
(6, 'Pharmacist', '[\"1\",\"2\",\"3\",\"5\",\"12\",\"22\"]', '2021-08-05 20:34:49', '2021-08-05 20:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_translations`
--

INSERT INTO `role_translations` (`id`, `role_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 3, 'Doctor', 'en', '2021-07-09 16:27:10', '2021-07-09 16:27:10'),
(2, 6, 'Pharmacist', NULL, '2021-08-05 20:34:49', '2021-08-05 20:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(2, 'dcs', 1, '2020-03-08 00:29:09', '2020-03-08 00:29:09'),
(3, 'das', 3, '2020-03-08 00:29:15', '2020-03-08 00:29:50'),
(4, 'mona', 1, '2021-07-29 15:52:49', '2021-07-29 15:52:49'),
(5, 'monash', 1, '2021-07-29 15:52:57', '2021-07-29 15:52:57'),
(6, 'monas 5', 2, '2021-07-29 15:53:10', '2021-08-20 07:58:21'),
(7, 'monad', 1, '2021-07-29 15:54:12', '2021-07-29 15:54:12'),
(8, 'Montelukast', 2, '2021-07-31 17:37:59', '2021-07-31 19:28:10'),
(9, 'pak', 1, '2021-07-31 17:41:21', '2021-07-31 17:41:21'),
(10, 'monas', 1, '2021-07-31 17:45:01', '2021-07-31 17:45:01'),
(11, 'napa', 4, '2021-07-31 19:32:20', '2021-08-24 11:45:14'),
(12, 'betha', 1, '2021-08-07 07:33:39', '2021-08-07 07:33:39'),
(13, 'clonaze', 1, '2021-08-07 07:33:51', '2021-08-07 07:33:51'),
(14, 'bisoporol', 1, '2021-08-07 07:35:19', '2021-08-07 07:35:19'),
(15, 'bislol 5', 1, '2021-08-07 07:36:02', '2021-08-07 07:36:02'),
(16, 'data', 1, '2021-08-16 07:56:45', '2021-08-16 07:56:45'),
(17, 'n', 1, '2021-08-16 07:58:17', '2021-08-16 07:58:17'),
(18, 'Montelukast Sodium', 1, '2021-08-21 10:59:51', '2021-08-21 10:59:51'),
(19, 'nap', 1, '2021-08-23 21:48:32', '2021-08-23 21:48:32'),
(20, 'na', 1, '2021-08-23 21:50:29', '2021-08-23 21:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active_lab` int(11) NOT NULL DEFAULT 0,
  `seller_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) NOT NULL DEFAULT 0,
  `remaining_digital_uploads` int(11) NOT NULL DEFAULT 0,
  `invalid_at` date DEFAULT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(20,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `active_lab`, `seller_package_id`, `remaining_uploads`, `remaining_digital_uploads`, `invalid_at`, `verification_status`, `verification_info`, `cash_on_delivery_status`, `admin_to_pay`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `bank_payment_status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, 100, 1000, NULL, 1, '[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]', 1, 0.00, NULL, NULL, NULL, NULL, 0, '2018-10-07 04:42:57', '2021-08-21 20:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `seller_company_based_discounts`
--

CREATE TABLE `seller_company_based_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_company_based_discounts`
--

INSERT INTO `seller_company_based_discounts` (`id`, `user_id`, `brand_id`, `discount`, `created_at`, `updated_at`) VALUES
(1, 3, 4, '14', '2021-08-20 22:01:26', '2021-08-21 22:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `seller_packages`
--

CREATE TABLE `seller_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL DEFAULT 0.00,
  `product_upload` int(11) NOT NULL DEFAULT 0,
  `digital_product_upload` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_products`
--

CREATE TABLE `seller_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(20) UNSIGNED NOT NULL,
  `company_id` int(20) NOT NULL,
  `company_discount` int(11) NOT NULL,
  `discount_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_products`
--

INSERT INTO `seller_products` (`id`, `user_id`, `company_id`, `company_discount`, `discount_type`, `product_id`, `created_at`, `updated_at`) VALUES
(13, 3, 3, 12, 'percent', NULL, '2021-09-21 00:18:16', '2021-09-21 00:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `seller_stocks`
--

CREATE TABLE `seller_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `message` longtext CHARACTER SET utf8 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller_withdraw_requests`
--

INSERT INTO `seller_withdraw_requests` (`id`, `user_id`, `amount`, `message`, `status`, `viewed`, `created_at`, `updated_at`) VALUES
(1, 1, 78.00, 'vgvju', 1, 1, '2021-07-30 18:21:33', '2021-08-21 20:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `keyword`, `author`, `revisit`, `sitemap_link`, `description`, `created_at`, `updated_at`) VALUES
(1, 'bootstrap,responsive,template,developer', 'Active IT Zone', 11, 'https://www.activeitzone.com', 'Active E-commerce CMS Multi vendor system is such a platform to build a border less marketplace both for physical and digital goods.', '2019-08-08 08:56:11', '2019-08-08 02:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active_lab` int(11) NOT NULL DEFAULT 0,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `active_lab`, `name`, `logo`, `sliders`, `phone`, `address`, `facebook`, `google`, `twitter`, `youtube`, `slug`, `description`, `meta_title`, `meta_description`, `pick_up_point_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'LABAID Dhanmondi Branch (Main Branch)', '55', '56', '+88 02 9676356, +88 02 58610793', 'House- 06, Road-04, Dhanmondi.. Dhaka 1205, Bangladesh', 'https://www.facebook.com', 'www.google.com', 'www.twitter.com', 'www.youtube.com', 'LABAID-Dhanmondi-Branch-(Main-Branch)-1', 'LABAID Dhanmondi Branch (Main Branch)LABAID Dhanmondi Branch (Main Branch)LABAID Dhanmondi Branch (Main Branch)LABAID Dhanmondi Branch (Main Branch)', 'LABAID Dhanmondi Branch (Main Branch)', 'LABAID Dhanmondi Branch (Main Branch)', '[]', 0.00, '2018-11-27 10:23:13', '2021-08-28 17:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `published`, `link`, `created_at`, `updated_at`) VALUES
(7, 'uploads/sliders/slider-image.jpg', 1, NULL, '2019-03-12 05:58:05', '2019-03-12 05:58:05'),
(8, 'uploads/sliders/slider-image.jpg', 1, NULL, '2019-03-12 05:58:12', '2019-03-12 05:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `lang` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `lang`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(4, NULL, 15, 3, '2021-08-03 14:34:17', '2021-08-03 14:34:17'),
(8, NULL, 20, 3, '2021-08-23 23:38:31', '2021-08-23 23:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'mehedi@email.com', '2021-08-29 00:07:18', '2021-08-29 00:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tax_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `tax_status`, `created_at`, `updated_at`) VALUES
(3, 'Tax', 1, '2021-03-07 11:45:33', '2021-03-07 11:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `code`, `user_id`, `subject`, `details`, `files`, `status`, `viewed`, `client_viewed`, `created_at`, `updated_at`) VALUES
(1, 10000023, 8, 'Account reset request', 'pres', '4', 'pending', 1, 1, '2021-08-07 00:18:51', '2021-08-07 00:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(3, 'en', 'All Category', 'All Category', '2020-11-02 07:40:38', '2020-11-02 07:40:38'),
(4, 'en', 'All', 'All', '2020-11-02 07:40:38', '2020-11-02 07:40:38'),
(5, 'en', 'Flash Sale', 'Flash Sale', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(6, 'en', 'View More', 'View More', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(7, 'en', 'Add to wishlist', 'Add to wishlist', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(8, 'en', 'Add to compare', 'Add to compare', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(9, 'en', 'Add to cart', 'Add to cart', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(10, 'en', 'Club Point', 'Club Point', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(11, 'en', 'Classified Ads', 'Classified Ads', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(13, 'en', 'Used', 'Used', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(14, 'en', 'Top 10 Categories', 'Top 10 Categories', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(15, 'en', 'View All Categories', 'View All Categories', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(16, 'en', 'Top 10 Brands', 'Top 10 Brands', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(17, 'en', 'View All Brands', 'View All Brands', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
(43, 'en', 'Terms & conditions', 'Terms & conditions', '2020-11-02 07:40:41', '2020-11-02 07:40:41'),
(51, 'en', 'Best Selling', 'Best Selling', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
(53, 'en', 'Top 20', 'Top 20', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
(55, 'en', 'Featured Products', 'Featured Products', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
(56, 'en', 'Best Sellers', 'Best Sellers', '2020-11-02 07:40:43', '2020-11-02 07:40:43'),
(57, 'en', 'Visit Store', 'Visit Store', '2020-11-02 07:40:43', '2020-11-02 07:40:43'),
(58, 'en', 'Popular Suggestions', 'Popular Suggestions', '2020-11-02 07:46:59', '2020-11-02 07:46:59'),
(59, 'en', 'Category Suggestions', 'Category Suggestions', '2020-11-02 07:46:59', '2020-11-02 07:46:59'),
(62, 'en', 'Automobile & Motorcycle', 'Automobile & Motorcycle', '2020-11-02 07:47:01', '2020-11-02 07:47:01'),
(63, 'en', 'Price range', 'Price range', '2020-11-02 07:47:01', '2020-11-02 07:47:01'),
(64, 'en', 'Filter by color', 'Filter by color', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(65, 'en', 'Home', 'Home', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(67, 'en', 'Newest', 'Newest', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(68, 'en', 'Oldest', 'Oldest', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(69, 'en', 'Price low to high', 'Price low to high', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(70, 'en', 'Price high to low', 'Price high to low', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(71, 'en', 'Brands', 'Brands', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(72, 'en', 'All Brands', 'All Brands', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(74, 'en', 'All Sellers', 'All Sellers', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
(78, 'en', 'Inhouse product', 'Inhouse product', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(79, 'en', 'Message Seller', 'Message Seller', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(80, 'en', 'Price', 'Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(81, 'en', 'Discount Price', 'Discount Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(82, 'en', 'Color', 'Color', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(83, 'en', 'Quantity', 'Quantity', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(84, 'en', 'available', 'available', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(85, 'en', 'Total Price', 'Total Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(86, 'en', 'Out of Stock', 'Out of Stock', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(87, 'en', 'Refund', 'Refund', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(88, 'en', 'Share', 'Share', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(89, 'en', 'Sold By', 'Sold By', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(90, 'en', 'customer reviews', 'customer reviews', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(91, 'en', 'Top Selling Products', 'Top Selling Products', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(92, 'en', 'Description', 'Description', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(93, 'en', 'Video', 'Video', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(94, 'en', 'Reviews', 'Reviews', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(95, 'en', 'Download', 'Download', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(96, 'en', 'There have been no reviews for this product yet.', 'There have been no reviews for this product yet.', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(97, 'en', 'Related products', 'Related products', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(98, 'en', 'Any query about this product', 'Any query about this product', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(99, 'en', 'Product Name', 'Product Name', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(100, 'en', 'Your Question', 'Your Question', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(101, 'en', 'Send', 'Send', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(103, 'en', 'Use country code before number', 'Use country code before number', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(105, 'en', 'Remember Me', 'Remember Me', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
(107, 'en', 'Dont have an account?', 'Dont have an account?', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
(108, 'en', 'Register Now', 'Register Now', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
(109, 'en', 'Or Login With', 'Or Login With', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
(110, 'en', 'oops..', 'oops..', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
(111, 'en', 'This item is out of stock!', 'This item is out of stock!', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
(112, 'en', 'Back to shopping', 'Back to shopping', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
(113, 'en', 'Login to your account.', 'Login to your account.', '2020-11-02 11:27:41', '2020-11-02 11:27:41'),
(115, 'en', 'Purchase History', 'Purchase History', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(116, 'en', 'New', 'New', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(117, 'en', 'Downloads', 'Downloads', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(118, 'en', 'Sent Refund Request', 'Sent Refund Request', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(119, 'en', 'Product Bulk Upload', 'Product Bulk Upload', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(123, 'en', 'Orders', 'Orders', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(124, 'en', 'Recieved Refund Request', 'Recieved Refund Request', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(126, 'en', 'Shop Setting', 'Shop Setting', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(127, 'en', 'Payment History', 'Payment History', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(128, 'en', 'Money Withdraw', 'Money Withdraw', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(129, 'en', 'Conversations', 'Conversations', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(130, 'en', 'My Wallet', 'My Wallet', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(131, 'en', 'Earning Points', 'Earning Points', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(132, 'en', 'Support Ticket', 'Support Ticket', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(133, 'en', 'Manage Profile', 'Manage Profile', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(134, 'en', 'Sold Amount', 'Sold Amount', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(135, 'en', 'Your sold amount (current month)', 'Your sold amount (current month)', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
(136, 'en', 'Total Sold', 'Total Sold', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(137, 'en', 'Last Month Sold', 'Last Month Sold', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(138, 'en', 'Total sale', 'Total sale', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(139, 'en', 'Total earnings', 'Total earnings', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(140, 'en', 'Successful orders', 'Successful orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(141, 'en', 'Total orders', 'Total orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(142, 'en', 'Pending orders', 'Pending orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(143, 'en', 'Cancelled orders', 'Cancelled orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
(145, 'en', 'Product', 'Product', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(147, 'en', 'Purchased Package', 'Purchased Package', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(148, 'en', 'Package Not Found', 'Package Not Found', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(149, 'en', 'Upgrade Package', 'Upgrade Package', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(150, 'en', 'Shop', 'Shop', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(151, 'en', 'Manage & organize your shop', 'Manage & organize your shop', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(152, 'en', 'Go to setting', 'Go to setting', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(153, 'en', 'Payment', 'Payment', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(154, 'en', 'Configure your payment method', 'Configure your payment method', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(156, 'en', 'My Panel', 'My Panel', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(158, 'en', 'Item has been added to wishlist', 'Item has been added to wishlist', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
(159, 'en', 'My Points', 'My Points', '2020-11-02 11:28:15', '2020-11-02 11:28:15'),
(160, 'en', ' Points', ' Points', '2020-11-02 11:28:15', '2020-11-02 11:28:15'),
(161, 'en', 'Wallet Money', 'Wallet Money', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(162, 'en', 'Exchange Rate', 'Exchange Rate', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(163, 'en', 'Point Earning history', 'Point Earning history', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(164, 'en', 'Date', 'Date', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(165, 'en', 'Points', 'Points', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(166, 'en', 'Converted', 'Converted', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(167, 'en', 'Action', 'Action', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(168, 'en', 'No history found.', 'No history found.', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(169, 'en', 'Convert has been done successfully Check your Wallets', 'Convert has been done successfully Check your Wallets', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(170, 'en', 'Something went wrong', 'Something went wrong', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
(171, 'en', 'Remaining Uploads', 'Remaining Uploads', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(172, 'en', 'No Package Found', 'No Package Found', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(173, 'en', 'Search product', 'Search product', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(174, 'en', 'Name', 'Name', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(176, 'en', 'Current Qty', 'Current Qty', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(177, 'en', 'Base Price', 'Base Price', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(178, 'en', 'Published', 'Published', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(179, 'en', 'Featured', 'Featured', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(180, 'en', 'Options', 'Options', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(181, 'en', 'Edit', 'Edit', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(182, 'en', 'Duplicate', 'Duplicate', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
(184, 'en', '1. Download the skeleton file and fill it with data.', '1. Download the skeleton file and fill it with data.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(185, 'en', '2. You can download the example file to understand how the data must be filled.', '2. You can download the example file to understand how the data must be filled.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(186, 'en', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(187, 'en', '4. After uploading products you need to edit them and set products images and choices.', '4. After uploading products you need to edit them and set products images and choices.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(188, 'en', 'Download CSV', 'Download CSV', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(189, 'en', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(190, 'en', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(191, 'en', 'Download Category', 'Download Category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(192, 'en', 'Download Sub category', 'Download Sub category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(193, 'en', 'Download Sub Sub category', 'Download Sub Sub category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(194, 'en', 'Download Brand', 'Download Brand', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(195, 'en', 'Upload CSV File', 'Upload CSV File', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(196, 'en', 'CSV', 'CSV', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(197, 'en', 'Choose CSV File', 'Choose CSV File', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(198, 'en', 'Upload', 'Upload', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
(199, 'en', 'Add New Digital Product', 'Add New Digital Product', '2020-11-02 11:37:25', '2020-11-02 11:37:25'),
(200, 'en', 'Available Status', 'Available Status', '2020-11-02 11:37:29', '2020-11-02 11:37:29'),
(201, 'en', 'Admin Status', 'Admin Status', '2020-11-02 11:37:29', '2020-11-02 11:37:29'),
(202, 'en', 'Pending Balance', 'Pending Balance', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(203, 'en', 'Send Withdraw Request', 'Send Withdraw Request', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(204, 'en', 'Withdraw Request history', 'Withdraw Request history', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(205, 'en', 'Amount', 'Amount', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(206, 'en', 'Status', 'Status', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(207, 'en', 'Message', 'Message', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(208, 'en', 'Send A Withdraw Request', 'Send A Withdraw Request', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
(209, 'en', 'Basic Info', 'Basic Info', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(211, 'en', 'Your Phone', 'Your Phone', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(212, 'en', 'Photo', 'Photo', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(213, 'en', 'Browse', 'Browse', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(215, 'en', 'Your Password', 'Your Password', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
(216, 'en', 'New Password', 'New Password', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(217, 'en', 'Confirm Password', 'Confirm Password', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(218, 'en', 'Add New Address', 'Add New Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(219, 'en', 'Payment Setting', 'Payment Setting', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(220, 'en', 'Cash Payment', 'Cash Payment', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(221, 'en', 'Bank Payment', 'Bank Payment', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(222, 'en', 'Bank Name', 'Bank Name', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(223, 'en', 'Bank Account Name', 'Bank Account Name', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(224, 'en', 'Bank Account Number', 'Bank Account Number', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(225, 'en', 'Bank Routing Number', 'Bank Routing Number', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(226, 'en', 'Update Profile', 'Update Profile', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(227, 'en', 'Change your email', 'Change your email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(228, 'en', 'Your Email', 'Your Email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(229, 'en', 'Sending Email...', 'Sending Email...', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(230, 'en', 'Verify', 'Verify', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(231, 'en', 'Update Email', 'Update Email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(232, 'en', 'New Address', 'New Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(233, 'en', 'Your Address', 'Your Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(234, 'en', 'Country', 'Country', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(235, 'en', 'Select your country', 'Select your country', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(236, 'en', 'City', 'City', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(237, 'en', 'Your City', 'Your City', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(239, 'en', 'Your Postal Code', 'Your Postal Code', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(240, 'en', '+880', '+880', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(241, 'en', 'Save', 'Save', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
(242, 'en', 'Received Refund Request', 'Received Refund Request', '2020-11-02 11:56:20', '2020-11-02 11:56:20'),
(244, 'en', 'Delete Confirmation', 'Delete Confirmation', '2020-11-02 11:56:20', '2020-11-02 11:56:20'),
(245, 'en', 'Are you sure to delete this?', 'Are you sure to delete this?', '2020-11-02 11:56:21', '2020-11-02 11:56:21'),
(246, 'en', 'Premium Packages for Sellers', 'Premium Packages for Sellers', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(247, 'en', 'Product Upload', 'Product Upload', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(248, 'en', 'Digital Product Upload', 'Digital Product Upload', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(250, 'en', 'Purchase Package', 'Purchase Package', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(251, 'en', 'Select Payment Type', 'Select Payment Type', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(252, 'en', 'Payment Type', 'Payment Type', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(253, 'en', 'Select One', 'Select One', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
(254, 'en', 'Online payment', 'Online payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(255, 'en', 'Offline payment', 'Offline payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(256, 'en', 'Purchase Your Package', 'Purchase Your Package', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(258, 'en', 'Paypal', 'Paypal', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(259, 'en', 'Stripe', 'Stripe', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(260, 'en', 'sslcommerz', 'sslcommerz', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(265, 'en', 'Confirm', 'Confirm', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(266, 'en', 'Offline Package Payment', 'Offline Package Payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
(267, 'en', 'Transaction ID', 'Transaction ID', '2020-11-02 12:30:12', '2020-11-02 12:30:12'),
(268, 'en', 'Choose image', 'Choose image', '2020-11-02 12:30:12', '2020-11-02 12:30:12'),
(269, 'en', 'Code', 'Code', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(270, 'en', 'Delivery Status', 'Delivery Status', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(271, 'en', 'Payment Status', 'Payment Status', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(272, 'en', 'Paid', 'Paid', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(273, 'en', 'Order Details', 'Order Details', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(274, 'en', 'Download Invoice', 'Download Invoice', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(275, 'en', 'Unpaid', 'Unpaid', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
(277, 'en', 'Order placed', 'Order placed', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(278, 'en', 'Confirmed', 'Confirmed', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(279, 'en', 'On delivery', 'On delivery', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(280, 'en', 'Delivered', 'Delivered', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(281, 'en', 'Order Summary', 'Order Summary', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(282, 'en', 'Order Code', 'Order Code', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(283, 'en', 'Customer', 'Customer', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(287, 'en', 'Total order amount', 'Total order amount', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(288, 'en', 'Shipping metdod', 'Shipping metdod', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
(289, 'en', 'Flat shipping rate', 'Flat shipping rate', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(290, 'en', 'Payment metdod', 'Payment metdod', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(291, 'en', 'Variation', 'Variation', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(292, 'en', 'Delivery Type', 'Delivery Type', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(293, 'en', 'Home Delivery', 'Home Delivery', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(294, 'en', 'Order Ammount', 'Order Ammount', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(295, 'en', 'Subtotal', 'Subtotal', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(296, 'en', 'Shipping', 'Shipping', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(298, 'en', 'Coupon Discount', 'Coupon Discount', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
(300, 'en', 'N/A', 'N/A', '2020-11-02 12:44:20', '2020-11-02 12:44:20'),
(301, 'en', 'In stock', 'In stock', '2020-11-02 12:54:52', '2020-11-02 12:54:52'),
(302, 'en', 'Buy Now', 'Buy Now', '2020-11-02 12:54:52', '2020-11-02 12:54:52'),
(303, 'en', 'Item added to your cart!', 'Item added to your cart!', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(304, 'en', 'Proceed to Checkout', 'Proceed to Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(305, 'en', 'Cart Items', 'Cart Items', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(306, 'en', '1. My Cart', '1. My Cart', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(307, 'en', 'View cart', 'View cart', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(308, 'en', '2. Shipping info', '2. Shipping info', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(309, 'en', 'Checkout', 'Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(310, 'en', '3. Delivery info', '3. Delivery info', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(311, 'en', '4. Payment', '4. Payment', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(312, 'en', '5. Confirmation', '5. Confirmation', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(313, 'en', 'Remove', 'Remove', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(314, 'en', 'Return to shop', 'Return to shop', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(315, 'en', 'Continue to Shipping', 'Continue to Shipping', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(316, 'en', 'Or', 'Or', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(317, 'en', 'Guest Checkout', 'Guest Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
(318, 'en', 'Continue to Delivery Info', 'Continue to Delivery Info', '2020-11-02 12:57:44', '2020-11-02 12:57:44'),
(319, 'en', 'Postal Code', 'Postal Code', '2020-11-02 13:01:01', '2020-11-02 13:01:01'),
(320, 'en', 'Choose Delivery Type', 'Choose Delivery Type', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(321, 'en', 'Local Pickup', 'Local Pickup', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(322, 'en', 'Select your nearest pickup point', 'Select your nearest pickup point', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(323, 'en', 'Continue to Payment', 'Continue to Payment', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
(324, 'en', 'Select a payment option', 'Select a payment option', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(325, 'en', 'Razorpay', 'Razorpay', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(326, 'en', 'Paystack', 'Paystack', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(327, 'en', 'VoguePay', 'VoguePay', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(328, 'en', 'payhere', 'payhere', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(329, 'en', 'ngenius', 'ngenius', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(330, 'en', 'Paytm', 'Paytm', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(331, 'en', 'Cash on Delivery', 'Cash on Delivery', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(332, 'en', 'Your wallet balance :', 'Your wallet balance :', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(333, 'en', 'Insufficient balance', 'Insufficient balance', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
(334, 'en', 'I agree to the', 'I agree to the', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(338, 'en', 'Complete Order', 'Complete Order', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(339, 'en', 'Summary', 'Summary', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(340, 'en', 'Items', 'Items', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(341, 'en', 'Total Club point', 'Total Club point', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(342, 'en', 'Total Shipping', 'Total Shipping', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(343, 'en', 'Have coupon code? Enter here', 'Have coupon code? Enter here', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(344, 'en', 'Apply', 'Apply', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(345, 'en', 'You need to agree with our policies', 'You need to agree with our policies', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
(346, 'en', 'Forgot password', 'Forgot password', '2020-11-02 13:01:25', '2020-11-02 13:01:25'),
(469, 'en', 'SEO Setting', 'SEO Setting', '2020-11-02 13:01:33', '2020-11-02 13:01:33'),
(474, 'en', 'System Update', 'System Update', '2020-11-02 13:01:34', '2020-11-02 13:01:34'),
(480, 'en', 'Add New Payment Method', 'Add New Payment Method', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(481, 'en', 'Manual Payment Method', 'Manual Payment Method', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(482, 'en', 'Heading', 'Heading', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(483, 'en', 'Logo', 'Logo', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
(484, 'en', 'Manual Payment Information', 'Manual Payment Information', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(485, 'en', 'Type', 'Type', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(486, 'en', 'Custom Payment', 'Custom Payment', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(487, 'en', 'Check Payment', 'Check Payment', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(488, 'en', 'Checkout Thumbnail', 'Checkout Thumbnail', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(489, 'en', 'Payment Instruction', 'Payment Instruction', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(490, 'en', 'Bank Information', 'Bank Information', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
(491, 'en', 'Select File', 'Select File', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(492, 'en', 'Upload New', 'Upload New', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(493, 'en', 'Sort by newest', 'Sort by newest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(494, 'en', 'Sort by oldest', 'Sort by oldest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(495, 'en', 'Sort by smallest', 'Sort by smallest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(496, 'en', 'Sort by largest', 'Sort by largest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(497, 'en', 'Selected Only', 'Selected Only', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(498, 'en', 'No files found', 'No files found', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(499, 'en', '0 File selected', '0 File selected', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(500, 'en', 'Clear', 'Clear', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(501, 'en', 'Prev', 'Prev', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(502, 'en', 'Next', 'Next', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(503, 'en', 'Add Files', 'Add Files', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
(504, 'en', 'Method has been inserted successfully', 'Method has been inserted successfully', '2020-11-02 13:02:03', '2020-11-02 13:02:03'),
(506, 'en', 'Order Date', 'Order Date', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(507, 'en', 'Bill to', 'Bill to', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(510, 'en', 'Sub Total', 'Sub Total', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(512, 'en', 'Total Tax', 'Total Tax', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(513, 'en', 'Grand Total', 'Grand Total', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
(514, 'en', 'Your order has been placed successfully. Please submit payment information from purchase history', 'Your order has been placed successfully. Please submit payment information from purchase history', '2020-11-02 13:02:47', '2020-11-02 13:02:47'),
(515, 'en', 'Thank You for Your Order!', 'Thank You for Your Order!', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
(516, 'en', 'Order Code:', 'Order Code:', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
(517, 'en', 'A copy or your order summary has been sent to', 'A copy or your order summary has been sent to', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
(518, 'en', 'Make Payment', 'Make Payment', '2020-11-02 13:03:26', '2020-11-02 13:03:26'),
(519, 'en', 'Payment screenshot', 'Payment screenshot', '2020-11-02 13:03:29', '2020-11-02 13:03:29'),
(520, 'en', 'Paypal Credential', 'Paypal Credential', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(522, 'en', 'Paypal Client ID', 'Paypal Client ID', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(523, 'en', 'Paypal Client Secret', 'Paypal Client Secret', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(524, 'en', 'Paypal Sandbox Mode', 'Paypal Sandbox Mode', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
(525, 'en', 'Sslcommerz Credential', 'Sslcommerz Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(526, 'en', 'Sslcz Store Id', 'Sslcz Store Id', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(527, 'en', 'Sslcz store password', 'Sslcz store password', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(528, 'en', 'Sslcommerz Sandbox Mode', 'Sslcommerz Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(529, 'en', 'Stripe Credential', 'Stripe Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(531, 'en', 'STRIPE KEY', 'STRIPE KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(533, 'en', 'STRIPE SECRET', 'STRIPE SECRET', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(534, 'en', 'RazorPay Credential', 'RazorPay Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(535, 'en', 'RAZOR KEY', 'RAZOR KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(536, 'en', 'RAZOR SECRET', 'RAZOR SECRET', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(537, 'en', 'Instamojo Credential', 'Instamojo Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(538, 'en', 'API KEY', 'API KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(539, 'en', 'IM API KEY', 'IM API KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(540, 'en', 'AUTH TOKEN', 'AUTH TOKEN', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(541, 'en', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(542, 'en', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(543, 'en', 'PayStack Credential', 'PayStack Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(544, 'en', 'PUBLIC KEY', 'PUBLIC KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(545, 'en', 'SECRET KEY', 'SECRET KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(546, 'en', 'MERCHANT EMAIL', 'MERCHANT EMAIL', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(547, 'en', 'VoguePay Credential', 'VoguePay Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(548, 'en', 'MERCHANT ID', 'MERCHANT ID', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(549, 'en', 'Sandbox Mode', 'Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(550, 'en', 'Payhere Credential', 'Payhere Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
(551, 'en', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(552, 'en', 'PAYHERE SECRET', 'PAYHERE SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(553, 'en', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(554, 'en', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(555, 'en', 'Ngenius Credential', 'Ngenius Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(556, 'en', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(557, 'en', 'NGENIUS API KEY', 'NGENIUS API KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(558, 'en', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(559, 'en', 'Mpesa Credential', 'Mpesa Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(560, 'en', 'MPESA CONSUMER KEY', 'MPESA CONSUMER KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(561, 'en', 'MPESA_CONSUMER_KEY', 'MPESA_CONSUMER_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(562, 'en', 'MPESA CONSUMER SECRET', 'MPESA CONSUMER SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(563, 'en', 'MPESA_CONSUMER_SECRET', 'MPESA_CONSUMER_SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(564, 'en', 'MPESA SHORT CODE', 'MPESA SHORT CODE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(565, 'en', 'MPESA_SHORT_CODE', 'MPESA_SHORT_CODE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(566, 'en', 'MPESA SANDBOX ACTIVATION', 'MPESA SANDBOX ACTIVATION', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(567, 'en', 'Flutterwave Credential', 'Flutterwave Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(568, 'en', 'RAVE_PUBLIC_KEY', 'RAVE_PUBLIC_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(569, 'en', 'RAVE_SECRET_KEY', 'RAVE_SECRET_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(570, 'en', 'RAVE_TITLE', 'RAVE_TITLE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(571, 'en', 'STAGIN ACTIVATION', 'STAGIN ACTIVATION', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
(573, 'en', 'All Product', 'All Product', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(574, 'en', 'Sort By', 'Sort By', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(575, 'en', 'Rating (High > Low)', 'Rating (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(576, 'en', 'Rating (Low > High)', 'Rating (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(577, 'en', 'Num of Sale (High > Low)', 'Num of Sale (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(578, 'en', 'Num of Sale (Low > High)', 'Num of Sale (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(579, 'en', 'Base Price (High > Low)', 'Base Price (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(580, 'en', 'Base Price (Low > High)', 'Base Price (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(581, 'en', 'Type & Enter', 'Type & Enter', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(582, 'en', 'Added By', 'Added By', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(583, 'en', 'Num of Sale', 'Num of Sale', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(584, 'en', 'Total Stock', 'Total Stock', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(585, 'en', 'Todays Deal', 'Todays Deal', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(586, 'en', 'Rating', 'Rating', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(587, 'en', 'times', 'times', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
(588, 'en', 'Add Nerw Product', 'Add Nerw Product', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
(589, 'en', 'Product Information', 'Product Information', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
(590, 'en', 'Unit', 'Unit', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
(591, 'en', 'Unit (e.g. KG, Pc etc)', 'Unit (e.g. KG, Pc etc)', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(592, 'en', 'Minimum Qty', 'Minimum Qty', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(593, 'en', 'Tags', 'Tags', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(594, 'en', 'Type and hit enter to add a tag', 'Type and hit enter to add a tag', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(595, 'en', 'Barcode', 'Barcode', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(596, 'en', 'Refundable', 'Refundable', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(597, 'en', 'Product Images', 'Product Images', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(598, 'en', 'Gallery Images', 'Gallery Images', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(599, 'en', 'Todays Deal updated successfully', 'Todays Deal updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(600, 'en', 'Published products updated successfully', 'Published products updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(601, 'en', 'Thumbnail Image', 'Thumbnail Image', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(602, 'en', 'Featured products updated successfully', 'Featured products updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(603, 'en', 'Product Videos', 'Product Videos', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(604, 'en', 'Video Provider', 'Video Provider', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(605, 'en', 'Youtube', 'Youtube', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(606, 'en', 'Dailymotion', 'Dailymotion', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(607, 'en', 'Vimeo', 'Vimeo', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(608, 'en', 'Video Link', 'Video Link', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(609, 'en', 'Product Variation', 'Product Variation', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(610, 'en', 'Colors', 'Colors', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(611, 'en', 'Attributes', 'Attributes', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(612, 'en', 'Choose Attributes', 'Choose Attributes', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(613, 'en', 'Choose the attributes of this product and then input values of each attribute', 'Choose the attributes of this product and then input values of each attribute', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(614, 'en', 'Product price + stock', 'Product price + stock', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(616, 'en', 'Unit price', 'Unit price', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(617, 'en', 'Purchase price', 'Purchase price', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
(618, 'en', 'Flat', 'Flat', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(619, 'en', 'Percent', 'Percent', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(620, 'en', 'Discount', 'Discount', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(621, 'en', 'Product Description', 'Product Description', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(622, 'en', 'Product Shipping Cost', 'Product Shipping Cost', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(623, 'en', 'Free Shipping', 'Free Shipping', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(624, 'en', 'Flat Rate', 'Flat Rate', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(625, 'en', 'Shipping cost', 'Shipping cost', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(626, 'en', 'PDF Specification', 'PDF Specification', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(627, 'en', 'SEO Meta Tags', 'SEO Meta Tags', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(628, 'en', 'Meta Title', 'Meta Title', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(629, 'en', 'Meta Image', 'Meta Image', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(630, 'en', 'Choice Title', 'Choice Title', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(631, 'en', 'Enter choice values', 'Enter choice values', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
(632, 'en', 'All categories', 'All categories', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(633, 'en', 'Add New category', 'Add New category', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(634, 'en', 'Type name & Enter', 'Type name & Enter', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(635, 'en', 'Banner', 'Banner', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(637, 'en', 'Commission', 'Commission', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(638, 'en', 'icon', 'icon', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
(639, 'en', 'Featured categories updated successfully', 'Featured categories updated successfully', '2020-11-03 07:12:20', '2020-11-03 07:12:20'),
(640, 'en', 'Hot', 'Hot', '2020-11-03 07:13:12', '2020-11-03 07:13:12'),
(641, 'en', 'Filter by Payment Status', 'Filter by Payment Status', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(642, 'en', 'Un-Paid', 'Un-Paid', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(643, 'en', 'Filter by Deliver Status', 'Filter by Deliver Status', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(644, 'en', 'Pending', 'Pending', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(645, 'en', 'Type Order code & hit Enter', 'Type Order code & hit Enter', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(646, 'en', 'Num. of Products', 'Num. of Products', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
(647, 'en', 'Walk In Customer', 'Walk In Customer', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(648, 'en', 'QTY', 'QTY', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(649, 'en', 'Without Shipping Charge', 'Without Shipping Charge', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(650, 'en', 'With Shipping Charge', 'With Shipping Charge', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(651, 'en', 'Pay With Cash', 'Pay With Cash', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(652, 'en', 'Shipping Address', 'Shipping Address', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(653, 'en', 'Close', 'Close', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
(654, 'en', 'Select country', 'Select country', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(655, 'en', 'Order Confirmation', 'Order Confirmation', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(656, 'en', 'Are you sure to confirm this order?', 'Are you sure to confirm this order?', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(657, 'en', 'Comfirm Order', 'Comfirm Order', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
(659, 'en', 'Personal Info', 'Personal Info', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(660, 'en', 'Repeat Password', 'Repeat Password', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(661, 'en', 'Shop Name', 'Shop Name', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(662, 'en', 'Register Your Shop', 'Register Your Shop', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
(663, 'en', 'Affiliate Informations', 'Affiliate Informations', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
(664, 'en', 'Affiliate', 'Affiliate', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
(665, 'en', 'User Info', 'User Info', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
(667, 'en', 'Installed Addon', 'Installed Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(668, 'en', 'Available Addon', 'Available Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(669, 'en', 'Install New Addon', 'Install New Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(670, 'en', 'Version', 'Version', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(671, 'en', 'Activated', 'Activated', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(672, 'en', 'Deactivated', 'Deactivated', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
(673, 'en', 'Activate OTP', 'Activate OTP', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
(674, 'en', 'OTP will be Used For', 'OTP will be Used For', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
(675, 'en', 'Settings updated successfully', 'Settings updated successfully', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
(676, 'en', 'Product Owner', 'Product Owner', '2020-11-03 11:48:46', '2020-11-03 11:48:46'),
(677, 'en', 'Point', 'Point', '2020-11-03 11:48:46', '2020-11-03 11:48:46'),
(678, 'en', 'Set Point for Product Within a Range', 'Set Point for Product Within a Range', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(679, 'en', 'Set Point for multiple products', 'Set Point for multiple products', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(680, 'en', 'Min Price', 'Min Price', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(681, 'en', 'Max Price', 'Max Price', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(682, 'en', 'Set Point for all Products', 'Set Point for all Products', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(683, 'en', 'Set Point For ', 'Set Point For ', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
(684, 'en', 'Convert Status', 'Convert Status', '2020-11-03 11:48:58', '2020-11-03 11:48:58'),
(685, 'en', 'Earned At', 'Earned At', '2020-11-03 11:48:59', '2020-11-03 11:48:59'),
(686, 'en', 'Seller Based Selling Report', 'Seller Based Selling Report', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(687, 'en', 'Sort by verificarion status', 'Sort by verificarion status', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(688, 'en', 'Approved', 'Approved', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(689, 'en', 'Non Approved', 'Non Approved', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(690, 'en', 'Filter', 'Filter', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(691, 'en', 'Seller Name', 'Seller Name', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
(692, 'en', 'Number of Product Sale', 'Number of Product Sale', '2020-11-03 11:49:36', '2020-11-03 11:49:36'),
(693, 'en', 'Order Amount', 'Order Amount', '2020-11-03 11:49:36', '2020-11-03 11:49:36'),
(694, 'en', 'Facebook Chat Setting', 'Facebook Chat Setting', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(695, 'en', 'Facebook Page ID', 'Facebook Page ID', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(696, 'en', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(697, 'en', 'Login into your facebook page', 'Login into your facebook page', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(698, 'en', 'Find the About option of your facebook page', 'Find the About option of your facebook page', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(699, 'en', 'At the very bottom, you can find the \\“Facebook Page ID\\”', 'At the very bottom, you can find the \\“Facebook Page ID\\”', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(700, 'en', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(701, 'en', 'Scroll down that page and you will get \\\"white listed domain\\\"', 'Scroll down that page and you will get \\\"white listed domain\\\"', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(702, 'en', 'Set your website domain name', 'Set your website domain name', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
(703, 'en', 'Google reCAPTCHA Setting', 'Google reCAPTCHA Setting', '2020-11-03 11:51:25', '2020-11-03 11:51:25'),
(704, 'en', 'Site KEY', 'Site KEY', '2020-11-03 11:51:25', '2020-11-03 11:51:25'),
(705, 'en', 'Select Shipping Method', 'Select Shipping Method', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(706, 'en', 'Product Wise Shipping Cost', 'Product Wise Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(707, 'en', 'Flat Rate Shipping Cost', 'Flat Rate Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(708, 'en', 'Seller Wise Flat Shipping Cost', 'Seller Wise Flat Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(709, 'en', 'Note', 'Note', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(710, 'en', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(711, 'en', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(712, 'en', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(713, 'en', 'Flat Rate Cost', 'Flat Rate Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(714, 'en', 'Shipping Cost for Admin Products', 'Shipping Cost for Admin Products', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
(715, 'en', 'Countries', 'Countries', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
(716, 'en', 'Show/Hide', 'Show/Hide', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
(717, 'en', 'Country status updated successfully', 'Country status updated successfully', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
(718, 'en', 'All Subcategories', 'All Subcategories', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
(719, 'en', 'Add New Subcategory', 'Add New Subcategory', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
(720, 'en', 'Sub-Categories', 'Sub-Categories', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
(721, 'en', 'Sub Category Information', 'Sub Category Information', '2020-11-03 12:28:07', '2020-11-03 12:28:07'),
(723, 'en', 'Slug', 'Slug', '2020-11-03 12:28:07', '2020-11-03 12:28:07'),
(724, 'en', 'All Sub Subcategories', 'All Sub Subcategories', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
(725, 'en', 'Add New Sub Subcategory', 'Add New Sub Subcategory', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
(726, 'en', 'Sub-Sub-categories', 'Sub-Sub-categories', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
(727, 'en', 'Make This Default', 'Make This Default', '2020-11-04 08:24:24', '2020-11-04 08:24:24');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(728, 'en', 'Shops', 'Shops', '2020-11-04 11:17:10', '2020-11-04 11:17:10'),
(729, 'en', 'Women Clothing & Fashion', 'Women Clothing & Fashion', '2020-11-04 11:23:12', '2020-11-04 11:23:12'),
(730, 'en', 'Cellphones & Tabs', 'Cellphones & Tabs', '2020-11-04 12:10:41', '2020-11-04 12:10:41'),
(731, 'en', 'Welcome to', 'Welcome to', '2020-11-07 07:14:43', '2020-11-07 07:14:43'),
(732, 'en', 'Create a New Account', 'Create a New Account', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(733, 'en', 'Full Name', 'Full Name', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(734, 'en', 'password', 'password', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(735, 'en', 'Confrim Password', 'Confrim Password', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(736, 'en', 'I agree with the', 'I agree with the', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(737, 'en', 'Terms and Conditions', 'Terms and Conditions', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(738, 'en', 'Register', 'Register', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
(739, 'en', 'Already have an account', 'Already have an account', '2020-11-07 07:32:16', '2020-11-07 07:32:16'),
(741, 'en', 'Sign Up with', 'Sign Up with', '2020-11-07 07:32:16', '2020-11-07 07:32:16'),
(742, 'en', 'I agree with the Terms and Conditions', 'I agree with the Terms and Conditions', '2020-11-07 07:34:49', '2020-11-07 07:34:49'),
(745, 'en', 'All Role', 'All Role', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
(746, 'en', 'Add New Role', 'Add New Role', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
(747, 'en', 'Roles', 'Roles', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
(749, 'en', 'Add New Staffs', 'Add New Staffs', '2020-11-07 07:44:36', '2020-11-07 07:44:36'),
(750, 'en', 'Role', 'Role', '2020-11-07 07:44:36', '2020-11-07 07:44:36'),
(751, 'en', 'Frontend Website Name', 'Frontend Website Name', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(752, 'en', 'Website Name', 'Website Name', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(753, 'en', 'Site Motto', 'Site Motto', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(754, 'en', 'Best eCommerce Website', 'Best eCommerce Website', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(755, 'en', 'Site Icon', 'Site Icon', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(756, 'en', 'Website favicon. 32x32 .png', 'Website favicon. 32x32 .png', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(757, 'en', 'Website Base Color', 'Website Base Color', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(758, 'en', 'Hex Color Code', 'Hex Color Code', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(759, 'en', 'Website Base Hover Color', 'Website Base Hover Color', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
(760, 'en', 'Update', 'Update', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(761, 'en', 'Global Seo', 'Global Seo', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(762, 'en', 'Meta description', 'Meta description', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(763, 'en', 'Keywords', 'Keywords', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(764, 'en', 'Separate with coma', 'Separate with coma', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
(765, 'en', 'Website Pages', 'Website Pages', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(766, 'en', 'All Pages', 'All Pages', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(767, 'en', 'Add New Page', 'Add New Page', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(768, 'en', 'URL', 'URL', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(769, 'en', 'Actions', 'Actions', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
(770, 'en', 'Edit Page Information', 'Edit Page Information', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(771, 'en', 'Page Content', 'Page Content', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(772, 'en', 'Title', 'Title', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(773, 'en', 'Link', 'Link', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(774, 'en', 'Use character, number, hypen only', 'Use character, number, hypen only', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(775, 'en', 'Add Content', 'Add Content', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(776, 'en', 'Seo Fields', 'Seo Fields', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(777, 'en', 'Update Page', 'Update Page', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
(778, 'en', 'Default Language', 'Default Language', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(779, 'en', 'Add New Language', 'Add New Language', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(780, 'en', 'RTL', 'RTL', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(781, 'en', 'Translation', 'Translation', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
(782, 'en', 'Language Information', 'Language Information', '2020-11-07 07:50:23', '2020-11-07 07:50:23'),
(783, 'en', 'Save Page', 'Save Page', '2020-11-07 07:51:27', '2020-11-07 07:51:27'),
(784, 'en', 'Home Page Settings', 'Home Page Settings', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(785, 'en', 'Home Slider', 'Home Slider', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(786, 'en', 'Photos & Links', 'Photos & Links', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(787, 'en', 'Add New', 'Add New', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(788, 'en', 'Home Categories', 'Home Categories', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(789, 'en', 'Home Banner 1 (Max 3)', 'Home Banner 1 (Max 3)', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(790, 'en', 'Banner & Links', 'Banner & Links', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
(791, 'en', 'Home Banner 2 (Max 3)', 'Home Banner 2 (Max 3)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(792, 'en', 'Top 10', 'Top 10', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(793, 'en', 'Top Categories (Max 10)', 'Top Categories (Max 10)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(794, 'en', 'Top Brands (Max 10)', 'Top Brands (Max 10)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
(795, 'en', 'System Name', 'System Name', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
(796, 'en', 'System Logo - White', 'System Logo - White', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
(797, 'en', 'Choose Files', 'Choose Files', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
(798, 'en', 'Will be used in admin panel side menu', 'Will be used in admin panel side menu', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(799, 'en', 'System Logo - Black', 'System Logo - Black', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(800, 'en', 'Will be used in admin panel topbar in mobile + Admin login page', 'Will be used in admin panel topbar in mobile + Admin login page', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(801, 'en', 'System Timezone', 'System Timezone', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(802, 'en', 'Admin login page background', 'Admin login page background', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
(803, 'en', 'Website Header', 'Website Header', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(804, 'en', 'Header Setting', 'Header Setting', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(805, 'en', 'Header Logo', 'Header Logo', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(806, 'en', 'Show Language Switcher?', 'Show Language Switcher?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(807, 'en', 'Show Currency Switcher?', 'Show Currency Switcher?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(808, 'en', 'Enable stikcy header?', 'Enable stikcy header?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
(809, 'en', 'Website Footer', 'Website Footer', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(810, 'en', 'Footer Widget', 'Footer Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(811, 'en', 'About Widget', 'About Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(812, 'en', 'Footer Logo', 'Footer Logo', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(813, 'en', 'About description', 'About description', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(814, 'en', 'Contact Info Widget', 'Contact Info Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(815, 'en', 'Footer contact address', 'Footer contact address', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(816, 'en', 'Footer contact phone', 'Footer contact phone', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(817, 'en', 'Footer contact email', 'Footer contact email', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(818, 'en', 'Link Widget One', 'Link Widget One', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(819, 'en', 'Links', 'Links', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(820, 'en', 'Footer Bottom', 'Footer Bottom', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
(821, 'en', 'Copyright Widget ', 'Copyright Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(822, 'en', 'Copyright Text', 'Copyright Text', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(823, 'en', 'Social Link Widget ', 'Social Link Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(824, 'en', 'Show Social Links?', 'Show Social Links?', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(825, 'en', 'Social Links', 'Social Links', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(826, 'en', 'Payment Methods Widget ', 'Payment Methods Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
(827, 'en', 'RTL status updated successfully', 'RTL status updated successfully', '2020-11-07 08:36:11', '2020-11-07 08:36:11'),
(828, 'en', 'Language changed to ', 'Language changed to ', '2020-11-07 08:36:27', '2020-11-07 08:36:27'),
(829, 'en', 'Inhouse Product sale report', 'Inhouse Product sale report', '2020-11-07 09:30:25', '2020-11-07 09:30:25'),
(830, 'en', 'Sort by Category', 'Sort by Category', '2020-11-07 09:30:25', '2020-11-07 09:30:25'),
(831, 'en', 'Product wise stock report', 'Product wise stock report', '2020-11-07 09:31:02', '2020-11-07 09:31:02'),
(832, 'en', 'Currency changed to ', 'Currency changed to ', '2020-11-07 12:36:28', '2020-11-07 12:36:28'),
(833, 'en', 'Avatar', 'Avatar', '2020-11-08 09:32:35', '2020-11-08 09:32:35'),
(834, 'en', 'Copy', 'Copy', '2020-11-08 10:03:42', '2020-11-08 10:03:42'),
(835, 'en', 'Variant', 'Variant', '2020-11-08 10:43:02', '2020-11-08 10:43:02'),
(836, 'en', 'Variant Price', 'Variant Price', '2020-11-08 10:43:03', '2020-11-08 10:43:03'),
(837, 'en', 'SKU', 'SKU', '2020-11-08 10:43:03', '2020-11-08 10:43:03'),
(838, 'en', 'Key', 'Key', '2020-11-08 12:35:09', '2020-11-08 12:35:09'),
(839, 'en', 'Value', 'Value', '2020-11-08 12:35:09', '2020-11-08 12:35:09'),
(840, 'en', 'Copy Translations', 'Copy Translations', '2020-11-08 12:35:10', '2020-11-08 12:35:10'),
(841, 'en', 'All Pick-up Points', 'All Pick-up Points', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(842, 'en', 'Add New Pick-up Point', 'Add New Pick-up Point', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(843, 'en', 'Manager', 'Manager', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(844, 'en', 'Location', 'Location', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(845, 'en', 'Pickup Station Contact', 'Pickup Station Contact', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(846, 'en', 'Open', 'Open', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
(847, 'en', 'POS Activation for Seller', 'POS Activation for Seller', '2020-11-08 12:35:55', '2020-11-08 12:35:55'),
(848, 'en', 'Order Completed Successfully.', 'Order Completed Successfully.', '2020-11-08 12:36:02', '2020-11-08 12:36:02'),
(849, 'en', 'Text Input', 'Text Input', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(850, 'en', 'Select', 'Select', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(851, 'en', 'Multiple Select', 'Multiple Select', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(852, 'en', 'Radio', 'Radio', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(853, 'en', 'File', 'File', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
(854, 'en', 'Email Address', 'Email Address', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(855, 'en', 'Verification Info', 'Verification Info', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(856, 'en', 'Approval', 'Approval', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(857, 'en', 'Due Amount', 'Due Amount', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(858, 'en', 'Show', 'Show', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(859, 'en', 'Pay Now', 'Pay Now', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
(860, 'en', 'Affiliate User Verification', 'Affiliate User Verification', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
(861, 'en', 'Reject', 'Reject', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
(862, 'en', 'Accept', 'Accept', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
(863, 'en', 'Beauty, Health & Hair', 'Beauty, Health & Hair', '2020-11-08 12:54:17', '2020-11-08 12:54:17'),
(864, 'en', 'Comparison', 'Comparison', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
(865, 'en', 'Reset Compare List', 'Reset Compare List', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
(866, 'en', 'Your comparison list is empty', 'Your comparison list is empty', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
(867, 'en', 'Convert Point To Wallet', 'Convert Point To Wallet', '2020-11-08 13:04:42', '2020-11-08 13:04:42'),
(868, 'en', 'Note: You need to activate wallet option first before using club point addon.', 'Note: You need to activate wallet option first before using club point addon.', '2020-11-08 13:04:43', '2020-11-08 13:04:43'),
(869, 'en', 'Create an account.', 'Create an account.', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(870, 'en', 'Use Email Instead', 'Use Email Instead', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(871, 'en', 'By signing up you agree to our terms and conditions.', 'By signing up you agree to our terms and conditions.', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(872, 'en', 'Create Account', 'Create Account', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(873, 'en', 'Or Join With', 'Or Join With', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(874, 'en', 'Already have an account?', 'Already have an account?', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(875, 'en', 'Log In', 'Log In', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
(876, 'en', 'Computer & Accessories', 'Computer & Accessories', '2020-11-09 07:52:05', '2020-11-09 07:52:05'),
(878, 'en', 'Product(s)', 'Product(s)', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
(879, 'en', 'in your cart', 'in your cart', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
(880, 'en', 'in your wishlist', 'in your wishlist', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
(881, 'en', 'you ordered', 'you ordered', '2020-11-09 07:52:24', '2020-11-09 07:52:24'),
(882, 'en', 'Default Shipping Address', 'Default Shipping Address', '2020-11-09 07:52:24', '2020-11-09 07:52:24'),
(883, 'en', 'Sports & outdoor', 'Sports & outdoor', '2020-11-09 07:53:32', '2020-11-09 07:53:32'),
(884, 'en', 'Copied', 'Copied', '2020-11-09 07:54:19', '2020-11-09 07:54:19'),
(885, 'en', 'Copy the Promote Link', 'Copy the Promote Link', '2020-11-09 07:54:19', '2020-11-09 07:54:19'),
(886, 'en', 'Write a review', 'Write a review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(887, 'en', 'Your name', 'Your name', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(888, 'en', 'Comment', 'Comment', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(889, 'en', 'Your review', 'Your review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(890, 'en', 'Submit review', 'Submit review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
(891, 'en', 'Claire Willis', 'Claire Willis', '2020-11-09 08:05:00', '2020-11-09 08:05:00'),
(892, 'en', 'Germaine Greene', 'Germaine Greene', '2020-11-09 08:05:00', '2020-11-09 08:05:00'),
(893, 'en', 'Product File', 'Product File', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(894, 'en', 'Choose file', 'Choose file', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(895, 'en', 'Type to add a tag', 'Type to add a tag', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(896, 'en', 'Images', 'Images', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(897, 'en', 'Main Images', 'Main Images', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(898, 'en', 'Meta Tags', 'Meta Tags', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
(899, 'en', 'Digital Product has been inserted successfully', 'Digital Product has been inserted successfully', '2020-11-09 08:14:25', '2020-11-09 08:14:25'),
(900, 'en', 'Edit Digital Product', 'Edit Digital Product', '2020-11-09 08:14:34', '2020-11-09 08:14:34'),
(901, 'en', 'Select an option', 'Select an option', '2020-11-09 08:14:34', '2020-11-09 08:14:34'),
(902, 'en', 'tax', 'tax', '2020-11-09 08:14:35', '2020-11-09 08:14:35'),
(903, 'en', 'Any question about this product?', 'Any question about this product?', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(904, 'en', 'Sign in', 'Sign in', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(905, 'en', 'Login with Google', 'Login with Google', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(906, 'en', 'Login with Facebook', 'Login with Facebook', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(907, 'en', 'Login with Twitter', 'Login with Twitter', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
(908, 'en', 'Click to show phone number', 'Click to show phone number', '2020-11-09 08:15:51', '2020-11-09 08:15:51'),
(909, 'en', 'Other Ads of', 'Other Ads of', '2020-11-09 08:15:52', '2020-11-09 08:15:52'),
(910, 'en', 'Store Home', 'Store Home', '2020-11-09 08:54:23', '2020-11-09 08:54:23'),
(911, 'en', 'Top Selling', 'Top Selling', '2020-11-09 08:54:23', '2020-11-09 08:54:23'),
(912, 'en', 'Shop Settings', 'Shop Settings', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(913, 'en', 'Visit Shop', 'Visit Shop', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(914, 'en', 'Pickup Points', 'Pickup Points', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(915, 'en', 'Select Pickup Point', 'Select Pickup Point', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
(916, 'en', 'Slider Settings', 'Slider Settings', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(917, 'en', 'Social Media Link', 'Social Media Link', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(918, 'en', 'Facebook', 'Facebook', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(919, 'en', 'Twitter', 'Twitter', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(920, 'en', 'Google', 'Google', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
(921, 'en', 'New Arrival Products', 'New Arrival Products', '2020-11-09 08:56:26', '2020-11-09 08:56:26'),
(922, 'en', 'Check Your Order Status', 'Check Your Order Status', '2020-11-09 09:23:32', '2020-11-09 09:23:32'),
(923, 'en', 'Shipping method', 'Shipping method', '2020-11-09 09:27:40', '2020-11-09 09:27:40'),
(924, 'en', 'Shipped By', 'Shipped By', '2020-11-09 09:27:41', '2020-11-09 09:27:41'),
(925, 'en', 'Image', 'Image', '2020-11-09 09:29:37', '2020-11-09 09:29:37'),
(926, 'en', 'Sub Sub Category', 'Sub Sub Category', '2020-11-09 09:29:37', '2020-11-09 09:29:37'),
(927, 'en', 'Inhouse Products', 'Inhouse Products', '2020-11-09 10:22:32', '2020-11-09 10:22:32'),
(928, 'en', 'Forgot Password?', 'Forgot Password?', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(929, 'en', 'Enter your email address to recover your password.', 'Enter your email address to recover your password.', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(930, 'en', 'Email or Phone', 'Email or Phone', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(931, 'en', 'Send Password Reset Link', 'Send Password Reset Link', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(932, 'en', 'Back to Login', 'Back to Login', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
(933, 'en', 'index', 'index', '2020-11-09 10:35:29', '2020-11-09 10:35:29'),
(934, 'en', 'Download Your Product', 'Download Your Product', '2020-11-09 10:35:30', '2020-11-09 10:35:30'),
(935, 'en', 'Option', 'Option', '2020-11-09 10:35:30', '2020-11-09 10:35:30'),
(936, 'en', 'Applied Refund Request', 'Applied Refund Request', '2020-11-09 10:35:39', '2020-11-09 10:35:39'),
(937, 'en', 'Item has been renoved from wishlist', 'Item has been renoved from wishlist', '2020-11-09 10:36:04', '2020-11-09 10:36:04'),
(938, 'en', 'Bulk Products Upload', 'Bulk Products Upload', '2020-11-09 10:39:24', '2020-11-09 10:39:24'),
(939, 'en', 'Upload CSV', 'Upload CSV', '2020-11-09 10:39:25', '2020-11-09 10:39:25'),
(940, 'en', 'Create a Ticket', 'Create a Ticket', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(941, 'en', 'Tickets', 'Tickets', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(942, 'en', 'Ticket ID', 'Ticket ID', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(943, 'en', 'Sending Date', 'Sending Date', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(944, 'en', 'Subject', 'Subject', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(945, 'en', 'View Details', 'View Details', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
(946, 'en', 'Provide a detailed description', 'Provide a detailed description', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
(947, 'en', 'Type your reply', 'Type your reply', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
(948, 'en', 'Send Ticket', 'Send Ticket', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
(949, 'en', 'Load More', 'Load More', '2020-11-09 10:40:57', '2020-11-09 10:40:57'),
(950, 'en', 'Jewelry & Watches', 'Jewelry & Watches', '2020-11-09 10:47:38', '2020-11-09 10:47:38'),
(951, 'en', 'Filters', 'Filters', '2020-11-09 10:53:54', '2020-11-09 10:53:54'),
(952, 'en', 'Contact address', 'Contact address', '2020-11-09 10:58:46', '2020-11-09 10:58:46'),
(953, 'en', 'Contact phone', 'Contact phone', '2020-11-09 10:58:47', '2020-11-09 10:58:47'),
(954, 'en', 'Contact email', 'Contact email', '2020-11-09 10:58:47', '2020-11-09 10:58:47'),
(955, 'en', 'Filter by', 'Filter by', '2020-11-09 11:00:03', '2020-11-09 11:00:03'),
(956, 'en', 'Condition', 'Condition', '2020-11-09 11:56:13', '2020-11-09 11:56:13'),
(957, 'en', 'All Type', 'All Type', '2020-11-09 11:56:13', '2020-11-09 11:56:13'),
(960, 'en', 'Pay with wallet', 'Pay with wallet', '2020-11-09 12:56:34', '2020-11-09 12:56:34'),
(961, 'en', 'Select variation', 'Select variation', '2020-11-10 07:54:29', '2020-11-10 07:54:29'),
(962, 'en', 'No Product Added', 'No Product Added', '2020-11-10 08:07:53', '2020-11-10 08:07:53'),
(963, 'en', 'Status has been updated successfully', 'Status has been updated successfully', '2020-11-10 08:41:23', '2020-11-10 08:41:23'),
(964, 'en', 'All Seller Packages', 'All Seller Packages', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(965, 'en', 'Add New Package', 'Add New Package', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(966, 'en', 'Package Logo', 'Package Logo', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(967, 'en', 'days', 'days', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
(968, 'en', 'Create New Seller Package', 'Create New Seller Package', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(969, 'en', 'Package Name', 'Package Name', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(970, 'en', 'Duration', 'Duration', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(971, 'en', 'Validity in number of days', 'Validity in number of days', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
(972, 'en', 'Update Package Information', 'Update Package Information', '2020-11-10 09:14:59', '2020-11-10 09:14:59'),
(973, 'en', 'Package has been inserted successfully', 'Package has been inserted successfully', '2020-11-10 09:15:14', '2020-11-10 09:15:14'),
(974, 'en', 'Refund Request', 'Refund Request', '2020-11-10 09:17:25', '2020-11-10 09:17:25'),
(975, 'en', 'Reason', 'Reason', '2020-11-10 09:17:25', '2020-11-10 09:17:25'),
(976, 'en', 'Label', 'Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(977, 'en', 'Select Label', 'Select Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(978, 'en', 'Multiple Select Label', 'Multiple Select Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(979, 'en', 'Radio Label', 'Radio Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
(980, 'en', 'Pickup Point Orders', 'Pickup Point Orders', '2020-11-10 09:25:40', '2020-11-10 09:25:40'),
(981, 'en', 'View', 'View', '2020-11-10 09:25:40', '2020-11-10 09:25:40'),
(982, 'en', 'Order #', 'Order #', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
(983, 'en', 'Order Status', 'Order Status', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
(984, 'en', 'Total amount', 'Total amount', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
(986, 'en', 'TOTAL', 'TOTAL', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
(987, 'en', 'Delivery status has been updated', 'Delivery status has been updated', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
(988, 'en', 'Payment status has been updated', 'Payment status has been updated', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
(989, 'en', 'INVOICE', 'INVOICE', '2020-11-10 09:25:58', '2020-11-10 09:25:58'),
(990, 'en', 'Set Refund Time', 'Set Refund Time', '2020-11-10 09:34:04', '2020-11-10 09:34:04'),
(991, 'en', 'Set Time for sending Refund Request', 'Set Time for sending Refund Request', '2020-11-10 09:34:04', '2020-11-10 09:34:04'),
(992, 'en', 'Set Refund Sticker', 'Set Refund Sticker', '2020-11-10 09:34:05', '2020-11-10 09:34:05'),
(993, 'en', 'Sticker', 'Sticker', '2020-11-10 09:34:05', '2020-11-10 09:34:05'),
(994, 'en', 'Refund Request All', 'Refund Request All', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(995, 'en', 'Order Id', 'Order Id', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(996, 'en', 'Seller Approval', 'Seller Approval', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(997, 'en', 'Admin Approval', 'Admin Approval', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(998, 'en', 'Refund Status', 'Refund Status', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
(1000, 'en', 'No Refund', 'No Refund', '2020-11-10 09:35:27', '2020-11-10 09:35:27'),
(1001, 'en', 'Status updated successfully', 'Status updated successfully', '2020-11-10 09:54:20', '2020-11-10 09:54:20'),
(1002, 'en', 'User Search Report', 'User Search Report', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
(1003, 'en', 'Search By', 'Search By', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
(1004, 'en', 'Number searches', 'Number searches', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
(1005, 'en', 'Sender', 'Sender', '2020-11-11 06:51:49', '2020-11-11 06:51:49'),
(1006, 'en', 'Receiver', 'Receiver', '2020-11-11 06:51:49', '2020-11-11 06:51:49'),
(1007, 'en', 'Verification form updated successfully', 'Verification form updated successfully', '2020-11-11 06:53:29', '2020-11-11 06:53:29'),
(1008, 'en', 'Invalid email or password', 'Invalid email or password', '2020-11-11 07:07:49', '2020-11-11 07:07:49'),
(1009, 'en', 'All Coupons', 'All Coupons', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1010, 'en', 'Add New Coupon', 'Add New Coupon', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1011, 'en', 'Coupon Information', 'Coupon Information', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1012, 'en', 'Start Date', 'Start Date', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
(1013, 'en', 'End Date', 'End Date', '2020-11-11 07:14:05', '2020-11-11 07:14:05'),
(1014, 'en', 'Product Base', 'Product Base', '2020-11-11 07:14:05', '2020-11-11 07:14:05'),
(1015, 'en', 'Send Newsletter', 'Send Newsletter', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1016, 'en', 'Mobile Users', 'Mobile Users', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1017, 'en', 'SMS subject', 'SMS subject', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1018, 'en', 'SMS content', 'SMS content', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
(1019, 'en', 'All Flash Delas', 'All Flash Delas', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
(1020, 'en', 'Create New Flash Dela', 'Create New Flash Dela', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
(1022, 'en', 'Page Link', 'Page Link', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
(1023, 'en', 'Flash Deal Information', 'Flash Deal Information', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1024, 'en', 'Background Color', 'Background Color', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1026, 'en', 'Text Color', 'Text Color', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1027, 'en', 'White', 'White', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
(1028, 'en', 'Dark', 'Dark', '2020-11-11 07:16:15', '2020-11-11 07:16:15'),
(1029, 'en', 'Choose Products', 'Choose Products', '2020-11-11 07:16:15', '2020-11-11 07:16:15'),
(1030, 'en', 'Discounts', 'Discounts', '2020-11-11 07:16:20', '2020-11-11 07:16:20'),
(1031, 'en', 'Discount Type', 'Discount Type', '2020-11-11 07:16:20', '2020-11-11 07:16:20'),
(1032, 'en', 'Twillo Credential', 'Twillo Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1033, 'en', 'TWILIO SID', 'TWILIO SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1034, 'en', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1035, 'en', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1036, 'en', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1037, 'en', 'Nexmo Credential', 'Nexmo Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1038, 'en', 'NEXMO KEY', 'NEXMO KEY', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1039, 'en', 'NEXMO SECRET', 'NEXMO SECRET', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1040, 'en', 'SSL Wireless Credential', 'SSL Wireless Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1041, 'en', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1042, 'en', 'SSL SMS SID', 'SSL SMS SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1043, 'en', 'SSL SMS URL', 'SSL SMS URL', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1044, 'en', 'Fast2SMS Credential', 'Fast2SMS Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1045, 'en', 'AUTH KEY', 'AUTH KEY', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1046, 'en', 'ROUTE', 'ROUTE', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1047, 'en', 'Promotional Use', 'Promotional Use', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1048, 'en', 'Transactional Use', 'Transactional Use', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1050, 'en', 'SENDER ID', 'SENDER ID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
(1051, 'en', 'Nexmo OTP', 'Nexmo OTP', '2020-11-11 07:17:42', '2020-11-11 07:17:42'),
(1052, 'en', 'Twillo OTP', 'Twillo OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1053, 'en', 'SSL Wireless OTP', 'SSL Wireless OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1054, 'en', 'Fast2SMS OTP', 'Fast2SMS OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1055, 'en', 'Order Placement', 'Order Placement', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1056, 'en', 'Delivery Status Changing Time', 'Delivery Status Changing Time', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1057, 'en', 'Paid Status Changing Time', 'Paid Status Changing Time', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
(1058, 'en', 'Send Bulk SMS', 'Send Bulk SMS', '2020-11-11 07:19:14', '2020-11-11 07:19:14'),
(1059, 'en', 'All Subscribers', 'All Subscribers', '2020-11-11 07:21:51', '2020-11-11 07:21:51'),
(1060, 'en', 'Coupon Information Adding', 'Coupon Information Adding', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1061, 'en', 'Coupon Type', 'Coupon Type', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1062, 'en', 'For Products', 'For Products', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1063, 'en', 'For Total Orders', 'For Total Orders', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
(1064, 'en', 'Add Your Product Base Coupon', 'Add Your Product Base Coupon', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
(1065, 'en', 'Coupon code', 'Coupon code', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
(1066, 'en', 'Sub Category', 'Sub Category', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
(1067, 'en', 'Add More', 'Add More', '2020-11-11 07:22:43', '2020-11-11 07:22:43'),
(1068, 'en', 'Add Your Cart Base Coupon', 'Add Your Cart Base Coupon', '2020-11-11 07:29:40', '2020-11-11 07:29:40'),
(1069, 'en', 'Minimum Shopping', 'Minimum Shopping', '2020-11-11 07:29:40', '2020-11-11 07:29:40'),
(1070, 'en', 'Maximum Discount Amount', 'Maximum Discount Amount', '2020-11-11 07:29:41', '2020-11-11 07:29:41'),
(1071, 'en', 'Coupon Information Update', 'Coupon Information Update', '2020-11-11 08:18:34', '2020-11-11 08:18:34'),
(1073, 'en', 'Please Configure SMTP Setting to work all email sending funtionality', 'Please Configure SMTP Setting to work all email sending funtionality', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1074, 'en', 'Configure Now', 'Configure Now', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1076, 'en', 'Total published products', 'Total published products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1077, 'en', 'Total sellers products', 'Total sellers products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1078, 'en', 'Total admin products', 'Total admin products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1079, 'en', 'Manage Products', 'Manage Products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1080, 'en', 'Total product category', 'Total product category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1081, 'en', 'Create Category', 'Create Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1082, 'en', 'Total product sub sub category', 'Total product sub sub category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1083, 'en', 'Create Sub Sub Category', 'Create Sub Sub Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1084, 'en', 'Total product sub category', 'Total product sub category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1085, 'en', 'Create Sub Category', 'Create Sub Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1086, 'en', 'Total product brand', 'Total product brand', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1087, 'en', 'Create Brand', 'Create Brand', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
(1089, 'en', 'Total sellers', 'Total sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1091, 'en', 'Total approved sellers', 'Total approved sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1093, 'en', 'Total pending sellers', 'Total pending sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1094, 'en', 'Manage Sellers', 'Manage Sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1095, 'en', 'Category wise product sale', 'Category wise product sale', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1097, 'en', 'Sale', 'Sale', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1098, 'en', 'Category wise product stock', 'Category wise product stock', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1099, 'en', 'Category Name', 'Category Name', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1100, 'en', 'Stock', 'Stock', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1101, 'en', 'Frontend', 'Frontend', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1103, 'en', 'Home page', 'Home page', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1104, 'en', 'setting', 'setting', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
(1106, 'en', 'Policy page', 'Policy page', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1107, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1109, 'en', 'General', 'General', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1110, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1111, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1112, 'en', 'Useful link', 'Useful link', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1113, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1114, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1115, 'en', 'Activation', 'Activation', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1116, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1117, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1118, 'en', 'SMTP', 'SMTP', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1119, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1120, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1121, 'en', 'Payment method', 'Payment method', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1122, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1123, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1124, 'en', 'Social media', 'Social media', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1125, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
(1126, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1127, 'en', 'Business', 'Business', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1128, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1130, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1131, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1132, 'en', 'Seller verification', 'Seller verification', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1133, 'en', 'form setting', 'form setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1134, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1135, 'en', 'Language', 'Language', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1136, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1137, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1139, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1140, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1141, 'en', 'Dashboard', 'Dashboard', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1142, 'en', 'POS System', 'POS System', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1143, 'en', 'POS Manager', 'POS Manager', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1144, 'en', 'POS Configuration', 'POS Configuration', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1145, 'en', 'Products', 'Products', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
(1146, 'en', 'Add New product', 'Add New product', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1147, 'en', 'All Products', 'All Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1148, 'en', 'In House Products', 'In House Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1149, 'en', 'Seller Products', 'Seller Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1150, 'en', 'Digital Products', 'Digital Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1151, 'en', 'Bulk Import', 'Bulk Import', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1152, 'en', 'Bulk Export', 'Bulk Export', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1153, 'en', 'Category', 'Category', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1154, 'en', 'Subcategory', 'Subcategory', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1155, 'en', 'Sub Subcategory', 'Sub Subcategory', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1156, 'en', 'Brand', 'Brand', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1157, 'en', 'Attribute', 'Attribute', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1158, 'en', 'Product Reviews', 'Product Reviews', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1159, 'en', 'Sales', 'Sales', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1160, 'en', 'All Orders', 'All Orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1161, 'en', 'Inhouse orders', 'Inhouse orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1162, 'en', 'Seller Orders', 'Seller Orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1163, 'en', 'Pick-up Point Order', 'Pick-up Point Order', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1164, 'en', 'Refunds', 'Refunds', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1165, 'en', 'Refund Requests', 'Refund Requests', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
(1166, 'en', 'Approved Refund', 'Approved Refund', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1167, 'en', 'Refund Configuration', 'Refund Configuration', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1168, 'en', 'Customers', 'Customers', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1169, 'en', 'Customer list', 'Customer list', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1170, 'en', 'Classified Products', 'Classified Products', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1171, 'en', 'Classified Packages', 'Classified Packages', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1172, 'en', 'Sellers', 'Sellers', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1173, 'en', 'All Seller', 'All Seller', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1174, 'en', 'Payouts', 'Payouts', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1175, 'en', 'Payout Requests', 'Payout Requests', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1176, 'en', 'Seller Commission', 'Seller Commission', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1177, 'en', 'Seller Packages', 'Seller Packages', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1178, 'en', 'Seller Verification Form', 'Seller Verification Form', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1179, 'en', 'Reports', 'Reports', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1180, 'en', 'In House Product Sale', 'In House Product Sale', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1181, 'en', 'Seller Products Sale', 'Seller Products Sale', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1182, 'en', 'Products Stock', 'Products Stock', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1183, 'en', 'Products wishlist', 'Products wishlist', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1184, 'en', 'User Searches', 'User Searches', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
(1185, 'en', 'Marketing', 'Marketing', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1186, 'en', 'Flash deals', 'Flash deals', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1187, 'en', 'Newsletters', 'Newsletters', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1188, 'en', 'Bulk SMS', 'Bulk SMS', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1189, 'en', 'Subscribers', 'Subscribers', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1190, 'en', 'Coupon', 'Coupon', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1191, 'en', 'Support', 'Support', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1192, 'en', 'Ticket', 'Ticket', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1193, 'en', 'Product Queries', 'Product Queries', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1194, 'en', 'Website Setup', 'Website Setup', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1195, 'en', 'Header', 'Header', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1196, 'en', 'Footer', 'Footer', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1197, 'en', 'Pages', 'Pages', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1198, 'en', 'Appearance', 'Appearance', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1199, 'en', 'Setup & Configurations', 'Setup & Configurations', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1200, 'en', 'General Settings', 'General Settings', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1201, 'en', 'Features activation', 'Features activation', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1202, 'en', 'Languages', 'Languages', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
(1203, 'en', 'Currency', 'Currency', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1204, 'en', 'Pickup point', 'Pickup point', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1205, 'en', 'SMTP Settings', 'SMTP Settings', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1206, 'en', 'Payment Methods', 'Payment Methods', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1207, 'en', 'File System Configuration', 'File System Configuration', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1208, 'en', 'Social media Logins', 'Social media Logins', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1209, 'en', 'Analytics Tools', 'Analytics Tools', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1210, 'en', 'Facebook Chat', 'Facebook Chat', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1211, 'en', 'Google reCAPTCHA', 'Google reCAPTCHA', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1212, 'en', 'Shipping Configuration', 'Shipping Configuration', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1213, 'en', 'Shipping Countries', 'Shipping Countries', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1214, 'en', 'Affiliate System', 'Affiliate System', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1215, 'en', 'Affiliate Registration Form', 'Affiliate Registration Form', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1216, 'en', 'Affiliate Configurations', 'Affiliate Configurations', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1217, 'en', 'Affiliate Users', 'Affiliate Users', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1218, 'en', 'Referral Users', 'Referral Users', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
(1219, 'en', 'Affiliate Withdraw Requests', 'Affiliate Withdraw Requests', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1220, 'en', 'Offline Payment System', 'Offline Payment System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1221, 'en', 'Manual Payment Methods', 'Manual Payment Methods', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1222, 'en', 'Offline Wallet Recharge', 'Offline Wallet Recharge', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1223, 'en', 'Offline Customer Package Payments', 'Offline Customer Package Payments', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1224, 'en', 'Offline Seller Package Payments', 'Offline Seller Package Payments', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1225, 'en', 'Paytm Payment Gateway', 'Paytm Payment Gateway', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1226, 'en', 'Set Paytm Credentials', 'Set Paytm Credentials', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1227, 'en', 'Club Point System', 'Club Point System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1228, 'en', 'Club Point Configurations', 'Club Point Configurations', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1229, 'en', 'Set Product Point', 'Set Product Point', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1230, 'en', 'User Points', 'User Points', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1231, 'en', 'OTP System', 'OTP System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1232, 'en', 'OTP Configurations', 'OTP Configurations', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1233, 'en', 'Set OTP Credentials', 'Set OTP Credentials', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1234, 'en', 'Staffs', 'Staffs', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
(1235, 'en', 'All staffs', 'All staffs', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1236, 'en', 'Staff permissions', 'Staff permissions', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1237, 'en', 'Addon Manager', 'Addon Manager', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1238, 'en', 'Browse Website', 'Browse Website', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1239, 'en', 'POS', 'POS', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1240, 'en', 'Notifications', 'Notifications', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1241, 'en', 'new orders', 'new orders', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1242, 'en', 'user-image', 'user-image', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1243, 'en', 'Profile', 'Profile', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1244, 'en', 'Logout', 'Logout', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
(1247, 'en', 'Page Not Found!', 'Page Not Found!', '2020-11-11 13:10:28', '2020-11-11 13:10:28'),
(1249, 'en', 'The page you are looking for has not been found on our server.', 'The page you are looking for has not been found on our server.', '2020-11-11 13:10:28', '2020-11-11 13:10:28'),
(1253, 'en', 'Registration', 'Registration', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1255, 'en', 'I am shopping for...', 'I am shopping for...', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1257, 'en', 'Compare', 'Compare', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1259, 'en', 'Wishlist', 'Wishlist', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1261, 'en', 'Cart', 'Cart', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1263, 'en', 'Your Cart is empty', 'Your Cart is empty', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1265, 'en', 'Categories', 'Categories', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1267, 'en', 'See All', 'See All', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1269, 'en', 'Seller Policy', 'Seller Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1271, 'en', 'Return Policy', 'Return Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1273, 'en', 'Support Policy', 'Support Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1275, 'en', 'Privacy Policy', 'Privacy Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1277, 'en', 'Your Email Address', 'Your Email Address', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1279, 'en', 'Subscribe', 'Subscribe', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1281, 'en', 'Contact Info', 'Contact Info', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1283, 'en', 'Address', 'Address', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
(1285, 'en', 'Phone', 'Phone', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1287, 'en', 'Email', 'Email', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1288, 'en', 'Login', 'Login', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1289, 'en', 'My Account', 'My Account', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1291, 'en', 'Login', 'Login', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1293, 'en', 'Order History', 'Order History', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1295, 'en', 'My Wishlist', 'My Wishlist', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1297, 'en', 'Track Order', 'Track Order', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1299, 'en', 'Be an affiliate partner', 'Be an affiliate partner', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1301, 'en', 'Be a Seller', 'Be a Seller', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1303, 'en', 'Apply Now', 'Apply Now', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1305, 'en', 'Confirmation', 'Confirmation', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1307, 'en', 'Delete confirmation message', 'Delete confirmation message', '2020-11-11 13:10:30', '2020-11-11 13:10:30');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1309, 'en', 'Cancel', 'Cancel', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1312, 'en', 'Delete', 'Delete', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1313, 'en', 'Item has been added to compare list', 'Item has been added to compare list', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1314, 'en', 'Please login first', 'Please login first', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
(1315, 'en', 'Total Earnings From', 'Total Earnings From', '2020-11-12 08:01:11', '2020-11-12 08:01:11'),
(1316, 'en', 'Client Subscription', 'Client Subscription', '2020-11-12 08:01:12', '2020-11-12 08:01:12'),
(1317, 'en', 'Product category', 'Product category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1318, 'en', 'Product sub sub category', 'Product sub sub category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1319, 'en', 'Product sub category', 'Product sub category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1320, 'en', 'Product brand', 'Product brand', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
(1321, 'en', 'Top Client Packages', 'Top Client Packages', '2020-11-12 08:05:21', '2020-11-12 08:05:21'),
(1322, 'en', 'Top Freelancer Packages', 'Top Freelancer Packages', '2020-11-12 08:05:21', '2020-11-12 08:05:21'),
(1323, 'en', 'Number of sale', 'Number of sale', '2020-11-12 09:13:09', '2020-11-12 09:13:09'),
(1324, 'en', 'Number of Stock', 'Number of Stock', '2020-11-12 09:16:02', '2020-11-12 09:16:02'),
(1325, 'en', 'Top 10 Products', 'Top 10 Products', '2020-11-12 10:02:29', '2020-11-12 10:02:29'),
(1326, 'en', 'Top 12 Products', 'Top 12 Products', '2020-11-12 10:02:39', '2020-11-12 10:02:39'),
(1327, 'en', 'Admin can not be a seller', 'Admin can not be a seller', '2020-11-12 11:30:19', '2020-11-12 11:30:19'),
(1328, 'en', 'Filter by Rating', 'Filter by Rating', '2020-11-15 08:01:15', '2020-11-15 08:01:15'),
(1329, 'en', 'Published reviews updated successfully', 'Published reviews updated successfully', '2020-11-15 08:01:15', '2020-11-15 08:01:15'),
(1330, 'en', 'Refund Sticker has been updated successfully', 'Refund Sticker has been updated successfully', '2020-11-15 08:17:12', '2020-11-15 08:17:12'),
(1331, 'en', 'Edit Product', 'Edit Product', '2020-11-15 10:31:54', '2020-11-15 10:31:54'),
(1332, 'en', 'Meta Images', 'Meta Images', '2020-11-15 10:32:12', '2020-11-15 10:32:12'),
(1333, 'en', 'Update Product', 'Update Product', '2020-11-15 10:32:12', '2020-11-15 10:32:12'),
(1334, 'en', 'Product has been deleted successfully', 'Product has been deleted successfully', '2020-11-15 10:32:57', '2020-11-15 10:32:57'),
(1335, 'en', 'Your Profile has been updated successfully!', 'Your Profile has been updated successfully!', '2020-11-15 11:10:42', '2020-11-15 11:10:42'),
(1336, 'en', 'Upload limit has been reached. Please upgrade your package.', 'Upload limit has been reached. Please upgrade your package.', '2020-11-15 11:13:45', '2020-11-15 11:13:45'),
(1337, 'en', 'Add Your Product', 'Add Your Product', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1338, 'en', 'Select a category', 'Select a category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1339, 'en', 'Select a brand', 'Select a brand', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1340, 'en', 'Product Unit', 'Product Unit', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1341, 'en', 'Minimum Qty.', 'Minimum Qty.', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1342, 'en', 'Product Tag', 'Product Tag', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1343, 'en', 'Type & hit enter', 'Type & hit enter', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1344, 'en', 'Videos', 'Videos', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1345, 'en', 'Video From', 'Video From', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1346, 'en', 'Video URL', 'Video URL', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1347, 'en', 'Customer Choice', 'Customer Choice', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1348, 'en', 'PDF', 'PDF', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1349, 'en', 'Choose PDF', 'Choose PDF', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1350, 'en', 'Select Category', 'Select Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1351, 'en', 'Target Category', 'Target Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1352, 'en', 'subsubcategory', 'subsubcategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1353, 'en', 'Search Category', 'Search Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1354, 'en', 'Search SubCategory', 'Search SubCategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1355, 'en', 'Search SubSubCategory', 'Search SubSubCategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
(1356, 'en', 'Update your product', 'Update your product', '2020-11-15 11:39:14', '2020-11-15 11:39:14'),
(1357, 'en', 'Product has been updated successfully', 'Product has been updated successfully', '2020-11-15 11:51:36', '2020-11-15 11:51:36'),
(1358, 'en', 'Add Your Digital Product', 'Add Your Digital Product', '2020-11-15 12:24:21', '2020-11-15 12:24:21'),
(1359, 'en', 'Active eCommerce CMS Update Process', 'Active eCommerce CMS Update Process', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1361, 'en', 'Codecanyon purchase code', 'Codecanyon purchase code', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1362, 'en', 'Database Name', 'Database Name', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1363, 'en', 'Database Username', 'Database Username', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1364, 'en', 'Database Password', 'Database Password', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1365, 'en', 'Database Hostname', 'Database Hostname', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1366, 'en', 'Update Now', 'Update Now', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
(1368, 'en', 'Congratulations', 'Congratulations', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1369, 'en', 'You have successfully completed the updating process. Please Login to continue', 'You have successfully completed the updating process. Please Login to continue', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1370, 'en', 'Go to Home', 'Go to Home', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1371, 'en', 'Login to Admin panel', 'Login to Admin panel', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
(1372, 'en', 'S3 File System Credentials', 'S3 File System Credentials', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1373, 'en', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1374, 'en', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1375, 'en', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1376, 'en', 'AWS_BUCKET', 'AWS_BUCKET', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1377, 'en', 'AWS_URL', 'AWS_URL', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1378, 'en', 'S3 File System Activation', 'S3 File System Activation', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
(1379, 'en', 'Your phone number', 'Your phone number', '2020-11-17 05:50:10', '2020-11-17 05:50:10'),
(1380, 'en', 'Zip File', 'Zip File', '2020-11-17 06:58:45', '2020-11-17 06:58:45'),
(1381, 'en', 'Install', 'Install', '2020-11-17 06:58:45', '2020-11-17 06:58:45'),
(1382, 'en', 'This version is not capable of installing Addons, Please update.', 'This version is not capable of installing Addons, Please update.', '2020-11-17 06:59:11', '2020-11-17 06:59:11'),
(1383, 'en', 'Browse All Categories', 'Browse All Categories', '2021-02-09 09:01:58', '2021-02-09 09:01:58'),
(1384, 'en', 'Find Our Locations', 'Find Our Locations', '2021-02-09 09:01:58', '2021-02-09 09:01:58'),
(1385, 'en', 'To Get More Emersive', 'To Get More Emersive', '2021-02-09 09:01:58', '2021-02-09 09:01:58'),
(1386, 'en', 'Nothing selected', 'Nothing selected', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1387, 'en', 'Nothing found', 'Nothing found', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1388, 'en', 'File selected', 'File selected', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1389, 'en', 'Files selected', 'Files selected', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1390, 'en', 'Add more files', 'Add more files', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1391, 'en', 'Adding more files', 'Adding more files', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1392, 'en', 'Drop files here, paste or', 'Drop files here, paste or', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1393, 'en', 'Upload complete', 'Upload complete', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1394, 'en', 'Upload paused', 'Upload paused', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1395, 'en', 'Resume upload', 'Resume upload', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1396, 'en', 'Pause upload', 'Pause upload', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1397, 'en', 'Retry upload', 'Retry upload', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1398, 'en', 'Cancel upload', 'Cancel upload', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1399, 'en', 'Uploading', 'Uploading', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1400, 'en', 'Processing', 'Processing', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1401, 'en', 'Complete', 'Complete', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1402, 'en', 'Files', 'Files', '2021-06-26 01:15:50', '2021-06-26 01:15:50'),
(1403, 'en', 'Please Configure SMTP Setting to work all email sending functionality', 'Please Configure SMTP Setting to work all email sending functionality', '2021-06-26 01:15:52', '2021-06-26 01:15:52'),
(1404, 'en', 'Order', 'Order', '2021-06-26 01:15:52', '2021-06-26 01:15:52'),
(1405, 'en', 'Search in menu', 'Search in menu', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1406, 'en', 'Uploaded Files', 'Uploaded Files', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1407, 'en', 'Commission History', 'Commission History', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1408, 'en', 'Wallet Recharge History', 'Wallet Recharge History', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1409, 'en', 'Blog System', 'Blog System', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1410, 'en', 'All Posts', 'All Posts', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1411, 'en', 'Vat & TAX', 'Vat & TAX', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1412, 'en', 'Facebook Comment', 'Facebook Comment', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1413, 'en', 'Shipping Cities', 'Shipping Cities', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1414, 'en', 'System', 'System', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1415, 'en', 'Server status', 'Server status', '2021-06-26 01:15:53', '2021-06-26 01:15:53'),
(1416, 'en', 'Blogs', 'Blogs', '2021-06-26 01:16:00', '2021-06-26 01:16:00'),
(1417, 'en', 'All Circulers', 'All Circulers', '2021-06-26 01:21:41', '2021-06-26 01:21:41'),
(1418, 'en', 'Add Job Circuler', 'Add Job Circuler', '2021-06-26 01:21:41', '2021-06-26 01:21:41'),
(1419, 'en', 'Jobs', 'Jobs', '2021-06-26 01:21:41', '2021-06-26 01:21:41'),
(1420, 'en', 'Author', 'Author', '2021-06-26 01:21:41', '2021-06-26 01:21:41'),
(1421, 'en', 'Create', 'Create', '2021-06-26 01:21:41', '2021-06-26 01:21:41'),
(1422, 'en', 'Circuler status Changed  successfully', 'Circuler status Changed  successfully', '2021-06-26 01:21:41', '2021-06-26 01:21:41'),
(1423, 'en', 'Job Information', 'Job Information', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1424, 'en', 'Job Title:', 'Job Title:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1425, 'en', 'Job Title', 'Job Title', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1426, 'en', 'Company Name:', 'Company Name:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1427, 'en', 'Enter Your Company Name', 'Enter Your Company Name', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1428, 'en', 'Category:', 'Category:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1429, 'en', 'Location:', 'Location:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1430, 'en', 'educational Status:', 'educational Status:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1431, 'en', 'Your educational status', 'Your educational status', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1432, 'en', 'Experience:', 'Experience:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1433, 'en', 'Your experience', 'Your experience', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1434, 'en', 'Gender:', 'Gender:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1435, 'en', 'Salary:', 'Salary:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1436, 'en', 'salary', 'salary', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1437, 'en', 'Slug:', 'Slug:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1438, 'en', 'Age:', 'Age:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1439, 'en', 'Ex: 22 to 30 years', 'Ex: 22 to 30 years', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1440, 'en', 'vacancy', 'vacancy', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1441, 'en', 'Employment Status:', 'Employment Status:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1442, 'en', 'Address:', 'Address:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1443, 'en', '1234 Main St', '1234 Main St', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1444, 'en', 'Address 2:', 'Address 2:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1445, 'en', 'Apartment, studio, or floor', 'Apartment, studio, or floor', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1446, 'en', 'Logo:', 'Logo:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1447, 'en', 'Short Description:', 'Short Description:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1448, 'en', 'Job Description:', 'Job Description:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1449, 'en', 'Meta Title:', 'Meta Title:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1450, 'en', 'Meta Image:', 'Meta Image:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1451, 'en', 'Meta Description:', 'Meta Description:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1452, 'en', 'Meta Keywords:', 'Meta Keywords:', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1453, 'en', 'Meta Keywords', 'Meta Keywords', '2021-06-26 01:21:53', '2021-06-26 01:21:53'),
(1454, 'en', 'View All Sellers', 'View All Sellers', '2021-06-26 01:22:04', '2021-06-26 01:22:04'),
(1455, 'en', 'job', 'job', '2021-06-26 01:22:10', '2021-06-26 01:22:10'),
(1456, 'en', 'Circulers', 'Circulers', '2021-06-26 01:22:10', '2021-06-26 01:22:10'),
(1457, 'en', 'View Circuler', 'View Circuler', '2021-06-26 01:22:10', '2021-06-26 01:22:10'),
(1458, 'en', 'Circuler Information', 'Circuler Information', '2021-06-26 01:22:17', '2021-06-26 01:22:17'),
(1459, 'en', 'Circuler status Changed successfully', 'Circuler status Changed successfully', '2021-06-26 01:23:13', '2021-06-26 01:23:13'),
(1460, 'en', 'Install/Update Addon', 'Install/Update Addon', '2021-06-26 01:23:42', '2021-06-26 01:23:42'),
(1461, 'en', 'No Addon Installed', 'No Addon Installed', '2021-06-26 01:23:42', '2021-06-26 01:23:42'),
(1462, 'en', 'Install/Update', 'Install/Update', '2021-06-26 01:23:44', '2021-06-26 01:23:44'),
(1463, 'en', 'Something went wrong!', 'Something went wrong!', '2021-06-26 07:24:04', '2021-06-26 07:24:04'),
(1464, 'en', 'Sorry for the inconvenience, but we\'re working on it.', 'Sorry for the inconvenience, but we\'re working on it.', '2021-06-26 07:24:04', '2021-06-26 07:24:04'),
(1465, 'en', 'Error code', 'Error code', '2021-06-26 07:24:04', '2021-06-26 07:24:04'),
(1466, 'en', 'This addon is updated successfully', 'This addon is updated successfully', '2021-06-26 01:24:10', '2021-06-26 01:24:10'),
(1467, 'en', 'Delivery Boy', 'Delivery Boy', '2021-06-26 01:24:10', '2021-06-26 01:24:10'),
(1468, 'en', 'All Delivery Boy', 'All Delivery Boy', '2021-06-26 01:24:10', '2021-06-26 01:24:10'),
(1469, 'en', 'Add Delivery Boy', 'Add Delivery Boy', '2021-06-26 01:24:10', '2021-06-26 01:24:10'),
(1470, 'en', 'Cancel Request', 'Cancel Request', '2021-06-26 01:24:10', '2021-06-26 01:24:10'),
(1471, 'en', 'Configuration', 'Configuration', '2021-06-26 01:24:10', '2021-06-26 01:24:10'),
(1472, 'en', 'All Delivery Boys', 'All Delivery Boys', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1473, 'en', 'Add New Delivery Boy', 'Add New Delivery Boy', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1474, 'en', 'Delivery Boys', 'Delivery Boys', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1475, 'en', 'Type email or name & Enter', 'Type email or name & Enter', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1476, 'en', 'Collection', 'Collection', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1477, 'en', 'Do you really want to ban this delivery_boy?', 'Do you really want to ban this delivery_boy?', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1478, 'en', 'Proceed!', 'Proceed!', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1479, 'en', 'Do you really want to unban this delivery_boy?', 'Do you really want to unban this delivery_boy?', '2021-06-26 01:24:13', '2021-06-26 01:24:13'),
(1480, 'en', 'Delivery Boy Information', 'Delivery Boy Information', '2021-06-26 01:24:15', '2021-06-26 01:24:15'),
(1481, 'en', 'Select City', 'Select City', '2021-06-26 01:24:15', '2021-06-26 01:24:15'),
(1482, 'en', 'Payment Configuration', 'Payment Configuration', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1483, 'en', 'Monthly Salary', 'Monthly Salary', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1484, 'en', 'Salary Amount', 'Salary Amount', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1485, 'en', 'Per Order Commission', 'Per Order Commission', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1486, 'en', 'Commission Rate', 'Commission Rate', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1487, 'en', 'Notification Configuration', 'Notification Configuration', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1488, 'en', 'Send Mail', 'Send Mail', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1489, 'en', 'Send OTP', 'Send OTP', '2021-06-26 01:24:23', '2021-06-26 01:24:23'),
(1490, 'en', 'All cities', 'All cities', '2021-06-26 01:26:28', '2021-06-26 01:26:28'),
(1491, 'en', 'Cities', 'Cities', '2021-06-26 01:26:28', '2021-06-26 01:26:28'),
(1492, 'en', 'Cost', 'Cost', '2021-06-26 01:26:28', '2021-06-26 01:26:28'),
(1493, 'en', 'Add New city', 'Add New city', '2021-06-26 01:26:28', '2021-06-26 01:26:28'),
(1494, 'en', 'City has been inserted successfully', 'City has been inserted successfully', '2021-06-26 01:26:41', '2021-06-26 01:26:41'),
(1495, 'en', 'Search your files', 'Search your files', '2021-06-26 01:31:16', '2021-06-26 01:31:16'),
(1496, 'en', 'Delivery Boy has been created successfully', 'Delivery Boy has been created successfully', '2021-06-26 01:31:45', '2021-06-26 01:31:45'),
(1497, 'en', 'Ban this delivery boy', 'Ban this delivery boy', '2021-06-26 01:31:45', '2021-06-26 01:31:45'),
(1498, 'en', 'Go to Payment', 'Go to Payment', '2021-06-26 01:31:45', '2021-06-26 01:31:45'),
(1499, 'en', 'Completed Delivery', 'Completed Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1500, 'en', 'Pending Delivery', 'Pending Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1501, 'en', 'Total Collected', 'Total Collected', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1502, 'en', 'Earnings', 'Earnings', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1503, 'en', 'Assigned Delivery', 'Assigned Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1504, 'en', 'Pickup Delivery', 'Pickup Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1505, 'en', 'On The Way Delivery', 'On The Way Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1506, 'en', 'Cancelled Delivery', 'Cancelled Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1507, 'en', 'Request Cancelled Delivery', 'Request Cancelled Delivery', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1508, 'en', 'Total Collections', 'Total Collections', '2021-06-26 01:32:24', '2021-06-26 01:32:24'),
(1509, 'en', 'Total Collection History', 'Total Collection History', '2021-06-26 01:32:49', '2021-06-26 01:32:49'),
(1510, 'en', 'Completed Delivery History', 'Completed Delivery History', '2021-06-26 01:33:11', '2021-06-26 01:33:11'),
(1511, 'en', 'Earning History', 'Earning History', '2021-06-26 01:33:58', '2021-06-26 01:33:58'),
(1512, 'en', 'At the very bottom, you can find the “Facebook Page ID”', 'At the very bottom, you can find the “Facebook Page ID”', '2021-06-26 01:35:20', '2021-06-26 01:35:20'),
(1513, 'en', 'Go to Settings of your page and find the option of \"Advance Messaging\"', 'Go to Settings of your page and find the option of \"Advance Messaging\"', '2021-06-26 01:35:20', '2021-06-26 01:35:20'),
(1514, 'en', 'Scroll down that page and you will get \"white listed domain\"', 'Scroll down that page and you will get \"white listed domain\"', '2021-06-26 01:35:20', '2021-06-26 01:35:20'),
(1515, 'en', 'SMS Templates', 'SMS Templates', '2021-06-26 01:36:42', '2021-06-26 01:36:42'),
(1516, 'en', 'MIMO OTP', 'MIMO OTP', '2021-06-26 01:40:29', '2021-06-26 01:40:29'),
(1517, 'en', 'MIMO Credential', 'MIMO Credential', '2021-06-26 01:40:49', '2021-06-26 01:40:49'),
(1518, 'en', 'MIMO_USERNAME', 'MIMO_USERNAME', '2021-06-26 01:40:49', '2021-06-26 01:40:49'),
(1519, 'en', 'MIMO_PASSWORD', 'MIMO_PASSWORD', '2021-06-26 01:40:49', '2021-06-26 01:40:49'),
(1520, 'en', 'MIMO_SENDER_ID', 'MIMO_SENDER_ID', '2021-06-26 01:40:49', '2021-06-26 01:40:49'),
(1522, 'en', 'Affiliate Logs', 'Affiliate Logs', '2021-06-26 01:41:36', '2021-06-26 01:41:36'),
(1523, 'en', 'Addon nstalled successfully', 'Addon nstalled successfully', '2021-06-26 01:42:06', '2021-06-26 01:42:06'),
(1524, 'en', 'Refferal Users', 'Refferal Users', '2021-06-26 01:42:41', '2021-06-26 01:42:41'),
(1525, 'en', 'Reffered By', 'Reffered By', '2021-06-26 01:42:41', '2021-06-26 01:42:41'),
(1526, 'en', 'All Flash Deals', 'All Flash Deals', '2021-06-26 01:44:39', '2021-06-26 01:44:39'),
(1527, 'en', 'Create New Flash Deal', 'Create New Flash Deal', '2021-06-26 01:44:39', '2021-06-26 01:44:39'),
(1528, 'en', 'Cookies Agreement', 'Cookies Agreement', '2021-06-26 01:45:14', '2021-06-26 01:45:14'),
(1529, 'en', 'Cookies Agreement Text', 'Cookies Agreement Text', '2021-06-26 01:45:14', '2021-06-26 01:45:14'),
(1530, 'en', 'Show Cookies Agreement?', 'Show Cookies Agreement?', '2021-06-26 01:45:14', '2021-06-26 01:45:14'),
(1531, 'en', 'Website Popup', 'Website Popup', '2021-06-26 01:45:14', '2021-06-26 01:45:14'),
(1532, 'en', 'Show website popup?', 'Show website popup?', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1533, 'en', 'Popup content', 'Popup content', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1534, 'en', 'Show Subscriber form?', 'Show Subscriber form?', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1535, 'en', 'Custom Script', 'Custom Script', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1536, 'en', 'Header custom script - before </head>', 'Header custom script - before </head>', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1537, 'en', 'Write script with <script> tag', 'Write script with <script> tag', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1538, 'en', 'Footer custom script - before </body>', 'Footer custom script - before </body>', '2021-06-26 01:45:15', '2021-06-26 01:45:15'),
(1539, 'en', 'Career', 'Career', '2021-06-26 11:20:06', '2021-06-26 11:20:06'),
(1540, 'en', 'Add Circuler', 'Add Circuler', '2021-06-26 11:20:06', '2021-06-26 11:20:06'),
(1541, 'en', 'Add Category', 'Add Category', '2021-06-26 11:20:06', '2021-06-26 11:20:06'),
(1542, 'en', 'Locations', 'Locations', '2021-06-26 11:20:06', '2021-06-26 11:20:06'),
(1543, 'en', 'HTTPS Activation', 'HTTPS Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1544, 'en', 'Maintenance Mode Activation', 'Maintenance Mode Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1545, 'en', 'Disable image optimization?', 'Disable image optimization?', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1546, 'en', 'Business Related', 'Business Related', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1547, 'en', 'Vendor System Activation', 'Vendor System Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1548, 'en', 'Classified Product', 'Classified Product', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1549, 'en', 'Wallet System Activation', 'Wallet System Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1550, 'en', 'Coupon System Activation', 'Coupon System Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1551, 'en', 'Pickup Point Activation', 'Pickup Point Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1552, 'en', 'Conversation Activation', 'Conversation Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1553, 'en', 'Seller Product Manage By Admin', 'Seller Product Manage By Admin', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1554, 'en', 'After activate this option Cash On Delivery of Seller product will be managed by Admin', 'After activate this option Cash On Delivery of Seller product will be managed by Admin', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1555, 'en', 'Category-based Commission', 'Category-based Commission', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1556, 'en', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1557, 'en', 'Set Commisssion Now', 'Set Commisssion Now', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1558, 'en', 'Email Verification', 'Email Verification', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1559, 'en', 'Payment Related', 'Payment Related', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1560, 'en', 'Paypal Payment Activation', 'Paypal Payment Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1561, 'en', 'You need to configure Paypal correctly to enable this feature', 'You need to configure Paypal correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1562, 'en', 'Stripe Payment Activation', 'Stripe Payment Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1563, 'en', 'SSlCommerz Activation', 'SSlCommerz Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1564, 'en', 'Instamojo Payment Activation', 'Instamojo Payment Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1565, 'en', 'You need to configure Instamojo Payment correctly to enable this feature', 'You need to configure Instamojo Payment correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1566, 'en', 'Razor Pay Activation', 'Razor Pay Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1567, 'en', 'You need to configure Razor correctly to enable this feature', 'You need to configure Razor correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1568, 'en', 'PayStack Activation', 'PayStack Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1569, 'en', 'You need to configure PayStack correctly to enable this feature', 'You need to configure PayStack correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1570, 'en', 'VoguePay Activation', 'VoguePay Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1571, 'en', 'You need to configure VoguePay correctly to enable this feature', 'You need to configure VoguePay correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1572, 'en', 'Payhere Activation', 'Payhere Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1573, 'en', 'Ngenius Activation', 'Ngenius Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1574, 'en', 'You need to configure Ngenius correctly to enable this feature', 'You need to configure Ngenius correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1575, 'en', 'Iyzico Activation', 'Iyzico Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1576, 'en', 'You need to configure iyzico correctly to enable this feature', 'You need to configure iyzico correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1577, 'en', 'Bkash Activation', 'Bkash Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1578, 'en', 'You need to configure bkash correctly to enable this feature', 'You need to configure bkash correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1579, 'en', 'Nagad Activation', 'Nagad Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1580, 'en', 'You need to configure nagad correctly to enable this feature', 'You need to configure nagad correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1581, 'en', 'Proxy Pay Activation', 'Proxy Pay Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1582, 'en', 'Cash Payment Activation', 'Cash Payment Activation', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1583, 'en', 'Social Media Login', 'Social Media Login', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1584, 'en', 'Facebook login', 'Facebook login', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1585, 'en', 'You need to configure Facebook Client correctly to enable this feature', 'You need to configure Facebook Client correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1586, 'en', 'Google login', 'Google login', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1587, 'en', 'You need to configure Google Client correctly to enable this feature', 'You need to configure Google Client correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1588, 'en', 'Twitter login', 'Twitter login', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1589, 'en', 'You need to configure Twitter Client correctly to enable this feature', 'You need to configure Twitter Client correctly to enable this feature', '2021-06-26 11:20:29', '2021-06-26 11:20:29'),
(1590, 'en', 'Facebook Pixel Setting', 'Facebook Pixel Setting', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1591, 'en', 'Facebook Pixel', 'Facebook Pixel', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1592, 'en', 'Facebook Pixel ID', 'Facebook Pixel ID', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1593, 'en', 'Please be carefull when you are configuring Facebook pixel.', 'Please be carefull when you are configuring Facebook pixel.', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1594, 'en', 'Log in to Facebook and go to your Ads Manager account', 'Log in to Facebook and go to your Ads Manager account', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1595, 'en', 'Open the Navigation Bar and select Events Manager', 'Open the Navigation Bar and select Events Manager', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1596, 'en', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1597, 'en', 'Google Analytics Setting', 'Google Analytics Setting', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1598, 'en', 'Google Analytics', 'Google Analytics', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1599, 'en', 'Tracking ID', 'Tracking ID', '2021-06-26 11:22:06', '2021-06-26 11:22:06'),
(1600, 'en', 'Subscribe Now', 'Subscribe Now', '2021-06-26 11:27:02', '2021-06-26 11:27:02'),
(1601, 'en', 'Topbar Banner', 'Topbar Banner', '2021-06-26 11:27:30', '2021-06-26 11:27:30'),
(1602, 'en', 'Topbar Banner Link', 'Topbar Banner Link', '2021-06-26 11:27:30', '2021-06-26 11:27:30'),
(1603, 'en', 'Link with', 'Link with', '2021-06-26 11:27:30', '2021-06-26 11:27:30'),
(1604, 'en', 'Header Nav Menu', 'Header Nav Menu', '2021-06-26 11:27:30', '2021-06-26 11:27:30'),
(1605, 'en', 'Play Store Link', 'Play Store Link', '2021-06-26 13:25:48', '2021-06-26 13:25:48'),
(1606, 'en', 'App Store Link', 'App Store Link', '2021-06-26 13:25:48', '2021-06-26 13:25:48'),
(1607, 'en', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', '2021-06-26 13:26:56', '2021-06-26 13:26:56'),
(1608, 'en', 'Home Banner 3 (Max 3)', 'Home Banner 3 (Max 3)', '2021-06-26 13:26:56', '2021-06-26 13:26:56'),
(1609, 'en', 'Forgot password ?', 'Forgot password ?', '2021-06-26 16:08:51', '2021-06-26 16:08:51'),
(1610, 'en', 'Job Appcication', 'Job Appcication', '2021-06-26 19:51:09', '2021-06-26 19:51:09'),
(1611, 'en', 'Send your CV to <strong> mamunsms69@gmail.com </strong>', 'Send your CV to <strong> mamunsms69@gmail.com </strong>', '2021-06-26 22:23:47', '2021-06-26 22:23:47'),
(1612, 'en', 'Log In to see Application Email.', 'Log In to see Application Email.', '2021-06-26 22:27:24', '2021-06-26 22:27:24'),
(1613, 'en', 'Use Phone Instead', 'Use Phone Instead', '2021-06-26 22:37:12', '2021-06-26 22:37:12'),
(1614, 'en', 'Blog Information', 'Blog Information', '2021-06-27 18:58:37', '2021-06-27 18:58:37'),
(1615, 'en', 'Blog Title', 'Blog Title', '2021-06-27 18:58:37', '2021-06-27 18:58:37'),
(1616, 'en', 'Select Brand', 'Select Brand', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1617, 'en', 'Minimum Purchase Qty', 'Minimum Purchase Qty', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1618, 'en', 'This is used for search. Input those words by which cutomer can find this product.', 'This is used for search. Input those words by which cutomer can find this product.', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1619, 'en', 'These images are visible in product details page gallery. Use 600x600 sizes images.', 'These images are visible in product details page gallery. Use 600x600 sizes images.', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1620, 'en', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1621, 'en', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1622, 'en', 'Discount Date Range', 'Discount Date Range', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1623, 'en', 'Is Product Quantity Mulitiply', 'Is Product Quantity Mulitiply', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1624, 'en', 'Low Stock Quantity Warning', 'Low Stock Quantity Warning', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1625, 'en', 'Stock Visibility State', 'Stock Visibility State', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1626, 'en', 'Show Stock Quantity', 'Show Stock Quantity', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1627, 'en', 'Show Stock With Text Only', 'Show Stock With Text Only', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1628, 'en', 'Hide Stock', 'Hide Stock', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1629, 'en', 'Flash Deal', 'Flash Deal', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1630, 'en', 'Add To Flash', 'Add To Flash', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1631, 'en', 'Estimate Shipping Time', 'Estimate Shipping Time', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1632, 'en', 'Shipping Days', 'Shipping Days', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1633, 'en', 'Save As Draft', 'Save As Draft', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1634, 'en', 'Save & Unpublish', 'Save & Unpublish', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1635, 'en', 'Save & Publish', 'Save & Publish', '2021-06-27 19:21:56', '2021-06-27 19:21:56'),
(1636, 'en', 'Product has been inserted successfully', 'Product has been inserted successfully', '2021-06-27 19:23:25', '2021-06-27 19:23:25'),
(1637, 'en', 'Bulk Action', 'Bulk Action', '2021-06-27 19:23:26', '2021-06-27 19:23:26'),
(1638, 'en', 'Delete selection', 'Delete selection', '2021-06-27 19:23:26', '2021-06-27 19:23:26'),
(1639, 'en', 'Info', 'Info', '2021-06-27 19:23:26', '2021-06-27 19:23:26'),
(1640, 'en', 'Link copied to clipboard', 'Link copied to clipboard', '2021-06-27 19:23:35', '2021-06-27 19:23:35'),
(1641, 'en', 'Oops, unable to copy', 'Oops, unable to copy', '2021-06-27 19:23:35', '2021-06-27 19:23:35'),
(1642, 'en', 'Translatable', 'Translatable', '2021-06-27 19:24:37', '2021-06-27 19:24:37'),
(1643, 'en', 'Iyzico', 'Iyzico', '2021-06-27 19:28:14', '2021-06-27 19:28:14'),
(1644, 'en', 'Bkash', 'Bkash', '2021-06-27 19:28:14', '2021-06-27 19:28:14'),
(1645, 'en', 'ProxyPay', 'ProxyPay', '2021-06-27 19:28:14', '2021-06-27 19:28:14'),
(1646, 'en', 'Your order has been placed', 'Your order has been placed', '2021-06-27 19:28:45', '2021-06-27 19:28:45'),
(1647, 'en', 'Your order has been placed successfully', 'Your order has been placed successfully', '2021-06-27 19:30:05', '2021-06-27 19:30:05'),
(1648, 'en', 'Order has been deleted successfully', 'Order has been deleted successfully', '2021-06-27 19:30:38', '2021-06-27 19:30:38'),
(1649, 'en', 'Job Application Form', 'Job Application Form', '2021-06-27 19:44:29', '2021-06-27 19:44:29'),
(1650, 'en', 'Name:', 'Name:', '2021-06-27 19:44:51', '2021-06-27 19:44:51'),
(1651, 'en', 'Father\'s Name:', 'Father\'s Name:', '2021-06-27 19:47:08', '2021-06-27 19:47:08'),
(1652, 'en', 'Fathers Name', 'Fathers Name', '2021-06-27 19:47:08', '2021-06-27 19:47:08'),
(1653, 'en', 'Father\'s Name', 'Father\'s Name', '2021-06-27 19:48:15', '2021-06-27 19:48:15'),
(1654, 'en', 'Mother\'s Name:', 'Mother\'s Name:', '2021-06-27 19:48:15', '2021-06-27 19:48:15'),
(1655, 'en', 'Mother\'s Name', 'Mother\'s Name', '2021-06-27 19:48:15', '2021-06-27 19:48:15'),
(1656, 'en', 'Enter Your Name', 'Enter Your Name', '2021-06-27 19:48:53', '2021-06-27 19:48:53'),
(1657, 'en', 'Enter Your Father\'s Name', 'Enter Your Father\'s Name', '2021-06-27 19:48:53', '2021-06-27 19:48:53'),
(1658, 'en', 'Enter Your Mother\'s Name', 'Enter Your Mother\'s Name', '2021-06-27 19:48:53', '2021-06-27 19:48:53'),
(1659, 'en', 'Division', 'Division', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1660, 'en', '', '', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1661, 'en', 'District:', 'District:', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1662, 'en', 'Thana/Upazilla:', 'Thana/Upazilla:', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1663, 'en', 'Area/ Village:', 'Area/ Village:', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1664, 'en', 'Road No:', 'Road No:', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1665, 'en', 'House No:', 'House No:', '2021-06-27 20:03:05', '2021-06-27 20:03:05'),
(1666, 'en', 'Nationality:', 'Nationality:', '2021-06-27 20:25:05', '2021-06-27 20:25:05'),
(1667, 'en', 'Your Nationality', 'Your Nationality', '2021-06-27 20:25:05', '2021-06-27 20:25:05'),
(1668, 'en', 'Marital Status:', 'Marital Status:', '2021-06-27 20:26:19', '2021-06-27 20:26:19'),
(1669, 'en', 'NID:', 'NID:', '2021-06-27 20:28:17', '2021-06-27 20:28:17'),
(1670, 'en', 'Enter Your NID Number', 'Enter Your NID Number', '2021-06-27 20:28:17', '2021-06-27 20:28:17'),
(1671, 'en', 'Email:', 'Email:', '2021-06-27 20:28:17', '2021-06-27 20:28:17'),
(1672, 'en', 'Enter Your Email Address', 'Enter Your Email Address', '2021-06-27 20:28:17', '2021-06-27 20:28:17'),
(1673, 'en', 'Mobile:', 'Mobile:', '2021-06-27 20:28:17', '2021-06-27 20:28:17'),
(1674, 'en', 'Enter Your Mobile Number', 'Enter Your Mobile Number', '2021-06-27 20:28:17', '2021-06-27 20:28:17'),
(1675, 'en', 'Enter Your Full Name', 'Enter Your Full Name', '2021-06-27 20:38:53', '2021-06-27 20:38:53'),
(1676, 'en', 'Educational Status', 'Educational Status', '2021-06-27 21:29:24', '2021-06-27 21:29:24'),
(1677, 'en', 'Add educational Qualification', 'Add educational Qualification', '2021-06-27 21:32:59', '2021-06-27 21:32:59'),
(1678, 'en', 'Institute:', 'Institute:', '2021-06-27 21:42:52', '2021-06-27 21:42:52'),
(1679, 'en', 'Your Institute', 'Your Institute', '2021-06-27 21:42:52', '2021-06-27 21:42:52'),
(1680, 'en', 'Board:', 'Board:', '2021-06-27 21:42:52', '2021-06-27 21:42:52'),
(1681, 'en', 'Select your Board', 'Select your Board', '2021-06-27 21:42:52', '2021-06-27 21:42:52'),
(1682, 'en', 'Passing Year:', 'Passing Year:', '2021-06-27 21:47:37', '2021-06-27 21:47:37'),
(1683, 'en', 'Type Your Passing Year', 'Type Your Passing Year', '2021-06-27 21:47:37', '2021-06-27 21:47:37'),
(1684, 'en', 'Result:', 'Result:', '2021-06-27 21:47:37', '2021-06-27 21:47:37'),
(1685, 'en', 'Enter Your Result', 'Enter Your Result', '2021-06-27 21:47:37', '2021-06-27 21:47:37'),
(1686, 'en', 'Degree:', 'Degree:', '2021-06-27 21:48:26', '2021-06-27 21:48:26'),
(1687, 'en', 'Select your Degree', 'Select your Degree', '2021-06-27 21:48:26', '2021-06-27 21:48:26'),
(1688, 'en', 'Type Your Subject', 'Type Your Subject', '2021-06-27 21:49:56', '2021-06-27 21:49:56'),
(1689, 'en', 'Subject:', 'Subject:', '2021-06-27 21:53:46', '2021-06-27 21:53:46'),
(1690, 'en', 'I am requesting to apply for the post of Marketing Executive (Post) of emed.com.bd (Company); I have\n                read all the terms and Condition for the post. I believe that I would be sincere for all the job\n                responsibilities. All the above given information are correct if any information are not correct then\n                company have all rights to take any Decision about me.\n                ', 'I am requesting to apply for the post of Marketing Executive (Post) of emed.com.bd (Company); I have\n                read all the terms and Condition for the post. I believe that I would be sincere for all the job\n                responsibilities. All the above given information are correct if any information are not correct then\n                company have all rights to take any Decision about me.\n                ', '2021-06-27 21:55:40', '2021-06-27 21:55:40'),
(1691, 'en', 'I am requesting to apply for the post of Marketing Executive (Post) of emed.com.bd (Company); I have\n            read all the terms and Condition for the post. I believe that I would be sincere for all the job\n            responsibilities. All the above given information are correct if any information are not correct then\n            company have all rights to take any Decision about me.\n            ', 'I am requesting to apply for the post of Marketing Executive (Post) of emed.com.bd (Company); I have\n            read all the terms and Condition for the post. I believe that I would be sincere for all the job\n            responsibilities. All the above given information are correct if any information are not correct then\n            company have all rights to take any Decision about me.\n            ', '2021-06-27 21:56:20', '2021-06-27 21:56:20'),
(1692, 'en', 'I am requesting to apply for the post of Marketing Executive (Post) of emed.com.bd (Company); I have\n        read all the terms and Condition for the post. I believe that I would be sincere for all the job\n        responsibilities. All the above given information are correct if any information are not correct then\n        company have all rights to take any Decision about me.\n        ', 'I am requesting to apply for the post of Marketing Executive (Post) of emed.com.bd (Company); I have\n        read all the terms and Condition for the post. I believe that I would be sincere for all the job\n        responsibilities. All the above given information are correct if any information are not correct then\n        company have all rights to take any Decision about me.\n        ', '2021-06-27 21:56:29', '2021-06-27 21:56:29'),
(1693, 'en', 'Degree', 'Degree', '2021-06-28 08:24:52', '2021-06-28 08:24:52'),
(1694, 'en', 'Institute', 'Institute', '2021-06-28 08:24:52', '2021-06-28 08:24:52'),
(1695, 'en', 'Board', 'Board', '2021-06-28 08:24:52', '2021-06-28 08:24:52'),
(1696, 'en', 'Passing_Year', 'Passing_Year', '2021-06-28 08:24:53', '2021-06-28 08:24:53'),
(1697, 'en', 'Result', 'Result', '2021-06-28 08:24:53', '2021-06-28 08:24:53'),
(1698, 'en', 'Default address can not be deleted', 'Default address can not be deleted', '2021-06-28 08:25:20', '2021-06-28 08:25:20'),
(1699, 'en', 'Application has been Send Successfully', 'Application has been Send Successfully', '2021-06-28 08:41:24', '2021-06-28 08:41:24'),
(1700, 'en', 'Default', 'Default', '2021-06-28 08:45:25', '2021-06-28 08:45:25'),
(1701, 'en', 'Address info updated successfully', 'Address info updated successfully', '2021-06-28 08:52:20', '2021-06-28 08:52:20'),
(1702, 'en', 'Educational Status has been Inserted Successfully', 'Educational Status has been Inserted Successfully', '2021-06-28 12:25:24', '2021-06-28 12:25:24'),
(1703, 'en', 'Applications', 'Applications', '2021-06-28 13:26:07', '2021-06-28 13:26:07'),
(1704, 'en', 'All Jobs Categories', 'All Jobs Categories', '2021-06-28 13:31:58', '2021-06-28 13:31:58'),
(1705, 'en', 'Job Categories', 'Job Categories', '2021-06-28 13:31:58', '2021-06-28 13:31:58'),
(1706, 'en', 'Add New Seller', 'Add New Seller', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1707, 'en', 'Filter by Approval', 'Filter by Approval', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1708, 'en', 'Non-Approved', 'Non-Approved', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1709, 'en', 'Type name or email & Enter', 'Type name or email & Enter', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1710, 'en', 'Due to seller', 'Due to seller', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1711, 'en', 'Log in as this Seller', 'Log in as this Seller', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1712, 'en', 'Ban this seller', 'Ban this seller', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1713, 'en', 'Do you really want to ban this seller?', 'Do you really want to ban this seller?', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1714, 'en', 'Approved sellers updated successfully', 'Approved sellers updated successfully', '2021-06-28 13:32:27', '2021-06-28 13:32:27'),
(1715, 'en', 'Shop Info', 'Shop Info', '2021-06-28 13:32:31', '2021-06-28 13:32:31'),
(1716, 'en', 'All Applications', 'All Applications', '2021-06-28 13:45:34', '2021-06-28 13:45:34'),
(1717, 'en', 'Date Of Birth', 'Date Of Birth', '2021-06-28 18:03:25', '2021-06-28 18:03:25'),
(1718, 'en', 'mm/dd/yy', 'mm/dd/yy', '2021-06-28 18:03:25', '2021-06-28 18:03:25'),
(1719, 'en', 'Date:', 'Date:', '2021-06-28 18:51:39', '2021-06-28 18:51:39'),
(1720, 'en', 'Date of Birth:', 'Date of Birth:', '2021-06-28 18:55:00', '2021-06-28 18:55:00'),
(1721, 'en', 'Applicant ID', 'Applicant ID', '2021-06-28 19:11:25', '2021-06-28 19:11:25'),
(1722, 'en', 'Candidates', 'Candidates', '2021-06-28 19:14:49', '2021-06-28 19:14:49'),
(1723, 'en', 'Application Placed', 'Application Placed', '2021-06-28 19:14:49', '2021-06-28 19:14:49'),
(1724, 'en', 'Published job updated successfully', 'Published job updated successfully', '2021-06-28 19:34:49', '2021-06-28 19:34:49'),
(1725, 'en', 'Featured job updated successfully', 'Featured job updated successfully', '2021-06-28 19:35:08', '2021-06-28 19:35:08'),
(1726, 'en', 'Job Application Step 2', 'Job Application Step 2', '2021-06-29 10:11:02', '2021-06-29 10:11:02'),
(1727, 'en', 'Finish', 'Finish', '2021-06-29 10:33:02', '2021-06-29 10:33:02'),
(1728, 'en', 'Your Application has been send successfully, We will check your application', 'Your Application has been send successfully, We will check your application', '2021-06-29 10:56:19', '2021-06-29 10:56:19'),
(1729, 'en', 'Job Application Form Step 1', 'Job Application Form Step 1', '2021-06-29 10:57:41', '2021-06-29 10:57:41'),
(1730, 'en', 'Data Successfully Deleted', 'Data Successfully Deleted', '2021-06-29 11:08:41', '2021-06-29 11:08:41'),
(1731, 'en', 'Default Educational status set successfully', 'Default Educational status set successfully', '2021-06-29 11:09:53', '2021-06-29 11:09:53'),
(1732, 'en', 'District', 'District', '2021-06-29 13:36:20', '2021-06-29 13:36:20'),
(1733, 'en', 'Division:', 'Division:', '2021-06-29 13:47:55', '2021-06-29 13:47:55'),
(1734, 'en', 'Send CV', 'Send CV', '2021-06-29 19:51:17', '2021-06-29 19:51:17'),
(1735, 'en', 'Job Application Form Step 2', 'Job Application Form Step 2', '2021-06-29 20:30:38', '2021-06-29 20:30:38'),
(1736, 'en', 'same as', 'same as', '2021-06-29 21:49:37', '2021-06-29 21:49:37'),
(1737, 'en', 'same as permanent', 'same as permanent', '2021-06-29 21:51:03', '2021-06-29 21:51:03'),
(1738, 'en', 'All Cancel Request', 'All Cancel Request', '2021-06-29 22:51:34', '2021-06-29 22:51:34'),
(1739, 'en', 'Cancel Requests', 'Cancel Requests', '2021-06-29 22:51:34', '2021-06-29 22:51:34'),
(1740, 'en', 'Request By', 'Request By', '2021-06-29 22:51:34', '2021-06-29 22:51:34'),
(1741, 'en', 'Request At', 'Request At', '2021-06-29 22:51:34', '2021-06-29 22:51:34'),
(1742, 'en', 'Assigned Delivery History', 'Assigned Delivery History', '2021-06-29 22:52:20', '2021-06-29 22:52:20'),
(1743, 'en', 'Do you really want to send request to cancel?', 'Do you really want to send request to cancel?', '2021-06-29 22:52:20', '2021-06-29 22:52:20'),
(1744, 'en', 'Request Cancel', 'Request Cancel', '2021-06-29 22:52:20', '2021-06-29 22:52:20'),
(1745, 'en', 'Pickup Delivery History', 'Pickup Delivery History', '2021-06-29 22:52:22', '2021-06-29 22:52:22'),
(1746, 'en', 'On The Way Delivery History', 'On The Way Delivery History', '2021-06-29 22:52:24', '2021-06-29 22:52:24'),
(1747, 'en', 'Pending Delivery History', 'Pending Delivery History', '2021-06-29 22:52:27', '2021-06-29 22:52:27'),
(1748, 'en', 'Cancelled Delivery History', 'Cancelled Delivery History', '2021-06-29 22:52:29', '2021-06-29 22:52:29'),
(1749, 'en', 'Seller has been approved successfully', 'Seller has been approved successfully', '2021-06-30 10:11:01', '2021-06-30 10:11:01');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1750, 'en', 'Seller Payments', 'Seller Payments', '2021-06-30 10:11:46', '2021-06-30 10:11:46'),
(1751, 'en', 'Seller', 'Seller', '2021-06-30 10:11:46', '2021-06-30 10:11:46'),
(1752, 'en', 'Payment Details', 'Payment Details', '2021-06-30 10:11:46', '2021-06-30 10:11:46'),
(1753, 'en', 'Seller Withdraw Request', 'Seller Withdraw Request', '2021-06-30 10:11:49', '2021-06-30 10:11:49'),
(1754, 'en', 'Total Amount to Pay', 'Total Amount to Pay', '2021-06-30 10:11:49', '2021-06-30 10:11:49'),
(1755, 'en', 'Requested Amount', 'Requested Amount', '2021-06-30 10:11:49', '2021-06-30 10:11:49'),
(1756, 'en', 'Change Order Status', 'Change Order Status', '2021-06-30 10:13:15', '2021-06-30 10:13:15'),
(1757, 'en', 'Choose an order status', 'Choose an order status', '2021-06-30 10:13:15', '2021-06-30 10:13:15'),
(1758, 'en', 'Picked Up', 'Picked Up', '2021-06-30 10:13:15', '2021-06-30 10:13:15'),
(1759, 'en', 'On The Way', 'On The Way', '2021-06-30 10:13:15', '2021-06-30 10:13:15'),
(1760, 'en', 'Filter by date', 'Filter by date', '2021-06-30 10:13:15', '2021-06-30 10:13:15'),
(1761, 'en', 'Assign Deliver Boy', 'Assign Deliver Boy', '2021-06-30 10:13:19', '2021-06-30 10:13:19'),
(1762, 'en', 'Select Delivery Boy', 'Select Delivery Boy', '2021-06-30 10:13:19', '2021-06-30 10:13:19'),
(1763, 'en', 'Delivery boy has been assigned', 'Delivery boy has been assigned', '2021-06-30 10:13:19', '2021-06-30 10:13:19'),
(1764, 'en', 'Company Name', 'Company Name', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1765, 'en', 'Experience', 'Experience', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1766, 'en', 'Gender', 'Gender', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1767, 'en', 'Ex: Negotiable or Enter The Amount', 'Ex: Negotiable or Enter The Amount', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1768, 'en', 'Age', 'Age', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1769, 'en', 'Employment Status', 'Employment Status', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1770, 'en', 'Address 2', 'Address 2', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1771, 'en', 'Short Description', 'Short Description', '2021-06-30 10:47:18', '2021-06-30 10:47:18'),
(1772, 'en', 'Circuler has been updated successfully', 'Circuler has been updated successfully', '2021-06-30 10:47:33', '2021-06-30 10:47:33'),
(1773, 'en', 'Product Information frhfdsg', 'Product Information frhfdsg', '2021-06-30 13:18:26', '2021-06-30 13:18:26'),
(1774, 'en', 'Mejor Group', 'Mejor Group', '2021-06-30 13:21:27', '2021-06-30 13:21:27'),
(1775, 'en', 'Minor Group', 'Minor Group', '2021-06-30 13:43:17', '2021-06-30 13:43:17'),
(1776, 'en', 'Parent Category', 'Parent Category', '2021-06-30 13:52:55', '2021-06-30 13:52:55'),
(1777, 'en', 'Order Level', 'Order Level', '2021-06-30 13:52:55', '2021-06-30 13:52:55'),
(1778, 'en', 'Level', 'Level', '2021-06-30 13:52:55', '2021-06-30 13:52:55'),
(1779, 'en', 'Minor_Group', 'Minor_Group', '2021-06-30 13:59:20', '2021-06-30 13:59:20'),
(1780, 'en', 'Category Information', 'Category Information', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1781, 'en', 'No Parent', 'No Parent', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1782, 'en', 'Ordering Number', 'Ordering Number', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1783, 'en', 'Higher number has high priority', 'Higher number has high priority', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1784, 'en', 'Physical', 'Physical', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1785, 'en', 'Digital', 'Digital', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1786, 'en', '200x200', '200x200', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1787, 'en', '32x32', '32x32', '2021-06-30 14:34:27', '2021-06-30 14:34:27'),
(1788, 'en', 'Minor Group Information', 'Minor Group Information', '2021-06-30 14:51:41', '2021-06-30 14:51:41'),
(1789, 'en', 'minor group has been inserted successfully', 'minor group has been inserted successfully', '2021-06-30 16:02:05', '2021-06-30 16:02:05'),
(1790, 'en', 'Category has been inserted successfully', 'Category has been inserted successfully', '2021-06-30 16:21:52', '2021-06-30 16:21:52'),
(1791, 'en', 'All Minor Group', 'All Minor Group', '2021-06-30 16:29:52', '2021-06-30 16:29:52'),
(1792, 'en', 'Add New Minor Group', 'Add New Minor Group', '2021-06-30 16:29:52', '2021-06-30 16:29:52'),
(1793, 'en', 'Add New Brand', 'Add New Brand', '2021-06-30 17:05:00', '2021-06-30 17:05:00'),
(1794, 'en', '120x80', '120x80', '2021-06-30 17:05:00', '2021-06-30 17:05:00'),
(1795, 'en', 'Company', 'Company', '2021-06-30 17:13:00', '2021-06-30 17:13:00'),
(1796, 'en', 'Select Company', 'Select Company', '2021-06-30 17:13:00', '2021-06-30 17:13:00'),
(1797, 'en', 'Pack Size', 'Pack Size', '2021-06-30 17:21:02', '2021-06-30 17:21:02'),
(1798, 'en', 'pack_size (e.g. KG, Pc etc)', 'pack_size (e.g. KG, Pc etc)', '2021-06-30 17:21:02', '2021-06-30 17:21:02'),
(1799, 'en', 'Selling Unit', 'Selling Unit', '2021-06-30 17:34:07', '2021-06-30 17:34:07'),
(1800, 'en', 'Selling_Unit (e.g. pieces per pata)', 'Selling_Unit (e.g. pieces per pata)', '2021-06-30 17:34:07', '2021-06-30 17:34:07'),
(1801, 'en', 'Selling Unit (e.g. pieces per pata)', 'Selling Unit (e.g. pieces per pata)', '2021-06-30 17:34:51', '2021-06-30 17:34:51'),
(1802, 'en', 'Generic', 'Generic', '2021-06-30 17:50:57', '2021-06-30 17:50:57'),
(1803, 'en', 'pack size (e.g. KG, Pc etc)', 'pack size (e.g. KG, Pc etc)', '2021-06-30 17:50:57', '2021-06-30 17:50:57'),
(1804, 'en', 'All Generic', 'All Generic', '2021-07-01 13:56:31', '2021-07-01 13:56:31'),
(1805, 'en', 'Add New Generic', 'Add New Generic', '2021-07-01 13:56:32', '2021-07-01 13:56:32'),
(1806, 'en', 'Generic Description:', 'Generic Description:', '2021-07-01 14:24:20', '2021-07-01 14:24:20'),
(1807, 'en', 'Generic Information', 'Generic Information', '2021-07-01 14:34:12', '2021-07-01 14:34:12'),
(1808, 'en', 'Generic has been inserted successfully', 'Generic has been inserted successfully', '2021-07-01 14:36:36', '2021-07-01 14:36:36'),
(1809, 'en', 'Item Strength', 'Item Strength', '2021-07-01 15:11:53', '2021-07-01 15:11:53'),
(1810, 'en', 'item_strength (e.g. KG, Pc etc)', 'item_strength (e.g. KG, Pc etc)', '2021-07-01 15:11:53', '2021-07-01 15:11:53'),
(1811, 'en', 'Product Wish Report', 'Product Wish Report', '2021-07-01 16:27:16', '2021-07-01 16:27:16'),
(1812, 'en', 'Number of Wish', 'Number of Wish', '2021-07-01 16:27:17', '2021-07-01 16:27:17'),
(1813, 'en', 'Commission History report', 'Commission History report', '2021-07-01 16:27:36', '2021-07-01 16:27:36'),
(1814, 'en', 'Choose Seller', 'Choose Seller', '2021-07-01 16:27:36', '2021-07-01 16:27:36'),
(1815, 'en', 'Daterange', 'Daterange', '2021-07-01 16:27:36', '2021-07-01 16:27:36'),
(1816, 'en', 'Admin Commission', 'Admin Commission', '2021-07-01 16:27:36', '2021-07-01 16:27:36'),
(1817, 'en', 'Seller Earning', 'Seller Earning', '2021-07-01 16:27:36', '2021-07-01 16:27:36'),
(1818, 'en', 'Created At', 'Created At', '2021-07-01 16:27:36', '2021-07-01 16:27:36'),
(1819, 'en', 'Wallet Transaction Report', 'Wallet Transaction Report', '2021-07-01 16:27:54', '2021-07-01 16:27:54'),
(1820, 'en', 'Wallet Transaction', 'Wallet Transaction', '2021-07-01 16:27:54', '2021-07-01 16:27:54'),
(1821, 'en', 'Choose User', 'Choose User', '2021-07-01 16:27:54', '2021-07-01 16:27:54'),
(1822, 'en', 'of seller product price will be deducted from seller earnings', 'of seller product price will be deducted from seller earnings', '2021-07-01 16:31:07', '2021-07-01 16:31:07'),
(1823, 'en', 'This commission only works when Category Based Commission is turned off from Business Settings', 'This commission only works when Category Based Commission is turned off from Business Settings', '2021-07-01 16:31:07', '2021-07-01 16:31:07'),
(1824, 'en', 'Accounts', 'Accounts', '2021-07-01 16:33:44', '2021-07-01 16:33:44'),
(1825, 'en', 'Seller Payouts', 'Seller Payouts', '2021-07-01 16:41:56', '2021-07-01 16:41:56'),
(1826, 'en', 'Seller Payout Requests', 'Seller Payout Requests', '2021-07-01 16:41:56', '2021-07-01 16:41:56'),
(1827, 'en', 'Update your system', 'Update your system', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1828, 'en', 'Current verion', 'Current verion', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1829, 'en', 'Make sure your server has matched with all requirements.', 'Make sure your server has matched with all requirements.', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1830, 'en', 'Check Here', 'Check Here', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1831, 'en', 'Download latest version from codecanyon.', 'Download latest version from codecanyon.', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1832, 'en', 'Extract downloaded zip. You will find updates.zip file in those extraced files.', 'Extract downloaded zip. You will find updates.zip file in those extraced files.', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1833, 'en', 'Upload that zip file here and click update now.', 'Upload that zip file here and click update now.', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1834, 'en', 'If you are using any addon make sure to update those addons after updating.', 'If you are using any addon make sure to update those addons after updating.', '2021-07-01 16:45:31', '2021-07-01 16:45:31'),
(1835, 'en', 'Support Desk', 'Support Desk', '2021-07-01 16:45:53', '2021-07-01 16:45:53'),
(1836, 'en', 'Type ticket code & Enter', 'Type ticket code & Enter', '2021-07-01 16:45:53', '2021-07-01 16:45:53'),
(1837, 'en', 'User', 'User', '2021-07-01 16:45:54', '2021-07-01 16:45:54'),
(1838, 'en', 'Last reply', 'Last reply', '2021-07-01 16:45:54', '2021-07-01 16:45:54'),
(1839, 'en', 'Affiliate Withdraw Request', 'Affiliate Withdraw Request', '2021-07-01 17:11:02', '2021-07-01 17:11:02'),
(1840, 'en', 'Affiliate Withdraw Request Reject', 'Affiliate Withdraw Request Reject', '2021-07-01 17:11:02', '2021-07-01 17:11:02'),
(1841, 'en', 'Are you sure, You want to reject this?', 'Are you sure, You want to reject this?', '2021-07-01 17:11:02', '2021-07-01 17:11:02'),
(1842, 'en', 'Google Login Credential', 'Google Login Credential', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1843, 'en', 'Client ID', 'Client ID', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1844, 'en', 'Google Client ID', 'Google Client ID', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1845, 'en', 'Client Secret', 'Client Secret', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1846, 'en', 'Google Client Secret', 'Google Client Secret', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1847, 'en', 'Facebook Login Credential', 'Facebook Login Credential', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1848, 'en', 'App ID', 'App ID', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1849, 'en', 'Facebook Client ID', 'Facebook Client ID', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1850, 'en', 'App Secret', 'App Secret', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1851, 'en', 'Facebook Client Secret', 'Facebook Client Secret', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1852, 'en', 'Twitter Login Credential', 'Twitter Login Credential', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1853, 'en', 'Twitter Client ID', 'Twitter Client ID', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1854, 'en', 'Twitter Client Secret', 'Twitter Client Secret', '2021-07-01 17:13:48', '2021-07-01 17:13:48'),
(1855, 'en', 'Sendmail', 'Sendmail', '2021-07-01 17:14:01', '2021-07-01 17:14:01'),
(1856, 'en', 'Mailgun', 'Mailgun', '2021-07-01 17:14:01', '2021-07-01 17:14:01'),
(1857, 'en', 'MAIL HOST', 'MAIL HOST', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1858, 'en', 'MAIL PORT', 'MAIL PORT', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1859, 'en', 'MAIL USERNAME', 'MAIL USERNAME', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1860, 'en', 'MAIL PASSWORD', 'MAIL PASSWORD', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1861, 'en', 'MAIL ENCRYPTION', 'MAIL ENCRYPTION', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1862, 'en', 'MAIL FROM ADDRESS', 'MAIL FROM ADDRESS', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1863, 'en', 'MAIL FROM NAME', 'MAIL FROM NAME', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1864, 'en', 'MAILGUN DOMAIN', 'MAILGUN DOMAIN', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1865, 'en', 'MAILGUN SECRET', 'MAILGUN SECRET', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1866, 'en', 'Save Configuration', 'Save Configuration', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1867, 'en', 'Test SMTP configuration', 'Test SMTP configuration', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1868, 'en', 'Send test email', 'Send test email', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1869, 'en', 'Instruction', 'Instruction', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1870, 'en', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1871, 'en', 'For Non-SSL', 'For Non-SSL', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1872, 'en', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1873, 'en', 'Set Mail Host according to your server Mail Client Manual Settings', 'Set Mail Host according to your server Mail Client Manual Settings', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1874, 'en', 'Set Mail port as 587', 'Set Mail port as 587', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1875, 'en', 'Set Mail Encryption as ssl if you face issue with tls', 'Set Mail Encryption as ssl if you face issue with tls', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1876, 'en', 'For SSL', 'For SSL', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1877, 'en', 'Set Mail port as 465', 'Set Mail port as 465', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1878, 'en', 'Set Mail Encryption as ssl', 'Set Mail Encryption as ssl', '2021-07-01 17:14:02', '2021-07-01 17:14:02'),
(1879, 'en', 'An email has been sent.', 'An email has been sent.', '2021-07-01 17:14:27', '2021-07-01 17:14:27'),
(1880, 'en', 'Special Section', 'Special Section', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1881, 'en', 'Select Pricing :', 'Select Pricing :', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1882, 'en', 'Company Rate', 'Company Rate', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1883, 'en', 'Trade Price', 'Trade Price', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1884, 'en', 'Company Discount', 'Company Discount', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1885, 'en', 'Other Discount', 'Other Discount', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1886, 'en', 'vat', 'vat', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1887, 'en', 'Pack Price', 'Pack Price', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1888, 'en', 'Selling Unit Buying Price', 'Selling Unit Buying Price', '2021-07-04 18:38:38', '2021-07-04 18:38:38'),
(1889, 'en', 'Purchase Requisition', 'Purchase Requisition', '2021-07-04 19:32:47', '2021-07-04 19:32:47'),
(1890, 'en', 'Add New Post', 'Add New Post', '2021-07-04 19:40:10', '2021-07-04 19:40:10'),
(1891, 'en', 'All blog posts', 'All blog posts', '2021-07-04 19:40:10', '2021-07-04 19:40:10'),
(1892, 'en', 'Change blog status successfully', 'Change blog status successfully', '2021-07-04 19:41:41', '2021-07-04 19:41:41'),
(1893, 'en', 'Blog post has been created successfully', 'Blog post has been created successfully', '2021-07-04 19:49:24', '2021-07-04 19:49:24'),
(1894, 'en', 'Add Requisition', 'Add Requisition', '2021-07-04 19:52:25', '2021-07-04 19:52:25'),
(1895, 'en', 'Item ID', 'Item ID', '2021-07-04 21:34:45', '2021-07-04 21:34:45'),
(1896, 'en', 'Item Name', 'Item Name', '2021-07-04 21:34:45', '2021-07-04 21:34:45'),
(1897, 'en', 'Pack', 'Pack', '2021-07-04 21:34:45', '2021-07-04 21:34:45'),
(1898, 'en', 'Avil Unit', 'Avil Unit', '2021-07-04 21:34:45', '2021-07-04 21:34:45'),
(1899, 'en', 'All Purchase Requisition', 'All Purchase Requisition', '2021-07-04 23:03:37', '2021-07-04 23:03:37'),
(1900, 'en', 'Add New Requisition', 'Add New Requisition', '2021-07-04 23:03:37', '2021-07-04 23:03:37'),
(1901, 'en', 'Supplyer Name', 'Supplyer Name', '2021-07-04 23:27:44', '2021-07-04 23:27:44'),
(1902, 'en', 'Item Id:', 'Item Id:', '2021-07-04 23:27:52', '2021-07-04 23:27:52'),
(1903, 'en', 'Enter Product Item ID', 'Enter Product Item ID', '2021-07-04 23:27:52', '2021-07-04 23:27:52'),
(1904, 'en', 'Supplyer Name:', 'Supplyer Name:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1905, 'en', 'Pack Size:', 'Pack Size:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1906, 'en', 'Avil Unit:', 'Avil Unit:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1907, 'en', 'Your Avil Unit', 'Your Avil Unit', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1908, 'en', ':', ':', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1909, 'en', 'Vat:', 'Vat:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1910, 'en', 'Trade Price:', 'Trade Price:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1911, 'en', 'tp', 'tp', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1912, 'en', 'Company Discount:', 'Company Discount:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1913, 'en', 'Ex: ', 'Ex: ', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1914, 'en', 'op', 'op', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1915, 'en', 'Net Buying Price:', 'Net Buying Price:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1916, 'en', 'nbp 2:', 'nbp 2:', '2021-07-04 23:42:15', '2021-07-04 23:42:15'),
(1917, 'en', 'Generic has been updated successfully', 'Generic has been updated successfully', '2021-07-05 19:17:33', '2021-07-05 19:17:33'),
(1918, 'en', 'Generic has been deleted successfully', 'Generic has been deleted successfully', '2021-07-05 19:30:38', '2021-07-05 19:30:38'),
(1919, 'en', 'Selling Unit Price', 'Selling Unit Price', '2021-07-05 20:56:13', '2021-07-05 20:56:13'),
(1920, 'en', 'System Default Currency', 'System Default Currency', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1921, 'en', 'Set Currency Formats', 'Set Currency Formats', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1922, 'en', 'Symbol Format', 'Symbol Format', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1923, 'en', 'Decimal Separator', 'Decimal Separator', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1924, 'en', 'No of decimals', 'No of decimals', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1925, 'en', 'All Currencies', 'All Currencies', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1926, 'en', 'Add New Currency', 'Add New Currency', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1927, 'en', 'Currency name', 'Currency name', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1928, 'en', 'Currency symbol', 'Currency symbol', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1929, 'en', 'Currency code', 'Currency code', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1930, 'en', 'Currency Status updated successfully', 'Currency Status updated successfully', '2021-07-06 00:28:41', '2021-07-06 00:28:41'),
(1931, 'en', 'Update Currency', 'Update Currency', '2021-07-06 00:31:30', '2021-07-06 00:31:30'),
(1932, 'en', 'Symbol', 'Symbol', '2021-07-06 00:31:30', '2021-07-06 00:31:30'),
(1933, 'en', 'All Taxes', 'All Taxes', '2021-07-06 00:31:47', '2021-07-06 00:31:47'),
(1934, 'en', 'Add New Tax', 'Add New Tax', '2021-07-06 00:31:47', '2021-07-06 00:31:47'),
(1935, 'en', 'Tax Type', 'Tax Type', '2021-07-06 00:31:47', '2021-07-06 00:31:47'),
(1936, 'en', 'Tax Name', 'Tax Name', '2021-07-06 00:31:47', '2021-07-06 00:31:47'),
(1937, 'en', 'Tax status updated successfully', 'Tax status updated successfully', '2021-07-06 00:31:47', '2021-07-06 00:31:47'),
(1938, 'en', 'Type key & Enter', 'Type key & Enter', '2021-07-06 00:33:17', '2021-07-06 00:33:17'),
(1939, 'bd', 'Trade Price', 'বাণিজ্যিক মূল্য', '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1940, 'bd', 'Company Discount', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1941, 'bd', 'Other Discount', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1942, 'bd', 'vat', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1943, 'bd', 'Pack Price', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1944, 'bd', 'Selling Unit Buying Price', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1945, 'bd', 'Purchase Requisition', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1946, 'bd', 'Add New Post', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1947, 'bd', 'All blog posts', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1948, 'bd', 'Change blog status successfully', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1949, 'bd', 'Blog post has been created successfully', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1950, 'bd', 'Add Requisition', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1951, 'bd', 'Item ID', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1952, 'bd', 'Item Name', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1953, 'bd', 'Pack', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1954, 'bd', 'Avil Unit', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1955, 'bd', 'All Purchase Requisition', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1956, 'bd', 'Add New Requisition', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1957, 'bd', 'Supplyer Name', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1958, 'bd', 'Item Id:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1959, 'bd', 'Enter Product Item ID', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1960, 'bd', 'Supplyer Name:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1961, 'bd', 'Pack Size:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1962, 'bd', 'Avil Unit:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1963, 'bd', 'Your Avil Unit', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1964, 'bd', ':', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1965, 'bd', 'Vat:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1966, 'bd', 'Trade Price:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1967, 'bd', 'tp', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1968, 'bd', 'Company Discount:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1969, 'bd', 'Ex: ', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1970, 'bd', 'op', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1971, 'bd', 'Net Buying Price:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1972, 'bd', 'nbp 2:', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1973, 'bd', 'Generic has been updated successfully', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1974, 'bd', 'Generic has been deleted successfully', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1975, 'bd', 'Selling Unit Price', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1976, 'bd', 'System Default Currency', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1977, 'bd', 'Set Currency Formats', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1978, 'bd', 'Symbol Format', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1979, 'bd', 'Decimal Separator', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1980, 'bd', 'No of decimals', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1981, 'bd', 'All Currencies', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1982, 'bd', 'Add New Currency', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1983, 'bd', 'Currency name', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1984, 'bd', 'Currency symbol', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1985, 'bd', 'Currency code', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1986, 'bd', 'Currency Status updated successfully', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1987, 'bd', 'Update Currency', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1988, 'bd', 'Symbol', NULL, '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1989, 'en', 'Translations updated for ', 'Translations updated for ', '2021-07-06 00:34:07', '2021-07-06 00:34:07'),
(1990, 'en', 'Basic Affiliate', 'Basic Affiliate', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1991, 'en', 'User Registration & First Purchase', 'User Registration & First Purchase', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1992, 'en', 'Product Sharing Affiliate', 'Product Sharing Affiliate', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1993, 'en', 'Product Sharing and Purchasing', 'Product Sharing and Purchasing', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1994, 'en', 'Product Sharing Affiliate (Category Wise)', 'Product Sharing Affiliate (Category Wise)', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1995, 'en', 'N:B: You can not enable Single Product Sharing Affiliate and Category Wise Affiliate at a time.', 'N:B: You can not enable Single Product Sharing Affiliate and Category Wise Affiliate at a time.', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1996, 'en', 'Affiliate Link Validatin Time (Days)', 'Affiliate Link Validatin Time (Days)', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1997, 'en', 'Validation Time', 'Validation Time', '2021-07-06 00:39:22', '2021-07-06 00:39:22'),
(1998, 'en', 'Affiliate user has been approved successfully', 'Affiliate user has been approved successfully', '2021-07-06 00:39:58', '2021-07-06 00:39:58'),
(1999, 'en', 'Status:', 'Status:', '2021-07-06 01:11:59', '2021-07-06 01:11:59'),
(2000, 'en', 'New verification request(s)', 'New verification request(s)', '2021-07-06 01:12:08', '2021-07-06 01:12:08'),
(2001, 'en', 'Affiliate Payment', 'Affiliate Payment', '2021-07-06 01:13:54', '2021-07-06 01:13:54'),
(2002, 'en', 'Paypal Email', 'Paypal Email', '2021-07-06 01:13:54', '2021-07-06 01:13:54'),
(2003, 'en', 'Select Payment Method', 'Select Payment Method', '2021-07-06 01:13:54', '2021-07-06 01:13:54'),
(2004, 'en', 'Bank', 'Bank', '2021-07-06 01:13:54', '2021-07-06 01:13:54'),
(2005, 'en', 'Pay', 'Pay', '2021-07-06 01:13:54', '2021-07-06 01:13:54'),
(2006, 'en', 'Bkash Credential', 'Bkash Credential', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2007, 'en', 'BKASH CHECKOUT APP KEY', 'BKASH CHECKOUT APP KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2008, 'en', 'BKASH CHECKOUT APP SECRET', 'BKASH CHECKOUT APP SECRET', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2009, 'en', 'BKASH CHECKOUT USER NAME', 'BKASH CHECKOUT USER NAME', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2010, 'en', 'BKASH CHECKOUT PASSWORD', 'BKASH CHECKOUT PASSWORD', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2011, 'en', 'Bkash Sandbox Mode', 'Bkash Sandbox Mode', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2012, 'en', 'Nagad Credential', 'Nagad Credential', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2013, 'en', 'NAGAD MODE', 'NAGAD MODE', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2014, 'en', 'NAGAD MERCHANT ID', 'NAGAD MERCHANT ID', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2015, 'en', 'NAGAD MERCHANT NUMBER', 'NAGAD MERCHANT NUMBER', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2016, 'en', 'NAGAD PG PUBLIC KEY', 'NAGAD PG PUBLIC KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2017, 'en', 'NAGAD MERCHANT PRIVATE KEY', 'NAGAD MERCHANT PRIVATE KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2018, 'en', 'PAYSTACK CURRENCY CODE', 'PAYSTACK CURRENCY CODE', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2019, 'en', 'Iyzico Credential', 'Iyzico Credential', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2020, 'en', 'IYZICO_API_KEY', 'IYZICO_API_KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2021, 'en', 'IYZICO API KEY', 'IYZICO API KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2022, 'en', 'IYZICO_SECRET_KEY', 'IYZICO_SECRET_KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2023, 'en', 'IYZICO SECRET KEY', 'IYZICO SECRET KEY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2024, 'en', 'IYZICO Sandbox Mode', 'IYZICO Sandbox Mode', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2025, 'en', 'ProxyPay Credential', 'ProxyPay Credential', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2026, 'en', 'PROXYPAY_TOKEN', 'PROXYPAY_TOKEN', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2027, 'en', 'PROXYPAY TOKEN', 'PROXYPAY TOKEN', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2028, 'en', 'PROXYPAY_ENTITY', 'PROXYPAY_ENTITY', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2029, 'en', 'PROXYPAY_END_TIME', 'PROXYPAY_END_TIME', '2021-07-06 01:14:13', '2021-07-06 01:14:13'),
(2030, 'en', 'Affiliate payments of ', 'Affiliate payments of ', '2021-07-06 01:15:23', '2021-07-06 01:15:23'),
(2031, 'en', 'All Customers', 'All Customers', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2032, 'en', 'Package', 'Package', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2033, 'en', 'Wallet Balance', 'Wallet Balance', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2034, 'en', 'Log in as this Customer', 'Log in as this Customer', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2035, 'en', 'Ban this Customer', 'Ban this Customer', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2036, 'en', 'Do you really want to ban this Customer?', 'Do you really want to ban this Customer?', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2037, 'en', 'Do you really want to unban this Customer?', 'Do you really want to unban this Customer?', '2021-07-06 01:15:41', '2021-07-06 01:15:41'),
(2038, 'en', 'Premium Packages for Customers', 'Premium Packages for Customers', '2021-07-07 22:07:32', '2021-07-07 22:07:32'),
(2039, 'en', 'Offline Package Purchase ', 'Offline Package Purchase ', '2021-07-07 22:07:32', '2021-07-07 22:07:32'),
(2040, 'en', 'All Classifies Packages', 'All Classifies Packages', '2021-07-07 22:08:09', '2021-07-07 22:08:09'),
(2041, 'en', 'Create New Package', 'Create New Package', '2021-07-07 22:08:53', '2021-07-07 22:08:53'),
(2042, 'en', 'Uploaded By', 'Uploaded By', '2021-07-07 22:09:52', '2021-07-07 22:09:52'),
(2043, 'en', 'Customer Status', 'Customer Status', '2021-07-07 22:09:52', '2021-07-07 22:09:52'),
(2044, 'en', 'Seller Commission Activation', 'Seller Commission Activation', '2021-07-07 22:17:41', '2021-07-07 22:17:41'),
(2045, 'en', 'Package has been updated successfully', 'Package has been updated successfully', '2021-07-07 22:22:41', '2021-07-07 22:22:41'),
(2046, 'en', 'Offline Customer Package Payment Requests', 'Offline Customer Package Payment Requests', '2021-07-07 22:41:05', '2021-07-07 22:41:05'),
(2047, 'en', 'Method', 'Method', '2021-07-07 22:41:05', '2021-07-07 22:41:05'),
(2048, 'en', 'TXN ID', 'TXN ID', '2021-07-07 22:41:05', '2021-07-07 22:41:05'),
(2049, 'en', 'Reciept', 'Reciept', '2021-07-07 22:41:05', '2021-07-07 22:41:05'),
(2050, 'en', 'Offline Customer Package Payment approved successfully', 'Offline Customer Package Payment approved successfully', '2021-07-07 22:41:05', '2021-07-07 22:41:05'),
(2051, 'en', 'Offline Wallet Recharge Requests', 'Offline Wallet Recharge Requests', '2021-07-07 22:41:13', '2021-07-07 22:41:13'),
(2052, 'en', 'Money has been added successfully', 'Money has been added successfully', '2021-07-07 22:41:13', '2021-07-07 22:41:13'),
(2053, 'en', 'Company:', 'Company:', '2021-07-08 00:51:47', '2021-07-08 00:51:47'),
(2054, 'en', 'Generic Name', 'Generic Name', '2021-07-08 00:59:16', '2021-07-08 00:59:16'),
(2055, 'en', 'reviews:', 'reviews:', '2021-07-08 01:04:35', '2021-07-08 01:04:35'),
(2056, 'en', 'Estimate Shipping Time:', 'Estimate Shipping Time:', '2021-07-08 01:04:35', '2021-07-08 01:04:35'),
(2057, 'en', 'Brand has been deleted successfully', 'Brand has been deleted successfully', '2021-07-08 02:06:31', '2021-07-08 02:06:31'),
(2058, 'en', 'Brand has been inserted successfully', 'Brand has been inserted successfully', '2021-07-08 02:07:05', '2021-07-08 02:07:05'),
(2059, 'en', 'Category has been updated successfully', 'Category has been updated successfully', '2021-07-08 02:09:50', '2021-07-08 02:09:50'),
(2060, 'en', 'Category has been deleted successfully', 'Category has been deleted successfully', '2021-07-08 02:10:01', '2021-07-08 02:10:01'),
(2061, 'en', 'Pricee', 'Pricee', '2021-07-08 02:40:07', '2021-07-08 02:40:07'),
(2062, 'en', 'See Details', 'See Details', '2021-07-09 16:17:04', '2021-07-09 16:17:04'),
(2063, 'en', 'Message has been send to seller', 'Message has been send to seller', '2021-07-09 16:17:09', '2021-07-09 16:17:09'),
(2064, 'en', 'Conversations With ', 'Conversations With ', '2021-07-09 16:19:04', '2021-07-09 16:19:04'),
(2065, 'en', 'Between you and', 'Between you and', '2021-07-09 16:19:04', '2021-07-09 16:19:04'),
(2066, 'en', 'Conversations with doctors', 'Conversations with doctors', '2021-07-09 16:20:35', '2021-07-09 16:20:35'),
(2067, 'en', 'Meet a Doctor', 'Meet a Doctor', '2021-07-09 16:22:11', '2021-07-09 16:22:11'),
(2068, 'en', 'Staff Information', 'Staff Information', '2021-07-09 16:25:43', '2021-07-09 16:25:43'),
(2069, 'en', 'Role Information', 'Role Information', '2021-07-09 16:26:26', '2021-07-09 16:26:26'),
(2070, 'en', 'Permissions', 'Permissions', '2021-07-09 16:26:27', '2021-07-09 16:26:27'),
(2071, 'en', 'Role has been inserted successfully', 'Role has been inserted successfully', '2021-07-09 16:27:10', '2021-07-09 16:27:10'),
(2072, 'en', 'Staff has been inserted successfully', 'Staff has been inserted successfully', '2021-07-09 16:27:38', '2021-07-09 16:27:38'),
(2073, 'en', 'Role has been updated successfully', 'Role has been updated successfully', '2021-07-09 16:29:29', '2021-07-09 16:29:29'),
(2074, 'en', 'Patient Messages', 'Patient Messages', '2021-07-09 16:30:34', '2021-07-09 16:30:34'),
(2075, 'en', 'Conversations With Registerd Doctor', 'Conversations With Registerd Doctor', '2021-07-09 16:32:45', '2021-07-09 16:32:45'),
(2076, 'en', 'Prescriptions', 'Prescriptions', '2021-07-09 16:39:33', '2021-07-09 16:39:33'),
(2077, 'en', 'Your Prescriptions', 'Your Prescriptions', '2021-07-09 16:49:08', '2021-07-09 16:49:08'),
(2078, 'en', 'Add New Prescription', 'Add New Prescription', '2021-07-09 16:49:08', '2021-07-09 16:49:08'),
(2079, 'en', 'Prescription', 'Prescription', '2021-07-09 16:57:43', '2021-07-09 16:57:43'),
(2080, 'en', 'ID', 'ID', '2021-07-09 17:04:14', '2021-07-09 17:04:14'),
(2081, 'en', 'Prescription has been deleted successfully', 'Prescription has been deleted successfully', '2021-07-09 17:17:44', '2021-07-09 17:17:44'),
(2082, 'en', 'Details', 'Details', '2021-07-09 19:57:24', '2021-07-09 19:57:24'),
(2083, 'en', 'See ticket', 'See ticket', '2021-07-09 19:57:24', '2021-07-09 19:57:24'),
(2084, 'en', 'Ticket has been sent successfully', 'Ticket has been sent successfully', '2021-07-09 19:57:32', '2021-07-09 19:57:32'),
(2085, 'en', 'Send Reply', 'Send Reply', '2021-07-09 19:57:58', '2021-07-09 19:57:58'),
(2086, 'en', 'Affiliate Balance', 'Affiliate Balance', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2087, 'en', 'Configure Payout', 'Configure Payout', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2088, 'en', 'Copy Url', 'Copy Url', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2089, 'en', 'Affiliate Stats', 'Affiliate Stats', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2090, 'en', 'No of click', 'No of click', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2091, 'en', 'No of item', 'No of item', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2092, 'en', 'No of deliverd', 'No of deliverd', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2093, 'en', 'No of cancel', 'No of cancel', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2094, 'en', 'Affiliate Earning History', 'Affiliate Earning History', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2095, 'en', 'Referral User', 'Referral User', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2096, 'en', 'Referral Type', 'Referral Type', '2021-07-09 20:09:26', '2021-07-09 20:09:26'),
(2097, 'en', 'Payment Settings', 'Payment Settings', '2021-07-09 20:09:46', '2021-07-09 20:09:46'),
(2098, 'en', 'Bank Informations', 'Bank Informations', '2021-07-09 20:09:46', '2021-07-09 20:09:46'),
(2099, 'en', 'Acc. No, Bank Name etc', 'Acc. No, Bank Name etc', '2021-07-09 20:09:46', '2021-07-09 20:09:46'),
(2100, 'en', 'Update Payment Settings', 'Update Payment Settings', '2021-07-09 20:09:46', '2021-07-09 20:09:46'),
(2101, 'en', 'Please click the button below to verify your email address.', 'Please click the button below to verify your email address.', '2021-07-09 20:12:47', '2021-07-09 20:12:47'),
(2102, 'en', 'Email Verification - ', 'Email Verification - ', '2021-07-09 20:12:47', '2021-07-09 20:12:47'),
(2103, 'en', 'Registration successfull. Please verify your email.', 'Registration successfull. Please verify your email.', '2021-07-09 20:12:53', '2021-07-09 20:12:53'),
(2104, 'en', 'Your email has been verified successfully', 'Your email has been verified successfully', '2021-07-09 20:13:08', '2021-07-09 20:13:08'),
(2105, 'en', ' Send CV', ' Send CV', '2021-07-10 23:22:31', '2021-07-10 23:22:31'),
(2106, 'en', 'Product Image', 'Product Image', '2021-07-11 00:04:01', '2021-07-11 00:04:01'),
(2107, 'en', 'alternative brand', 'alternative brand', '2021-07-11 00:31:39', '2021-07-11 00:31:39'),
(2108, 'en', 'item strength (e.g. KG, Pc etc)', 'item strength (e.g. KG, Pc etc)', '2021-07-11 01:14:20', '2021-07-11 01:14:20'),
(2109, 'en', 'Seller Information', 'Seller Information', '2021-07-11 02:10:34', '2021-07-11 02:10:34'),
(2110, 'en', 'There isn\'t anything added yet', 'There isn\'t anything added yet', '2021-07-13 07:30:09', '2021-07-13 07:30:09'),
(2111, 'en', 'Best Sellers', 'Best Sellers', '2021-07-13 10:44:14', '2021-07-13 10:44:14'),
(2112, 'en', ' added to your cart!', ' added to your cart!', '2021-07-13 10:53:23', '2021-07-13 10:53:23'),
(2113, 'en', 'Best Selling Drugs', 'Best Selling Drugs', '2021-07-13 10:58:43', '2021-07-13 10:58:43'),
(2114, 'en', 'Coupon has been saved successfully', 'Coupon has been saved successfully', '2021-07-13 11:50:24', '2021-07-13 11:50:24'),
(2115, 'en', 'Invalid coupon!', 'Invalid coupon!', '2021-07-13 11:51:49', '2021-07-13 11:51:49'),
(2116, 'en', 'Coupon has been applied', 'Coupon has been applied', '2021-07-13 11:51:59', '2021-07-13 11:51:59'),
(2117, 'en', 'Change Coupon', 'Change Coupon', '2021-07-13 11:52:00', '2021-07-13 11:52:00'),
(2118, 'en', 'Add to compare', 'Add to compare', '2021-07-14 09:43:24', '2021-07-14 09:43:24'),
(2119, 'en', 'Product Unavailable', 'Product Unavailable', '2021-07-15 21:26:31', '2021-07-15 21:26:31'),
(2120, 'en', 'Buy', 'Buy', '2021-07-16 09:51:41', '2021-07-16 09:51:41'),
(2121, 'en', 'PONNOPOSHARA', 'PONNOPOSHARA', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2122, 'en', 'BUY TO WIN', 'BUY TO WIN', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2123, 'en', 'SHOPPING BUZZ', 'SHOPPING BUZZ', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2124, 'en', 'BRANDING', 'BRANDING', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2125, 'en', 'BLOGGING', 'BLOGGING', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2126, 'en', 'ABOUT', 'ABOUT', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2127, 'en', 'Ok. I Understood', 'Ok. I Understood', '2021-07-19 17:46:54', '2021-07-19 17:46:54'),
(2128, 'en', 'Search your medicine or generic name', 'Search your medicine or generic name', '2021-07-28 18:42:34', '2021-07-28 18:42:34'),
(2129, 'en', 'All Doctors', 'All Doctors', '2021-07-28 20:41:58', '2021-07-28 20:41:58'),
(2130, 'en', 'All Staffs & Doctors', 'All Staffs & Doctors', '2021-07-28 20:41:58', '2021-07-28 20:41:58'),
(2131, 'en', 'Visit Profile', 'Visit Profile', '2021-07-28 20:46:40', '2021-07-28 20:46:40'),
(2132, 'en', 'All uploaded files', 'All uploaded files', '2021-07-28 21:17:05', '2021-07-28 21:17:05'),
(2133, 'en', 'Upload New File', 'Upload New File', '2021-07-28 21:17:05', '2021-07-28 21:17:05'),
(2134, 'en', 'All files', 'All files', '2021-07-28 21:17:05', '2021-07-28 21:17:05'),
(2135, 'en', 'Search', 'Search', '2021-07-28 21:17:05', '2021-07-28 21:17:05'),
(2136, 'en', 'Details Info', 'Details Info', '2021-07-28 21:17:05', '2021-07-28 21:17:05'),
(2137, 'en', 'Copy Link', 'Copy Link', '2021-07-28 21:17:05', '2021-07-28 21:17:05'),
(2138, 'en', 'Are you sure to delete this file?', 'Are you sure to delete this file?', '2021-07-28 21:17:06', '2021-07-28 21:17:06'),
(2139, 'en', 'File Info', 'File Info', '2021-07-28 21:17:06', '2021-07-28 21:17:06'),
(2140, 'en', 'User ID', 'User ID', '2021-07-28 21:31:48', '2021-07-28 21:31:48'),
(2141, 'en', 'User Name', 'User Name', '2021-07-28 21:31:48', '2021-07-28 21:31:48'),
(2142, 'en', 'Add Prescription', 'Add Prescription', '2021-07-28 21:55:47', '2021-07-28 21:55:47'),
(2143, 'en', 'Prescription saved successfully', 'Prescription saved successfully', '2021-07-28 22:17:40', '2021-07-28 22:17:40'),
(2144, 'en', 'Generics', 'Generics', '2021-07-29 10:57:57', '2021-07-29 10:57:57'),
(2145, 'en', 'All Generics', 'All Generics', '2021-07-29 11:16:35', '2021-07-29 11:16:35'),
(2146, 'en', 'Visit More', 'Visit More', '2021-07-29 11:21:42', '2021-07-29 11:21:42'),
(2147, 'en', 'Indicates', 'Indicates', '2021-07-29 11:47:16', '2021-07-29 11:47:16'),
(2148, 'en', 'Search by Indicates', 'Search by Indicates', '2021-07-29 11:48:45', '2021-07-29 11:48:45'),
(2149, 'en', 'Indications', 'Indications', '2021-07-29 11:51:56', '2021-07-29 11:51:56'),
(2150, 'en', ' (e.g. Feaver, Pain etc)', ' (e.g. Feaver, Pain etc)', '2021-07-29 11:51:56', '2021-07-29 11:51:56'),
(2151, 'en', 'Product has been duplicated successfully', 'Product has been duplicated successfully', '2021-07-29 11:56:44', '2021-07-29 11:56:44'),
(2152, 'en', 'Brand Information', 'Brand Information', '2021-07-29 14:48:19', '2021-07-29 14:48:19'),
(2153, 'en', 'Brand has been updated successfully', 'Brand has been updated successfully', '2021-07-29 14:49:13', '2021-07-29 14:49:13'),
(2154, 'en', 'Search result for ', 'Search result for ', '2021-07-29 15:52:50', '2021-07-29 15:52:50'),
(2155, 'en', 'Uplaod Product', 'Uplaod Product', '2021-07-30 18:18:31', '2021-07-30 18:18:31'),
(2156, 'en', '1. Category and Brand should be in numerical id.', '1. Category and Brand should be in numerical id.', '2021-07-30 18:20:13', '2021-07-30 18:20:13'),
(2157, 'en', '2. You can download the pdf to get Category and Brand id.', '2. You can download the pdf to get Category and Brand id.', '2021-07-30 18:20:13', '2021-07-30 18:20:13'),
(2158, 'en', 'Request has been sent successfully', 'Request has been sent successfully', '2021-07-30 18:21:33', '2021-07-30 18:21:33'),
(2159, 'en', 'Message View', 'Message View', '2021-07-30 18:22:17', '2021-07-30 18:22:17'),
(2160, 'en', 'Blog', 'Blog', '2021-07-31 17:39:49', '2021-07-31 17:39:49'),
(2161, 'en', 'Consultution Fee', 'Consultution Fee', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2162, 'en', 'DMDC Number', 'DMDC Number', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2163, 'en', 'Qualifications', 'Qualifications', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2164, 'en', 'Depertment', 'Depertment', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2165, 'en', 'Working in', 'Working in', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2166, 'en', 'Availvility', 'Availvility', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2167, 'en', 'Follow up fee', 'Follow up fee', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2168, 'en', 'Consulttion Time ', 'Consulttion Time ', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2169, 'en', 'Doctor Code', 'Doctor Code', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2170, 'en', 'Doctor Description:', 'Doctor Description:', '2021-08-03 01:00:14', '2021-08-03 01:00:14'),
(2171, 'en', 'Send Message', 'Send Message', '2021-08-03 02:33:15', '2021-08-03 02:33:15'),
(2172, 'en', 'Your Message Has Been Sent Successfully', 'Your Message Has Been Sent Successfully', '2021-08-03 03:24:27', '2021-08-03 03:24:27'),
(2173, 'en', 'Add Experience Qualification ', 'Add Experience Qualification ', '2021-08-03 18:02:45', '2021-08-03 18:02:45'),
(2174, 'en', 'Hospital:', 'Hospital:', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2175, 'en', 'Hospital', 'Hospital', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2176, 'en', 'Employment Period:', 'Employment Period:', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2177, 'en', 'Department:', 'Department:', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2178, 'en', 'Department', 'Department', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2179, 'en', 'Designation:', 'Designation:', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2180, 'en', 'Your Designation', 'Your Designation', '2021-08-03 18:17:44', '2021-08-03 18:17:44'),
(2181, 'en', 'Add Experience', 'Add Experience', '2021-08-03 19:22:06', '2021-08-03 19:22:06'),
(2182, 'en', 'Experience has been Inserted Successfully', 'Experience has been Inserted Successfully', '2021-08-03 19:22:25', '2021-08-03 19:22:25'),
(2183, 'en', 'designation', 'designation', '2021-08-03 19:24:21', '2021-08-03 19:24:21'),
(2184, 'en', 'employment period', 'employment period', '2021-08-03 19:24:22', '2021-08-03 19:24:22'),
(2185, 'en', 'Ask Your Question', 'Ask Your Question', '2021-08-05 16:39:28', '2021-08-05 16:39:28'),
(2186, 'en', 'Prescription ID', 'Prescription ID', '2021-08-05 19:17:15', '2021-08-05 19:17:15'),
(2187, 'en', 'Your Message', 'Your Message', '2021-08-05 20:17:58', '2021-08-05 20:17:58'),
(2188, 'en', 'Role has been deleted successfully', 'Role has been deleted successfully', '2021-08-05 20:35:09', '2021-08-05 20:35:09'),
(2189, 'en', 'Type and hit enter to add a indicate', 'Type and hit enter to add a indicate', '2021-08-05 20:49:55', '2021-08-05 20:49:55'),
(2190, 'en', 'Buying Price', 'Buying Price', '2021-08-05 21:04:31', '2021-08-05 21:04:31'),
(2191, 'en', 'proceed', 'proceed', '2021-08-06 16:09:56', '2021-08-06 16:09:56'),
(2192, 'en', 'Proceed by', 'Proceed by', '2021-08-06 16:16:58', '2021-08-06 16:16:58'),
(2193, 'en', 'Action taken successfully', 'Action taken successfully', '2021-08-06 16:29:41', '2021-08-06 16:29:41'),
(2194, 'en', 'Proceed Time', 'Proceed Time', '2021-08-06 16:36:26', '2021-08-06 16:36:26'),
(2195, 'en', 'Type Your Message', 'Type Your Message', '2021-08-06 19:02:27', '2021-08-06 19:02:27'),
(2196, 'en', 'Prescription search', 'Prescription search', '2021-08-06 23:08:44', '2021-08-06 23:08:44'),
(2197, 'en', 'Submit as', 'Submit as', '2021-08-07 00:18:51', '2021-08-07 00:18:51'),
(2198, 'en', 'Solved', 'Solved', '2021-08-07 00:18:51', '2021-08-07 00:18:51'),
(2199, 'en', 'update Language Info', 'update Language Info', '2021-08-07 04:38:51', '2021-08-07 04:38:51'),
(2200, 'bd', 'Career', 'চাকুরি', '2021-08-07 04:40:25', '2021-08-07 04:40:25'),
(2201, 'en', 'Admin', 'Admin', '2021-08-07 06:03:51', '2021-08-07 06:03:51'),
(2202, 'en', 'Filter by company', 'Filter by company', '2021-08-12 05:15:19', '2021-08-12 05:15:19'),
(2203, 'en', 'Mr. Customer', 'Mr. Customer', '2021-08-12 05:21:28', '2021-08-12 05:21:28'),
(2204, 'en', 'Upload Time', 'Upload Time', '2021-08-12 05:31:26', '2021-08-12 05:31:26'),
(2205, 'en', 'Add Prescription for Order', 'Add Prescription for Order', '2021-08-12 05:31:26', '2021-08-12 05:31:26'),
(2206, 'en', 'DeadLine', 'DeadLine', '2021-08-12 05:40:23', '2021-08-12 05:40:23'),
(2207, 'en', 'Phone number', 'Phone number', '2021-08-12 05:43:15', '2021-08-12 05:43:15'),
(2208, 'en', 'Circuler has been inserted successfully', 'Circuler has been inserted successfully', '2021-08-12 06:35:59', '2021-08-12 06:35:59'),
(2209, 'en', 'Find Doctors', 'Find Doctors', '2021-08-14 13:37:58', '2021-08-14 13:37:58'),
(2210, 'en', 'Dosage Form Group', 'Dosage Form Group', '2021-08-16 15:50:21', '2021-08-16 15:50:21'),
(2211, 'en', 'Add New Dosage Form', 'Add New Dosage Form', '2021-08-16 15:50:21', '2021-08-16 15:50:21'),
(2212, 'en', 'Dosage Form Information', 'Dosage Form Information', '2021-08-16 16:22:56', '2021-08-16 16:22:56'),
(2213, 'en', 'Dosage Form', 'Dosage Form', '2021-08-16 16:27:40', '2021-08-16 16:27:40'),
(2214, 'en', 'Dosage Form has been updated successfully', 'Dosage Form has been updated successfully', '2021-08-16 16:47:35', '2021-08-16 16:47:35'),
(2215, 'en', 'Dosage Form has been deleted successfully', 'Dosage Form has been deleted successfully', '2021-08-16 16:55:07', '2021-08-16 16:55:07'),
(2216, 'en', 'Staff has been updated successfully', 'Staff has been updated successfully', '2021-08-17 21:58:39', '2021-08-17 21:58:39'),
(2217, 'en', 'Submit', 'Submit', '2021-08-17 23:42:40', '2021-08-17 23:42:40'),
(2218, 'en', 'There have been no reviews for this Doctor yet.', 'There have been no reviews for this Doctor yet.', '2021-08-17 23:50:32', '2021-08-17 23:50:32'),
(2219, 'en', 'Your Review Has Been Submited Successfully', 'Your Review Has Been Submited Successfully', '2021-08-18 00:02:17', '2021-08-18 00:02:17'),
(2220, 'en', 'Mr. Seller', 'Mr. Seller', '2021-08-18 00:46:11', '2021-08-18 00:46:11'),
(2221, 'en', 'normal', 'normal', '2021-08-18 17:30:44', '2021-08-18 17:30:44'),
(2222, 'en', 'Add Product', 'Add Product', '2021-08-20 16:52:22', '2021-08-20 16:52:22'),
(2223, 'en', 'Add Missing Product', 'Add Missing Product', '2021-08-20 16:52:22', '2021-08-20 16:52:22'),
(2224, 'en', 'Stock Quantity', 'Stock Quantity', '2021-08-20 18:12:25', '2021-08-20 18:12:25'),
(2225, 'en', 'Name + Generic', 'Name + Generic', '2021-08-20 18:23:15', '2021-08-20 18:23:15'),
(2226, 'en', 'Update Your Product list', 'Update Your Product list', '2021-08-20 19:07:41', '2021-08-20 19:07:41'),
(2227, 'en', 'MRP', 'MRP', '2021-08-20 19:15:17', '2021-08-20 19:15:17'),
(2228, 'en', 'Your Price', 'Your Price', '2021-08-20 19:21:15', '2021-08-20 19:21:15'),
(2229, 'en', 'Add Quantity', 'Add Quantity', '2021-08-20 19:25:34', '2021-08-20 19:25:34'),
(2230, 'en', 'Company Based Discount', 'Company Based Discount', '2021-08-20 20:04:21', '2021-08-20 20:04:21'),
(2231, 'en', 'Discount Value', 'Discount Value', '2021-08-20 21:00:07', '2021-08-20 21:00:07'),
(2232, 'en', 'Company Based Discount has been save successfully', 'Company Based Discount has been save successfully', '2021-08-20 22:01:26', '2021-08-20 22:01:26'),
(2233, 'en', ' Registration', ' Registration', '2021-08-21 19:00:41', '2021-08-21 19:00:41'),
(2234, 'en', ' Login', ' Login', '2021-08-21 19:03:52', '2021-08-21 19:03:52');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(2235, 'en', ' Profile', ' Profile', '2021-08-21 19:12:53', '2021-08-21 19:12:53'),
(2236, 'en', 'Shop Logo', 'Shop Logo', '2021-08-21 20:45:01', '2021-08-21 20:45:01'),
(2237, 'en', 'Shop Phone', 'Shop Phone', '2021-08-21 20:45:01', '2021-08-21 20:45:01'),
(2238, 'en', 'Shop Address', 'Shop Address', '2021-08-21 20:45:02', '2021-08-21 20:45:02'),
(2239, 'en', 'Banner Settings', 'Banner Settings', '2021-08-21 20:45:02', '2021-08-21 20:45:02'),
(2240, 'en', 'Banners', 'Banners', '2021-08-21 20:45:02', '2021-08-21 20:45:02'),
(2241, 'en', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', '2021-08-21 20:45:02', '2021-08-21 20:45:02'),
(2242, 'en', 'Insert link with https ', 'Insert link with https ', '2021-08-21 20:45:02', '2021-08-21 20:45:02'),
(2243, 'en', 'Pay to seller', 'Pay to seller', '2021-08-21 20:52:37', '2021-08-21 20:52:37'),
(2244, 'en', 'Cash', 'Cash', '2021-08-21 20:52:37', '2021-08-21 20:52:37'),
(2245, 'en', 'Payment completed', 'Payment completed', '2021-08-21 20:52:50', '2021-08-21 20:52:50'),
(2246, 'en', 'Seller Message', 'Seller Message', '2021-08-21 20:52:55', '2021-08-21 20:52:55'),
(2247, 'en', 'Requested Amount is ', 'Requested Amount is ', '2021-08-21 20:53:20', '2021-08-21 20:53:20'),
(2248, 'en', 'Cancelled', 'Cancelled', '2021-08-21 20:57:02', '2021-08-21 20:57:02'),
(2249, 'en', 'Referred By', 'Referred By', '2021-08-21 20:59:14', '2021-08-21 20:59:14'),
(2250, 'en', 'Company Based Discount has been updated successfully', 'Company Based Discount has been updated successfully', '2021-08-21 22:11:01', '2021-08-21 22:11:01'),
(2251, 'en', 'Step 1', 'Step 1', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2252, 'en', 'Download the skeleton file and fill it with proper data', 'Download the skeleton file and fill it with proper data', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2253, 'en', 'You can download the example file to understand how the data must be filled', 'You can download the example file to understand how the data must be filled', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2254, 'en', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2255, 'en', 'After uploading products you need to edit them and set product\'s images and choices', 'After uploading products you need to edit them and set product\'s images and choices', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2256, 'en', 'Step 2', 'Step 2', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2257, 'en', 'Category and Brand should be in numerical id', 'Category and Brand should be in numerical id', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2258, 'en', 'You can download the pdf to get Category and Brand id', 'You can download the pdf to get Category and Brand id', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2259, 'en', 'Upload Product File', 'Upload Product File', '2021-08-23 04:39:59', '2021-08-23 04:39:59'),
(2260, 'en', 'Products imported successfully', 'Products imported successfully', '2021-08-23 12:46:03', '2021-08-23 12:46:03'),
(2261, 'en', 'buying_price (e.g. KG, Pc etc)', 'buying_price (e.g. KG, Pc etc)', '2021-08-23 13:08:41', '2021-08-23 13:08:41'),
(2262, 'en', 'A verification mail has been sent to the mail you provided us with.', 'A verification mail has been sent to the mail you provided us with.', '2021-08-23 16:24:17', '2021-08-23 16:24:17'),
(2263, 'en', 'Update your email', 'Update your email', '2021-08-23 16:24:17', '2021-08-23 16:24:17'),
(2264, 'en', 'Email', 'Email', '2021-08-23 21:49:02', '2021-08-23 21:49:02'),
(2265, 'en', 'Click for Buy', 'Click for Buy', '2021-08-23 22:11:33', '2021-08-23 22:11:33'),
(2266, 'en', 'BMDC Number', 'BMDC Number', '2021-08-23 23:30:23', '2021-08-23 23:30:23'),
(2267, 'en', 'Compare Option Activation', 'Compare Option Activation', '2021-08-25 09:41:43', '2021-08-25 09:41:43'),
(2268, 'en', 'Email already exists!', 'Email already exists!', '2021-08-25 19:23:58', '2021-08-25 19:23:58'),
(2269, 'en', 'File deleted successfully', 'File deleted successfully', '2021-08-25 20:51:37', '2021-08-25 20:51:37'),
(2270, 'en', 'File Name', 'File Name', '2021-08-25 20:51:44', '2021-08-25 20:51:44'),
(2271, 'en', 'File Type', 'File Type', '2021-08-25 20:51:44', '2021-08-25 20:51:44'),
(2272, 'en', 'File Size', 'File Size', '2021-08-25 20:51:44', '2021-08-25 20:51:44'),
(2273, 'en', 'Uploaded At', 'Uploaded At', '2021-08-25 20:51:44', '2021-08-25 20:51:44'),
(2274, 'en', 'Back to uploaded files', 'Back to uploaded files', '2021-08-25 20:51:55', '2021-08-25 20:51:55'),
(2275, 'en', 'Drag & drop your files', 'Drag & drop your files', '2021-08-25 20:51:55', '2021-08-25 20:51:55'),
(2276, 'en', '#FFFFFF', '#FFFFFF', '2021-08-26 18:26:31', '2021-08-26 18:26:31'),
(2277, 'en', 'This image is shown as cover banner in flash deal details page.', 'This image is shown as cover banner in flash deal details page.', '2021-08-26 18:26:31', '2021-08-26 18:26:31'),
(2278, 'en', 'If any product has discount or exists in another flash deal, the discount will be replaced by this discount & time limit.', 'If any product has discount or exists in another flash deal, the discount will be replaced by this discount & time limit.', '2021-08-26 18:26:31', '2021-08-26 18:26:31'),
(2279, 'en', 'Flash Deal has been inserted successfully', 'Flash Deal has been inserted successfully', '2021-08-26 18:30:10', '2021-08-26 18:30:10'),
(2280, 'en', 'Flash deal status updated successfully', 'Flash deal status updated successfully', '2021-08-26 18:30:16', '2021-08-26 18:30:16'),
(2281, 'en', 'Emails', 'Emails', '2021-08-26 19:57:19', '2021-08-26 19:57:19'),
(2282, 'en', 'Users', 'Users', '2021-08-26 19:57:19', '2021-08-26 19:57:19'),
(2283, 'en', 'Newsletter subject', 'Newsletter subject', '2021-08-26 19:57:19', '2021-08-26 19:57:19'),
(2284, 'en', 'Newsletter content', 'Newsletter content', '2021-08-26 19:57:19', '2021-08-26 19:57:19'),
(2285, 'en', 'Account Name', 'Account Name', '2021-08-26 19:58:33', '2021-08-26 19:58:33'),
(2286, 'en', 'Account Number', 'Account Number', '2021-08-26 19:58:33', '2021-08-26 19:58:33'),
(2287, 'en', 'Routing Number', 'Routing Number', '2021-08-26 19:58:33', '2021-08-26 19:58:33'),
(2288, 'en', 'Save Product', 'Save Product', '2021-08-26 20:34:56', '2021-08-26 20:34:56'),
(2289, 'en', 'Test Name: ', 'Test Name: ', '2021-08-26 22:07:53', '2021-08-26 22:07:53'),
(2290, 'en', 'Test Name', 'Test Name', '2021-08-26 22:08:03', '2021-08-26 22:08:03'),
(2291, 'en', 'Safe', 'Safe', '2021-08-26 22:09:14', '2021-08-26 22:09:14'),
(2292, 'en', 'Book Now', 'Book Now', '2021-08-26 22:16:25', '2021-08-26 22:16:25'),
(2293, 'en', 'Sample Collection Type', 'Sample Collection Type', '2021-08-26 22:26:21', '2021-08-26 22:26:21'),
(2294, 'en', 'Customer\'s Testimonial', 'Customer\'s Testimonial', '2021-08-26 22:33:14', '2021-08-26 22:33:14'),
(2295, 'en', 'Customer\'s Reviews', 'Customer\'s Reviews', '2021-08-26 22:33:55', '2021-08-26 22:33:55'),
(2296, 'en', 'Customer  Reviews', 'Customer  Reviews', '2021-08-26 22:34:07', '2021-08-26 22:34:07'),
(2297, 'en', 'Service Provided By', 'Service Provided By', '2021-08-26 22:51:19', '2021-08-26 22:51:19'),
(2298, 'en', 'Ask About Test', 'Ask About Test', '2021-08-26 23:02:42', '2021-08-26 23:02:42'),
(2299, 'en', 'Sample Type', 'Sample Type', '2021-08-26 23:03:54', '2021-08-26 23:03:54'),
(2300, 'en', 'Top Lab Tests', 'Top Lab Tests', '2021-08-26 23:13:29', '2021-08-26 23:13:29'),
(2301, 'en', 'Related Tests', 'Related Tests', '2021-08-26 23:13:29', '2021-08-26 23:13:29'),
(2302, 'en', 'Select Lab', 'Select Lab', '2021-08-26 23:19:26', '2021-08-26 23:19:26'),
(2303, 'en', 'Delivery Boy has been updated successfully', 'Delivery Boy has been updated successfully', '2021-08-27 17:11:14', '2021-08-27 17:11:14'),
(2304, 'en', 'Mark As Pickup', 'Mark As Pickup', '2021-08-27 17:26:12', '2021-08-27 17:26:12'),
(2305, 'en', 'Type and hit enter', 'Type and hit enter', '2021-08-28 13:53:51', '2021-08-28 13:53:51'),
(2306, 'en', 'Your Lab', 'Your Lab', '2021-08-28 15:45:09', '2021-08-28 15:45:09'),
(2307, 'en', 'Update Your Lab Tests', 'Update Your Lab Tests', '2021-08-28 15:45:36', '2021-08-28 15:45:36'),
(2308, 'en', 'Setup Your Lab', 'Setup Your Lab', '2021-08-28 15:46:18', '2021-08-28 15:46:18'),
(2309, 'en', 'Lab', 'Lab', '2021-08-28 15:50:39', '2021-08-28 15:50:39'),
(2310, 'en', 'Manage & organize your Lab', 'Manage & organize your Lab', '2021-08-28 15:50:39', '2021-08-28 15:50:39'),
(2311, 'en', 'Lab Settings', 'Lab Settings', '2021-08-28 15:54:39', '2021-08-28 15:54:39'),
(2312, 'en', 'Visit Lab', 'Visit Lab', '2021-08-28 15:54:39', '2021-08-28 15:54:39'),
(2313, 'en', 'Lab Name', 'Lab Name', '2021-08-28 15:55:10', '2021-08-28 15:55:10'),
(2314, 'en', 'Lab Logo', 'Lab Logo', '2021-08-28 15:55:10', '2021-08-28 15:55:10'),
(2315, 'en', 'Lab Address', 'Lab Address', '2021-08-28 15:55:10', '2021-08-28 15:55:10'),
(2316, 'en', 'Lab Phone', 'Lab Phone', '2021-08-28 15:56:08', '2021-08-28 15:56:08'),
(2317, 'en', 'Your Shop has been updated successfully!', 'Your Shop has been updated successfully!', '2021-08-28 16:02:43', '2021-08-28 16:02:43'),
(2318, 'en', 'Your Lab has been updated successfully!', 'Your Lab has been updated successfully!', '2021-08-28 16:05:21', '2021-08-28 16:05:21'),
(2319, 'en', 'Lab Description', 'Lab Description', '2021-08-28 16:51:47', '2021-08-28 16:51:47'),
(2320, 'en', 'About Lab', 'About Lab', '2021-08-28 17:07:08', '2021-08-28 17:07:08'),
(2321, 'en', 'Top Tests', 'Top Tests', '2021-08-28 17:07:08', '2021-08-28 17:07:08'),
(2322, 'en', 'All Tests', 'All Tests', '2021-08-28 17:07:08', '2021-08-28 17:07:08'),
(2323, 'en', 'New Arrival Tests', 'New Arrival Tests', '2021-08-28 17:15:42', '2021-08-28 17:15:42'),
(2324, 'en', 'Featured Tests', 'Featured Tests', '2021-08-28 17:16:27', '2021-08-28 17:16:27'),
(2325, 'en', 'Please add shipping address', 'Please add shipping address', '2021-08-28 19:16:56', '2021-08-28 19:16:56'),
(2326, 'en', 'All Labs', 'All Labs', '2021-08-28 21:29:21', '2021-08-28 21:29:21'),
(2327, 'en', 'Labs', 'Labs', '2021-08-28 21:37:47', '2021-08-28 21:37:47'),
(2328, 'en', 'You have subscribed successfully', 'You have subscribed successfully', '2021-08-29 00:07:18', '2021-08-29 00:07:18'),
(2329, 'en', 'Doctors', 'Doctors', '2021-08-29 02:08:41', '2021-08-29 02:08:41'),
(2330, 'en', 'Passing Year', 'Passing Year', '2021-08-30 23:29:59', '2021-08-30 23:29:59'),
(2331, 'en', 'No account exists with this email', 'No account exists with this email', '2021-08-30 23:44:26', '2021-08-30 23:44:26'),
(2332, 'en', 'Application to', 'Application to', '2021-08-30 23:52:53', '2021-08-30 23:52:53'),
(2333, 'en', 'Your Application ID ', 'Your Application ID ', '2021-08-30 23:52:53', '2021-08-30 23:52:53'),
(2334, 'en', 'Your verification mail has been Sent to your email.', 'Your verification mail has been Sent to your email.', '2021-08-30 23:56:15', '2021-08-30 23:56:15'),
(2335, 'en', 'Email Changed successfully', 'Email Changed successfully', '2021-08-30 23:56:22', '2021-08-30 23:56:22'),
(2336, 'en', 'Application Sub:', 'Application Sub:', '2021-08-31 00:06:08', '2021-08-31 00:06:08'),
(2337, 'en', 'Your Application', 'Your Application', '2021-08-31 01:37:41', '2021-08-31 01:37:41'),
(2338, 'en', 'The Circuler ID ', 'The Circuler ID ', '2021-08-31 01:45:28', '2021-08-31 01:45:28'),
(2339, 'en', 'The Your Application ID: ', 'The Your Application ID: ', '2021-08-31 01:59:56', '2021-08-31 01:59:56'),
(2340, 'en', 'The Circuler ID: ', 'The Circuler ID: ', '2021-08-31 01:59:56', '2021-08-31 01:59:56'),
(2341, 'en', 'All Application s ', 'All Application s ', '2021-08-31 04:34:17', '2021-08-31 04:34:17'),
(2342, 'en', 'Application Details', 'Application Details', '2021-08-31 05:22:57', '2021-08-31 05:22:57'),
(2343, 'en', 'Application ID:', 'Application ID:', '2021-08-31 05:22:57', '2021-08-31 05:22:57'),
(2344, 'en', 'Application Status', 'Application Status', '2021-08-31 05:22:57', '2021-08-31 05:22:57'),
(2345, 'en', 'Application Date', 'Application Date', '2021-08-31 05:22:57', '2021-08-31 05:22:57'),
(2346, 'en', 'Circuler ID', 'Circuler ID', '2021-08-31 06:12:58', '2021-08-31 06:12:58'),
(2347, 'en', 'Agreement', 'Agreement', '2021-08-31 06:45:11', '2021-08-31 06:45:11'),
(2348, 'en', 'Email or Phone already exists.', 'Email or Phone already exists.', '2021-09-01 03:09:42', '2021-09-01 03:09:42'),
(2349, 'en', 'Verify Your Email Address', 'Verify Your Email Address', '2021-09-01 03:10:45', '2021-09-01 03:10:45'),
(2350, 'en', 'Before proceeding, please check your email for a verification link.', 'Before proceeding, please check your email for a verification link.', '2021-09-01 03:10:45', '2021-09-01 03:10:45'),
(2351, 'en', 'If you did not receive the email.', 'If you did not receive the email.', '2021-09-01 03:10:45', '2021-09-01 03:10:45'),
(2352, 'en', 'Click here to request another', 'Click here to request another', '2021-09-01 03:10:45', '2021-09-01 03:10:45'),
(2353, 'en', 'A fresh verification link has been sent to your email address.', 'A fresh verification link has been sent to your email address.', '2021-09-01 03:10:56', '2021-09-01 03:10:56'),
(2354, 'en', 'Drugs', 'Drugs', '2021-09-02 17:08:21', '2021-09-02 17:08:21'),
(2355, 'en', 'Drugs under this Generic', 'Drugs under this Generic', '2021-09-02 17:14:53', '2021-09-02 17:14:53'),
(2356, 'en', 'Your Applications', 'Your Applications', '2021-09-04 10:00:34', '2021-09-04 10:00:34'),
(2357, 'en', 'Application Information', 'Application Information', '2021-09-04 10:52:41', '2021-09-04 10:52:41'),
(2358, 'en', 'Application has been deleted successfully', 'Application has been deleted successfully', '2021-09-04 19:55:11', '2021-09-04 19:55:11'),
(2359, 'en', 'Application has been  successfully', 'Application has been  successfully', '2021-09-04 19:59:23', '2021-09-04 19:59:23'),
(2360, 'en', 'You cant delete approved application', 'You cant delete approved application', '2021-09-04 20:01:07', '2021-09-04 20:01:07'),
(2361, 'en', 'About Me:', 'About Me:', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2362, 'en', 'write about yourself in 250 word', 'write about yourself in 250 word', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2363, 'en', 'Skills:', 'Skills:', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2364, 'en', 'Type your skills indivisually by separeting comma or enter', 'Type your skills indivisually by separeting comma or enter', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2365, 'en', 'Facebook profile Link:', 'Facebook profile Link:', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2366, 'en', 'https://www.facebook.com/yourprofile', 'https://www.facebook.com/yourprofile', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2367, 'en', 'Linkdin profile Link:', 'Linkdin profile Link:', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2368, 'en', 'https://www.linkdin.com/yourprofile', 'https://www.linkdin.com/yourprofile', '2021-09-07 07:29:11', '2021-09-07 07:29:11'),
(2369, 'en', 'Make This Present', 'Make This Present', '2021-09-07 07:29:38', '2021-09-07 07:29:38'),
(2370, 'en', 'Present', 'Present', '2021-09-07 07:29:38', '2021-09-07 07:29:38'),
(2371, 'en', 'Organization:', 'Organization:', '2021-09-07 07:29:38', '2021-09-07 07:29:38'),
(2372, 'en', 'organization', 'organization', '2021-09-07 07:29:38', '2021-09-07 07:29:38'),
(2373, 'en', 'Description:', 'Description:', '2021-09-07 07:29:38', '2021-09-07 07:29:38'),
(2374, 'en', 'canceled', 'canceled', '2021-09-07 07:35:13', '2021-09-07 07:35:13'),
(2375, 'en', 'Educational Qualifications', 'Educational Qualifications', '2021-09-07 07:35:13', '2021-09-07 07:35:13'),
(2376, 'en', 'Previous', 'Previous', '2021-09-07 07:35:13', '2021-09-07 07:35:13'),
(2377, 'en', 'Application status has been updated', 'Application status has been updated', '2021-09-07 07:35:13', '2021-09-07 07:35:13'),
(2378, 'en', 'Job Application Form <br> Step 1', 'Job Application Form <br> Step 1', '2021-09-07 16:38:29', '2021-09-07 16:38:29'),
(2379, 'en', 'Job Application Form <br> Step 2', 'Job Application Form <br> Step 2', '2021-09-07 16:55:23', '2021-09-07 16:55:23'),
(2380, 'en', 'mployment Period', 'mployment Period', '2021-09-07 17:02:47', '2021-09-07 17:02:47'),
(2381, 'en', 'Your Application ID: ', 'Your Application ID: ', '2021-09-07 17:04:52', '2021-09-07 17:04:52'),
(2382, 'en', 'Circuler ID: ', 'Circuler ID: ', '2021-09-07 17:04:52', '2021-09-07 17:04:52'),
(2383, 'en', 'Default experience can not be deleted', 'Default experience can not be deleted', '2021-09-08 10:50:59', '2021-09-08 10:50:59'),
(2384, 'en', 'Default experience status set successfully', 'Default experience status set successfully', '2021-09-08 10:51:08', '2021-09-08 10:51:08'),
(2385, 'en', 'You Cant Finish before adding experience & education', 'You Cant Finish before adding experience & education', '2021-09-08 11:11:54', '2021-09-08 11:11:54'),
(2386, 'en', 'You have to fillup experience & education before finish', 'You have to fillup experience & education before finish', '2021-09-08 11:19:36', '2021-09-08 11:19:36'),
(2387, 'en', 'Experience status has been inserted successfully', 'Experience status has been inserted successfully', '2021-09-08 12:17:34', '2021-09-08 12:17:34'),
(2388, 'en', 'MD. ASRAFUZZAMAN MAHTAF', 'MD. ASRAFUZZAMAN MAHTAF', '2021-09-08 12:18:11', '2021-09-08 12:18:11'),
(2389, 'en', 'Attach Your Passport Size Photo', 'Attach Your Passport Size Photo', '2021-09-09 15:47:48', '2021-09-09 15:47:48'),
(2390, 'en', 'Number', 'Number', '2021-09-10 16:09:52', '2021-09-10 16:09:52'),
(2391, 'en', 'All Applications Under ', 'All Applications Under ', '2021-09-10 16:14:48', '2021-09-10 16:14:48'),
(2392, 'en', 'Marital Status', 'Marital Status', '2021-09-10 16:24:23', '2021-09-10 16:24:23'),
(2393, 'en', 'Candidate Name', 'Candidate Name', '2021-09-10 16:35:42', '2021-09-10 16:35:42'),
(2394, 'en', 'Select Your Nationality', 'Select Your Nationality', '2021-09-10 18:44:44', '2021-09-10 18:44:44'),
(2395, 'en', 'Bangladeshi', 'Bangladeshi', '2021-09-10 18:45:08', '2021-09-10 18:45:08'),
(2396, 'en', 'Social', 'Social', '2021-09-10 19:50:53', '2021-09-10 19:50:53'),
(2397, 'en', 'Your present postal code', 'Your present postal code', '2021-09-10 20:00:16', '2021-09-10 20:00:16'),
(2398, 'en', 'Post Code:', 'Post Code:', '2021-09-10 20:01:52', '2021-09-10 20:01:52'),
(2399, 'en', 'Your Permanent postal code', 'Your Permanent postal code', '2021-09-10 20:01:52', '2021-09-10 20:01:52'),
(2400, 'en', 'These images are visible in your cv.', 'These images are visible in your cv.', '2021-09-10 20:05:01', '2021-09-10 20:05:01'),
(2401, 'en', 'Postal Code:', 'Postal Code:', '2021-09-10 20:33:56', '2021-09-10 20:33:56'),
(2402, 'en', 'Circuler has been Delated successfully', 'Circuler has been Delated successfully', '2021-09-11 06:17:38', '2021-09-11 06:17:38'),
(2403, 'en', 'Education', 'Education', '2021-09-11 16:59:47', '2021-09-11 16:59:47'),
(2404, 'en', 'Strip', 'Strip', '2021-09-20 23:50:38', '2021-09-20 23:50:38'),
(2405, 'en', 'Account Management', 'Account Management', '2021-09-20 23:50:59', '2021-09-20 23:50:59'),
(2406, 'en', 'Order Placed At', 'Order Placed At', '2021-09-20 23:51:05', '2021-09-20 23:51:05'),
(2407, 'en', 'You are assigned to delivery an order. Order code', 'You are assigned to delivery an order. Order code', '2021-09-21 00:06:40', '2021-09-21 00:06:40'),
(2408, 'en', 'Delivery Status Successfully Marked as Pickup', 'Delivery Status Successfully Marked as Pickup', '2021-09-21 00:13:21', '2021-09-21 00:13:21'),
(2409, 'en', 'Mark As On The Way', 'Mark As On The Way', '2021-09-21 00:13:24', '2021-09-21 00:13:24'),
(2410, 'en', 'Mark As Delivered', 'Mark As Delivered', '2021-09-21 00:13:30', '2021-09-21 00:13:30'),
(2411, 'en', 'Discount For Selected Company', 'Discount For Selected Company', '2021-09-21 00:14:35', '2021-09-21 00:14:35'),
(2412, 'en', 'Successfully Update Company.', 'Successfully Update Company.', '2021-09-21 00:18:16', '2021-09-21 00:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `id` int(2) UNSIGNED NOT NULL,
  `DistrictId` int(2) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `DistrictId`, `name`) VALUES
(1, 1, 'Demra'),
(2, 1, 'Aftabnagar'),
(3, 1, 'Dhamrai'),
(4, 1, 'Dhanmondi'),
(5, 1, 'Gulshan'),
(6, 1, 'Jatrabari'),
(7, 1, 'Joypara'),
(8, 1, 'Keraniganj'),
(9, 1, 'Khilgaon'),
(10, 1, 'Khilkhet'),
(11, 1, 'Lalbag'),
(12, 1, 'Mirpur'),
(13, 1, 'Mohammadpur'),
(14, 1, 'Motijheel'),
(15, 1, 'Nawabganj'),
(16, 1, 'New market'),
(17, 1, 'Palton'),
(18, 1, 'Ramna'),
(19, 1, 'Sabujbag'),
(20, 1, 'Savar'),
(21, 1, 'Sutrapur'),
(22, 1, 'Tejgaon'),
(23, 1, 'Tejgaon Industrial Area'),
(24, 1, 'Uttara'),
(25, 2, 'Bajitpur'),
(26, 2, 'Bhairob'),
(27, 2, 'Hossenpur'),
(28, 2, 'Itna'),
(29, 2, 'Karimganj'),
(30, 2, 'Katiadi'),
(31, 2, 'Kishoreganj Sadar'),
(32, 2, 'Kuliarchar'),
(33, 2, 'Mithamoin'),
(34, 2, 'Nikli'),
(35, 2, 'Ostagram'),
(36, 2, 'Pakundia'),
(37, 2, 'Tarial'),
(38, 3, 'Araihazar'),
(39, 3, 'Baidder Bazar'),
(40, 3, 'Bandar'),
(41, 3, 'Fatullah'),
(42, 3, 'Narayanganj Sadar'),
(43, 3, 'Rupganj'),
(44, 3, 'Siddirganj'),
(45, 4, 'Gajaria'),
(46, 4, 'Lohajong'),
(47, 4, 'Munshiganj Sadar'),
(48, 4, 'Sirajdikhan'),
(49, 4, 'Sreenagar'),
(50, 4, 'Tangibari'),
(51, 5, 'Belabo'),
(52, 5, 'Monohordi'),
(53, 5, 'Narsingdi Sadar'),
(54, 5, 'Palash'),
(55, 5, 'Raypura'),
(56, 5, 'Shibpur'),
(57, 6, 'Gazipur Sadar'),
(58, 6, 'Kaliakaar'),
(59, 6, 'Kaliganj'),
(60, 6, 'Kapashia'),
(61, 6, 'Monnunagar'),
(62, 6, 'Sreepur'),
(63, 6, 'Sripur'),
(64, 7, 'Baliakandi'),
(65, 7, 'Pangsha'),
(66, 7, 'Rajbari Sadar'),
(67, 8, 'Alfadanga'),
(68, 8, 'Bhanga'),
(69, 8, 'Boalmari'),
(70, 8, 'Charbhadrasan'),
(71, 8, 'Faridpur Sadar'),
(72, 8, 'Madukhali'),
(73, 8, 'Nagarkanda'),
(74, 8, 'Sadarpur'),
(75, 8, 'Shriangan'),
(76, 9, 'Barhamganj'),
(77, 9, 'kalkini'),
(78, 9, 'Madaripur Sadar'),
(79, 9, 'Rajoir'),
(80, 10, 'Bhedorganj'),
(81, 10, 'Damudhya'),
(82, 10, 'Gosairhat'),
(83, 10, 'Jajira'),
(84, 10, 'Naria'),
(85, 10, 'Shariatpur Sadar'),
(86, 11, 'Gopalganj Sadar'),
(87, 11, 'Kashiani'),
(88, 11, 'Kotalipara'),
(89, 11, 'Maksudpur'),
(90, 11, 'Tungipara'),
(91, 12, 'Doulatpur'),
(92, 12, 'Gheor'),
(93, 12, 'Lechhraganj'),
(94, 12, 'Manikganj Sadar'),
(95, 12, 'Saturia'),
(96, 12, 'Shibloya'),
(97, 12, 'Singari'),
(98, 13, 'Basail'),
(99, 13, 'Bhuapur'),
(100, 13, 'Delduar'),
(101, 13, 'Ghatail'),
(102, 13, 'Gopalpur'),
(103, 13, 'Kalihati'),
(104, 13, 'Kashkaolia'),
(105, 13, 'Madhupur'),
(106, 13, 'Mirzapur'),
(107, 13, 'Nagarpur'),
(108, 13, 'Sakhipur'),
(109, 13, 'Tangail Sadar'),
(110, 14, 'Alikadam'),
(111, 14, 'Naikhong'),
(112, 14, 'Roanchhari'),
(113, 14, 'Ruma'),
(114, 14, 'Thanchi'),
(115, 14, 'Bandarban Sadar'),
(116, 15, 'Akhaura'),
(117, 15, 'Banchharampur'),
(118, 15, 'Brahamanbaria Sadar'),
(119, 15, 'Kasba'),
(120, 15, 'Nabinagar'),
(121, 15, 'Nasirnagar'),
(122, 15, 'Sarail'),
(123, 16, 'Chandpur Sadar'),
(124, 16, 'Faridganj'),
(125, 16, 'Hajiganj'),
(126, 16, 'Hayemchar'),
(127, 16, 'Kachua'),
(128, 16, 'Matlobganj'),
(129, 16, 'Shahrasti'),
(130, 17, 'Anawara'),
(131, 17, 'Boalkhali'),
(132, 17, 'Chattogram Sadar'),
(133, 17, 'East Joara'),
(134, 17, 'Fatikchhari'),
(135, 17, 'Hathazari'),
(136, 17, 'Jaldi'),
(137, 17, 'Lohagara'),
(138, 17, 'Mirsharai'),
(139, 17, 'Patiya'),
(140, 17, 'Rangunia'),
(141, 17, 'Rouzan'),
(142, 17, 'Sandwip'),
(143, 17, 'Satkania'),
(144, 17, 'Sitakunda'),
(145, 18, 'Barura'),
(146, 18, 'Brahmanpara'),
(147, 18, 'Burichang'),
(148, 18, 'Chandina'),
(149, 18, 'Chouddagram'),
(150, 18, 'Comilla Sadar'),
(151, 18, 'Daudkandi'),
(152, 18, 'Davidhar'),
(153, 18, 'Homna'),
(154, 18, 'Laksam'),
(155, 18, 'Langalkot'),
(156, 18, 'Muradnagar'),
(157, 19, 'Chiringga'),
(158, 19, 'Coxs Bazar Sadar'),
(159, 19, 'Gorakghat'),
(160, 19, 'Kutubdia'),
(161, 19, 'Ramu'),
(162, 19, 'Teknaf'),
(163, 19, 'Ukhia'),
(164, 20, 'Chhagalnaia'),
(165, 20, 'Dagonbhuia'),
(166, 20, 'Feni Sadar'),
(167, 20, 'Pashurampur'),
(168, 20, 'Sonagazi'),
(169, 21, 'Basurhat'),
(170, 21, 'Begumganj'),
(171, 21, 'Chatkhil'),
(172, 21, 'Hatiya'),
(173, 21, 'Noakhali Sadar'),
(174, 21, 'Senbag'),
(175, 22, 'Diginala'),
(176, 22, 'Khagrachari Sadar'),
(177, 22, 'Laxmichhari'),
(178, 22, 'Mahalchhari'),
(179, 22, 'Manikchhari'),
(180, 22, 'Matiranga'),
(181, 22, 'Panchhari'),
(182, 22, 'Ramghar Head Office'),
(183, 23, 'Char Alexgander'),
(184, 23, 'Lakshimpur Sadar'),
(185, 23, 'Ramganj'),
(186, 23, 'Raypur'),
(187, 24, 'Barakal'),
(188, 24, 'Bilaichhari'),
(189, 24, 'Jarachhari'),
(190, 24, 'Kalampati'),
(191, 24, 'kaptai'),
(192, 24, 'Longachh'),
(193, 24, 'Marishya'),
(194, 24, 'Naniachhar'),
(195, 24, 'Rajsthali'),
(196, 24, 'Rangamati Sadar'),
(197, 25, 'Amtali'),
(198, 25, 'Bamna'),
(199, 25, 'Barguna Sadar'),
(200, 25, 'Betagi'),
(201, 25, 'Patharghata'),
(202, 26, 'Agailzhara'),
(203, 26, 'Babuganj'),
(204, 26, 'Barajalia'),
(205, 26, 'Barishal Sadar'),
(206, 26, 'Gouranadi'),
(207, 26, 'Mahendiganj'),
(208, 26, 'Muladi'),
(209, 26, 'Bakerganj'),
(210, 26, 'Uzirpur'),
(211, 27, 'Bhola Sadar'),
(212, 27, 'Borhanuddin UPO'),
(213, 27, 'Charfashion'),
(214, 27, 'Doulatkhan'),
(215, 27, 'Hajirhat'),
(216, 27, 'Hatshoshiganj'),
(217, 27, 'Lalmohan UPO'),
(218, 28, 'Jhalokati Sadar'),
(219, 28, 'Kathalia'),
(220, 28, 'Nalchhiti'),
(221, 28, 'Rajapur'),
(222, 29, 'Bauphal'),
(223, 29, 'Dashmina'),
(224, 29, 'Galachipa'),
(225, 29, 'Khepupara'),
(226, 29, 'Patuakhali Sadar'),
(227, 29, 'Subidkhali'),
(228, 30, 'Banaripara'),
(229, 30, 'Bhandaria'),
(230, 30, 'kaukhali'),
(231, 30, 'Mathbaria'),
(232, 30, 'Nazirpur'),
(233, 30, 'Pirojpur Sadar'),
(234, 30, 'Swarupkathi'),
(235, 31, 'Bagerhat Sadar'),
(236, 31, 'Chalna Ankorage'),
(237, 31, 'Chitalmari'),
(238, 31, 'Fakirhat'),
(239, 31, 'Kachua UPO'),
(240, 31, 'Mollahat'),
(241, 31, 'Morelganj'),
(242, 31, 'Rampal'),
(243, 31, 'Rayenda'),
(244, 32, 'Alamdanga'),
(245, 32, 'Chuadanga Sadar'),
(246, 32, 'Damurhuda'),
(247, 32, 'Doulatganj'),
(248, 33, 'Bagharpara'),
(249, 33, 'Chaugachha'),
(250, 33, 'Jashore Sadar'),
(251, 33, 'Jhikargachha'),
(252, 33, 'Keshabpur'),
(253, 33, 'Monirampur'),
(254, 33, 'Noapara'),
(255, 33, 'Sarsa'),
(256, 34, 'Harinakundu'),
(257, 34, 'Jhenaidah Sadar'),
(258, 34, 'Kotchandpur'),
(259, 34, 'Maheshpur'),
(260, 34, 'Naldanga'),
(261, 34, 'Shailakupa'),
(262, 35, 'Alaipur'),
(263, 35, 'Batiaghat'),
(264, 35, 'Chalna Bazar'),
(265, 35, 'Digalia'),
(266, 35, 'Khulna Sadar'),
(267, 35, 'Koyra'),
(268, 35, 'Paikgachha'),
(269, 35, 'Phultala'),
(270, 35, 'Sajiara'),
(271, 35, 'Terakhada'),
(272, 36, 'Bheramara'),
(273, 36, 'Janipur'),
(274, 36, 'Kumarkhali'),
(275, 36, 'Kushtia Sadar'),
(276, 36, 'Rafayetpur'),
(277, 37, 'Arpara'),
(278, 37, 'Magura Sadar'),
(279, 37, 'Shripur'),
(280, 38, 'Gangni'),
(281, 38, 'Meherpur Sadar'),
(282, 39, 'Kalia'),
(283, 39, 'Laxmipasha'),
(284, 39, 'Mohajan'),
(285, 39, 'Narail Sadar'),
(286, 40, 'Ashashuni'),
(287, 40, 'Debbhata'),
(288, 40, 'kalaroa'),
(289, 40, 'Kaliganj UPO'),
(290, 40, 'Nakipur'),
(291, 40, 'Satkhira Sadar'),
(292, 40, 'Taala'),
(293, 41, 'Dewangonj'),
(294, 41, 'Islampur'),
(295, 41, 'Jamalpur'),
(296, 41, 'Malandah'),
(297, 41, 'Madarganj'),
(298, 41, 'Shorishabari'),
(299, 42, 'Bhaluka'),
(300, 42, 'Fulbaria'),
(301, 42, 'Gaforgaon'),
(302, 42, 'Gouripur'),
(303, 42, 'Haluaghat'),
(304, 42, 'Isshwargonj'),
(305, 42, 'Muktagachha'),
(306, 42, 'Mymensingh Sadar'),
(307, 42, 'Nandail'),
(308, 42, 'Phulpur'),
(309, 42, 'Trishal'),
(310, 43, 'Susung Durgapur'),
(311, 43, 'Atpara'),
(312, 43, 'Barhatta'),
(313, 43, 'Dharmapasha'),
(314, 43, 'Dhobaura'),
(315, 43, 'Kalmakanda'),
(316, 43, 'Kendua'),
(317, 43, 'Khaliajuri'),
(318, 43, 'Madan'),
(319, 43, 'Moddhynagar'),
(320, 43, 'Mohanganj'),
(321, 43, 'Netrakona Sadar'),
(322, 43, 'Purbadhola'),
(323, 44, 'Bakshigonj'),
(324, 44, 'Jhinaigati'),
(325, 44, 'Nakla'),
(326, 44, 'Nalitabari'),
(327, 44, 'Sherpur Shadar'),
(328, 44, 'Shribardi'),
(329, 45, 'Adamdighi'),
(330, 45, 'Bogura Sadar'),
(331, 45, 'Dhunat'),
(332, 45, 'Dupchanchia'),
(333, 45, 'Dupchachia'),
(334, 45, 'Gabtoli'),
(335, 45, 'Kahalu'),
(336, 45, 'Nandigram'),
(337, 45, 'Sariakandi'),
(338, 45, 'Sherpur'),
(339, 45, 'Shibganj'),
(340, 45, 'Sonatola'),
(341, 46, 'Bholahat'),
(342, 46, 'Chapai Nawabganj Sadar'),
(343, 46, 'Nachol'),
(344, 46, 'Rohanpur'),
(345, 46, 'Shibganj U.P.O'),
(346, 47, 'Akkelpur'),
(347, 47, 'Joypurhat Sadar'),
(348, 47, 'kalai'),
(349, 47, 'Khetlal'),
(350, 47, 'panchbibi'),
(351, 48, 'Ahsanganj'),
(352, 48, 'Badalgachhi'),
(353, 48, 'Dhamuirhat'),
(354, 48, 'Mahadebpur'),
(355, 48, 'Naogaon Sadar'),
(356, 48, 'Niamatpur'),
(357, 48, 'Nitpur'),
(358, 48, 'Patnitala'),
(359, 48, 'Prasadpur'),
(360, 48, 'Raninagar'),
(361, 48, 'Sapahar'),
(362, 49, 'Gopalpur UPO'),
(363, 49, 'Harua'),
(364, 49, 'Hatgurudaspur'),
(365, 49, 'Laxman'),
(366, 49, 'Natore Sadar'),
(367, 49, 'Singra'),
(368, 50, 'Banwarinagar'),
(369, 50, 'Bera'),
(370, 50, 'Bhangura'),
(371, 50, 'Chatmohar'),
(372, 50, 'Debottar'),
(373, 50, 'Ishwardi'),
(374, 50, 'Pabna Sadar'),
(375, 50, 'Sathia'),
(376, 50, 'Sujanagar'),
(377, 51, 'Bagha'),
(378, 51, 'Bhabaniganj'),
(379, 51, 'Charghat'),
(380, 51, 'Durgapur'),
(381, 51, 'Godagari'),
(382, 51, 'Khod Mohanpur'),
(383, 51, 'Lalitganj'),
(384, 51, 'Putia'),
(385, 51, 'Rajshahi Sadar'),
(386, 51, 'Tanor'),
(387, 52, 'Baiddya Jam Toil'),
(388, 52, 'Belkuchi'),
(389, 52, 'Dhangora'),
(390, 52, 'Kazipur'),
(391, 52, 'Shahjadpur'),
(392, 52, 'Sirajganj Sadar'),
(393, 52, 'Tarash'),
(394, 52, 'Ullapara'),
(395, 53, 'Azmireeganj'),
(396, 53, 'Bahubal'),
(397, 53, 'Baniachang'),
(398, 53, 'Chunarughat'),
(399, 53, 'Habiganj Sadar'),
(400, 53, 'Kalauk'),
(401, 53, 'Madhabpur'),
(402, 53, 'Nabiganj'),
(403, 54, 'Baralekha'),
(404, 54, 'Kamalganj'),
(405, 54, 'Kulaura'),
(406, 54, 'Moulvibazar Sadar'),
(407, 54, 'Rajnagar'),
(408, 54, 'Srimangal'),
(409, 55, 'Bishamsarpur'),
(410, 55, 'Chhatak'),
(411, 55, 'Dhirai Chandpur'),
(412, 55, 'Duara bazar'),
(413, 55, 'Ghungiar'),
(414, 55, 'Jagnnathpur'),
(415, 55, 'Sachna'),
(416, 55, 'Sunamganj Sadar'),
(417, 55, 'Tahirpur'),
(418, 56, 'Balaganj'),
(419, 56, 'Bianibazar'),
(420, 56, 'Bishwanath'),
(421, 56, 'Fenchuganj'),
(422, 56, 'Goainhat'),
(423, 56, 'Gopalganj'),
(424, 56, 'Jaintapur'),
(425, 56, 'Jakiganj'),
(426, 56, 'Kanaighat'),
(427, 56, 'Kompanyganj'),
(428, 56, 'Sylhet Sadar'),
(429, 57, 'Bangla Hili'),
(430, 57, 'Biral'),
(431, 57, 'Birampur'),
(432, 57, 'Birganj'),
(433, 57, 'Chirirbandar'),
(434, 57, 'Dinajpur Sadar'),
(435, 57, 'Khansama'),
(436, 57, 'Maharajganj'),
(437, 57, 'Ghoraghat'),
(438, 57, 'Parbatipur'),
(439, 57, 'Phulbari'),
(440, 57, 'Setabganj'),
(441, 58, 'Bonarpara'),
(442, 58, 'Gaibandha Sadar'),
(443, 58, 'Gobindaganj'),
(444, 58, 'Palashbari'),
(445, 58, 'Phulchhari'),
(446, 58, 'Saadullapur'),
(447, 58, 'Sundarganj'),
(448, 59, 'Bhurungamari'),
(449, 59, 'Chilmari'),
(450, 59, 'Kurigram Sadar'),
(451, 59, 'Nageshwar'),
(452, 59, 'Rajarhat'),
(453, 59, 'Rajibpur'),
(454, 59, 'Roumari'),
(455, 59, 'Ulipur'),
(456, 60, 'Aditmari'),
(457, 60, 'Hatibandha'),
(458, 60, 'Lalmonirhat Sadar'),
(459, 60, 'Patgram'),
(460, 60, 'Tushbhandar'),
(461, 61, 'Dimla'),
(462, 61, 'Domar'),
(463, 61, 'JalDhaka'),
(464, 61, 'Kishoriganj'),
(465, 61, 'Nilphamari Sadar'),
(466, 61, 'Saidpur'),
(467, 62, 'Taraganj'),
(468, 62, 'Badarganj-1'),
(469, 62, 'Gangachara'),
(470, 62, 'Kaunia'),
(471, 62, 'Mithapukur'),
(472, 62, 'Pirgachha'),
(473, 62, 'Rangpur Sadar'),
(474, 62, 'Badarganj'),
(475, 62, 'Pirganj'),
(476, 63, 'Baliadangi'),
(477, 63, 'Jibanpur'),
(478, 63, 'Rani Sankail'),
(479, 63, 'Thakurgaon Sadar'),
(480, 64, 'Boda'),
(481, 64, 'Chotto Dab'),
(482, 64, 'Dabiganj'),
(483, 64, 'Panchagra Sadar'),
(484, 64, 'Tetulia'),
(485, 36, 'Mirpur'),
(486, 37, 'Mohammadpur'),
(487, 63, 'Pirganj'),
(488, 57, 'Nawabganj'),
(489, 18, 'Burichang'),
(490, 2, 'Homna '),
(491, 2, 'Titas '),
(492, 2, 'Baghaichhari '),
(493, 2, 'Baghaichhari ');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Em+Ed+logo', 'uploads/all/ORfAEpPbndJbgiUedq6tY1AqoWYmBpKd2oPnG3JM.png', 9, 35233, 'png', 'image', '2021-06-26 11:21:32', '2021-06-26 11:21:32', NULL),
(2, 'logobbb', 'uploads/all/QxFqcnRBSGp4fi5fKAoQXgwSvfk5wMnCnkE1iM6t.png', 9, 9727, 'png', 'image', '2021-07-08 02:06:51', '2021-07-08 02:06:51', NULL),
(3, 'image', 'uploads/all/P2kawgg4V9vGqsytjn8GaWEfSMf0C89Vk4UOgKqI.png', 9, 2743, 'png', 'image', '2021-07-08 02:09:28', '2021-07-08 02:09:28', NULL),
(4, '173505797_1238457253223376_4746711105367110985_n', 'uploads/all/NlGQ6NgZvbakAEe6KOWrqiwChUH1cRzYXt0zOF86.jpg', 8, 40216, 'jpg', 'image', '2021-07-09 16:58:17', '2021-07-09 16:58:17', NULL),
(5, 'capsule', 'uploads/all/h2FDkfXaOamFiIukzJCUJeK9V0C1y9OxPrlf4pnu.png', 9, 1997, 'png', 'image', '2021-07-11 00:50:16', '2021-07-11 00:50:16', NULL),
(6, 'syrup-2', 'uploads/all/UuPORV1iNdpkOMvjjDUMLttp5SghMvTlTdi4egec.png', 9, 4163, 'png', 'image', '2021-07-11 01:51:29', '2021-07-11 01:51:29', NULL),
(7, 'IMG20200809124406', 'uploads/all/Jy7fCTZB4mQWm6xwGX7glqcVp2yGc7QykVQBhL9P.jpg', 8, 267145, 'jpg', 'image', '2021-07-13 09:37:12', '2021-07-13 09:37:12', NULL),
(8, 'BeautyPlusMe_20181113134922_fast', 'uploads/all/oE6d040bmo2QaoMcEjTb6De5xDmYEB2yW4QaeAR5.jpg', 9, 107384, 'jpg', 'image', '2021-07-13 10:36:15', '2021-07-13 10:36:15', NULL),
(9, 'image', 'uploads/all/8STtlNW9gW3bp7DGFBEN2s2V9D2bwvmKoD0e7Dpf.png', 9, 507184, 'png', 'image', '2021-07-14 09:29:03', '2021-07-14 09:29:03', NULL),
(10, 'image', 'uploads/all/XRyW08ynqy17ghwjOUFa3eB6uWdQdLa3yD0fzWK2.png', 9, 178850, 'png', 'image', '2021-07-14 09:29:18', '2021-07-14 09:29:18', NULL),
(11, '201494595_154203533368039_1429170402422780339_n', 'uploads/all/tVXwh1a7C9c3F7F8ATJI3epiXF30MzKAgBVhdtI6.jpg', 11, 12028, 'jpg', 'image', '2021-07-28 20:31:10', '2021-07-28 20:31:10', NULL),
(12, '195279224_220993159851194_7837291326671902878_n', 'uploads/all/opbGmUXhiDqJVvahTPQ0fHavnJsgH4ZihJAa4bEA.jpg', 8, 64893, 'jpg', 'image', '2021-07-28 22:16:55', '2021-07-28 22:16:55', NULL),
(13, '213479502_515292186466871_4434236035742611968_n', 'uploads/all/W9fRlsDzJ3mJayf6z6IwtJ80KIkztq7mW7xRYcdF.jpg', 12, 75808, 'jpg', 'image', '2021-07-28 23:02:15', '2021-07-28 23:02:15', NULL),
(14, 'tarek (2)', 'uploads/all/RbEUXCeCsumCpSkqeGCHaejuoeNZHlvV0F0hs33g.jpg', 8, 75907, 'jpg', 'image', '2021-07-29 12:34:44', '2021-07-29 12:34:44', NULL),
(15, 'image', 'uploads/all/oZNgSWgvtraj5SRXPzJyQ5uCyMAkkznRWtSfePmC.png', 9, 4177, 'png', 'image', '2021-07-29 14:48:58', '2021-07-29 14:48:58', NULL),
(16, 'image', 'uploads/all/xlEHddX5t9CzILFJshxONehYV71kbQgyJ1DSOC2H.png', 9, 42513, 'png', 'image', '2021-07-29 15:15:44', '2021-07-29 15:15:44', NULL),
(17, 'monas 5', 'uploads/all/R80nBGW9dnU3JK0w0D1mMX8x92i34eoefxTIb9Xi.jpg', 9, 42823, 'jpg', 'image', '2021-07-29 15:17:21', '2021-07-29 15:17:21', NULL),
(18, 'image', 'uploads/all/VrAgjY50zp1VTvJxImCYxjTklo3O3kdkYi31pARX.png', 8, 346720, 'png', 'image', '2021-07-29 16:09:11', '2021-07-29 16:09:11', NULL),
(19, 'injection', 'uploads/all/LN33fee2TrYMyRv8greaUqUa86A9wPJBF0Yeix5R.jpg', 9, 19409, 'jpg', 'image', '2021-07-31 16:01:09', '2021-07-31 16:01:09', NULL),
(20, 'injection', 'uploads/all/vJdIDOXSwWuEZ2NS7bHlrnd9Cudm6Qrr2t5WU7o9.png', 9, 28386, 'png', 'image', '2021-07-31 16:18:12', '2021-07-31 16:18:12', NULL),
(21, 'henna', 'uploads/all/4s9uCyi689IU9sJhZwQezQJ8PIeVEhlFijCzykag.jpg', 9, 91268, 'jpg', 'image', '2021-08-03 18:57:39', '2021-08-03 18:57:39', NULL),
(22, '207680774_524466605412163_3276182182177097860_n', 'uploads/all/XLqiNVKjECk28rqvbgPTaoMRj7tyjUufWeaiZKWU.jpg', 8, 156483, 'jpg', 'image', '2021-08-05 19:14:32', '2021-08-25 20:51:37', '2021-08-25 20:51:37'),
(23, '132043947_413399763185515_34093595081080057_n', 'uploads/all/cqyx8lpiMcyaWroZg9hUyxCxudDCdcSNPGtZr3tr.jpg', 8, 41340, 'jpg', 'image', '2021-08-05 20:19:11', '2021-08-05 20:19:11', NULL),
(24, 'coronavirus_symbolic_30_4_21_collected', 'uploads/all/D7tJznl4LhK743E2FAeGnSLSEoK4FTwKmeEKSnMz.jpg', 8, 65468, 'jpg', 'image', '2021-08-05 20:27:29', '2021-08-05 20:27:29', NULL),
(25, 'image', 'uploads/all/b4SpBW0ntym85rDmagrPjCEBnCKPLihPkqY6wsNT.png', 9, 93609, 'png', 'image', '2021-08-05 22:27:23', '2021-08-05 22:27:23', NULL),
(26, 'image', 'uploads/all/OGMLWET6ORwzdwXPy9UxvzQ4SaJQlwyvR6YYOMKy.png', 9, 93413, 'png', 'image', '2021-08-05 22:27:46', '2021-08-05 22:27:46', NULL),
(27, '126867258_393870118471813_8927175389184721337_n', 'uploads/all/FmFC1aDU1f9nVsdV30XwoIYnwbMZMxNe7lipScMj.jpg', 8, 57280, 'jpg', 'image', '2021-08-06 18:21:40', '2021-08-06 18:21:40', NULL),
(28, 'image', 'uploads/all/QXlj8f6gEThz3BjiHr2p5YBfrzk3h95vlgb2zpCJ.png', 9, 40827, 'png', 'image', '2021-08-07 01:35:52', '2021-08-07 01:35:52', NULL),
(29, 'istockphoto-1147787504-612x612', 'uploads/all/G4L5R17wQRQyaow8FmSRfydfU1lJKe4OCvjU3ndy.jpg', 9, 29366, 'jpg', 'image', '2021-08-20 07:28:18', '2021-08-20 07:28:18', NULL),
(30, '0a0e90507c591ccee4f295d01d36417d', 'uploads/all/S9OYAr9AGQri033EaUIkwN0KvvLkfQzYzKgnUy05.jpg', 9, 42650, 'jpg', 'image', '2021-08-20 07:31:40', '2021-08-20 07:31:40', NULL),
(31, 'cvs-health-pbm-prescription-drug-coverage-1-16x9', 'uploads/all/E5Xv4CyaAro4htzvrZEov3jGymCi4fo7ySBtLCt6.jpg', 9, 121320, 'jpg', 'image', '2021-08-20 07:34:11', '2021-08-20 07:34:11', NULL),
(32, 'lab4aug-2', 'uploads/all/8jG0gbvtFpA0vstXSP4JEitkQtEu4wW7mzjLbnus.jpg', 9, 73961, 'jpg', 'image', '2021-08-20 07:36:12', '2021-08-20 07:36:12', NULL),
(33, '95132236_2770054336440504_458789570494857216_n', 'uploads/all/FL0JsqNwg3whAg1QRiMmcwBMY9CQ3rRhr2eutLjQ.jpg', 9, 53940, 'jpg', 'image', '2021-08-20 07:39:30', '2021-08-20 07:39:30', NULL),
(34, 'preview', 'uploads/all/ao7hggvKk4zB4QrKUTZpKhDAamdeSLvP3K27ISrR.jpg', 9, 36022, 'jpg', 'image', '2021-08-20 16:03:58', '2021-08-20 16:03:58', NULL),
(35, 'healthcare', 'uploads/all/ZltL4oqUav0ACs56saCZuOmmZQ5eQGmPdFkxzUxD.jpg', 9, 94694, 'jpg', 'image', '2021-08-20 16:03:58', '2021-08-20 16:03:58', NULL),
(36, 'image', 'uploads/all/VpRpxI91dU8VppU0t7Gzcosz1FofWFVReyDSkDtT.png', 9, 91418, 'png', 'image', '2021-08-21 09:59:02', '2021-08-21 09:59:02', NULL),
(37, 'slide 3', 'uploads/all/GMDn7YHN6X66C7VfV5UrBCchlG3Gj5UsDCFZoUmI.jpg', 9, 64452, 'jpg', 'image', '2021-08-21 10:12:44', '2021-08-21 10:12:44', NULL),
(38, 'slide 4', 'uploads/all/byub46z5NAt9GdAHTwwOyPVlxhVnnmFdys7BEGaL.jpg', 9, 68232, 'jpg', 'image', '2021-08-21 10:15:10', '2021-08-21 10:15:10', NULL),
(39, 'aks', 'uploads/all/gMnxwLXnjEad7TNW84pwfXa8UtLJPvTtTzqw3Sk8.jpg', 9, 69301, 'jpg', 'image', '2021-08-21 10:20:50', '2021-08-21 10:20:50', NULL),
(40, 'cancer', 'uploads/all/NN9YmqNm376e5ysKy65Rs6ufK28JJHhvf6EEqtKO.jpg', 9, 219266, 'jpg', 'image', '2021-08-21 10:22:18', '2021-08-21 10:22:18', NULL),
(41, 'dr', 'uploads/all/bNEJbRdquoWcjhWETFJgXZBR5MgG4JLZpE3e80fH.jpg', 9, 179303, 'jpg', 'image', '2021-08-21 10:25:47', '2021-08-21 10:25:47', NULL),
(42, 'pluse', 'uploads/all/kJJWCSFi4nXKwmWAnHYasXExNt1wTDpBndH3IM4G.jpg', 9, 111495, 'jpg', 'image', '2021-08-21 10:28:22', '2021-08-21 10:28:22', NULL),
(43, 'image', 'uploads/all/a4mELshl2Gywu8IRsf8j1B2axCmkZcXMAPlJb5H7.png', 9, 2017, 'png', 'image', '2021-08-23 20:55:44', '2021-08-23 20:55:44', NULL),
(44, 'image', 'uploads/all/UrV7QUAZRHuyR93IXvAMLwQb18JgEbuTmUFCzhZq.png', 9, 63631, 'png', 'image', '2021-08-23 23:25:55', '2021-08-23 23:25:55', NULL),
(45, '207680774_524466605412163_3276182182177097860_n', 'uploads/all/rPrYAkg6YQ2vD8SbrncormtEPbGl4a09vSOD1PAk.jpg', 8, 156483, 'jpg', 'image', '2021-08-25 19:24:16', '2021-08-25 19:24:16', NULL),
(46, 'ACE-125-MG-SUPPO-1611378703404', 'uploads/all/Q9HPFvCGAQaHuRKJxSdqB2iMXhvWYCfmysIZY0x1.webp', 9, 39504, 'webp', 'image', '2021-08-25 20:52:02', '2021-08-25 20:52:02', NULL),
(47, 'image', 'uploads/all/Dj7YZE8BTA7EbNmTsgVD7SAVTopI4B15VeN2qlNC.png', 9, 109285, 'png', 'image', '2021-08-26 16:24:32', '2021-08-26 16:24:32', NULL),
(48, 'image', 'uploads/all/7bnfyilhbVDLh8gx3Atz9HRxEKZp2nmCEvWlmBGn.png', 9, 173293, 'png', 'image', '2021-08-26 16:26:59', '2021-08-26 16:26:59', NULL),
(49, 'image', 'uploads/all/oAnFwUjNZvRT0dWbL4pPa3U6dmEkBvHHGhRIyFMV.png', 9, 189853, 'png', 'image', '2021-08-26 16:28:47', '2021-08-26 16:28:47', NULL),
(50, 'image', 'uploads/all/zQgAvv1lpj2ki6c00ZGVrzQD5MDR3cgUrYFWlHrE.png', 9, 153985, 'png', 'image', '2021-08-26 16:30:23', '2021-08-26 16:30:23', NULL),
(51, 'image', 'uploads/all/F7jyQbN4hgrWJQh4bRKJPdCOv2nDH3nMP4HSexAb.png', 9, 153985, 'png', 'image', '2021-08-26 16:31:50', '2021-08-26 16:31:50', NULL),
(52, 'image', 'uploads/all/E0rJ44SLEH75HkWIsISXaEmOSlGzPBpbruLD16aX.png', 9, 272562, 'png', 'image', '2021-08-26 16:32:21', '2021-08-26 16:32:21', NULL),
(53, 'image', 'uploads/all/H4Jn6PiKLhRrprTo8w7GMrovjIkaWOQlp68fu15F.png', 9, 124364, 'png', 'image', '2021-08-26 16:35:26', '2021-08-26 16:35:26', NULL),
(54, 'image', 'uploads/all/CVFiJscGZ6R2YJRi4PPQ77J1sXBjF5HeUHgsFBal.png', 9, 273075, 'png', 'image', '2021-08-26 20:42:27', '2021-08-26 20:42:27', NULL),
(55, 'image', 'uploads/all/PArOPKMEtGvZGIHkbOj0RGTSxUHC2RFF47aNYVzy.png', 3, 63433, 'png', 'image', '2021-08-28 16:00:01', '2021-08-28 16:00:01', NULL),
(56, 'image', 'uploads/all/jmgQkT3wI6NgbpZ8HsYUxb7oc3IoS7D57F0vLLVb.png', 3, 837414, 'png', 'image', '2021-08-28 16:04:31', '2021-08-28 16:04:31', NULL),
(57, 'image', 'uploads/all/TrkK3Es5IzyzteJgtG7qAduvuGgBOXWZLAfURoEx.png', 9, 69011, 'png', 'image', '2021-08-29 00:21:05', '2021-08-29 00:21:05', NULL),
(58, 'image', 'uploads/all/cjKMF9NBUdPris8QRg9PVqOi9N3mF5sEcDaq0210.png', 9, 3975, 'png', 'image', '2021-08-29 00:40:05', '2021-08-29 00:40:05', NULL),
(59, 'image', 'uploads/all/hfyvAunmqok0LAnELjLYj63JNahiX45Pqdl2aDTl.png', 9, 4576, 'png', 'image', '2021-08-29 00:40:48', '2021-08-29 00:40:48', NULL),
(60, 'image', 'uploads/all/Nt50ZOXrBRe0tIeg4dHuQC6W7wRKr5ttTad4Ir06.png', 9, 19394, 'png', 'image', '2021-08-29 00:41:12', '2021-08-29 00:41:12', NULL),
(61, 'image', 'uploads/all/MGhlWn7K3Sa1SyPyQfGbl6jytYlFWefVfro1Q4sj.png', 9, 19394, 'png', 'image', '2021-08-29 00:41:12', '2021-08-29 00:41:12', NULL),
(62, 'image', 'uploads/all/8Avtfnq8f7QjqoGrHbZtNydXejrGvlSLGErnhgyJ.png', 9, 36646, 'png', 'image', '2021-08-29 00:42:20', '2021-08-29 00:42:20', NULL),
(63, 'image', 'uploads/all/ekOu7FAUhc05vPJIaIaoNRLWIQZwUMS9ZgPLVx5P.png', 9, 36646, 'png', 'image', '2021-08-29 00:42:20', '2021-08-29 00:42:20', NULL),
(64, 'image', 'uploads/all/cRjIhQnUmR7P7ncAFpLcAnsrzpiH7h1YQBf0Wspa.png', 9, 57644, 'png', 'image', '2021-08-29 00:43:00', '2021-08-29 00:43:00', NULL),
(65, 'image', 'uploads/all/obYdAzg9EsueAtm2jwUq72LiMYXCZjcZiHPcNKC0.png', 9, 256570, 'png', 'image', '2021-08-29 02:05:51', '2021-08-29 02:05:51', NULL),
(66, 'image', 'uploads/all/J1XNX5M2vLZSGPPVNy1RzaaMODodaopGeqjxFsRH.png', 9, 307614, 'png', 'image', '2021-08-29 02:10:19', '2021-08-29 02:10:19', NULL),
(67, 'image', 'uploads/all/yRMeK3US87z08zBPJqX8rany44QSMpdoboD09dI0.png', 9, 173293, 'png', 'image', '2021-09-09 17:54:17', '2021-09-09 17:54:17', NULL),
(68, 'image', 'uploads/all/pJXYgJfdEsaIWPuLehbdAnKSgHlT8vmHO0wPTSOl.png', 9, 309221, 'png', 'image', '2021-09-10 18:09:58', '2021-09-10 18:09:58', NULL),
(69, 'image', 'uploads/all/hIq5O4I09k0R3Ci8cCPEZLrloeEvYG3e1QwEfv3c.png', 9, 480950, 'png', 'image', '2021-09-10 18:11:48', '2021-09-10 18:11:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `doctor_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `depertment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(5) DEFAULT NULL,
  `doctor_code` int(250) DEFAULT NULL,
  `consultation_time` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `follow_up_fee` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `availvility` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_id` int(250) DEFAULT NULL,
  `specialty` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chember` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `chember_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualifications` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bmdc_number` int(250) DEFAULT NULL,
  `consultution_fee` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `messenger_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#2180f3',
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `active_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `gender`, `doctor_description`, `depertment`, `rating`, `doctor_code`, `consultation_time`, `follow_up_fee`, `availvility`, `experience`, `working_id`, `specialty`, `chember`, `chember_address`, `qualifications`, `bmdc_number`, `consultution_fee`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`, `messenger_color`, `dark_mode`, `active_status`) VALUES
(2, NULL, NULL, 'customer', 'no action taken', 'kjhwbjefgqjkwegkfbwkejftguwkegjuhyg@gmail.com', 0, NULL, 'Surgeon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-11 18:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', 'eJCqYj3InnwR7tlqRmpbuQwDeNhPKQDCUrexeyDSEuXKdiqOlx5UEzv99eHL', '38210f70-152d-4c07-9cad-5c9bc9de148d.jpg', '7', NULL, NULL, NULL, NULL, '01635354223', 0.00, 0, '8zJTyXTlTT', NULL, NULL, '2018-10-07 04:42:57', '2021-07-16 05:24:43', '#3F51B5', 1, 1),
(3, NULL, NULL, 'seller', 'Mr. Seller', 'seller@example.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-11 18:00:00', NULL, 'SVgcbxIXsQ5XrCAgsGMIWt9OAFtWiOYU', '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', 'TnIQRCaWj9ldD21tjcosyYHtcvEjn0UAA54lOJVuRMcGTwPMf4Yfy3h2OX0k', '', NULL, 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, '3dLUoHsR1l', NULL, NULL, '2018-10-07 04:42:57', '2021-08-23 16:24:06', '#2180f3', 0, 0),
(8, NULL, NULL, 'customer', 'Mr. Customer', 'mahtabakon01@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-11 18:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', 'S6SkrOEzzrCVufJutP2IjVvEngjJxicXjSdMs9TKCNj2YA7d2uYUGVZGmFss', '38210f70-152d-4c07-9cad-5c9bc9de148d.jpg', '44', NULL, NULL, NULL, NULL, '01635354223', 0.00, 0, '8zJTyXTlTT', NULL, NULL, '2018-10-07 04:42:57', '2021-08-30 23:56:22', '#3F51B5', 1, 0),
(9, NULL, NULL, 'admin', 'Admin', 'admin@admin.com', 0, 'admin\\', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 01:06:47', NULL, NULL, '$2y$10$ZCU5TcGwZw7HN9VRGbnBqOlAwqeE39dJ0DuL0.thLzyxX86BUaI9W', NULL, '8fd8c251-adfe-494e-a435-03027a8c520e.png', '8', NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-06-26 01:15:47', '2021-08-13 15:30:55', '#00BCD4', 1, 1),
(15, NULL, NULL, 'staff', 'Tanisa Mehjabin', 'tanisa_mehjabin@gmil.com', 1, 'pak pak pak pak pak pak pap ', 'Surgeon', 5, 0, '15 Min', '500', 'Time Period', 'Seven Years', 0, 'Medicine, Neuro Surgeon', 'Future Academy', 'Demra, Dhaka', 'MBBS, FCPS Medicine Part 1', 0, '800', NULL, NULL, NULL, '$2y$10$cCpJzfgHs/ii2hUJv5kEGunNqhAAf2TrHcJloFuLVVR8nEeuQaHvu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01779988497', 0.00, 0, NULL, NULL, 0, '2021-08-03 14:34:17', '2021-09-01 08:41:14', '#2180f3', 0, 0),
(20, NULL, NULL, 'staff', 'Dr. Aarti Kabra', 'Dr.Aarti@admin.com', 1, '<p style=\"box-sizing: border-box; line-height: 1.4; font-family: latoregular, Helvetica, Arial, sans-serif; font-weight: 500; color: #334562; margin-top: 20px; margin-bottom: 10px; font-size: 30px; background-color: #ffffff; outline: none !important;\"><span style=\"font-size: 14pt;\"><strong>Fields of Expertise</strong></span></p>\r\n<ul style=\"box-sizing: border-box; line-height: 1.4; margin-top: 0px; margin-bottom: 10px; color: #4c5f6d; font-family: latoregular, Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">\r\n<li style=\"box-sizing: border-box; line-height: 1.8; outline: none !important;\">Critical Care</li>\r\n<li style=\"box-sizing: border-box; line-height: 1.8; outline: none !important;\">Perioperative care</li>\r\n<li style=\"box-sizing: border-box; line-height: 1.8; outline: none !important;\">Liver Transplant in Anaesthesia</li>\r\n</ul>\r\n<h2 style=\"box-sizing: border-box; line-height: 1.4; font-family: latoregular, Helvetica, Arial, sans-serif; font-weight: 500; color: #334562; margin-top: 20px; margin-bottom: 10px; font-size: 30px; background-color: #ffffff; outline: none !important;\"><span style=\"font-size: 14pt;\">Professional Memberships&amp; Certifications</span></h2>\r\n<ul style=\"box-sizing: border-box; line-height: 1.4; margin-top: 0px; margin-bottom: 10px; color: #4c5f6d; font-family: latoregular, Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">\r\n<li style=\"box-sizing: border-box; line-height: 1.8; outline: none !important;\">Indian Society of Anaesthesia</li>\r\n<li style=\"box-sizing: border-box; line-height: 1.8; outline: none !important;\">Indian society of Critical care medicine</li>\r\n</ul>\r\n<h2 style=\"box-sizing: border-box; line-height: 1.4; font-family: latoregular, Helvetica, Arial, sans-serif; font-weight: 500; color: #334562; margin-top: 20px; margin-bottom: 10px; font-size: 30px; background-color: #ffffff; outline: none !important;\"><span style=\"font-size: 14pt;\">Publications</span></h2>\r\n<p style=\"box-sizing: border-box; line-height: 1.8; margin: 0px 0px 10px; color: #4c5f6d; font-family: latoregular, Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">Indian J Anesth 2015;59:814-5:Brief Communication-Peripherally inserted central venous catheter line removal leading to brachial vein stripping-need for more caytion</p>\r\n<h2 style=\"box-sizing: border-box; line-height: 1.4; font-family: latoregular, Helvetica, Arial, sans-serif; font-weight: 500; color: #334562; margin-top: 20px; margin-bottom: 10px; font-size: 30px; background-color: #ffffff; outline: none !important;\"><span style=\"font-size: 14pt;\">Languages Spoken</span></h2>\r\n<p style=\"box-sizing: border-box; line-height: 1.8; margin: 0px 0px 10px; color: #4c5f6d; font-family: latoregular, Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; outline: none !important;\">Hindi, English and Marathi</p>', 'Consultant - Anaesthesia & Critical Care', NULL, 0, '15 Min', '500', 'One Day in a week', '5 Years', 0, NULL, NULL, NULL, 'DNB(Anaesthesia), Clinical Fellowship in cardiothoracic Intensive Unit', 458247, '900', NULL, NULL, NULL, '$2y$10$h4sNlrOc8M55ERVBZtTLfejRlzF/LIn8yhBSr6sqIclTg87WkcaAu', NULL, NULL, '44', NULL, NULL, NULL, NULL, '01777049429', 0.00, 0, NULL, NULL, 0, '2021-08-23 23:38:31', '2021-08-23 23:38:31', '#2180f3', 0, 0),
(22, NULL, NULL, 'delivery_boy', 'boy', 'boy@admin.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-27 17:11:47', NULL, NULL, '$2y$10$q8tzptZe8m4LEREI/KoBKudDxdrjYM2ZuKPL2wP1NkVE8H9z7twMC', NULL, NULL, NULL, 'kalihati tangail', 'Bangladesh', 'Dhaka', NULL, '01715153033', 0.00, 0, NULL, NULL, 0, '2021-08-27 17:11:47', '2021-08-27 17:11:47', '#2180f3', 0, 0),
(23, NULL, NULL, 'lab_user', 'Mr. Lab User', 'lab@example.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-11 18:00:00', NULL, 'SVgcbxIXsQ5XrCAgsGMIWt9OAFtWiOYU', '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', 'Hcfr1v9ToGrh3c1RUNC7eWoMM27kOxtO3HCqlC2L9uFTWU6D5BhqjF6OIl29', '', NULL, 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, '3dLUoHsR1l', NULL, NULL, '2018-10-07 04:42:57', '2021-08-23 16:24:06', '#2180f3', 0, 0),
(24, NULL, NULL, 'customer', 'MD. ASRAFUZZAMAN MAHTAF', 'asraf@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IkUwU0tMQ290Uk1TV2kxQmpXMTFrVGc9PSIsInZhbHVlIjoiVWVITFpmcEdqakdGYUs3eEVNb0VXdz09IiwibWFjIjoiNzJkNWM1NmE4MDRkMDJiZmE3MGVjNjRkMDAxMDA2MTFjZjMyOTMzODgxMDU0YTVkNDA3Yzk2ZDI2YWRhY2RlMSJ9', NULL, '$2y$10$U116CwIpRa50NunKG43QSOYCdBMlPeeF9wZzwrZeEoO5Dp7gpG3v2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-09-01 03:10:28', '2021-09-01 03:10:53', '#2180f3', 0, 0),
(25, NULL, NULL, 'customer', 'MD. ASRAFUZZAMAN MAHTAF', 'mehidy.gb@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-08 11:46:54', 'eyJpdiI6IkJrTFp2R0w1dWJXbXREK002RUp4bXc9PSIsInZhbHVlIjoiTkttV3Y2Z0ZubmVkUlRUVFBRK1wvTVE9PSIsIm1hYyI6ImQ2ZDdhMWI4Y2Q3ZGFhODgzMTY2MmQ1MWYwYTE0MGRiODIxYzNmOTBiNWU5MTUxYzRhMWQ3ZGI1ZjMwYjhmZTkifQ==', NULL, '$2y$10$9yJo.4nCXh114WpBpW7aU.Hm21V1fj6ixAlM67/fGPfH0lHQrUW0.', 'MyvjZyG4Npa6jtjUo4nXPqJGnmhDQVaI3cQ3aRUM6X2w3vHwQm3aNfTxC2qN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-09-08 11:45:01', '2021-09-08 11:46:54', '#2180f3', 0, 0),
(27, NULL, NULL, 'delivery_boy', 'SDVBwgvW', 'admin@admin.co', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-21 00:01:22', NULL, NULL, '$2y$10$ZdgFlm.uVAXUYF5LR1eF/.osp9fip/XETWySl9F6zWDLXqEGgt.IG', NULL, NULL, NULL, 'East Boxnagor, Sarulia, Demra, Dhaka-1361', 'Bangladesh', NULL, NULL, '01777049429', 0.00, 0, NULL, NULL, 0, '2021-09-21 00:01:23', '2021-09-21 00:01:23', '#2180f3', 0, 0),
(28, NULL, NULL, 'delivery_boy', 'SobuZ', 'sobuz@admin.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-21 00:08:35', NULL, NULL, '$2y$10$lp8gIygfSjsJvkatNoIwXugxJFmjgYNEL5C7Gdzs2JyuwTShB.dLW', NULL, NULL, NULL, 'East Boxnagor, Sarulia, Demra, Dhaka-1361', 'Bangladesh', 'Dhaka', NULL, '01777049429', 0.00, 0, NULL, NULL, 0, '2021-09-21 00:08:35', '2021-09-21 00:08:35', '#2180f3', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval` int(1) NOT NULL DEFAULT 0,
  `offline_payment` int(1) NOT NULL DEFAULT 0,
  `reciept` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 12, 22, '2021-08-20 07:49:24', '2021-08-20 07:49:24'),
(3, 12, 6, '2021-08-20 07:49:29', '2021-08-20 07:49:29'),
(4, 12, 7, '2021-08-20 07:49:33', '2021-08-20 07:49:33'),
(5, 12, 13, '2021-08-20 07:49:36', '2021-08-20 07:49:36'),
(6, 12, 20, '2021-08-20 07:49:42', '2021-08-20 07:49:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_stats`
--
ALTER TABLE `affiliate_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_histories`
--
ALTER TABLE `commission_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_packages`
--
ALTER TABLE `customer_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `division_id` (`DivisionId`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generics`
--
ALTER TABLE `generics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jobs_id_unique` (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_applications_id_unique` (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_locations`
--
ALTER TABLE `job_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `minor_group_ids`
--
ALTER TABLE `minor_group_ids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postoffices`
--
ALTER TABLE `postoffices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `tags` (`tags`(255));

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proxypay_payments`
--
ALTER TABLE `proxypay_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `seller_company_based_discounts`
--
ALTER TABLE `seller_company_based_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_packages`
--
ALTER TABLE `seller_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_products`
--
ALTER TABLE `seller_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_stocks`
--
ALTER TABLE `seller_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upazila_id` (`DistrictId`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliate_stats`
--
ALTER TABLE `affiliate_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `commission_histories`
--
ALTER TABLE `commission_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_packages`
--
ALTER TABLE `customer_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `generics`
--
ALTER TABLE `generics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82774367474077530;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `job_locations`
--
ALTER TABLE `job_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `minor_group_ids`
--
ALTER TABLE `minor_group_ids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `postoffices`
--
ALTER TABLE `postoffices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `proxypay_payments`
--
ALTER TABLE `proxypay_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_company_based_discounts`
--
ALTER TABLE `seller_company_based_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `seller_packages`
--
ALTER TABLE `seller_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_products`
--
ALTER TABLE `seller_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `seller_stocks`
--
ALTER TABLE `seller_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2413;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
