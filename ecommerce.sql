-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2024 at 12:19 PM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `created_by`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'apple', 'Apple', 'Apple', 'Apple,Mobile,Phoens,Electronics', 1, 0, 0, '2024-06-23 13:22:34', '2024-06-23 13:22:34'),
(2, 'Samsung', 'samsung', 'Samsung', 'Samsung', 'Samsung,Mobile,Phoens,Electronics', 1, 0, 0, '2024-06-23 13:22:55', '2024-06-23 13:22:55'),
(3, 'Boucle', 'boucle', 'Boucle', 'Boucle', 'Boucle,chair,furniture', 1, 0, 0, '2024-06-23 13:29:06', '2024-06-23 13:29:06'),
(4, 'BestEra', 'bestEra', 'BestEra', 'BestEra', 'BestEra,Chair,Office', 1, 0, 0, '2024-06-23 13:36:02', '2024-06-23 13:36:02'),
(5, 'Polo', 'polo', 'Polo', 'Polo', 'Polo,clothing,men', 1, 0, 0, '2024-06-23 15:08:42', '2024-06-23 15:08:42'),
(6, 'Alter', 'alter', 'Alter', 'Alter', 'Alter,activewear,sport', 1, 0, 0, '2024-06-23 15:17:29', '2024-06-23 15:17:29'),
(7, 'Soccer', 'soccer', 'Soccer', '', '', 1, 0, 0, '2024-06-25 13:34:31', '2024-06-25 13:34:31');

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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `button_name` varchar(255) DEFAULT NULL,
  `is_home` tinyint(4) NOT NULL DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `image_name`, `button_name`, `is_home`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_by`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'electronics', 'd5j0z1vdvhxn4j9fvyen.jpg', 'Shop Now', 1, 'Electronics', 'Electronics', 'Electronics', 0, 1, 0, '2024-06-12 20:12:27', '2024-06-27 11:43:00'),
(2, 'Fashion', 'fashion', NULL, NULL, 0, 'Fashion', 'Fashion', 'Fashion', 0, 1, 0, '2024-06-12 20:12:10', '2024-06-12 20:12:10'),
(3, 'Home & Furniture', 'home-furniture', 's69gqxc2nsi62cdwvm1y.jpg', 'Shop Now', 1, 'Home & Furniture', 'Home & Furniture', 'Home & Furniture', 0, 1, 0, '2024-06-12 20:11:51', '2024-06-27 11:41:56'),
(4, 'Beauty & Personal Care', 'beauty-personal-care', NULL, NULL, 0, 'Beauty & Personal Care', 'Beauty & Personal Care', 'Beauty & Personal Care', 0, 1, 0, '2024-06-12 20:11:12', '2024-06-12 20:11:12'),
(5, 'Books, Movies & Music', 'books-movies-music', NULL, NULL, 0, 'Books, Movies & Music', 'Books, Movies & Music', 'Books, Movies & Music', 0, 1, 0, '2024-06-12 20:10:16', '2024-06-12 20:10:16'),
(6, 'Toys & Games', 'toys-games', NULL, NULL, 0, 'Toys & Games', 'Toys & Games', 'Toys & Games', 0, 1, 0, '2024-06-12 20:09:10', '2024-06-12 20:09:10'),
(7, 'Sports & Outdoors', 'sports-outdoors', NULL, NULL, 0, 'Sports & Outdoors', 'Sports & Outdoors', 'Sports & Outdoors', 0, 1, 0, '2024-06-12 20:08:35', '2024-06-12 20:08:35'),
(8, 'Jewelry & Watches', 'jewelry-watches', 'vcvzwagaekdqyap633dz.jpeg', 'Shop Now', 1, 'Jewelry & Watches', 'Jewelry & Watches', 'Jewelry & Watches', 0, 1, 0, '2024-06-12 20:08:02', '2024-06-27 11:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `code`, `created_by`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'black', '#000000', 1, 0, 0, '2024-06-10 10:32:49', '2024-06-10 10:32:49'),
(2, 'red', '#ff0000', 1, 0, 0, '2024-06-10 10:32:56', '2024-06-10 10:37:40'),
(3, 'Blue', '#0008ff', 1, 0, 0, '2024-06-23 13:23:39', '2024-06-23 13:23:39'),
(4, 'White', '#ffffff', 1, 0, 0, '2024-06-23 13:29:50', '2024-06-23 13:29:50'),
(5, 'Green', '#13ec37', 1, 0, 0, '2024-06-23 15:07:42', '2024-06-23 15:07:42'),
(6, 'Grey', '#b19a9a', 1, 0, 0, '2024-06-23 15:13:28', '2024-06-23 15:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `discount_code`
--

CREATE TABLE `discount_code` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `percent_amount` varchar(255) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount_code`
--

INSERT INTO `discount_code` (`id`, `name`, `type`, `percent_amount`, `expire_date`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'welcomee', 'Amount', '20', '2024-06-21', 0, 1, '2024-06-19 21:57:58', '2024-06-23 13:23:48'),
(2, 'welcome', 'Amount', '10', '2024-11-28', 0, 0, '2024-06-23 13:24:10', '2024-06-23 13:24:10');

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
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address_one` varchar(255) DEFAULT NULL,
  `address_two` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `note` text NOT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `discount_amount` varchar(25) DEFAULT '0',
  `shipping_id` int(11) DEFAULT NULL,
  `shipping_amount` varchar(25) NOT NULL DEFAULT '0',
  `total_amount` varchar(25) DEFAULT '0',
  `payment_method` varchar(25) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `is_payment` tinyint(4) NOT NULL DEFAULT 0,
  `payment_data` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `company_name`, `country`, `address_one`, `address_two`, `city`, `state`, `postcode`, `phone`, `email`, `note`, `discount_code`, `discount_amount`, `shipping_id`, `shipping_amount`, `total_amount`, `payment_method`, `status`, `is_delete`, `is_payment`, `payment_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kareem', 'Alshiekh', '', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'admin@gmail.com', '', '', '0', 1, '0', '222', 'cash', 0, 0, 1, NULL, '2023-04-24 13:33:23', '2024-06-24 13:33:23'),
