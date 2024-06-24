-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 03:35 PM
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
(1, 'Samsung', 'samsung', 'samsung', 'samsung', 'samsung', 1, 0, 0, '2024-06-10 09:40:16', '2024-06-10 09:46:33'),
(2, 'Nokia', 'nokia', 'nokia', 'nokia', '', 1, 0, 0, '2024-06-10 09:40:45', '2024-06-10 09:45:10');

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

INSERT INTO `category` (`id`, `name`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_by`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'electronics', 'Electronics', 'Electronics', 'Electronics', 0, 1, 0, '2024-06-12 20:12:27', '2024-06-12 20:12:27'),
(2, 'Fashion', 'fashion', 'Fashion', 'Fashion', 'Fashion', 0, 1, 0, '2024-06-12 20:12:10', '2024-06-12 20:12:10'),
(3, 'Home & Furniture', 'home-furniture', 'Home & Furniture', 'Home & Furniture', 'Home & Furniture', 0, 1, 0, '2024-06-12 20:11:51', '2024-06-12 20:11:51'),
(4, 'Beauty & Personal Care', 'beauty-personal-care', 'Beauty & Personal Care', 'Beauty & Personal Care', 'Beauty & Personal Care', 0, 1, 0, '2024-06-12 20:11:12', '2024-06-12 20:11:12'),
(5, 'Books, Movies & Music', 'books-movies-music', 'Books, Movies & Music', 'Books, Movies & Music', 'Books, Movies & Music', 0, 1, 0, '2024-06-12 20:10:16', '2024-06-12 20:10:16'),
(6, 'Toys & Games', 'toys-games', 'Toys & Games', 'Toys & Games', 'Toys & Games', 0, 1, 0, '2024-06-12 20:09:10', '2024-06-12 20:09:10'),
(7, 'Sports & Outdoors', 'sports-outdoors', 'Sports & Outdoors', 'Sports & Outdoors', 'Sports & Outdoors', 0, 1, 0, '2024-06-12 20:08:35', '2024-06-12 20:08:35'),
(8, 'Jewelry & Watches', 'jewelry-watches', 'Jewelry & Watches', 'Jewelry & Watches', 'Jewelry & Watches', 0, 1, 0, '2024-06-12 20:08:02', '2024-06-12 20:08:02');

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
(2, 'red', '#ff0000', 1, 0, 0, '2024-06-10 10:32:56', '2024-06-10 10:37:40');

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
(1, 'welcomee', 'Amount', '20', '2024-06-21', 0, 0, '2024-06-19 21:57:58', '2024-06-19 21:58:01');

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
(1, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'alshiekh.kareem@yahoo.com', 'asd', '', '0', 1, '22', '176', 'paypal', 0, 0, 1, NULL, '2024-06-22 10:46:59', '2024-06-22 10:46:59'),
(2, 1, 'Kareem', 'Alshiekh', 'asd', 'Egypt', 'Fifth settlement, south lotus', 'asd', 'Cairo', 'Al Qahirah', '11865', '01015800033', 'asd@gmail.com', 'asd', '', '0', 1, '22', '78', 'cash', 0, 0, 1, NULL, '2024-06-22 10:47:45', '2024-06-22 10:47:46'),
(3, 1, 'zxc', 'zxc', 'zxc', 'zxc', 'zxc', 'zxc', 'zxc', 'zxc', 'zxc', 'zxc', 'zxc@gmail.com', 'zxc', '', '0', 2, '112', '145', 'paypal', 0, 0, 1, NULL, '2024-06-22 10:48:31', '2024-06-22 10:48:32');

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
(1, 1, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 09:54:45', '2024-06-21 09:54:45'),
(2, 2, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 11:30:17', '2024-06-21 11:30:17'),
(3, 3, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:08:06', '2024-06-21 13:08:06'),
(4, 4, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:11:15', '2024-06-21 13:11:15'),
(5, 5, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:16:04', '2024-06-21 13:16:04'),
(6, 6, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:17:15', '2024-06-21 13:17:15'),
(7, 7, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:17:43', '2024-06-21 13:17:43'),
(8, 8, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:20:38', '2024-06-21 13:20:38'),
(9, 9, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:31:01', '2024-06-21 13:31:01'),
(10, 10, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:41:36', '2024-06-21 13:41:36'),
(11, 11, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:43:31', '2024-06-21 13:43:31'),
(12, 12, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:44:15', '2024-06-21 13:44:15'),
(13, 13, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:44:53', '2024-06-21 13:44:53'),
(14, 14, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:45:33', '2024-06-21 13:45:33'),
(15, 15, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:48:17', '2024-06-21 13:48:17'),
(16, 16, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:48:59', '2024-06-21 13:48:59'),
(17, 17, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:49:46', '2024-06-21 13:49:46'),
(18, 18, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 13:57:14', '2024-06-21 13:57:14'),
(19, 19, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 14:01:07', '2024-06-21 14:01:07'),
(20, 20, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 14:01:08', '2024-06-21 14:01:08'),
(21, 21, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 14:09:33', '2024-06-21 14:09:33'),
(22, 22, 2, 1, '25', 'black', '1', '3', '25', '2024-06-21 14:29:13', '2024-06-21 14:29:13'),
(23, 23, 2, 1, '25', 'black', '1', '3', '25', '2024-06-21 14:29:22', '2024-06-21 14:29:22'),
(24, 24, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-21 17:18:28', '2024-06-21 17:18:28'),
(25, 26, 2, 3, '25', 'black', '1', '3', '25', '2024-06-22 00:17:15', '2024-06-22 00:17:15'),
(26, 26, 2, 1, '27', 'black', '5', '5', '27', '2024-06-22 00:17:15', '2024-06-22 00:17:15'),
(27, 26, 1, 2, '33', 'black', 'asd', '12', '33', '2024-06-22 00:17:15', '2024-06-22 00:17:15'),
(28, 1, 3, 3, '41', 'black', 'LM', '20', '41', '2024-06-22 10:46:59', '2024-06-22 10:46:59'),
(29, 1, 3, 1, '31', 'red', 'SM', '10', '31', '2024-06-22 10:46:59', '2024-06-22 10:46:59'),
(30, 2, 3, 1, '31', 'black', 'SM', '10', '31', '2024-06-22 10:47:45', '2024-06-22 10:47:45'),
(31, 2, 2, 1, '25', 'black', '1', '3', '25', '2024-06-22 10:47:45', '2024-06-22 10:47:45'),
(32, 3, 1, 1, '33', 'black', 'asd', '12', '33', '2024-06-22 10:48:32', '2024-06-22 10:48:32');

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
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active , 1:inactive',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `slug`, `sku`, `category_id`, `sub_category_id`, `brand_id`, `old_price`, `price`, `short_description`, `description`, `additional_information`, `shipping_returns`, `status`, `is_delete`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'blue shirt', 'blue-shirt', 'qw', 2, 9, 1, 12, 21, '<p>asd</p>', '<p>description</p>', '<p>asd</p>', 'asd', 0, 0, 1, '2024-06-10 08:50:50', '2024-06-16 18:32:26'),
(2, 'zxc1', 'zxc', 'asdsca', 2, 9, 1, 2, 22, '<p>asdcsas</p>', '<p>qcc</p>', '<p>qcc</p>', 'cqwc', 0, 0, 1, '2024-06-10 11:35:44', '2024-06-16 20:11:59'),
(3, 'fashh', 'fashh', 'fashion', 2, 11, 2, 12, 21, '<p>sac ascas cas caisjce ioeqfjwer if iw&nbsp;</p>', '<p>description</p>', '<p>additional_information</p>', 'sda', 0, 0, 1, '2024-06-16 18:05:07', '2024-06-18 12:22:35');

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
(20, 1, 1, '2024-06-16 18:32:26', '2024-06-16 18:32:26'),
(22, 2, 1, '2024-06-16 20:11:59', '2024-06-16 20:11:59'),
(34, 3, 1, '2024-06-18 13:41:57', '2024-06-18 13:41:57'),
(35, 3, 2, '2024-06-18 13:41:57', '2024-06-18 13:41:57');

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
(1, 2, '2m3c5b0bk7yjbn3ltc90v.jpeg', 'jpeg', 1, '2024-06-11 16:54:45', '2024-06-12 14:14:21'),
(2, 2, '2falaexruaga1xq5qegy4.jpeg', 'jpeg', 2, '2024-06-11 16:54:45', '2024-06-12 14:14:21'),
(3, 1, '1p7dwdwqbrprydkp7tmli.jpeg', 'jpeg', 2, '2024-06-11 16:57:11', '2024-06-12 14:12:12'),
(4, 1, '1lh7tomq9uua91jcalqcp.jpeg', 'jpeg', 1, '2024-06-11 17:19:49', '2024-06-12 14:12:12'),
(8, 2, '2epnclwlyee6e3fq6ae3k.jpeg', 'jpeg', 100, '2024-06-12 14:14:48', '2024-06-12 14:14:48'),
(10, 3, '3kbk7gi2nuk5eqh7fz2id.jpg', 'jpg', 2, '2024-06-18 13:31:05', '2024-06-18 13:41:55'),
(11, 3, '3qolfauyg3zcnn9hhij9a.jpeg', 'jpeg', 1, '2024-06-18 13:39:51', '2024-06-18 13:41:55');

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
(28, 1, 'asd', 12, '2024-06-16 18:32:26', '2024-06-16 18:32:26'),
(29, 2, '1', 3, '2024-06-16 20:11:59', '2024-06-16 20:11:59'),
(30, 2, '5', 5, '2024-06-16 20:11:59', '2024-06-16 20:11:59'),
(42, 3, 'SM', 10, '2024-06-18 13:41:57', '2024-06-18 13:41:57'),
(43, 3, 'LM', 20, '2024-06-18 13:41:57', '2024-06-18 13:41:57'),
(44, 3, 'SMSM', 0, '2024-06-18 13:41:57', '2024-06-18 13:41:57');

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
('8fW0UTfjme9b9SzCLv0R05VPcKSZcQBlOmEuPZdL', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicmdCejQ4WWxPWE01UXlqNTJOVXNyTWpEdU5iTFRJYnRLbVVVc3BpOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvRS1jb21tZXJjZS9hZG1pbi9jdXN0b21lci9saXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1719063217);

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
(1, 'charge', '22', 0, 0, '2024-06-19 21:58:12', '2024-06-19 21:58:14'),
(2, 'free', '112', 0, 0, '2024-06-19 22:02:37', '2024-06-19 22:02:37');

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
(18, 8, 'Jewelry', 'jewelry', 'Jewelry', '', '', 0, 1, 0, '2024-06-14 22:50:01', '2024-06-14 22:50:01');

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
(2, '1', '1@yahoo.com', NULL, '$2y$12$nH5dXszzLCnTKi4ja6bNSeIhBI36FEtiO3HqM6K2NCvIGKRhvxDuS', NULL, 0, 1, 0, '2024-05-25 09:51:51', '2024-05-25 09:51:51'),
(3, '2', '2@yahoo.com', NULL, '$2y$12$COJVgbvN/fAC.XvqlpHnOuD.IcmpwPx1RzHxQjj/iJjfWfmCYWC1m', NULL, 1, 1, 0, '2024-05-25 09:54:22', '2024-05-25 11:43:46'),
(4, 'Kareem Alshiekh1', 'alshiekh.kareem@yahoo.com', NULL, '$2y$12$Ppa9vvgBtQArfX9siG3VAeCxWltyXS.MD//JehKFPcDTY3uaT00aC', NULL, 1, 1, 0, '2024-05-25 10:07:13', '2024-05-25 11:40:17'),
(5, 'asd', '1a@yahoo.com', NULL, '$2y$12$idjl2lnOKT9yHPjxTaDQF.UC7aJ64yyxdQ.raoNgF555RdzojzVEK', NULL, 1, 1, 0, '2024-06-07 12:09:18', '2024-06-07 12:20:34'),
(6, 'awl', 'awl@gmail.com', NULL, '$2y$12$WQnAQyMY8JNqnvDsr7uc6.DU6AkUT96DsCCciGgz117sztgJ.loHW', NULL, 0, 0, 0, '2024-06-19 20:14:51', '2024-06-19 20:14:51'),
(7, 'zxc', 'zxc@gmail.com', NULL, '$2y$12$/UHNMuXwtvswFcteoOddd.6Dz8.aYOkcFTlxcxqja2HFQDyeixCpy', NULL, 0, 0, 0, '2024-06-20 07:57:56', '2024-06-20 07:57:56'),
(8, 'testttt', 'testtttttt@gmail.com', NULL, '$2y$12$1p5jdyxWDdt.4Y78ZyEYxOd6bhCwfjFimUKTVDtS.xNq7DrjJa8U6', NULL, 0, 0, 0, '2024-06-20 08:04:48', '2024-06-20 08:04:48'),
(9, 'www', 'ww@gmail.com', NULL, '$2y$12$JJV2wCffgPlw/6Z0586gXOYnIgL.ddTqAy1EyK1ouX10bR6gG8YTC', NULL, 0, 0, 0, '2024-06-20 08:08:20', '2024-06-20 08:08:20'),
(10, 'zxcc', 'zxcxzc@asd.com', NULL, '$2y$12$AHT.c0g6F9HZvFX2S0.1ouk28eW2zlnVj.esVi3E5Zbfay22R28zm', NULL, 0, 0, 0, '2024-06-20 08:13:56', '2024-06-20 08:13:56'),
(11, 'asd', 'asd@gmail.com', NULL, '$2y$12$2fyV0mxRBdhW2.Y0qMvOBuh/fuIAcM2dbZgcgur2oHzGEuAyihIvC', NULL, 0, 0, 0, '2024-06-20 08:24:00', '2024-06-20 08:24:00'),
(13, 'Kareem', 'alshiekh.kareem@ooommm.com', NULL, '$2y$12$FxlvA36pFjZ1sl52yIJNfebWD25oXYyH6zZQ4BDXdNbTnOT65I8s2', NULL, 0, 0, 0, '2024-06-21 10:08:06', '2024-06-21 10:08:06'),
(14, 'Kareem', 'admin@gmcail.com', NULL, '$2y$12$dAf1Cl/l7vsVy2RD2ppNOuz3QKFprBgm0bEIYaWvMbkKB6fZTwJvm', NULL, 0, 0, 0, '2024-06-21 10:11:15', '2024-06-21 10:11:15'),
(15, 'Kareem', 'alshiecasrgrkh.kargreeem@yahgeroo.com', NULL, '$2y$12$.uo9mHokvZsp2HhfvZ/Mk.OKwLM0Ecunb1THSyDDncZ3FhBwnLkzq', NULL, 0, 0, 0, '2024-06-21 10:43:31', '2024-06-21 10:43:31'),
(16, '213', '213@gmail.com', NULL, '$2y$12$btsnDDU3WZjGP3HzjM2GgOSXhs0McDIhuHPSyFOCmwOBVFtkyvMSu', NULL, 0, 0, 0, '2024-06-21 14:10:38', '2024-06-21 14:10:38'),
(17, 'asd', 'aszxcd@gasmail.com', NULL, '$2y$12$NeVb.70XqwtrKFYFJ5.61eTNX788fahPyxMbUFhA3tA0WOjsLP4eq', NULL, 0, 0, 0, '2024-06-21 14:11:25', '2024-06-21 14:11:25'),
(18, 'asd', 'aszxczxcd@gasmail.com', NULL, '$2y$12$dFNbZ6wrN08l7sIGawVFzuBcUMYKCrE2ty5FtHZBA/FbieqN/cX/2', NULL, 0, 0, 0, '2024-06-21 14:11:43', '2024-06-21 14:11:43'),
(19, 'asdc', 'asc@asd.com', NULL, '$2y$12$jm3MgjA8oHjtGgd0K2VeRu7pL25zd7qXwbZUYaUBVEGH3v64dcV92', NULL, 0, 0, 1, '2024-06-21 14:14:14', '2024-06-22 10:22:11'),
(20, 'asdc', 'asc@aszxcd.com', NULL, '$2y$12$FtzevZKQ.eeNYe5c1hZB2uumbSxPtFAMTlP0vMvAErvZ.Yv8h7X4O', NULL, 0, 0, 1, '2024-06-21 14:17:16', '2024-06-22 10:21:42');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5558;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `shipping_charge`
--
ALTER TABLE `shipping_charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
