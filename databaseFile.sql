-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 09:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(11, 'Electronics', '2023-11-10 05:49:03', '2023-11-10 05:49:03'),
(12, 'Cosmetics', '2023-11-10 05:49:12', '2023-11-10 05:49:12'),
(13, 'Kitchen', '2023-11-10 05:50:21', '2023-11-10 05:50:21');

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
(5, '2023_11_09_053734_create_products_table', 2),
(6, '2023_11_09_053905_create_categories_table', 2),
(7, '2023_11_09_053934_create_orders_table', 2),
(8, '2023_11_09_054044_create_ratings_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userID`, `productID`, `address`, `status`, `created_at`, `updated_at`) VALUES
(36, 8, 5, '000000000000', 0, '2023-11-21 15:06:32', '2023-11-21 15:06:32'),
(53, 1, 11, '000000000000', 0, '2023-11-22 07:57:03', '2023-11-22 07:57:03'),
(54, 1, 8, '000000000000', 0, '2023-11-22 07:57:12', '2023-11-22 07:57:12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`userID` int(11)
,`username` varchar(255)
,`productID` int(11)
,`price` double(8,2)
,`name` varchar(255)
,`address` varchar(200)
,`status` int(11)
);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(36, 'App\\Models\\User', 1, 'mytoken', '60b3ffc63e53a961cb55bcab42a4d98f2e4d8d54d44b8afa720ce1f04b514814', '[\"*\"]', NULL, NULL, '2023-11-17 13:09:43', '2023-11-17 13:09:43'),
(37, 'App\\Models\\User', 1, 'mytoken', '7829d8308694c73d0436e0587a7c48fff07c2ed96dd7db763670a996be861a1f', '[\"*\"]', NULL, NULL, '2023-11-17 13:09:43', '2023-11-17 13:09:43'),
(38, 'App\\Models\\User', 1, 'mytoken', '01519ec0e9810bd1da969df1f2a603ff741570a280f1d25589b348d3a5f633ef', '[\"*\"]', NULL, NULL, '2023-11-17 13:10:07', '2023-11-17 13:10:07'),
(39, 'App\\Models\\User', 1, 'mytoken', '41683131a47f6df779ae995dddacd78ad9c2b772cdc26fd0d6742904a9b52285', '[\"*\"]', NULL, NULL, '2023-11-17 13:10:07', '2023-11-17 13:10:07'),
(40, 'App\\Models\\User', 1, 'mytoken', 'c7428398fa51d4307bf702afc42793661d6138a39bbbaf2762bdfeec64077e91', '[\"*\"]', NULL, NULL, '2023-11-17 13:10:15', '2023-11-17 13:10:15'),
(41, 'App\\Models\\User', 1, 'mytoken', '3b98fa3d124cb81b8a44b431f65f7d10b8781782de95ab3efcd55706df5281cf', '[\"*\"]', NULL, NULL, '2023-11-17 13:10:16', '2023-11-17 13:10:16'),
(42, 'App\\Models\\User', 4, 'mytoken', 'd8c2cf8a00826de4bb4253e9da2ead7f32b15366528384146566c1bbd20f710f', '[\"*\"]', NULL, NULL, '2023-11-17 13:21:15', '2023-11-17 13:21:15'),
(43, 'App\\Models\\User', 5, 'mytoken', 'ea8e91bbc7e2f0500f5ddde16f49267145caa55565b2329978271906d5db2ea8', '[\"*\"]', NULL, NULL, '2023-11-17 13:23:54', '2023-11-17 13:23:54'),
(44, 'App\\Models\\User', 6, 'mytoken', '88ec7eb38fb7af377a6926d24e48f8ca465028e841b2dd4673e7efae3cfc29b6', '[\"*\"]', NULL, NULL, '2023-11-17 13:52:06', '2023-11-17 13:52:06'),
(45, 'App\\Models\\User', 1, 'mytoken', '41f9349011be8cf90be8f9829d5080ab6ec48fd1e08e5fe21cd7c784c7ab9fa7', '[\"*\"]', NULL, NULL, '2023-11-17 13:53:50', '2023-11-17 13:53:50'),
(46, 'App\\Models\\User', 1, 'mytoken', 'd4b999b74e8e969539be97bfa699a9093f5e9b1b772b8f4962e25143db37802a', '[\"*\"]', NULL, NULL, '2023-11-17 13:55:04', '2023-11-17 13:55:04'),
(47, 'App\\Models\\User', 1, 'mytoken', 'bd51ead8543d1276ad9bba21297fc83a9d56bb4e51079dba64158a2297850b09', '[\"*\"]', NULL, NULL, '2023-11-17 13:55:04', '2023-11-17 13:55:04'),
(48, 'App\\Models\\User', 1, 'mytoken', '6f51794bd4b12bfdc8db5c825b514acd8b9d215a1e05588f869f4fd790e25dd8', '[\"*\"]', NULL, NULL, '2023-11-17 14:00:51', '2023-11-17 14:00:51'),
(49, 'App\\Models\\User', 1, 'mytoken', '81542922eaab78d6cee2a1204015903fe1178c8b94329bf83de9ee1894527f99', '[\"*\"]', NULL, NULL, '2023-11-17 14:00:51', '2023-11-17 14:00:51'),
(50, 'App\\Models\\User', 1, 'mytoken', '7c26481a1a759954e6511522393872369b975b1d030a0ef7dc6937d1af1e80ef', '[\"*\"]', NULL, NULL, '2023-11-17 14:01:14', '2023-11-17 14:01:14'),
(51, 'App\\Models\\User', 1, 'mytoken', '319dc9582c1b1b8002c32de3c7cf2534eab88eb3ea550481d0ced85d5885eeaf', '[\"*\"]', NULL, NULL, '2023-11-17 14:01:14', '2023-11-17 14:01:14'),
(52, 'App\\Models\\User', 1, 'mytoken', '8f9dc7b8c0e5d6877d3a6da175a99ac1bcfcce87b99130ff0bdcdcb0b8cf317d', '[\"*\"]', NULL, NULL, '2023-11-17 14:01:24', '2023-11-17 14:01:24'),
(53, 'App\\Models\\User', 1, 'mytoken', '4b3a66db5fd7cd32adc48e30083c83e1d59179e63b8f35b9fd9dbd59bfde0c9b', '[\"*\"]', NULL, NULL, '2023-11-17 14:01:31', '2023-11-17 14:01:31'),
(54, 'App\\Models\\User', 1, 'mytoken', '81a17e567760869a81b0e81477bf5dcaab8aa5e150e3156fd16c800180d78196', '[\"*\"]', NULL, NULL, '2023-11-17 14:01:32', '2023-11-17 14:01:32'),
(55, 'App\\Models\\User', 1, 'mytoken', '6979d88b3bd992d98fe55e443cda912a24cd5f74bd1398680a1e532b3daba6c1', '[\"*\"]', NULL, NULL, '2023-11-17 14:01:38', '2023-11-17 14:01:38'),
(56, 'App\\Models\\User', 1, 'mytoken', 'bc4e6f3c0c6c8bfe1d27d7d9bcbb61e6c128525061cb3885c64b65f29877125c', '[\"*\"]', NULL, NULL, '2023-11-17 14:02:17', '2023-11-17 14:02:17'),
(57, 'App\\Models\\User', 1, 'mytoken', '7c2a0f7811426e21063faba817528bf44b6a7beb4c507799a21ba31b56122b5a', '[\"*\"]', NULL, NULL, '2023-11-17 14:02:49', '2023-11-17 14:02:49'),
(58, 'App\\Models\\User', 1, 'mytoken', 'a5815bf973cbc454882a9dc320c550eb769e2820e5e1b14753cb09571f38fe54', '[\"*\"]', NULL, NULL, '2023-11-17 14:02:49', '2023-11-17 14:02:49'),
(59, 'App\\Models\\User', 1, 'mytoken', '03f5e5bc9c888d58b480bcd014c2e84375c47ac70aa9953fa7d382726209101c', '[\"*\"]', NULL, NULL, '2023-11-17 14:03:13', '2023-11-17 14:03:13'),
(60, 'App\\Models\\User', 1, 'mytoken', 'f6f49a0402fc9051c599b92e0056fe751798ea92d28fd786ef230283346093b4', '[\"*\"]', NULL, NULL, '2023-11-17 14:03:13', '2023-11-17 14:03:13'),
(61, 'App\\Models\\User', 1, 'mytoken', '54cad9c0e01588703fce3a1017f91edd12521898303544a74a5929f5a73feb4e', '[\"*\"]', NULL, NULL, '2023-11-17 14:03:35', '2023-11-17 14:03:35'),
(62, 'App\\Models\\User', 1, 'mytoken', '39b9061146b04318899128e41a698e180e52febfd7fe9c5b198a9d0ad96ca575', '[\"*\"]', NULL, NULL, '2023-11-17 14:03:35', '2023-11-17 14:03:35'),
(63, 'App\\Models\\User', 1, 'mytoken', 'edcf18fa763b19d278c04153d2e257b48469ae6290a1b9f8919b27d342e8c74d', '[\"*\"]', NULL, NULL, '2023-11-17 14:04:35', '2023-11-17 14:04:35'),
(64, 'App\\Models\\User', 1, 'mytoken', '25cc68a66e4ff4f75bcb0b4f2b11aacaa0738e2ea6cac6514943ba7957565448', '[\"*\"]', NULL, NULL, '2023-11-17 14:04:35', '2023-11-17 14:04:35'),
(65, 'App\\Models\\User', 7, 'mytoken', '9c4cdee2fec65c5dbbb2873aa5df65fb9dfd5905ef27164df6443f4599e2f3e2', '[\"*\"]', NULL, NULL, '2023-11-17 15:22:03', '2023-11-17 15:22:03'),
(66, 'App\\Models\\User', 7, 'mytoken', '60f648973e5f04cc2d2cabd767712f4e12361fc23d66e6cf9a9710c12459fb6f', '[\"*\"]', NULL, NULL, '2023-11-17 15:22:40', '2023-11-17 15:22:40'),
(67, 'App\\Models\\User', 7, 'mytoken', '6ff20700cf66f6c7a9d55b7f853e4cb048cb9883385dfe035cca85f098cd58ad', '[\"*\"]', NULL, NULL, '2023-11-17 15:22:40', '2023-11-17 15:22:40'),
(68, 'App\\Models\\User', 7, 'mytoken', '29b47b1d22f9d346c59939568011ed4054c637287495301064d116b0b39bbae5', '[\"*\"]', NULL, NULL, '2023-11-17 15:22:51', '2023-11-17 15:22:51'),
(69, 'App\\Models\\User', 7, 'mytoken', 'aa033b39dc7ff6fbed7fbc9671f8a885da5c85b700005aa202a8fe2bf107247c', '[\"*\"]', NULL, NULL, '2023-11-17 15:22:51', '2023-11-17 15:22:51'),
(70, 'App\\Models\\User', 7, 'mytoken', 'add87c1af1f820b21a8fb52e5293e8f8f4579217b721932e0553a7a19db8bd9f', '[\"*\"]', NULL, NULL, '2023-11-17 15:24:15', '2023-11-17 15:24:15'),
(71, 'App\\Models\\User', 7, 'mytoken', '7242afe8de133427c41a102b40ad7484c118da977b0884af38cd8f3d382e6867', '[\"*\"]', NULL, NULL, '2023-11-17 15:24:15', '2023-11-17 15:24:15'),
(72, 'App\\Models\\User', 7, 'mytoken', '5d6b38ab307f895f0ac322c24df02080b2f30f4afb2c49c9dab2217ca2e403ba', '[\"*\"]', NULL, NULL, '2023-11-17 15:24:30', '2023-11-17 15:24:30'),
(73, 'App\\Models\\User', 7, 'mytoken', '5ed2e7eb60142c779fdde1e9fed71841690838d8e8d9defbd2236e7ecde01245', '[\"*\"]', NULL, NULL, '2023-11-17 15:24:31', '2023-11-17 15:24:31'),
(74, 'App\\Models\\User', 7, 'mytoken', 'c644c5570f96841c6c29404502e726601e0dd1dd991cfb0d31c886e2e6ec0bb7', '[\"*\"]', NULL, NULL, '2023-11-17 15:26:43', '2023-11-17 15:26:43'),
(75, 'App\\Models\\User', 7, 'mytoken', 'f6e71c97f099470b83fa241fe8709e6c425f630192a01fabab3ffe4ce151771d', '[\"*\"]', NULL, NULL, '2023-11-17 15:26:43', '2023-11-17 15:26:43'),
(76, 'App\\Models\\User', 1, 'mytoken', '2f293741ac3ba717161ce843368989fc0b8a5a02a67f9a67bebc89a78b3089d8', '[\"*\"]', NULL, NULL, '2023-11-17 15:27:02', '2023-11-17 15:27:02'),
(77, 'App\\Models\\User', 1, 'mytoken', 'bbb7fbdbd99fa670679ee94b10468ce2eedd5578824f9915c6775998e09c1489', '[\"*\"]', NULL, NULL, '2023-11-17 15:27:02', '2023-11-17 15:27:02'),
(78, 'App\\Models\\User', 1, 'mytoken', '3a6b6c966078c9c7ccb8bd81908f3524a0a35bf51dfe916b846e069b63640ad2', '[\"*\"]', NULL, NULL, '2023-11-17 15:27:30', '2023-11-17 15:27:30'),
(79, 'App\\Models\\User', 1, 'mytoken', '90bde5130d364a166634f29e255ac71ed78c3e4a6bdb0c435a96658f96e9a2e0', '[\"*\"]', NULL, NULL, '2023-11-17 15:27:30', '2023-11-17 15:27:30'),
(80, 'App\\Models\\User', 1, 'mytoken', 'ce133837601abb99a81fa19380955441c972fda2c76c9b5c9ae33f339adb39e7', '[\"*\"]', NULL, NULL, '2023-11-17 15:28:00', '2023-11-17 15:28:00'),
(81, 'App\\Models\\User', 1, 'mytoken', 'e9dfcad2fc2766263accde47f6444634312bb123e782b877fbbb6d49950ffb3d', '[\"*\"]', NULL, NULL, '2023-11-17 15:28:00', '2023-11-17 15:28:00'),
(82, 'App\\Models\\User', 7, 'mytoken', '06bc5a45ec7496dbc5495a0e82f3e91bac494e1935082a146671453aee81e66d', '[\"*\"]', NULL, NULL, '2023-11-17 15:28:11', '2023-11-17 15:28:11'),
(83, 'App\\Models\\User', 7, 'mytoken', '6099508fbc4a0713b7d9d45021494b272ded1e65c116e18dd1f4bcca4c07f6b9', '[\"*\"]', NULL, NULL, '2023-11-17 15:28:11', '2023-11-17 15:28:11'),
(84, 'App\\Models\\User', 7, 'mytoken', 'e76f43980596c7b21eec774c1541f1ea6854cd4736d3e9ba37cd68f07057d315', '[\"*\"]', NULL, NULL, '2023-11-17 15:29:47', '2023-11-17 15:29:47'),
(85, 'App\\Models\\User', 7, 'mytoken', '5d7b639fa24bb66947432622f251d017da3c55f4674a2b177911aa5f6b1cf686', '[\"*\"]', NULL, NULL, '2023-11-17 15:29:47', '2023-11-17 15:29:47'),
(86, 'App\\Models\\User', 7, 'mytoken', 'd4e1d29410ee4c74dff064ed667d107b2b2c6386b02badc6c72fdcc65d555f53', '[\"*\"]', NULL, NULL, '2023-11-17 15:30:48', '2023-11-17 15:30:48'),
(87, 'App\\Models\\User', 7, 'mytoken', 'c9e4fc945fa91914d30ae74d78b44671a6c6f20390a6078d77a058e9ae7149db', '[\"*\"]', NULL, NULL, '2023-11-17 15:30:48', '2023-11-17 15:30:48'),
(88, 'App\\Models\\User', 7, 'mytoken', '4632b26d199ada65a0beaefc6ccebb66d486af25a366fc5fc7f7f562cd1a49e3', '[\"*\"]', NULL, NULL, '2023-11-17 15:30:58', '2023-11-17 15:30:58'),
(89, 'App\\Models\\User', 7, 'mytoken', '001f46cef68d8154efd9cd9828b39f42b3d7e81755eb916e8325d3c84a44a160', '[\"*\"]', NULL, NULL, '2023-11-17 15:30:58', '2023-11-17 15:30:58'),
(90, 'App\\Models\\User', 1, 'mytoken', '2081a0c36e97883700a7dba001d0a6e7809b041b602e5ab2341aa6a4173f9a03', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:09', '2023-11-17 15:31:09'),
(91, 'App\\Models\\User', 1, 'mytoken', '4c4d4b6975edb4216b7a1d5c90453eb2bf2d93636842a88c4b680420a2ce55ea', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:09', '2023-11-17 15:31:09'),
(92, 'App\\Models\\User', 1, 'mytoken', '88e7a412faf18e59353578adfa7be197a26fef737f00ae000a2fc9dbf2d9e182', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:32', '2023-11-17 15:31:32'),
(93, 'App\\Models\\User', 1, 'mytoken', '39a3af44444b63f0c2bee1d69e64da3e67dbf2b1092f8b67a9c200279be1c56c', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:32', '2023-11-17 15:31:32'),
(94, 'App\\Models\\User', 1, 'mytoken', '88b856fed75071583ae772ee6599df9f17e84739d712799fd4c6c14542d8bf8d', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:40', '2023-11-17 15:31:40'),
(95, 'App\\Models\\User', 1, 'mytoken', '65cf48ff0ac34cf11f639a492a21ff31b3c2836563406b22b11241e214901b14', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:40', '2023-11-17 15:31:40'),
(96, 'App\\Models\\User', 1, 'mytoken', 'cc1ad7364a574806a736fb00516d780e11ec4155b167e599e680a463f6ff125b', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:49', '2023-11-17 15:31:49'),
(97, 'App\\Models\\User', 1, 'mytoken', 'e31194f7500ccdc0991942a2e466281f3d0aa12ec97be231ce1ace65228c8678', '[\"*\"]', NULL, NULL, '2023-11-17 15:31:49', '2023-11-17 15:31:49'),
(98, 'App\\Models\\User', 1, 'mytoken', '1f617c07b7bd8c2972fa1ea5d111fd7551ea9001d3651363f5ce430934bca025', '[\"*\"]', NULL, NULL, '2023-11-17 15:33:27', '2023-11-17 15:33:27'),
(99, 'App\\Models\\User', 1, 'mytoken', '884e8600dd897abb1fa9a2ac2064110c2d50cf6b95ff74a02cd8a3c30e72afea', '[\"*\"]', NULL, NULL, '2023-11-17 15:33:27', '2023-11-17 15:33:27'),
(100, 'App\\Models\\User', 1, 'mytoken', 'dc7355614e9a14c3dba65b907caf1d69666f1f3b06c1f6077320841edb11d281', '[\"*\"]', NULL, NULL, '2023-11-17 15:33:35', '2023-11-17 15:33:35'),
(101, 'App\\Models\\User', 1, 'mytoken', '9d5432609341bad032cbe270edb51276f11386900be7c5d61db3c095f9d1e8b8', '[\"*\"]', NULL, NULL, '2023-11-17 15:33:35', '2023-11-17 15:33:35'),
(102, 'App\\Models\\User', 1, 'mytoken', '7a56cb4ffc2268a6a85e284dbd72b16a7f6d913d1a0b0f1ee25bd156441447ee', '[\"*\"]', NULL, NULL, '2023-11-17 15:34:02', '2023-11-17 15:34:02'),
(103, 'App\\Models\\User', 1, 'mytoken', 'dda4e4eb13c412e48bcdb04ce0ed965feb6ab8aed64b69a3460b2897b41a31fc', '[\"*\"]', NULL, NULL, '2023-11-17 15:34:02', '2023-11-17 15:34:02'),
(104, 'App\\Models\\User', 1, 'mytoken', 'f2eae99ed91d15c1e996c5abb9a7e067f5c78b7f22fccf570c7a81ef22f9fb79', '[\"*\"]', NULL, NULL, '2023-11-17 15:34:19', '2023-11-17 15:34:19'),
(105, 'App\\Models\\User', 1, 'mytoken', '304f6e14aa09a9c8e5fcea0c31d0449dec0efab10bdae0cd5182e2227e1fb807', '[\"*\"]', NULL, NULL, '2023-11-17 15:34:19', '2023-11-17 15:34:19'),
(106, 'App\\Models\\User', 1, 'mytoken', 'b78885d0398799c0a53300eac0da395bb9c0202ba3c104ddc37d5b0ab2ef5859', '[\"*\"]', NULL, NULL, '2023-11-17 15:34:58', '2023-11-17 15:34:58'),
(107, 'App\\Models\\User', 1, 'mytoken', 'b2a79eb50938f7eb4177fdbda359caed4bb6583f337f4c254f9be181926c009f', '[\"*\"]', NULL, NULL, '2023-11-17 15:34:58', '2023-11-17 15:34:58'),
(108, 'App\\Models\\User', 1, 'mytoken', '3efea336f4fa7b3873d6b95d300e77bddedf109efd39850e1350fc4a41719eb3', '[\"*\"]', NULL, NULL, '2023-11-17 15:35:08', '2023-11-17 15:35:08'),
(109, 'App\\Models\\User', 1, 'mytoken', '60782711b238ed8241987f6c24465709bfab7f65faec1bef6abd729adfb59d5d', '[\"*\"]', NULL, NULL, '2023-11-17 15:35:08', '2023-11-17 15:35:08'),
(110, 'App\\Models\\User', 1, 'mytoken', 'e8974e66e838f6ddd6d274bfca7777d440977fd55ea08dd977b0eb05ba984415', '[\"*\"]', NULL, NULL, '2023-11-17 15:35:21', '2023-11-17 15:35:21'),
(111, 'App\\Models\\User', 1, 'mytoken', '75f1098937ee34c88d3bf471d6adc274ba19e0982400305783f3c3079aefbf7f', '[\"*\"]', NULL, NULL, '2023-11-17 15:35:21', '2023-11-17 15:35:21'),
(112, 'App\\Models\\User', 1, 'mytoken', 'fb3b4f9ce0cd4bf65c9809cb0c7611f1b261d9fadd0c93c22abf5f3a40492c97', '[\"*\"]', NULL, NULL, '2023-11-17 15:35:54', '2023-11-17 15:35:54'),
(113, 'App\\Models\\User', 1, 'mytoken', '9cf4ae7f5e2b82988f4c1b39ebe6ccb0b4599e0276759b68b1dae74d8e0f400b', '[\"*\"]', NULL, NULL, '2023-11-17 15:35:55', '2023-11-17 15:35:55'),
(114, 'App\\Models\\User', 1, 'mytoken', 'ec87af8e09635d66cbbc3f912a3fc9f50044e012f67cbe72b37dbe58e1dcc5dc', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:09', '2023-11-17 15:36:09'),
(115, 'App\\Models\\User', 1, 'mytoken', '2560e164be3a1f9cb58aa00a0ac284b1c3f698122e4ddc74c1e933f726be61d9', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:09', '2023-11-17 15:36:09'),
(116, 'App\\Models\\User', 1, 'mytoken', 'fb5f1d40d3cc0bc08957663572d00641ee6b667e2b875e4217ea1ba6893707f0', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:12', '2023-11-17 15:36:12'),
(117, 'App\\Models\\User', 1, 'mytoken', 'deaba494cc559fcc66b6484634bd29a9bb6526e8783542e702de6c996c2eed85', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:12', '2023-11-17 15:36:12'),
(118, 'App\\Models\\User', 1, 'mytoken', 'd71bb9822252c2953bc0c9d5bbc2cbfb9543983b9f90e280f547e2389b040627', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:13', '2023-11-17 15:36:13'),
(119, 'App\\Models\\User', 1, 'mytoken', '4efd1adcc4448134f6547c22e9b23ad9865c7b6beef6a389e40dc5efb2a57e6d', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:13', '2023-11-17 15:36:13'),
(120, 'App\\Models\\User', 1, 'mytoken', '9d9f55040327fa3303bc01b2f6e50e2ecba25c70bead38d3aec8f115f5f081f2', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:14', '2023-11-17 15:36:14'),
(121, 'App\\Models\\User', 1, 'mytoken', '7f1f0948f704465d8a841d7bc53f1948c89fb58367abca741f5b0b0ce4a83ea6', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:14', '2023-11-17 15:36:14'),
(122, 'App\\Models\\User', 1, 'mytoken', '26ab2943b36b497c2f9c2ac0723c75709a60dc212fa24c7923a14dad202ec4a7', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:15', '2023-11-17 15:36:15'),
(123, 'App\\Models\\User', 1, 'mytoken', '23a65fe8ca03ce690aab62490810aef5f4c1b9012a9086b27d9e6045f1bd09f0', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:15', '2023-11-17 15:36:15'),
(124, 'App\\Models\\User', 1, 'mytoken', '2ecbae626ddbc84cc6e6d54c926f8f79d715a0b0bf74e43ba91d95578e8fbba2', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:16', '2023-11-17 15:36:16'),
(125, 'App\\Models\\User', 1, 'mytoken', '4b249db81e640438e4bff4e1715762ab91840bf33e83a0d8ea9e3aa8034365ba', '[\"*\"]', NULL, NULL, '2023-11-17 15:36:16', '2023-11-17 15:36:16'),
(126, 'App\\Models\\User', 1, 'mytoken', 'bd3ae95c1b2cddf3fa1fb277ef4357be339ed6e1a46e4c7d5fe7549166174dec', '[\"*\"]', NULL, NULL, '2023-11-17 15:39:03', '2023-11-17 15:39:03'),
(127, 'App\\Models\\User', 1, 'mytoken', 'cc34859947f3be1eddbaba15d72eafd274b863e0f91b4243a8232ecbf7b5a6f2', '[\"*\"]', NULL, NULL, '2023-11-17 15:39:03', '2023-11-17 15:39:03'),
(128, 'App\\Models\\User', 1, 'mytoken', 'b5caaccdd39b07aa1e2ce47e300590749f52894dd2afef99feed7e5a4ec9439d', '[\"*\"]', NULL, NULL, '2023-11-17 15:39:26', '2023-11-17 15:39:26'),
(129, 'App\\Models\\User', 1, 'mytoken', 'eb0c2cd430595281ee503ae4f38fd4c418771ad88311bb508f44c22569e87b43', '[\"*\"]', NULL, NULL, '2023-11-17 15:39:26', '2023-11-17 15:39:26'),
(130, 'App\\Models\\User', 1, 'mytoken', '91f9bef9a25b0b502e18818be535b383096b288c08b0bdebbe2d49a975e512d1', '[\"*\"]', NULL, NULL, '2023-11-17 15:39:48', '2023-11-17 15:39:48'),
(131, 'App\\Models\\User', 1, 'mytoken', '9e3b48ebf3b7bdcdad32fd92a6061882b41940fa914525a084a7c2eec3574a8e', '[\"*\"]', NULL, NULL, '2023-11-17 15:39:48', '2023-11-17 15:39:48'),
(132, 'App\\Models\\User', 1, 'mytoken', '86fc115ac86addffdf55130d8bb94aa7389ab8a3912dd0483b8f31faebdea1fa', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:07', '2023-11-17 15:41:07'),
(133, 'App\\Models\\User', 1, 'mytoken', 'ce29143b79678db0ae6d53a4e07a21343b86d10b7c00cf2da06273df2e43c36b', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:07', '2023-11-17 15:41:07'),
(134, 'App\\Models\\User', 1, 'mytoken', 'e665bc8a5e23719600ce8b86db719ee1687535dda736b488e290bc57fccdb279', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:30', '2023-11-17 15:41:30'),
(135, 'App\\Models\\User', 1, 'mytoken', 'a4805950d6194add1bb6b42bba4c8bfc6e17af216ac895b05c85a7075c1cf772', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:30', '2023-11-17 15:41:30'),
(136, 'App\\Models\\User', 1, 'mytoken', '70a77eb759af7904dee49b9ad58750af1ef689399c98a1149e94870e02d211b0', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:45', '2023-11-17 15:41:45'),
(137, 'App\\Models\\User', 1, 'mytoken', '01af5ec2dfc8633bc55346c39446a901347e4e712d6be6a2fed5800b7816732a', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:46', '2023-11-17 15:41:46'),
(138, 'App\\Models\\User', 1, 'mytoken', '347478eb1301aca10a6c817f1d076cd4d473c171d8efd1c9fadf55e8d5a6120e', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:48', '2023-11-17 15:41:48'),
(139, 'App\\Models\\User', 1, 'mytoken', '434c23a631a94172b13a5d0c78410d4f20e9db46aa8e045e5b798d533185dba2', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:48', '2023-11-17 15:41:48'),
(140, 'App\\Models\\User', 1, 'mytoken', 'd927569f029c04e5b1a92d543997307346a019741d76a7ee0c4cc6b8c6325953', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:49', '2023-11-17 15:41:49'),
(141, 'App\\Models\\User', 1, 'mytoken', '491e63a53d935c6a9b87e8ed2c7612b7443150c7e09dfa3668ab5430a53b6eac', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:49', '2023-11-17 15:41:49'),
(142, 'App\\Models\\User', 1, 'mytoken', 'b49b30f3809fc354ece36a0676cd6b13532aa7cdf7570655bfa8281c5e9d9ce6', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:50', '2023-11-17 15:41:50'),
(143, 'App\\Models\\User', 1, 'mytoken', '5fe96fb74dbaacc59cf9986574921abdd30369d97262801eb3c41cc295edea66', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:50', '2023-11-17 15:41:50'),
(144, 'App\\Models\\User', 1, 'mytoken', '140960b7ea35d7c8088d1d7b72878ddfbfc0bd09527960bf3674814921d3f19f', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:51', '2023-11-17 15:41:51'),
(145, 'App\\Models\\User', 1, 'mytoken', '1cde15dd820e5ced4b6f16c3505fd08e385c28ba3d9b5bc3ded29dfc59925c15', '[\"*\"]', NULL, NULL, '2023-11-17 15:41:51', '2023-11-17 15:41:51'),
(146, 'App\\Models\\User', 1, 'mytoken', '162130e5d3d61f50dfbca5b743c76dc12862615cba4c90c87cff43fb90161696', '[\"*\"]', NULL, NULL, '2023-11-17 15:43:04', '2023-11-17 15:43:04'),
(147, 'App\\Models\\User', 1, 'mytoken', '1368a798b095c6eb1e2c1026ad62d1a7da92e52fa7fe8b1130fa8a57e2897372', '[\"*\"]', NULL, NULL, '2023-11-17 15:43:04', '2023-11-17 15:43:04'),
(148, 'App\\Models\\User', 1, 'mytoken', 'fc1a57ba8117080ab154f4c69c00bc672aded6007d89f63a938d5397b4916123', '[\"*\"]', NULL, NULL, '2023-11-17 15:43:36', '2023-11-17 15:43:36'),
(149, 'App\\Models\\User', 1, 'mytoken', '5d317cea02ec6bae8f8c7d11b96602f3ec413eece0b9ed0ad087d80053a515ef', '[\"*\"]', NULL, NULL, '2023-11-17 15:43:36', '2023-11-17 15:43:36'),
(150, 'App\\Models\\User', 1, 'mytoken', '43509c98a3d3b63b53e14e469f0e118e29e22b2b16e42fb290661678ec649c92', '[\"*\"]', NULL, NULL, '2023-11-17 15:44:00', '2023-11-17 15:44:00'),
(151, 'App\\Models\\User', 1, 'mytoken', '7c5a69429e5b5d6b1655e4277ed206ea6686ba98783984f53ea2843de6623983', '[\"*\"]', NULL, NULL, '2023-11-17 15:44:00', '2023-11-17 15:44:00'),
(152, 'App\\Models\\User', 1, 'mytoken', '206bba11434566e1ff6b1e7e637c6f5ef7572398f01d70a443e482b217e0325c', '[\"*\"]', NULL, NULL, '2023-11-17 15:44:11', '2023-11-17 15:44:11'),
(153, 'App\\Models\\User', 1, 'mytoken', '2e67a642bfe65f2cb9e0c79c67a36afa0969577671424dcc527cef70b1f992e9', '[\"*\"]', NULL, NULL, '2023-11-17 15:44:11', '2023-11-17 15:44:11'),
(154, 'App\\Models\\User', 1, 'mytoken', 'f905fb647dd74dbb48fad2e72e7f7865b6b0b11e73d4527d052cce9e4045e7ad', '[\"*\"]', NULL, NULL, '2023-11-17 15:44:17', '2023-11-17 15:44:17'),
(155, 'App\\Models\\User', 1, 'mytoken', 'bd11e5407cb6bd09731b4b10fdf038b268cb8e4a28d75a6d224f844f97e2bd63', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:12', '2023-11-17 15:45:12'),
(156, 'App\\Models\\User', 1, 'mytoken', '284fb61aab4bd2c69848ff53a07168b48ce6a9dd40cc355161be4a52de32b9ae', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:20', '2023-11-17 15:45:20'),
(157, 'App\\Models\\User', 1, 'mytoken', '79b098fdf7f0cb2f58eb00106cf45e68ddf7ed8574761a7aef9a09518eaad099', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:21', '2023-11-17 15:45:21'),
(158, 'App\\Models\\User', 1, 'mytoken', '6a5061dbc93aef537960629c68310756066a89f34d7333122952f78fcd000958', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:45', '2023-11-17 15:45:45'),
(159, 'App\\Models\\User', 1, 'mytoken', 'de372c2b29bfebcf3e0a484a1e98a64a472a1d2ee59c726c69a327176111054f', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:45', '2023-11-17 15:45:45'),
(160, 'App\\Models\\User', 1, 'mytoken', '647953a6db1f82eaebac40e436837229db59b5fa8905d9fe9db93a08f0a2737c', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:55', '2023-11-17 15:45:55'),
(161, 'App\\Models\\User', 1, 'mytoken', 'a32a7e8200ce2f27818502737a9cdac2a7e2a9def64449b5a204ac0127354f6a', '[\"*\"]', NULL, NULL, '2023-11-17 15:45:55', '2023-11-17 15:45:55'),
(162, 'App\\Models\\User', 1, 'mytoken', '66e8d7894a6e7c01b7eb6afa4bfc3d4ff6f3480bd6d51ff0fd303a2d3a17df9b', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:05', '2023-11-17 15:46:05'),
(163, 'App\\Models\\User', 1, 'mytoken', 'd0f48986b533ceef258348d18283314e6ae1d119e41adec1dafb3c75cc80cb62', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:05', '2023-11-17 15:46:05'),
(164, 'App\\Models\\User', 1, 'mytoken', '0a78eda22a086eb22332af11a1652c4269ee96b6c845fe14305a948d8f2375cc', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:31', '2023-11-17 15:46:31'),
(165, 'App\\Models\\User', 1, 'mytoken', '00c67b924198a5d2cfb0f22d0298aacb264135a9d19f7197275200de735f1649', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:31', '2023-11-17 15:46:31'),
(166, 'App\\Models\\User', 1, 'mytoken', '413b41193bf25254e6147183973cc999a7747da610ec368ac2166448ed60f618', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:39', '2023-11-17 15:46:39'),
(167, 'App\\Models\\User', 1, 'mytoken', '013552f20a0db804f550732ec51d48fa662314c4b8607dda1e2d9b8f95c2f926', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:40', '2023-11-17 15:46:40'),
(168, 'App\\Models\\User', 1, 'mytoken', '9d1a63a4f1dc1e0c8b0fcdfe0a2f1b902480f7bef7984df278c6ff152a1c0ea5', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:42', '2023-11-17 15:46:42'),
(169, 'App\\Models\\User', 1, 'mytoken', '677df6d0dd6b669553cefe923aafeaad98b21b6253d786a0239d57a2bdaac859', '[\"*\"]', NULL, NULL, '2023-11-17 15:46:42', '2023-11-17 15:46:42'),
(170, 'App\\Models\\User', 1, 'mytoken', '92c20f005cd2be4976c85cfa2c33ad35e3efb16294aa0da61ca5348878e02643', '[\"*\"]', NULL, NULL, '2023-11-17 15:54:20', '2023-11-17 15:54:20'),
(171, 'App\\Models\\User', 1, 'mytoken', '45784fed7bc6a784ad0b9c3c66c474d2385560f62ce84635f1792010c51b1633', '[\"*\"]', NULL, NULL, '2023-11-17 15:54:20', '2023-11-17 15:54:20'),
(172, 'App\\Models\\User', 1, 'mytoken', '96e261bf00f33d5c46ff2a2218b659e7a4fbe409c168f04284cb0949b2a2640c', '[\"*\"]', NULL, NULL, '2023-11-17 15:55:32', '2023-11-17 15:55:32'),
(173, 'App\\Models\\User', 1, 'mytoken', '5692759fc079c1d69a7f12e556fb913a3eaebed3aa552657e6715a8acb70f80a', '[\"*\"]', NULL, NULL, '2023-11-17 15:55:32', '2023-11-17 15:55:32'),
(174, 'App\\Models\\User', 1, 'mytoken', 'e62ad13f1d48ab44adb91cb170e284f9383b8ed77cdbbeeb6019719ead59ca10', '[\"*\"]', NULL, NULL, '2023-11-17 15:55:37', '2023-11-17 15:55:37'),
(175, 'App\\Models\\User', 1, 'mytoken', '04e3cd7d309f97a5cfa876568abd8c9e89e33d883162e5def4fe0d67ba66a117', '[\"*\"]', NULL, NULL, '2023-11-17 15:55:37', '2023-11-17 15:55:37'),
(176, 'App\\Models\\User', 1, 'mytoken', '44964f82cd85520629c8a2b4f9e54924212ba709f53fffb32f9c9cd8d28f1a4e', '[\"*\"]', NULL, NULL, '2023-11-17 15:56:43', '2023-11-17 15:56:43'),
(177, 'App\\Models\\User', 1, 'mytoken', 'ccd8ee6ce04fcd19714c14a97d6fc33267d144f1c80472c4002b592549dce385', '[\"*\"]', NULL, NULL, '2023-11-17 15:56:44', '2023-11-17 15:56:44'),
(178, 'App\\Models\\User', 1, 'mytoken', '03d1f2ef707bd83a2ca316fd5e9d1cd8ee0e42f89872ef9434f68e0bd8058bbf', '[\"*\"]', NULL, NULL, '2023-11-17 15:56:57', '2023-11-17 15:56:57'),
(179, 'App\\Models\\User', 1, 'mytoken', '2d16ea257b71c1f74ce688a9adac27c848a6bc69925361dac7f8abc45c9255d0', '[\"*\"]', NULL, NULL, '2023-11-17 15:56:58', '2023-11-17 15:56:58'),
(180, 'App\\Models\\User', 1, 'mytoken', '1a3002a9820549c165b9c858e14efd6e6b73dc8fe21188bcff34b8cac73a2bf3', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:05', '2023-11-17 15:57:05'),
(181, 'App\\Models\\User', 1, 'mytoken', '51efa8fcf19ebf62003e22eb379503c4443604b2051b43bc15ebb7bd0717ba46', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:05', '2023-11-17 15:57:05'),
(182, 'App\\Models\\User', 1, 'mytoken', '6fce4b1ae3d1775108892ce4e5df066bc08584a06a5390c1a1df0fcead22bfb2', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:07', '2023-11-17 15:57:07'),
(183, 'App\\Models\\User', 1, 'mytoken', '711e0a5521e050945acf3ec712950fd4c44d71305f1e2eedcdb0934e5d43aaa9', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:07', '2023-11-17 15:57:07'),
(184, 'App\\Models\\User', 1, 'mytoken', '677d59bca264ea9370631679d51cac8296a98cc539d5a8ce86e1c959ccefff55', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:07', '2023-11-17 15:57:07'),
(185, 'App\\Models\\User', 1, 'mytoken', '1678c566260ecbfe4ac9f34fe60434c70b86eb04c8382f38d6b2e20164d6156a', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:07', '2023-11-17 15:57:07'),
(186, 'App\\Models\\User', 1, 'mytoken', 'ea856fc6c5eaefdbd304bbf5146b99a038a5f8ca7d9488a63289b0e59f4c5f92', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:08', '2023-11-17 15:57:08'),
(187, 'App\\Models\\User', 1, 'mytoken', 'b3d9f6af806ea0a88594a10376b65481da8708c5f1e475e2f9bf4d93fef759d2', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:08', '2023-11-17 15:57:08'),
(188, 'App\\Models\\User', 1, 'mytoken', 'a85e27661a5fb0042a2aa76850318ae0bd081ae49da3e41e4849c27dad990b08', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:08', '2023-11-17 15:57:08'),
(189, 'App\\Models\\User', 1, 'mytoken', '8ff1de1fa503c330fe13124c05c062489ec9a3f42d288555bb82895dbc26f171', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:08', '2023-11-17 15:57:08'),
(190, 'App\\Models\\User', 1, 'mytoken', 'af8ee7af25ae55833c6e687ff90b7f81ad9ed2904c831a2f10a440a3a21cf311', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:09', '2023-11-17 15:57:09'),
(191, 'App\\Models\\User', 1, 'mytoken', '25d6172dba14ac816f1217294bdd6384dcba42192f43df523dad2b9f196dd48a', '[\"*\"]', NULL, NULL, '2023-11-17 15:57:09', '2023-11-17 15:57:09'),
(192, 'App\\Models\\User', 1, 'mytoken', 'eb532e4861162756292808e4b49c3abc80814839077a1212efd1d6ace2adbfe9', '[\"*\"]', NULL, NULL, '2023-11-18 08:48:35', '2023-11-18 08:48:35'),
(193, 'App\\Models\\User', 1, 'mytoken', '4fe415ea6a089346779b5c03258ae4495ead09c1b984bd92153d883c27a51ffa', '[\"*\"]', NULL, NULL, '2023-11-18 08:48:57', '2023-11-18 08:48:57'),
(194, 'App\\Models\\User', 1, 'mytoken', '70ebe059ce174ffa93cacc1898464fb1111c5a364e74bf00b692fa93ca854986', '[\"*\"]', NULL, NULL, '2023-11-18 08:49:03', '2023-11-18 08:49:03'),
(195, 'App\\Models\\User', 1, 'mytoken', 'c10bbe89e00934c506f05993ec61892f634e2d4f9428a13c070005c9d2dfef61', '[\"*\"]', NULL, NULL, '2023-11-18 08:49:04', '2023-11-18 08:49:04'),
(196, 'App\\Models\\User', 1, 'mytoken', '0fdf1e7d6e281c9bb7fd6751af9aad76c60f64d80e5014716b0ffe332ecdb77f', '[\"*\"]', NULL, NULL, '2023-11-18 08:49:55', '2023-11-18 08:49:55'),
(197, 'App\\Models\\User', 1, 'mytoken', '8f7b621c853ffa54ab0a290aee6386747f3d3ae07b4ba00293bf0c2282e903d5', '[\"*\"]', NULL, NULL, '2023-11-18 08:49:55', '2023-11-18 08:49:55'),
(198, 'App\\Models\\User', 1, 'mytoken', '8720a4d1b710dd63a4670b525fdb09f44f7585a76c911d007bdd2cf1b07ea246', '[\"*\"]', NULL, NULL, '2023-11-18 08:49:59', '2023-11-18 08:49:59'),
(199, 'App\\Models\\User', 1, 'mytoken', 'b1090b648d31b041a9d8b38a792b9c606be4d8dd06c22ff8ec6ab400345dc291', '[\"*\"]', NULL, NULL, '2023-11-18 09:02:15', '2023-11-18 09:02:15'),
(200, 'App\\Models\\User', 1, 'mytoken', '71d9208b08e1a800db4f29b5453fe243f021c3b182df30ea92a8ccd3e012d43d', '[\"*\"]', NULL, NULL, '2023-11-18 09:02:16', '2023-11-18 09:02:16'),
(201, 'App\\Models\\User', 1, 'mytoken', 'eed198f40c5897fa5c54b88e47ad530fc4ed542f327f6e4218e79d87bb004ac3', '[\"*\"]', NULL, NULL, '2023-11-18 09:08:10', '2023-11-18 09:08:10'),
(202, 'App\\Models\\User', 1, 'mytoken', 'a15a1b804628a4d059fa8e71c812cdd1e6b279c97ea129ba6ed988a6fdadc4d6', '[\"*\"]', NULL, NULL, '2023-11-18 09:08:10', '2023-11-18 09:08:10'),
(203, 'App\\Models\\User', 1, 'mytoken', '2ab940dca894df6d4a28c4215c74c4edbd2f0907042a602c40f30f16a01cecb9', '[\"*\"]', NULL, NULL, '2023-11-18 09:13:17', '2023-11-18 09:13:17'),
(204, 'App\\Models\\User', 1, 'mytoken', '531023be632023b8de9f444105bdd81daa219ebb7541da38d47f44f7d0125273', '[\"*\"]', NULL, NULL, '2023-11-18 09:13:17', '2023-11-18 09:13:17'),
(205, 'App\\Models\\User', 1, 'mytoken', 'd709094ce6754865198555876bdd9574cc4e8bf4decf286e6d7effe5ce4fb80a', '[\"*\"]', NULL, NULL, '2023-11-18 09:13:58', '2023-11-18 09:13:58'),
(206, 'App\\Models\\User', 1, 'mytoken', '20a9db9775205a9d38f4a01c7f059503881226222cc4a0f82d38460980a0e8cc', '[\"*\"]', NULL, NULL, '2023-11-18 09:13:58', '2023-11-18 09:13:58'),
(207, 'App\\Models\\User', 1, 'mytoken', '39eea11d510c4d727e301c201b0dedf922d717aefc9c8be98c6a8ddd6e4066fa', '[\"*\"]', NULL, NULL, '2023-11-18 12:19:24', '2023-11-18 12:19:24'),
(208, 'App\\Models\\User', 1, 'mytoken', '286900f9d8706fd03c775667c3be44245231f144548953f925d182b33a6008dc', '[\"*\"]', NULL, NULL, '2023-11-18 12:19:24', '2023-11-18 12:19:24'),
(209, 'App\\Models\\User', 1, 'mytoken', '8d6b3df1cab905bd78938f18c1185b2fb3e36b8263f6eb46946218da38dcd5ea', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:01', '2023-11-18 12:20:01'),
(210, 'App\\Models\\User', 1, 'mytoken', '672b929cc4230455f6f66e2ca53523b8c30872cdf640ae15530509013f471b34', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:01', '2023-11-18 12:20:01'),
(211, 'App\\Models\\User', 1, 'mytoken', '090845207e29167e3cebc9f983e52733bce71bb7c138c7e72969f48c2d9d90c3', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:05', '2023-11-18 12:20:05'),
(212, 'App\\Models\\User', 1, 'mytoken', 'a170c625b0958a8eb4be26a76b7b96eb946daca6d291a0b3e96163355e1b66a4', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:05', '2023-11-18 12:20:05'),
(213, 'App\\Models\\User', 1, 'mytoken', 'bdc3bc1417c98fc42f83f2c448ba30064b27d72b81602ab12fbebf4ecf1aaa46', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:20', '2023-11-18 12:20:20'),
(214, 'App\\Models\\User', 1, 'mytoken', '84a691351d3ed4eb3300cf5cf7a3b0d044fe32b22263cf73e8caf99c585310cf', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:20', '2023-11-18 12:20:20'),
(215, 'App\\Models\\User', 1, 'mytoken', 'b24e1e6d04b1fbfa0ca915d3ff800b772f7c5b4d0c923e7f2450b912c8e933b0', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:52', '2023-11-18 12:20:52'),
(216, 'App\\Models\\User', 1, 'mytoken', '103d7908f20b45f3c7e42a73416872544892fe2532398716c47471be5841d25c', '[\"*\"]', NULL, NULL, '2023-11-18 12:20:53', '2023-11-18 12:20:53'),
(217, 'App\\Models\\User', 1, 'mytoken', 'aa9135d9c9b56fd21bb94dedeb80a4949808934fe4667ac1e76ce890ca49d6bc', '[\"*\"]', NULL, NULL, '2023-11-18 12:22:23', '2023-11-18 12:22:23'),
(218, 'App\\Models\\User', 1, 'mytoken', 'fb9eb361e4201a1f1d09bf32010ba2b4ec1f7a1c352a24bb639e6da7e884487f', '[\"*\"]', NULL, NULL, '2023-11-18 12:22:23', '2023-11-18 12:22:23'),
(219, 'App\\Models\\User', 1, 'mytoken', '302d565c3583d61010e8bceb6af39c5903b847e023ce736eed5d2b98e3d2e8b1', '[\"*\"]', NULL, NULL, '2023-11-18 12:27:42', '2023-11-18 12:27:42'),
(220, 'App\\Models\\User', 1, 'mytoken', 'cc170ebcf194557c2cba739dd42e738788b605fb02cacbe794910e9740e70633', '[\"*\"]', '2023-11-18 12:54:17', NULL, '2023-11-18 12:27:42', '2023-11-18 12:54:17'),
(221, 'App\\Models\\User', 1, 'mytoken', '6dd2409d7e30a2e96a65c7fb51b9ed7c1bd6048ba2366a6a2c41916fd32d6e0f', '[\"*\"]', NULL, NULL, '2023-11-18 12:55:32', '2023-11-18 12:55:32'),
(222, 'App\\Models\\User', 1, 'mytoken', 'e31845d9328fc14e7d7baa7d372523475f83668cf1b2ea1d832174cd1da2da3b', '[\"*\"]', '2023-11-18 13:00:46', NULL, '2023-11-18 12:55:32', '2023-11-18 13:00:46'),
(223, 'App\\Models\\User', 1, 'mytoken', '1797f2dca7bfdcf106c0804da131d9364cbf39a7c2679ade2ac0b03e3cbdbc7f', '[\"*\"]', NULL, NULL, '2023-11-18 13:03:46', '2023-11-18 13:03:46'),
(224, 'App\\Models\\User', 1, 'mytoken', '48a75754f9027fac16e11779350ec2262a583336db2c6aabc0a0c70837e387fe', '[\"*\"]', NULL, NULL, '2023-11-18 13:04:07', '2023-11-18 13:04:07'),
(225, 'App\\Models\\User', 1, 'mytoken', '5fdc99181d29c6efe882cc39f582dcc958d0df6109e9c75c9dea68520b301f7c', '[\"*\"]', '2023-11-18 13:04:13', NULL, '2023-11-18 13:04:08', '2023-11-18 13:04:13'),
(226, 'App\\Models\\User', 1, 'mytoken', '5a0e56494a14f20adb975ccb41b7a48657883ae0d0b3583867a7910b8efdbe8c', '[\"*\"]', NULL, NULL, '2023-11-18 13:18:30', '2023-11-18 13:18:30'),
(227, 'App\\Models\\User', 1, 'mytoken', 'db646b255ae0ada475d13c5cdad14f04ccb885cdb816c537afd79abe098978f1', '[\"*\"]', '2023-11-18 13:21:16', NULL, '2023-11-18 13:18:30', '2023-11-18 13:21:16'),
(228, 'App\\Models\\User', 1, 'mytoken', '388b88737eb4a9c19a9f5b259e0b8da396e2eb3d69ef8ac48701ca6a3c426c2e', '[\"*\"]', NULL, NULL, '2023-11-18 13:22:36', '2023-11-18 13:22:36'),
(229, 'App\\Models\\User', 1, 'mytoken', 'ab64f40286906b26dc10110a30b17245b1d5f852ab4c03760dc5e39d06791cb8', '[\"*\"]', '2023-11-18 13:25:16', NULL, '2023-11-18 13:22:36', '2023-11-18 13:25:16'),
(230, 'App\\Models\\User', 1, 'mytoken', '53f2f56e328624f268317c5537b0eee202636ce1f7c95709a5dd6dfe430a04e5', '[\"*\"]', NULL, NULL, '2023-11-18 13:35:22', '2023-11-18 13:35:22'),
(231, 'App\\Models\\User', 1, 'mytoken', 'ec5c5b29a1d6b6ec21ec7480011e15980fea97625dc85249efb39361d82b36fa', '[\"*\"]', '2023-11-18 13:43:47', NULL, '2023-11-18 13:35:22', '2023-11-18 13:43:47'),
(232, 'App\\Models\\User', 1, 'mytoken', 'da67a4d9626656afa7870aaf070baf77e8af1e6896512d4ca923779cbd28bda2', '[\"*\"]', NULL, NULL, '2023-11-18 13:44:40', '2023-11-18 13:44:40'),
(233, 'App\\Models\\User', 1, 'mytoken', '01140cdfe402e7899992cb1d92a0a25d467823836e771dafdb65cce6c0bca8c4', '[\"*\"]', NULL, NULL, '2023-11-18 13:44:40', '2023-11-18 13:44:40'),
(234, 'App\\Models\\User', 1, 'mytoken', '8dcf162636970a25e55d27f062b2da4ff24041ecede0bc7158c2b4648cb63e1b', '[\"*\"]', NULL, NULL, '2023-11-18 13:44:49', '2023-11-18 13:44:49'),
(235, 'App\\Models\\User', 1, 'mytoken', 'd9ef60fad5494c416f561123ee214383cf75069ad60579c1c45fb90c3293896a', '[\"*\"]', '2023-11-19 03:53:58', NULL, '2023-11-18 13:44:49', '2023-11-19 03:53:58'),
(236, 'App\\Models\\User', 1, 'mytoken', '43dccd663267f575a0fcc7f7a044793ada7f65bda279aafba5c66fb8a7ccc54d', '[\"*\"]', NULL, NULL, '2023-11-19 04:02:00', '2023-11-19 04:02:00'),
(237, 'App\\Models\\User', 1, 'mytoken', '8b618a2029fc976e30a67b6d74120f0bd43da2029acd22c7f39f0f73cd31bb89', '[\"*\"]', '2023-11-19 06:18:05', NULL, '2023-11-19 04:02:00', '2023-11-19 06:18:05'),
(238, 'App\\Models\\User', 1, 'mytoken', '887608c858d1af89829ef29515bd9083e3e2f07d43f43ee7c19cad4689eb283f', '[\"*\"]', NULL, NULL, '2023-11-19 06:19:19', '2023-11-19 06:19:19'),
(239, 'App\\Models\\User', 1, 'mytoken', 'e216b180199662979a8d25dbf51276e2d45ebb762b81efc2892984dfa5bcf293', '[\"*\"]', '2023-11-20 07:15:15', NULL, '2023-11-19 06:19:20', '2023-11-20 07:15:15'),
(240, 'App\\Models\\User', 1, 'mytoken', 'f8623a06bcbca068a1e1d5cb13eff0238f580b20d4b0731582403cb186c7e178', '[\"*\"]', NULL, NULL, '2023-11-19 12:48:40', '2023-11-19 12:48:40'),
(241, 'App\\Models\\User', 1, 'mytoken', '91fb84ea524a62e653d622ee26b0ae2f7cb8b19b620b023a462dc410a511983c', '[\"*\"]', '2023-11-21 09:04:16', NULL, '2023-11-19 12:48:40', '2023-11-21 09:04:16'),
(242, 'App\\Models\\User', 1, 'mytoken', 'ed8cd4c66ff511101ce0b6c9333f3ebac459e1ab0c76b5b01371e8d2a81353bc', '[\"*\"]', NULL, NULL, '2023-11-20 07:20:08', '2023-11-20 07:20:08'),
(243, 'App\\Models\\User', 1, 'mytoken', 'aa88de3f392552fdc2c5bb3b11259341857144e6a6e9ecc8d147b1bc0e5425f1', '[\"*\"]', NULL, NULL, '2023-11-20 07:20:08', '2023-11-20 07:20:08'),
(244, 'App\\Models\\User', 1, 'mytoken', '09b95db95ed1d0cc022a811534466e99391d7a13939c1ca5554c235fa2743ac7', '[\"*\"]', NULL, NULL, '2023-11-20 07:20:09', '2023-11-20 07:20:09'),
(245, 'App\\Models\\User', 1, 'mytoken', 'f627202de502f3364c008ae4b91996ff3a8c132c67a40221b3d9bc5807e39d34', '[\"*\"]', '2023-11-20 07:39:40', NULL, '2023-11-20 07:20:09', '2023-11-20 07:39:40'),
(246, 'App\\Models\\User', 1, 'mytoken', 'bc70bdc604ca0e88454be49db9b424f488f65b40367ac58f7b8b2519479ccc69', '[\"*\"]', NULL, NULL, '2023-11-20 07:40:23', '2023-11-20 07:40:23'),
(247, 'App\\Models\\User', 1, 'mytoken', 'f584b96ac0dfe9662c56061a7f69e08a83d1ccece9bbf7842b976b931aab6582', '[\"*\"]', '2023-11-20 08:52:53', NULL, '2023-11-20 07:40:23', '2023-11-20 08:52:53'),
(248, 'App\\Models\\User', 1, 'mytoken', '5f4e3ce8e05bdf4400dae2e1f62230c8fccfa795674cc34b96ce32d9b9f8b563', '[\"*\"]', NULL, NULL, '2023-11-20 08:53:51', '2023-11-20 08:53:51'),
(249, 'App\\Models\\User', 1, 'mytoken', 'f5b1b959ce04b4cd0f9114c417d1fa7f21c7f5793f4c4803ca94ce3f956c676c', '[\"*\"]', NULL, NULL, '2023-11-20 08:53:51', '2023-11-20 08:53:51'),
(250, 'App\\Models\\User', 1, 'mytoken', '77d9f73d59f8ad422639dd7c948cd500563645815a052aa83bb38bc471e6db75', '[\"*\"]', NULL, NULL, '2023-11-20 08:54:29', '2023-11-20 08:54:29'),
(251, 'App\\Models\\User', 1, 'mytoken', '749561877c51f5a85ce408fae26f952ddbf2d85498aedaee86e5eb0737791a13', '[\"*\"]', NULL, NULL, '2023-11-20 08:54:29', '2023-11-20 08:54:29'),
(252, 'App\\Models\\User', 1, 'mytoken', '4fe4975275873fead564f880cf679e66d0a040af826b26a5cbaccdc5733cfd78', '[\"*\"]', NULL, NULL, '2023-11-20 08:55:05', '2023-11-20 08:55:05'),
(253, 'App\\Models\\User', 1, 'mytoken', '53ff623b4fe42b65ce7c24579282a5ffe97e7d4d9fee4818bcc27bf901ad9ed8', '[\"*\"]', '2023-11-20 13:09:21', NULL, '2023-11-20 08:55:05', '2023-11-20 13:09:21'),
(254, 'App\\Models\\User', 1, 'mytoken', 'ebb92eb0f2550c5a4a00555b3f4beb3348cfd1b820cbdeaf0eaf80428353c649', '[\"*\"]', NULL, NULL, '2023-11-20 13:09:33', '2023-11-20 13:09:33'),
(255, 'App\\Models\\User', 1, 'mytoken', '01946334e2eabfb5ee2ca4d0622b9141573f8c2d4b4b45017ca0260ec1621417', '[\"*\"]', NULL, NULL, '2023-11-20 13:09:33', '2023-11-20 13:09:33'),
(256, 'App\\Models\\User', 1, 'mytoken', '03a4fd5ae0f13308f6b607f5f44cd7a70905649116b6881e28f88984677c8e5c', '[\"*\"]', NULL, NULL, '2023-11-20 13:11:30', '2023-11-20 13:11:30'),
(257, 'App\\Models\\User', 1, 'mytoken', 'c707985fde6c6126d329799390727f52be11184b730e435f3382bf3bbcdf7c89', '[\"*\"]', NULL, NULL, '2023-11-20 13:11:30', '2023-11-20 13:11:30'),
(258, 'App\\Models\\User', 1, 'mytoken', 'c12e31b1dd084569dde5d8636b95ef4755b1c54cf666111c691e315ffd093fe1', '[\"*\"]', NULL, NULL, '2023-11-20 13:12:57', '2023-11-20 13:12:57'),
(259, 'App\\Models\\User', 1, 'mytoken', 'bd1df90beb717fbafe0dc180d9d44226cbc571287f35904a6e273697b7b71e54', '[\"*\"]', NULL, NULL, '2023-11-20 13:12:57', '2023-11-20 13:12:57'),
(260, 'App\\Models\\User', 1, 'mytoken', 'b734185ac986fe9f9bfdc287e9307c1bf87c1bf302de67a22983848def30ce74', '[\"*\"]', NULL, NULL, '2023-11-20 13:17:03', '2023-11-20 13:17:03'),
(261, 'App\\Models\\User', 1, 'mytoken', '7cab896123e322694ae1750ff1a08602dd9bf980d1d29661b546ae5737345853', '[\"*\"]', '2023-11-21 08:46:09', NULL, '2023-11-20 13:17:03', '2023-11-21 08:46:09'),
(262, 'App\\Models\\User', 1, 'mytoken', '45aeab91510d1cafae8b78e69ac455741e2be8d84900f4ea3ffa263f744a4293', '[\"*\"]', NULL, NULL, '2023-11-21 09:07:14', '2023-11-21 09:07:14'),
(263, 'App\\Models\\User', 1, 'mytoken', '7486123433823751947fd61c729f98194c02e31218f9e211bd5658ffdfc746b0', '[\"*\"]', NULL, NULL, '2023-11-21 09:07:14', '2023-11-21 09:07:14'),
(264, 'App\\Models\\User', 1, 'mytoken', '0cc63863c68883cc6ae1af761b00bc0018a22da3598b865901dc052e2bf6c988', '[\"*\"]', NULL, NULL, '2023-11-21 09:07:37', '2023-11-21 09:07:37'),
(265, 'App\\Models\\User', 1, 'mytoken', 'd521a1839dc9a352520c28f4eb3528c5214e1b885bc10fe4086084977961fe9e', '[\"*\"]', '2023-11-21 12:47:48', NULL, '2023-11-21 09:07:37', '2023-11-21 12:47:48'),
(266, 'App\\Models\\User', 1, 'mytoken', 'a462ad269b8d9235d121000ca55b6533b857100c7a93b5c9925cc6364b84b5e8', '[\"*\"]', NULL, NULL, '2023-11-21 12:55:25', '2023-11-21 12:55:25'),
(267, 'App\\Models\\User', 1, 'mytoken', '5f3a80b8d9a9c305863610e0f14d77b233486c6d8a41670a0fbe4b54632cde80', '[\"*\"]', NULL, NULL, '2023-11-21 12:55:25', '2023-11-21 12:55:25'),
(268, 'App\\Models\\User', 1, 'mytoken', '68e8c3820676253df86a965f36de5588625578407c960a7896ee5a6583e444a0', '[\"*\"]', NULL, NULL, '2023-11-21 12:55:26', '2023-11-21 12:55:26'),
(269, 'App\\Models\\User', 1, 'mytoken', '54d7ff565612155f58b840dfac10a5e4650a84649d6eb16753c8e46d8e0896e1', '[\"*\"]', NULL, NULL, '2023-11-21 12:55:26', '2023-11-21 12:55:26'),
(270, 'App\\Models\\User', 1, 'mytoken', 'c66334f14b4e3d3a387d125cb3341cfc9cb11f2570c4f78b87533a73156c61c7', '[\"*\"]', NULL, NULL, '2023-11-21 12:55:47', '2023-11-21 12:55:47'),
(271, 'App\\Models\\User', 1, 'mytoken', 'a4041292dc99eb3e409e4c31dc77a454d645a16cff284fda6006545e00d6edb9', '[\"*\"]', NULL, NULL, '2023-11-21 12:55:47', '2023-11-21 12:55:47'),
(272, 'App\\Models\\User', 1, 'mytoken', '4c42813b97442d6667f3f19c6f76d68ae0606d6c5a0ce8076cab171952e7dbf9', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:00', '2023-11-21 12:56:00'),
(273, 'App\\Models\\User', 1, 'mytoken', 'aef5a122dd716f2a30e84ca93ca6cabc904d7604609d27087ba4351f84cdbc4f', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:00', '2023-11-21 12:56:00'),
(274, 'App\\Models\\User', 1, 'mytoken', 'cbf4e9f1d96bf5d6f7d9d29115855cf252deabcf75ef762a11dca27c5169aab2', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:30', '2023-11-21 12:56:30'),
(275, 'App\\Models\\User', 1, 'mytoken', '25b0c3492a2f1fa1f14f5dd52a14d26a3e2550813cc27acdb71d33cc2feed358', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:30', '2023-11-21 12:56:30'),
(276, 'App\\Models\\User', 1, 'mytoken', '4a5481073a79cb9a6d10fa22a21a6455cadead11f016de36fe370cf3c4d32268', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:35', '2023-11-21 12:56:35'),
(277, 'App\\Models\\User', 1, 'mytoken', 'aa3905cece28368326a3332966ec90c5bb6d08974d49b4ec9c827a062106f9c1', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:35', '2023-11-21 12:56:35'),
(278, 'App\\Models\\User', 1, 'mytoken', 'a6bcec15769f96d4aa94eec7977fb5eef06910751054cde5fbc308a763501c22', '[\"*\"]', NULL, NULL, '2023-11-21 12:56:49', '2023-11-21 12:56:49'),
(279, 'App\\Models\\User', 1, 'mytoken', '50623408518603cc2fe2071cb026fb57fcc888887ecf4781bc7dc9fa64954921', '[\"*\"]', '2023-11-21 12:56:58', NULL, '2023-11-21 12:56:49', '2023-11-21 12:56:58'),
(280, 'App\\Models\\User', 1, 'mytoken', 'c997fb45352136eeea4274f351571308193ce31303033911c2f436c4c7773a22', '[\"*\"]', NULL, NULL, '2023-11-21 12:58:00', '2023-11-21 12:58:00'),
(281, 'App\\Models\\User', 1, 'mytoken', 'ab5c7ecc3798758f896a4dc442bcf9e970c590b6187443deb8939bb0d2d8ed00', '[\"*\"]', '2023-11-21 12:58:03', NULL, '2023-11-21 12:58:00', '2023-11-21 12:58:03'),
(282, 'App\\Models\\User', 1, 'mytoken', '853df4958e2212d9270ee4f00a1fd427020c242b2d5bf16a420d29a70361d3e6', '[\"*\"]', NULL, NULL, '2023-11-21 12:58:58', '2023-11-21 12:58:58'),
(283, 'App\\Models\\User', 1, 'mytoken', '793be5880fb0144cd3dfa182aef0df7dec00ebd7215fedd0b6061f2e4b2aa121', '[\"*\"]', '2023-11-21 12:59:05', NULL, '2023-11-21 12:58:58', '2023-11-21 12:59:05'),
(284, 'App\\Models\\User', 8, 'mytoken', '4779d89d5b2a51e02a2515a59186a0f28a57df22835e06f570fe069b8e7c4880', '[\"*\"]', NULL, NULL, '2023-11-21 13:00:50', '2023-11-21 13:00:50'),
(285, 'App\\Models\\User', 8, 'mytoken', '63cd135825d7ec95b16b7486190e53d55505c30bbad4b04cc82b5da4422410ef', '[\"*\"]', NULL, NULL, '2023-11-21 13:01:06', '2023-11-21 13:01:06'),
(286, 'App\\Models\\User', 8, 'mytoken', '5678df34159eaff2dc77752dcd1d227edeeed4d2f6aa7e270a7882ae70bc006a', '[\"*\"]', '2023-11-21 13:06:45', NULL, '2023-11-21 13:01:06', '2023-11-21 13:06:45'),
(287, 'App\\Models\\User', 1, 'mytoken', '8652891528981b20f3a3d16866b24e97f904778b58b736e00e152babf8dd0a00', '[\"*\"]', NULL, NULL, '2023-11-21 13:09:25', '2023-11-21 13:09:25'),
(288, 'App\\Models\\User', 1, 'mytoken', 'e1d2dfc53e81414d03f553e6c2bf69c2b78df9bef57a4bff3b76cbe757ae066e', '[\"*\"]', NULL, NULL, '2023-11-21 13:09:25', '2023-11-21 13:09:25'),
(289, 'App\\Models\\User', 1, 'mytoken', '3a64e7844edf100d408abfd376b6b04f3dd8dd54c0ee2e02d62ac34f8d961b7a', '[\"*\"]', NULL, NULL, '2023-11-21 13:09:49', '2023-11-21 13:09:49'),
(290, 'App\\Models\\User', 1, 'mytoken', '93bcee712e7ed77baa24792318d491cfcfa6d3959e9626ab055538c11f0766c9', '[\"*\"]', '2023-11-21 13:15:17', NULL, '2023-11-21 13:09:49', '2023-11-21 13:15:17'),
(291, 'App\\Models\\User', 1, 'mytoken', '0932ff4310b0f81f319f75da2baa93fc0709e3f5db6fb0b35f651a0546400327', '[\"*\"]', NULL, NULL, '2023-11-21 13:16:22', '2023-11-21 13:16:22'),
(292, 'App\\Models\\User', 1, 'mytoken', 'bd150a2d529653192dda5eb3295c0e3b64b80122e8388ce7ab87f758eee403ba', '[\"*\"]', '2023-11-21 13:16:34', NULL, '2023-11-21 13:16:22', '2023-11-21 13:16:34'),
(293, 'App\\Models\\User', 9, 'mytoken', 'ce14cd54667908b7e0818b0e89da12ded78ba1da99fdea3ac2f7b00a06c6d150', '[\"*\"]', NULL, NULL, '2023-11-21 13:16:53', '2023-11-21 13:16:53'),
(294, 'App\\Models\\User', 9, 'mytoken', 'a7842c80b7938e515129146ea7b36b7effe16a3b4d1616e0d788dd91de90dad3', '[\"*\"]', NULL, NULL, '2023-11-21 13:16:59', '2023-11-21 13:16:59'),
(295, 'App\\Models\\User', 9, 'mytoken', 'ec565e4961637a92e9939c1d4a036ecb0dace55d7731d936d55a6bafb0612047', '[\"*\"]', '2023-11-21 13:37:38', NULL, '2023-11-21 13:16:59', '2023-11-21 13:37:38'),
(296, 'App\\Models\\User', 1, 'mytoken', 'd7f62a7761b63cc57018829fc9a742cfd8c712de74058ffa4cb4e46aef205670', '[\"*\"]', NULL, NULL, '2023-11-21 13:40:50', '2023-11-21 13:40:50'),
(297, 'App\\Models\\User', 1, 'mytoken', 'd99d71252679b78ddd929cdb2136d2fcad05136c0084259bef77c2c582a150a4', '[\"*\"]', '2023-11-21 13:44:05', NULL, '2023-11-21 13:40:50', '2023-11-21 13:44:05'),
(298, 'App\\Models\\User', 1, 'mytoken', 'c7643ab862a8a0c5d095735d506003a9d268930ba5bc7561f23ce1b1ea8f8ca8', '[\"*\"]', NULL, NULL, '2023-11-21 13:45:19', '2023-11-21 13:45:19'),
(299, 'App\\Models\\User', 1, 'mytoken', '7ca31969fcce574b7e7f295c6875e35b41839a055531c84afb8dea8e896d27fe', '[\"*\"]', '2023-11-21 13:47:22', NULL, '2023-11-21 13:45:19', '2023-11-21 13:47:22'),
(300, 'App\\Models\\User', 1, 'mytoken', 'f45551f8320cbd2ed35860d1c8e59efba87729e1054f4b2d268dd98f90beff9e', '[\"*\"]', NULL, NULL, '2023-11-21 13:51:31', '2023-11-21 13:51:31'),
(301, 'App\\Models\\User', 1, 'mytoken', 'c3e220ba6fcca60042db09dceb81c06b32e69ba65f005964719eebee275da586', '[\"*\"]', '2023-11-22 03:31:28', NULL, '2023-11-21 13:51:32', '2023-11-22 03:31:28'),
(302, 'App\\Models\\User', 1, 'mytoken', 'ed3047d7a7d0cd04b1f2669707a5dd9c71362cd120686d8339f24f7088e1bbed', '[\"*\"]', NULL, NULL, '2023-11-22 03:32:18', '2023-11-22 03:32:18'),
(303, 'App\\Models\\User', 1, 'mytoken', '084a41d7cc1488ef568bff84b6060ca0be0f08ff8b2b4e476ca6b6779bb20cc8', '[\"*\"]', '2023-11-22 03:44:32', NULL, '2023-11-22 03:32:18', '2023-11-22 03:44:32'),
(304, 'App\\Models\\User', 10, 'mytoken', '4dbc79e5daaa7481578c1b7bd4fcdfc9e76efdd57f203f3b7707a416dd76aec9', '[\"*\"]', NULL, NULL, '2023-11-22 03:45:15', '2023-11-22 03:45:15'),
(305, 'App\\Models\\User', 10, 'mytoken', '5df261374201e70e6433b50549bc9eb1e23552c9ed6fc8575499a1e6a46fca9f', '[\"*\"]', NULL, NULL, '2023-11-22 03:45:26', '2023-11-22 03:45:26'),
(306, 'App\\Models\\User', 10, 'mytoken', '1ca7129c31914e9140112b0bcefea7e09a5d3aee065b23f2089c3efd84ecdefa', '[\"*\"]', '2023-11-22 05:56:12', NULL, '2023-11-22 03:45:26', '2023-11-22 05:56:12'),
(307, 'App\\Models\\User', 1, 'mytoken', '0a634cabdd207a57eb7d961f8305c002a3ba9ad6581695fdcd25c0035e357543', '[\"*\"]', NULL, NULL, '2023-11-22 05:56:41', '2023-11-22 05:56:41'),
(308, 'App\\Models\\User', 1, 'mytoken', '3daa071da94a98d95bf9323e341d57f9406f5e16a77fd2e7469fc6016bd964fe', '[\"*\"]', '2023-11-22 05:59:18', NULL, '2023-11-22 05:56:41', '2023-11-22 05:59:18');

-- --------------------------------------------------------

--
-- Stand-in structure for view `productdetails`
-- (See below for the actual view)
--
CREATE TABLE `productdetails` (
`productID` int(11)
,`productName` varchar(255)
,`image` varchar(200)
,`FILE` varchar(200)
,`description` varchar(255)
,`price` double(8,2)
,`discount` double
,`stock` int(11)
,`catName` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(200) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discountPrice` double DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `categoryID` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `file`, `desc`, `price`, `discountPrice`, `stock`, `categoryID`, `created_at`, `updated_at`) VALUES
(4, 'Air fryier', '1699617766_1.jpg', 'Air Fryier', 750.00, 690, 8, 13, '2023-11-10 10:02:46', '2023-11-10 10:02:46'),
(5, 'Laptop Acer', '1699678319_1 (1).jpg', 'acer aspire 3 laptop', 10000.00, 9500, 6, 11, '2023-11-11 02:51:59', '2023-11-11 02:51:59'),
(6, 'Laptop BackPag', '1700472991_1.jpg', 'Waterproof Backpack Bag', 300.00, 250, 12, 11, '2023-11-20 07:36:31', '2023-11-20 07:36:31'),
(7, 'Radio Classic', '1700629753_radio.jpg', 'Radio Classic Mini Electric - Brown', 410.00, 390, 7, 11, '2023-11-22 03:09:13', '2023-11-22 03:09:13'),
(8, 'Smart watch', '1700629795_smart watch.jpg', 'Ultra Smart Watch Full Screen 1.99', 600.00, 550, 9, 11, '2023-11-22 03:09:55', '2023-11-22 03:09:55'),
(9, 'Kettle', '1700629836_kettle.jpg', 'Fresh Electric Kettle - 1.7L-Black', 780.00, 700, 3, 13, '2023-11-22 03:10:36', '2023-11-22 03:10:36'),
(10, 'Dettole', '1700629874_dettol.jpg', 'Dettol 3X Antibacterial Power Floor Cleaner -', 188.00, 150, 5, 13, '2023-11-22 03:11:14', '2023-11-22 03:11:14'),
(11, 'skyline screen', '1700629924_skyline.jpg', 'Skyline 32-22S – 32-inch HD LED Smart TV', 6000.00, 5950, 15, 11, '2023-11-22 03:12:04', '2023-11-22 03:12:04'),
(12, 'Axe Men Kit Bundle', '1700629982_men kit.jpg', 'Axe Body Spray For Men Black Night 150Ml+ Clear Men 3 In 1 For Hair, Body & Face 180Ml+ Close Up Toothpaste White Now Gold 75Ml', 210.00, 190, 90, 12, '2023-11-22 03:13:02', '2023-11-22 03:13:02'),
(13, 'Realme c55', '1700630035_realme c55.jpg', '6.7 Inch - 8GB/256GB RAM - 4G - Dual SIM Mobile Phone - Sun Shower', 8500.00, 8300, 70, 11, '2023-11-22 03:13:55', '2023-11-22 03:13:55'),
(14, 'XIAOMI Redmi 12C', '1700630095_XIAOMI.jpg', '6.71-inch 6GB/128GB Dual Sim 4G Mobile Phone - Ocean Blue', 8000.00, 7850, 30, 11, '2023-11-22 03:14:55', '2023-11-22 03:14:55'),
(15, 'Realme c53', '1700630165_realme c53.jpg', '6.74 Inch 128GB-6GB Dual SIM', 7400.00, 7250, 34, 11, '2023-11-22 03:16:05', '2023-11-22 03:16:05');

-- --------------------------------------------------------

--
-- Stand-in structure for view `productscategory`
-- (See below for the actual view)
--
CREATE TABLE `productscategory` (
`productID` int(11)
,`date` timestamp
,`productName` varchar(255)
,`discount` double
,`desc` varchar(255)
,`categoryName` varchar(255)
,`categoryID` bigint(20)
,`stock` int(11)
,`price` double(8,2)
,`fileExt` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `productsratings`
-- (See below for the actual view)
--
CREATE TABLE `productsratings` (
`productID` int(11)
,`status` int(11)
,`date` date
,`userName` varchar(255)
,`productName` varchar(255)
,`rate` int(11)
,`comment` varchar(255)
,`rateID` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `productID`, `userID`, `rate`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(12, 6, 8, 0, 'excelent material and nice colors', 0, '2023-11-21', '2023-11-21 15:01:39'),
(13, 6, 1, 0, 'very good product', 0, '2023-11-21', '2023-11-21 15:10:07'),
(14, 15, 1, 0, 'i think realme c55 is better', 0, '2023-11-22', '2023-11-22 05:37:15'),
(15, 7, 1, 0, 'i love it', 0, '2023-11-22', '2023-11-22 07:59:16');

-- --------------------------------------------------------

--
-- Stand-in structure for view `userorders`
-- (See below for the actual view)
--
CREATE TABLE `userorders` (
`userID` int(11)
,`orderID` bigint(20) unsigned
,`productID` int(11)
,`image` varchar(200)
,`NAME` varchar(255)
,`price` double(8,2)
,`discount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nader', 'elsayednder@gmail.com', NULL, '$2y$10$kCb7gmDulyXkqU8ihUmpNOWvarlmrIaHx47jX011nfZdjjMXNZ1dm', 1, NULL, '2023-11-09 03:35:49', '2023-11-09 03:35:49'),
(8, 'mohamed', 'mohamed@mo.com', NULL, '$2y$10$2tRfIDqiSCsLrcMQb56SoOeKvXGpUEPvjR27WATJX4/su6fS5FjNW', 0, NULL, '2023-11-21 13:00:50', '2023-11-21 13:00:50'),
(9, 'leo messi', 'messi@worldcup.leo', NULL, '$2y$10$EvMnXikhIBDUxCgshFewbOmxYrlPekfAl1kWOr05wApVwcwHYOVHu', 0, NULL, '2023-11-21 13:16:53', '2023-11-21 13:16:53'),
(10, 'mo salah', 'mo@mo.com', NULL, '$2y$10$xSH7NE6m6yU65DNlS1kNmeeiPFOPCQAGyRyn8xpBhCHfVc3l.NlMG', 0, NULL, '2023-11-22 03:45:15', '2023-11-22 03:45:15');

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `users`.`id` AS `userID`, `users`.`name` AS `username`, `products`.`id` AS `productID`, `products`.`price` AS `price`, `products`.`name` AS `name`, `orders`.`address` AS `address`, `orders`.`status` AS `status` FROM ((`orders` join `users` on(`orders`.`userID` = `users`.`id`)) join `products` on(`orders`.`productID` = `products`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `productdetails`
--
DROP TABLE IF EXISTS `productdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productdetails`  AS SELECT `products`.`id` AS `productID`, `products`.`name` AS `productName`, `products`.`file` AS `image`, `products`.`file` AS `FILE`, `products`.`desc` AS `description`, `products`.`price` AS `price`, `products`.`discountPrice` AS `discount`, `products`.`stock` AS `stock`, `categories`.`name` AS `catName` FROM (`products` join `categories` on(`products`.`categoryID` = `categories`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `productscategory`
--
DROP TABLE IF EXISTS `productscategory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productscategory`  AS SELECT `products`.`id` AS `productID`, `products`.`created_at` AS `date`, `products`.`name` AS `productName`, `products`.`discountPrice` AS `discount`, `products`.`desc` AS `desc`, `categories`.`name` AS `categoryName`, `categories`.`id` AS `categoryID`, `products`.`stock` AS `stock`, `products`.`price` AS `price`, `products`.`file` AS `fileExt` FROM (`products` join `categories` on(`products`.`categoryID` = `categories`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `productsratings`
--
DROP TABLE IF EXISTS `productsratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productsratings`  AS SELECT `products`.`id` AS `productID`, `ratings`.`status` AS `status`, `ratings`.`created_at` AS `date`, `users`.`name` AS `userName`, `products`.`name` AS `productName`, `ratings`.`rate` AS `rate`, `ratings`.`comment` AS `comment`, `ratings`.`id` AS `rateID` FROM ((`ratings` join `products` on(`ratings`.`productID` = `products`.`id`)) join `users` on(`ratings`.`userID` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `userorders`
--
DROP TABLE IF EXISTS `userorders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userorders`  AS SELECT `users`.`id` AS `userID`, `orders`.`id` AS `orderID`, `products`.`id` AS `productID`, `products`.`file` AS `image`, `products`.`name` AS `NAME`, `products`.`price` AS `price`, `products`.`discountPrice` AS `discount` FROM ((`orders` join `users` on(`orders`.`userID` = `users`.`id`)) join `products` on(`orders`.`productID` = `products`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`,`productID`),
  ADD KEY `productID` (`productID`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