(2, 1, 'Kareem', 'Alshiekh', 'zxc', 'Egypt', 'Fifth settlement, south lotus', 'zxc', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'zxc@gmail.com', '', '', '0', 2, '20', '343', 'cash', 0, 0, 1, NULL, '2023-08-24 14:01:40', '2024-06-24 14:01:40'),
(3, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', 'welcome', '10', 1, '0', '678', 'paypal', 0, 0, 1, NULL, '2022-06-24 14:12:21', '2024-06-24 14:12:21'),
(4, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 2, '20', '264', 'cash', 0, 0, 1, NULL, '2024-06-25 11:08:10', '2024-06-25 11:08:10'),
(5, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 2, '20', '264', 'cash', 0, 0, 1, NULL, '2024-06-25 11:14:38', '2024-06-25 11:14:38'),
(6, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 2, '20', '241', 'cash', 0, 0, 1, NULL, '2024-06-25 13:45:01', '2024-06-25 13:45:01'),
(7, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'cxz', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 1, '0', '400', 'stripe', 0, 0, 1, NULL, '2024-06-25 14:25:15', '2024-06-25 14:25:15'),
(8, 26, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 2, '20', '143', 'cash', 0, 0, 1, NULL, '2024-06-28 14:30:41', '2024-06-28 14:30:42'),
(9, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'asd.kareem@yahoo.com', '', '', '0', 2, '20', '20', 'cash', 0, 0, 1, NULL, '2024-06-28 14:31:37', '2024-06-28 14:31:38'),
(10, 1, 'Kareem', 'Alshiekh', '', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahmoo.com', '', '', '0', 1, '0', '223', 'cash', 0, 0, 1, NULL, '2024-07-01 12:11:23', '2024-07-01 12:11:23'),
(11, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 1, '0', '122', 'cash', 0, 0, 1, NULL, '2024-07-06 10:47:45', '2024-07-06 10:47:46'),
(12, 1, 'Kareem', 'Alshiekh', 'sa', 'Egypt', 'Fifth settlement, south lotus', 'ASD', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 1, '0', '564', 'cash', 0, 0, 1, NULL, '2024-07-09 20:07:58', '2024-07-09 20:07:59'),
(13, 1, 'Kareem', 'Alshiekh', '', 'Egypt', 'Fifth settlement, south lotus', 'etr', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', '', '', '0', 2, '20', '142', 'cash', 0, 0, 1, NULL, '2024-07-10 18:42:56', '2024-07-10 18:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `orders_item`
--

CREATE TABLE `orders_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` varchar(25) DEFAULT '0',
  `color_name` varchar(255) DEFAULT NULL,
  `size_name` varchar(255) DEFAULT '',
  `size_amount` varchar(25) DEFAULT '0',
  `total_price` varchar(25) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_item`
--

INSERT INTO `orders_item` (`id`, `order_id`, `product_id`, `quantity`, `price`, `color_name`, `size_name`, `size_amount`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, '222', 'Grey', 'SM', '2', '222', '2024-06-24 13:33:23', '2024-06-24 13:33:23'),
(2, 2, 4, 1, '323', 'black', 'LM', '3', '323', '2024-06-24 14:01:40', '2024-06-24 14:01:40'),
(3, 3, 6, 2, '222', 'Grey', NULL, NULL, '222', '2024-06-24 14:12:21', '2024-06-24 14:12:21'),
(4, 3, 6, 2, '122', 'Grey', 'SM', '2', '122', '2024-06-24 14:12:21', '2024-06-24 14:12:21'),
(5, 4, 6, 2, '122', 'Grey', 'SM', '2', '122', '2024-06-25 11:08:10', '2024-06-25 11:08:10'),
(6, 5, 6, 2, '122', 'Grey', 'SM', '2', '122', '2024-06-25 11:14:38', '2024-06-25 11:14:38'),
(7, 6, 9, 1, '221', NULL, '', '0', '221', '2024-06-25 13:45:01', '2024-06-25 13:45:01'),
(8, 7, 8, 1, '400', 'black', '', '0', '400', '2024-06-25 14:25:15', '2024-06-25 14:25:15'),
(9, 8, 6, 1, '123', 'Grey', 'LM', '3', '123', '2024-06-28 14:30:41', '2024-06-28 14:30:41'),
(10, 10, 4, 1, '223', 'black', 'LM', '3', '223', '2024-07-01 12:11:23', '2024-07-01 12:11:23'),
(11, 11, 6, 1, '122', 'Grey', 'SM', '2', '122', '2024-07-06 10:47:46', '2024-07-06 10:47:46'),
(12, 12, 6, 1, '122', 'Grey', 'SM', '2', '122', '2024-07-09 20:07:58', '2024-07-09 20:07:58'),
(13, 12, 9, 2, '221', NULL, '', '0', '221', '2024-07-09 20:07:58', '2024-07-09 20:07:58'),
(14, 13, 6, 1, '122', 'Grey', 'SM', '2', '122', '2024-07-10 18:42:56', '2024-07-10 18:42:56');

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
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `old_price` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `additional_information` text DEFAULT NULL,
  `shipping_returns` text DEFAULT NULL,
  `is_trendy` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active , 1:inactive',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `slug`, `sku`, `category_id`, `sub_category_id`, `brand_id`, `old_price`, `price`, `short_description`, `description`, `additional_information`, `shipping_returns`, `is_trendy`, `status`, `is_delete`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Office Chair', 'office-chair', 'Office Chair', 3, 13, 4, 235, 245, '<p class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">Office Chair, Big and Tall Office Chair Executive Office Chair with Foot Rest Ergonomic Office Chair Home Office Desk Chairs Reclining High Back Leather Chair with Lumbar Support (Black)</span></p>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">Ergonomic Office Chair: BestEra big and tall office chair is designed for sitting for long hours, whose lumbar support and headrest in line with the human waist, neck curve, helping you adjust the sitting posture, relieve the pain of the back and lumbar spine when working for a long time. The cushion adopts an upgraded sponge and 20 independent spring packs, to achieve a balance of support and soft comfort, sedentary not tired.</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">Modern Appearance Design: Executive office chair allow you to enhance your visual enjoyment while comfortable. Wrapped in high-quality PU leather, both soft, skin-friendly and resistant to scratches, stains, peeling, cracking, long time use does not fade and easy to clean, suitable for home, office, conference room, reception room and varieties of colors can be selected according to your needs.</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">Reclining and Adjustable: Make your own chair, the seat height of the high back office chair can be adjusted up and down in the range of 4 inches, the chair backrest can recline between 90&deg; and 135&deg; to meet your different needs for work, relax and rest. Home office desk chairs have a retractable footrest that can be pulled out when your legs feel uncomfortable or you want to take a nap for rest.</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">Easy Installation and Sturdy: The package includes detailed installation instructions and tools so that you can assemble the chair yourself. We have also uploaded the installation video on the product page for your reference. Once installation complete, you will find the leather office chair is sturdy enough, equipped with five stable and durable castors that rotate 360&deg; and slide smoothly and silently across different floors.</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">Worry-free Aftersales Service: If you need help assembling or using our products, please feel free to contact our Customer Service Team by email. We will spare no effort to assist you with any problems. The warranty period is 1 year, we assure to provide you with the highest level of after-sales service.</span></li>\r\n</ul>', '<p><span class=\"a-text-bold\">Note</span>: Products with electrical plugs are designed for use in the US. Outlets and voltage differ internationally and this product may require an adapter or converter for use in your destination. Please check compatibility before purchasing.</p>', '', 1, 0, 0, 1, '2023-01-23 22:25:55', '2024-06-24 14:11:39'),
(3, 'Boucle Occasional Chair', 'boucle-occasional-chair', 'Boucle Occasional Chair', 3, 13, 3, 233, 300, '<section class=\"productView-details\">\r\n<div class=\"productView-product\">\r\n<p class=\"productView-title\" itemprop=\"name\">Boucle Occasional Chair</p>\r\n<p data-yotpo-instance-id=\"472438\" data-yotpo-product-id=\"27344\" data-yotpo-element-loaded=\"true\">&nbsp;</p>\r\n</div>\r\n</section>\r\n<p class=\"productView-images\">&nbsp;</p>\r\n<figure class=\"productView-image\" data-image-gallery-main=\"\" data-zoom-image=\"https://cdn11.bigcommerce.com/s-fj5u5hhzyb/images/stencil/1280x1280/products/27344/15554/NEW_Boucle_Occasional_Chair_Lores_01__99432.1675195686.jpg?c=1\">\r\n<div id=\"viewer\" class=\"productView-img-container\"></div>\r\n</figure>\r\n<p>&nbsp;</p>', '<div class=\"productView\" data-event-type=\"product\" data-entity-id=\"27344\" data-product-sku=\"T03710\" data-name=\"Boucle Occasional Chair\" data-product-category=\"Home Furniture/Living Room/Armchairs, Home Furniture/Office Furniture/Office Chairs, Inspiration/Gift Guide/Gifts For Her, Inspiration/Gift Guide/Gifts For The Homemaker, Inspiration/Trending Now/Mocka Dreamhouse, Sale\" data-product-brand=\"\" data-product-price=\"319.99\" data-product-variant=\"single-product-option\">\r\n<section class=\"productView-details\">\r\n<div class=\"product-short-description-container product-short-description-container--non-bundle\">\r\n<div class=\"product-short-description product-description more hidden\">Decorate your home with on-trend, designer style at an affordable price with the Boucle Occasional Chair. The &lsquo;fleecy&rsquo; boucle fabric is wonderfully comforting and will add an extra cosy vibe to your living room, office, or bedroom.</div>\r\n</div>\r\n</section>\r\n</div>', '<p><strong>&bull;</strong>&nbsp;On-trend Boucle upholstery to create cosy, yet elegant home style<br><strong>&bull;</strong>&nbsp;Creamy white hue to suit any decor<br><strong>&bull;</strong>&nbsp;Strong rubberwood legs<br><strong>&bull;</strong>&nbsp;Match back with the rest of the Boucle range<br><strong>&bull;</strong> Designed in Australia and exclusive to Mocka</p>', '', 1, 0, 0, 1, '2022-03-24 09:56:30', '2024-06-24 14:11:24'),
(4, 'Men Regular Fit', 'men-regular-fit', 'Men Regular Fit', 2, 9, 5, 0, 220, '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"title\" data-csa-c-slot-id=\"title_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"q2u5ee-tr4gs7-uk7k27-a8co8r\" data-cel-widget=\"title_feature_div\">\r\n<div id=\"titleSection\" class=\"a-section a-spacing-none\">\r\n<p class=\"a-size-large a-spacing-none a-color-secondary\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">Mobaco Men Regular Fit Polo Shirt SO100</span></p>\r\n</div>\r\n</div>\r\n<div id=\"qpeTitleTag_feature_div\" class=\"celwidget\" data-feature-name=\"qpeTitleTag\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"qpeTitleTag\" data-csa-c-slot-id=\"qpeTitleTag_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"m2jnxz-rjt4oh-dgannf-ndowls\" data-cel-widget=\"qpeTitleTag_feature_div\">\r\n<div id=\"qpe-title-tag_feature_div\"></div>\r\n</div>\r\n<div id=\"cmrsSummary_feature_div\" class=\"celwidget\" data-feature-name=\"cmrsSummary\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"cmrsSummary\" data-csa-c-slot-id=\"cmrsSummary_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"1wr5xj-eb51aa-oebo6y-4t2yop\" data-cel-widget=\"cmrsSummary_feature_div\"></div>\r\n<div id=\"averageCustomerReviews_feature_div\" class=\"celwidget\" data-feature-name=\"averageCustomerReviews\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"averageCustomerReviews\" data-csa-c-slot-id=\"averageCustomerReviews_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"gg6red-iqi6gc-l2i5qx-1e2ucc\" data-cel-widget=\"averageCustomerReviews_feature_div\"></div>', '<div id=\"productDescription_feature_div\" class=\"celwidget pd_rd_w-2bS5F pd_rd_r-06W9ATPBAYD9XNCF7NKG pd_rd_wg-QrvmM\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"mbwpdf-lcyolq-1x18hi-hc6488\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p>Mobaco SO100, Premium pique texture, Ribbed polo collar, Two-button placket, Signature embroidered Mehari logo, Lightweight and breathable, High durable fabric, Great drapability</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '<ul class=\"a-unordered-list a-nostyle a-vertical a-spacing-none detail-bullet-list\">\r\n<li><span class=\"a-list-item\"><span class=\"a-text-bold\">Package Dimensions &rlm; : &lrm;&nbsp;</span>29.9 x 21.2 x 5.3 cm; 350 g</span></li>\r\n<li><span class=\"a-list-item\"><span class=\"a-text-bold\">Manufacturer &rlm; : &lrm;&nbsp;</span>Mobaco</span></li>\r\n<li><span class=\"a-list-item\"><span class=\"a-text-bold\">ASIN &rlm; : &lrm;&nbsp;</span>B093G2FV8W</span></li>\r\n<li><span class=\"a-list-item\"><span class=\"a-text-bold\">Item model number &rlm; : &lrm;&nbsp;</span>6221258000060</span></li>\r\n<li><span class=\"a-list-item\"><span class=\"a-text-bold\">Department &rlm; : &lrm;&nbsp;</span>Men</span></li>\r\n</ul>', '', 1, 0, 0, 1, '2023-09-24 10:01:35', '2024-06-24 14:11:11'),
(5, 'Alter Men Compression Long Sleeve', 'alter-men-compression-long-sleeve', 'Alter Men Compression Long Sleeve', 2, 11, 6, 0, 160, '<p class=\"a-size-large a-spacing-none a-color-secondary\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">Alter Men Compression Long Sleeve (Black) - Activewear</span></p>', '<div id=\"productDescription_feature_div\" class=\"celwidget pd_rd_w-3xmJC pd_rd_r-S036BVF7VAV4XANM972Q pd_rd_wg-KmPp7\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"vmaanp-fmf20s-4iusad-its0mg\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p>Fit &amp; Size - Model is (187 cm) and wearing size (L) - The long sleeve is the perfect top for a cold day, the mesh detail offers proper ventilation while still keeping you warm. The special stretchy material gives you a comfortable fitted look without hindering your movement. Practical Elements - Side mesh detail for ventilation and proper sweat evaporation, keeping you dry. Fabric - The winter cool fabric features a thick stretchy material that keeps you warm in cold weather. - 95% Polyester, 5% Spandex - Imported - Machine Wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"detailBulletsReverseInterleaveContainer_feature_v2\" class=\"celwidget pd_rd_w-JemQf pd_rd_r-S036BVF7VAV4XANM972Q pd_rd_wg-KmPp7\" data-feature-name=\"detailBulletsReverseInterleaveContainer_feature_v2\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"detailBulletsReverseInterleaveContainer_feature_v2\" data-csa-c-slot-id=\"detailBulletsReverseInterleaveContainer_feature_v2\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"h0ivqc-c24oyb-itaqfn-kfmnnl\" data-cel-widget=\"detailBulletsReverseInterleaveContainer_feature_v2\">\r\n<div id=\"detailBulletsWrapper_feature_div\" class=\"a-section feature detail-bullets-wrapper bucket\" data-feature-name=\"detailBullets\" data-template-name=\"detailBullets\" data-cel-widget=\"detailBulletsWrapper_feature_div\"></div>\r\n</div>', '', '', 0, 0, 0, 1, '2022-06-24 10:04:51', '2024-06-28 13:24:42'),
(6, 'mens shorts', 'mens-shorts', 'mens shorts', 2, 7, 5, 0, 120, '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"title\" data-csa-c-slot-id=\"title_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"vf25c5-y8cq1c-4w5gs9-4n7fg4\" data-cel-widget=\"title_feature_div\">\r\n<div id=\"titleSection\" class=\"a-section a-spacing-none\">\r\n<p class=\"a-size-large a-spacing-none a-color-secondary\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">Polo mens SB067 Shorts</span></p>\r\n</div>\r\n</div>\r\n<div id=\"qpeTitleTag_feature_div\" class=\"celwidget\" data-feature-name=\"qpeTitleTag\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"qpeTitleTag\" data-csa-c-slot-id=\"qpeTitleTag_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"apnyy8-2d0hof-hzpi5e-iszj6y\" data-cel-widget=\"qpeTitleTag_feature_div\">\r\n<div id=\"qpe-title-tag_feature_div\"></div>\r\n</div>\r\n<div id=\"cmrsSummary_feature_div\" class=\"celwidget\" data-feature-name=\"cmrsSummary\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"cmrsSummary\" data-csa-c-slot-id=\"cmrsSummary_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"6ynq5y-3incad-utkob0-bxplrk\" data-cel-widget=\"cmrsSummary_feature_div\"></div>\r\n<div id=\"averageCustomerReviews_feature_div\" class=\"celwidget\" data-feature-name=\"averageCustomerReviews\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"averageCustomerReviews\" data-csa-c-slot-id=\"averageCustomerReviews_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"y93m8-crh43x-88dpie-wjbjp3\" data-cel-widget=\"averageCustomerReviews_feature_div\"></div>', '<div id=\"Desktop-Detailed-Evaluation-Zone\" class=\"celwidget\" data-feature-name=\"Desktop-Detailed-Evaluation-Zone\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"Desktop-Detailed-Evaluation-Zone\" data-csa-c-slot-id=\"Desktop-Detailed-Evaluation-Zone\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"colqo5-7uex9r-619n07-bbw5of\" data-cel-widget=\"Desktop-Detailed-Evaluation-Zone\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget pd_rd_w-AdjcQ pd_rd_r-0XZTH9046D3N284STJV9 pd_rd_wg-IMjif\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"vc0fsc-da0e1o-oh6twx-g3ap3x\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p>Polo light twill shorts. Regular fit designed for enhanced comfort. Extra durable and wear resistant . 100% Egyptian cotton.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"ask-dp-search_feature_div\" class=\"celwidget pd_rd_w-OOPSz pd_rd_r-0XZTH9046D3N284STJV9 pd_rd_wg-IMjif\" data-feature-name=\"ask-dp-search\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"ask-dp-search\" data-csa-c-slot-id=\"ask-dp-search_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"bs26wa-maa6bt-42zjs9-kyo6ac\" data-cel-widget=\"ask-dp-search_feature_div\">\r\n<div id=\"ask-dp-search_feature_div\">\r\n<div id=\"ask-dp-search_feature_div\"></div>\r\n</div>\r\n</div>\r\n<div id=\"climatePledgeFriendlyBTF_feature_div\" class=\"celwidget pd_rd_w-slSdT pd_rd_r-0XZTH9046D3N284STJV9 pd_rd_wg-IMjif\" data-feature-name=\"climatePledgeFriendlyBTFAllMp\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"climatePledgeFriendlyBTFAllMp\" data-csa-c-slot-id=\"climatePledgeFriendlyBTF_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"8tvkxj-rejnv8-kqgprj-oanf9b\" data-cel-widget=\"climatePledgeFriendlyBTF_feature_div\"></div>\r\n<div id=\"click-to-call_feature_div\" class=\"celwidget pd_rd_w-teGZb pd_rd_r-0XZTH9046D3N284STJV9 pd_rd_wg-IMjif\" data-feature-name=\"click-to-call\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"click-to-call\" data-csa-c-slot-id=\"click-to-call_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"6s680c-7qfoev-686tas-3w84cp\" data-cel-widget=\"click-to-call_feature_div\"></div>\r\n<div id=\"productDocuments_feature_div\" class=\"celwidget pd_rd_w-iF5JM pd_rd_r-0XZTH9046D3N284STJV9 pd_rd_wg-IMjif\" data-feature-name=\"productDocuments\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDocuments\" data-csa-c-slot-id=\"productDocuments_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"os19bz-ts762h-b985rq-2r9nys\" data-cel-widget=\"productDocuments_feature_div\"></div>\r\n<div id=\"bundleComponentDetails_feature_div\" class=\"celwidget pd_rd_w-KhIBk pd_rd_r-0XZTH9046D3N284STJV9 pd_rd_wg-IMjif\" data-feature-name=\"bundleComponentDetails\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"bundleComponentDetails\" data-csa-c-slot-id=\"bundleComponentDetails_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"tc441b-dxqb18-xl7hae-6140n\" data-cel-widget=\"bundleComponentDetails_feature_div\"></div>\r\n</div>\r\n<div id=\"promotions_feature_div\" class=\"celwidget\" data-feature-name=\"promotions\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"promotions\" data-csa-c-slot-id=\"promotions_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"mgx5f2-h892jo-la272c-izy1zm\" data-cel-widget=\"promotions_feature_div\"></div>\r\n<div id=\"legal_feature_div\" class=\"celwidget\" data-feature-name=\"legal\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"legal\" data-csa-c-slot-id=\"legal_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"fjqw69-m0jrza-gb6ows-moibax\" data-cel-widget=\"legal_feature_div\"></div>\r\n<div id=\"importantInformation_feature_div\" class=\"celwidget\" data-feature-name=\"importantInformationRemoveDE\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"importantInformationRemoveDE\" data-csa-c-slot-id=\"importantInformation_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"tf2tqc-up7quj-jazq0y-oqevx9\" data-cel-widget=\"importantInformation_feature_div\"></div>\r\n<div id=\"similarities_feature_div\" class=\"celwidget\" data-feature-name=\"similarities\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"similarities\" data-csa-c-slot-id=\"similarities_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"bk3edx-y5w06i-cz90qx-9jqbqo\" data-cel-widget=\"similarities_feature_div\">\r\n<div id=\"sims-consolidated-2_feature_div\">\r\n<div id=\"sims-consolidated-2_feature_div\"></div>\r\n</div>\r\n</div>\r\n<div id=\"legal-compliance-card_feature_div\" class=\"celwidget\" data-feature-name=\"legal-compliance-card\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"legal-compliance-card\" data-csa-c-slot-id=\"legal-compliance-card_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"gdrzza-qlzwaf-epaboi-5xr5do\" data-cel-widget=\"legal-compliance-card_feature_div\"></div>\r\n<div id=\"cpsiaProductSafetyWarning_feature_div\" class=\"celwidget\" data-feature-name=\"cpsiaProductSafetyWarningCard\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"cpsiaProductSafetyWarningCard\" data-csa-c-slot-id=\"cpsiaProductSafetyWarning_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"oyhc7-lrpdtg-sxe1tj-yki3po\" data-cel-widget=\"cpsiaProductSafetyWarning_feature_div\"></div>\r\n<div id=\"buffetServiceCard_feature_div\" class=\"celwidget\" data-feature-name=\"buffetServiceCard\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"buffetServiceCard\" data-csa-c-slot-id=\"buffetServiceCard_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"surhgb-vjzahh-mdkvw3-mmyj32\" data-cel-widget=\"buffetServiceCard_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"tiemga-ao79hi-i92yvv-3yi2wd\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n<div id=\"customer-reviews_feature_div\" class=\"celwidget\" data-feature-name=\"customer-reviews\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"customer-reviews\" data-csa-c-slot-id=\"customer-reviews_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"jtxvcd-sesxb6-ymj7lv-ych5a\" data-cel-widget=\"customer-reviews_feature_div\">\r\n<div class=\"celwidget\" data-csa-c-id=\"jaay6l-r1xefi-anysxo-4ywztf\" data-cel-widget=\"customer-reviews_csm_instrumentation_wrapper\">\r\n<div id=\"customerReviews\" aria-label=\"Top reviews\"></div>\r\n</div>\r\n</div>', '', '', 1, 0, 0, 1, '2024-06-24 10:07:42', '2024-06-24 14:10:41'),
(7, 'm', 'm', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1, '2024-06-25 11:08:44', '2024-06-25 11:11:03'),
(8, 'Smart watch', 'smart-watch', 'Smart watch', 1, 4, 2, 0, 400, '<p class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">AMSUNG Galaxy Watch 6 Classic 47mm Bluetooth Smartwatch, Rotating Bezel, Fitness Tracker, Personalized HR Zones, Advanced Sleep Coaching, Heart Monitor, BIA Sensor, Health Insights, US Version, Black</span></p>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">A SMART WATCH WITH CLASSIC STYLE: Galaxy Watch6 Classic features a timeless, iconic look and a bezel that just clicks with your style; It not only looks great, but it also rotates to give you easy access to all your apps</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">KEEP YOUR GOALS ON TRACK: Workout to your full potential with fitness tracking*; Get insights on duration, distance, calories burned and more; Watch recognizes activities from running to swimming and tracks over 90 other exercises</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">GET IN THE ZONE: Zone in on the results you want with personalized heart rate zones**; Watch scans your health data to provide HR zones tailored just for you; Target your preferred intensity to maintain the heart rate needed to achieve your goals</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">SLEEP COACH ON YOUR WRIST: Get the insights to develop better sleep habits with Advanced Sleep Coaching;* Use Watch to plan your bedtime, detect snoring*** and understand and track your sleep stages (awake, light, deep, REM)</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">ALWAYS-ON HEART MONITOR: Get ahead of your heart health with heart monitoring****; Watch continually scans your heart rate to detect an irregular rhythm that might be A-fib &mdash; a heart-related abnormality that can lead to serious complications</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">KNOW YOUR BODY INSIDE &amp; OUT: Stay in the know about your body with the advanced BIA sensor*****; Use your Watch to get readings on body fat, skeletal muscle, body water, Body Mass Index (BMI) and more*</span></li>\r\n</ul>', '', '', 0, 0, 0, 1, '2024-06-25 11:15:03', '2024-06-25 11:15:58'),
(9, 'Soccer Hurdles', 'soccer-hurdles', 'Soccer Hurdles', 7, 19, 7, 0, 221, '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"title\" data-csa-c-slot-id=\"title_feature_div\" data-csa-c-asin=\"B0CNDDHJB2\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"fur3ey-kk46s8-7oq628-ox6z2o\" data-cel-widget=\"title_feature_div\">\r\n<div id=\"titleSection\" class=\"a-section a-spacing-none\">\r\n<p class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">Soccer Hurdles for Agility Training, Set of 5, Speed Sight and Endurance for Track and Field Fences for Indoor Outdoor Sports Training</span></p>\r\n</div>\r\n</div>\r\n<div id=\"qpeTitleTag_feature_div\" class=\"celwidget\" data-feature-name=\"qpeTitleTag\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"qpeTitleTag\" data-csa-c-slot-id=\"qpeTitleTag_feature_div\" data-csa-c-asin=\"B0CNDDHJB2\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"1ownli-hjesht-6o08qq-p55rej\" data-cel-widget=\"qpeTitleTag_feature_div\">\r\n<div id=\"qpe-title-tag_feature_div\"></div>\r\n</div>\r\n<div id=\"bylineInfo_feature_div\" class=\"celwidget\" data-feature-name=\"bylineInfo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"bylineInfo\" data-csa-c-slot-id=\"bylineInfo_feature_div\" data-csa-c-asin=\"B0CNDDHJB2\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"j345xq-779gc0-sh7gco-kwzgiw\" data-cel-widget=\"bylineInfo_feature_div\"></div>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">✪ Designed for indoor or outdoor use, this adjustable bar increases your speed and elasticity, allowing for football, soccer, athletes or basketball team to be ready for game day.</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">🍒Improve field performance with flexible, durable and adjustable agility barriers in packs</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">ArtParisienne Adjustable agility training barriers are designed for powerful pedals and jumping exercise to improve knee lift and jumping</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">✂ Build strength, enhance agility, speed, coordination, and improve overall athletic performance</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">Spreadshirt athletic in all field sports: football, soccer, track, field, lacrosse and field hockey are made of lightweight, durable and weather resistant PVC neon orange for high visibility</span></li>\r\n<li class=\"a-spacing-mini\"><span class=\"a-list-item\">⚠️⚠️[Important attention] To ensure quality, delivering the same color and quality. Be sure to buy from seller SportQ because there are some sellers selling similar products to our products and send other products not the same quality and color will harm me to our authenticity, please be sure to buy from seller SportQ and we will also offer a return guarantee against manufacturer defects. Thank you for your trust in us</span></li>\r\n</ul>', '', '', 1, 0, 0, 1, '2024-06-25 13:31:35', '2024-06-28 13:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(58, 1, 4, '2024-06-23 22:32:42', '2024-06-23 22:32:42'),
(71, 6, 6, '2024-06-24 14:10:41', '2024-06-24 14:10:41'),
(73, 4, 1, '2024-06-24 14:11:11', '2024-06-24 14:11:11'),
(74, 4, 5, '2024-06-24 14:11:11', '2024-06-24 14:11:11'),
(75, 4, 2, '2024-06-24 14:11:11', '2024-06-24 14:11:11'),
(76, 3, 4, '2024-06-24 14:11:24', '2024-06-24 14:11:24'),
(77, 2, 1, '2024-06-24 14:11:39', '2024-06-24 14:11:39'),
(78, 8, 1, '2024-06-25 11:15:58', '2024-06-25 11:15:58'),
(79, 5, 1, '2024-06-28 13:24:42', '2024-06-28 13:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_extension` varchar(255) DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 100,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image_name`, `image_extension`, `order_by`, `created_at`, `updated_at`) VALUES
(1, 2, '2pyhy2h1xd57i49evfndc.jpg', 'jpg', 100, '2024-06-23 23:30:17', '2024-06-23 23:30:17'),
(2, 2, '2bzd6vcytkteesyskmw3v.jpg', 'jpg', 100, '2024-06-23 23:30:17', '2024-06-23 23:30:17'),
(4, 2, '2uzw54u8psturtyoch4hh.jpg', 'jpg', 100, '2024-06-23 23:30:17', '2024-06-23 23:30:17'),
(5, 3, '3chlcc67crpgtfr6x6hf4.jpg', 'jpg', 100, '2024-06-24 09:57:20', '2024-06-24 09:57:20'),
(6, 3, '3uy3xsm94gowokzxzrepr.jpg', 'jpg', 100, '2024-06-24 09:57:20', '2024-06-24 09:57:20'),
(7, 3, '3vrjvplowosccqwiixxwv.jpg', 'jpg', 100, '2024-06-24 09:57:20', '2024-06-24 09:57:20'),
(8, 4, '4bai7yivp3rppng3fbip7.jpg', 'jpg', 2, '2024-06-24 10:03:04', '2024-06-24 10:03:07'),
(9, 4, '4e2slyminzhzvuofb4wue.jpg', 'jpg', 1, '2024-06-24 10:03:04', '2024-06-24 10:03:07'),
(10, 4, '4tjwhzcomnozgbujljirh.jpg', 'jpg', 3, '2024-06-24 10:03:04', '2024-06-24 10:03:07'),
(11, 4, '46kxdyywzcavcyfuijcgt.jpg', 'jpg', 4, '2024-06-24 10:03:04', '2024-06-24 10:03:07'),
(12, 4, '4chhaygohr367xhnoel7v.jpg', 'jpg', 6, '2024-06-24 10:03:04', '2024-06-24 10:03:10'),
(13, 4, '4b8gexxfyzxzmkwevhqc5.jpg', 'jpg', 5, '2024-06-24 10:03:04', '2024-06-24 10:03:10'),
(14, 5, '5vsgkje32xnkaza93hnyw.jpg', 'jpg', 100, '2024-06-24 10:05:36', '2024-06-24 10:05:36'),
(15, 5, '5ru7amubrhozu1xrftlpw.jpg', 'jpg', 100, '2024-06-24 10:05:36', '2024-06-24 10:05:36'),
(16, 6, '6n6kxvtps08hhx2pinenl.jpg', 'jpg', 100, '2024-06-24 10:08:41', '2024-06-24 10:08:41'),
(17, 6, '69yn9lzbjfpzyfithneww.jpg', 'jpg', 100, '2024-06-24 10:08:41', '2024-06-24 10:08:41'),
(18, 8, '8vdisyaqa6ldk0m8w0rt1.jpg', 'jpg', 2, '2024-06-25 11:15:58', '2024-06-25 11:16:12'),
(19, 8, '835qeogxrex8abww4i6em.jpg', 'jpg', 3, '2024-06-25 11:15:58', '2024-06-25 11:16:12'),
(20, 8, '8lgrvigarozet1owcfrx2.jpg', 'jpg', 1, '2024-06-25 11:15:58', '2024-06-25 11:16:12'),
(21, 9, '9k6scf0vwiw7mrbov4jip.jpg', 'jpg', 100, '2024-06-25 13:37:49', '2024-06-25 13:37:49'),
(22, 9, '91r3g3sss4gcyun0nkzxw.jpg', 'jpg', 100, '2024-06-25 13:37:49', '2024-06-25 13:37:49'),
(23, 9, '9skgakqtxm3kxtcwjs9zd.jpg', 'jpg', 100, '2024-06-25 13:37:49', '2024-06-25 13:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`id`, `product_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(26, 6, 'SM', 2, '2024-06-24 14:10:41', '2024-06-24 14:10:41'),
(27, 6, 'LM', 3, '2024-06-24 14:10:41', '2024-06-24 14:10:41'),
(31, 4, 'SM', 0, '2024-06-24 14:11:11', '2024-06-24 14:11:11'),
(32, 4, 'LM', 3, '2024-06-24 14:11:11', '2024-06-24 14:11:11'),
(33, 4, 'X', 5, '2024-06-24 14:11:11', '2024-06-24 14:11:11'),
(34, 5, 'X', 2, '2024-06-28 13:24:42', '2024-06-28 13:24:42'),
(35, 5, 'XL', 3, '2024-06-28 13:24:42', '2024-06-28 13:24:42'),
(36, 5, 'XXL', 7, '2024-06-28 13:24:42', '2024-06-28 13:24:42');

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
('cvCWWca7tgMoA2FMG8Sjsi1hTYH0bLENtBXMEgVw', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV3lxN3gyaTFkeXA1QWxocXZLNHFKOEtsNkZPZEY0bHFzRWN0OEtnVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3QvRS1jb21tZXJjZS9hZG1pbi9zdWJfY2F0ZWdvcnkvbGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJjYXJ0IjthOjA6e319', 1720641842),
('zxLQRjO86TGNkmJG876RI4kekFCf1CIKRZ2bhGiQ', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFNWN2Uyd2dqYnBqaWcyZVRWamlOQTVIdDl4QVhsSEdVWUkxdXUzcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3QvZWNvbW1lcmNlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1720693103);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charge`
--

CREATE TABLE `shipping_charge` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(25) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_charge`
--

INSERT INTO `shipping_charge` (`id`, `name`, `price`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Free Shipping', '0', 0, 0, '2024-06-23 13:24:30', '2024-06-23 13:24:30'),
(2, 'Charge', '20', 0, 0, '2024-06-23 13:24:46', '2024-06-23 13:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `category_id`, `name`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_by`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 'Smartphones & Accessories', 'smartphones-accessories', 'Smartphones & Accessories', 'Smartphones & Accessories', 'Smartphones & Accessories', 0, 1, 0, '2024-06-12 20:15:32', '2024-06-12 20:15:32'),
(2, 1, 'Laptops & Computers', 'laptops-computers', 'Laptops & Computers', 'Laptops & Computers', 'Laptops & Computers', 0, 1, 0, '2024-06-12 20:16:02', '2024-06-12 20:16:02'),
(3, 1, 'Cameras & Photography', 'cameras-photography', 'Cameras & Photography', 'Cameras & Photography', 'Cameras & Photography', 0, 1, 0, '2024-06-12 20:16:44', '2024-06-12 20:16:44'),
(4, 1, 'Wearable Technology', 'wearable-technology', 'Wearable Technology', 'Wearable Technology', 'Wearable Technology', 0, 1, 0, '2024-06-12 20:17:28', '2024-06-12 20:17:28'),
(5, 1, 'Audio & Headphones', 'audio-headphones', 'Audio & Headphones', 'Audio & Headphones', 'Audio & Headphones', 0, 1, 0, '2024-06-12 20:18:05', '2024-06-12 20:18:05'),
(6, 1, 'Gaming', 'gaming', 'Gaming', '', '', 0, 1, 0, '2024-06-12 20:18:30', '2024-06-12 20:18:30'),
(7, 2, 'Men\'s Clothing', 'men-clothing', 'Men\'s Clothing', '', '', 0, 1, 0, '2024-06-12 20:19:00', '2024-06-12 20:19:00'),
(8, 2, 'Women\'s Clothing', 'women-clothing', 'Women\'s Clothing', '', '', 0, 1, 0, '2024-06-12 20:19:29', '2024-06-12 20:19:29'),
(9, 2, 'Kids Clothing', 'kid-clothing', 'Kids Clothing', '', '', 0, 1, 0, '2024-06-12 20:19:53', '2024-06-12 20:19:53'),
(10, 2, 'Shoes & Footwear', 'shoes-footwear', 'Shoes & Footwear', '', '', 0, 1, 0, '2024-06-12 20:20:19', '2024-06-12 20:20:19'),
(11, 2, 'Activewear', 'activewear', 'Activewear', '', '', 0, 1, 0, '2024-06-12 20:20:47', '2024-06-12 20:20:47'),
(12, 2, 'Lingerie & Sleepwear', 'lingerie-sleepwear', 'Lingerie & Sleepwear', '', '', 0, 1, 0, '2024-06-12 20:21:46', '2024-06-12 20:21:46'),
(13, 3, 'Furniture', 'furniture', 'Furniture', '', '', 0, 1, 0, '2024-06-12 20:22:03', '2024-06-12 20:22:03'),
(14, 3, 'Kitchen & Dining', 'kitchen-dining', 'Kitchen & Dining', '', '', 0, 1, 0, '2024-06-12 20:22:33', '2024-06-12 20:22:33'),
(16, 4, 'Skincare', 'skincare', 'Skincare', '', '', 0, 1, 0, '2024-06-12 20:53:47', '2024-06-12 20:54:23'),
(17, 4, 'Makeup', 'makeup', 'Makeup', '', '', 0, 1, 0, '2024-06-12 20:56:35', '2024-06-12 20:56:35'),
(18, 8, 'Jewelry', 'jewelry', 'Jewelry', '', '', 0, 1, 0, '2024-06-14 22:50:01', '2024-06-14 22:50:01'),
(19, 7, 'Soccer', 'soccer', 'Soccer', '', '', 0, 1, 0, '2024-06-25 13:22:08', '2024-06-25 13:22:08'),
(20, 7, 'Basketball', 'basketball', 'Basketball', '', '', 0, 1, 0, '2024-06-25 13:27:57', '2024-06-25 13:27:57'),
(21, 7, 'Baseball', 'baseball', 'Baseball', '', '', 0, 1, 0, '2024-06-25 13:28:17', '2024-06-25 13:28:17');

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
  `is_admin` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:customer, 1:admin',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active, 1:Inactive',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not, 1:deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '2024-05-10 07:46:14', '$2y$12$cZ6BRJ7U981jPyxE3FUbJOrBC6ye0jCNdam3WWyhKnuY/a3y8gJ3W', NULL, 1, 0, 0, '2024-05-09 07:46:57', '2024-06-07 12:18:03'),
(22, 'asd', 'asd@gmail.com', NULL, '$2y$12$DAibNx6v0huuXSyGMiQ03ew1HTu7jszF9EUH3bRnOsd.eYVXMmE.e', NULL, 0, 0, 0, '2024-06-24 10:37:14', '2024-06-24 10:37:14'),
(23, 'zxc', 'zxc@gmail.com', NULL, '$2y$12$WBledftdvNNAzL4d0zMMJexE/h7F22ACuDaq/Jb2ExboJV1CMfhyi', NULL, 0, 0, 0, '2024-06-24 10:38:26', '2024-06-24 10:38:26'),
(24, 'asdd', 'acsd@gmail.com', NULL, '$2y$12$NajaZHFn8ZG7YWAclh9Ji.UDPMs4O7btZDlU3JluYmEMd3MEUaxk.', NULL, 0, 0, 0, '2024-06-25 08:01:57', '2024-06-25 08:01:57'),
(25, 'asdc', 'asc@asd.com', NULL, '$2y$12$j3jAAuHPqqJQ76n8mlJ9F.MFB98N9novOOdMp6Q6LocBPIY3ed9Ti', NULL, 0, 0, 0, '2024-06-25 08:03:13', '2024-06-25 08:03:13'),
(26, 'Kareem', 'alshiekh.kareem@yahoo.com', NULL, '$2y$12$NcwtHuq17GJQVcO2BnvIzO95H0zIei1ZYEBNDzCMHmXtn3sJj3fPG', NULL, 0, 0, 0, '2024-06-28 11:30:41', '2024-06-28 11:30:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_code`
--
ALTER TABLE `discount_code`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipping_charge`
--
ALTER TABLE `shipping_charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5558;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `shipping_charge`
--
ALTER TABLE `shipping_charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
