-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2025 at 01:45 AM
-- Server version: 10.11.14-MariaDB
-- PHP Version: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smmpawc1_titu`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `category_id`, `image`, `link`, `status`, `created_at`, `updated_at`) VALUES
(16, 1, 'public/uploads/banner/175567755150-2-1400x438-1.webp', '#', 1, '2025-08-20 08:12:31', '2025-08-20 08:12:31'),
(17, 1, 'public/uploads/banner/1759118976Adobe Express - file.png', '#', 1, '2025-08-20 08:13:49', '2025-09-29 04:09:36'),
(18, 1, 'public/uploads/banner/1757100609rsz_1black_bold_streetwear_fashion_presentation.jpg', '#', 1, '2025-09-05 19:30:09', '2025-09-05 19:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `banner_categories`
--

CREATE TABLE `banner_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_categories`
--

INSERT INTO `banner_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Slider (1060x395)', 1, '2023-02-21 03:05:14', '2023-10-01 04:15:55'),
(5, 'Slider Bottom Ads (425X212px)', 1, '2023-11-19 04:36:08', '2023-11-19 05:25:34'),
(6, 'Footer Top Ads', 1, '2023-11-19 05:25:46', '2023-11-19 05:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT 'public/uploads/category/default.png',
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(18, 'Zara', 'zara', NULL, 1, '2025-08-24 19:43:46', '2025-08-24 19:43:46'),
(19, 'Tommy Hilfiger', 'tommy-hilfiger', NULL, 1, '2025-08-24 19:43:59', '2025-08-24 19:43:59'),
(20, 'G-Star Raw', 'g-star-raw', NULL, 1, '2025-08-24 19:44:14', '2025-08-24 19:44:14'),
(21, 'Guess', 'guess', NULL, 1, '2025-08-24 19:44:22', '2025-08-24 19:44:22'),
(22, 'Gant', 'gant', NULL, 1, '2025-08-24 19:44:33', '2025-08-24 19:44:33'),
(23, 'Calvin Calin', 'calvin-calin', NULL, 1, '2025-08-24 19:44:57', '2025-08-24 19:44:57'),
(24, 'Adidas', 'adidas', NULL, 1, '2025-08-24 19:53:31', '2025-08-24 19:53:31'),
(25, 'Lee', 'lee', NULL, 1, '2025-08-24 21:19:45', '2025-08-24 21:19:45'),
(26, 'Gucci', 'gucci', NULL, 1, '2025-09-30 22:11:13', '2025-09-30 22:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `banner_title` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `review` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_one` text DEFAULT NULL,
  `image_two` text DEFAULT NULL,
  `image_three` text DEFAULT NULL,
  `status` varchar(55) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `banner_title`, `video`, `name`, `slug`, `short_description`, `description`, `review`, `product_id`, `image_one`, `image_two`, `image_three`, `status`, `banner`, `created_at`, `updated_at`) VALUES
(5, NULL, 'Arza Mart', NULL, 'Arzamart || Online Shopping', 'arzamart-online-shopping', '<p>test</p>', '<p>test</p>', 'https://www.facebook.com/photo/?fbid=1891671368294200&set=a.108147433313278', 174, 'public/uploads/campaign/1756677793-img_8399.webp', 'public/uploads/campaign/1756542674-1756120222-2.webp', 'public/uploads/campaign/1756542674-1756120104-1.webp', '1', '/tmp/phpEEaVav', '2025-08-30 08:31:15', '2025-08-31 22:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_products`
--

CREATE TABLE `campaigns_products` (
  `id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_reviews`
--

CREATE TABLE `campaign_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_reviews`
--

INSERT INTO `campaign_reviews` (`id`, `image`, `campaign_id`, `created_at`, `updated_at`) VALUES
(3, 'public/uploads/campaign/1708589841-company-rating.png', 1, '2024-02-22 08:17:21', '2024-02-22 08:17:21'),
(4, 'public/uploads/campaign/1708589841-company-rating.png', 1, '2024-02-22 08:17:21', '2024-02-22 08:17:21'),
(5, 'public/uploads/campaign/1708589841-company-rating.png', 1, '2024-02-22 08:17:21', '2024-02-22 08:17:21'),
(7, 'public/uploads/campaign/1756677735-img_8399.jpg', 5, '2025-08-31 22:02:15', '2025-08-31 22:02:15'),
(8, 'public/uploads/campaign/1756677735-6.jfif', 5, '2025-08-31 22:02:15', '2025-08-31 22:02:15'),
(9, 'public/uploads/campaign/1756677737-img_8399.jpg', 5, '2025-08-31 22:02:17', '2025-08-31 22:02:17'),
(10, 'public/uploads/campaign/1756677737-6.jfif', 5, '2025-08-31 22:02:17', '2025-08-31 22:02:17'),
(11, 'public/uploads/campaign/1756847416-1756120222-2.jpg', 6, '2025-09-02 21:10:16', '2025-09-02 21:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT 'public/uploads/category/default.png',
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `front_view` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `image`, `meta_title`, `meta_description`, `front_view`, `status`, `created_at`, `updated_at`) VALUES
(14, 0, 'Men\'s Cargo Pant', 'men\'s-cargo-pant', 'public/uploads/category/1756113155-img_8485.webp', 'Men\'s Cargo Pant', '<p>Men\'s Cargo Pant</p>', 1, 1, '2025-08-24 19:26:52', '2025-08-25 09:12:37'),
(15, 0, 'Men\'s Joggers', 'men\'s-joggers', 'public/uploads/category/1756113623-blue-and-grey-photo-collage-fashion-sale-instagram-story-(1).webp', 'Men\'s Joggers', '<p>Men\'s Joggers </p>', 1, 1, '2025-08-24 19:27:20', '2025-08-25 09:20:23'),
(16, 0, 'Kid\'s Cargo Pant', 'kid\'s-cargo-pant', 'public/uploads/category/1756113668-screenshot_8.webp', 'Kid\'s Cargo Pant', '<p>Kid\'s Cargo Pant </p>', 1, 1, '2025-08-24 19:28:49', '2025-08-25 09:21:08'),
(17, 0, 'Kid\'s Joggers', 'kid\'s-joggers', 'public/uploads/category/1756113685-4.webp', 'Kid\'s Joggers', '<p>Kid\'s Joggers</p>', 1, 1, '2025-08-24 19:29:04', '2025-08-25 09:21:26'),
(18, 0, 'Hot Deal', 'hot-deal', 'public/uploads/category/1757009881-q05hxqaghdxemnkdo6r57o2gl5skbigzobkccxou.webp', NULL, NULL, 1, 0, '2025-09-04 18:18:01', '2025-09-04 18:20:21'),
(19, 0, 'Men\'s Denim Long Pant', 'men\'s-denim-long-pant', 'public/uploads/category/1759271295-pn05-jack-&-jons-combo.jfif', 'Mens Denim Long Pant', NULL, 1, 1, '2025-09-16 21:49:35', '2025-09-30 22:28:15'),
(20, 0, 'Men\'s Hoodie', 'men\'s-hoodie', 'public/uploads/category/1759271256-1759271078139-01999cba-1125-7e8b-9c66-cccece927987.webp', 'Hoodie', '<p>Hudi , Sweatshirt , jacket </p>', 1, 1, '2025-09-30 22:08:46', '2025-09-30 22:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `childcategoryName` varchar(255) NOT NULL DEFAULT 'text',
  `slug` varchar(255) NOT NULL DEFAULT 'text',
  `subcategory_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `childcategoryName`, `slug`, `subcategory_id`, `meta_title`, `meta_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'চাল-ডাল', 'চাল-ডাল', 2, 'চাল-ডাল', '<p>চাল-ডাল</p>', 0, '2024-12-08 09:37:37', '2025-08-25 12:25:26');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `colorName` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `colorName`, `color`, `status`, `created_at`, `updated_at`) VALUES
(32, 'Aqua', '#00FFFF', '1', '2023-11-03 06:04:29', '2023-11-03 09:23:46'),
(35, 'Black', '#000000', '1', '2023-11-03 06:09:13', '2023-11-03 06:09:22'),
(36, 'Bright Blue', '#0096FF', '1', '2023-11-03 06:09:30', '2023-11-03 06:09:38'),
(39, 'Coral', '#FF7F50', '1', '2023-11-03 06:10:23', '2023-11-03 06:10:31'),
(40, 'Gray', '#999999', '1', '2023-11-03 06:10:40', '2023-11-03 06:10:48'),
(41, 'Green', '#008000', '1', '2023-11-03 06:10:57', '2023-11-03 06:11:05'),
(42, 'Hot Pink', '#FF69B4', '1', '2023-11-03 06:11:24', '2023-11-03 06:11:29'),
(44, 'Pink', '#FFC0CB', '1', '2023-11-03 06:12:03', '2023-11-03 08:50:43'),
(48, 'Magenta', '#FF00FF', '1', '2023-11-03 06:13:28', '2023-11-03 06:13:39'),
(49, 'Maroon', '#990000', '1', '2023-11-03 06:13:51', '2023-11-03 06:14:00'),
(50, 'Grass Green', '#7CFC00', '1', '2023-11-03 06:14:14', '2023-11-03 06:59:07'),
(51, 'Navy', '#000080', '1', '2023-11-03 06:14:30', '2023-11-03 06:14:41'),
(52, 'Blue', '#0000FF', '1', '2023-11-03 06:15:01', '2023-11-03 09:53:12'),
(53, 'Olive', '#808000', '1', '2023-11-03 06:15:26', '2023-11-03 06:15:37'),
(54, 'Orange', '#FFA500', '1', '2023-11-03 06:15:46', '2023-11-03 06:15:58'),
(55, 'Yellow Orange', '#FFAA33', '1', '2023-11-03 06:16:17', '2023-11-03 07:03:16'),
(56, 'Orchid', '#DA70D6', '1', '2023-11-03 06:16:35', '2023-11-03 06:16:42'),
(58, 'Purple Heart', '#8b1ec4', '1', '2023-11-03 06:17:09', '2023-11-03 06:17:20'),
(59, 'Red', '#FF0000', '1', '2023-11-03 06:17:30', '2023-11-03 06:17:42'),
(60, 'Canary Yellow', '#FFFF8F', '1', '2023-11-03 06:17:51', '2023-11-03 08:24:41'),
(61, 'Salmon', '#FA8072', '1', '2023-11-03 06:18:13', '2023-11-03 06:18:24'),
(62, 'Navy Blue', '#000080', '1', '2023-11-03 06:18:44', '2025-08-24 19:55:45'),
(63, 'Gold', '#FFD700', '1', '2023-11-03 06:19:02', '2023-11-03 07:08:05'),
(64, 'Crimson', '#DC143C', '1', '2023-11-03 06:37:11', '2023-11-03 09:19:11'),
(65, 'Silver', '#C0C0C0', '1', '2023-11-03 06:40:45', '2023-11-03 09:11:55'),
(67, 'Light Orange', '#FFD580', '1', '2023-11-03 07:13:52', '2023-11-03 07:14:03'),
(68, 'White', '#FFDEAD', '1', '2023-11-03 07:15:18', '2025-08-24 19:54:51'),
(69, 'Pumpkin Orange', '#FF7518', '1', '2023-11-03 07:17:29', '2023-11-03 07:17:38'),
(70, 'Chocolate', '#D2691E', '1', '2023-11-03 08:01:35', '2023-11-03 08:34:09'),
(73, 'Biscuit', '#FAD7A0', '1', '2023-11-03 09:09:43', '2023-11-03 09:10:20'),
(74, 'Black Wash', '#c4c4c4', '1', '2025-08-24 18:27:42', '2025-08-24 18:27:42'),
(75, 'Deep Blue Wash', '#0a008f', '1', '2025-08-24 18:28:03', '2025-08-24 18:28:03'),
(76, 'Light Blue Wash', '#00008B', '1', '2025-08-24 18:28:15', '2025-08-24 18:29:14'),
(77, 'Brown', '#f0e68c', '1', '2025-08-24 18:46:13', '2025-08-24 18:46:13'),
(78, 'Grey', '#a3a3a3', '1', '2025-08-24 19:03:27', '2025-08-24 19:03:27'),
(79, 'Cream', '#fffdd0', '1', '2025-08-24 19:04:15', '2025-08-24 19:04:15'),
(80, 'Ash', '#cfcfcf', '1', '2025-08-24 19:53:55', '2025-08-24 19:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `hotmail` varchar(50) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `maplink` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `hotline`, `hotmail`, `phone`, `email`, `address`, `maplink`, `status`, `created_at`, `updated_at`) VALUES
(1, '01951887919', 'arzamart6549@gmail.com', '01951887919', 'arzamart6549@gmail.com', 'Nabinogor Housing Mohammadpur', NULL, 1, '2025-08-19 21:18:14', '2025-08-20 07:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `courierapis`
--

CREATE TABLE `courierapis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(55) DEFAULT NULL,
  `api_key` varchar(155) DEFAULT NULL,
  `secret_key` varchar(155) DEFAULT NULL,
  `url` varchar(99) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courierapis`
--

INSERT INTO `courierapis` (`id`, `type`, `api_key`, `secret_key`, `url`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'steadfast', 'YqaQ1QYanj', 'H3bW5MNFPf8LlrVLKly0WEs61yfvSmqEDlnNdcf6', 'https://portal.steadfast.com.bd/api/v1/create_order', 'asdfdsfdsafdsf', '0', '2024-02-06 11:29:46', '2024-11-22 13:32:43'),
(2, 'pathao', '', '', 'https://api-hermes.pathao.com/aladdin', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYxNzVkOWQyODAwNjk2YzU4Y2E1MmZkMGQ5Y2RiZWRkYTBhN2I5YjU0YTIwNTQxNzVhZTVlZjYwNzg2ZTU1MzU1NzYxM2JhZGZhNjcwMzdmIn0.eyJhdWQiOiI0MTkyIiwianRpIjoiNjE3NWQ5ZDI4MDA2OTZjNThjYTUyZmQwZDljZGJlZGRhMGE3YjliNTRhMjA1NDE3NWFlNWVmNjA3ODZlNTUzNTU3NjEzYmFkZmE2NzAzN2YiLCJpYXQiOjE3MDM0MzY4NDQsIm5iZiI6MTcwMzQzNjg0NCwiZXhwIjoxNzExMjEyODQzLCJzdWIiOiIxNzM5MTIiLCJzY29wZXMiOltdfQ.VARDX-r01cIf0uPE_CFItJ44BfyB8-tD0rmXAt9r-DT545rIDKW97VsMWd2jfghQjbnLY8C-nL5yMOCz759IGT-2ApSOCtND1b1Dp_AahtGVDrqKnYn_ZZrWWfdHQ-OYsxGVpH3Cat3kgVafIDcpJJdTTYmtmESrr3dulGCBS4WuyGpNnBnz5TjGk6d3UD83-RG9Ud37x5hSZBJwXM85xrX3AotCo9MhQti7hmsve8Mf4Z2qJSjJBCDPTrjoKDYNsSWqgVtKCYLv3H2mnXu5Ecsp0bxRdTYLzzVZaqF-B8sYYTOeseASgKuE5XQl1NOOCXBr9gBdEC1FD--lpElgG_FeQwvelhpeQ2yyze806ipkY8wNNqEvm9pC9uJ0n7ZmbSezJUYghC7vfi1iEmDOcB9JQxX9WOFi1VKSSOG-u__SQcYRmtAJ8LrTwL8zDMruL4uYFNGe17F-PuRH8ncp_FZK6Q_xuJY7CcDPwCw3E0_SMnmMU7ND25hoUpNly41j9y2G9UaGovfwD-QosPozAqACdRdyqP6cn3icNPY2kp7sSdKLsUIUOZox5ugfjbYC9wC6fzdYED0U85QDA4nPj0NGDVutTcFdED-Yzmmd-VNJVNI9cALfVDfKrpHlWpQMSeeZ7dc16NA0SrayF5DgQbpYg6CbGskmWTCsgmuWFvw', '0', '2024-02-06 11:29:46', '2024-02-10 12:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `create_pages`
--

CREATE TABLE `create_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `create_pages`
--

INSERT INTO `create_pages` (`id`, `name`, `slug`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Order procedure', 'order-procedure', 'Order procedure', 'Just let us know We will Reach you', 1, '2023-10-04 07:02:30', '2023-11-26 18:58:27'),
(3, 'Delivery Rules', 'delivery-rules', 'Delivery Rules', '<p><br></p>', 1, '2023-10-04 07:03:00', '2024-01-15 17:41:53'),
(5, 'Return Policy', 'return-policy', 'Return Policy', 'Np Return Policy', 1, '2023-10-04 07:03:42', '2023-11-26 19:00:02'),
(6, 'Terms & Conditions', 'terms-&-conditions', 'Terms & Conditions', '<p>ORDER CONFIRMED AND PAID</p>', 1, '2023-10-04 07:04:05', '2023-11-26 18:59:36'),
(7, 'Privacy Policy', 'privacy-policy', 'Privacy Policy', 'BDSHOPY.COM', 1, '2023-10-04 07:04:19', '2024-11-22 11:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(155) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `verify` int(11) DEFAULT NULL,
  `forgot` varchar(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'public/uploads/default/user.png',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `slug`, `phone`, `email`, `district`, `area`, `address`, `verify`, `forgot`, `image`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(44, 'Md. Maruf Hasan', 'Md. Maruf Hasan', '01625326736', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$/mBZVzKtINJNGQL.0vgny.1bN98j93LaVcQzRckZztsAUqUariR0S', NULL, 'active', '2025-08-20 13:30:48', '2025-08-20 13:30:48'),
(45, 'Rakib', 'Rakib', '01422662829', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$ihDQ.UXEo4.CbVSmm0iv5OGvNH4r6sc/3.lUIcSIuYs55xwZkzlFy', NULL, 'active', '2025-08-20 13:46:29', '2025-08-20 13:46:29'),
(46, 'মো বাকের মিয়া', 'মো বাকের মিয়া', '01731594523', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$6Lwqu82ZTZDAoMiDlzZKLe2I1lrsTDKERJYFjUtkmf0vP7s.ezdJS', NULL, 'active', '2025-08-24 21:53:03', '2025-08-24 21:53:03'),
(47, 'T2', 't2-47', '01796735577', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$lxsBa0XVcoMx3XWhSWvAfugeC2DU.80ZhcXd3plNsC0k7/se8o4Xi', NULL, 'active', '2025-08-25 16:48:08', '2025-08-25 16:48:08'),
(48, 'Tito', 'Tito', '01951887919', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$tqJPMn.VsNNsHm9P2EEV5ugL4YEOFGcwn6gpHSUpnmQMrwi8MkSwq', NULL, 'active', '2025-08-26 07:49:33', '2025-08-26 07:49:33'),
(49, 'Dr Tuhin', 'Dr Tuhin', '01910005530', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$HFu77h6Df9p3Clx7x2XpxedOuh31osxU34Gjjf3IkpKecm3tTyYHW', NULL, 'active', '2025-09-01 05:03:50', '2025-09-01 05:03:50'),
(50, 'Al-Amin Haque', 'Al-Amin Haque', '01793802539', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$9EBSfJpuxUGHPKjVPy1.r.NYwTkStS6Hn.MBKxg8eR5q4X5lvyjaa', NULL, 'active', '2025-09-02 05:26:33', '2025-09-02 05:26:33'),
(51, 'sajidul', 'sajidul', '01608742331', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$MGu6djoEwZ2sknnd7GOfgegyhQa/zI.f36Ci3rWTHUDkmB53AtPuW', NULL, 'active', '2025-09-02 17:11:13', '2025-09-02 17:11:13'),
(52, 'Belal Hossain', 'Belal Hossain', '01765419177', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$awpQRW3QGKT.oE6LWHN8Iu7obRpxwh5ql1h4qEGlxXI5iXE3mOK6W', NULL, 'active', '2025-09-03 05:39:51', '2025-09-03 05:39:51'),
(53, 'আব্দুল মুমিন', 'আব্দুল মুমিন', '01743997133', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$xKU/HqrAqvfyMVMaN4P2J.ER8C7qHE6HqSOAbPrIH88VpPU6gfAMa', NULL, 'active', '2025-09-03 08:24:41', '2025-09-03 08:24:41'),
(54, 'Saiful', 'Saiful', '01711613263', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$QW9lh4v/p3gd74iTNCP37OGLEt95aIKUw9d3g1xdl2/mZ/Bdksmdq', NULL, 'active', '2025-09-03 18:01:19', '2025-09-03 18:01:19'),
(55, 'আবু বক্কর01335899807', 'আবু বক্কর01335899807', '01335899807', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$wQJvgW4k/q8SiiqaB5U/4uyrs1FHQyte4KeUzKEmKbBCyqKJU6LJa', NULL, 'active', '2025-09-04 15:21:44', '2025-09-04 15:21:44'),
(56, 'Md.Mostakim Hossain', 'Md.Mostakim Hossain', '01609616556', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$PRu2RNWsc6K.sx.caObjbeCTn0B6N5QYpDi5b0GJY3MYzUq/16UoO', NULL, 'active', '2025-09-04 18:31:14', '2025-09-04 18:31:14'),
(57, 'MD Abdullah sk', 'MD Abdullah sk', '01985406736', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$dJSl995JV3cmR2TQvDVu2.3VkZPQPoakkvG2mdLfwsa/SFFLQ03AO', NULL, 'active', '2025-09-05 03:15:50', '2025-09-05 03:15:50'),
(58, 'mrinal sarker', 'mrinal sarker', '01716466738', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$msfy4NBiehSndO4MwnAbFu1gWtrbt.6n1EEmUwvTnZQvSynxp/B.G', NULL, 'active', '2025-09-05 17:51:09', '2025-09-05 17:51:09'),
(59, 'মো বাপিপ', 'মো বাপিপ', '01975826549', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Q4gzMopHbBpC0ejoVpCuPuT7Xs.Lw.NSHGxBPLoG4Ks5xZxRMIqLW', NULL, 'active', '2025-09-06 01:09:45', '2025-09-06 01:09:45'),
(60, 'আবু বক্কর সিদ্দিক', 'আবু বক্কর সিদ্দিক', '01875496311', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$PfzsbLqUvd0gVBuO/wN40.Mr2nv7oh9WiSGmDE5bdFhawjc6QJkmm', NULL, 'active', '2025-09-06 17:12:51', '2025-09-06 17:12:51'),
(61, 'সুজন মাহমুদ,', 'সুজন মাহমুদ,', '01934013711', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$RxNDxX/FPaPaSbQ9uNwSCOjxXp/vhJZSIKqdUJkMwD6rpWJ7aj9.W', NULL, 'active', '2025-09-06 23:13:57', '2025-09-06 23:13:57'),
(62, 'আশিক আহমেদ', 'আশিক আহমেদ', '01766633979', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Qw9cu8angIdvh7b.22PILOM9DO2tXKQJ1gcxGNnzJ8/FVGVB.8eO.', NULL, 'active', '2025-09-07 12:05:14', '2025-09-07 12:05:14'),
(63, 'Md.Ferdous alam Khokon', 'Md.Ferdous alam Khokon', '01670227118', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Xrxmim4PPJTyUAfbvG1AxudEptj6b.0vwQY.yUDWwIE9sU5svrs3.', NULL, 'active', '2025-09-08 09:42:47', '2025-09-08 09:42:47'),
(64, 'আরিয়ান', 'আরিয়ান', '01722594242', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$TgPclXNJ6rY4k053ZWXOP.WIwsD/0miET2tHkTpnApmyEyx6T14am', NULL, 'active', '2025-09-08 17:02:10', '2025-09-08 17:02:10'),
(65, 'Md sayed', 'Md sayed', '01917229891', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$FNCs4MuUjpbE2y4igys12.m/XlcowKQcTHt53rQIJWmb0TcGcGm4y', NULL, 'active', '2025-09-09 10:41:19', '2025-09-09 10:41:19'),
(66, 'Amin Hossien', 'Amin Hossien', '01875990082', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$x9fkgAO3MalPjxSUMVE.ruW8aJFNe8Iu9aoF/H6eo4ORfULDoDmdy', NULL, 'active', '2025-09-09 13:02:35', '2025-09-09 13:02:35'),
(67, 'মুন্না ইসলাম', 'মুন্না ইসলাম', '01400605490', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$fSuBSMZ/BT7KmUwI3BYgHO2bZEeI0aMJK2YDoXnVi0jS2QEPoVhBy', NULL, 'active', '2025-09-10 17:10:29', '2025-09-10 17:10:29'),
(68, 'ইসমাইল', 'ইসমাইল', '01757086310', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$trz950ADFOCf/FAut.rJOO32UhzkpCeKZZC2/oW864hJxVRs4E22u', NULL, 'active', '2025-09-10 23:47:17', '2025-09-10 23:47:17'),
(69, 'মো:ফোরকান', 'মো:ফোরকান', '01714469201', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$qBGSN8jMN0b9uVNBJaI5zeqtBO4UFOZZSvgADW6fr3yPGpV4Eag4q', NULL, 'active', '2025-09-11 16:45:47', '2025-09-11 16:45:47'),
(70, 'Samad Ahmed', 'Samad Ahmed', '01614119004', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$SNPbq.GHJUWuwfqIyUB1buOaRp/ImMcQBqh9aOaNsI/j34s6ccAzi', NULL, 'active', '2025-09-12 16:49:19', '2025-09-12 16:49:19'),
(71, 'Ripon mhamud', 'Ripon mhamud', '01750167633', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$xTA2kkkO0dujh88mHqso6e1bzIvYLM8TSM4RIkwq2lm95JEZj5gM6', NULL, 'active', '2025-09-14 12:31:17', '2025-09-14 12:31:17'),
(72, 'মোশাররফ', 'মোশাররফ', '01345724896', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$b7txbnICSBxaeac3IfRdL./Vs9pn9SO4ITFCxvd7t5Lyv3DbLh72e', NULL, 'active', '2025-09-15 15:00:21', '2025-09-15 15:00:21'),
(73, 'লিটন', 'লিটন', '01753199686', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$IVLWBbUaaUPqlCVu6DSF9.CsrGTpz.o2mzjeowV1SV51Yy/fkjDTS', NULL, 'active', '2025-09-15 19:03:39', '2025-09-15 19:03:39'),
(74, 'Methun', 'Methun', '01644059517', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$E5JDOwWy/RSuah8xV0skIewuCr6yGfdw5chmRp4WLqCl21tAJLm8C', NULL, 'active', '2025-09-15 19:05:33', '2025-09-15 19:05:33'),
(75, 'Mohammed Hossain noyon', 'Mohammed Hossain noyon', '01643114270', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$sy1Z/n32g74uf0XCI7f/dOs98PlFAJ5S4TKLyrWw9EI5aaWUSroke', NULL, 'active', '2025-09-15 20:10:56', '2025-09-15 20:10:56'),
(76, 'Raktim', 'Raktim', '01751423500', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$KzAL4jlKG6Qkr7sTdfRsPe/ULTdiqij/k8CWVjfYXs7HFiRutvHuy', NULL, 'active', '2025-09-16 13:49:48', '2025-09-16 13:49:48'),
(77, 'Sabbir Ahmed', 'Sabbir Ahmed', '01912573137', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$YN5aZMqArvTKmZ9iB223henZjYvrYuZpbUXNE8SMcwb8NKJMBqa96', NULL, 'active', '2025-09-16 17:57:39', '2025-09-16 17:57:39'),
(78, 'হাসু', 'হাসু', '01701805665', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$VuGj3hAVCbt7P0QireVrBeBeoQD0nGS5M/U2LXn89teVJg6MYl7Xm', NULL, 'active', '2025-09-17 15:13:04', '2025-09-17 15:13:04'),
(79, 'Pritom', 'Pritom', '01797805896', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$azc7ShoUe4JDP.Ak/xGR4e9TybQd.9oa7OAq.fD6Tj8yaOxkI/SqW', NULL, 'active', '2025-09-18 03:43:14', '2025-09-18 03:43:14'),
(80, 'Md.Nazim uddin', 'Md.Nazim uddin', '01316328509', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Exyr3/gQJG.ak36jacDAuO1M3ZLT0MisP0hxmw0DcAgDAlhTKO6tq', NULL, 'active', '2025-09-18 07:00:04', '2025-09-18 07:00:04'),
(81, 'Parvej alam', 'Parvej alam', '01723043043', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$AC.kS.Y4IT6GiSZiukUUc.GLEz7ufhswuSU95AV7VrUKE9Fd.Itgy', NULL, 'active', '2025-09-18 13:22:38', '2025-09-18 13:22:38'),
(82, 'Mohammad Arif', 'Mohammad Arif', '01684291523', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$IgwDkpMm7gr7aEDjczRlhuncEfc9U50Z5IFSHlcdA2BoplKVGMHyy', NULL, 'active', '2025-09-18 18:34:23', '2025-09-18 18:34:23'),
(83, 'শাহীন', 'শাহীন', '01336451397', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$myOE62Yhm..RpMykX4XaheAt2/6m7/bDiv7Z5P7nANvPlTk5YDqhW', NULL, 'active', '2025-09-18 19:03:07', '2025-09-18 19:03:07'),
(84, 'Shoaib hasan', 'Shoaib hasan', '01600242672', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$LtXd3MVSv79YBuLFSuscCeLwLr0ex7sVwBWh5PlWByL9K/UES7z9q', NULL, 'active', '2025-09-19 08:33:28', '2025-09-19 08:33:28'),
(85, 'Abdul Rafiq', 'Abdul Rafiq', '01918893621', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$wW2JDShCb7hfVbf2FxXtM.nK4cUr7pFyhZVxT2Uhrl6xDIubZZWGy', NULL, 'active', '2025-09-19 09:46:24', '2025-09-19 09:46:24'),
(86, 'মাসুদ রানা', 'মাসুদ রানা', '01799879787', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$r7A7vj1QXAIcElfsMqQc7.FXcd/qnYRTZpyHb3niZkQRc.C55eCqe', NULL, 'active', '2025-09-19 14:22:18', '2025-09-19 14:22:18'),
(87, 'Shuvro Deb', 'Shuvro Deb', '01738476803', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$pt4NxJc8Aa0eg7IGOedF5OeTiWLjpEiAPciiGckl4hK9ox6RGsHa6', NULL, 'active', '2025-09-19 15:13:00', '2025-09-19 15:13:00'),
(88, 'জীবন', 'জীবন', '01716762700', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$h1HPph52VUobBybGdwflp.JBwj3D5jhHpJrbVwEAambC6rgL.XBua', NULL, 'active', '2025-09-19 17:43:36', '2025-09-19 17:43:36'),
(89, 'MAHEEN Hossain', 'MAHEEN Hossain', '01711771566', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$PO.Q.Q3OeRP7LMu8Z13PYuMMr7NAF971M5W.EiM1kRVELjgPY0pxe', NULL, 'active', '2025-09-21 17:34:28', '2025-09-21 17:34:28'),
(90, 'Osman', 'Osman', '01926088836', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$ff8dfpklY5hoJttXo084POXDW/ZXexuPKMioZmhY8g8R9BnUntXpi', NULL, 'active', '2025-09-21 19:36:52', '2025-09-21 19:36:52'),
(91, 'পৃথিশ সরকার', 'পৃথিশ সরকার', '01337415754', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$HxSK/MQq1k7J/FgsBsxJpO/GQWGkMCACbH8wz7J0jUXdduXN3A/9q', NULL, 'active', '2025-09-22 03:24:39', '2025-09-22 03:24:39'),
(92, 'BADRUL HUSSAIN', 'BADRUL HUSSAIN', '01812410726', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$JXycCDQ0CvNP0fanvcr3A.0V2lF12unWgo/Gu0bCmvVb8ka8oX9cS', NULL, 'active', '2025-09-22 21:07:22', '2025-09-22 21:07:22'),
(93, 'মাহমুদ', 'মাহমুদ', '01308110309', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$cg.M7pE5cCDZ86AW0xV1c.dClcrlGM5mt3PjvnSjcUS9YgEuj/pva', NULL, 'active', '2025-09-23 06:28:14', '2025-09-23 06:28:14'),
(94, 'Mesbahul alam', 'Mesbahul alam', '01676556219', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$1yO/TkhFe.//.6wx3vA7UOPlJ.1HUCjUM1c6dDIrUD7pqh6A4GtZW', NULL, 'active', '2025-09-24 04:33:57', '2025-09-24 04:33:57'),
(95, 'পৃথিশ সরকার', 'পৃথিশ সরকার', '01829746444', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$YQvaN6Rb4iH60OXFVxPyUOxmBgVggnv6/loAXGjVJY7cFyqApRFmW', NULL, 'active', '2025-09-24 18:04:07', '2025-09-24 18:04:07'),
(96, 'Nayan', 'Nayan', '01612222663', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$mCGe.YiITHuOFB.jNly0yug9jEk7v2dbe4ZlQXjMxa9lMMsrLUy4.', NULL, 'active', '2025-09-25 14:04:28', '2025-09-25 14:04:28'),
(97, 'Niranjan Mallick', 'Niranjan Mallick', '01715797422', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$RQRgvW5B3nZhCQGA/kgwZOGTMZqFO/ol67ODBv2t29KsOEi6Ag.Zi', NULL, 'active', '2025-09-25 19:05:26', '2025-09-25 19:05:26'),
(98, 'Mamun islam', 'Mamun islam', '01952202830', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$emgVFM/xCozNhB1TvR/DXOTivPie5HhfFrL05Aucw8a4z8k.i3fGa', NULL, 'active', '2025-09-25 22:26:25', '2025-09-25 22:26:25'),
(99, 'Limon', 'Limon', '01605670208', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$pyBqrxr0XeY6FXwb58YfiexzaVRzioOpsvef3f6bKrRN0.HEPVuKy', NULL, 'active', '2025-09-26 16:49:37', '2025-09-26 16:49:37'),
(100, 'ইসমাইল', 'ইসমাইল', '01971775751', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$BPks.v8dRBS/fImTru4VCOneKJM7X2OsVAWrFvm3ZJlZpfnMbwPUG', NULL, 'active', '2025-09-27 05:46:09', '2025-09-27 05:46:09'),
(101, 'Md Alomgir', 'Md Alomgir', '01772751795', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$jRY3H.sONnfOpfLPeVkuLeko2HcXGruNIKPBPGi14v907E4bxa/OK', NULL, 'active', '2025-09-29 08:04:17', '2025-09-29 08:04:17'),
(102, 'সাজ্জাদ', 'সাজ্জাদ', '01753573639', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$3uQiZle2vTvKT9IiwImqi.Uoojh82t1Zd3O8JNPlk28i4eR5dwUhq', NULL, 'active', '2025-09-30 18:24:45', '2025-09-30 18:24:45'),
(103, 'Sakib', 'Sakib', '01834426270', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$4xCnIffotX8FlQUW4VgXoutuVnPHJJW7t7q5FXFuUuOuc4.Fv6Hv.', NULL, 'active', '2025-10-01 20:33:17', '2025-10-01 20:33:17'),
(104, 'Shahidullah Rakib', 'Shahidullah Rakib', '01711272520', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$4mSe8S9m0RTLEgC1JiAr.unn99O65heFVNW9Hh8uz9vC44zvOkEAW', NULL, 'active', '2025-10-04 05:42:07', '2025-10-04 05:42:07'),
(105, 'মোঃ রনি আহম্মেদ', 'মোঃ রনি আহম্মেদ', '01729624364', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$hTbZlqp4FUqnXSPIGrLnoed4aZog2NgkhbAEbsC70GfowqJV1M8Wu', NULL, 'active', '2025-10-05 11:03:58', '2025-10-05 11:03:58'),
(106, 'MD. ARMAN ISLAM', 'MD. ARMAN ISLAM', '01838759405', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$3GeH1CJwC6IcYKMj.kRd2uHB4TOfojZy.D5z02KdzHBgIfSMUOHri', NULL, 'active', '2025-10-06 07:54:46', '2025-10-06 07:54:46'),
(107, 'সোহাগ', 'সোহাগ', '01644439534', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$1fQJla1VdCvBuaCdkMHvCOzpUQ0lzDYjTQYYy.Am0x/G9lt8V6hhK', NULL, 'active', '2025-10-06 07:55:43', '2025-10-06 07:55:43'),
(108, 'মো: নাহিদ সরকার', 'মো: নাহিদ সরকার', '01304934633', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Vo/JpWUhT7YJnHw0P.ciA.UQGOzqlBwqvIesNPUVqY8ohkCv2TXnC', NULL, 'active', '2025-10-06 18:03:10', '2025-10-06 18:03:10'),
(109, 'নুরনবী', 'নুরনবী', '01829218451', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$RfCIvhKhOPXIeKPb1AjXAe0.qldPjefcUO15ocdNXmq4UHvVlmCJi', NULL, 'active', '2025-10-07 03:39:37', '2025-10-07 03:39:37'),
(110, 'মোঃ শরিফুল ইসলাম', 'মোঃ শরিফুল ইসলাম', '01863698472', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$BLxjwSj1zy5IyRR3BK5BaOAeKTLJ8MMR87.7TJWm9GK60qHQgSdqq', NULL, 'active', '2025-10-07 15:13:46', '2025-10-07 15:13:46'),
(111, 'পলক.. বাংলা হিলি হাকিমপুর দিনাজপুর', 'পলক.. বাংলা হিলি হাকিমপুর দিনাজপুর', '01828741274', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$9Ym5xjToSikGYGzBqicT2uL1dwYKyjX6zATKHFvhsjJ1IP4.zXopm', NULL, 'active', '2025-10-07 15:49:42', '2025-10-07 15:49:42'),
(112, 'polok', 'polok', '01828741271', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$G931q7uuoKqntBqKQojj6u0yIGbYXVGVTgp0CNvlx6PYUnbg2lWvi', NULL, 'active', '2025-10-07 15:53:50', '2025-10-07 15:53:50'),
(113, 'Dipta Barua', 'Dipta Barua', '01824340687', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$v917DDSZTii5umBrghKcYOv3TATrdxScBpQe3UVuuypVYzi/1igT.', NULL, 'active', '2025-10-07 19:59:42', '2025-10-07 19:59:42'),
(114, 'Md Imran Hossain', 'Md Imran Hossain', '01883749464', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$ivYXOeqIoiIkmEle.ibODO7x0nk1X/W2y7Xhq7wWGsJUl7EHd4aGa', NULL, 'active', '2025-10-08 04:09:45', '2025-10-08 04:09:45'),
(115, 'Md Hamim shek', 'Md Hamim shek', '01752626580', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$.bho5n.Ozui54WvU1SXnpufHP8texoB9hwCMr7legY7DEgIBiGbmq', NULL, 'active', '2025-10-10 18:53:30', '2025-10-10 18:53:30'),
(116, 'মো: মনজুরুল ইসলাম', 'মো: মনজুরুল ইসলাম', '01738449544', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$voN99VptTJfA58t.aJ7hW.bC.7YnBB1GDCTlOJSm8QuQ.rOHHjYO2', NULL, 'active', '2025-10-11 10:26:00', '2025-10-11 10:26:00'),
(117, 'মোঃ ইমন গাজী', 'মোঃ ইমন গাজী', '01872441406', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$2Rr6EAr4AqnO0kajki5jJ.SGUO6N.QB8QL1ZsqnENyiQ5.LajivWi', NULL, 'active', '2025-10-12 16:47:40', '2025-10-12 16:47:40'),
(118, 'Shohag', 'Shohag', '01732149977', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Y/fpYvXUN56rUGEm6M7BiuFKc8hl0e2KjEqKBwQz88ucX5ngBiWGq', NULL, 'active', '2025-10-13 12:25:54', '2025-10-13 12:25:54'),
(119, 'মো রাসেল', 'মো রাসেল', '01944626156', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$0VuWakqXPTzdlUWMqcGAJ.4UL0p9Tlz0mIKWTOHnW5XX1u4xrDPLS', NULL, 'active', '2025-10-13 17:17:49', '2025-10-13 17:17:49'),
(120, 'Mobarak hosen', 'Mobarak hosen', '01728147004', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$VgFcHs04kZOgT6l0X35o1.tR1tPkRg6ORsOXxuemvQLd2jSWAXSNu', NULL, 'active', '2025-10-14 01:23:20', '2025-10-14 01:23:20'),
(121, 'Md alomgir hossen alomgir hossen', 'Md alomgir hossen alomgir hossen', '01712751165', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$Zveoibi/VnlOMWpx38hRr.jLwyMc762GefzEYJsVhZxJHYKlCmjMO', NULL, 'active', '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(122, 'JAHID HASAN', 'JAHID HASAN', '01812384855', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$5Sp8TI0ECPeJK37EQGqUEOEgMRkgdRruwYQkpzSDf4UwzL1d0/oze', NULL, 'active', '2025-10-21 03:22:10', '2025-10-21 03:22:10'),
(123, 'Arza Mart', 'Arza Mart', '01820025641', NULL, NULL, NULL, NULL, 1, NULL, 'public/uploads/default/user.png', '$2y$10$A8HDo3nzt57tfwq50bQCVOHC3KcekuzFNwlCqEwiRDddN7PqJUjs.', NULL, 'active', '2025-10-23 15:30:50', '2025-10-23 15:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `area_id` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `shippingfee` varchar(255) NOT NULL,
  `partialpayment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `area_id`, `area_name`, `district`, `shippingfee`, `partialpayment`, `created_at`, `updated_at`) VALUES
(1, 112, 'Pilkhana', 'Dhaka', '80', '200', '2021-10-23 19:02:41', '2022-12-10 04:25:24'),
(2, 1684, 'Katasur', 'Dhaka', '80', '200', '2021-10-24 19:02:41', '2022-12-10 04:25:24'),
(3, 6, 'Shyamoli', 'Dhaka', '80', '200', '2021-10-25 19:02:40', '2022-12-10 04:25:24'),
(4, 1685, 'Dhanmondi Staff Quarter', 'Dhaka', '80', '200', '2021-10-26 19:02:40', '2022-12-10 04:25:24'),
(5, 418, 'Dhaka Uddyan', 'Dhaka', '80', '200', '2021-10-27 19:02:40', '2022-12-10 04:25:24'),
(6, 7, 'Adabor', 'Dhaka', '80', '200', '2021-10-28 19:02:40', '2022-12-10 04:25:24'),
(7, 114, 'New Market', 'Dhaka', '80', '200', '2021-10-29 19:02:40', '2022-12-10 04:25:24'),
(8, 426, 'Shekhertek', 'Dhaka', '80', '200', '2021-10-30 19:02:40', '2022-12-10 04:25:24'),
(9, 155, 'Old Elephant Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(10, 1660, 'Dhanmondi - Rd 1', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(11, 326, 'Science Lab', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(12, 1661, 'Dhanmondi - Rd 2', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(13, 11, 'Lalmatia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(14, 327, 'Sobhanbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(15, 1690, 'Arshinagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(16, 145, 'Dhaka University', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(17, 1691, 'Washpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(18, 1692, 'Garden City', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(19, 1693, 'Boddhovumi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(20, 148, 'Kazi Nazrul Islam Avenue', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(21, 1187, 'Kaderabad Housing', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(22, 149, 'Kawran Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(23, 1662, 'Dhanmondi - Rd 4', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(24, 115, 'Azimpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(25, 162, 'Shahbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(26, 306, 'Monipuripara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(27, 309, 'Bosila', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(28, 1663, 'Dhanmondi - Rd 4A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(29, 19, 'Sher-E-Bangla Nagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(30, 116, 'Nilkhet', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(31, 163, 'Katabon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(32, 1664, 'Dhanmondi - Rd 6', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(33, 164, 'Hatirpool', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(34, 1210, 'Eastern Housing (Adabor)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(35, 1665, 'Dhanmondi - Rd 6', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(36, 1211, 'Teskunipara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(37, 1212, 'DHAKA TENARI MORE', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(38, 1666, 'Dhanmondi - Rd 3A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(39, 1213, 'Shahidnagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(40, 95, 'Bijoy Shoroni', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(41, 1667, 'Dhanmondi - Rd 6A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(42, 1214, 'Jhigatola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(43, 185, 'Elephant Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(44, 96, 'Farmgate', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(45, 1668, 'Dhanmondi - Rd 8', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(46, 1215, 'Polashi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(47, 186, 'Kathalbagan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2023-01-07 01:52:02'),
(48, 97, 'Indira Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(49, 1669, 'Dhanmondi - Rd 8A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(50, 1216, 'Satmoshjid Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(51, 1670, 'Dhanmondi - Rd 9', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(52, 1217, 'Shukrabad', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(53, 188, 'Central Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(54, 99, 'Tejkunipara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(55, 1671, 'Dhanmondi - Rd 9A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(56, 1218, 'BNP Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(57, 100, 'Razabazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(58, 1672, 'Dhanmondi - Rd 10', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(59, 1673, 'Dhanmondi - Rd 12', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(60, 1139, 'Dhaka uddan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(61, 101, 'Sukrabad', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(62, 1674, 'Dhanmondi - Rd 12A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(63, 1140, 'Nobodoy', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(64, 102, 'Panthopath', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(65, 103, 'Kalabagan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(66, 1675, 'Dhanmondi - Rd 15', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(67, 1141, 'Chad Uddan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(68, 104, 'Green Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(69, 1676, 'Dhanmondi - Rd 15 A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(70, 1142, 'Mohammadia Housing', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(71, 105, 'Manik Mia Avenue', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(72, 1677, 'Dhanmondi - Rd 27', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(73, 1143, 'Ring Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(74, 106, 'Asad Avenue', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(75, 1678, 'Dhanmondi - Rd 28', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(76, 1144, 'Tajmahal Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(77, 107, 'West Dhanmondi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(78, 1679, 'Dhanmondi - Rd 29', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(79, 1145, 'Nurjahan Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(80, 133, 'Dhakeshwari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:24'),
(81, 108, 'Shankar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(82, 1146, 'Rajia Sultana Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(83, 1, 'Mohammadpur(Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(84, 273, 'Zigatola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(85, 109, 'Rayer Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(86, 1681, 'Zafrabad', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(87, 183, 'Paribag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(88, 2, 'Dhanmondi - Rd 3', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(89, 110, 'Tallabag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(90, 1682, 'Sadek Khan Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(91, 111, 'Hazaribag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(92, 1683, 'Sher e Bangla Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(93, 67, 'Nikunja', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(94, 1230, 'Mahanogor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(95, 1231, 'Nimtola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(96, 1232, 'Nurerchala', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(97, 1571, 'Jahangir Gate', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(98, 82, 'South Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(99, 325, 'Joar Shahara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(100, 1572, 'Nijhum gate', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(101, 83, 'Merul Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(102, 1573, 'BAF Bashar (Dhaka cantonment)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(103, 1199, 'Apollo', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(104, 84, 'Niketon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(105, 72, 'Bashundhara R/A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(106, 1574, 'Zia Colony', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(107, 1200, 'Nurer Chala', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(108, 85, 'Banani', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(109, 86, 'Banani DOHS', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(110, 73, 'Vatara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(111, 1575, 'MES colony', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(112, 1201, 'Bawaila Para', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(113, 87, 'Mohakhali', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(114, 74, 'Nadda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(115, 1202, 'Satarkul', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(116, 1185, 'Kunipara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(117, 88, 'Mohakhali DOHS', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(118, 1233, 'Pastola Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(119, 14, 'Gudaraghat (Badda)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(120, 75, 'Baridhara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(121, 1206, 'Khilbar Tek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(122, 1186, 'Babli Masjid', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(123, 1234, 'Poschim Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(124, 76, 'Baridhara DOHS', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(125, 1235, 'Purbo Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(126, 77, 'Notun Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(127, 91, 'Aziz Palli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(128, 1236, 'Sat-tola Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(129, 78, 'Adarsha Nagar (Badda)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(130, 1317, 'Namapara-Khilkhet', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(131, 92, 'Bashtola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(132, 1237, 'Shaheenbagh', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(133, 79, 'Shahjadpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(134, 93, 'South Baridhara DIT Project', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(135, 1238, 'Subastu', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(136, 21, 'Cantonment Post Office', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(137, 80, 'Uttor Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(138, 94, 'Aftabnagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(139, 1239, 'ICDDRB', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(140, 81, 'Middle Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(141, 39, 'Namapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(142, 1240, 'Satrasta', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(143, 1348, 'Niketon Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(144, 323, 'Nakhalpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(145, 1268, 'Rosulbagh(Mohakhali)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(146, 1241, 'Tekpara Adorsonagor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(147, 1242, 'Uttar Badda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(148, 1323, 'Aftab Nagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(149, 98, 'Tejgaon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(150, 1243, 'Wireless', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(151, 1244, 'Solmaid', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(152, 27, 'M.E.S', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(153, 44, 'Kurmitola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(154, 1245, '300 Feet', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(155, 45, 'Shewra', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(156, 1219, 'Kalachandpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(157, 174, 'Khilbari Tek (Badda)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(158, 1220, 'Jogonnathpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(159, 1221, 'Kuratuli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(160, 1329, 'TV gate', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(161, 1222, 'Alatunnessa School Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(162, 1224, 'Bou Bazar - Mohakhali, Dhaka', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(163, 1733, 'Nikunja 2', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(164, 51, 'Kuril', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(165, 1225, 'Chairman Goli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(166, 1226, 'Confidence Tower, Jhilpar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(167, 1227, 'Fuji Trade Center', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(168, 3, 'Gulshan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(169, 1228, 'Khil Barirtek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(170, 1229, 'Korail', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(171, 66, 'Khilkhet', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(172, 449, 'Mirpur Taltola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(173, 1332, 'Gudaraghat-Mirpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(174, 277, 'Kalshi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(175, 1333, 'Namapara-Mirpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(176, 1334, 'Oxygen', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(177, 1600, 'Mirpur 60 feet', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(178, 8, 'Darussalam', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(179, 9, 'Gabtoli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(180, 1335, 'Technical', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(181, 1481, 'Eastern Housing (Pallabi)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(182, 10, 'Pallabi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(183, 1336, 'Mirpur 13 /14 / 15', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(184, 1337, 'Benaroshi Polli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(185, 12, 'Mirpur DOHS', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(186, 329, 'ECB Chattar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(187, 1338, 'Beribadh-Mirpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(188, 13, 'Kochukhet', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(189, 1339, 'Buddhijibi Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(190, 1340, 'Purobi Cinema Hall', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(191, 89, 'South Monipur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(192, 17, 'Agargaon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(193, 1341, 'Mondir-Mirpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(194, 1694, 'Mirpur - 6', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(195, 90, 'Shah Ali Bag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(196, 18, 'Monipur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(197, 1342, 'Palasnagor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(198, 1343, 'Purobi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(199, 20, 'Ibrahimpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(200, 1344, 'Rupnagor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(201, 1345, 'Senpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(202, 315, 'Mirpur 2', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(203, 1131, 'Birulia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(204, 1346, 'BRTA', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(205, 22, 'Mirpur Cantonment', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(206, 37, 'Dewanpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(207, 1347, 'Zoo', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(208, 23, 'Kafrul', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(209, 40, 'Mastertek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(210, 1695, 'Mirpur - 7', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(211, 24, 'Vashantek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(212, 41, 'Balughat', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(213, 1696, 'Mirpur - 11', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(214, 25, 'Manikdi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(215, 42, 'Barontek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(216, 1697, 'Mirpur - 11.5', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(217, 26, 'Matikata', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(218, 43, 'Goltek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(219, 1698, 'Mirpur - 12', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(220, 28, 'Rupnagar Residential Area', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(221, 1699, 'Mirpur - 13', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(222, 1165, 'Kallanpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(223, 29, 'Duaripara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(224, 1700, 'Mirpur - 15', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(225, 1166, 'Amin Bazar', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:16:43'),
(226, 30, 'Rainkhola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(227, 1701, 'Mirpur - 14', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(228, 1167, 'Lalkuthi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(229, 31, 'Mirpur Diabari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(230, 1168, 'Mirpur 1', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(231, 32, 'Mazar Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(232, 1169, 'Tolarbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(233, 33, 'Shagufta', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(234, 1594, 'Arambag (Mirpur)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(235, 1170, 'Ahmed Nagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(236, 1331, 'Mirpur 10', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(237, 1171, 'Paikpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(238, 1172, 'Pirerbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(239, 35, 'Baigertek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(240, 1173, 'Taltola (Mirpur)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(241, 36, 'Madina nagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(242, 1174, 'MES Colony', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(243, 1175, 'Zia Colony', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(244, 275, 'Kazipara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(245, 1176, 'Ajiz Market', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(246, 276, 'Shewrapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(247, 5, 'Kallyanpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(248, 139, 'Fakirapul', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(249, 152, 'Shantibag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(250, 140, 'Kakrail', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(251, 153, 'Baily Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(252, 154, 'Minto Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(253, 69, 'Hajipara (Rampura)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(254, 141, 'Naya Paltan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(255, 142, 'Bijoynagar (Paltan)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(256, 156, 'Eskaton Garden Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(257, 143, 'Press Club', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(258, 144, 'High Court', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(259, 157, 'Eskaton', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(260, 158, 'Moghbazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(261, 288, 'Purana Paltan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(262, 159, 'Mouchak', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(263, 334, 'Arambag (Motijheel)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(264, 160, 'Malibag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(265, 161, 'Rampura', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(266, 1207, 'Buddho Mondir', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(267, 1208, 'Sipahibag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(268, 1636, 'Banasree Block - A', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(269, 1209, 'TT Para', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(270, 1637, 'Banasree Block - B', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(271, 165, 'Bashabo', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(272, 1638, 'Banasree Block - C', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(273, 1132, 'Shahjahanpur (Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(274, 166, 'Khilgaon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(275, 1639, 'Banasree Block - D', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(276, 1640, 'Banasree Block - E', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(277, 319, 'Siddweswari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(278, 167, 'Middle Bashabo', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(279, 1641, 'Banasree Block - F', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(280, 168, 'Goran', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(281, 1642, 'Banasree Block - G', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(282, 169, 'Madartek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(283, 396, 'Nandipara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(284, 1643, 'Banasree Block - H', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(285, 187, 'Malibagh Taltola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(286, 170, 'Manik Nagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(287, 171, 'Shahjahanpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(288, 1644, 'Banasree Block - I', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(289, 1324, 'Gulbagh', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(290, 1137, 'Haterrjheel', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(291, 125, 'Tikatuly', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(292, 126, 'Motijheel', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(293, 172, 'Banasree (Rampura)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(294, 403, 'Gopibag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(295, 1645, 'Banasree Block - J', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(296, 189, 'Sabujbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(297, 1325, 'Meradiya Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(298, 173, 'Meradia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(299, 1646, 'Banasree Block - K', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(300, 190, 'Shiddheswari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(301, 1326, 'Mirbagh', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(302, 1647, 'Banasree Block - L', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(303, 1327, 'Modhubagh', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(304, 1328, 'Rampura TV center', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(305, 1648, 'Banasree Block - M', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(306, 266, 'Shegunbagicha', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(307, 177, 'Mughdapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(308, 1649, 'Banasree Block - N', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(309, 267, 'Rajarbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(310, 1330, 'Ulan road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(311, 1223, 'Purbo Rampura', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(312, 1251, 'Chamelibag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(313, 181, 'Hatirjheel', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(314, 134, 'Kamalapur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(315, 182, 'Banglamotor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(316, 1128, 'Manda(Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(317, 1596, 'Nazimuddin Road (Malibag)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(318, 150, 'Ramna', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(319, 137, 'Dainik Bangla Mor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(320, 151, 'Shantinagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(321, 1657, 'Uttara Sector - 15', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(322, 324, 'Dokshingaon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(323, 1686, 'Uttara Sector - 16', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(324, 1152, 'Uttara Sector 5', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(325, 1687, 'Uttara Sector - 17', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(326, 1153, 'Uttara Sector 14', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(327, 1688, 'Uttara Sector - 18', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(328, 1154, 'Uttara Sector 3', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(329, 1155, 'Uttara Sector 7', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(330, 1156, 'Uttara Sector 9', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(331, 1157, 'Uttara Sector 11', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(332, 1158, 'Nalbhog', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(333, 1160, 'Phulbaria', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(334, 352, 'Kamarpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(335, 1161, 'Dhour', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(336, 1295, 'Ranavola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(337, 1162, 'Bhatuliya', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(338, 1318, 'Ahalia-Uttara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(339, 1320, 'Diabari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(340, 1321, 'Habib Market-Uttara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(341, 1322, 'Pakuria-Uttara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(342, 1163, 'Bamnartek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(343, 1164, 'Turag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(344, 1650, 'Uttara Sector - 1', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(345, 34, 'Bawnia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(346, 1654, 'Uttara Sector - 10', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(347, 1655, 'Uttara Sector - 12', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(348, 1656, 'Uttara Sector - 13', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(349, 1257, 'Kotwali (Puran Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(350, 113, 'Nawabgonj Puran Dhaka', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(351, 1258, 'Railway Colony', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(352, 1259, 'Rajar Dewri', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(353, 284, 'Sutrapur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(354, 1261, 'Sat rowja', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(355, 286, 'Kamrangichar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(356, 1262, 'Tantibazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(357, 146, 'Dhaka Medical', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(358, 147, 'Bongo Bondhu Avenue', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(359, 346, 'Armanitola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(360, 349, 'Islambag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(361, 354, 'Mitford', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(362, 117, 'Lalbagh', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(363, 355, 'Shakhari Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(364, 118, 'Chawkbazar (Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(365, 356, 'Katherpol', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(366, 316, 'Bongshal', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(367, 119, 'Naya Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(368, 357, 'Bangla Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(369, 120, 'Tatibazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(370, 358, 'Patuatuly', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(371, 121, 'Luxmi Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(372, 123, 'Puran Dhaka', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(373, 124, 'Siddique Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(374, 397, 'Nazira Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(375, 127, 'Nawabpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(376, 128, 'Kaptan Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(377, 263, 'Dolaikhal', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(378, 1248, 'Mahut Tuli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(379, 129, 'Gulistan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(380, 406, 'Sadarghat (Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(381, 1249, 'Alubazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(382, 130, 'Bongo Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(383, 407, 'Kaltabazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(384, 1250, 'Badam Toli', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(385, 131, 'Chankarpul', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(386, 269, 'Babubazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(387, 270, 'Islampur(Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(388, 132, 'Palashi', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(389, 409, 'Gandaria', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(390, 1595, 'Nazimuddin Road (Puran Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(391, 271, 'Imamgonj', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(392, 1252, 'Dholaikhal', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(393, 272, 'Nayabazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(394, 1253, 'Doyagonj', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(395, 1254, 'Farashgong', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(396, 135, 'Wari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(397, 136, 'Narinda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(398, 184, 'Bakshibazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(399, 1395, 'Firozshah', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(400, 1396, 'GEC', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(401, 1397, 'Halishahar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(402, 1398, 'Halishshar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(403, 1458, 'Sadarghat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(404, 1366, 'Cadet College', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(405, 1367, 'Chandgaon', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(406, 1368, 'Chattogram Airport', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(407, 1369, 'Chattogram Bandar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(408, 1370, 'Chattogram Cantonment', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(409, 1371, 'Chattogram Chawkbazar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(410, 1431, 'Mohard', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(411, 1372, 'Chattogram Customs Acca', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(412, 999, 'Sitakundu', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(413, 1373, 'Chattogram GPO', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(414, 1433, 'Nasirabad', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(415, 1407, 'Jalalabad', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(416, 1374, 'Chattogram New Market', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(417, 1434, 'North Halishahar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(418, 1375, 'Chattogram Oxygen', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(419, 1435, 'North Kattali', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(420, 1349, 'Kotwali Chattogram', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(421, 1135, 'Bondor (Chittagong)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(422, 1376, 'Chattogram Politechnic Institute', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(423, 1436, 'North Katuli', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(424, 1437, 'Noyabazar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(425, 1350, 'Agrabad', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(426, 1464, 'Sitakunda Barabkunda', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(427, 1136, 'Barahatia', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(428, 1377, 'Chattogram Sailors Colony', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(429, 1438, 'Pahartoli', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(430, 1351, 'AK Khan', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(431, 1465, 'Sitakunda Baroidhala', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(432, 1378, 'Colonel Hat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(433, 1379, 'Combined Military Hospital (CMH)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(434, 1439, 'Panchlaish', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(435, 1352, 'Al- Amin Baria Madra', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(436, 1466, 'Sitakunda Bawashbaria', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(437, 1380, 'Court Buliding', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(438, 1440, 'Patenga', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(439, 1353, 'Al- Amin Baria Madrasa', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(440, 1467, 'Sitakunda Bhatiari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(441, 1354, 'Amin Jute Mills', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(442, 1468, 'Sitakunda Fouzdarhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(443, 1122, 'Chittagong Sadar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(444, 1382, 'Dakkshin Pahartoli', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(445, 1355, 'Anandabazar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(446, 1469, 'Sitakunda Jafrabad', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(447, 1383, 'Double Mooring', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(448, 1443, 'Rampur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(449, 1470, 'Sitakunda Kumira', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(450, 1471, 'South Halishahar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(451, 1444, 'Rampura TSO', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(452, 1358, 'Bayezid Bostami', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(453, 1473, 'Wazedia', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(454, 1419, 'Kattuli', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(455, 1420, 'Khulshi', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(456, 1388, 'Export Processing', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(457, 1423, 'Middle Patenga', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(458, 1474, 'No area', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(459, 448, 'CWH', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(460, 292, 'Shyampur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(461, 296, 'Dholaipar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(462, 313, 'Shonir Akhra', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(463, 1246, 'Mirhazirbagh', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(464, 404, 'Shwamibag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(465, 405, 'Sayedabad', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(466, 178, 'Golapbag (Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(467, 408, 'Jurain', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(468, 179, 'Jatrabari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(469, 411, 'RayerBag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(470, 412, 'Faridabad (Jatrabari)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(471, 1255, 'Dholpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(472, 414, 'Donia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(473, 1597, 'Kodomtoli (Jatrabari)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(474, 415, 'Postogola', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(475, 915, 'Fenchuganj', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(476, 916, 'Gowainghat', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(477, 917, 'Golapganj (Sylhet)', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(478, 918, 'Jaintapur', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(479, 920, 'Kanaighat', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(480, 921, 'Amberkhana (Sylhet)', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(481, 922, 'South Surma', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(482, 1497, 'Akhalia', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(483, 1498, 'Tilaghor', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(484, 1499, 'Shibganj(sylhet)', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(485, 1494, 'Zindabazar', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(486, 1500, 'Uposhohor(Sylhet)', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(487, 1495, 'Pathantula', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(488, 1501, 'Kodomtoli', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(489, 1496, 'Subidbazar', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(490, 1502, 'Sheikhghat.', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(491, 1503, 'Majortila', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(492, 1504, 'Subhanighat', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(493, 911, 'Balaganj', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(494, 913, 'Biswanath', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(495, 914, 'Companyganj (Sylhet)', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(496, 1284, 'Khartail', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(497, 1542, 'Jinumarket', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(498, 1285, 'Majukhan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(499, 1543, 'T & T(Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(500, 1197, 'Ershadnagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(501, 1286, 'Milgate', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(502, 1544, 'Shilmun', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(503, 1198, 'Sataish', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(504, 1287, 'National University', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(505, 1545, 'Mudafa', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(506, 1288, 'Surtaranga', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(507, 1546, 'Khapara', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(508, 1289, 'Targach', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(509, 1547, 'Malakerbari', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(510, 1263, 'Khairtail', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(511, 1290, 'Rail Station', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(512, 1548, 'Bypass Road (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(513, 1549, 'Kodda', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(514, 1264, 'Bonomala', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(515, 1291, 'Boro Dewra', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(516, 1550, 'Duet Road', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(517, 1265, 'Morkun', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(518, 1551, 'Shibbari', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(519, 1552, 'Shimultoli', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(520, 647, 'Chowrasta (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(521, 1188, 'Kunia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(522, 1553, 'Jorpukur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(523, 1189, 'Gacha', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(524, 1190, 'Boro Bari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(525, 1554, 'Salna', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52');
INSERT INTO `districts` (`id`, `area_id`, `area_name`, `district`, `shippingfee`, `partialpayment`, `created_at`, `updated_at`) VALUES
(526, 649, 'Kaliganj(Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(527, 1191, 'Board Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(528, 1192, 'Kamarjuri', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(529, 1266, 'Bhadam', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(530, 1193, 'Dattapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(531, 1267, 'Boro Dewra Dakkhin Para', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(532, 1194, 'Auchpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(533, 1195, 'Cherag Ali', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(534, 1269, 'Gopalpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(535, 1196, 'Tongi Bazar (Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(536, 1270, 'College Gate (Tongi)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(537, 1271, 'Boardbazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(538, 1272, 'Gazipura', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(539, 1273, 'Hossain Market (Tongi)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(540, 1274, 'Signboard (Gazipur)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(541, 1275, 'Joydebpur', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(542, 1276, 'Dhirasrom', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(543, 1277, 'Dattapara Road', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(544, 1536, 'Pubail', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(545, 1278, 'Badekomelosshor', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(546, 1279, 'Borobari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(547, 1537, 'Mirerbazar', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(548, 1280, 'Choidana', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(549, 1538, 'Ulokhola', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(550, 1281, 'Deger Chala', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(551, 1539, 'Modhumita', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(552, 1282, 'Gazcha', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(553, 1540, 'Miraspara', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(554, 63, 'Tongi', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(555, 1283, 'Hariken', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(556, 1541, 'Pagar', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(557, 282, 'Ashulia', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:15:49'),
(558, 283, 'Amin Bazar', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:16:34'),
(559, 365, 'Dhamrai', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(560, 1127, 'Baipayl', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(561, 53, 'Savar', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:15:10'),
(562, 61, 'Savar Cantonment', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:14:50'),
(563, 1178, 'Aga Nagar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(564, 1179, 'Kathuria', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(565, 1180, 'Goljarbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(566, 1181, 'Nazirabag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(567, 1260, 'Hasnabad', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(568, 1182, 'Kaliganj - Keraniganj', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:17:35'),
(569, 1183, 'Nazarganj', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(570, 1184, 'Zinzira', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(571, 305, 'Keranigonj', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:17:28'),
(572, 1125, 'Kalatia', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(573, 1256, 'Kodomtoli(Keraniganj)', 'Dhaka', '150', '510', '2021-10-31 19:02:40', '2022-12-14 10:17:22'),
(574, 707, 'Bandar (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(575, 708, 'Chashara (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(576, 1658, 'Signboard (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(577, 1659, 'Jalkuri (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(578, 710, 'Sonargaon', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(579, 1689, 'Chittagong Road (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(580, 1133, 'Shanarpar (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(581, 1247, 'Bhuigarh-Narayangonj', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(582, 1123, 'Siddhirganj', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(583, 1124, 'Fatullah', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(584, 1680, 'Shibu Market (Narayanganj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(585, 1000, 'Barura', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(586, 1001, 'Brahmanpara', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(587, 1002, 'Burichang', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(588, 1003, 'Chandina', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(589, 1005, 'Comilla Sadar', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(590, 1007, 'Debiduar', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(591, 1015, 'Comilla Sadar South', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(592, 782, 'Batiaghata', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(593, 783, 'Dacope', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(594, 784, 'Dighalia', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(595, 785, 'Dumuria', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(596, 786, 'Phultala', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(597, 789, 'Rupsa', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(598, 790, 'Khalispur', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(599, 791, 'Sonadanga', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(600, 792, 'Khan jahan ali', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(601, 793, 'Doulatpur', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(602, 1120, 'Khulna Sadar', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(603, 794, 'Terokhada', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(604, 1528, 'Chorpara (Mymensingh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(605, 1529, 'Kachijhuli', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(606, 695, 'Dhubaura', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(607, 1530, 'College Road (Mymensigh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(608, 696, 'Fulbaria (Mymensingh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(609, 1531, 'Akua', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(610, 697, 'Fulpur', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(611, 1532, 'Agriculture University (Mymensingh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(612, 1533, 'Zilla School Mor (Mymensingh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(613, 699, 'Koltapara (Gouripur Mymensingh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(614, 1534, 'Rohomotpur Bypass', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(615, 700, 'Haluaghat', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(616, 1535, 'Mashkanda', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(617, 701, 'Iswarganj', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(618, 702, 'Kacharighat (Mymensingh)', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(619, 703, 'Muktagacha', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(620, 704, 'Nandail', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(621, 932, 'Barisal Sadar', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(622, 935, 'Mehendiganj', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(623, 929, 'Babuganj', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(624, 930, 'Bakerganj', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(625, 931, 'Banaripara', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(626, 658, 'Dewanganj', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(627, 659, 'Islampur(Jamalpur)', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(628, 660, 'Jamalpur Sadar', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(629, 661, 'Madarganj', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(630, 662, 'Melandah', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(631, 663, 'Sharishabari', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(632, 1603, 'Subidkhali', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(633, 1606, 'Bagabandar', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(634, 1607, 'Kalaia', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(635, 1609, 'Birpasha', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(636, 949, 'Bauphal', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(637, 950, 'Dasmina', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(638, 951, 'Dumki', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(639, 952, 'Galachipa', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(640, 954, 'Mirjaganj', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(641, 955, 'Patuakhali Sadar', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(642, 677, 'Kalkini', 'Madaripur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(643, 678, 'Madaripur Sadar', 'Madaripur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(644, 679, 'Rajoir', 'Madaripur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(645, 680, 'Shibchar', 'Madaripur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(646, 1716, 'Kacari (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(647, 1717, 'Super Market Mor (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(648, 1718, 'Munshir Hat (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(649, 1719, 'Mirkadim (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(650, 1720, 'Rikabibazar (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(651, 1721, 'Sipahipara (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(652, 1722, 'Muktarpur (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(653, 688, 'Gazaria', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(654, 690, 'Katakhali (Munshiganj)', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(655, 691, 'Serajdikhan', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(656, 693, 'Tangibari', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(657, 657, 'Bakshiganj', 'Jamalpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(658, 738, 'Jhenaigati', 'Sherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(659, 739, 'Nakla', 'Sherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(660, 740, 'Nalitabari', 'Sherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(661, 741, 'Sherpur Sadar', 'Sherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(662, 742, 'Sribordi', 'Sherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(663, 962, 'Zia Nagar (Indurkani)', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(664, 956, 'Bhandaria', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(665, 957, 'Kaukhali (Perojpur)', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(666, 958, 'Mothbaria', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(667, 959, 'Nesarabad (Shawrupkathi)', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(668, 960, 'Nazirpur', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(669, 961, 'Pirojpur Sadar', 'Perojpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(670, 978, 'Chandpur Sadar', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(671, 979, 'Faridganj', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(672, 980, 'Haimchar', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(673, 983, 'Matlab (South)', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(674, 984, 'Matlab (North)(Chengarchar)', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(675, 638, 'Alfadanga', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(676, 639, 'Bhanga', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(677, 640, 'Boalmari', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(678, 641, 'Char Bhadrasan', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(679, 642, 'Faridpur Sadar', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(680, 643, 'Madhukhali', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:52'),
(681, 644, 'Nagarkanda', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(682, 645, 'Sadarpur', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(683, 646, 'Saltha', 'Faridpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(684, 748, 'Kalihati', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(685, 749, 'Mirzapur', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(686, 751, 'Nagarpur', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(687, 752, 'Shakhipur', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(688, 753, 'Tangail Sadar', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(689, 743, 'Bashail', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(690, 744, 'Bhuapur', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(691, 745, 'Delduar', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(692, 945, 'Jhalokathi Sadar', 'Jhalokathi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(693, 946, 'Kathalia', 'Jhalokathi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(694, 947, 'Nalchiti', 'Jhalokathi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(695, 948, 'Rajapur (Jhalokathi)', 'Jhalokathi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(696, 1711, 'Konokpur (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(697, 1712, 'Adompur Bazar - Kamalganj', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(698, 1715, 'Kazir Bazar (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(699, 894, 'Kamalganj', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(700, 896, 'Moulvibazar Sadar', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(701, 897, 'Rajnagar', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(702, 898, 'Sreemongal', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(703, 1702, 'Sarkar Bazar (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(704, 1703, 'Notun Bridge (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(705, 1622, 'Shamshernagar (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(706, 1623, 'Sherpur (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(707, 1704, 'Tarapasha Bazar - Rajnagar', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(708, 1705, 'Munshibazar - Kamalganj', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(709, 1706, 'Munshibazar - Rajnagar', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(710, 1707, 'Tengra Bazar - Rajnagar', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(711, 1708, 'Mukam Bazar - Radar Unit (Moulvibazar)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(712, 1710, 'Patanushar - Shamshernagar', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(713, 1515, 'Chowdhury Bazar (Habiganj)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(714, 1516, 'Sultanmahmudpur', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(715, 889, 'Habiganj Sadar', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(716, 1517, 'Gatiabazar', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(717, 890, 'Lakhai', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(718, 1518, 'Mahmudabad', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(719, 1519, 'Duliakal', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(720, 892, 'Nabiganj', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(721, 1520, 'Mohonpur (Habiganj)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(722, 885, 'Ajmeriganj', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(723, 887, 'Baniachang', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(724, 1514, 'Rajnogor', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(725, 1107, 'Badarganj', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(726, 1108, 'Gangachara', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(727, 1109, 'Kaunia (Rangpur)', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(728, 1110, 'Mithapukur', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(729, 1111, 'Pirgacha', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(730, 1112, 'Pirganj(Rangpur)', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(731, 1113, 'Rangpur Sadar', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(732, 1114, 'Taraganj', 'Rangpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(733, 773, 'Keshabpur', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(734, 774, 'Manirampur', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(735, 775, 'Sharsha', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(736, 769, 'Bagherpara', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(737, 770, 'Chowgacha', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(738, 1129, 'Benapole', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(739, 771, 'Jessore Sadar', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(740, 772, 'Jhikargacha', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(741, 1102, 'Atwari (Panchagarh)', 'Panchagarh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(742, 1103, 'Boda', 'Panchagarh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(743, 1104, 'Debiganj', 'Panchagarh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(744, 1105, 'Panchagarh Sadar', 'Panchagarh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(745, 1106, 'Tetulia', 'Panchagarh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(746, 1099, 'Kishoreganj ( Nilphamari)', 'Nilphamari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(747, 1100, 'Nilphamari Sadar', 'Nilphamari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(748, 1096, 'Dimla', 'Nilphamari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(749, 1097, 'Domar', 'Nilphamari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(750, 1098, 'Jaldhaka', 'Nilphamari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(751, 1021, 'Ramu', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(752, 1023, 'Ukhia', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(753, 1576, 'Kalur Dokan', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(754, 1577, 'Alir Jahal Road', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(755, 966, 'Nakhoyngchari', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(756, 1578, 'Barmis Market', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(757, 1579, 'Bazar Ghata', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(758, 1580, 'Laldighir Par (Cox\'s Bazar)', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(759, 1581, 'Holiday Mor(Cox\'s Bazar)', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(760, 1582, 'Laboni Point', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(761, 1583, 'Sughandha Point', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(762, 1584, 'Marin Drive Road', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(763, 1585, 'Sonar Tara', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(764, 1586, 'Jilonjha', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(765, 1587, 'Tarabaniyer chora', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(766, 1588, 'Romaliyer chora', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(767, 1589, 'Khurushkul', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(768, 1590, 'P M Khali', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(769, 1591, 'Somity Para', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(770, 1017, 'Kolatoli (Cox\'s Bazar)', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(771, 938, 'Bhola Sadar', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(772, 939, 'Borhanuddin', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(773, 941, 'Daulatkhan', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(774, 944, 'Tajumuddin', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(775, 924, 'Bamna', 'Barguna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(776, 925, 'Barguna Sadar', 'Barguna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(777, 926, 'Betagi', 'Barguna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(778, 927, 'Patharghata (Barguna)', 'Barguna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(779, 876, 'Belkuchi', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(780, 877, 'Chowhali', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(781, 878, 'Kamarkhanda', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(782, 879, 'Kazipur', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(783, 880, 'Raiganj', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(784, 881, 'Shahajadpur (Sirajganj)', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(785, 882, 'Sirajganj Sadar', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(786, 883, 'Tarash', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(787, 884, 'Ullapara', 'Sirajganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(788, 857, 'Atgharia', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(789, 858, 'Bera', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(790, 859, 'Bhangura', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(791, 860, 'Chatmohar', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(792, 861, 'Faridpur ( Pabna )', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(793, 863, 'Pabna Sadar', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(794, 864, 'Santhia', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(795, 865, 'Sujanagar', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(796, 1616, 'Banwarinagar (Pabna)', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(797, 1617, 'Debottar (Pabna)', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(798, 1618, 'Kashinathpur (Pabna)', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(799, 1619, 'Nakalia (Pabna)', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(800, 1621, 'Sagarkandi (Pabna)', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(801, 855, 'Natore Sadar', 'Natore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(802, 856, 'Singra', 'Natore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(803, 851, 'Baghatipara', 'Natore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(804, 852, 'Baraigram', 'Natore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(805, 853, 'Gurudaspur', 'Natore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(806, 854, 'Lalpur', 'Natore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(807, 840, 'Atrai', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(808, 841, 'Badalgachi', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(809, 845, 'Naogaon Sadar', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(810, 849, 'Raninagar', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(811, 835, 'Akkelpur', 'Joypurhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(812, 836, 'Joypurhat Sadar', 'Joypurhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(813, 837, 'Kalai', 'Joypurhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(814, 838, 'Khetlal', 'Joypurhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(815, 839, 'Panchbibi', 'Joypurhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(816, 811, 'Assasuni', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(817, 812, 'Debhata', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(818, 813, 'Kaliganj(Satkhira)', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(819, 814, 'Kolaroa', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(820, 815, 'Satkhira Sadar', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(821, 816, 'Shyamnagar', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(822, 817, 'Tala', 'Satkhira', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(823, 805, 'Gangni', 'Meherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(824, 806, 'Meherpur Sadar', 'Meherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(825, 807, 'Mujibnagar', 'Meherpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(826, 734, 'Gosairhat', 'Shariatpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(827, 735, 'Zajira', 'Shariatpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(828, 736, 'Naria', 'Shariatpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(829, 737, 'Shariatpur Sadar', 'Shariatpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(830, 732, 'Bhedarganj', 'Shariatpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(831, 733, 'Damudiya', 'Shariatpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(832, 727, 'Baliakandi', 'Rajbari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(833, 728, 'Goalunda', 'Rajbari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(834, 729, 'Pangsha', 'Rajbari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(835, 730, 'Rajbari Sadar', 'Rajbari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(836, 731, 'Kalukhali', 'Rajbari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(837, 681, 'Daulatpur(Manikganj)', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(838, 682, 'Ghior', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(839, 683, 'Harirampur (Manikganj)', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(840, 684, 'Manikganj Sadar', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(841, 685, 'Saturia', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(842, 686, 'Shibalaya', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(843, 687, 'Singair', 'Manikganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(844, 652, 'Gopalganj Sadar', 'Gopalganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(845, 653, 'Kasiani', 'Gopalganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(846, 654, 'Kotalipara', 'Gopalganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(847, 655, 'Maksudpur', 'Gopalganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(848, 656, 'Tungipara', 'Gopalganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(849, 1115, 'Baliadangi', 'Thakurgaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(850, 1134, 'Shibganj (Thakurgaon Sadar)', 'Thakurgaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(851, 1116, 'Haripur', 'Thakurgaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(852, 1117, 'Pirganj(Thakurgaon)', 'Thakurgaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(853, 1118, 'Ranishankail', 'Thakurgaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(854, 1119, 'Thakurgaon Sadar', 'Thakurgaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(855, 717, 'Atpara', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(856, 718, 'Barhatta', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(857, 719, 'Durgapur(Netrokona)', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(858, 720, 'Kalmakanda', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(859, 721, 'Kendua', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(860, 722, 'Khaliajuri', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(861, 723, 'Madan', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(862, 724, 'Mohanganj', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(863, 725, 'Netrokona Sadar', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(864, 726, 'Purbadhala (Netrokona)', 'Netrokona', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(865, 903, 'Dharmapasha', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(866, 712, 'Monohardi', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(867, 713, 'Velanogor (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(868, 714, 'Palash', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(869, 716, 'Shibpur', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(870, 1505, 'Madhabdi (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(871, 1506, 'Babur Haat (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(872, 1507, 'Pachdona More (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(873, 1508, 'Shaheprotab More (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(874, 1509, 'West Brammondi (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(875, 1510, 'East Brammondi (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(876, 1511, 'Songita Bazar (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(877, 1512, 'Shatirpara', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(878, 1513, 'Hasnabad Bazar (Narsingdi)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(879, 1024, 'Chagalnayya', 'Feni', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(880, 1025, 'Daganbhuiyan', 'Feni', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(881, 1026, 'Feni Sadar', 'Feni', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(882, 1027, 'Parshuram', 'Feni', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(883, 1028, 'Fulgazi', 'Feni', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(884, 1029, 'Sonagazi', 'Feni', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(885, 1072, 'Khanshama', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(886, 1074, 'Parbatipur', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(887, 1483, 'College mor (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(888, 1484, 'Boromath (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(889, 1485, 'Pulhat', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(890, 1486, 'Newtown (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(891, 1487, 'Lilir mor', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(892, 1488, 'Modern mor (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(893, 1063, 'Birganj', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(894, 1064, 'Birol', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(895, 1065, 'Bochaganj', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(896, 1066, 'Chirirbandar', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(897, 1067, 'Baluadanga (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(898, 1071, 'Kaharole', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(899, 1075, 'Fulchari', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(900, 1076, 'Gaibandha Sadar', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(901, 1077, 'Gobindaganj ( Gaibandha )', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(902, 1078, 'Palashbari', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(903, 1079, 'Sadullapur', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(904, 1080, 'Shaghatta', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(905, 1081, 'Sundarganj', 'Gaibandha', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(906, 764, 'Alamdanga', 'Chuadanga', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(907, 765, 'Chuadanga Sadar', 'Chuadanga', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(908, 766, 'Damurhuda', 'Chuadanga', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(909, 767, 'Jibannagar', 'Chuadanga', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(910, 866, 'Bagha', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(911, 867, 'Bagmara (Rajshahi)', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(912, 868, 'Charghat', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(913, 869, 'Durgapur(Rajshahi)', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(914, 870, 'Godagari', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(915, 871, 'Mohanpur (Rajshahi)', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(916, 872, 'Paba', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(917, 873, 'Putia', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(918, 874, 'Tanore', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(919, 875, 'Sadar', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(920, 1121, 'Rajshahi Shadar', 'Rajshahi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(921, 801, 'Magura Sadar', 'Magura', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(922, 802, 'Mohammadpur (Magura)', 'Magura', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(923, 803, 'Shalikha', 'Magura', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(924, 804, 'Sreepur (Magura)', 'Magura', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(925, 808, 'Kalia', 'Narail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(926, 809, 'Lohagara(Narail)', 'Narail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(927, 810, 'Narail Sadar', 'Narail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(928, 1053, 'Barkal', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(929, 1054, 'Belaichari', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(930, 1055, 'Jurachari', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(931, 1056, 'Kaptai', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(932, 1057, 'Kawkhali (Rangamati)', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(933, 1058, 'Langadu', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(934, 1059, 'Naniarchar', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(935, 1060, 'Rajasthali', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(936, 1061, 'Rangamati Sadar', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(937, 1416, 'Kaptai Kaptai Project', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(938, 1417, 'Kaptai Nuton Bazar', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(939, 1418, 'Kaptai Sadar', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(940, 800, 'Mirpur (Kushtia)', 'Kushtia', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(941, 795, 'Bheramara', 'Kushtia', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(942, 796, 'Daulatpur (Kushtia)', 'Kushtia', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(943, 797, 'Khoksha', 'Kushtia', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(944, 798, 'Kumarkhali', 'Kushtia', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(945, 799, 'Kushtia Sadar', 'Kushtia', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(946, 830, 'Bholahat', 'Chapai Nawabganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(947, 831, 'Gomastapur', 'Chapai Nawabganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(948, 832, 'Nachole', 'Chapai Nawabganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(949, 833, 'Nawabganj Sadar', 'Chapai Nawabganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(950, 834, 'Shipganj ( Chapai )', 'Chapai Nawabganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(951, 1126, 'Chapai Nawabganj Sadar', 'Chapai Nawabganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(952, 776, 'Kotchandpur', 'Jhenaidah', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(953, 777, 'Harinakunda', 'Jhenaidah', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(954, 778, 'Jhenaidah Sadar', 'Jhenaidah', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(955, 779, 'Kaliganj(Jhenaidah)', 'Jhenaidah', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(956, 780, 'Moheshpur', 'Jhenaidah', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(957, 781, 'Shailkupa', 'Jhenaidah', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(958, 1045, 'Companiganj (Noakhali)', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(959, 1046, 'Hatiya', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(960, 1047, 'Maijdee (Noakhali)', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(961, 1048, 'Senbag', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(962, 1049, 'Sonaimuri', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(963, 1050, 'Subarnachar', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(964, 1051, 'Kabir Hat', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(965, 1043, 'Begumganj', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(966, 1044, 'Chatkhil', 'Noakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(967, 1601, 'Alexandar', 'Laksmipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(968, 1038, 'Laksmipur Sadar', 'Laksmipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(969, 1039, 'Ramgati', 'Laksmipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(970, 1040, 'Ramganj', 'Laksmipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(971, 1041, 'Raipur (Lakshmipur)', 'Laksmipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(972, 1042, 'Kamalnagar', 'Laksmipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(973, 1082, 'Bhurungamari', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(974, 1083, 'Chilmary', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(975, 1084, 'Fulbari (Kurigram)', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(976, 1085, 'Kurigram Sadar', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(977, 1086, 'Nageswari', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(978, 1087, 'Rajarhat', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(979, 1088, 'Rajibpur', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(980, 1089, 'Rowmari', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(981, 1090, 'Ulipur', 'Kurigram', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(982, 676, 'Tarail', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(983, 668, 'Itna', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(984, 669, 'Karimganj', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(985, 670, 'Katiadi', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(986, 671, 'Kishoreganj Sadar', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(987, 664, 'Austogram', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(988, 665, 'Bajitpur', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(989, 673, 'Mithamain', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(990, 667, 'Hosainpur', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(991, 674, 'Nikli', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(992, 675, 'Pakundia', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(993, 828, 'Sonatola', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(994, 829, 'Shajahanpur (Bogura)', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(995, 818, 'Adamdighi (Bogra)', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(996, 819, 'Bogra Sadar', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(997, 820, 'Dhunot', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(998, 821, 'Dhubchanchia', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(999, 822, 'Gabtali (Bogra)', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1000, 823, 'Kahaloo', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1001, 824, 'Nandigram', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1002, 825, 'Sariakandi', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1003, 826, 'Sherpur (Bogra)', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1004, 827, 'Shibganj ( Bogra )', 'Bogra', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1005, 768, 'Noapara (Jessore)', 'Jessore', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1006, 1052, 'Baghaichari', 'Rangamati', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1007, 1030, 'Dighinala', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1008, 1031, 'Khagrachari Sadar', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1009, 1032, 'Laksmichari', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1010, 1033, 'Mohalchari', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1011, 1034, 'Manikchari', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1012, 1035, 'Matiranga', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1013, 1036, 'Panchari', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1014, 1037, 'Ramgor', 'Khagrachari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1015, 689, 'Lauhajang', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1016, 692, 'Sreenagar', 'Munshiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1017, 359, 'Dohar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(1018, 446, 'Nawabgonj (Dhaka)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(1019, 1629, 'Chandura (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1020, 1630, 'Singarbil (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1021, 1521, 'Kawtoly (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1022, 1631, 'Awliya Bazar (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1023, 1522, 'T.A Road (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1024, 1632, 'Poirtola (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1025, 1523, 'Sarak bazar (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1026, 1633, 'Ulchapara (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1027, 1524, 'Moddopara (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53');
INSERT INTO `districts` (`id`, `area_id`, `area_name`, `district`, `shippingfee`, `partialpayment`, `created_at`, `updated_at`) VALUES
(1028, 1634, 'Bhadugor (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1029, 1525, 'Birashar (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1030, 1635, 'Kumarshil more (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1031, 1526, 'Medda (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1032, 1527, 'Gatura- Pirbari (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1033, 970, 'Akhaura', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1034, 973, 'Paikpara (Brahmanbaria Sadar)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1035, 1626, 'Bijoynagor (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1036, 1627, 'Shahbajpur (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1037, 1628, 'Sohilpur (Brahmanbaria)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1038, 1101, 'Saidpur', 'Nilphamari', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1039, 755, 'Bagerhat Sadar', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1040, 756, 'Chitalmari', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1041, 757, 'Fakirhat (Bagerhat)', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1042, 758, 'Kachua(Bagerhat)', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1043, 759, 'Mollarhat', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1044, 760, 'Mongla', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1045, 761, 'Morelganj', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1046, 762, 'Rampal', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1047, 763, 'Sarankhola', 'Bagerhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1048, 1091, 'Aditmari', 'Lalmonirhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1049, 1092, 'Hatibandha (Lalmonirhat)', 'Lalmonirhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1050, 1093, 'Kaliganj(Lalmonirhat)', 'Lalmonirhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1051, 1094, 'Lalmonirhat Sadar', 'Lalmonirhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1052, 1095, 'Patgram', 'Lalmonirhat', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1053, 1489, 'Old bustand (Sunamganj)', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1054, 1490, 'Kazirpoint (Sunamganj)', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1055, 1491, 'Hason Nagar', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1056, 1492, 'Moddho bazar (Sunamganj)', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1057, 1493, 'wazkhali', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1058, 900, 'Biswambharpur', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1059, 902, 'Derai', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1060, 905, 'Jagannathpur', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1061, 906, 'Jamalganj', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1062, 907, 'Sulla', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1063, 908, 'Traffic Point (Sunamganj Sadar)', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1064, 909, 'Taherpur', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1065, 910, 'South Sunamganj', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1066, 964, 'Bandarban Sadar', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1067, 967, 'Rawanchari', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1068, 968, 'Ruma', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1069, 1130, 'soho area', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1070, 969, 'Thanchi', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1071, 1598, 'SDA', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(1072, 1391, 'Fatikchhari Harualchhari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1073, 1451, 'Raozan Fatepur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1074, 1392, 'Fatikchhari Najirhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:53'),
(1075, 990, 'Fatikchari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1076, 1452, 'Raozan Guzra Noapara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1077, 1393, 'Fatikchhari Nanupur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1078, 991, 'Hathazari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1079, 1453, 'Raozan jagannath Hat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1080, 1454, 'Raozan Kundeshwari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1081, 1394, 'Fatikchhari Narayanhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1082, 1455, 'Raozan Mohamuni', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1083, 1456, 'Raozan Pouroshobha', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1084, 995, 'Rangunia', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1085, 1457, 'Rauzan Gahira', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1086, 996, 'Raojan', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1087, 1399, 'Chattogram University', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1088, 1400, 'Hathazari Fatahabad', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1089, 1401, 'Hathazari Gorduara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1090, 1402, 'Hathazari Katirhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1091, 1403, 'Hathazari Madrasa', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1092, 1404, 'Hathazari Mirzapur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1093, 1463, 'Sayad Bari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1094, 1405, 'Hathazari Nuralibari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1095, 1432, 'Muradnagar - Hathazari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1096, 1406, 'Hathazari Yunus Nagar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1097, 1381, 'Dakkhin Ghatchak', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1098, 1414, 'Kadeer Nagar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1099, 1415, 'Kaptai Chandraghona', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1100, 1472, 'Uttar Gatchak', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1101, 1445, 'Rangunia Dhamair', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1102, 1446, 'Rangunia Sadar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1103, 1447, 'Ranir Hat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1104, 1448, 'Raozan B.I.T Post Office', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1105, 1389, 'Fakirkill', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1106, 1449, 'Raozan Beenajuri', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1107, 1390, 'Fatikchhari Bhandar Sharif', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1108, 1450, 'Raozan Dewanpur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1109, 1424, 'Mirsharai Abutorab', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1110, 1425, 'Mirsharai Azampur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1111, 1426, 'Mirsharai Bharawazhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1112, 1427, 'Mirsharai Darrogahat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1113, 993, 'Mirsarai', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1114, 1428, 'Mirsharai Joarganj', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1115, 1429, 'Mirsharai Korerhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1116, 1430, 'Mirsharai Mohazanhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1117, 1364, 'Boalkhali Sakpura', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1118, 994, 'Patiya', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1119, 1365, 'Boalkhali Saroatoli', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1120, 1138, 'Karnaphuli', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1121, 1412, 'Jaldia Marine Academy', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1122, 1413, 'Jaldia Merine Accade', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1123, 1441, 'Patiya Budhpara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1124, 1442, 'Patiya Sadar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1125, 1356, 'Anawara Battali', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1126, 1357, 'Anawara Paroikora', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1127, 1359, 'Boalkhali Charandwip', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1128, 1360, 'Boalkhali Iqbal Park', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1129, 986, 'Anwara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1130, 1361, 'Boalkhali Kadurkhal', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1131, 1362, 'Boalkhali Kanungopara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1132, 1363, 'Boalkhali Sadar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1133, 988, 'Boalkhali', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1134, 1018, 'Kutubdia', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1135, 963, 'Ali Kadam', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1136, 1019, 'Moheshkhali', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1137, 1020, 'Pekua', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1138, 965, 'Lama', 'Bandarban', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1139, 1016, 'Chakoria', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1140, 919, 'Zakiganj', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1141, 893, 'Barlekha', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1142, 899, 'Juri', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1143, 912, 'Beanibazar', 'Sylhet', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1144, 972, 'Bancharampur (Nabinagar)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1145, 974, 'Kashba (Nabinagar)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1146, 975, 'Nabinagar (Nabinagar Hub)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1147, 933, 'Gournadi (Barisal)', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1148, 934, 'Hijla', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1149, 936, 'Muladi', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1150, 937, 'Wazirpur', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1151, 928, 'Agailjhara', 'Barisal', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1152, 1073, 'Nawabganj (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1153, 1062, 'Birampur', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1154, 1068, 'Phulbari (Dinajpur)', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1155, 1069, 'Ghoraghat', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1156, 1070, 'Hakimpur', 'Dinajpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1157, 711, 'Belabo', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1158, 715, 'Raipura (Bhairab)', 'Norshingdi', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1159, 971, 'Ashuganj (Bhairab)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1160, 976, 'Nasirnagar (Bhairab Hub)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1161, 977, 'Sarail (Bhairab Hub)', 'Brahmanbaria', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1162, 672, 'Kuliarchar', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1163, 666, 'Bhairab', 'Kishoreganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1164, 1482, 'Gouripur (Comilla)', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1165, 1006, 'Daudkandi', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1166, 1008, 'Homna', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1167, 1010, 'Meghna', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1168, 1013, 'Titas', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1169, 901, 'Chattak', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1170, 904, 'Dowarabazar', 'Sunamganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1171, 709, 'Rupganj', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1172, 175, 'Bawaliapara (Narayangaj)', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1173, 706, 'Araihazar', 'Narayanganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1174, 1478, 'Vobanipur Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1175, 1570, 'Rajabari Sreepur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1176, 1479, 'Barmi Sreepur (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1177, 1480, 'Fulbaria Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1178, 650, 'Kapasia', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1179, 1555, 'Porabari Bazar', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1180, 651, 'Sreepur(Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1181, 1556, 'Dhaladia Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1182, 1557, 'Hotapara', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1183, 1558, 'Bager bazar', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1184, 1559, 'Member Bari Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1185, 1560, 'Gorgoria masterbari', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1186, 1561, 'Mc Bazar', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1187, 1562, 'Nayanpur Sreepur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1188, 1475, 'Mawna', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1189, 1567, 'Joyna Bazar', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1190, 1476, 'Rajendrapur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1191, 1477, 'Bhawal Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1192, 1004, 'Chowddagram', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1193, 1009, 'Laksam', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1194, 1012, 'Nangolkot', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1195, 1014, 'Monoharganj', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1196, 787, 'Koira', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1197, 788, 'Paikgacha', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1198, 1592, 'Amadee Bazar', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1199, 1593, 'kopilmuni Bazar', 'Khulna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1200, 888, 'Chunarughat (Shayestaganj Hub)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1201, 1599, 'Shayestaganj (Shayestaganj Hub)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1202, 891, 'Madhabpur (Shayestaganj Hub)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1203, 1614, 'Ranigaon (Shayestaganj Hub)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1204, 1615, 'Putijuri (Shayestaganj Hub)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1205, 886, 'Bahubal (Shayestaganj Hub)', 'Habiganj', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1206, 746, 'Ghatail', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1207, 747, 'Gopalpur (Tangail)', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1208, 750, 'Modhupur', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1209, 754, 'Dhanbari', 'Tangail', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1210, 694, 'Valuka', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1211, 698, 'Goffargaon', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1212, 705, 'Trishal', 'Mymensingh', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1213, 1022, 'Teknaf', 'Cox\'s Bazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1214, 997, 'Sandwip (Guptachara)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1215, 1459, 'Sandwip Shiberhat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1216, 1460, 'Sandwip Urirchar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1217, 1610, 'Sandwip (Enam Nagar)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1218, 1611, 'Sandwip (Complex)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1219, 1612, 'Sandwip (Kalapaniya)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1220, 1613, 'Sandwip (Gasua)', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1221, 842, 'Dhamoirhat', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1222, 843, 'Manda(Naogaon)', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1223, 844, 'Mahadebpur', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1224, 846, 'Niamatpur', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1225, 847, 'Patnitala', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1226, 848, 'Porsha', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1227, 850, 'Shapahar', 'Naogaon', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1228, 981, 'Hajiganj (Chandpur)', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1229, 982, 'Kachua(Chandpur)', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1230, 985, 'Shahrasti', 'Chandpur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1231, 862, 'Iswardi', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1232, 1620, 'Pakshi (Pabna)', 'Pabna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1233, 417, 'Konapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:25'),
(1234, 278, 'Demra', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1235, 1723, 'Basher pull (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1236, 1724, 'Bamuail (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1237, 1725, 'Sharuliya (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1238, 1726, 'Rani mohol (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1239, 1727, 'Staffquater (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1240, 1728, 'Demra bazar (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1241, 1729, 'Hajinogar (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1242, 1730, 'Boxnagar (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1243, 1731, 'Badsha mia road (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1244, 1732, 'Muslimnagar (Demra)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1245, 413, 'Matuail', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1246, 1305, 'Mollartek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1247, 1150, 'Mollapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1248, 68, 'Sonali Bank Staff Quarter', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1249, 1306, 'Gawair', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1250, 1151, 'Azampur (East)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1251, 1307, 'Kosaibari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1252, 70, 'Kawla', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1253, 1308, 'Prembagan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1254, 71, 'Naddapara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1255, 1309, 'Kachkura', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1256, 1310, 'Helal Market', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1257, 1311, 'Chamur Khan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1258, 1312, 'Society', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1259, 1313, 'Ismailkholla', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1260, 1292, 'Uttarkhan Mazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1261, 1314, 'Masterpara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1262, 1159, 'Azampur (West) (Uttara)', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1263, 1293, 'Dakshinkhan Bazar', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1264, 1315, 'Munda', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1265, 1294, 'Hajipara-Dakshinkhan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1266, 1316, 'Barua', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1267, 1296, 'Joynal Market', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1268, 1297, 'Johura Market', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1269, 1298, 'Habib Market', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1270, 1319, 'Ainusbag-Dakshinkhan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1271, 46, 'Ainusbag', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1272, 47, 'Uttarkhan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1273, 48, 'Dakshinkhan', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1274, 49, 'Fayedabad', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1275, 1299, 'BDR Market-House Building', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1276, 50, 'Ashkona', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1277, 1651, 'Uttara Sector - 2', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1278, 1300, 'BDR Market-Sector 6', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1279, 1652, 'Uttara Sector - 6', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1280, 1301, 'Moinartek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1281, 1653, 'Uttara Sector - 8', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1282, 1302, 'Atipara', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1283, 1147, 'Uttara Sector-4', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1284, 1303, 'Kot Bari', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1285, 1148, 'Goaltek', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1286, 1304, 'Dewan City', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1287, 1149, 'Chalabon', 'Dhaka', '80', '200', '2021-10-31 19:02:40', '2022-12-10 04:25:26'),
(1288, 940, 'Charfession', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1289, 942, 'Lalmohan', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1290, 943, 'Manpura', 'Bhola', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1291, 1569, 'Chondra Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1292, 1738, 'Goailbari bazar (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1293, 1739, 'Hatimara (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1294, 1740, 'Sardagonj (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1295, 1741, 'Ambagh (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1296, 1742, 'Fulbaria bazar (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1297, 1743, 'Madhobpur (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1298, 1744, 'Kabirpur (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1299, 1745, 'Walton high-tech (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1300, 1746, 'Walton micro-tech (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1301, 1747, 'Mollapara (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1302, 1748, 'Jalsukha (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1303, 1749, 'Gosatra (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1304, 648, 'Kaliakoir', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1305, 1563, 'Konabari', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1306, 1564, 'Mouchak Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1307, 1734, 'Vannara (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1308, 1565, 'Kashempur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1309, 1566, 'Shafipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1310, 1735, 'Sardarganj (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1311, 1736, 'Sultan Market (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1312, 1568, 'Pollibiddut Gazipur', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1313, 1737, 'Baroipara (Gazipur)', 'Gazipur', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1314, 1602, 'Kuakata', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1315, 1604, 'Khepupara', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1316, 1605, 'Payra port', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1317, 923, 'Amtali', 'Barguna', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1318, 1608, 'Mahipur', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1319, 953, 'Kalapara', 'Patuakhali', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1320, 1750, 'Companyganj (Comilla)', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1321, 1011, 'Muradnagar - Cumilla', 'Comilla', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1322, 1713, 'Tilagao - Kulaura', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1323, 1714, 'Bhatera - Kulaura', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1324, 895, 'Kulaura', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1325, 1624, 'Baramchal (Kulaura)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1326, 1625, 'Robir Bazar (Kulaura)', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1327, 1709, 'Brahman Bazar - Kulaura', 'Moulvibazar', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1328, 989, 'Chandanaish', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1329, 992, 'Lohagara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1330, 1461, 'Satkania Baitul Ijjat', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1331, 1462, 'Satkania Bazalia', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1332, 998, 'Satkania', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1333, 1408, 'Jaldi Banigram', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1334, 1409, 'Jaldi Gunagari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1335, 1410, 'Jaldi Khan Bahadur', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1336, 1411, 'Jaldi Sadar', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1337, 1384, 'East Joara Barma', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1338, 1385, 'East Joara Dohazari', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1339, 1386, 'East Joara East Joara', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1340, 1387, 'East Joara Gachbaria', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1341, 1421, 'Lohagara Chunti', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1342, 1422, 'Lohagara Padua', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54'),
(1343, 987, 'Banshkhali', 'Chittagong', '150', '510', '2021-10-31 19:02:40', '2022-12-10 04:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `ecom_pixels`
--

CREATE TABLE `ecom_pixels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ecom_pixels`
--

INSERT INTO `ecom_pixels` (`id`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, '1073890358064668', 1, '2025-09-04 18:05:58', '2025-09-04 18:05:58');

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
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `white_logo` varchar(255) NOT NULL,
  `dark_logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `copyright` varchar(155) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `name`, `white_logo`, `dark_logo`, `favicon`, `copyright`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Arzamart || Online Shopping', 'public/uploads/settings/1755639663-rza-mart-(1).webp', 'public/uploads/settings/1755639575-rza-mart.webp', 'public/uploads/settings/1755639575-rza-mart.webp', NULL, '<b>sadf</b>', 1, '2023-01-21 12:01:07', '2025-08-19 21:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `google_tag_managers`
--

CREATE TABLE `google_tag_managers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `google_tag_managers`
--

INSERT INTO `google_tag_managers` (`id`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'K29C9BKJ', 1, '2024-02-11 07:08:03', '2024-02-11 07:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `ip_blocks`
--

CREATE TABLE `ip_blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_no` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_11_113936_create_permission_tables', 1),
(8, '2023_01_21_150317_create_general_settings_table', 3),
(9, '2023_01_22_140830_create_social_media_table', 4),
(10, '2023_01_22_153053_create_contacts_table', 5),
(12, '2023_01_22_171430_create_categories_table', 6),
(17, '2023_02_09_082622_create_attributes_table', 7),
(21, '2023_02_11_065126_create_brands_table', 8),
(23, '2023_02_20_022411_create_customers_table', 9),
(24, '2023_02_21_083509_create_banners_table', 8),
(25, '2023_02_21_083647_create_banner_categories_table', 8),
(28, '2023_01_11_114621_create_products_table', 10),
(29, '2023_02_09_091624_create_productimages_table', 10),
(31, '2023_02_22_095626_create_districts_table', 11),
(48, '2023_02_22_150326_create_orders_table', 12),
(49, '2023_02_22_150339_create_order_details_table', 12),
(50, '2023_02_22_150351_create_shippings_table', 12),
(51, '2023_02_22_150400_create_payments_table', 12),
(53, '2023_02_25_022224_create_create_pages_table', 13),
(56, '2023_02_27_095310_create_reviews_table', 14),
(57, '2023_02_27_104954_create_order_types_table', 15),
(58, '2023_03_06_160934_create_campaigns_table', 16),
(59, '2023_03_13_121325_create_productprices_table', 17),
(60, '2023_04_17_125517_create_flavors_table', 18),
(61, '2023_04_17_125843_create_productflavors_table', 18),
(62, '2023_08_04_101452_create_shipping_charges_table', 19),
(64, '2023_08_04_204814_create_order_statuses_table', 20),
(65, '2023_08_06_161254_create_ecom_pixels_table', 21),
(66, '2023_06_04_121934_create_colors_table', 22),
(67, '2023_06_04_122329_create_sizes_table', 22),
(68, '2023_06_04_122459_create_productsizes_table', 22),
(69, '2023_06_04_122542_create_productcolors_table', 22),
(71, '2023_08_17_151949_create_campaign_reviews_table', 23),
(72, '2023_08_21_152844_create_ip_blocks_table', 24),
(73, '2023_09_07_171103_create_subcategories_table', 25),
(74, '2023_09_07_171404_create_childcategories_table', 25),
(76, '2024_02_06_165515_create_payment_gateways_table', 26),
(77, '2024_02_07_142550_create_sms_gateways_table', 27),
(78, '2024_02_07_161302_create_courierapis_table', 28),
(79, '2024_02_11_111947_create_google_tag_managers_table', 29);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 7),
(1, 'App\\Models\\User', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(55) NOT NULL,
  `amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `shipping_charge` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `admin_note` text DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `amount`, `discount`, `shipping_charge`, `customer_id`, `admin_note`, `order_status`, `user_id`, `note`, `created_at`, `updated_at`) VALUES
(61, '13155', 1330, 0, 130, 44, NULL, 4, NULL, NULL, '2025-08-20 13:30:48', '2025-08-20 18:14:19'),
(62, '41019', 4970, 0, 70, 45, NULL, 7, NULL, NULL, '2025-08-20 13:46:29', '2025-08-28 07:56:02'),
(63, '27500', 3070, 0, 70, 44, NULL, 7, NULL, NULL, '2025-08-23 07:48:52', '2025-08-28 07:56:02'),
(64, '21593', 1180, 0, 130, 46, NULL, 7, NULL, NULL, '2025-08-24 21:53:03', '2025-08-28 07:56:02'),
(65, '96452', 2020, 0, 120, 48, NULL, 7, NULL, NULL, '2025-08-26 07:49:33', '2025-08-28 07:56:02'),
(67, '90037', 1070, 0, 120, 47, NULL, 2, NULL, NULL, '2025-08-31 09:40:24', '2025-09-02 06:59:37'),
(68, '26682', 1350, 0, 150, 49, NULL, 2, NULL, NULL, '2025-09-01 05:03:50', '2025-09-02 06:59:37'),
(69, '32089', 750, 0, 150, 50, NULL, 2, NULL, NULL, '2025-09-02 05:26:33', '2025-09-02 06:59:37'),
(70, '41772', 750, 0, 150, 51, NULL, 2, NULL, NULL, '2025-09-02 17:11:13', '2025-09-03 06:49:35'),
(71, '89214', 1350, 0, 150, 52, NULL, 2, NULL, NULL, '2025-09-03 05:39:51', '2025-09-03 06:14:23'),
(72, '90585', 670, 0, 70, 53, NULL, 2, NULL, NULL, '2025-09-03 08:24:41', '2025-09-04 06:58:14'),
(73, '43401', 750, 0, 150, 54, NULL, 2, NULL, NULL, '2025-09-03 18:01:19', '2025-09-04 06:58:14'),
(74, '81714', 670, 0, 70, 55, NULL, 7, NULL, NULL, '2025-09-04 15:21:44', '2025-09-05 12:19:26'),
(75, '43872', 670, 0, 70, 56, NULL, 2, NULL, NULL, '2025-09-04 18:31:14', '2025-09-05 12:03:47'),
(77, '21836', 750, 0, 150, 57, NULL, 7, NULL, NULL, '2025-09-05 03:15:50', '2025-09-05 09:21:16'),
(78, '87220', 750, 0, 150, 58, NULL, 2, NULL, NULL, '2025-09-05 17:51:09', '2025-09-06 09:45:50'),
(79, '15686', 670, 0, 70, 59, NULL, 2, NULL, NULL, '2025-09-06 01:09:45', '2025-09-06 14:35:47'),
(80, '96931', 670, 0, 70, 60, NULL, 2, NULL, NULL, '2025-09-06 17:12:51', '2025-09-06 18:51:43'),
(81, '34260', 720, 0, 120, 61, NULL, 2, NULL, NULL, '2025-09-06 23:13:57', '2025-09-07 11:44:23'),
(82, '50251', 750, 0, 150, 62, NULL, 2, NULL, NULL, '2025-09-07 12:05:14', '2025-09-09 14:28:30'),
(83, '19894', 750, 0, 150, 62, NULL, 2, NULL, NULL, '2025-09-07 12:07:40', '2025-09-09 14:28:30'),
(84, '65949', 1270, 0, 70, 63, NULL, 2, NULL, NULL, '2025-09-08 09:42:47', '2025-09-08 14:52:03'),
(85, '13596', 670, 0, 70, 64, NULL, 2, NULL, NULL, '2025-09-08 17:02:10', '2025-09-08 18:57:12'),
(89, '88124', 750, 0, 150, 66, NULL, 2, NULL, NULL, '2025-09-09 13:02:35', '2025-09-09 14:15:53'),
(90, '47613', 1270, 0, 70, 67, NULL, 7, NULL, NULL, '2025-09-10 17:10:29', '2025-09-12 14:53:37'),
(91, '88966', 750, 0, 150, 68, NULL, 7, NULL, NULL, '2025-09-10 23:47:17', '2025-09-11 15:41:07'),
(93, '42576', 670, 0, 70, 70, NULL, 2, NULL, NULL, '2025-09-12 16:49:19', '2025-09-12 18:37:54'),
(94, '68996', 670, 0, 70, 71, NULL, 2, NULL, NULL, '2025-09-14 12:31:17', '2025-09-15 12:02:17'),
(95, '41787', 670, 0, 70, 72, NULL, 7, NULL, NULL, '2025-09-15 15:00:21', '2025-09-23 18:19:43'),
(96, '55361', 670, 0, 70, 72, NULL, 7, NULL, NULL, '2025-09-15 15:00:22', '2025-09-23 18:19:43'),
(97, '77742', 720, 0, 120, 73, NULL, 2, NULL, NULL, '2025-09-15 19:03:39', '2025-09-16 10:55:17'),
(98, '95999', 1350, 0, 150, 74, NULL, 2, NULL, NULL, '2025-09-15 19:05:33', '2025-09-16 09:31:44'),
(100, '50634', 750, 0, 150, 75, NULL, 2, NULL, NULL, '2025-09-15 20:10:57', '2025-09-16 09:51:16'),
(101, '22602', 1200, 0, 150, 76, NULL, 2, NULL, NULL, '2025-09-16 13:49:48', '2025-09-17 07:09:53'),
(102, '33888', 750, 0, 150, 77, NULL, 2, NULL, NULL, '2025-09-16 17:57:39', '2025-09-17 07:09:53'),
(103, '44583', 670, 0, 70, 78, NULL, 2, NULL, NULL, '2025-09-17 15:13:04', '2025-09-18 12:52:11'),
(104, '90877', 670, 0, 70, 78, NULL, 2, NULL, NULL, '2025-09-17 15:13:06', '2025-09-18 12:52:11'),
(105, '35346', 750, 0, 150, 79, NULL, 2, NULL, NULL, '2025-09-18 03:43:14', '2025-09-18 12:46:05'),
(106, '27120', 750, 0, 150, 79, NULL, 2, NULL, NULL, '2025-09-18 03:57:57', '2025-09-18 12:46:05'),
(107, '15709', 1270, 0, 70, 80, NULL, 2, NULL, NULL, '2025-09-18 07:00:04', '2025-09-18 12:46:05'),
(108, '51922', 750, 0, 150, 81, NULL, 7, NULL, NULL, '2025-09-18 13:22:38', '2025-09-19 12:55:11'),
(109, '61570', 720, 0, 120, 82, NULL, 2, NULL, NULL, '2025-09-18 18:34:23', '2025-09-19 12:53:06'),
(110, '66849', 720, 0, 120, 82, NULL, 2, NULL, NULL, '2025-09-18 18:36:57', '2025-09-19 12:53:06'),
(111, '61068', 670, 0, 70, 83, NULL, 7, NULL, NULL, '2025-09-18 19:03:07', '2025-09-29 18:57:39'),
(112, '35172', 1320, 0, 120, 84, NULL, 2, NULL, NULL, '2025-09-19 08:33:28', '2025-09-19 12:49:24'),
(113, '93743', 1320, 0, 120, 84, NULL, 2, NULL, NULL, '2025-09-19 08:36:33', '2025-09-19 12:48:55'),
(114, '97382', 1350, 0, 150, 85, NULL, 2, NULL, NULL, '2025-09-19 09:46:24', '2025-09-19 12:19:39'),
(115, '75045', 1320, 0, 120, 86, NULL, 2, NULL, NULL, '2025-09-19 14:22:18', '2025-09-19 16:53:49'),
(116, '30484', 1350, 0, 150, 87, NULL, 2, NULL, NULL, '2025-09-19 15:13:00', '2025-09-19 16:13:42'),
(117, '24345', 750, 0, 150, 88, NULL, 7, NULL, NULL, '2025-09-19 17:43:36', '2025-09-29 18:57:39'),
(118, '72373', 1350, 0, 150, 89, NULL, 2, NULL, NULL, '2025-09-21 17:34:28', '2025-09-23 10:02:00'),
(119, '49799', 750, 0, 150, 90, NULL, 7, NULL, NULL, '2025-09-21 19:36:52', '2025-09-29 18:57:39'),
(120, '37537', 750, 0, 150, 90, NULL, 7, NULL, NULL, '2025-09-21 19:36:53', '2025-09-29 18:57:39'),
(121, '26882', 750, 0, 150, 91, NULL, 7, NULL, NULL, '2025-09-22 03:24:39', '2025-09-29 18:57:39'),
(122, '39505', 1350, 0, 150, 92, NULL, 2, NULL, NULL, '2025-09-22 21:07:22', '2025-09-23 10:13:35'),
(123, '23910', 750, 0, 150, 93, NULL, 2, NULL, NULL, '2025-09-23 06:28:14', '2025-09-23 10:17:36'),
(124, '91554', 750, 0, 150, 94, NULL, 2, NULL, NULL, '2025-09-24 04:33:57', '2025-09-24 18:26:10'),
(125, '29116', 750, 0, 150, 94, NULL, 2, NULL, NULL, '2025-09-24 04:33:57', '2025-09-24 18:26:10'),
(126, '58557', 750, 0, 150, 95, NULL, 7, NULL, NULL, '2025-09-24 18:04:07', '2025-09-29 18:57:39'),
(127, '92981', 720, 0, 120, 96, NULL, 2, NULL, NULL, '2025-09-25 14:04:28', '2025-09-25 14:19:06'),
(128, '94967', 720, 0, 120, 96, NULL, 2, NULL, NULL, '2025-09-25 14:05:56', '2025-09-25 14:18:51'),
(129, '52310', 1270, 0, 70, 97, NULL, 2, NULL, NULL, '2025-09-25 19:05:26', '2025-09-27 10:41:12'),
(130, '38204', 720, 0, 120, 98, NULL, 2, NULL, NULL, '2025-09-25 22:26:25', '2025-09-27 10:47:34'),
(131, '66854', 1270, 0, 70, 99, NULL, 7, NULL, NULL, '2025-09-26 16:49:37', '2025-09-29 18:57:39'),
(132, '66249', 720, 0, 120, 100, NULL, 2, NULL, NULL, '2025-09-27 05:46:09', '2025-09-27 11:52:31'),
(133, '74761', 750, 0, 150, 101, NULL, 2, NULL, NULL, '2025-09-29 08:04:17', '2025-10-01 09:14:21'),
(134, '36101', 1320, 0, 120, 102, NULL, 2, NULL, NULL, '2025-09-30 18:24:45', '2025-10-01 09:14:21'),
(135, '66213', 720, 0, 120, 103, NULL, 2, NULL, NULL, '2025-10-01 20:33:17', '2025-10-02 12:40:17'),
(136, '49716', 1270, 0, 70, 104, NULL, 2, NULL, NULL, '2025-10-04 05:42:07', '2025-10-05 08:48:26'),
(137, '42072', 1350, 0, 150, 105, NULL, 2, NULL, NULL, '2025-10-05 11:03:58', '2025-10-05 14:34:38'),
(138, '69193', 750, 0, 150, 106, NULL, 2, NULL, NULL, '2025-10-06 07:54:46', '2025-10-06 08:48:35'),
(139, '88177', 670, 0, 70, 107, NULL, 2, NULL, NULL, '2025-10-06 07:55:43', '2025-10-06 11:12:24'),
(140, '49813', 720, 0, 120, 108, NULL, 7, NULL, NULL, '2025-10-06 18:03:10', '2025-10-08 11:39:17'),
(141, '74981', 670, 0, 70, 109, NULL, 7, NULL, NULL, '2025-10-07 03:39:37', '2025-10-08 10:51:15'),
(142, '34588', 2470, 0, 70, 110, NULL, 7, NULL, NULL, '2025-10-07 15:13:46', '2025-10-08 10:50:35'),
(143, '38609', 1350, 0, 150, 111, NULL, 7, NULL, NULL, '2025-10-07 15:49:42', '2025-10-08 11:00:39'),
(144, '99380', 1350, 0, 150, 112, NULL, 7, NULL, NULL, '2025-10-07 15:53:50', '2025-10-11 07:57:05'),
(145, '17318', 1350, 0, 150, 113, NULL, 2, NULL, NULL, '2025-10-07 19:59:42', '2025-10-08 10:47:31'),
(146, '48070', 750, 0, 150, 114, NULL, 2, NULL, NULL, '2025-10-08 04:09:45', '2025-10-08 10:43:52'),
(147, '57599', 670, 0, 70, 115, NULL, 7, NULL, NULL, '2025-10-10 18:53:30', '2025-10-11 08:34:18'),
(148, '46682', 670, 0, 70, 115, NULL, 7, NULL, NULL, '2025-10-10 18:53:31', '2025-10-11 08:34:18'),
(149, '21933', 750, 0, 150, 116, NULL, 2, NULL, NULL, '2025-10-11 10:26:00', '2025-10-11 12:44:09'),
(150, '71731', 670, 0, 70, 117, NULL, 7, NULL, NULL, '2025-10-12 16:47:40', '2025-10-14 11:35:01'),
(151, '36005', 750, 0, 150, 118, NULL, 2, NULL, NULL, '2025-10-13 12:25:54', '2025-10-14 11:38:18'),
(152, '69162', 1270, 0, 70, 119, NULL, 1, NULL, NULL, '2025-10-13 17:17:49', '2025-10-13 17:17:49'),
(153, '78479', 720, 0, 120, 120, NULL, 2, NULL, NULL, '2025-10-14 01:23:20', '2025-10-14 11:01:54'),
(154, '61385', 670, 0, 70, 121, NULL, 2, NULL, NULL, '2025-10-14 21:32:44', '2025-10-15 13:09:12'),
(155, '30770', 670, 0, 70, 121, NULL, 2, NULL, NULL, '2025-10-14 21:32:44', '2025-10-15 13:09:12'),
(156, '11709', 750, 0, 150, 121, NULL, 2, NULL, NULL, '2025-10-15 09:22:57', '2025-10-15 13:09:12'),
(157, '92210', 720, 0, 120, 122, NULL, 2, NULL, NULL, '2025-10-21 03:22:10', '2025-10-22 11:36:49'),
(158, '37692', 1120, 0, 70, 123, NULL, 7, NULL, NULL, '2025-10-23 15:30:50', '2025-10-23 15:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `purchase_price` int(11) DEFAULT NULL,
  `sale_price` int(11) NOT NULL,
  `product_discount` int(11) DEFAULT 0,
  `product_size` varchar(255) DEFAULT NULL,
  `product_color` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `purchase_price`, `sale_price`, `product_discount`, `product_size`, `product_color`, `qty`, `created_at`, `updated_at`) VALUES
(68, 61, 152, 'Men’s Cuban Light Lemon CBL-04', 500, 1200, 0, NULL, NULL, 1, '2025-08-20 13:30:48', '2025-08-20 13:30:48'),
(69, 62, 156, 'Shirt 4', 1400, 1800, 0, NULL, NULL, 1, '2025-08-20 13:46:29', '2025-08-22 05:35:43'),
(70, 62, 154, 'shirt 2', 1000, 1300, 0, NULL, NULL, 1, '2025-08-22 05:35:43', '2025-08-22 05:35:43'),
(71, 62, 156, 'Shirt 4', 1400, 1800, 0, NULL, NULL, 1, '2025-08-22 05:35:43', '2025-08-22 05:35:43'),
(72, 63, 155, 'Shirt 3', 1000, 1800, 0, NULL, NULL, 1, '2025-08-23 07:48:52', '2025-08-23 07:48:52'),
(73, 63, 152, 'Men’s Cuban Light Lemon CBL-04', 500, 1200, 0, NULL, NULL, 1, '2025-08-23 07:48:52', '2025-08-23 07:48:52'),
(74, 64, 171, 'Cargo Pnat01 Grey', 750, 1050, 0, '30', NULL, 1, '2025-08-24 21:53:03', '2025-08-24 21:53:03'),
(75, 65, 173, 'Cargo Pant02 Light Blue Wash', 450, 950, 0, '30', NULL, 1, '2025-08-26 07:49:33', '2025-08-26 07:49:33'),
(76, 65, 174, 'Cargo Pant02 Deep Blue Wash', 450, 950, 0, '30', NULL, 1, '2025-08-26 07:49:33', '2025-08-26 07:49:33'),
(78, 67, 174, 'Cargo Pant02 Deep Blue Wash', 450, 950, 0, NULL, NULL, 1, '2025-08-31 09:40:24', '2025-08-31 09:40:24'),
(79, 68, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 2, '2025-09-01 05:03:50', '2025-09-01 05:03:50'),
(80, 69, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '32', NULL, 1, '2025-09-02 05:26:33', '2025-09-02 05:26:33'),
(81, 70, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '34', NULL, 1, '2025-09-02 17:11:13', '2025-09-02 17:11:13'),
(82, 71, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-09-03 05:39:51', '2025-09-03 05:39:51'),
(83, 71, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-03 05:39:51', '2025-09-03 05:39:51'),
(84, 72, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-03 08:24:41', '2025-09-03 08:24:41'),
(85, 73, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-03 18:01:19', '2025-09-03 18:01:19'),
(86, 74, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-04 15:21:44', '2025-09-04 15:21:44'),
(87, 75, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-04 18:31:14', '2025-09-04 18:31:14'),
(89, 77, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-09-05 03:15:50', '2025-09-05 03:15:50'),
(90, 78, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-05 17:51:09', '2025-09-05 17:51:09'),
(91, 79, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-06 01:09:45', '2025-09-06 01:09:45'),
(92, 80, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-09-06 17:12:51', '2025-09-06 17:12:51'),
(93, 81, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-06 23:13:57', '2025-09-06 23:13:57'),
(94, 82, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '32', NULL, 1, '2025-09-07 12:05:14', '2025-09-07 12:05:14'),
(95, 83, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-07 12:07:40', '2025-09-07 12:07:40'),
(96, 84, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-08 09:42:47', '2025-09-08 09:42:47'),
(97, 84, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-08 09:42:47', '2025-09-08 09:42:47'),
(98, 85, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '30', NULL, 1, '2025-09-08 17:02:10', '2025-09-08 17:02:10'),
(102, 89, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-09 13:02:35', '2025-09-09 13:02:35'),
(103, 90, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-10 17:10:29', '2025-09-10 17:10:29'),
(104, 90, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-10 17:10:29', '2025-09-10 17:10:29'),
(105, 91, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-10 23:47:17', '2025-09-10 23:47:17'),
(107, 93, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '30', NULL, 1, '2025-09-12 16:49:19', '2025-09-12 16:49:19'),
(108, 94, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-14 12:31:17', '2025-09-14 12:31:17'),
(109, 95, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-15 15:00:21', '2025-09-15 15:00:21'),
(110, 96, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-15 15:00:22', '2025-09-15 15:00:22'),
(111, 97, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-15 19:03:39', '2025-09-15 19:03:39'),
(112, 98, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '30', NULL, 1, '2025-09-15 19:05:33', '2025-09-15 19:05:33'),
(113, 98, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-15 19:05:33', '2025-09-15 19:05:33'),
(115, 100, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '28', NULL, 1, '2025-09-15 20:10:57', '2025-09-15 20:10:57'),
(116, 101, 169, 'Cargo Pnat01 Brown', 750, 1050, 0, '30', NULL, 1, '2025-09-16 13:49:48', '2025-09-16 13:49:48'),
(117, 102, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-16 17:57:39', '2025-09-16 17:57:39'),
(118, 103, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-17 15:13:04', '2025-09-17 15:13:04'),
(119, 104, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-17 15:13:06', '2025-09-17 15:13:06'),
(120, 105, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-18 03:43:14', '2025-09-18 03:43:14'),
(121, 106, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-18 03:57:57', '2025-09-18 03:57:57'),
(122, 107, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '32', NULL, 1, '2025-09-18 07:00:04', '2025-09-18 07:00:04'),
(123, 107, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-18 07:00:04', '2025-09-18 07:00:04'),
(124, 108, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-18 13:22:38', '2025-09-18 13:22:38'),
(125, 109, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-18 18:34:23', '2025-09-18 18:34:23'),
(126, 110, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '28', NULL, 1, '2025-09-18 18:36:57', '2025-09-18 18:36:57'),
(127, 111, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-18 19:03:07', '2025-09-18 19:03:07'),
(128, 112, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 2, '2025-09-19 08:33:28', '2025-09-19 08:33:28'),
(129, 113, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 2, '2025-09-19 08:36:33', '2025-09-19 08:36:33'),
(130, 114, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 2, '2025-09-19 09:46:24', '2025-09-19 09:46:24'),
(131, 115, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-19 14:22:18', '2025-09-19 14:22:18'),
(132, 115, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-09-19 14:22:18', '2025-09-19 14:22:18'),
(133, 116, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-19 15:13:00', '2025-09-19 15:13:00'),
(134, 116, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-19 15:13:00', '2025-09-19 15:13:00'),
(135, 117, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-19 17:43:36', '2025-09-19 17:43:36'),
(136, 118, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-21 17:34:28', '2025-09-21 17:34:28'),
(137, 118, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-21 17:34:28', '2025-09-21 17:34:28'),
(138, 119, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-21 19:36:52', '2025-09-21 19:36:52'),
(139, 120, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-21 19:36:53', '2025-09-21 19:36:53'),
(140, 121, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '30', NULL, 1, '2025-09-22 03:24:39', '2025-09-22 03:24:39'),
(141, 122, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-22 21:07:22', '2025-09-22 21:07:22'),
(142, 122, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-22 21:07:22', '2025-09-22 21:07:22'),
(143, 123, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-23 06:28:14', '2025-09-23 06:28:14'),
(144, 124, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-24 04:33:57', '2025-09-24 04:33:57'),
(145, 125, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-24 04:33:58', '2025-09-24 04:33:58'),
(146, 126, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '30', NULL, 1, '2025-09-24 18:04:07', '2025-09-24 18:04:07'),
(147, 127, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-25 14:04:28', '2025-09-25 14:04:28'),
(148, 128, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-09-25 14:05:56', '2025-09-25 14:05:56'),
(149, 129, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '34', NULL, 1, '2025-09-25 19:05:26', '2025-09-25 19:05:26'),
(150, 129, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-25 19:05:26', '2025-09-25 19:05:26'),
(151, 130, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-25 22:26:25', '2025-09-25 22:26:25'),
(152, 131, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-26 16:49:37', '2025-09-26 16:49:37'),
(153, 131, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-09-26 16:49:37', '2025-09-26 16:49:37'),
(154, 132, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-09-27 05:46:09', '2025-09-27 05:46:09'),
(155, 133, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-29 08:04:17', '2025-09-29 08:04:17'),
(156, 134, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-30 18:24:45', '2025-09-30 18:24:45'),
(157, 134, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-09-30 18:24:45', '2025-09-30 18:24:45'),
(158, 135, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '32', NULL, 1, '2025-10-01 20:33:17', '2025-10-01 20:33:17'),
(159, 136, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-10-04 05:42:07', '2025-10-04 05:42:07'),
(160, 136, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-10-04 05:42:07', '2025-10-04 05:42:07'),
(161, 137, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-10-05 11:03:58', '2025-10-05 14:33:33'),
(162, 137, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, NULL, NULL, 1, '2025-10-05 14:33:33', '2025-10-05 14:33:33'),
(163, 138, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-10-06 07:54:46', '2025-10-06 07:54:46'),
(164, 139, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 1, '2025-10-06 07:55:43', '2025-10-06 07:55:43'),
(165, 140, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-10-06 18:03:10', '2025-10-06 18:03:10'),
(166, 141, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-10-07 03:39:37', '2025-10-07 03:39:37'),
(167, 142, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 4, '2025-10-07 15:13:46', '2025-10-07 15:13:46'),
(168, 143, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 2, '2025-10-07 15:49:42', '2025-10-07 15:49:42'),
(169, 144, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '34', NULL, 2, '2025-10-07 15:53:50', '2025-10-07 15:53:50'),
(170, 145, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-10-07 19:59:42', '2025-10-07 19:59:42'),
(171, 145, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '36', NULL, 1, '2025-10-07 19:59:42', '2025-10-07 19:59:42'),
(172, 146, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '34', NULL, 1, '2025-10-08 04:09:45', '2025-10-08 04:09:45'),
(173, 147, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-10-10 18:53:30', '2025-10-10 18:53:30'),
(174, 148, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-10-10 18:53:31', '2025-10-10 18:53:31'),
(175, 149, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-10-11 10:26:00', '2025-10-11 10:26:00'),
(176, 150, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '32', NULL, 1, '2025-10-12 16:47:40', '2025-10-12 16:47:40'),
(177, 151, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-10-13 12:25:54', '2025-10-13 12:25:54'),
(178, 152, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '30', NULL, 1, '2025-10-13 17:17:49', '2025-10-13 17:17:49'),
(179, 152, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-10-13 17:17:49', '2025-10-13 17:17:49'),
(180, 153, 173, 'Cargo Pant02 Light Blue Wash', 450, 600, 0, '30', NULL, 1, '2025-10-14 01:23:20', '2025-10-14 01:23:20'),
(181, 154, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(182, 155, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(183, 156, 172, 'Cargo Pant02 Black Wash', 450, 600, 0, '36', NULL, 1, '2025-10-15 09:22:57', '2025-10-15 09:22:57'),
(184, 157, 174, 'Cargo Pant02 Deep Blue Wash', 450, 600, 0, '28', NULL, 1, '2025-10-21 03:22:10', '2025-10-21 03:22:10'),
(185, 158, 202, 'Hoodie 01 Olive', 680, 1050, 0, 'L', NULL, 1, '2025-10-23 15:30:50', '2025-10-23 15:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(155) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `status` varchar(55) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 'pending', '1', '2023-08-15 11:28:33', '2023-08-15 11:28:33'),
(2, 'Processing', 'processing', '1', '2023-08-15 11:31:22', '2023-08-15 11:31:22'),
(3, 'On The Way', 'on-the-way', '1', '2023-08-15 11:31:34', '2023-08-15 11:31:34'),
(4, 'On Hold', 'on-hold', '1', '2023-08-15 11:31:45', '2023-08-15 11:31:45'),
(5, 'In Courier', 'in-courier', '1', '2023-08-15 11:31:56', '2023-08-21 05:45:54'),
(6, 'Completed', 'completed', '1', '2023-08-15 11:32:06', '2023-08-21 05:46:06'),
(7, 'Cancelled', 'cancelled', '1', '2023-08-21 05:46:15', '2023-08-21 05:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `trx_id` varchar(55) DEFAULT NULL,
  `sender_number` varchar(55) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  `payment_status` varchar(55) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `customer_id`, `amount`, `trx_id`, `sender_number`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(61, 61, 44, 1330, NULL, NULL, 'Cash On Delivery', 'pending', '2025-08-20 13:30:48', '2025-08-20 13:30:48'),
(62, 62, 45, 4970, NULL, NULL, 'Cash On Delivery', 'pending', '2025-08-20 13:46:29', '2025-08-22 05:35:43'),
(63, 63, 44, 3070, NULL, NULL, 'Cash On Delivery', 'pending', '2025-08-23 07:48:52', '2025-08-23 07:48:52'),
(64, 64, 46, 1180, NULL, NULL, 'Cash On Delivery', 'pending', '2025-08-24 21:53:03', '2025-08-24 21:53:03'),
(65, 65, 48, 2020, NULL, NULL, 'Cash On Delivery', 'pending', '2025-08-26 07:49:33', '2025-08-26 07:49:33'),
(67, 67, 47, 1070, NULL, NULL, NULL, 'pending', '2025-08-31 09:40:24', '2025-08-31 09:40:24'),
(68, 68, 49, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-01 05:03:50', '2025-09-01 05:03:50'),
(69, 69, 50, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-02 05:26:33', '2025-09-02 05:26:33'),
(70, 70, 51, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-02 17:11:13', '2025-09-02 17:11:13'),
(71, 71, 52, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-03 05:39:51', '2025-09-03 05:39:51'),
(72, 72, 53, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-03 08:24:41', '2025-09-03 08:24:41'),
(73, 73, 54, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-03 18:01:19', '2025-09-03 18:01:19'),
(74, 74, 55, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-04 15:21:44', '2025-09-04 15:21:44'),
(75, 75, 56, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-04 18:31:14', '2025-09-04 18:31:14'),
(77, 77, 57, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-05 03:15:50', '2025-09-05 03:15:50'),
(78, 78, 58, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-05 17:51:09', '2025-09-05 17:51:09'),
(79, 79, 59, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-06 01:09:45', '2025-09-06 01:09:45'),
(80, 80, 60, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-06 17:12:51', '2025-09-06 17:12:51'),
(81, 81, 61, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-06 23:13:57', '2025-09-07 11:44:06'),
(82, 82, 62, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-07 12:05:14', '2025-09-07 12:05:14'),
(83, 83, 62, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-07 12:07:40', '2025-09-07 12:07:40'),
(84, 84, 63, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-08 09:42:47', '2025-09-08 09:42:47'),
(85, 85, 64, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-08 17:02:10', '2025-09-08 17:02:10'),
(89, 89, 66, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-09 13:02:35', '2025-09-09 13:02:35'),
(90, 90, 67, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-10 17:10:29', '2025-09-10 17:10:29'),
(91, 91, 68, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-10 23:47:17', '2025-09-10 23:47:17'),
(93, 93, 70, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-12 16:49:19', '2025-09-12 16:49:19'),
(94, 94, 71, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-14 12:31:17', '2025-09-14 12:31:17'),
(95, 95, 72, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-15 15:00:21', '2025-09-15 15:00:21'),
(96, 96, 72, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-15 15:00:22', '2025-09-15 15:00:22'),
(97, 97, 73, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-15 19:03:39', '2025-09-15 19:03:39'),
(98, 98, 74, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-15 19:05:33', '2025-09-15 19:05:33'),
(100, 100, 75, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-15 20:10:57', '2025-09-15 20:10:57'),
(101, 101, 76, 1200, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-16 13:49:48', '2025-09-16 13:49:48'),
(102, 102, 77, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-16 17:57:39', '2025-09-16 17:57:39'),
(103, 103, 78, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-17 15:13:04', '2025-09-17 15:13:04'),
(104, 104, 78, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-17 15:13:06', '2025-09-17 15:13:06'),
(105, 105, 79, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 03:43:14', '2025-09-18 03:43:14'),
(106, 106, 79, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 03:57:57', '2025-09-18 03:57:57'),
(107, 107, 80, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 07:00:04', '2025-09-18 07:00:04'),
(108, 108, 81, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 13:22:38', '2025-09-18 13:22:38'),
(109, 109, 82, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 18:34:23', '2025-09-18 18:34:23'),
(110, 110, 82, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 18:36:57', '2025-09-18 18:36:57'),
(111, 111, 83, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-18 19:03:07', '2025-09-18 19:03:07'),
(112, 112, 84, 1320, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-19 08:33:28', '2025-09-19 08:33:28'),
(113, 113, 84, 1320, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-19 08:36:33', '2025-09-19 08:36:33'),
(114, 114, 85, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-19 09:46:24', '2025-09-19 09:46:24'),
(115, 115, 86, 1320, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-19 14:22:18', '2025-09-19 14:22:18'),
(116, 116, 87, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-19 15:13:00', '2025-09-19 15:13:00'),
(117, 117, 88, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-19 17:43:36', '2025-09-19 17:43:36'),
(118, 118, 89, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-21 17:34:28', '2025-09-21 17:34:28'),
(119, 119, 90, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-21 19:36:52', '2025-09-21 19:36:52'),
(120, 120, 90, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-21 19:36:53', '2025-09-21 19:36:53'),
(121, 121, 91, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-22 03:24:39', '2025-09-22 03:24:39'),
(122, 122, 92, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-22 21:07:22', '2025-09-22 21:07:22'),
(123, 123, 93, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-23 06:28:14', '2025-09-23 10:17:28'),
(124, 124, 94, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-24 04:33:57', '2025-09-24 04:33:57'),
(125, 125, 94, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-24 04:33:58', '2025-09-24 04:33:58'),
(126, 126, 95, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-24 18:04:07', '2025-09-24 18:04:07'),
(127, 127, 96, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-25 14:04:28', '2025-09-25 14:04:28'),
(128, 128, 96, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-25 14:05:56', '2025-09-25 14:05:56'),
(129, 129, 97, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-25 19:05:26', '2025-09-25 19:05:26'),
(130, 130, 98, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-25 22:26:25', '2025-09-27 10:47:21'),
(131, 131, 99, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-26 16:49:37', '2025-09-26 16:49:37'),
(132, 132, 100, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-27 05:46:09', '2025-09-27 11:52:24'),
(133, 133, 101, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-29 08:04:17', '2025-09-29 08:04:17'),
(134, 134, 102, 1320, NULL, NULL, 'Cash On Delivery', 'pending', '2025-09-30 18:24:45', '2025-09-30 18:24:45'),
(135, 135, 103, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-01 20:33:17', '2025-10-01 20:33:17'),
(136, 136, 104, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-04 05:42:07', '2025-10-04 05:42:07'),
(137, 137, 105, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-05 11:03:58', '2025-10-05 11:03:58'),
(138, 138, 106, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-06 07:54:46', '2025-10-06 07:54:46'),
(139, 139, 107, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-06 07:55:43', '2025-10-06 07:55:43'),
(140, 140, 108, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-06 18:03:10', '2025-10-06 18:03:10'),
(141, 141, 109, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-07 03:39:37', '2025-10-07 03:39:37'),
(142, 142, 110, 2470, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-07 15:13:46', '2025-10-07 15:13:46'),
(143, 143, 111, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-07 15:49:42', '2025-10-07 15:49:42'),
(144, 144, 112, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-07 15:53:50', '2025-10-07 15:53:50'),
(145, 145, 113, 1350, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-07 19:59:42', '2025-10-07 19:59:42'),
(146, 146, 114, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-08 04:09:45', '2025-10-08 04:09:45'),
(147, 147, 115, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-10 18:53:30', '2025-10-10 18:53:30'),
(148, 148, 115, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-10 18:53:31', '2025-10-10 18:53:31'),
(149, 149, 116, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-11 10:26:00', '2025-10-11 10:26:00'),
(150, 150, 117, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-12 16:47:40', '2025-10-12 16:47:40'),
(151, 151, 118, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-13 12:25:54', '2025-10-13 12:25:54'),
(152, 152, 119, 1270, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-13 17:17:49', '2025-10-13 17:17:49'),
(153, 153, 120, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-14 01:23:20', '2025-10-14 01:23:20'),
(154, 154, 121, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(155, 155, 121, 670, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(156, 156, 121, 750, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-15 09:22:57', '2025-10-15 09:22:57'),
(157, 157, 122, 720, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-21 03:22:10', '2025-10-21 03:22:10'),
(158, 158, 123, 1120, NULL, NULL, 'Cash On Delivery', 'pending', '2025-10-23 15:30:50', '2025-10-23 15:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(55) DEFAULT NULL,
  `app_key` varchar(155) DEFAULT NULL,
  `app_secret` varchar(155) DEFAULT NULL,
  `username` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  `base_url` varchar(99) DEFAULT NULL,
  `success_url` varchar(155) DEFAULT NULL,
  `return_url` varchar(155) DEFAULT NULL,
  `prefix` varchar(25) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

-- Payment credentials intentionally removed. Configure live credentials in Admin → Payment Gateway after deployment.
INSERT INTO `payment_gateways` (`id`, `type`, `app_key`, `app_secret`, `username`, `password`, `base_url`, `success_url`, `return_url`, `prefix`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bkash', '', '', '', '', '', '', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-01-11 06:31:32', '2023-01-11 06:31:32'),
(2, 'role-create', 'web', '2023-01-11 06:31:33', '2023-01-11 06:31:33'),
(3, 'role-edit', 'web', '2023-01-11 06:31:34', '2023-01-11 06:31:34'),
(4, 'role-delete', 'web', '2023-01-11 06:31:34', '2023-01-11 06:31:34'),
(5, 'product-list', 'web', '2023-01-11 06:31:34', '2023-01-11 06:31:34'),
(6, 'product-create', 'web', '2023-01-11 06:31:35', '2023-01-11 06:31:35'),
(7, 'product-edit', 'web', '2023-01-11 06:31:35', '2023-01-11 06:31:35'),
(8, 'product-delete', 'web', '2023-01-11 06:31:35', '2023-01-11 06:31:35'),
(9, 'permission-list', 'web', NULL, NULL),
(10, 'permission-create', 'web', NULL, NULL),
(11, 'setting-delete', 'web', '2023-01-21 10:50:15', '2023-01-21 10:50:15'),
(12, 'setting-edit', 'web', '2023-01-21 10:50:35', '2023-01-21 10:50:35'),
(13, 'setting-create', 'web', '2023-01-21 10:50:50', '2023-01-21 10:50:50'),
(14, 'setting-list', 'web', '2023-01-21 10:51:01', '2023-01-21 10:51:01'),
(15, 'social-list', 'web', '2023-01-22 08:33:54', '2023-01-22 08:33:54'),
(16, 'social-create', 'web', '2023-01-22 08:34:07', '2023-01-22 08:34:07'),
(17, 'social-edit', 'web', '2023-01-22 08:34:17', '2023-01-22 08:34:17'),
(18, 'social-delete', 'web', '2023-01-22 08:34:25', '2023-01-22 08:34:25'),
(19, 'contact-list', 'web', '2023-01-22 10:25:01', '2023-01-22 10:25:01'),
(20, 'contact-create', 'web', '2023-01-22 10:25:16', '2023-01-22 10:28:19'),
(21, 'permission-edit', 'web', '2023-01-22 10:26:28', '2023-01-22 10:26:28'),
(22, 'permission-delete', 'web', '2023-01-22 10:26:39', '2023-01-22 10:26:39'),
(23, 'contact-edit', 'web', '2023-01-22 10:28:34', '2023-01-22 10:28:34'),
(24, 'contact-delete', 'web', '2023-01-22 10:28:45', '2023-01-22 10:28:45'),
(25, 'category-list', 'web', '2023-02-08 10:26:58', '2023-02-08 10:26:58'),
(26, 'category-create', 'web', '2023-02-08 10:27:19', '2023-02-08 10:27:19'),
(27, 'category-edit', 'web', '2023-02-08 10:27:28', '2023-02-08 10:27:28'),
(28, 'category-delete', 'web', '2023-02-08 10:27:38', '2023-02-08 10:27:38'),
(29, 'attribute-list', 'web', '2023-02-09 02:54:47', '2023-02-09 02:54:47'),
(30, 'attribute-create', 'web', '2023-02-09 02:55:02', '2023-02-09 02:55:02'),
(31, 'attribute-edit', 'web', '2023-02-09 02:55:14', '2023-02-09 02:55:14'),
(32, 'attribute-delete', 'web', '2023-02-09 02:55:23', '2023-02-09 02:55:23'),
(33, 'banner-category-list', 'web', '2023-02-21 03:00:08', '2023-02-21 03:00:08'),
(34, 'banner-category-create', 'web', '2023-02-21 03:00:34', '2023-02-21 03:00:34'),
(35, 'banner-category-edit', 'web', '2023-02-21 03:00:45', '2023-02-21 03:00:45'),
(36, 'banner-category-delete', 'web', '2023-02-21 03:00:53', '2023-02-21 03:00:53'),
(37, 'banner-list', 'web', '2023-02-21 03:51:27', '2023-02-21 03:51:27'),
(38, 'banner-create', 'web', '2023-02-21 03:51:50', '2023-02-21 03:51:50'),
(39, 'banner-edit', 'web', '2023-02-21 03:52:18', '2023-02-21 03:52:18'),
(40, 'banner-delete', 'web', '2023-02-21 03:52:32', '2023-02-21 03:52:32'),
(41, 'page-list', 'web', '2023-02-24 20:42:52', '2023-02-24 20:42:52'),
(42, 'page-create', 'web', '2023-02-24 20:43:01', '2023-02-24 20:43:01'),
(43, 'page-edit', 'web', '2023-02-24 20:43:08', '2023-02-24 20:43:08'),
(44, 'page-delete', 'web', '2023-02-24 20:43:15', '2023-02-24 20:43:15'),
(49, 'shipping-list', 'web', '2023-08-04 08:46:28', '2023-08-04 08:46:28'),
(50, 'shipping-create', 'web', '2023-08-04 08:47:09', '2023-08-04 08:47:09'),
(51, 'shipping-edit', 'web', '2023-08-04 08:47:23', '2023-08-04 08:47:23'),
(52, 'shipping-delete', 'web', '2023-08-04 08:47:34', '2023-08-04 08:47:34'),
(53, 'color-list', 'web', '2023-08-15 07:48:52', '2023-08-15 07:48:52'),
(54, 'color-create', 'web', '2023-08-15 07:49:01', '2023-08-15 07:49:01'),
(55, 'color-edit', 'web', '2023-08-15 07:49:12', '2023-08-15 07:49:12'),
(56, 'color-delete', 'web', '2023-08-15 07:49:20', '2023-08-15 07:49:20'),
(69, 'subcategory-list', 'web', '2024-01-31 10:49:48', '2024-01-31 10:49:48'),
(70, 'subcategory-create', 'web', '2024-01-31 10:49:56', '2024-01-31 10:49:56'),
(71, 'subcategory-edit', 'web', '2024-01-31 10:50:04', '2024-01-31 10:50:04'),
(72, 'subcategory-delete', 'web', '2024-01-31 10:50:13', '2024-01-31 10:50:13'),
(73, 'childcategory-list', 'web', '2024-01-31 10:51:33', '2024-01-31 10:51:33'),
(74, 'childcategory-create', 'web', '2024-01-31 10:51:41', '2024-01-31 10:51:41'),
(75, 'childcategory-edit', 'web', '2024-01-31 10:51:50', '2024-01-31 10:51:50'),
(76, 'childcategory-delete', 'web', '2024-01-31 10:52:00', '2024-01-31 10:52:00');

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
-- Table structure for table `productcolors`
--

CREATE TABLE `productcolors` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productcolors`
--

INSERT INTO `productcolors` (`id`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(1, 1, 35, '2024-02-05 09:40:29', '2024-02-05 09:40:29'),
(2, 1, 62, '2024-02-05 09:40:29', '2024-02-05 09:40:29'),
(3, 35, 44, '2024-02-05 09:54:29', '2024-02-05 09:54:29'),
(4, 28, 62, '2024-02-05 14:06:19', '2024-02-05 14:06:19'),
(5, 2, 65, '2024-02-05 14:07:27', '2024-02-05 14:07:27'),
(6, 131, 32, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(7, 131, 36, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(8, 131, 39, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(9, 131, 40, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(10, 132, 35, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(11, 132, 52, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(12, 132, 62, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(13, 133, 62, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(14, 134, 35, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(15, 134, 52, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(16, 134, 63, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(17, 137, 35, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(18, 137, 54, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(19, 138, 35, '2024-06-23 14:49:33', '2024-06-23 14:49:33'),
(20, 138, 36, '2024-06-23 14:49:33', '2024-06-23 14:49:33'),
(21, 138, 39, '2024-06-23 14:49:33', '2024-06-23 14:49:33'),
(22, 139, 32, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(23, 139, 36, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(24, 139, 39, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(25, 140, 35, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(26, 140, 39, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(27, 141, 32, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(28, 141, 35, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(29, 151, 35, '2025-02-04 14:34:17', '2025-02-04 14:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(6, 'public/uploads/product/1706962659-6.webp', 1, '2024-02-03 12:17:39', '2024-02-03 12:17:39'),
(7, 'public/uploads/product/1706962760-1.webp', 5, '2024-02-03 12:19:20', '2024-02-03 12:19:20'),
(8, 'public/uploads/product/1706962864-2.webp', 2, '2024-02-03 12:21:04', '2024-02-03 12:21:04'),
(9, 'public/uploads/product/1706962961-3.webp', 3, '2024-02-03 12:22:41', '2024-02-03 12:22:41'),
(10, 'public/uploads/product/1706963054-4.webp', 4, '2024-02-03 12:24:14', '2024-02-03 12:24:14'),
(11, 'public/uploads/product/1706963304-5.webp', 6, '2024-02-03 12:28:24', '2024-02-03 12:28:24'),
(13, 'public/uploads/product/1706963666-968d4e20278e2db6759a2d2a44231f4c.jpg_750x750.jpg_.webp', 7, '2024-02-03 12:34:26', '2024-02-03 12:34:26'),
(15, 'public/uploads/product/1706963947-7.webp', 9, '2024-02-03 12:39:07', '2024-02-03 12:39:07'),
(16, 'public/uploads/product/1706964217-6.webp', 8, '2024-02-03 12:43:37', '2024-02-03 12:43:37'),
(17, 'public/uploads/product/1706964324-8.webp', 10, '2024-02-03 12:45:24', '2024-02-03 12:45:24'),
(18, 'public/uploads/product/1706964552-9.webp', 11, '2024-02-03 12:49:12', '2024-02-03 12:49:12'),
(19, 'public/uploads/product/1706964708-10.webp', 12, '2024-02-03 12:51:48', '2024-02-03 12:51:48'),
(20, 'public/uploads/product/1706965822-11.webp', 13, '2024-02-03 13:10:22', '2024-02-03 13:10:22'),
(21, 'public/uploads/product/1706966045-12.webp', 14, '2024-02-03 13:14:05', '2024-02-03 13:14:05'),
(22, 'public/uploads/product/1707038734-13.webp', 15, '2024-02-04 09:25:34', '2024-02-04 09:25:34'),
(23, 'public/uploads/product/1707039090-15.webp', 16, '2024-02-04 09:31:30', '2024-02-04 09:31:30'),
(24, 'public/uploads/product/1707039226-16.webp', 17, '2024-02-04 09:33:46', '2024-02-04 09:33:46'),
(25, 'public/uploads/product/1707039619-17.webp', 18, '2024-02-04 09:40:19', '2024-02-04 09:40:19'),
(26, 'public/uploads/product/1707039878-18.webp', 19, '2024-02-04 09:44:38', '2024-02-04 09:44:38'),
(27, 'public/uploads/product/1707040029-19.webp', 20, '2024-02-04 09:47:09', '2024-02-04 09:47:09'),
(28, 'public/uploads/product/1707040152-20.webp', 21, '2024-02-04 09:49:12', '2024-02-04 09:49:12'),
(29, 'public/uploads/product/1707040552-21.webp', 22, '2024-02-04 09:55:52', '2024-02-04 09:55:52'),
(30, 'public/uploads/product/1707040912-22.webp', 23, '2024-02-04 10:01:52', '2024-02-04 10:01:52'),
(31, 'public/uploads/product/1707041003-23.webp', 24, '2024-02-04 10:03:23', '2024-02-04 10:03:23'),
(32, 'public/uploads/product/1707041229-24.webp', 25, '2024-02-04 10:07:09', '2024-02-04 10:07:09'),
(33, 'public/uploads/product/1707041724-25.webp', 26, '2024-02-04 10:15:24', '2024-02-04 10:15:24'),
(34, 'public/uploads/product/1707041854-26.webp', 27, '2024-02-04 10:17:34', '2024-02-04 10:17:34'),
(35, 'public/uploads/product/1707042066-27.webp', 28, '2024-02-04 10:21:06', '2024-02-04 10:21:06'),
(36, 'public/uploads/product/1707042304-28.webp', 29, '2024-02-04 10:25:04', '2024-02-04 10:25:04'),
(37, 'public/uploads/product/1707042443-29.webp', 30, '2024-02-04 10:27:23', '2024-02-04 10:27:23'),
(38, 'public/uploads/product/1707042740-30.webp', 31, '2024-02-04 10:32:20', '2024-02-04 10:32:20'),
(39, 'public/uploads/product/1707042930-31.webp', 32, '2024-02-04 10:35:30', '2024-02-04 10:35:30'),
(40, 'public/uploads/product/1707043100-32.webp', 33, '2024-02-04 10:38:20', '2024-02-04 10:38:20'),
(41, 'public/uploads/product/1707043310-33.webp', 34, '2024-02-04 10:41:50', '2024-02-04 10:41:50'),
(42, 'public/uploads/product/1707044037-34.webp', 35, '2024-02-04 10:53:57', '2024-02-04 10:53:57'),
(43, 'public/uploads/product/1707044326-35.webp', 36, '2024-02-04 10:58:46', '2024-02-04 10:58:46'),
(44, 'public/uploads/product/1707044444-36.webp', 37, '2024-02-04 11:00:44', '2024-02-04 11:00:44'),
(45, 'public/uploads/product/1707045047-38.webp', 38, '2024-02-04 11:10:47', '2024-02-04 11:10:47'),
(46, 'public/uploads/product/1707045273-39.webp', 39, '2024-02-04 11:14:33', '2024-02-04 11:14:33'),
(47, 'public/uploads/product/1707045380-40.webp', 40, '2024-02-04 11:16:20', '2024-02-04 11:16:20'),
(48, 'public/uploads/product/1707045468-41.webp', 41, '2024-02-04 11:17:48', '2024-02-04 11:17:48'),
(49, 'public/uploads/product/1707045572-42.webp', 42, '2024-02-04 11:19:32', '2024-02-04 11:19:32'),
(50, 'public/uploads/product/1707045885-43.webp', 43, '2024-02-04 11:24:45', '2024-02-04 11:24:45'),
(51, 'public/uploads/product/1707046613-44.webp', 44, '2024-02-04 11:36:53', '2024-02-04 11:36:53'),
(52, 'public/uploads/product/1707046712-45.webp', 45, '2024-02-04 11:38:32', '2024-02-04 11:38:32'),
(54, 'public/uploads/product/1707046820-46.webp', 46, '2024-02-04 11:40:20', '2024-02-04 11:40:20'),
(55, 'public/uploads/product/1707047083-47.webp', 47, '2024-02-04 11:44:43', '2024-02-04 11:44:43'),
(56, 'public/uploads/product/1707047786-48.webp', 48, '2024-02-04 11:56:26', '2024-02-04 11:56:26'),
(57, 'public/uploads/product/1707048052-49.webp', 49, '2024-02-04 12:00:52', '2024-02-04 12:00:52'),
(58, 'public/uploads/product/1707048207-50.webp', 50, '2024-02-04 12:03:27', '2024-02-04 12:03:27'),
(59, 'public/uploads/product/1707048433-51.webp', 51, '2024-02-04 12:07:13', '2024-02-04 12:07:13'),
(60, 'public/uploads/product/1707048546-52.webp', 52, '2024-02-04 12:09:06', '2024-02-04 12:09:06'),
(61, 'public/uploads/product/1707049682-53.webp', 53, '2024-02-04 12:28:02', '2024-02-04 12:28:02'),
(62, 'public/uploads/product/1707049786-54.webp', 54, '2024-02-04 12:29:46', '2024-02-04 12:29:46'),
(63, 'public/uploads/product/1707049880-55.webp', 55, '2024-02-04 12:31:20', '2024-02-04 12:31:20'),
(64, 'public/uploads/product/1707050041-56.webp', 56, '2024-02-04 12:34:01', '2024-02-04 12:34:01'),
(65, 'public/uploads/product/1707050315-57.webp', 57, '2024-02-04 12:38:35', '2024-02-04 12:38:35'),
(66, 'public/uploads/product/1707050396-58.webp', 58, '2024-02-04 12:39:56', '2024-02-04 12:39:56'),
(67, 'public/uploads/product/1707051081-59.webp', 59, '2024-02-04 12:51:21', '2024-02-04 12:51:21'),
(68, 'public/uploads/product/1707051138-60.webp', 60, '2024-02-04 12:52:18', '2024-02-04 12:52:18'),
(69, 'public/uploads/product/1707051335-61.webp', 61, '2024-02-04 12:55:35', '2024-02-04 12:55:35'),
(70, 'public/uploads/product/1707051439-2600.webp', 62, '2024-02-04 12:57:19', '2024-02-04 12:57:19'),
(71, 'public/uploads/product/1707051518-62.webp', 63, '2024-02-04 12:58:38', '2024-02-04 12:58:38'),
(72, 'public/uploads/product/1707051601-2600.webp', 64, '2024-02-04 13:00:01', '2024-02-04 13:00:01'),
(73, 'public/uploads/product/1707051745-64.webp', 65, '2024-02-04 13:02:25', '2024-02-04 13:02:25'),
(74, 'public/uploads/product/1707051825-65.webp', 66, '2024-02-04 13:03:45', '2024-02-04 13:03:45'),
(75, 'public/uploads/product/1707051903-66.webp', 67, '2024-02-04 13:05:03', '2024-02-04 13:05:03'),
(76, 'public/uploads/product/1707052031-67.webp', 68, '2024-02-04 13:07:11', '2024-02-04 13:07:11'),
(77, 'public/uploads/product/1707052255-68.webp', 69, '2024-02-04 13:10:55', '2024-02-04 13:10:55'),
(78, 'public/uploads/product/1707052394-69.webp', 70, '2024-02-04 13:13:14', '2024-02-04 13:13:14'),
(79, 'public/uploads/product/1707052463-70.webp', 71, '2024-02-04 13:14:23', '2024-02-04 13:14:23'),
(80, 'public/uploads/product/1707052527-71.webp', 72, '2024-02-04 13:15:27', '2024-02-04 13:15:27'),
(81, 'public/uploads/product/1707121724-d6569c95ead8324c63ae8bedbf74482e.jpg_750x750.jpg_.webp', 73, '2024-02-05 08:28:44', '2024-02-05 08:28:44'),
(82, 'public/uploads/product/1707121894-2d5383f5aa9746aa1137749da10c6264.jpg_750x750.jpg_.webp', 74, '2024-02-05 08:31:34', '2024-02-05 08:31:34'),
(83, 'public/uploads/product/1707122306-25266ca63761fc3f5059ab87a0d0310b.jpg_750x750.jpg_.webp', 75, '2024-02-05 08:38:26', '2024-02-05 08:38:26'),
(84, 'public/uploads/product/1707122812-a10cb862f1da4a430e8fbc8769ce69b3.jpg_750x750.jpg_.webp', 76, '2024-02-05 08:46:52', '2024-02-05 08:46:52'),
(85, 'public/uploads/product/1707122812-27955ce3c5c10b44c501b03e125e3c82.jpg_100x100.jpg_.webp', 76, '2024-02-05 08:46:52', '2024-02-05 08:46:52'),
(86, 'public/uploads/product/1707123191-51ba6689f5e3c9b392f7d131c6d7d702.jpg_750x750.jpg_.webp', 77, '2024-02-05 08:53:11', '2024-02-05 08:53:11'),
(87, 'public/uploads/product/1707123566-29761a41e32e3962864f83dfe825edea.jpg_750x750.jpg_.webp', 78, '2024-02-05 08:59:26', '2024-02-05 08:59:26'),
(88, 'public/uploads/product/1707123836-e519b1103c328de72f70335f758cc7cd.jpg_750x750.jpg_.webp', 79, '2024-02-05 09:03:56', '2024-02-05 09:03:56'),
(89, 'public/uploads/product/1707125239-b999bd7cd26d3238698ee071a6e64e40.jpg_750x750.jpg_.webp', 80, '2024-02-05 09:27:19', '2024-02-05 09:27:19'),
(90, 'public/uploads/product/1707126177-3fc61e6a6dda2bb78245b5573e1d1562.jpg_750x750.jpg_.webp', 81, '2024-02-05 09:42:57', '2024-02-05 09:42:57'),
(91, 'public/uploads/product/1707126250-cff152bdb02947791234e7f71346bf57.jpg_750x750.jpg_.webp', 82, '2024-02-05 09:44:10', '2024-02-05 09:44:10'),
(92, 'public/uploads/product/1707126327-d4fe1c51cab0d824c68a3c46d702e571.jpg_750x750.jpg_.webp', 83, '2024-02-05 09:45:27', '2024-02-05 09:45:27'),
(93, 'public/uploads/product/1707126418-05b0495ff024378b04e4a22aecb8f43c.jpg_750x750.jpg_.webp', 84, '2024-02-05 09:46:58', '2024-02-05 09:46:58'),
(94, 'public/uploads/product/1707126922-1.webp', 85, '2024-02-05 09:55:22', '2024-02-05 09:55:22'),
(95, 'public/uploads/product/1707126922-2.webp', 85, '2024-02-05 09:55:22', '2024-02-05 09:55:22'),
(96, 'public/uploads/product/1707127008-3.webp', 86, '2024-02-05 09:56:48', '2024-02-05 09:56:48'),
(97, 'public/uploads/product/1707127008-4.webp', 86, '2024-02-05 09:56:48', '2024-02-05 09:56:48'),
(98, 'public/uploads/product/1707127090-6.webp', 87, '2024-02-05 09:58:10', '2024-02-05 09:58:10'),
(99, 'public/uploads/product/1707127090-5.webp', 87, '2024-02-05 09:58:10', '2024-02-05 09:58:10'),
(100, 'public/uploads/product/1707127168-7.webp', 88, '2024-02-05 09:59:28', '2024-02-05 09:59:28'),
(102, 'public/uploads/product/1707127293-9.webp', 89, '2024-02-05 10:01:33', '2024-02-05 10:01:33'),
(103, 'public/uploads/product/1707127293-8.webp', 89, '2024-02-05 10:01:33', '2024-02-05 10:01:33'),
(104, 'public/uploads/product/1707127376-10.webp', 90, '2024-02-05 10:02:56', '2024-02-05 10:02:56'),
(105, 'public/uploads/product/1707127376-11.webp', 90, '2024-02-05 10:02:56', '2024-02-05 10:02:56'),
(106, 'public/uploads/product/1707127468-12.webp', 91, '2024-02-05 10:04:28', '2024-02-05 10:04:28'),
(107, 'public/uploads/product/1707127468-13.webp', 91, '2024-02-05 10:04:28', '2024-02-05 10:04:28'),
(108, 'public/uploads/product/1707127637-14.webp', 92, '2024-02-05 10:07:17', '2024-02-05 10:07:17'),
(109, 'public/uploads/product/1707127637-15.webp', 92, '2024-02-05 10:07:17', '2024-02-05 10:07:17'),
(110, 'public/uploads/product/1707128083-17.webp', 93, '2024-02-05 10:14:43', '2024-02-05 10:14:43'),
(111, 'public/uploads/product/1707128083-16.webp', 93, '2024-02-05 10:14:43', '2024-02-05 10:14:43'),
(112, 'public/uploads/product/1707128240-18.webp', 94, '2024-02-05 10:17:20', '2024-02-05 10:17:20'),
(113, 'public/uploads/product/1707128311-20.webp', 95, '2024-02-05 10:18:31', '2024-02-05 10:18:31'),
(114, 'public/uploads/product/1707128450-21.webp', 96, '2024-02-05 10:20:50', '2024-02-05 10:20:50'),
(115, 'public/uploads/product/1707128450-22.webp', 96, '2024-02-05 10:20:50', '2024-02-05 10:20:50'),
(116, 'public/uploads/product/1707129607-23.webp', 97, '2024-02-05 10:40:07', '2024-02-05 10:40:07'),
(117, 'public/uploads/product/1707129715-24.webp', 98, '2024-02-05 10:41:55', '2024-02-05 10:41:55'),
(118, 'public/uploads/product/1707129715-25.webp', 98, '2024-02-05 10:41:55', '2024-02-05 10:41:55'),
(119, 'public/uploads/product/1707129849-27.webp', 99, '2024-02-05 10:44:09', '2024-02-05 10:44:09'),
(120, 'public/uploads/product/1707129849-26.webp', 99, '2024-02-05 10:44:09', '2024-02-05 10:44:09'),
(121, 'public/uploads/product/1707129943-28.webp', 100, '2024-02-05 10:45:43', '2024-02-05 10:45:43'),
(122, 'public/uploads/product/1707130323-29.webp', 101, '2024-02-05 10:52:03', '2024-02-05 10:52:03'),
(123, 'public/uploads/product/1707130323-30.webp', 101, '2024-02-05 10:52:03', '2024-02-05 10:52:03'),
(124, 'public/uploads/product/1707130655-32.webp', 102, '2024-02-05 10:57:35', '2024-02-05 10:57:35'),
(125, 'public/uploads/product/1707130655-31.webp', 102, '2024-02-05 10:57:35', '2024-02-05 10:57:35'),
(126, 'public/uploads/product/1707130655-30.webp', 102, '2024-02-05 10:57:35', '2024-02-05 10:57:35'),
(129, 'public/uploads/product/1707130828-33.webp', 103, '2024-02-05 11:00:28', '2024-02-05 11:00:28'),
(130, 'public/uploads/product/1707130918-35.webp', 104, '2024-02-05 11:01:58', '2024-02-05 11:01:58'),
(131, 'public/uploads/product/1707130918-36.webp', 104, '2024-02-05 11:01:58', '2024-02-05 11:01:58'),
(132, 'public/uploads/product/1707130970-37.webp', 105, '2024-02-05 11:02:50', '2024-02-05 11:02:50'),
(133, 'public/uploads/product/1707131067-40.webp', 106, '2024-02-05 11:04:27', '2024-02-05 11:04:27'),
(134, 'public/uploads/product/1707131067-41.webp', 106, '2024-02-05 11:04:27', '2024-02-05 11:04:27'),
(135, 'public/uploads/product/1707131163-43.webp', 107, '2024-02-05 11:06:03', '2024-02-05 11:06:03'),
(136, 'public/uploads/product/1707131163-44.webp', 107, '2024-02-05 11:06:03', '2024-02-05 11:06:03'),
(137, 'public/uploads/product/1707131163-42.webp', 107, '2024-02-05 11:06:03', '2024-02-05 11:06:03'),
(138, 'public/uploads/product/1707131330-46.webp', 108, '2024-02-05 11:08:50', '2024-02-05 11:08:50'),
(139, 'public/uploads/product/1707131330-45.webp', 108, '2024-02-05 11:08:50', '2024-02-05 11:08:50'),
(140, 'public/uploads/product/1707131417-47.webp', 109, '2024-02-05 11:10:17', '2024-02-05 11:10:17'),
(141, 'public/uploads/product/1707131417-48.webp', 109, '2024-02-05 11:10:17', '2024-02-05 11:10:17'),
(142, 'public/uploads/product/1707131602-49.webp', 110, '2024-02-05 11:13:22', '2024-02-05 11:13:22'),
(143, 'public/uploads/product/1707131817-51.webp', 111, '2024-02-05 11:16:57', '2024-02-05 11:16:57'),
(144, 'public/uploads/product/1707131817-50.webp', 111, '2024-02-05 11:16:57', '2024-02-05 11:16:57'),
(145, 'public/uploads/product/1707131989-52.webp', 112, '2024-02-05 11:19:49', '2024-02-05 11:19:49'),
(146, 'public/uploads/product/1707132059-53.webp', 113, '2024-02-05 11:20:59', '2024-02-05 11:20:59'),
(147, 'public/uploads/product/1707132129-54.webp', 114, '2024-02-05 11:22:09', '2024-02-05 11:22:09'),
(148, 'public/uploads/product/1707132190-55.webp', 115, '2024-02-05 11:23:10', '2024-02-05 11:23:10'),
(149, 'public/uploads/product/1707132238-56.webp', 116, '2024-02-05 11:23:58', '2024-02-05 11:23:58'),
(150, 'public/uploads/product/1707132375-57.webp', 117, '2024-02-05 11:26:15', '2024-02-05 11:26:15'),
(151, 'public/uploads/product/1707132432-58.webp', 118, '2024-02-05 11:27:12', '2024-02-05 11:27:12'),
(152, 'public/uploads/product/1707132490-56.webp', 119, '2024-02-05 11:28:10', '2024-02-05 11:28:10'),
(153, 'public/uploads/product/1707132556-59.webp', 120, '2024-02-05 11:29:16', '2024-02-05 11:29:16'),
(154, 'public/uploads/product/1707132653-60.webp', 121, '2024-02-05 11:30:53', '2024-02-05 11:30:53'),
(155, 'public/uploads/product/1707132761-61.webp', 122, '2024-02-05 11:32:41', '2024-02-05 11:32:41'),
(156, 'public/uploads/product/1707132761-62.webp', 122, '2024-02-05 11:32:41', '2024-02-05 11:32:41'),
(157, 'public/uploads/product/1707132761-63.webp', 122, '2024-02-05 11:32:41', '2024-02-05 11:32:41'),
(158, 'public/uploads/product/1707133147-65.webp', 123, '2024-02-05 11:39:07', '2024-02-05 11:39:07'),
(159, 'public/uploads/product/1707133147-64.webp', 123, '2024-02-05 11:39:07', '2024-02-05 11:39:07'),
(160, 'public/uploads/product/1707138026-30.webp', 124, '2024-02-05 13:00:26', '2024-02-05 13:00:26'),
(161, 'public/uploads/product/1707138026-31.webp', 124, '2024-02-05 13:00:26', '2024-02-05 13:00:26'),
(162, 'public/uploads/product/1707138126-32.webp', 125, '2024-02-05 13:02:06', '2024-02-05 13:02:06'),
(163, 'public/uploads/product/1707138126-33.webp', 125, '2024-02-05 13:02:06', '2024-02-05 13:02:06'),
(164, 'public/uploads/product/1707138242-34.webp', 126, '2024-02-05 13:04:02', '2024-02-05 13:04:02'),
(165, 'public/uploads/product/1707138242-35.webp', 126, '2024-02-05 13:04:02', '2024-02-05 13:04:02'),
(166, 'public/uploads/product/1707138312-36.webp', 127, '2024-02-05 13:05:12', '2024-02-05 13:05:12'),
(167, 'public/uploads/product/1707138402-37.webp', 128, '2024-02-05 13:06:42', '2024-02-05 13:06:42'),
(168, 'public/uploads/product/1707138541-38.webp', 129, '2024-02-05 13:09:01', '2024-02-05 13:09:01'),
(169, 'public/uploads/product/1707138541-39.webp', 129, '2024-02-05 13:09:01', '2024-02-05 13:09:01'),
(170, 'public/uploads/product/1707138666-40.webp', 130, '2024-02-05 13:11:06', '2024-02-05 13:11:06'),
(171, 'public/uploads/product/1707138666-41.webp', 130, '2024-02-05 13:11:06', '2024-02-05 13:11:06'),
(172, 'public/uploads/product/1707138666-42.webp', 130, '2024-02-05 13:11:06', '2024-02-05 13:11:06'),
(173, 'public/uploads/product/1709230194-9b42afe8-c27f-421c-9700-0629f4eaded9.jpg', 131, '2024-03-01 00:09:54', '2024-03-01 00:09:54'),
(174, 'public/uploads/product/1709230194-ada5b601-ea98-4b23-b700-ed548178d053.jpg', 131, '2024-03-01 00:09:54', '2024-03-01 00:09:54'),
(175, 'public/uploads/product/1709230194-16f00008-489a-4a9e-bb1f-cf520def58f7.jpg', 131, '2024-03-01 00:09:54', '2024-03-01 00:09:54'),
(176, 'public/uploads/product/1709230194-e346f2e6-6562-4c6b-b78f-8f550b30978b.jpg', 131, '2024-03-01 00:09:54', '2024-03-01 00:09:54'),
(178, 'public/uploads/product/1717143634-augrbeuws7mbzzznhqeh6426dgmvdubx8nh8kbfo.jpg', 132, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(179, 'public/uploads/product/1717143634-xdgl4vbpzjpyedh8ki8nfienjgq0mtjzvslpiy8b.jpg', 132, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(180, 'public/uploads/product/1717143634-unjqq3ctt8zoun2mxd7axkc4ekjktkxtmxvpsqkh.jpg', 132, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(181, 'public/uploads/product/1717143634-o8b7nks7yjpfxeak1dyq2etsxvp0xbs5ssktv4om.jpg', 132, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(182, 'public/uploads/product/1717143634-yacjpxkyyguzyflbzhzcy8asjqymyeown2kn9dfy.jpg', 132, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(183, 'public/uploads/product/1717143634-wwsw5lgvpkmbkqlnb2djmoby6lywvrr7c0wo2vb5.jpg', 132, '2024-05-31 14:20:34', '2024-05-31 14:20:34'),
(184, 'public/uploads/product/1717144826-mupn63ybrq0wqdxk4hwfasinrc6kdbbwn8ezmxhi.webp', 133, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(185, 'public/uploads/product/1717145111-0vcrati9i3yk88re1bze6cfo9eu5fanjnzrrl9nc.jpg', 134, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(186, 'public/uploads/product/1717145111-tu9rmqxguc1gcaehosss7ozdyvyhbhiylloe2opf.jpg', 134, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(187, 'public/uploads/product/1717145111-5xik6q1tuk60ffi7ao1mahfseyswofhkapwztfn9.webp', 134, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(188, 'public/uploads/product/1717145111-buciivdqytpvh6mbvtsmayw1prpmism78o3grfx7.jpg', 134, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(189, 'public/uploads/product/1717145111-s5youdbdcy7j2dde1mfdyrokees8vxc37kwvuech.jpg', 134, '2024-05-31 14:45:11', '2024-05-31 14:45:11'),
(190, 'public/uploads/product/1717145265-qprvisrlm0b217fp0wgalukpilbm200rw5lfwazd.jpg', 135, '2024-05-31 14:47:45', '2024-05-31 14:47:45'),
(191, 'public/uploads/product/1717145442-hinhzbakb2hrupbr97iacj485bribzcqkqg43jft.jpg', 136, '2024-05-31 14:50:42', '2024-05-31 14:50:42'),
(192, 'public/uploads/product/1717145718-xtg8zlwbyizvd9ontjm26n3ytzogqh3t04s04bms.webp', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(193, 'public/uploads/product/1717145718-h6kt4q5uiv4szh9gfc8xm645nyt1lz6au717r6wp.webp', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(194, 'public/uploads/product/1717145718-rfu8p2yly2bsiuogqvxc6aorjsbgvy5wcok6wuib.jpg', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(195, 'public/uploads/product/1717145718-xtg8zlwbyizvd9ontjm26n3ytzogqh3t04s04bms.webp', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(196, 'public/uploads/product/1717145718-zhtnqlutu1anf3vip00txwdtpvbvqs7lwx7hftmv.jpg', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(197, 'public/uploads/product/1717145718-xorysftrxqcpgnfyk35b1zersezacyylrahac9im.jpg', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(198, 'public/uploads/product/1717145718-rfu8p2yly2bsiuogqvxc6aorjsbgvy5wcok6wuib.jpg', 137, '2024-05-31 14:55:18', '2024-05-31 14:55:18'),
(199, 'public/uploads/product/1719154173-623a232298259_800x800.jpg', 138, '2024-06-23 14:49:33', '2024-06-23 14:49:33'),
(200, 'public/uploads/product/1719301202-64fc1dd61301c_800x800.jpg', 139, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(201, 'public/uploads/product/1719301202-64fc1dd62ece3_800x800.jpg', 139, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(202, 'public/uploads/product/1719301736-64fc1e5b03d2c_800x800.jpg', 140, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(203, 'public/uploads/product/1719301736-64fc1e5ad36c4_800x800.jpg', 140, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(204, 'public/uploads/product/1719302457-62023d2973570_800x800.jpg', 141, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(205, 'public/uploads/product/1719304902-juhor-120gb-ssd-.jpg', 142, '2024-06-25 08:41:42', '2024-06-25 08:41:42'),
(206, 'public/uploads/product/1719471346-622132aba8a87_180x180.jpg', 143, '2024-06-27 06:55:46', '2024-06-27 06:55:46'),
(207, 'public/uploads/product/1719471432-62024116873f4_180x180.jpg', 144, '2024-06-27 06:57:12', '2024-06-27 06:57:12'),
(208, 'public/uploads/product/1719471544-62023db59b26c_180x180.jpg', 145, '2024-06-27 06:59:04', '2024-06-27 06:59:04'),
(209, 'public/uploads/product/1719471691-6200d104ea168_180x180.jpg', 146, '2024-06-27 07:01:31', '2024-06-27 07:01:31'),
(210, 'public/uploads/product/1719472418-6200c175130ca_180x180.jpg', 147, '2024-06-27 07:13:38', '2024-06-27 07:13:38'),
(211, 'public/uploads/product/1719472759-6200c20f4299e_180x180.jpg', 148, '2024-06-27 07:19:19', '2024-06-27 07:19:19'),
(212, 'public/uploads/product/1733201459-images-(3).jpeg', 149, '2024-12-03 04:50:59', '2024-12-03 04:50:59'),
(213, 'public/uploads/product/1733650743-screenshot_10.png', 150, '2024-12-08 09:39:03', '2024-12-08 09:39:03'),
(214, 'public/uploads/product/1755637534-cbl-03-768x768-1.webp', 152, '2025-08-19 21:05:34', '2025-08-19 21:05:34'),
(215, 'public/uploads/product/1755681748-shirt-5-1-768x768-1-1.webp', 153, '2025-08-20 09:22:28', '2025-08-20 09:22:28'),
(216, 'public/uploads/product/1755681846-shirt-5-1-768x768-1.webp', 154, '2025-08-20 09:24:06', '2025-08-20 09:24:06'),
(217, 'public/uploads/product/1755681877-shirt-3-768x768-1.webp', 155, '2025-08-20 09:24:37', '2025-08-20 09:24:37'),
(218, 'public/uploads/product/1755681995-shirt-4-768x768-1.webp', 156, '2025-08-20 09:26:35', '2025-08-20 09:26:35'),
(251, 'public/uploads/product/1756106432-b8fcb825-b09b-4463-9253-1299061ccc7b.jpg', 172, '2025-08-25 07:20:32', '2025-08-25 07:20:32'),
(252, 'public/uploads/product/1756107162-img_8399-(1).jpg', 173, '2025-08-25 07:32:42', '2025-08-25 07:32:42'),
(253, 'public/uploads/product/1756109781-img_8421.jpg', 174, '2025-08-25 08:16:21', '2025-08-25 08:16:21'),
(254, 'public/uploads/product/1756114189-blue-and-grey-photo-collage-fashion-sale-instagram-story-(2).jpg', 172, '2025-08-25 09:29:49', '2025-08-25 09:29:49'),
(255, 'public/uploads/product/1756119139-5.jpg', 157, '2025-08-25 10:52:19', '2025-08-25 10:52:19'),
(256, 'public/uploads/product/1756119180-4.jpg', 159, '2025-08-25 10:53:00', '2025-08-25 10:53:00'),
(257, 'public/uploads/product/1756119243-6.jpg', 158, '2025-08-25 10:54:03', '2025-08-25 10:54:03'),
(258, 'public/uploads/product/1756119348-6.jpg', 160, '2025-08-25 10:55:48', '2025-08-25 10:55:48'),
(259, 'public/uploads/product/1756119363-5.jpg', 161, '2025-08-25 10:56:03', '2025-08-25 10:56:03'),
(260, 'public/uploads/product/1756119387-4.jpg', 162, '2025-08-25 10:56:27', '2025-08-25 10:56:27'),
(261, 'public/uploads/product/1756119495-8e168973-8a6b-4cb4-9e01-7eb48d21f6ec.jpg', 163, '2025-08-25 10:58:15', '2025-08-25 10:58:15'),
(262, 'public/uploads/product/1756119513-ash-colour.jpg', 164, '2025-08-25 10:58:33', '2025-08-25 10:58:33'),
(263, 'public/uploads/product/1756119530-nay-blue.jpg', 165, '2025-08-25 10:58:50', '2025-08-25 10:58:50'),
(264, 'public/uploads/product/1756119645-1.jfif', 166, '2025-08-25 11:00:45', '2025-08-25 11:00:45'),
(265, 'public/uploads/product/1756119683-2.jfif', 167, '2025-08-25 11:01:23', '2025-08-25 11:01:23'),
(266, 'public/uploads/product/1756119717-02...jpg', 168, '2025-08-25 11:01:57', '2025-08-25 11:01:57'),
(267, 'public/uploads/product/1756119739-531547342_1292562538881243_5386757069606514518_n.jpg', 168, '2025-08-25 11:02:19', '2025-08-25 11:02:19'),
(268, 'public/uploads/product/1756119948-e1f5d133-9f66-46d3-afdf-34b6250f2583.jpg', 169, '2025-08-25 11:05:48', '2025-08-25 11:05:48'),
(269, 'public/uploads/product/1756119963-df9a275b-3b24-46ce-b47c-dcbf0487fae9.jpg', 170, '2025-08-25 11:06:03', '2025-08-25 11:06:03'),
(270, 'public/uploads/product/1756119977-screenshot_6.png', 171, '2025-08-25 11:06:17', '2025-08-25 11:06:17'),
(271, 'public/uploads/product/1756120071-3.jpg', 175, '2025-08-25 11:07:51', '2025-08-25 11:07:51'),
(272, 'public/uploads/product/1756120086-436508144_122147824202195894_6172205608876444983_n.jpg', 176, '2025-08-25 11:08:06', '2025-08-25 11:08:06'),
(273, 'public/uploads/product/1756120104-1.jpg', 177, '2025-08-25 11:08:24', '2025-08-25 11:08:24'),
(274, 'public/uploads/product/1756120119-7.jpg', 178, '2025-08-25 11:08:39', '2025-08-25 11:08:39'),
(275, 'public/uploads/product/1756120222-2.jpg', 179, '2025-08-25 11:10:22', '2025-08-25 11:10:22'),
(276, 'public/uploads/product/1756120236-511faa9d-ec47-4caf-a1a7-8602ab1cf01b.jfif', 180, '2025-08-25 11:10:36', '2025-08-25 11:10:36'),
(277, 'public/uploads/product/1756120248-1.jpg', 181, '2025-08-25 11:10:48', '2025-08-25 11:10:48'),
(278, 'public/uploads/product/1756120259-3b43032c-809e-4062-b169-faf517a0969e.jfif', 182, '2025-08-25 11:10:59', '2025-08-25 11:10:59'),
(279, 'public/uploads/product/1756120338-2d844106-9347-4ed1-8ddd-b7754dfb60b1.jfif', 183, '2025-08-25 11:12:18', '2025-08-25 11:12:18'),
(280, 'public/uploads/product/1756120351-caa65251-db5d-4615-bc53-79d974c6786e.jfif', 184, '2025-08-25 11:12:31', '2025-08-25 11:12:31'),
(281, 'public/uploads/product/1756120357-df608e87-b1b7-484f-b9a2-b43c5e7727ed.jfif', 185, '2025-08-25 11:12:37', '2025-08-25 11:12:37'),
(282, 'public/uploads/product/1756120366-6b51b84b-aae0-49fa-b89e-fc7cab976a18.jfif', 186, '2025-08-25 11:12:46', '2025-08-25 11:12:46'),
(283, 'public/uploads/product/1756120566-2.jpg', 187, '2025-08-25 11:16:06', '2025-08-25 11:16:06'),
(284, 'public/uploads/product/1756120579-3.jpg', 188, '2025-08-25 11:16:19', '2025-08-25 11:16:19'),
(285, 'public/uploads/product/1756120611-1.jpg', 190, '2025-08-25 11:16:51', '2025-08-25 11:16:51'),
(286, 'public/uploads/product/1756750860-1.jfif', 174, '2025-09-01 18:21:00', '2025-09-01 18:21:00'),
(287, 'public/uploads/product/1756750885-img_8408.jpg', 173, '2025-09-01 18:21:25', '2025-09-01 18:21:25'),
(288, 'public/uploads/product/1758960944-b519c190-d411-4096-b1ea-4600cbacedbd.jfif', 194, '2025-09-27 08:15:44', '2025-09-27 08:15:44'),
(290, 'public/uploads/product/1758961119-554086008_796939929926064_910831934198747082_n.jpg', 192, '2025-09-27 08:18:39', '2025-09-27 08:18:39'),
(291, 'public/uploads/product/1758961144-c17fef0f-48df-452b-a9bd-e62d81638601.jfif', 193, '2025-09-27 08:19:04', '2025-09-27 08:19:04'),
(292, 'public/uploads/product/1758961156-3d12ea38-8c22-4245-a7eb-6277b30a163d.jpg', 191, '2025-09-27 08:19:16', '2025-09-27 08:19:16'),
(293, 'public/uploads/product/1759111030-arza-export-logo-design.png', 195, '2025-09-29 01:57:10', '2025-09-29 01:57:10'),
(295, 'public/uploads/product/1759111571-arza-export-logo-design.png', 197, '2025-09-29 02:06:11', '2025-09-29 02:06:11'),
(296, 'public/uploads/product/1759111688-arza-export-logo-design.png', 198, '2025-09-29 02:08:08', '2025-09-29 02:08:08'),
(297, 'public/uploads/product/1759111853-arza-export-logo-design.png', 199, '2025-09-29 02:10:53', '2025-09-29 02:10:53'),
(299, 'public/uploads/product/1759115683-screenshot_51.png', 194, '2025-09-29 03:14:43', '2025-09-29 03:14:43'),
(300, 'public/uploads/product/1759117952-white-and-green-simple-wedding-photo-collage.png', 196, '2025-09-29 03:52:32', '2025-09-29 03:52:32'),
(301, 'public/uploads/product/1759270583-screenshot_9.png', 200, '2025-09-30 22:16:23', '2025-09-30 22:16:23'),
(302, 'public/uploads/product/1759270673-557749869_122283102416008238_9204257245368823435_n.jpg', 201, '2025-09-30 22:17:53', '2025-09-30 22:17:53'),
(303, 'public/uploads/product/1759270730-1731321495.jpeg', 201, '2025-09-30 22:18:50', '2025-09-30 22:18:50'),
(304, 'public/uploads/product/1759270739-1731321472.jpeg', 200, '2025-09-30 22:18:59', '2025-09-30 22:18:59'),
(305, 'public/uploads/product/1759271214-1731321581.jpeg', 202, '2025-09-30 22:26:54', '2025-09-30 22:26:54'),
(306, 'public/uploads/product/1759300113-05bc19b2-1dcd-4d5b-9589-5b844996f112.jfif', 202, '2025-10-01 06:28:33', '2025-10-01 06:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `childcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `product_code` varchar(155) DEFAULT NULL,
  `purchase_price` int(11) DEFAULT 0,
  `old_price` int(11) DEFAULT NULL,
  `new_price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `pro_unit` varchar(191) DEFAULT NULL,
  `pro_video` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `topsale` tinyint(4) DEFAULT NULL,
  `feature_product` tinyint(4) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `product_code`, `purchase_price`, `old_price`, `new_price`, `stock`, `pro_unit`, `pro_video`, `description`, `meta_description`, `topsale`, `feature_product`, `campaign_id`, `status`, `created_at`, `updated_at`) VALUES
(157, 'JOG01 Black Wash', 'jog01-black-wash-188', 15, 0, NULL, NULL, 'P0157', 375, 890, 750, 20, NULL, 'https://www.facebook.com/Arzamart/videos/698117278933361/', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Product code : JOG01\r\nColor : Black Wash\r\nFabric : Knit Denim , 11.5 Ounce\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n<br></span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 19:37:25', '2025-09-04 18:11:01'),
(158, 'JOG01 Light Blue Wash', 'jog01-light-blue-wash-190', 15, NULL, NULL, NULL, 'P0158', 375, 890, 750, 20, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Product code : JOG01\r\nColor : Light Blue Wash\r\nFabric : Knit Denim , 11.5 Ounce\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-08-24 19:38:37', '2025-09-18 21:35:26'),
(159, 'JOG01 Deep Blue Wash', 'jog01-deep-blue-wash-188', 15, 0, NULL, NULL, 'P0159', 375, 890, 750, 20, NULL, 'https://www.facebook.com/Arzamart/videos/698117278933361/', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Product code : JOG01\r\nColor : Deep Blue Wash\r\nFabric : Knit Denim , 11.5 Ounce\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-08-24 19:39:36', '2025-09-04 18:11:01'),
(160, 'JOG02 Black Wash', 'jog02-black-wash-188', 15, 0, NULL, 18, 'P0160', 450, 950, 850, 20, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Product code : JOG02\r\nColor : Black Wash\r\nFabric : Knit Denim , 11.5 Ounce\r\nBrand : Zara\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-08-24 19:40:56', '2025-09-04 18:11:01'),
(161, 'JOG02 Light Blue Wash', 'jog02-light-blue-wash-188', 15, 0, NULL, 18, 'P0161', 450, 950, 850, 3, NULL, 'https://www.facebook.com/Arzamart/videos/2295929000797664/', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Product code : JOG02\r\nColor : Light Blue Wash\r\nFabric : Knit Denim , 11.5 Ounce\r\nBrand : Zara\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-08-24 19:42:49', '2025-09-04 18:11:01'),
(162, 'JOG02 Deep Blue Wash', 'jog02-deep-blue-wash-188', 15, 0, NULL, NULL, 'P0162', 450, 950, 850, 1, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Product code : JOG02\r\nColor : Light Blue Wash\r\nFabric : Knit Denim , 11.5 Ounce\r\nBrand : Zara\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-08-24 19:48:17', '2025-09-04 18:11:01'),
(163, 'JOG03 Black', 'jog03-black-188', 15, 0, NULL, 24, 'P0163', 370, 750, 650, 20, NULL, NULL, '<font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Joggers\r\nColor : Black\r\nFabric : Fleece Fabric One side Brush , 240 GSM\r\nBrand : Adidas\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n38= Waist: 37\"-39\"Length- 41.5”</span><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"></span></font>', NULL, 0, 0, NULL, 1, '2025-08-24 20:01:08', '2025-09-04 18:11:01'),
(164, 'JOG03 Ash', 'jog03-ash-188', 15, 0, NULL, 24, 'P0164', 370, 750, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/598025785945975/', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Joggers\r\nColor : Ash \r\nFabric : Fleece Fabric One side Brush , 240 GSM\r\nBrand : Adidas\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n38= Waist: 37\"-39\"Length- 41.5”</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:02:22', '2025-09-04 18:11:01'),
(165, 'JOG03 Navy Blue', 'jog03-navy-blue-188', 15, 0, NULL, 24, 'P0165', 370, 750, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/598025785945975/', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Joggers\r\nColor : Navy Blue\r\nFabric : Fleece Fabric One side Brush , 240 GSM\r\nBrand : Adidas\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n38= Waist: 37\"-39\"Length- 41.5”</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:06:53', '2025-09-04 18:11:01'),
(166, 'JOG04 Black Wash', 'jog04-black-wash-188', 15, 0, NULL, NULL, 'P0166', 450, NULL, 950, 200, NULL, 'https://www.facebook.com/watch/?v=1961109057735506', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Joggers\r\nColor : Black Wash\r\nFabric : Export Knit Denim Fabric, 11.5 Ounce\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n38= Waist: 37\"-39\"Length- 41.5”</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:11:15', '2025-09-04 18:11:01'),
(167, 'JOG04 Deep Blue Wash', 'jog04-deep-blue-wash-188', 15, 0, NULL, NULL, 'P0167', 450, NULL, 950, 20, NULL, 'https://www.facebook.com/watch/?v=1961109057735506', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Joggers\r\nColor : Deep Blue Wash\r\nFabric : Export Knit Denim Fabric, 11.5 Ounce\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n38= Waist: 37\"-39\"Length- 41.5”</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:12:16', '2025-09-04 18:11:01'),
(168, 'JOG04 Black', 'jog04-black-188', 15, 0, NULL, NULL, 'P0168', 450, NULL, 950, 20, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Joggers\r\nColor : Black\r\nFabric : Export Knit Denim Fabric, 11.5 Ounce\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n38= Waist: 37\"-39\"Length- 41.5”</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:15:45', '2025-09-04 18:11:01'),
(169, 'Cargo Pnat01 Brown', 'cargo-pnat01-brown-190', 14, 5, 0, 20, 'P0169', 750, 1250, 1050, 20, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Joggers\r\nColor : Brown \r\nFabric : Premium Twill Cotton Stitch \r\nBrand : G-Star Raw\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 30”-31\'\' Length- 38”\r\n32= Waist: 32\'\'-33\'\'  Length- 39”\r\n34= Waist: 34\'\'-35\'\'  Length- 40”\r\n36= Waist: 36\'\'-37\'\'  Length- 41”\r\n<br></span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:24:52', '2025-09-04 18:11:01'),
(170, 'Cargo Pnat01 Cream', 'cargo-pnat01-cream-190', 14, 5, 0, 20, 'P0170', 750, 1250, 1050, 20, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Joggers\r\nColor : Cream\r\nFabric : Premium Twill Cotton Stitch \r\nBrand : G-Star Raw\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 30”-31\'\' Length- 38”\r\n32= Waist: 32\'\'-33\'\'  Length- 39”\r\n34= Waist: 34\'\'-35\'\'  Length- 40”\r\n36= Waist: 36\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-08-24 20:26:05', '2025-09-04 18:11:01'),
(171, 'Cargo Pnat01 Grey', 'cargo-pnat01-grey-190', 14, 5, 0, 20, 'P0171', 750, 1250, 1050, 1, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Joggers\r\nColor : Grey\r\nFabric : Premium Twill Cotton Stitch \r\nBrand : G-Star Raw\r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 30”-31\'\' Length- 38”\r\n32= Waist: 32\'\'-33\'\'  Length- 39”\r\n34= Waist: 34\'\'-35\'\'  Length- 40”\r\n36= Waist: 36\'\'-37\'\'  Length- 41”</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:26:59', '2025-09-04 18:11:01'),
(172, 'Cargo Pant02 Black Wash', 'cargo-pant02-black-wash-199', 14, NULL, 0, 19, 'P0172', 450, 950, 600, 200, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Cargo Pant\r\nColor : Black Wash\r\nFabric : China Denim Fabric, 11 Ounce\r\nBrand : Tommy Hilfiger \r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n</span><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">28: Waist - 28”-29\'\' Length- 37”</span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">\r\n30: Waist - 30”-31\'\' Length- 37.5”\r\n32= Waist: 32\'\'-33\'\'  Length- 38”\r\n34= Waist: 34\'\'-35\'\'  Length- 38.5”\r\n36= Waist: 36\'\'-37\'\'  Length- 40”<br></span></p>', NULL, 1, 0, NULL, 1, '2025-08-24 20:31:40', '2025-09-29 02:20:28'),
(173, 'Cargo Pant02 Light Blue Wash', 'cargo-pant02-light-blue-wash-190', 14, 3, 0, 19, 'P0173', 450, 950, 600, 200, NULL, NULL, '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"background-color: rgb(240, 240, 240);\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Cargo Pant 02\r\nColor : Light Blue Wash\r\nFabric : China Denim Fabric, 11 Ounce\r\nBrand : Tommy Hilfiger \r\n\r\n</span></span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n</span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">28: Waist - 28”-29\'\' Length- 37”</span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">\r\n30: Waist - 30”-31\'\' Length- 37.5”\r\n32= Waist: 32\'\'-33\'\'  Length- 38”\r\n34= Waist: 34\'\'-35\'\'  Length- 38.5”\r\n36= Waist: 36\'\'-37\'\'  Length- 40”</span></p>', NULL, 1, 0, NULL, 1, '2025-08-24 20:36:06', '2025-09-04 18:13:07'),
(174, 'Cargo Pant02 Deep Blue Wash', 'cargo-pant02-deep-blue-wash-190', 14, 3, 0, 19, 'P0174', 450, 950, 600, 200, NULL, NULL, '<p><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">Category : Cargo Pant</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">Color : Deep Blue Wash</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">Fabric : China Denim Fabric, 11 Ounce</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">Brand : Tommy Hilfiger </span><br><br><span class=\"x1xsqp64 xiy17q3 x1o6pynw x19co3pv xdj266r xjn30re xat24cr x1hb08if x2b8uid\" data-testid=\"emoji\" style=\"cursor: default; background-image: url(&quot;https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png&quot;); background-size: 16px 16px; white-space-collapse: preserve;\"><span class=\"xexx8yu xcaqkgz x18d9i69 xbwkkl7 x3jgonx x1bhl96m\">💠</span></span><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">Size Measurements:</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">28: Waist - 28”-29\'\' Length- 37”</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">30: Waist - 30”-31\'\' Length- 37.5”</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">32= Waist: 32\'\'-33\'\'  Length- 38”</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">34= Waist: 34\'\'-35\'\'  Length- 38.5”</span><br><span class=\"x3jgonx\" style=\"white-space-collapse: preserve;\">36= Waist: 36\'\'-37\'\'  Length- 40”</span></p>', NULL, 1, 0, NULL, 1, '2025-08-24 20:39:06', '2025-09-04 18:13:07'),
(175, 'KCP01 Black wash', 'kcp01-black-wash-188', 16, 0, NULL, 18, 'P0175', 365, 650, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/1581021369130717/', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kids Cargo Pant 01\r\nColor : Black Wash\r\nBrand : Zara \r\nFabric : Poly Cotton \r\n\r\nSize 4 - Waist 18-20\'\' Length 23\'\'\r\nSize 6 - Waist 20-22\'\' Length  24.5\'\'\r\nSize 8 - Waist  22-24\'\' Length 26\'\'\r\nSize 10 - Waist 23-25\'\' Length 28\'\'\r\nSize 12 - Waist 25-26\'\' Length 30\'\'\r\nSize 14 - Waist 26-28\'\' Length 32\'\'</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:46:37', '2025-09-04 18:11:01'),
(176, 'KCP01 Light Blue Wash', 'kcp01-light-blue-wash-188', 16, 0, NULL, 18, 'P0176', 365, 650, 650, 1, NULL, 'https://www.facebook.com/Arzamart/videos/1581021369130717/', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kids Cargo Pant 01\r\nColor : Light Blue Wash\r\nBrand : Zara \r\nFabric : Poly Cotton \r\n\r\nSize 4 - Waist 18-20\'\' Length 23\'\'\r\nSize 6 - Waist 20-22\'\' Length  24.5\'\'\r\nSize 8 - Waist  22-24\'\' Length 26\'\'\r\nSize 10 - Waist 23-25\'\' Length 28\'\'\r\nSize 12 - Waist 25-26\'\' Length 30\'\'\r\nSize 14 - Waist 26-28\'\' Length 32\'\'</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:57:43', '2025-09-04 18:11:01'),
(177, 'KCP01 Deep Blue Wash', 'kcp01-deep-blue-wash-188', 16, 0, NULL, 18, 'P0177', 365, 650, 650, 3, NULL, 'https://www.facebook.com/Arzamart/videos/1581021369130717/', '<p><span style=\"background-color: rgb(240, 240, 240);\"><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Kids Cargo Pant 01\r\nColor : Deep Blue Wash\r\nBrand : Zara \r\nFabric : Poly Cotton \r\n\r\nSize 4 - Waist 18-20\'\' Length 23\'\'\r\nSize 6 - Waist 20-22\'\' Length  24.5\'\'\r\nSize 8 - Waist  22-24\'\' Length 26\'\'\r\nSize 10 - Waist 23-25\'\' Length 28\'\'\r\nSize 12 - Waist 25-26\'\' Length 30\'\'\r\nSize 14 - Waist 26-28\'\' Length 32\'\'</span></font></span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 20:59:45', '2025-09-04 18:11:01'),
(178, 'KCP01 Black', 'kcp01-black-188', 16, 0, NULL, 18, 'P0178', 365, 650, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/1581021369130717/', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Kids Cargo Pant 01\r\nColor : Black \r\nBrand : Zara \r\nFabric : Poly Cotton \r\n\r\nSize 4 - Waist 18-20\'\' Length 23\'\'\r\nSize 6 - Waist 20-22\'\' Length  24.5\'\'\r\nSize 8 - Waist  22-24\'\' Length 26\'\'\r\nSize 10 - Waist 23-25\'\' Length 28\'\'\r\nSize 12 - Waist 25-26\'\' Length 30\'\'\r\nSize 14 - Waist 26-28\'\' Length 32\'\'</span></font><span style=\"background-color: rgb(240, 240, 240);\">&nbsp;</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:01:07', '2025-09-04 18:11:01'),
(179, 'KCP02 Black Wash', 'kcp02-black-wash-188', 16, 0, NULL, 25, 'P0179', 400, 650, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/660517429919896/', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kid\'s Cargo Pant \r\nColor : Black \r\nBrand : Lee\r\nFabric : Knit Denim \r\n\r\nSize 6- Waist 21-22\'\' Length  26\'\'\r\nSize 8- Waist  22-23\'\' Length 27\'\'\r\nSize 10- Waist 23-25\'\' Length 29\'\'\r\nSize 12- Waist 24-26\'\' Length 30\'\'\r\nSize 14- Waist 26-28\'\' Length 31\'\' \r\nSize 16- Waist 28-30\'\' Length 33\'\'</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:10:03', '2025-09-04 18:11:01'),
(180, 'KCP02 Light Blue Wash', 'kcp02-light-blue-wash-188', 16, 0, NULL, 25, 'P0180', 400, 650, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/660517429919896/', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kid\'s Cargo Pant \r\nColor : Light Blue Wash\r\nBrand : Lee\r\nFabric : Knit Denim \r\n\r\nSize 6- Waist 21-22\'\' Length  26\'\'\r\nSize 8- Waist  22-23\'\' Length 27\'\'\r\nSize 10- Waist 23-25\'\' Length 29\'\'\r\nSize 12- Waist 24-26\'\' Length 30\'\'\r\nSize 14- Waist 26-28\'\' Length 31\'\' \r\nSize 16- Waist 28-30\'\' Length 33\'\'</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:16:45', '2025-09-04 18:11:01'),
(181, 'KCP02 Deep Blue Wash', 'kcp02-deep-blue-wash-188', 16, 0, NULL, 25, 'P0181', 400, 650, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/660517429919896/', '<p><span style=\"background-color: rgb(240, 240, 240);\"><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Kid\'s Cargo Pant \r\nColor : Deep Blue Wash\r\nBrand : Lee\r\nFabric : Knit Denim \r\n\r\nSize 6- Waist 21-22\'\' Length  26\'\'\r\nSize 8- Waist  22-23\'\' Length 27\'\'\r\nSize 10- Waist 23-25\'\' Length 29\'\'\r\nSize 12- Waist 24-26\'\' Length 30\'\'\r\nSize 14- Waist 26-28\'\' Length 31\'\' \r\nSize 16- Waist 28-30\'\' Length 33\'\'</span></font></span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:19:26', '2025-09-04 18:11:01'),
(182, 'KCP02 Black', 'kcp02-black-188', 16, 0, NULL, 25, 'P0182', 400, 650, 650, 20, NULL, 'https://www.facebook.com/Arzamart/videos/660517429919896/', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kid\'s Cargo Pant \r\nColor : Black\r\nBrand : Lee\r\nFabric : Knit Denim \r\n\r\nSize 6- Waist 21-22\'\' Length  26\'\'\r\nSize 8- Waist  22-23\'\' Length 27\'\'\r\nSize 10- Waist 23-25\'\' Length 29\'\'\r\nSize 12- Waist 24-26\'\' Length 30\'\'\r\nSize 14- Waist 26-28\'\' Length 31\'\' \r\nSize 16- Waist 28-30\'\' Length 33\'\'</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:23:12', '2025-09-04 18:11:01'),
(183, 'KCP03 Black Wash', 'kcp03-black-wash-190', 16, 6, 0, 18, 'P0183', 275, NULL, 700, 20, NULL, 'https://www.facebook.com/reel/1257202382755146', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kid\'s Cargo Pant \r\nColor : Black Wash\r\nBrand : Zara\r\nFabric : Export Knit Denim \r\n\r\nSize 4/5- Waist 18-21 , Length 25\r\nSize 6/7- Waist 22-24, Length  27\r\nSize 8/9- Waist  24-26, Length 29\r\nSize 10/11-Waist 26-28, Length 31\r\nSize 12/13-Waist 28-30, Length 33\r\nSize 14/15-Waist 30-32, Length 36 </span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:28:05', '2025-09-04 18:11:01'),
(184, 'KCP03 Light Blue Wash', 'kcp03-light-blue-wash-190', 16, 6, 0, 18, 'P0184', 375, NULL, 700, 20, NULL, 'https://www.facebook.com/reel/1257202382755146', '<p><span style=\"background-color: rgb(240, 240, 240);\"><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Kid\'s Cargo Pant \r\nColor : Light Blue Wash\r\nBrand : Zara\r\nFabric : Export Knit Denim \r\n\r\nSize 4/5- Waist 18-21 , Length 25\r\nSize 6/7- Waist 22-24, Length  27\r\nSize 8/9- Waist  24-26, Length 29\r\nSize 10/11-Waist 26-28, Length 31\r\nSize 12/13-Waist 28-30, Length 33\r\nSize 14/15-Waist 30-32, Length 36 </span></font></span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:29:46', '2025-09-04 18:11:01'),
(185, 'KCP03 Deep Blue Wash', 'kcp03-deep-blue-wash-190', 16, 6, 0, 18, 'P0185', 375, NULL, 700, 20, NULL, 'https://www.facebook.com/reel/1257202382755146', '<p><span style=\"background-color: rgb(240, 240, 240);\"><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve;\">Category : Kid\'s Cargo Pant \r\nColor : Deep Blue Wash\r\nBrand : Zara\r\nFabric : Export Knit Denim \r\n\r\nSize 4/5- Waist 18-21 , Length 25\r\nSize 6/7- Waist 22-24, Length  27\r\nSize 8/9- Waist  24-26, Length 29\r\nSize 10/11-Waist 26-28, Length 31\r\nSize 12/13-Waist 28-30, Length 33\r\nSize 14/15-Waist 30-32, Length 36 </span></font></span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:31:01', '2025-09-04 18:11:01'),
(186, 'KCP03 Black', 'kcp03-black-190', 16, 6, 0, 18, 'P0186', 370, NULL, 700, 20, NULL, 'https://www.facebook.com/reel/1257202382755146', '<p><span style=\"color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category : Kid\'s Cargo Pant \r\nColor : Black\r\nBrand : Zara\r\nFabric : Export Knit Denim \r\n\r\nSize 4/5- Waist 18-21 , Length 25\r\nSize 6/7- Waist 22-24, Length  27\r\nSize 8/9- Waist  24-26, Length 29\r\nSize 10/11-Waist 26-28, Length 31\r\nSize 12/13-Waist 28-30, Length 33\r\nSize 14/15-Waist 30-32, Length 36 </span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:32:14', '2025-09-04 18:11:01'),
(187, 'KJOG01 Black Wash', 'kjog01-black-wash-188', 17, 0, NULL, 18, 'P0187', 370, 660, 660, 20, NULL, 'https://www.facebook.com/Arzamart/videos/1156649395839855/', '<span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Category: Kid\'s Joggers\r\nColor : Ligh Blue Wash\r\nBrand : Zara \r\nFabric : Export Poly Cotton \r\n</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 4- Waist 18-21, Length 24 </span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 6- Waist 22-24, Length 26</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 8- Waist  24-26, Length 28</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 10- Waist 26-28, Length 30</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 12- Waist 28-30, Length 32</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 14- Waist 30-32, Length 34</span>', NULL, 0, 0, NULL, 1, '2025-08-24 21:39:27', '2025-09-04 18:11:01'),
(188, 'KJOG01 Light Blue Wash', 'kjog01-light-blue-wash-188', 17, 0, NULL, 18, 'P0188', 370, 660, 660, 20, NULL, 'https://www.facebook.com/Arzamart/videos/1156649395839855/', '<p><span style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Category: Kid\'s Joggers\r\nColor : Ligh Blue Wash\r\nBrand : Zara \r\nFabric : Export Poly Cotton \r\n</span><br style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size 4- Waist 18-21, Length 24 </span><br style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size 6- Waist 22-24, Length 26</span><br style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size 8- Waist  24-26, Length 28</span><br style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size 10- Waist 26-28, Length 30</span><br style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size 12- Waist 28-30, Length 32</span><br style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"color: rgb(8, 8, 9); font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Size 14- Waist 30-32, Length 34</span></p>', NULL, 0, 0, NULL, 1, '2025-08-24 21:49:20', '2025-09-04 18:11:01');
INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `subcategory_id`, `childcategory_id`, `brand_id`, `product_code`, `purchase_price`, `old_price`, `new_price`, `stock`, `pro_unit`, `pro_video`, `description`, `meta_description`, `topsale`, `feature_product`, `campaign_id`, `status`, `created_at`, `updated_at`) VALUES
(190, 'KJOG01 Deep Blue Wash', 'kjog01-deep-blue-wash-190', 17, 0, NULL, 18, 'P0189', 375, NULL, 660, 20, NULL, NULL, '<p><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Category: Kid\'s Joggers\r\nColor : Deep Blue Wash\r\nBrand : Zara \r\nFabric : Export Poly Cotton \r\n</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 4- Waist 18-21, Length 24 </span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 6- Waist 22-24, Length 26</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 8- Waist  24-26, Length 28</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 10- Waist 26-28, Length 30</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 12- Waist 28-30, Length 32</span><br style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><span class=\"x3jgonx\" style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\">Size 14- Waist 30-32, Length 34</span></p>', NULL, 0, 0, NULL, 1, '2025-08-25 11:16:29', '2025-09-04 18:11:01'),
(191, 'Cargo Pant 03 Black Wash', 'cargo-pant-03-black-wash-199', 14, 15, 0, 18, 'P0191', 850, NULL, 850, 20, NULL, 'https://www.facebook.com/arzaexport/videos/1035450125247003', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Product code : Cargo Pant 03\r\nColor : Black Wash\r\nFabric : Knit Denim , 12 Ounce\r\nBrand : Zara\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-09-26 16:20:29', '2025-09-29 02:15:41'),
(192, 'Cargo Pant 03 Black', 'cargo-pant-03-black-199', 14, 15, 0, 18, 'P0192', 850, NULL, 850, 20, NULL, 'https://www.facebook.com/arzaexport/videos/1035450125247003', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Product code : Cargo Pant 03\r\nColor : Black \r\nFabric : Knit Denim , 12 Ounce\r\nBrand : Zara\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-09-26 16:23:32', '2025-09-29 02:25:05'),
(193, 'Cargo Pant 03 Blue wash', 'cargo-pant-03-blue-wash-199', 14, 15, 0, 18, 'P0193', 850, 0, 850, 20, NULL, 'https://www.facebook.com/arzaexport/videos/1035450125247003', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Product code : Cargo Pant 03\r\nColor : Blue Wash\r\nFabric : Knit Denim , 12 Ounce\r\nBrand : Zara\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-09-26 16:24:30', '2025-09-29 02:16:08'),
(194, 'Cargo Pant 03 Light Blue wash', 'cargo-pant-03-light-blue-wash-199', 14, 15, 0, 18, 'P0194', 850, NULL, 850, 20, NULL, 'https://www.facebook.com/arzaexport/videos/1035450125247003', '<p><font color=\"#080809\" face=\"Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15px; white-space-collapse: preserve; background-color: rgb(240, 240, 240);\">Product code : Cargo Pant 03\r\nColor : Light Blue Wash\r\nFabric : Knit Denim , 12 Ounce\r\nBrand : Zara\r\n\r\n</span></font><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"white-space-collapse: preserve; padding: 0px; overflow-wrap: break-word; margin: 0px 1px; display: inline-flex; vertical-align: middle; width: 16px; height: 16px; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(8, 8, 9); font-size: 15px; background-color: rgb(240, 240, 240);\"><img height=\"16\" width=\"16\" class=\"xz74otr x15mokao x1ga7v0g x16uus16 xbiv7yw\" alt=\"💠\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tbb/1/16/1f4a0.png\" style=\"border: 0px; border-radius: 0px; object-fit: fill;\"></span><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\">Size Measurements:\r\n30: Waist - 28”-31\'\' Length- 38”\r\n32= Waist: 31\'\'-33\'\'  Length- 39”\r\n34= Waist: 33\'\'-35\'\'  Length- 40”\r\n36= Waist: 35\'\'-37\'\'  Length- 41”\r\n</span></p><div><span style=\"white-space-collapse: preserve; color: rgb(8, 8, 9); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(240, 240, 240);\"><br></span></div>', NULL, 0, 0, NULL, 1, '2025-09-26 16:25:25', '2025-09-29 02:22:38'),
(200, 'Hoodie 01 Black', 'hoodie-01-black-202', 20, 17, 0, 26, 'P0200', 680, 1250, 1050, 20, NULL, 'https://www.facebook.com/reel/4211099905772881', '<p>Hoodie<br>Color : Black <br>Brand name: Gucci</p><p>Fabric : Fleece Fabric (330+GSM )</p><p>Super Premium ,Soft and very comfortable to wear&nbsp;</p><p>Size measurement :</p><p>S:Chest-38\'\' Length 27\"</p><p>M: Chest-40” Length- 28”</p><p>L: Chest-42” Length- 29”</p><p>XL: Chest-44” Length- 30\"</p><p>XXL: Chest-46” Length- 31\"</p>', NULL, 1, 0, NULL, 1, '2025-09-30 22:16:23', '2025-10-22 20:53:58'),
(201, 'Hoodie 01 White', 'hoodie-01-white-202', 20, 17, 0, 26, 'P0201', 680, 1250, 1050, 20, NULL, 'https://www.facebook.com/reel/4211099905772881', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Hoodie<br>Color : White<br>Brand name: Gucci</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Fabric : Fleece Fabric (330+GSM )</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Super Premium ,Soft and very comfortable to wear&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Size measurement :</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">S:Chest-38\'\' Length 27\"</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">M: Chest-40” Length- 28”</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">L: Chest-42” Length- 29”</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">XL: Chest-44” Length- 30\"</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">XXL: Chest-46” Length- 31\"</p>', NULL, 1, 0, NULL, 1, '2025-09-30 22:17:53', '2025-10-22 20:53:49'),
(202, 'Hoodie 01 Olive', 'hoodie-01-olive-202', 20, 17, 0, 26, 'P0202', 680, 1250, 1050, 20, NULL, 'https://www.facebook.com/reel/4211099905772881', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Hoodie<br>Color : Olive<br>Brand name: Gucci</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Fabric : Fleece Fabric (330+GSM )</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Super Premium ,Soft and very comfortable to wear&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">Size measurement :</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">S:Chest-38\'\' Length 27\"</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">M: Chest-40” Length- 28”</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">L: Chest-42” Length- 29”</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">XL: Chest-44” Length- 30\"</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: &quot;Hind Siliguri&quot;, sans-serif;\">XXL: Chest-46” Length- 31\"</p>', NULL, 1, 0, NULL, 1, '2025-09-30 22:26:54', '2025-10-22 20:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `productsizes`
--

CREATE TABLE `productsizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productsizes`
--

INSERT INTO `productsizes` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(1, 1, 12, '2024-02-05 09:40:29', '2024-02-05 09:40:29'),
(2, 1, 13, '2024-02-05 09:40:29', '2024-02-05 09:40:29'),
(3, 1, 14, '2024-02-05 09:40:29', '2024-02-05 09:40:29'),
(4, 1, 15, '2024-02-05 09:40:29', '2024-02-05 09:40:29'),
(5, 35, 7, '2024-02-05 09:54:29', '2024-02-05 09:54:29'),
(6, 35, 8, '2024-02-05 09:54:29', '2024-02-05 09:54:29'),
(7, 35, 9, '2024-02-05 09:54:29', '2024-02-05 09:54:29'),
(8, 28, 6, '2024-02-05 14:06:19', '2024-02-05 14:06:19'),
(9, 28, 7, '2024-02-05 14:06:19', '2024-02-05 14:06:19'),
(10, 28, 8, '2024-02-05 14:06:19', '2024-02-05 14:06:19'),
(11, 28, 9, '2024-02-05 14:06:19', '2024-02-05 14:06:19'),
(12, 2, 6, '2024-02-05 14:07:27', '2024-02-05 14:07:27'),
(13, 2, 7, '2024-02-05 14:07:27', '2024-02-05 14:07:27'),
(14, 2, 8, '2024-02-05 14:07:27', '2024-02-05 14:07:27'),
(15, 131, 6, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(16, 131, 7, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(17, 131, 8, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(18, 131, 9, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(19, 131, 10, '2024-03-13 00:28:08', '2024-03-13 00:28:08'),
(20, 133, 6, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(21, 133, 7, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(22, 133, 8, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(23, 133, 9, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(24, 133, 10, '2024-05-31 14:40:26', '2024-05-31 14:40:26'),
(25, 139, 6, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(26, 139, 7, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(27, 139, 9, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(28, 139, 10, '2024-06-25 07:40:02', '2024-06-25 07:40:02'),
(29, 140, 6, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(30, 140, 7, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(31, 140, 8, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(32, 140, 9, '2024-06-25 07:48:56', '2024-06-25 07:48:56'),
(33, 141, 6, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(34, 141, 7, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(35, 141, 8, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(36, 141, 9, '2024-06-25 08:00:57', '2024-06-25 08:00:57'),
(37, 150, 16, '2024-12-08 09:39:17', '2024-12-08 09:39:17'),
(38, 150, 17, '2024-12-08 09:39:17', '2024-12-08 09:39:17'),
(39, 151, 7, '2025-02-04 14:34:17', '2025-02-04 14:34:17'),
(40, 153, 6, '2025-08-20 09:22:28', '2025-08-20 09:22:28'),
(41, 153, 7, '2025-08-20 09:22:28', '2025-08-20 09:22:28'),
(42, 153, 8, '2025-08-20 09:22:28', '2025-08-20 09:22:28'),
(43, 153, 9, '2025-08-20 09:22:28', '2025-08-20 09:22:28'),
(44, 153, 10, '2025-08-20 09:22:28', '2025-08-20 09:22:28'),
(45, 158, 13, '2025-08-24 19:38:37', '2025-08-24 19:38:37'),
(46, 158, 14, '2025-08-24 19:38:37', '2025-08-24 19:38:37'),
(47, 161, 13, '2025-08-24 19:42:49', '2025-08-24 19:42:49'),
(48, 161, 14, '2025-08-24 19:42:49', '2025-08-24 19:42:49'),
(49, 161, 15, '2025-08-24 19:42:49', '2025-08-24 19:42:49'),
(50, 163, 13, '2025-08-24 20:01:08', '2025-08-24 20:01:08'),
(51, 163, 14, '2025-08-24 20:01:08', '2025-08-24 20:01:08'),
(52, 163, 15, '2025-08-24 20:01:08', '2025-08-24 20:01:08'),
(53, 163, 18, '2025-08-24 20:01:08', '2025-08-24 20:01:08'),
(54, 163, 19, '2025-08-24 20:01:08', '2025-08-24 20:01:08'),
(55, 164, 13, '2025-08-24 20:02:22', '2025-08-24 20:02:22'),
(56, 164, 14, '2025-08-24 20:02:22', '2025-08-24 20:02:22'),
(57, 164, 15, '2025-08-24 20:02:22', '2025-08-24 20:02:22'),
(58, 164, 18, '2025-08-24 20:02:22', '2025-08-24 20:02:22'),
(59, 164, 19, '2025-08-24 20:02:22', '2025-08-24 20:02:22'),
(60, 165, 13, '2025-08-24 20:06:53', '2025-08-24 20:06:53'),
(61, 165, 14, '2025-08-24 20:06:53', '2025-08-24 20:06:53'),
(62, 165, 15, '2025-08-24 20:06:53', '2025-08-24 20:06:53'),
(63, 165, 18, '2025-08-24 20:06:53', '2025-08-24 20:06:53'),
(64, 165, 19, '2025-08-24 20:06:53', '2025-08-24 20:06:53'),
(65, 166, 12, '2025-08-24 20:11:15', '2025-08-24 20:11:15'),
(66, 166, 13, '2025-08-24 20:11:15', '2025-08-24 20:11:15'),
(67, 166, 14, '2025-08-24 20:11:15', '2025-08-24 20:11:15'),
(68, 166, 15, '2025-08-24 20:11:15', '2025-08-24 20:11:15'),
(69, 166, 18, '2025-08-24 20:11:15', '2025-08-24 20:11:15'),
(70, 166, 19, '2025-08-24 20:11:15', '2025-08-24 20:11:15'),
(71, 167, 12, '2025-08-24 20:12:16', '2025-08-24 20:12:16'),
(72, 167, 13, '2025-08-24 20:12:16', '2025-08-24 20:12:16'),
(73, 167, 14, '2025-08-24 20:12:16', '2025-08-24 20:12:16'),
(74, 167, 15, '2025-08-24 20:12:16', '2025-08-24 20:12:16'),
(75, 167, 18, '2025-08-24 20:12:16', '2025-08-24 20:12:16'),
(76, 167, 19, '2025-08-24 20:12:16', '2025-08-24 20:12:16'),
(77, 168, 12, '2025-08-24 20:15:45', '2025-08-24 20:15:45'),
(78, 168, 13, '2025-08-24 20:15:45', '2025-08-24 20:15:45'),
(79, 168, 14, '2025-08-24 20:15:45', '2025-08-24 20:15:45'),
(80, 168, 15, '2025-08-24 20:15:45', '2025-08-24 20:15:45'),
(81, 168, 18, '2025-08-24 20:15:45', '2025-08-24 20:15:45'),
(82, 168, 19, '2025-08-24 20:15:45', '2025-08-24 20:15:45'),
(83, 169, 13, '2025-08-24 20:24:52', '2025-08-24 20:24:52'),
(84, 169, 14, '2025-08-24 20:24:52', '2025-08-24 20:24:52'),
(85, 169, 15, '2025-08-24 20:24:52', '2025-08-24 20:24:52'),
(86, 169, 18, '2025-08-24 20:24:52', '2025-08-24 20:24:52'),
(87, 170, 13, '2025-08-24 20:26:05', '2025-08-24 20:26:05'),
(88, 170, 14, '2025-08-24 20:26:05', '2025-08-24 20:26:05'),
(89, 170, 15, '2025-08-24 20:26:05', '2025-08-24 20:26:05'),
(90, 170, 18, '2025-08-24 20:26:05', '2025-08-24 20:26:05'),
(91, 170, 19, '2025-08-24 20:26:05', '2025-08-24 20:26:05'),
(92, 171, 13, '2025-08-24 20:26:59', '2025-08-24 20:26:59'),
(93, 172, 12, '2025-08-24 20:31:40', '2025-08-24 20:31:40'),
(94, 172, 13, '2025-08-24 20:31:40', '2025-08-24 20:31:40'),
(95, 172, 14, '2025-08-24 20:31:40', '2025-08-24 20:31:40'),
(96, 172, 15, '2025-08-24 20:31:40', '2025-08-24 20:31:40'),
(97, 172, 18, '2025-08-24 20:31:40', '2025-08-24 20:31:40'),
(98, 173, 12, '2025-08-24 20:36:06', '2025-08-24 20:36:06'),
(99, 173, 13, '2025-08-24 20:36:06', '2025-08-24 20:36:06'),
(100, 173, 14, '2025-08-24 20:36:06', '2025-08-24 20:36:06'),
(101, 173, 15, '2025-08-24 20:36:06', '2025-08-24 20:36:06'),
(102, 173, 18, '2025-08-24 20:36:06', '2025-08-24 20:36:06'),
(103, 174, 12, '2025-08-24 20:39:06', '2025-08-24 20:39:06'),
(104, 174, 13, '2025-08-24 20:39:06', '2025-08-24 20:39:06'),
(105, 174, 14, '2025-08-24 20:39:06', '2025-08-24 20:39:06'),
(106, 174, 15, '2025-08-24 20:39:06', '2025-08-24 20:39:06'),
(107, 174, 18, '2025-08-24 20:39:06', '2025-08-24 20:39:06'),
(108, 175, 20, '2025-08-24 20:46:37', '2025-08-24 20:46:37'),
(109, 175, 21, '2025-08-24 20:46:37', '2025-08-24 20:46:37'),
(110, 175, 22, '2025-08-24 20:46:37', '2025-08-24 20:46:37'),
(111, 175, 23, '2025-08-24 20:46:37', '2025-08-24 20:46:37'),
(112, 175, 24, '2025-08-24 20:46:37', '2025-08-24 20:46:37'),
(113, 175, 25, '2025-08-24 20:46:37', '2025-08-24 20:46:37'),
(114, 176, 20, '2025-08-24 20:57:43', '2025-08-24 20:57:43'),
(115, 176, 21, '2025-08-24 20:57:43', '2025-08-24 20:57:43'),
(116, 176, 22, '2025-08-24 20:57:43', '2025-08-24 20:57:43'),
(117, 176, 23, '2025-08-24 20:57:43', '2025-08-24 20:57:43'),
(118, 176, 24, '2025-08-24 20:57:43', '2025-08-24 20:57:43'),
(119, 176, 25, '2025-08-24 20:57:43', '2025-08-24 20:57:43'),
(120, 177, 20, '2025-08-24 20:59:45', '2025-08-24 20:59:45'),
(121, 177, 21, '2025-08-24 20:59:45', '2025-08-24 20:59:45'),
(122, 177, 22, '2025-08-24 20:59:45', '2025-08-24 20:59:45'),
(123, 177, 23, '2025-08-24 20:59:45', '2025-08-24 20:59:45'),
(124, 177, 24, '2025-08-24 20:59:45', '2025-08-24 20:59:45'),
(125, 177, 25, '2025-08-24 20:59:45', '2025-08-24 20:59:45'),
(126, 178, 20, '2025-08-24 21:01:07', '2025-08-24 21:01:07'),
(127, 178, 21, '2025-08-24 21:01:07', '2025-08-24 21:01:07'),
(128, 178, 22, '2025-08-24 21:01:07', '2025-08-24 21:01:07'),
(129, 178, 23, '2025-08-24 21:01:07', '2025-08-24 21:01:07'),
(130, 178, 24, '2025-08-24 21:01:07', '2025-08-24 21:01:07'),
(131, 178, 25, '2025-08-24 21:01:07', '2025-08-24 21:01:07'),
(132, 179, 21, '2025-08-24 21:10:03', '2025-08-24 21:10:03'),
(133, 179, 22, '2025-08-24 21:10:03', '2025-08-24 21:10:03'),
(134, 179, 23, '2025-08-24 21:10:03', '2025-08-24 21:10:03'),
(135, 179, 24, '2025-08-24 21:10:03', '2025-08-24 21:10:03'),
(136, 179, 25, '2025-08-24 21:10:03', '2025-08-24 21:10:03'),
(137, 179, 26, '2025-08-24 21:10:03', '2025-08-24 21:10:03'),
(138, 180, 21, '2025-08-24 21:16:45', '2025-08-24 21:16:45'),
(139, 180, 22, '2025-08-24 21:16:45', '2025-08-24 21:16:45'),
(140, 180, 23, '2025-08-24 21:16:45', '2025-08-24 21:16:45'),
(141, 180, 24, '2025-08-24 21:16:45', '2025-08-24 21:16:45'),
(142, 180, 25, '2025-08-24 21:16:45', '2025-08-24 21:16:45'),
(143, 180, 26, '2025-08-24 21:16:45', '2025-08-24 21:16:45'),
(144, 181, 21, '2025-08-24 21:19:26', '2025-08-24 21:19:26'),
(145, 181, 22, '2025-08-24 21:19:26', '2025-08-24 21:19:26'),
(146, 181, 23, '2025-08-24 21:19:26', '2025-08-24 21:19:26'),
(147, 181, 24, '2025-08-24 21:19:26', '2025-08-24 21:19:26'),
(148, 181, 25, '2025-08-24 21:19:26', '2025-08-24 21:19:26'),
(149, 181, 26, '2025-08-24 21:19:26', '2025-08-24 21:19:26'),
(150, 182, 21, '2025-08-24 21:23:12', '2025-08-24 21:23:12'),
(151, 182, 22, '2025-08-24 21:23:12', '2025-08-24 21:23:12'),
(152, 182, 23, '2025-08-24 21:23:12', '2025-08-24 21:23:12'),
(153, 182, 24, '2025-08-24 21:23:12', '2025-08-24 21:23:12'),
(154, 182, 25, '2025-08-24 21:23:12', '2025-08-24 21:23:12'),
(155, 182, 26, '2025-08-24 21:23:12', '2025-08-24 21:23:12'),
(156, 183, 20, '2025-08-24 21:28:05', '2025-08-24 21:28:05'),
(157, 183, 21, '2025-08-24 21:28:05', '2025-08-24 21:28:05'),
(158, 183, 22, '2025-08-24 21:28:05', '2025-08-24 21:28:05'),
(159, 183, 23, '2025-08-24 21:28:05', '2025-08-24 21:28:05'),
(160, 183, 24, '2025-08-24 21:28:05', '2025-08-24 21:28:05'),
(161, 183, 25, '2025-08-24 21:28:05', '2025-08-24 21:28:05'),
(162, 184, 20, '2025-08-24 21:29:46', '2025-08-24 21:29:46'),
(163, 184, 21, '2025-08-24 21:29:46', '2025-08-24 21:29:46'),
(164, 184, 22, '2025-08-24 21:29:46', '2025-08-24 21:29:46'),
(165, 184, 23, '2025-08-24 21:29:46', '2025-08-24 21:29:46'),
(166, 184, 24, '2025-08-24 21:29:46', '2025-08-24 21:29:46'),
(167, 184, 25, '2025-08-24 21:29:46', '2025-08-24 21:29:46'),
(168, 185, 20, '2025-08-24 21:31:01', '2025-08-24 21:31:01'),
(169, 185, 21, '2025-08-24 21:31:01', '2025-08-24 21:31:01'),
(170, 185, 22, '2025-08-24 21:31:01', '2025-08-24 21:31:01'),
(171, 185, 23, '2025-08-24 21:31:01', '2025-08-24 21:31:01'),
(172, 185, 24, '2025-08-24 21:31:01', '2025-08-24 21:31:01'),
(173, 185, 25, '2025-08-24 21:31:01', '2025-08-24 21:31:01'),
(174, 186, 20, '2025-08-24 21:32:14', '2025-08-24 21:32:14'),
(175, 186, 21, '2025-08-24 21:32:14', '2025-08-24 21:32:14'),
(176, 186, 22, '2025-08-24 21:32:14', '2025-08-24 21:32:14'),
(177, 186, 23, '2025-08-24 21:32:14', '2025-08-24 21:32:14'),
(178, 186, 24, '2025-08-24 21:32:14', '2025-08-24 21:32:14'),
(179, 186, 25, '2025-08-24 21:32:14', '2025-08-24 21:32:14'),
(180, 187, 20, '2025-08-24 21:39:27', '2025-08-24 21:39:27'),
(181, 187, 21, '2025-08-24 21:39:27', '2025-08-24 21:39:27'),
(182, 187, 22, '2025-08-24 21:39:27', '2025-08-24 21:39:27'),
(183, 187, 23, '2025-08-24 21:39:27', '2025-08-24 21:39:27'),
(184, 187, 24, '2025-08-24 21:39:27', '2025-08-24 21:39:27'),
(185, 187, 25, '2025-08-24 21:39:27', '2025-08-24 21:39:27'),
(186, 188, 20, '2025-08-24 21:49:20', '2025-08-24 21:49:20'),
(187, 188, 21, '2025-08-24 21:49:20', '2025-08-24 21:49:20'),
(188, 188, 22, '2025-08-24 21:49:20', '2025-08-24 21:49:20'),
(189, 188, 23, '2025-08-24 21:49:20', '2025-08-24 21:49:20'),
(190, 188, 24, '2025-08-24 21:49:20', '2025-08-24 21:49:20'),
(191, 188, 25, '2025-08-24 21:49:20', '2025-08-24 21:49:20'),
(192, 191, 13, '2025-09-26 16:20:29', '2025-09-26 16:20:29'),
(193, 191, 14, '2025-09-26 16:20:29', '2025-09-26 16:20:29'),
(194, 191, 15, '2025-09-26 16:20:29', '2025-09-26 16:20:29'),
(195, 191, 18, '2025-09-26 16:20:29', '2025-09-26 16:20:29'),
(196, 192, 13, '2025-09-26 16:23:32', '2025-09-26 16:23:32'),
(197, 192, 14, '2025-09-26 16:23:32', '2025-09-26 16:23:32'),
(198, 192, 15, '2025-09-26 16:23:32', '2025-09-26 16:23:32'),
(199, 192, 18, '2025-09-26 16:23:32', '2025-09-26 16:23:32'),
(200, 193, 13, '2025-09-26 16:24:30', '2025-09-26 16:24:30'),
(201, 193, 14, '2025-09-26 16:24:30', '2025-09-26 16:24:30'),
(202, 193, 15, '2025-09-26 16:24:30', '2025-09-26 16:24:30'),
(203, 193, 18, '2025-09-26 16:24:30', '2025-09-26 16:24:30'),
(204, 194, 13, '2025-09-26 16:25:25', '2025-09-26 16:25:25'),
(205, 194, 14, '2025-09-26 16:25:25', '2025-09-26 16:25:25'),
(206, 194, 15, '2025-09-26 16:25:25', '2025-09-26 16:25:25'),
(207, 194, 18, '2025-09-26 16:25:25', '2025-09-26 16:25:25'),
(208, 195, 13, '2025-09-29 01:57:10', '2025-09-29 01:57:10'),
(209, 195, 14, '2025-09-29 01:57:10', '2025-09-29 01:57:10'),
(210, 195, 15, '2025-09-29 01:57:10', '2025-09-29 01:57:10'),
(211, 195, 18, '2025-09-29 01:57:10', '2025-09-29 01:57:10'),
(212, 196, 13, '2025-09-29 02:00:03', '2025-09-29 02:00:03'),
(213, 196, 14, '2025-09-29 02:00:03', '2025-09-29 02:00:03'),
(214, 196, 15, '2025-09-29 02:00:03', '2025-09-29 02:00:03'),
(215, 196, 18, '2025-09-29 02:00:03', '2025-09-29 02:00:03'),
(216, 197, 13, '2025-09-29 02:06:11', '2025-09-29 02:06:11'),
(217, 197, 14, '2025-09-29 02:06:11', '2025-09-29 02:06:11'),
(218, 197, 15, '2025-09-29 02:06:11', '2025-09-29 02:06:11'),
(219, 197, 18, '2025-09-29 02:06:11', '2025-09-29 02:06:11'),
(220, 198, 13, '2025-09-29 02:08:08', '2025-09-29 02:08:08'),
(221, 198, 14, '2025-09-29 02:08:08', '2025-09-29 02:08:08'),
(222, 198, 15, '2025-09-29 02:08:08', '2025-09-29 02:08:08'),
(223, 198, 18, '2025-09-29 02:08:08', '2025-09-29 02:08:08'),
(224, 199, 13, '2025-09-29 02:10:53', '2025-09-29 02:10:53'),
(225, 199, 14, '2025-09-29 02:10:53', '2025-09-29 02:10:53'),
(226, 199, 15, '2025-09-29 02:10:53', '2025-09-29 02:10:53'),
(227, 199, 18, '2025-09-29 02:10:53', '2025-09-29 02:10:53'),
(228, 200, 6, '2025-09-30 22:16:23', '2025-09-30 22:16:23'),
(229, 200, 7, '2025-09-30 22:16:23', '2025-09-30 22:16:23'),
(230, 200, 8, '2025-09-30 22:16:23', '2025-09-30 22:16:23'),
(231, 200, 9, '2025-09-30 22:16:23', '2025-09-30 22:16:23'),
(232, 200, 10, '2025-09-30 22:16:23', '2025-09-30 22:16:23'),
(233, 201, 6, '2025-09-30 22:17:53', '2025-09-30 22:17:53'),
(234, 201, 7, '2025-09-30 22:17:53', '2025-09-30 22:17:53'),
(235, 201, 8, '2025-09-30 22:17:53', '2025-09-30 22:17:53'),
(236, 201, 9, '2025-09-30 22:17:53', '2025-09-30 22:17:53'),
(237, 201, 10, '2025-09-30 22:17:53', '2025-09-30 22:17:53'),
(238, 202, 6, '2025-09-30 22:26:54', '2025-09-30 22:26:54'),
(239, 202, 7, '2025-09-30 22:26:54', '2025-09-30 22:26:54'),
(240, 202, 8, '2025-09-30 22:26:54', '2025-09-30 22:26:54'),
(241, 202, 9, '2025-09-30 22:26:54', '2025-09-30 22:26:54'),
(242, 202, 10, '2025-09-30 22:26:54', '2025-09-30 22:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `ratting` varchar(4) NOT NULL,
  `review` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(55) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `email`, `ratting`, `review`, `product_id`, `customer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Omor Faruk', 'N / A', '5', 'Nice product,,,', 75, 13, 'pending', '2024-02-05 08:49:50', '2024-11-22 10:45:59'),
(2, 'Samiul Alom', 'N / A', '5', 'nice product', 123, 11, 'pending', '2024-02-10 08:00:20', '2024-11-22 10:45:56'),
(3, 'Samiul Alom', 'N / A', '5', 'nice product', 99, 11, 'pending', '2024-02-10 09:33:38', '2024-02-10 09:33:38'),
(4, 'T2', 'N / A', '5', 'Good product', 170, 47, 'pending', '2025-08-25 16:49:18', '2025-08-25 16:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-01-11 06:33:09', '2023-01-11 06:33:09'),
(3, 'Editor', 'web', '2023-01-19 06:41:33', '2023-01-19 06:41:33'),
(4, 'Salesman', 'web', '2023-01-19 06:42:28', '2023-01-19 06:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 3),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `address` varchar(256) DEFAULT NULL,
  `area` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `customer_id`, `name`, `phone`, `address`, `area`, `created_at`, `updated_at`) VALUES
(61, 61, 44, 'Md. Maruf Hasan', '01625326736', 'Road #6 House #9 Satmosjid Housing Mohammadpur', 'ঢাকার বাহিরে  ১৩০ টাকা', '2025-08-20 13:30:48', '2025-08-20 13:30:48'),
(62, 62, 45, 'Rakib', '01422662829', 'Dhaka Bangladesh', 'ঢাকার ভিতরে ৭০ টাকা', '2025-08-20 13:46:29', '2025-08-22 05:35:43'),
(63, 63, 44, 'Md. Maruf Hasan', '01625326736', 'Road #6 House #9 Satmosjid Housing Mohammadpur', 'ঢাকার ভিতরে ৭০ টাকা', '2025-08-23 07:48:52', '2025-08-23 07:48:52'),
(64, 64, 46, 'মো বাকের মিয়া', '01731594523', 'Office staff', 'ঢাকার বাহিরে  ১৩০ টাকা', '2025-08-24 21:53:03', '2025-08-24 21:53:03'),
(65, 65, 48, 'Tito', '01951887919', 'DhDhaka Mohammadpur', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-08-26 07:49:33', '2025-08-26 07:49:33'),
(67, 67, 47, 'মো বাকের মিয়া', '01796735577', 'Dhaka Mohammadpur , kadirabad Housing', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-08-31 09:40:24', '2025-08-31 09:40:24'),
(68, 68, 49, 'Dr Tuhin', '01910005530', 'Shahid satter road, iterpool, Madaripur', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-01 05:03:50', '2025-09-01 05:03:50'),
(69, 69, 50, 'Al-Amin Haque', '01793802539', 'Nilphamari,Dimla,Dimla.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-02 05:26:33', '2025-09-02 05:26:33'),
(70, 70, 51, 'sajidul', '01608742331', 'চাঁদপুর, হাজিগ', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-02 17:11:13', '2025-09-02 17:11:13'),
(71, 71, 52, 'Belal Hossain', '01765419177', 'Poshchim gaon, dhopa pukurpar, laksam, Comilla.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-03 05:39:51', '2025-09-03 05:39:51'),
(72, 72, 53, 'আব্দুল মুমিন', '01743997133', 'সিলেট বিয়ানি বাজার উপজেলা', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-03 08:24:41', '2025-09-03 08:24:41'),
(73, 73, 54, 'Saiful', '01711613263', 'Lichutala Jamalpur  2000', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-03 18:01:19', '2025-09-03 18:01:19'),
(74, 74, 55, 'আবু বক্কর01335899807', '01335899807', 'সাভার নামাবাজার রোড সিংগার সোরুম', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-04 15:21:44', '2025-09-04 15:21:44'),
(75, 75, 56, 'Md.Mostakim Hossain', '01609616556', 'গনক টুলি জামে মসজিদ, বিজিবি এক নম্বর গেট, ঢাকা।', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-04 18:31:14', '2025-09-04 18:31:14'),
(77, 77, 57, 'MD Abdullah sk', '01985406736', 'Shipyeard main gate, lobonchora, khulna', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-05 03:15:50', '2025-09-05 03:15:50'),
(78, 78, 58, 'mrinal sarker', '01716466738', 'Green Tower ,tilaghor ,Sylhet 3100', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-05 17:51:09', '2025-09-05 17:51:09'),
(79, 79, 59, 'মো বাপিপ', '01975826549', 'ফেনি টাইরোট তেকে মরিচাকাটা', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-06 01:09:45', '2025-09-06 01:09:45'),
(80, 80, 60, 'আবু বক্কর সিদ্দিক', '01875496311', 'কুটুম্বপুর  চান্দিনা  কুমিল্লা  সাইজ ৩৬ কালার  আফ হোয়াইট এবং কালো  দুটি', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-06 17:12:51', '2025-09-06 17:12:51'),
(81, 81, 61, 'সুজন মাহমুদ,', '01934013711', 'পালামগঞ্জ,  দোহার, ঢাকা', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-06 23:13:57', '2025-09-07 11:44:06'),
(82, 82, 62, 'আশিক আহমেদ', '01766633979', 'জেলা সিলেট থানা জৈন্তাপুর রং পানি', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-07 12:05:14', '2025-09-07 12:05:14'),
(83, 83, 62, 'আশিক আহমেদ', '01766633979', 'সিলেট জ্যান্তপুর রং পানি', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-07 12:07:40', '2025-09-07 12:07:40'),
(84, 84, 63, 'Md.Ferdous alam Khokon', '01670227118', 'Rupayan city Uttara Sector 12', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-08 09:42:47', '2025-09-08 09:42:47'),
(85, 85, 64, 'আরিয়ান', '01722594242', 'কুষ্টিয়া সদর গফুর হাজি মোড়', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-08 17:02:10', '2025-09-08 17:02:10'),
(89, 89, 66, 'Amin Hossien', '01875990082', 'জেলা মাদারীপুর থানা রাজৈর টেকেরহাট বাজার।', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-09 13:02:35', '2025-09-09 13:02:35'),
(90, 90, 67, 'মুন্না ইসলাম', '01400605490', 'নীলফামারী,নীলফামারী,নীলফামারী,নীলফামারী', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-10 17:10:29', '2025-09-10 17:10:29'),
(91, 91, 68, 'ইসমাইল', '01757086310', 'জেল ভোলা থানা ভোলা বিএনপি বাজার', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-10 23:47:17', '2025-09-10 23:47:17'),
(93, 93, 70, 'Samad Ahmed', '01614119004', 'Sylhet osmani nagor tajpur Talor tol', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-12 16:49:19', '2025-09-12 16:49:19'),
(94, 94, 71, 'Ripon mhamud', '01750167633', 'Hat fulbari.shariyakandi .bogura', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-14 12:31:17', '2025-09-14 12:31:17'),
(95, 95, 72, 'মোশাররফ', '01345724896', 'মহাখালী দক্ষিণ পাড়া', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-15 15:00:21', '2025-09-15 15:00:21'),
(96, 96, 72, 'মোশাররফ', '01345724896', 'মহাখালী দক্ষিণ পাড়া', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-15 15:00:22', '2025-09-15 15:00:22'),
(97, 97, 73, 'লিটন', '01753199686', 'নারায়ণগঞ্জ বিসিক', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-15 19:03:39', '2025-09-15 19:03:39'),
(98, 98, 74, 'Methun', '01644059517', 'Rangpur mithapukur bajar', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-15 19:05:33', '2025-09-15 19:05:33'),
(100, 100, 75, 'Mohammed Hossain noyon', '01643114270', 'জেলা চাঁদপুর, উপজেলা চাঁদপুর, থানা চাঁদপুর, পৌরসভা চাঁদপুর সদর.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-15 20:10:57', '2025-09-15 20:10:57'),
(101, 101, 76, 'Raktim', '01751423500', 'Rangour, Mithapukur sotihebari', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-16 13:49:48', '2025-09-16 13:49:48'),
(102, 102, 77, 'Sabbir Ahmed', '01912573137', 'Jashore town, sadar, jashore', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-16 17:57:39', '2025-09-16 17:57:39'),
(103, 103, 78, 'হাসু', '01701805665', 'রাজশাহী', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-17 15:13:04', '2025-09-17 15:13:04'),
(104, 104, 78, 'হাসু', '01701805665', 'রাজশাহী', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-17 15:13:06', '2025-09-17 15:13:06'),
(105, 105, 79, 'Pritom', '01797805896', 'Kurigram, (mogolbasha bazar)', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-18 03:43:14', '2025-09-18 03:43:14'),
(106, 106, 79, 'Pritom', '01797805896', 'Kurigram (moholbasha bazar)', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-18 03:57:57', '2025-09-18 03:57:57'),
(107, 107, 80, 'Md.Nazim uddin', '01316328509', 'Address:- 147/1, Mirhaji bag,main road, abu hazi mosque,near,shake para 2 no Gate,  South Jatrabari dhaka- 1204.', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-18 07:00:04', '2025-09-18 07:00:04'),
(108, 108, 81, 'Parvej alam', '01723043043', 'Pabna,ishwardi.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-18 13:22:38', '2025-09-18 13:22:38'),
(109, 109, 82, 'Mohammad Arif', '01684291523', 'Delpara Bazar, Fatullah, Narayanganj', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-18 18:34:23', '2025-09-18 18:34:23'),
(110, 110, 82, 'Mohammad Arif', '01684291523', 'Delpara Bazar, Fatullah, Narayanganj', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-18 18:36:57', '2025-09-18 18:36:57'),
(111, 111, 83, 'শাহীন', '01336451397', 'গাজীপুর  কালিয়াকৈর   মৌচাক', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-18 19:03:07', '2025-09-18 19:03:07'),
(112, 112, 84, 'Shoaib hasan', '01600242672', 'mawna, sreepur', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-19 08:33:28', '2025-09-19 08:33:28'),
(113, 113, 84, 'সোয়াইব হাসান', '01600242672', 'শ্রীপুর,মাওনা,আনসার রোড', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-19 08:36:33', '2025-09-19 08:36:33'),
(114, 114, 85, 'Abdul Rafiq', '01918893621', 'Nayani Bazar, Sherpur pourasabha, upazila-sherpur, district- shirpur', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-19 09:46:24', '2025-09-19 09:46:24'),
(115, 115, 86, 'মাসুদ রানা', '01799879787', 'ইমান্দপুর সাভার পৌরসভার সাভার ঢাকা', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-19 14:22:18', '2025-09-19 14:22:18'),
(116, 116, 87, 'Shuvro Deb', '01738476803', 'Hazari community Center, nabiganj, Habiganj', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-19 15:13:00', '2025-09-19 15:13:00'),
(117, 117, 88, 'জীবন', '01716762700', 'চট্টগ্রাম,আনোয়ারা,শোলকাটা।', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-19 17:43:36', '2025-09-19 17:43:36'),
(118, 118, 89, 'MAHEEN Hossain', '01711771566', 'House 68 Road 7 Radhavallave Rangpur city Rangpur', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-21 17:34:28', '2025-09-21 17:34:28'),
(119, 119, 90, 'Osman', '01926088836', 'চট্টগ্রাম, হাটহাজারী,,ফতেয়াবাদ বড়দিঘীর পাড়', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-21 19:36:52', '2025-09-21 19:36:52'),
(120, 120, 90, 'Osman', '01926088836', 'চট্টগ্রাম, হাটহাজারী,,ফতেয়াবাদ বড়দিঘীর পাড়', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-21 19:36:53', '2025-09-21 19:36:53'),
(121, 121, 91, 'পৃথিশ সরকার', '01337415754', 'Hobogong.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-22 03:24:39', '2025-09-22 03:24:39'),
(122, 122, 92, 'BADRUL HUSSAIN', '01812410726', 'বাসা-তাহিরপুর থানা কম্পাউন্ডার এর ভিতর, তাহিরপুর থানা, সুনামগঞ্জ জেলা।', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-22 21:07:22', '2025-09-22 21:07:22'),
(123, 123, 93, 'মাহমুদ', '01308110309', 'জেলা,দিনাজপুর থানা,সদর   কমলপুর', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-23 06:28:14', '2025-09-23 10:17:28'),
(124, 124, 94, 'Mesbahul alam', '01676556219', 'Pulum bazer Shalikha,Magura.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-24 04:33:57', '2025-09-24 04:33:57'),
(125, 125, 94, 'Mesbahul alam', '01676556219', 'Pulum bazer Shalikha,Magura.', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-24 04:33:58', '2025-09-24 04:33:58'),
(126, 126, 95, 'পৃথিশ সরকার', '01829746444', 'Ajmaregong', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-24 18:04:07', '2025-09-24 18:04:07'),
(127, 127, 96, 'Nayan', '01612222663', 'আলীগঞ্জ, নারায়ণগঞ্জ', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-25 14:04:28', '2025-09-25 14:04:28'),
(128, 128, 96, 'Nayan', '01612222663', 'আলীগঞ্জ, নারায়ণগঞ্জ', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-25 14:05:56', '2025-09-25 14:05:56'),
(129, 129, 97, 'Niranjan Mallick', '01715797422', 'Plot# 136, Block# B, Bashundhara riverview, Hasnabad, Dhaka-1311', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-25 19:05:26', '2025-09-25 19:05:26'),
(130, 130, 98, 'Mamun islam', '01952202830', 'Mukti masjid, Pagar, Pathan para, Tongi, Gazipur', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-25 22:26:25', '2025-09-27 10:47:21'),
(131, 131, 99, 'Limon', '01605670208', 'Tongi borobari akkach market pm ar basar pase carton factory ar more', 'ঢাকার ভিতরে ৭০ টাকা', '2025-09-26 16:49:37', '2025-09-26 16:49:37'),
(132, 132, 100, 'ইসমাইল', '01971775751', 'কাঠের পূল ফতুল্লা নারায়ণগঞ্জ', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-27 05:46:09', '2025-09-27 11:52:24'),
(133, 133, 101, 'Md Alomgir', '01772751795', 'Barakhandi,kamarkhando,Sirajganj', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-09-29 08:04:17', '2025-09-29 08:04:17'),
(134, 134, 102, 'সাজ্জাদ', '01753573639', 'ঢাকা, সাভার, সাভার', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-09-30 18:24:45', '2025-09-30 18:24:45'),
(135, 135, 103, 'Sakib', '01834426270', 'Bhar jagna Madina masjid chattagram', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-10-01 20:33:17', '2025-10-01 20:33:17'),
(136, 136, 104, 'Shahidullah Rakib', '01711272520', 'Road-4, Block-A,House-141, Banani', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-04 05:42:07', '2025-10-04 05:42:07'),
(137, 137, 105, 'মোঃ রনি আহম্মেদ', '01729624364', 'জেলা, কুষ্টিয়া, থান,ভেড়ামারা, পারসেল নিব চন্ডিপুর চন্দোনা ব্রিজ', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-05 11:03:58', '2025-10-05 11:03:58'),
(138, 138, 106, 'MD. ARMAN ISLAM', '01838759405', 'Khondkar para board school, Maijdee court, Noakhali -3800', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-06 07:54:46', '2025-10-06 07:54:46'),
(139, 139, 107, 'সোহাগ', '01644439534', 'রায়েৱ. বাজার, মোহাম্মদপুর,ডেন্টাল রোড 19 গোলি ঢাকা', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-06 07:55:43', '2025-10-06 07:55:43'),
(140, 140, 108, 'মো: নাহিদ সরকার', '01304934633', 'জেলা,, গাজীপুর,, উপজেলা,,, শ্রীপুর,,গড়গড়িয়া মাস্টার বাড়ি, ফখরুদ্দিন টেক্সটাইল মিলস লিমিটেড', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-10-06 18:03:10', '2025-10-06 18:03:10'),
(141, 141, 109, 'নুরনবী', '01829218451', 'গাজীপুর কোনাবাড়ি পিয়ারা বাগান নজরুল মার্কেট', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-07 03:39:37', '2025-10-07 03:39:37'),
(142, 142, 110, 'মোঃ শরিফুল ইসলাম', '01863698472', 'সাভার হেমায়েতপুর তেতুলঝোড়া মোড় পারটেক্স সংলগ্ন', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-07 15:13:46', '2025-10-07 15:13:46'),
(143, 143, 111, 'পলক.. বাংলা হিলি হাকিমপুর দিনাজপুর', '01828741274', 'Bangla hilly hakimpur Dinajpur', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-07 15:49:42', '2025-10-07 15:49:42'),
(144, 144, 112, 'polok', '01828741271', 'Bangla hili hakimpur Dinajpur', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-07 15:53:50', '2025-10-07 15:53:50'),
(145, 145, 113, 'Dipta Barua', '01824340687', 'Chittagong City, Askardighi Kacha Bazar. Amrito Toru', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-07 19:59:42', '2025-10-07 19:59:42'),
(146, 146, 114, 'Md Imran Hossain', '01883749464', 'চকবাজার ইউনিয়ন লক্ষীপুর থানা দোয়ারাবাজার জেলা সুনামগঞ্জ', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-08 04:09:45', '2025-10-08 04:09:45'),
(147, 147, 115, 'Md Hamim shek', '01752626580', 'Dhamrai serampore shuti para', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-10 18:53:30', '2025-10-10 18:53:30'),
(148, 148, 115, 'Md Hamim shek', '01752626580', 'Dhamrai serampore shuti para', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-10 18:53:31', '2025-10-10 18:53:31'),
(149, 149, 116, 'মো: মনজুরুল ইসলাম', '01738449544', 'লালমনিরহাট,  হাতীবান্ধা , হাতীবান্ধা', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-11 10:26:00', '2025-10-11 10:26:00'),
(150, 150, 117, 'মোঃ ইমন গাজী', '01872441406', 'চট্টগ্রাম, পটিয়া থানা,পাইকপাড়া মসজিদ', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-12 16:47:40', '2025-10-12 16:47:40'),
(151, 151, 118, 'Shohag', '01732149977', 'Vill: niscintaput  post: atuajangal. Thana: haluaghat dist: Mymensingh', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-13 12:25:54', '2025-10-13 12:25:54'),
(152, 152, 119, 'মো রাসেল', '01944626156', 'জেলা কুড়িগ্রাম উপজেলা রৌমারী থানা রৌমারী পৌরসভা রৌমারী', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-13 17:17:49', '2025-10-13 17:17:49'),
(153, 153, 120, 'Mobarak hosen', '01728147004', 'নামা রাথুরা প্রাইমারি স্কুলের সামনে তিন রাস্তার মোর,মোক্তাতারপুর ইউনিয়ন পরিষদের সামনে রাস্তা, তারাগন্জ,কালীগন্জ, গাজীপুর', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-10-14 01:23:20', '2025-10-14 01:23:20'),
(154, 154, 121, 'Md alomgir hossen alomgir hossen', '01712751165', 'পাবনা মনোহরপুর', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(155, 155, 121, 'Md alomgir hossen alomgir hossen', '01712751165', 'পাবনা মনোহরপুর', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-14 21:32:44', '2025-10-14 21:32:44'),
(156, 156, 121, 'Md alomgir hossen alomgir hossen', '01712751165', 'পাবনা সদর মনোহরপুর', 'ঢাকার বাহিরে  ১৫০ টাকা', '2025-10-15 09:22:57', '2025-10-15 09:22:57'),
(157, 157, 122, 'JAHID HASAN', '01812384855', 'Dardaria,Kapasia,Gazipur', 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', '2025-10-21 03:22:10', '2025-10-21 03:22:10'),
(158, 158, 123, 'Arza Mart', '01820025641', 'ভোলা সদর, আবহাওয়া অফিষ রোড।', 'ঢাকার ভিতরে ৭০ টাকা', '2025-10-23 15:30:50', '2025-10-23 15:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `name`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ঢাকার ভিতরে ৭০ টাকা', 70, '1', '2023-08-04 10:34:54', '2023-08-18 19:51:03'),
(2, 'ঢাকা সাব এরিয়া (সাভার, গাজীপুর, নারায়ণগঞ্জ, কেরানীগঞ্জ) ১২০', 120, '1', '2023-08-04 10:35:57', '2025-08-31 22:19:38'),
(3, 'ঢাকার বাহিরে  ১৫০ টাকা', 150, '1', '2025-08-25 08:23:11', '2025-08-31 22:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `sizeName` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `sizeName`, `status`, `created_at`, `updated_at`) VALUES
(6, 'S', '1', '2024-02-05 09:38:42', '2024-02-05 09:38:42'),
(7, 'M', '1', '2024-02-05 09:38:46', '2024-02-05 09:38:46'),
(8, 'L', '1', '2024-02-05 09:38:51', '2024-02-05 09:38:51'),
(9, 'XL', '1', '2024-02-05 09:38:57', '2024-02-05 09:38:57'),
(10, 'XXL', '1', '2024-02-05 09:39:03', '2024-02-05 09:39:03'),
(12, '28', '1', '2024-02-05 09:39:25', '2024-02-05 09:39:25'),
(13, '30', '1', '2024-02-05 09:39:30', '2024-02-05 09:39:30'),
(14, '32', '1', '2024-02-05 09:39:34', '2024-02-05 09:39:34'),
(15, '34', '1', '2024-02-05 09:39:39', '2024-02-05 09:39:39'),
(18, '36', '1', '2025-08-24 19:14:53', '2025-08-24 19:14:53'),
(19, '38', '1', '2025-08-24 19:14:57', '2025-08-24 19:14:57'),
(20, '4', '1', '2025-08-24 19:15:05', '2025-08-24 19:15:05'),
(21, '6', '1', '2025-08-24 19:15:09', '2025-08-24 19:15:09'),
(22, '8', '1', '2025-08-24 19:15:13', '2025-08-24 19:15:13'),
(23, '10', '1', '2025-08-24 19:15:19', '2025-08-24 19:15:19'),
(24, '12', '1', '2025-08-24 19:15:23', '2025-08-24 19:15:29'),
(25, '14', '1', '2025-08-24 19:15:34', '2025-08-24 19:15:34'),
(26, '16', '1', '2025-08-24 19:15:38', '2025-08-24 19:15:38'),
(27, '2', '1', '2025-08-24 19:15:43', '2025-08-24 19:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(99) DEFAULT NULL,
  `api_key` varchar(155) DEFAULT NULL,
  `serderid` varchar(155) DEFAULT NULL,
  `order` varchar(11) DEFAULT NULL,
  `forget_pass` varchar(11) DEFAULT NULL,
  `password_g` varchar(11) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `url`, `api_key`, `serderid`, `order`, `forget_pass`, `password_g`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://msg.elitbuzz-bd.com/smsapi', 'C200817461dd7a25cf3924.89247796', '+8801319911688', '1', '1', '1', '1', '2024-02-06 11:29:46', '2024-12-07 17:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `link` varchar(155) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `title`, `icon`, `link`, `color`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Facebook', 'fab fa-facebook-f', 'https://www.facebook.com/Arzamart', '#f78345', 1, '2023-02-12 11:32:20', '2025-08-20 07:09:45'),
(3, 'Official Mail', 'fab fa-google', 'arzamart6549@gmail.com', '#c53302', 1, '2023-02-14 03:29:41', '2025-08-20 07:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `subcategoryName` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `subcategoryName`, `slug`, `category_id`, `image`, `meta_title`, `meta_description`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Cargo Pant02', 'cargo-pant02', 14, NULL, 'Cargo Pant02', NULL, 1, '2025-08-25 08:13:06', '2025-08-25 08:13:06'),
(5, 'Cargo Pant01', 'cargo-pant01', 14, NULL, 'Cargo Pant01', NULL, 1, '2025-08-25 12:28:05', '2025-08-25 12:28:05'),
(6, 'KCP03', 'kcp03', 16, NULL, 'KCP03', NULL, 1, '2025-08-26 12:38:16', '2025-08-26 12:38:16'),
(7, 'Mens Pant01', 'mens-pant01', 14, NULL, NULL, NULL, 1, '2025-09-16 21:51:21', '2025-09-16 21:51:51'),
(8, 'PN01', 'pn01', 19, NULL, NULL, NULL, 1, '2025-09-18 21:25:42', '2025-09-18 21:25:42'),
(9, 'PN02', 'pn02', 19, NULL, NULL, NULL, 1, '2025-09-18 21:27:03', '2025-09-18 21:27:03'),
(10, 'PN03', 'pn03', 19, NULL, NULL, NULL, 1, '2025-09-18 21:27:13', '2025-09-18 21:27:13'),
(11, 'PN04', 'pn04', 19, NULL, NULL, NULL, 1, '2025-09-18 21:27:21', '2025-09-18 21:27:21'),
(12, 'PN05', 'pn05', 19, NULL, NULL, NULL, 1, '2025-09-18 21:27:29', '2025-09-18 21:27:29'),
(13, 'PN06', 'pn06', 19, NULL, NULL, NULL, 1, '2025-09-18 21:27:41', '2025-09-18 21:27:41'),
(14, 'PN07', 'pn07', 19, NULL, NULL, NULL, 1, '2025-09-18 21:27:50', '2025-09-18 21:27:50'),
(15, 'Cargo Pant 03', 'cargo-pant-03', 14, NULL, NULL, NULL, 1, '2025-09-26 15:16:38', '2025-09-26 15:16:38'),
(16, 'Cargo Pant 03 Combo', 'cargo-pant-03-combo', 14, NULL, NULL, NULL, 1, '2025-09-29 01:53:02', '2025-09-29 01:53:02'),
(17, 'Hudi 01', 'hudi-01', 20, NULL, NULL, '<p>Hoodie, hudi, sweatshirt , jacket ,&nbsp;</p>', 1, '2025-09-30 22:11:01', '2025-09-30 22:11:01');

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
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$R71A1F9aLFzOZ5t2ObvTmuiyO7Nv.QyT4ktHjtr2k6wp1H3/XjqE2', '5MckZlJloi4I5OqYlOuWzIBkAIQkGdA9CkM3O9N1zkWfounZ1TumkYhkYxe6', 'public/uploads/users/1755689336-ihnajsxbsbgjriakzf7fdq.webp', 1, '2023-01-11 06:33:08', '2025-08-20 11:28:56'),
(10, 'Titu', 'titu@arzamart.xyz', NULL, '$2y$10$bd/9h8LmpLGz.vtBOG6e9uz6nWdIPl5.l87xSYQ.g7mkvEHyxyvMm', 'rdnEgZTnK5IlqOdNTxewUSWfP1IncXquPmGnfGp3QVnzTrl2KLP3DWVuKrCk', 'public/uploads/users/1756051746-received_525839947012399.webp', 1, '2025-08-24 16:09:06', '2025-08-24 16:09:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_categories`
--
ALTER TABLE `banner_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns_products`
--
ALTER TABLE `campaigns_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaign_id` (`campaign_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Indexes for table `campaign_reviews`
--
ALTER TABLE `campaign_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courierapis`
--
ALTER TABLE `courierapis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_pages`
--
ALTER TABLE `create_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecom_pixels`
--
ALTER TABLE `ecom_pixels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_tag_managers`
--
ALTER TABLE `google_tag_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_blocks`
--
ALTER TABLE `ip_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

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
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `productcolors`
--
ALTER TABLE `productcolors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productsizes`
--
ALTER TABLE `productsizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
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
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `banner_categories`
--
ALTER TABLE `banner_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `campaigns_products`
--
ALTER TABLE `campaigns_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_reviews`
--
ALTER TABLE `campaign_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courierapis`
--
ALTER TABLE `courierapis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `create_pages`
--
ALTER TABLE `create_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `ecom_pixels`
--
ALTER TABLE `ecom_pixels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `google_tag_managers`
--
ALTER TABLE `google_tag_managers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `productcolors`
--
ALTER TABLE `productcolors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `productimages`
--
ALTER TABLE `productimages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `productsizes`
--
ALTER TABLE `productsizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- IMPORTANT: After importing this legacy dump, import database/phpmyadmin_production_upgrade.sql
-- to add the current production tables, POS fields, promotions, CRM, tracking and analytics schema.
