-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 26, 2025 at 05:31 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `credittide`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `symbol`, `name`, `address`, `coin`, `path`, `color`, `bg`, `created_at`, `updated_at`) VALUES
(1, 'btc', 'bitcoin', 'bc1qlc25au9vmkyfuxfwht39hueud866wwsf8zgy95', 'FaBtc', 'fa', 'bg-orange-500', 'bg-orange-100', NULL, NULL),
(2, 'eth', 'ethereum', 'jjjjjjjjjjjjjjjj', 'FaEthereum', 'fa', 'bg-gray-600', 'bg-gray-100', NULL, NULL),
(3, 'usdt', 'tether', 'kkkkkkkkkkkkkkkkkkk', 'SiTether', 'si', 'bg-green-600', 'bg-green-100', NULL, NULL),
(4, 'ltc', 'litecoin', 'ggggggggggg', 'SiLitecoin', 'si', 'bg-blue-500', 'bg-blue-100', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `locked_balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`id`, `user_id`, `balance`, `locked_balance`, `created_at`, `updated_at`) VALUES
(9, 23, 0.00, 0.00, '2025-03-16 08:26:14', '2025-03-16 08:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `love_count` int NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `title`, `slug`, `thumbnail`, `content`, `author`, `author_picture`, `love_count`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'More people are recorded storming into stock investment, and make huge profits for thierselves', 'more-people-are-recorded', 'storage/uploads/blogs/thumbnails/open-graph.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, fugit cupiditate! Iste, sapiente facilis. Assumenda tenetur ipsa dolorem laudantium? Voluptas harum nisi dignissimos officiis esse magni saepe reiciendis, iste quod. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates reiciendis sed quasi soluta, sequi quidem esse. Excepturi magnam perspiciatis, illo illum suscipit aperiam doloremque neque unde cumque alias dolor tenetur?\n\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Quam perspiciatis impedit corporis asperiores magnam. Laborum, incidunt cum neque rem numquam atque, consequuntur excepturi vitae delectus quibusdam eum accusantium tempora facilis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem sequi iure tenetur asperiores in a vero, dignissimos animi beatae nesciunt corrupti deserunt labore repudiandae ratione deleniti? Ab magnam nisi saepe.\n\nLorem ipsum dolor sit amet consectetur, adipisicing elit. Quam perspiciatis impedit corporis asperiores magnam. Laborum, incidunt cum neque rem numquam atque, consequuntur excepturi vitae delectus quibusdam eum accusantium tempora facilis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem sequi iure tenetur asperiores in a vero, dignissimos animi beatae nesciunt corrupti deserunt labore repudiandae ratione deleniti? Ab magnam nisi saepe. darlington edited\n\n\n\n', 'Darlington', 'storage/uploads/blogs/authors/blank-picture.png', 1, 0, '2025-03-22 05:16:34', '2025-03-23 09:57:45'),
(2, 1, 'The Power of Compound Interest: How to Grow Your Wealth Over Time', 'power-of-compound-interest', 'storage/uploads/blogs/thumbnails/dream_039484.png', '<p>Investing is one of the best ways to build wealth over time, and one of the most powerful concepts in investing is compound interest. Often called the eighth wonder of the world, compound interest allows your money to grow exponentially when given enough time.</p>\n\n<h1 class=\"font-bold text-2xl\">What Is Compound Interest?</h1>\n<p>Compound interest is the process where your earnings generate even more earnings over time. Unlike simple interest, which is only calculated on the initial principal, compound interest includes both the principal and previously earned interest in its calculations.\n\nFor example, if you invest $1,000 at an annual interest rate of 10%, you will earn $100 in the first year. But in the second year, your interest will be calculated on $1,100 instead of just $1,000, giving you $110 instead of $100. This process continues, making your wealth grow faster over time.</p>\n\n<h1 class=\"font-bold text-2xl\">Why Time Is Your Greatest Asset</h1>\n<p>The biggest advantage of compound interest is time. The longer you keep your money invested, the greater the impact of compounding. Here’s a simple example to show why investing early is key:</p>\n<ul class=\"list-disc ml-6 mt-4\">\n<li>Investor A invests $5,000 per year from age 25 to 35 and then stops.</li>\n<li>Investor B invests $5,000 per year but starts at age 35 and continues until 45.</li>\n</ul>\n<p>Even though both invested the same amount ($50,000), Investor A ends up with more money at retirement because their investments had more time to compound.</p>\n\n\n<h1 class=\"font-bold text-2xl\">How to Take Advantage of Compound Interest</h1>\n<p>To maximize the benefits of compound interest, consider these strategies:</p>\n<ul class=\"list-disc ml-6 mt-4\">\n<li>Start Early: The sooner you invest, the more time your money has to grow.</li>\n<li>Reinvest Earnings: Keep reinvesting dividends and interest to accelerate growth.</li>\n<li>Invest Consistently: Regular contributions to your investment account will yield significant long-term results.</li>\n<li>Choose High-Growth Assets: Stocks, mutual funds, and ETFs often provide better returns than traditional savings accounts.</li>\n<li>Avoid Unnecessary Withdrawals: The longer you leave your money untouched, the greater the compounding effect.</li>\n</ul>\n\n<h1 class=\"font-bold text-2xl\">Final Thoughts</h1>\n<p>Compound interest is a simple yet powerful tool that can turn small investments into a fortune over time. By starting early, staying consistent, and letting your earnings grow, you can secure a strong financial future. Whether you are new to investing or already have experience, the key is to let time and compounding work in your favor.</p>\n\n<p>Happy investing! 🚀</p>', 'Chukwuemeka', 'storage/uploads/blogs/authors/blank-picture.png', 1, 0, '2025-03-23 10:19:32', '2025-03-23 10:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category` enum('investment-articles','stock-market','financial-tips') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'investment-articles',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'investment-articles', 1, '2025-03-22 05:16:10', '2025-03-22 05:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `celebrity_investors`
--

CREATE TABLE `celebrity_investors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposits` decimal(8,2) NOT NULL DEFAULT '0.00',
  `withdrawals` decimal(8,2) NOT NULL DEFAULT '0.00',
  `investments` int UNSIGNED NOT NULL DEFAULT '0',
  `years` int NOT NULL DEFAULT '6',
  `occupation` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL DEFAULT '35',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `celebrity_investors`
--

INSERT INTO `celebrity_investors` (`id`, `name`, `position`, `address`, `deposits`, `withdrawals`, `investments`, `years`, `occupation`, `age`, `image`, `started_at`, `created_at`, `updated_at`) VALUES
(1, 'Reese Witherspoon', 'Gold Investor', 'No 2 Hedrs str, New york city', 200000.00, 150000.00, 9800000, 6, '', 35, 'storage/uploads/celebrities/reese-w.jfif', '2025-03-07 09:26:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `about`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Dragon Oil Holdings Limited', 'Dragon Oil is an international oil and gas company with an established history.', 'https://dragon.com', '...', NULL, NULL),
(2, 'White and Co Real estate LLL', 'Dragon Oil is an international oil and gas company with an established history.', 'https://drkop.com', '...', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_wallet_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','processing','completed','rejected','cancelled','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('general','deposit','investment','withdrawal','profile') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'What is your stock investment platform about?', 'Our platform allows users to invest in stocks with simulated returns based on real market performance and investment plans.', 'general', 1, '2025-03-20 14:43:44', '2025-03-20 14:43:44'),
(2, 'How does stock investment work on this platform?', 'Users select an investment plan, fund their accounts, and track their portfolio performance. Stock prices fluctuate based on real-world market data.', 'general', 1, NULL, NULL),
(3, 'Is this platform regulated?', 'We operate in compliance with investment regulations and strive to ensure transparency in all transactions.', 'general', 1, '2025-03-20 14:47:17', '2025-03-20 14:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `heroes`
--

CREATE TABLE `heroes` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `primary_button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_button` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `heroes`
--

INSERT INTO `heroes` (`id`, `slug`, `heading`, `title`, `subtitle`, `primary_button`, `secondary_button`, `background_image`, `created_at`, `updated_at`) VALUES
(1, 'landing', 'Smart Investing, Real Returns', 'Stock Investing Made Simple & Profitable', 'Take control of your financial future with our intuitive stock investment platform. Whether you\'re a beginner or an experienced investor, we provide real-time market insights, tailored investment plans, and a seamless experience to help you grow your wealth confidently. Start investing today and watch your money work for you!', 'get started', 'talk to support\r\n', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `stock_id` bigint UNSIGNED NOT NULL,
  `investment_plan_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `current_value` decimal(15,2) NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investment_plans`
--

CREATE TABLE `investment_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` decimal(20,2) NOT NULL,
  `max_amount` decimal(20,2) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `interval` enum('yearly','monthly','weekly','daily','hourly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily',
  `duration` int NOT NULL,
  `referral_bonus` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investment_plans`
--

INSERT INTO `investment_plans` (`id`, `name`, `min_amount`, `max_amount`, `interest_rate`, `interval`, `duration`, `referral_bonus`, `description`, `icon`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Premium Stock', 1000.00, 10000.00, 2.00, 'daily', 4, 10.00, 'Ideal for starters in our platform who wishes to enhance their investment stats, for those who seeking assistance, and those who wishes to just stick with the plan.', 'MdOutlineWorkspacePremium', 'md', '2025-02-11 22:42:44', '2025-02-11 22:42:44'),
(2, 'Silver stock', 10000.00, 50000.00, 10.00, 'monthly', 5, 0.00, 'Ideal for investors looking for steady growth, moderate risk, and a balanced approach to building their investment portfolio on our platform.', 'GiSilverBullet', 'gi', '2025-02-14 11:18:52', '2025-02-14 11:18:52'),
(3, 'Gold Stock', 50000.00, 200000.00, 10.00, 'yearly', 10, 0.00, 'Ideal for experienced investors seeking higher returns, enhanced benefits, and a strategic edge in stock investment with optimized growth potential.', 'GiGoldScarab', 'gi', '2025-02-14 11:20:25', '2025-02-14 11:20:25'),
(4, 'Star Stock', 200000.00, 500000.00, 10.00, 'daily', 20, 0.00, 'Ideal for advanced investors aiming for maximum returns, exclusive features, and priority support, with a focus on high-growth opportunities and personalized investment strategies.', 'FaRankingStar', 'fa6', '2025-02-14 11:21:54', '2025-02-14 11:21:54'),
(5, 'Unlimited Stock', 500000.00, 10000000.00, 10.00, 'daily', 30, 0.00, 'Ideal for elite investors who want unlimited access to premium features, personalized strategies, and the flexibility to maximize returns without restrictions.', 'GiGloop', 'gi', '2025-02-14 12:23:35', '2025-02-14 11:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(7, 'default', '{\"uuid\":\"2b03aaf9-b2d1-4e1f-85be-7fcfcc86526e\",\"displayName\":\"App\\\\Mail\\\\CustomMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:19:\\\"App\\\\Mail\\\\CustomMail\\\":3:{s:4:\\\"data\\\";a:6:{s:4:\\\"view\\\";s:20:\\\"emails.admin.inquiry\\\";s:7:\\\"subject\\\";s:7:\\\"Testing\\\";s:6:\\\"sender\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:5:\\\"email\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:7:\\\"message\\\";s:53:\\\"who are you my bro? I am begining to like your style.\\\";s:4:\\\"name\\\";s:17:\\\"Nwosu Chukwuemeka\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"fritzdultimate@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1742462229, 1742462229),
(8, 'default', '{\"uuid\":\"72f97403-3c05-4eb1-982d-d4543f8808f0\",\"displayName\":\"App\\\\Mail\\\\CustomMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:19:\\\"App\\\\Mail\\\\CustomMail\\\":3:{s:4:\\\"data\\\";a:6:{s:4:\\\"view\\\";s:20:\\\"emails.admin.inquiry\\\";s:7:\\\"subject\\\";s:7:\\\"Testing\\\";s:6:\\\"sender\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:5:\\\"email\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:7:\\\"message\\\";s:139:\\\"This is a message reminder that you are going to make millions soon, build houses, buy cars, etc. change the story of your background. Ajeh\\\";s:4:\\\"name\\\";s:17:\\\"Nwosu Chukwuemeka\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"fritzdultimate@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1742462556, 1742462556),
(9, 'default', '{\"uuid\":\"6c17180b-1ce8-46b0-aed3-eae7a1e094bc\",\"displayName\":\"App\\\\Mail\\\\CustomMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:19:\\\"App\\\\Mail\\\\CustomMail\\\":3:{s:4:\\\"data\\\";a:6:{s:4:\\\"view\\\";s:20:\\\"emails.admin.inquiry\\\";s:7:\\\"subject\\\";s:7:\\\"Testing\\\";s:6:\\\"sender\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:5:\\\"email\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:7:\\\"message\\\";s:139:\\\"This is a message reminder that you are going to make millions soon, build houses, buy cars, etc. change the story of your background. Ajeh\\\";s:4:\\\"name\\\";s:17:\\\"Nwosu Chukwuemeka\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"fritzdultimate@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1742462563, 1742462563),
(10, 'default', '{\"uuid\":\"3d237606-982f-42e0-ae0e-a5bb71dc1e06\",\"displayName\":\"App\\\\Mail\\\\CustomMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:19:\\\"App\\\\Mail\\\\CustomMail\\\":3:{s:4:\\\"data\\\";a:6:{s:4:\\\"view\\\";s:20:\\\"emails.admin.inquiry\\\";s:7:\\\"subject\\\";s:7:\\\"Testing\\\";s:6:\\\"sender\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:5:\\\"email\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:7:\\\"message\\\";s:139:\\\"This is a message reminder that you are going to make millions soon, build houses, buy cars, etc. change the story of your background. Ajeh\\\";s:4:\\\"name\\\";s:17:\\\"Nwosu Chukwuemeka\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"fritzdultimate@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1742462568, 1742462568),
(11, 'default', '{\"uuid\":\"a3ee536e-b465-4705-813d-943e76f83995\",\"displayName\":\"App\\\\Mail\\\\CustomMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:19:\\\"App\\\\Mail\\\\CustomMail\\\":3:{s:4:\\\"data\\\";a:6:{s:4:\\\"view\\\";s:20:\\\"emails.admin.inquiry\\\";s:7:\\\"subject\\\";s:7:\\\"Testing\\\";s:6:\\\"sender\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:5:\\\"email\\\";s:24:\\\"fritzdultimate@gmail.com\\\";s:7:\\\"message\\\";s:139:\\\"This is a message reminder that you are going to make millions soon, build houses, buy cars, etc. change the story of your background. Ajeh\\\";s:4:\\\"name\\\";s:17:\\\"Nwosu Chukwuemeka\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"fritzdultimate@gmail.com\\\";}}s:6:\\\"mailer\\\";s:3:\\\"log\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1742462670, 1742462670);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_07_195824_create_personal_access_tokens_table', 1),
(5, '2025_02_07_202325_create_heroes_table', 1),
(6, '2025_02_07_202329_create_testimonies_table', 1),
(7, '2025_02_07_202339_create_celebrity_investors_table', 1),
(8, '2025_02_07_202349_create_referrals_table', 1),
(9, '2025_02_11_202457_create_balances_table', 2),
(10, '2025_02_11_202731_create_investment_plans_table', 2),
(11, '2025_02_11_202732_create_stocks_table', 2),
(12, '2025_02_11_202741_create_investments_table', 3),
(13, '2025_02_11_202850_create_transactions_table', 3),
(14, '2025_02_11_205747_create_referral_bonuses_table', 3),
(15, '2025_02_12_163343_add_name_and_icon_and_last_price_to_stocks_table', 4),
(16, '2025_02_12_163620_add_last_price_to_stocks_table', 5),
(17, '2025_02_12_163710_add_last_price_to_stocks_table', 5),
(18, '2025_02_14_091354_add_path_to_stocks_table', 6),
(19, '2025_02_14_111553_add_path_and_icon_to_stocks_table', 7),
(20, '2025_02_25_212751_create_admin_wallets', 8),
(21, '2025_02_25_212801_create_user_wallets', 8),
(22, '2025_02_25_1115353_add_user_id_to_user_wallets_table', 9),
(23, '2025_02_26_115019_create_deposits', 10),
(24, '2025_02_26_115656_create_withdrawals', 10),
(25, '2025_02_28_124521_add_profile_picture_to_users_table', 11),
(26, '2025_02_28_164119_add_preferences_to_users', 12),
(27, '2025_03_17_115656_create_companies', 13),
(29, '2025_03_18_115666_create_newsletters', 14),
(30, '2025_03_18_115666_create_site_settings', 15),
(31, '2025_03_20_115666_create_questions_and_answers', 16),
(32, '2025_03_20_115968_create_faqs', 17),
(33, '2025_03_21_115968_create_policy_categories', 18),
(34, '2025_03_21_115969_create_policies', 18),
(35, '2025_03_22_115968_create_blog_categories', 19),
(36, '2025_03_22_117894_create_blogs', 19),
(37, '2025_03_22_1249999_add_slug_to_blog_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribed` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `subscribed`, `created_at`, `updated_at`) VALUES
(2, 'fritzdultimate@gmail.com', 1, '2025-03-18 08:02:17', '2025-03-18 08:02:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('fritzdultimate@gmail.com', '948092', '2025-03-16 09:30:49');

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
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint UNSIGNED NOT NULL,
  `policy_category_id` bigint UNSIGNED NOT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `policy_category_id`, `heading`, `sub_heading`, `content`, `order`, `created_at`, `updated_at`) VALUES
(1, 3, 'Introduction', 'Welcome to Credittide,', '<p>Welcome to Credittide, a stock investment platform designed to provide users with seamless investment opportunities. Your privacy is of utmost importance to us, and we are committed to protecting your personal and financial information.</p>\r\n\r\n<p>This Privacy Policy explains how we collect, use, store, disclose, and protect your data. By using our services, you consent to the practices outlined in this policy.</p>', 0, '2025-03-21 10:30:38', '2025-03-21 10:30:38'),
(2, 3, ' Information We Collect', 'We collect different types of information, including:', '<ol class=\"list-decimal pl-6 space-y-2\">\n<li>Personal Information\n<ul class=\"list-disc pl-6 space-y-2\">\n<li>Full Name</li>\n<li>Email Address</li>\n<li>Phone Number</li>\n<li>Date of Birth</li>\n<li>Government-Issued Identification (e.g., National ID, Passport, Driver’s License)</li>\n<li>Residential Address</li>\n</ul>\n</li>\n<li>Financial Information\n<ul class=\"list-disc pl-6 space-y-2\">\n<li>Cryptocurrency Wallet Addresses</li>\n<li>Transaction History</li>\n</ul>\n</li>\n<li>Technical Information\n<ul class=\"list-disc pl-6 space-y-2\">\n<li>IP Address</li>\n<li>Device Type</li>\n<li>Browser Information</li>\n<li>Operating System</li>\n<li>Login Timestamps</li>\n</ul>\n</li>\n<li>Cookies and Tracking Technologies\n<p>We use cookies and similar tracking technologies to enhance user experience, remember preferences, and track analytics. You can manage cookie settings through your browser.</p>\n</li>\n</ol>', 0, '2025-03-21 11:41:02', '2025-03-21 11:41:02'),
(3, 3, 'How We Use Your Information', 'We use the collected data for:', '<ol class=\"list-decimal pl-6 space-y-2\">\n<li>Account Creation & Management: To set up and manage your investment account.</li>\n<li>Transaction Processing: To process deposits, withdrawals, and trades.</li>\n<li>Security & Fraud Prevention: To detect suspicious activities and protect your funds.</li>\n<li>Compliance with Regulations: To fulfill KYC (Know Your Customer) and AML (Anti-Money Laundering) requirements.</li>\n<li>Customer Support: To provide assistance and answer inquiries.</li>\n<li>Marketing & Promotions: To send investment insights and offers (you can opt-out anytime)</li>\n<li>Platform Improvement: To analyze user behavior and enhance platform functionality</li>\n</ol>', 0, '2025-03-21 12:10:01', '2025-03-21 12:10:01'),
(4, 3, 'How We Share Your Information', 'We do not sell, rent, or trade your personal information. However, we may share it under the following circumstances:', '<ol class=\"list-decimal pl-6 space-y-2\">\n                <li>\n                    With Service Providers\n                    <ul class=\"list-disc pl-6 space-y-1\">\n                        <li>Payment Processors</li>\n                        <li>Cloud Hosting Providers</li>\n<li>Fraud Detection Services</li>\n<li>Customer Support Tools</li>\n                    </ul>\n                </li>\n\n                </ol>', 0, NULL, NULL),
(5, 3, ' Legal Compliance & Law Enforcement', 'We may disclose your information if required by law or to comply with government requests, subpoenas, or legal investigations.', '', 0, '2025-03-21 12:27:06', '2025-03-21 12:27:06'),
(6, 3, 'Business Transfers', 'In the event of a merger, acquisition, or business restructuring, your data may be transferred to a new entity.', '', 0, '2025-03-21 16:28:44', '2025-03-21 12:28:44'),
(7, 3, 'Third-Party Integrations', 'If you use third-party services (e.g., stock market data providers), they may access certain information necessary for their functionality.', '', 0, '2025-03-21 12:28:44', '2025-03-21 12:28:44'),
(8, 3, 'Data Security Measures', 'We implement strict security measures to protect your data, including:', '', 0, '2025-03-21 12:30:06', '2025-03-21 12:30:06'),
(9, 3, 'Encryption & Secure Storage', '', '<ol class=\"list-decimal pl-6 space-y-2\">\r\n<li>All sensitive data is encrypted using AES-256 encryption.</li>\r\n<li>Transactions are secured using SSL/TLS protocols.</li>\r\n\r\n</ol>', 0, '2025-03-21 12:31:01', '2025-03-21 12:31:01'),
(10, 3, 'Two-Factor Authentication (2FA)', 'We encourage users to enable 2FA for enhanced account security.', '', 0, '2025-03-21 12:33:03', '2025-03-21 12:33:03'),
(11, 3, ' Access Control', 'Only authorized personnel have access to your data, and strict monitoring is in place to prevent breaches.', '', 0, '2025-03-21 12:33:39', '2025-03-21 12:33:39'),
(12, 3, 'Regular Security Audits', 'We conduct periodic security audits to identify vulnerabilities and improve protection.\r\n\r\n', '', 0, NULL, NULL),
(13, 3, 'Your Privacy Rights', 'Depending on your location, you may have the following rights regarding your personal data:', '<ul class=\"list-disc mt-4 pl-6\">\n<li>Right to Access: Request a copy of the data we hold about you.</li>\n<li>Right to Correction: Update inaccurate or incomplete information.</li>\n<li>Right to Deletion: Request data removal under certain conditions.</li>\n<li>Right to Restrict Processing: Limit how we use your data.</li>\n<li>Right to Withdraw Consent: Opt-out of marketing communications at any time.</li>\n<li>To exercise these rights, contact us at support@credittidestockcompany.com </li>\n</ul>', 0, '2025-03-21 12:34:48', '2025-03-21 12:34:48'),
(14, 3, 'Data Retention Policy', 'We retain your information:', '<ul class=\"list-disc mt-4 pl-6\">\r\n<li>As long as your account is active.</li>\r\n<li>As required for compliance with legal obligations (e.g., tax and AML laws).</li>\r\n<li>Until you request deletion, subject to regulatory requirements.</li>\r\n</ul>', 0, '2025-03-21 12:46:26', '2025-03-21 12:46:08'),
(15, 3, 'Cookies & Tracking Technologies', 'We use cookies to enhance your experience. Types of cookies include:', '<ul class=\"list-disc mt-4 pl-6\">\n<li>Essential Cookies: Necessary for platform functionality.</li>\n<li>Analytics Cookies: Track usage and improve performance</li>\n<li>Marketing Cookies: Deliver personalized advertisements.</li>\n</ul>', 0, '2025-03-21 12:46:08', '2025-03-21 12:46:08'),
(16, 3, 'International Data Transfers', 'If you access our platform from outside [Your Country], your data may be transferred and stored in jurisdictions with different privacy laws. We ensure compliance through:', '<ul class=\"list-disc mt-4 pl-6\">\r\n<li>Data Protection Agreements (DPAs)</li>\r\n<li>Standard Contractual Clauses (SCCs)</li>\r\n</ul>', 0, NULL, NULL),
(17, 3, 'Third-Party Links', 'Our platform may contain links to third-party websites. We are not responsible for their privacy practices, so we advise reviewing their policies before sharing data.', '', 0, '2025-03-22 12:50:19', '2025-03-22 12:50:19'),
(18, 3, 'Children\'s Privacy', 'Our platform is not intended for individuals under 18. We do not knowingly collect data from minors. If we discover such data, we will delete it immediately.', '', 0, '2025-03-22 02:59:27', '2025-03-22 02:59:27'),
(19, 3, 'Changes to This Privacy Policy', 'We may update this policy periodically. Changes will be posted on this page, and significant updates will be communicated via email or notifications.\r\n\r\nLast Updated: 22/03/2025 4:00 AM', '', 0, '2025-03-22 02:59:27', '2025-03-22 02:59:27'),
(20, 3, 'Contact Us', 'If you have any questions about this Privacy Policy or your data rights, contact us:', '<ol class=\"list-decimal pl-6 mt-5\">\r\n<li>📧 Email: support@credittidesupportcompany.com</li>\r\n<li>📍 Address: our company address</li>\r\n<li>📞 Phone: (343) 756 8748</li>\r\n</ol>', 0, '2025-03-22 03:01:35', '2025-03-22 03:01:35'),
(21, 1, 'Accepted Payment Methods', 'We only accept payments through cryptocurrency transactions. Our platform supports the following cryptocurrencies:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Bitcoin (BTC)</li>\r\n    <li>Ethereum (ETH)</li>\r\n    <li>Binance Smart Chain (BNB)</li>\r\n    <li>Tether (USDT - ERC20, BEP20, TRC20)</li>\r\n    <li>Other cryptocurrencies as updated on our platform</li>\r\n</ul>', 0, '2025-03-22 03:07:16', '2025-03-22 03:07:38'),
(22, 1, 'Payment Processing', 'Cryptocurrency payments are processed automatically via blockchain networks. Transactions are considered valid after the required number of confirmations on the respective blockchain.', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Bitcoin transactions require at least 3 confirmations.</li>\r\n    <li>Ethereum and ERC-20 token transactions require at least 12 confirmations.</li>\r\n    <li>BEP-20 and TRC-20 token transactions require at least 6 confirmations.</li>\r\n</ul>', 0, '2025-03-22 03:07:38', '2025-03-22 03:07:38'),
(23, 1, NULL, 'The processing time for payments depends on network congestion and transaction fees set by the sender.', '', 0, '2025-03-22 03:10:35', '2025-03-22 03:10:35'),
(24, 1, 'Transaction Fees', 'All cryptocurrency transactions are subject to network fees, which vary based on the blockchain. Our platform may charge additional service fees for processing withdrawals.', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Deposit fees: Free (only network fees apply).</li>\r\n    <li>Withdrawal fees: Vary depending on the cryptocurrency used.</li>\r\n</ul>', 0, '2025-03-22 03:12:32', '2025-03-22 03:12:32'),
(25, 1, 'Refund & Cancellation Policy', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Due to the nature of cryptocurrency transactions, payments are non-reversible and non-refundable.</li>\r\n    <li>Once a transaction is confirmed on the blockchain, we cannot issue a refund.</li>\r\n    <li>In case of a failed deposit or withdrawal, contact our support team with your transaction details.</li>\r\n</ul>', 0, '2025-03-22 03:12:32', '2025-03-22 03:12:32'),
(26, 1, 'Security & Fraud Prevention', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Users must ensure they send funds from secure and verified wallets.</li>\r\n    <li>We monitor transactions for fraudulent activity and reserve the right to suspend accounts involved in suspicious activities.</li>\r\n    <li>Users are responsible for safeguarding their wallet credentials and private keys.</li>\r\n</ul>', 0, '2025-03-22 03:14:28', '2025-03-22 03:14:28'),
(27, 1, 'Policy Updates', 'We reserve the right to update this Payment Policy at any time. Users will be notified of significant changes through their registered email or announcements on our platform.', '', 0, '2025-03-22 03:14:28', '2025-03-22 03:14:28'),
(28, 1, 'Contact Us', '', '<p class=\"\">\r\n    If you have any questions regarding this Payment Policy, please contact our support team at \r\n    <a href=\"mailto:support@credittidestockcompany.com\" class=\"text-sky-600 underline\">support@credittidestockcompany.com</a>.\r\n</p>', 0, '2025-03-22 03:15:54', '2025-03-22 03:15:54'),
(29, 2, NULL, 'Welcome to our stock investment platform. This Deposit Policy outlines the terms and conditions for depositing funds into your investment account. By using our platform, you agree to comply with this policy.', '', 0, '2025-03-22 03:18:03', '2025-03-22 03:18:03'),
(30, 2, 'Accepted Deposit Methods', 'Our platform accepts only cryptocurrency deposits. The following cryptocurrencies are supported:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Bitcoin (BTC)</li>\r\n    <li>Ethereum (ETH)</li>\r\n    <li>Binance Coin (BNB)</li>\r\n    <li>Tether (USDT - ERC20, BEP20, TRC20)</li>\r\n    <li>Other cryptocurrencies as listed on our deposit page</li>\r\n</ul>', 0, '2025-03-22 03:18:03', '2025-03-22 03:18:03'),
(31, 2, 'Deposit Process', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Each user is assigned a unique wallet address for deposits.</li>\r\n    <li>To make a deposit, send the selected cryptocurrency to your assigned wallet address.</li>\r\n    <li>Ensure you use the correct network for transactions (e.g., ERC20 for Ethereum-based tokens, TRC20 for Tron-based tokens).</li>\r\n    <li>After a successful transaction, your deposit will be credited once it receives the required blockchain confirmations.</li>\r\n</ul>', 0, '2025-03-22 03:19:51', '2025-03-22 03:19:51'),
(32, 2, 'Deposit Confirmation Time', 'Deposits are processed based on blockchain confirmations. The estimated time varies by cryptocurrency:\r\n</p>', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li><strong>Bitcoin (BTC):</strong> 3 confirmations (may take 10-30 minutes depending on network congestion).</li>\r\n    <li><strong>Ethereum (ETH) and ERC20 tokens:</strong> 12 confirmations (usually 5-10 minutes).</li>\r\n    <li><strong>BEP20 tokens (BNB, USDT-BEP20):</strong> 6 confirmations (typically 1-5 minutes).</li>\r\n    <li><strong>TRC20 tokens (USDT-TRC20):</strong> 6 confirmations (usually 1-3 minutes).</li>\r\n</ul>', 0, '2025-03-22 03:19:51', '2025-03-22 03:19:51'),
(33, 2, 'Minimum Deposit Amount', 'To prevent network congestion and ensure smooth processing, we enforce minimum deposit limits:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li><strong>Bitcoin (BTC):</strong> 0.005 BTC</li>\r\n    <li><strong>Ethereum (ETH):</strong> 0.1 ETH</li>\r\n    <li><strong>Binance Coin (BNB):</strong> 0.05 BNB</li>\r\n    <li><strong>Tether (USDT - ERC20, BEP20, TRC20):</strong> 100 USDT</li>\r\n</ul>', 0, '2025-03-22 03:21:25', '2025-03-22 03:21:25'),
(34, 2, NULL, 'Deposits below the minimum threshold may not be credited or refunded.', '', 0, '2025-03-22 03:21:25', '2025-03-22 03:21:25'),
(35, 2, 'Deposit Fees', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>We do not charge additional fees for deposits.</li>\r\n    <li>Users are responsible for blockchain network fees when sending cryptocurrency.</li>\r\n    <li>Ensure you check transaction fees on your wallet before initiating a deposit.</li>\r\n</ul>', 0, '2025-03-22 03:23:36', '2025-03-22 03:23:36'),
(36, 2, 'Incorrect Deposits', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Sending the wrong cryptocurrency to a wallet address may result in permanent loss.</li>\r\n    <li>Deposits made to an incorrect network (e.g., sending ERC20 USDT to a TRC20 address) may not be recoverable.</li>\r\n    <li>Users must double-check wallet addresses and networks before making transactions.</li>\r\n</ul>', 0, '2025-03-22 03:23:36', '2025-03-22 03:23:36'),
(37, 2, 'Deposit Reversal & Refunds', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Cryptocurrency transactions are irreversible once confirmed on the blockchain.</li>\r\n    <li>We do not offer refunds for successful deposits.</li>\r\n    <li>If a deposit is sent to an incorrect address, recovery may not be possible.</li>\r\n</ul>', 0, '2025-03-22 03:25:01', '2025-03-22 03:25:01'),
(38, 2, 'Deposit Delays', ' Deposits may be delayed due to the following reasons:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>High network congestion causing slow transaction confirmations.</li>\r\n    <li>Technical issues on the blockchain network.</li>\r\n    <li>Depositing an unsupported cryptocurrency.</li>\r\n    <li>Security reviews for suspicious transactions.</li>\r\n</ul>', 0, '2025-03-22 03:25:01', '2025-03-22 03:25:01'),
(39, 2, NULL, ' If your deposit is delayed for more than 2 hours, please contact support with the transaction hash.', '', 0, '2025-03-22 03:26:32', '2025-03-22 03:26:32'),
(40, 2, 'Security & Fraud Prevention', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>All deposit transactions are monitored for suspicious activity.</li>\r\n    <li>Users engaging in fraudulent deposits or money laundering may have their accounts suspended.</li>\r\n    <li>Ensure you are depositing from a wallet you control and not from third-party services with unclear policies.</li>\r\n</ul>', 0, '2025-03-22 03:26:32', '2025-03-22 03:26:32'),
(41, 2, 'Policy Updates', '', '<p class=\"\">\n    We reserve the right to modify this Deposit Policy at any time. Changes will be communicated through email or announcements on our platform.\n</p>', 0, '2025-03-22 03:27:39', '2025-03-22 03:27:39'),
(42, 2, 'Contact Us', '', '<p class=\"\">\n    If you have any questions about deposits, please contact our support team at \n    <a href=\"mailto:support@credittidestockcompany.com\" class=\"text-blue-600 underline\">support@credittidestockcompany.com</a>.\n</p>', 0, '2025-03-22 03:27:39', '2025-03-22 03:27:39'),
(43, 4, '', 'This Withdrawal Policy outlines the terms and conditions for withdrawing funds from your investment account. By using our platform, you agree to comply with this policy.', '', 0, '2025-03-22 03:31:36', '2025-03-22 03:31:36'),
(44, 4, 'Accepted Withdrawal Methods', 'All withdrawals on our platform are processed in cryptocurrency. The following cryptocurrencies are available for withdrawals:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Bitcoin (BTC)</li>\r\n    <li>Ethereum (ETH)</li>\r\n    <li>Binance Coin (BNB)</li>\r\n    <li>Tether (USDT - ERC20, BEP20, TRC20)</li>\r\n    <li>Other cryptocurrencies as listed on our withdrawal page</li>\r\n</ul>', 0, '2025-03-22 03:31:36', '2025-03-22 03:31:36'),
(45, 4, 'Withdrawal Process', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Users must log in and navigate to the withdrawal section.</li>\r\n    <li>Select the cryptocurrency for withdrawal and enter the recipient wallet address.</li>\r\n    <li>Specify the withdrawal amount (must be above the minimum limit).</li>\r\n    <li>Confirm the transaction using Two-Factor Authentication (2FA) for security.</li>\r\n    <li>Once submitted, the request is reviewed and processed by our system.</li>\r\n</ul>', 0, '2025-03-22 03:33:08', '2025-03-22 03:33:08'),
(46, 4, 'Withdrawal Processing Time', 'Withdrawals are processed based on the cryptocurrency selected. The estimated processing time is:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li><strong>Bitcoin (BTC):</strong> 30 minutes to 2 hours.</li>\r\n    <li><strong>Ethereum (ETH) and ERC20 tokens:</strong> 10 to 30 minutes.</li>\r\n    <li><strong>BEP20 tokens (BNB, USDT-BEP20):</strong> 5 to 15 minutes.</li>\r\n    <li><strong>TRC20 tokens (USDT-TRC20):</strong> 3 to 10 minutes.</li>\r\n</ul>', 0, '2025-03-22 03:33:08', '2025-03-22 03:33:08'),
(47, 4, 'Minimum and Maximum Withdrawal Limits', 'To ensure smooth transactions, we enforce withdrawal limits:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li><strong>Bitcoin (BTC):</strong> Minimum 0.001 BTC, Maximum 5 BTC per transaction.</li>\r\n    <li><strong>Ethereum (ETH):</strong> Minimum 0.02 ETH, Maximum 50 ETH per transaction.</li>\r\n    <li><strong>Binance Coin (BNB):</strong> Minimum 0.01 BNB, Maximum 100 BNB per transaction.</li>\r\n    <li><strong>Tether (USDT - ERC20, BEP20, TRC20):</strong> Minimum 10 USDT, Maximum 50,000 USDT per transaction.</li>\r\n</ul>', 0, '2025-03-22 03:34:40', '2025-03-22 03:34:40'),
(48, 4, 'Withdrawal Fees', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>A network fee applies to all withdrawals and varies based on blockchain congestion.</li>\r\n    <li>Withdrawal fees are displayed before confirming the transaction.</li>\r\n    <li>Ensure you check the applicable fees on the withdrawal page.</li>\r\n</ul>', 0, '2025-03-22 03:34:40', '2025-03-22 03:34:40'),
(49, 4, 'Security and Verification', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Users must enable Two-Factor Authentication (2FA) for withdrawals.</li>\r\n    <li>Large withdrawals may require additional verification for security purposes.</li>\r\n    <li>To prevent fraud, withdrawals to new wallet addresses may be subject to review.</li>\r\n</ul>', 0, '2025-03-22 03:36:18', '2025-03-22 03:36:18'),
(50, 4, 'Delayed Withdrawals', ' Withdrawals may be delayed due to:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>High blockchain network congestion.</li>\r\n    <li>Security reviews or suspicious activity detection.</li>\r\n    <li>Incorrect wallet address provided by the user.</li>\r\n    <li>Withdrawal requests exceeding daily platform limits.</li>\r\n</ul>', 0, '2025-03-22 03:36:18', '2025-03-22 03:36:18'),
(51, 4, NULL, 'If your withdrawal is delayed beyond the expected processing time, please contact support.', '', 0, '2025-03-22 03:37:51', '2025-03-22 03:37:51'),
(52, 4, 'Rejected Withdrawals', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Withdrawals may be rejected if the account has insufficient funds.</li>\r\n    <li>Accounts under investigation for fraudulent activities will have withdrawals blocked.</li>\r\n    <li>Incorrect withdrawal details may lead to automatic rejection.</li>\r\n</ul>', 0, '2025-03-22 03:37:51', '2025-03-22 03:37:51'),
(53, 4, 'Irreversible Transactions', 'Cryptocurrency transactions are irreversible. Once a withdrawal is processed, funds cannot be recovered. Users must ensure they enter the correct wallet address.', '', 0, '2025-03-22 03:39:05', '2025-03-22 03:39:05'),
(54, 4, 'Policy Updates', 'We reserve the right to update this Withdrawal Policy at any time. Users will be notified of significant changes via email or announcements on our platform.', '', 0, '2025-03-22 03:39:05', '2025-03-22 03:39:05'),
(55, 4, 'Contact Us', '', '<p class=\"\">\r\n    For assistance with withdrawals, please contact our support team at \r\n    <a href=\"mailto:support@credittidestockcompany.com\" class=\"text-sky-600 underline\">support@credittidestockcompany.com</a>.\r\n</p>', 0, '2025-03-22 03:40:28', '2025-03-22 03:40:28'),
(56, 5, NULL, '', '<p class=\"mb-4\">     Welcome to <strong>Credittide</strong>. These Terms and Conditions govern your access and use of our platform, including all services, investment opportunities, and tools available. By signing up, accessing, or using our platform, you agree to abide by these Terms and Conditions. </p>', 0, '2025-03-22 03:44:38', '2025-03-22 03:44:38'),
(57, 5, 'Acceptance of Terms', '', '<p class=\"\">\r\n    By using our platform, you acknowledge that you have read, understood, and agree to these Terms. If you do not agree with any part of these Terms, you should discontinue the use of our services immediately.\r\n</p>', 0, '2025-03-22 03:46:25', '2025-03-22 03:46:25'),
(58, 5, 'Eligibility', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>You must be at least 18 years old to use our services.</li>\r\n    <li>By using our platform, you confirm that you comply with the laws and regulations of your country.</li>\r\n    <li>We reserve the right to suspend or terminate your account if we discover any misrepresentation of identity or eligibility.</li>\r\n</ul>', 0, '2025-03-22 03:46:25', '2025-03-22 03:46:25'),
(59, 5, 'Investment Risks', 'Investing in stocks and cryptocurrency carries financial risk. By using our platform, you acknowledge that:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>All investments are subject to market risks, and past performance does not guarantee future results.</li>\r\n    <li>We do not offer financial, legal, or tax advice. You are responsible for your investment decisions.</li>\r\n    <li>Losses from investments are solely your responsibility.</li>\r\n</ul>', 0, '2025-03-22 03:48:00', '2025-03-22 03:48:00'),
(60, 5, 'Account Registration and Security', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Users must provide accurate personal information during registration.</li>\r\n    <li>Users are responsible for maintaining the confidentiality of their account credentials.</li>\r\n    <li>If unauthorized access to your account is suspected, report it to support immediately.</li>\r\n</ul>', 0, '2025-03-22 03:48:00', '2025-03-22 03:48:00'),
(61, 5, 'Payment and Deposits', 'We accept cryptocurrency payments for deposits and investments. You acknowledge that:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Deposits made in cryptocurrency are final and cannot be reversed.</li>\r\n    <li>The processing time for deposits may vary depending on network congestion.</li>\r\n    <li>Transaction fees apply and are displayed before completing your deposit.</li>\r\n</ul>', 0, '2025-03-22 03:49:33', '2025-03-22 03:49:33'),
(62, 5, 'Withdrawals', 'Withdrawals are subject to the following conditions:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Withdrawals are processed only in cryptocurrency.</li>\r\n    <li>Minimum and maximum withdrawal limits apply.</li>\r\n    <li>Processing times depend on network congestion and security verification.</li>\r\n    <li>All transactions are final; once a withdrawal is processed, it cannot be reversed.</li>\r\n</ul>', 0, '2025-03-22 03:49:33', '2025-03-22 03:49:33'),
(63, 5, 'Transaction Fees', '', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>We may charge transaction fees for deposits, withdrawals, and other services.</li>\r\n    <li>Fees will be displayed before confirming a transaction.</li>\r\n    <li>We reserve the right to modify fees at any time.</li>\r\n</ul>', 0, '2025-03-22 03:51:08', '2025-03-22 03:51:08'),
(64, 5, 'Prohibited Activities', 'Users are strictly prohibited from engaging in the following activities:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Money laundering, fraud, or illegal financial activities.</li>\r\n    <li>Unauthorized access to our platform or data.</li>\r\n    <li>Creating multiple accounts to bypass system rules.</li>\r\n    <li>Any activities that violate applicable laws and regulations.</li>\r\n</ul>', 0, '2025-03-22 03:51:08', '2025-03-22 03:51:08'),
(65, 5, ' Account Termination', 'We reserve the right to terminate or suspend any account without prior notice if:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>We detect fraudulent or suspicious activities.</li>\r\n    <li>The user violates any terms stated in this agreement.</li>\r\n    <li>We receive official legal or regulatory requests.</li>\r\n</ul>', 0, '2025-03-22 03:53:02', '2025-03-22 03:53:02'),
(66, 5, 'Limitation of Liability', 'We are not responsible for:', '<ul class=\"list-disc pl-6 space-y-1\">\r\n    <li>Losses incurred from investments or transactions.</li>\r\n    <li>Network delays, transaction failures, or force majeure events.</li>\r\n    <li>Third-party service failures that affect our platform.</li>\r\n</ul>', 0, '2025-03-22 03:53:02', '2025-03-22 03:53:02'),
(67, 5, 'Privacy Policy', '', '<p class=\"\">\r\n    Your personal information is handled in accordance with our <a href=\"/policies/general\" class=\"text-sky-600 underline\">Privacy Policy</a>. By using our platform, you consent to data collection and processing as outlined in the Privacy Policy.\r\n</p>', 0, '2025-03-22 03:54:32', '2025-03-22 03:54:32'),
(68, 5, 'Updates to Terms', ' We may update these Terms from time to time. Users will be notified of significant changes. Continued use of our platform after updates constitutes agreement to the revised terms.', '', 0, '2025-03-22 03:54:32', '2025-03-22 03:54:32'),
(69, 5, 'Contact Information', '', '<p class=\"\">\r\n    If you have any questions regarding these Terms, please contact us at \r\n    <a href=\"mailto:support@credittidestockcompany.com\" class=\"text-sky-600 underline\">support@credittidestockcompany.com</a>.\r\n</p>', 0, '2025-03-22 03:56:47', '2025-03-22 03:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `policy_categories`
--

CREATE TABLE `policy_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category` enum('payment','deposit','withdrawal','general','terms-and-conditions') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policy_categories`
--

INSERT INTO `policy_categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'payment', 1, '2025-03-21 10:29:26', '2025-03-21 10:29:26'),
(2, 'deposit', 1, '2025-03-21 10:29:26', '2025-03-21 10:29:26'),
(3, 'general', 1, '2025-03-21 11:39:47', '2025-03-21 11:39:52'),
(4, 'withdrawal', 1, '2025-03-21 11:40:00', '2025-03-21 11:40:04'),
(5, 'terms-and-conditions', 1, '2025-03-21 11:40:07', '2025-03-21 11:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('yes_no','multiple_choice','custom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Do you have any prior experience with stock investments?', 'yes_no', '2025-03-20 13:15:48', NULL),
(2, 'What is your primary investment goal?', 'multiple_choice', '2025-03-20 13:15:52', NULL),
(3, 'How long do you plan to keep your money invested', 'multiple_choice', '2025-03-20 13:15:58', '2025-03-20 13:15:58'),
(4, 'How would you react if your portfolio dropped by 10% in a week?', 'multiple_choice', '2025-03-20 13:15:58', '2025-03-20 13:15:58'),
(5, 'Have you ever invested in cryptocurrencies or forex trading?', 'yes_no', '2025-03-20 13:21:05', '2025-03-20 13:21:05'),
(6, 'Would you be comfortable seeing your investment lose value temporarily?', 'yes_no', '2025-03-20 13:21:05', '2025-03-20 13:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_answers`
--

INSERT INTO `question_answers` (`id`, `question_id`, `answer`, `created_at`, `updated_at`) VALUES
(1, 2, 'Wealth preservation', '2025-03-20 13:15:27', NULL),
(2, 2, 'steady income', '2025-03-20 13:15:32', NULL),
(3, 2, 'moderate growth', '2025-03-20 13:15:36', NULL),
(4, 2, 'high returns', '2025-03-20 13:15:40', NULL),
(5, 3, 'Less than 1 year', '2025-03-20 13:17:10', '2025-03-20 13:17:10'),
(6, 3, '1-3 years', '2025-03-20 13:17:10', '2025-03-20 13:17:10'),
(7, 3, '3-5 years', '2025-03-20 13:18:11', '2025-03-20 13:18:11'),
(8, 3, 'More than 5 years', '2025-03-20 13:18:11', '2025-03-20 13:18:11'),
(9, 4, 'Sell immediately to cut losses', '2025-03-20 13:19:08', '2025-03-20 13:19:08'),
(10, 4, 'Reduce investment', '2025-03-20 13:19:08', '2025-03-20 13:19:08'),
(11, 4, 'Do nothing and wait', '2025-03-20 13:20:13', '2025-03-20 13:20:13'),
(12, 4, 'Buy more at a lower price', '2025-03-20 13:20:13', '2025-03-20 13:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `referrer_id` bigint UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_bonuses`
--

CREATE TABLE `referral_bonuses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `referred_user_id` bigint UNSIGNED NOT NULL,
  `investment_id` bigint UNSIGNED NOT NULL,
  `bonus` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0Dl4seizo10K8ahawJojKB39yLEahvyNvdMFo4Wq', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnlQWnBXV3hkcHpiNXBlTkZhRU4zcE0wUVU3NlpoVnZOMXFZeEVwMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722595),
('0EblGFOq9TI5qtOJrZrpyWICKWTf6QNo91bVj7iy', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjBKVENuYmYwMFVJZEdhQlBpaldITzQ4MTBsNnpvOFpRUHpmUzVvaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728857),
('0fmyvgbYflCwoScLtUj15T3z8sBSJwlXj7sRxh0P', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNG5LMml5WlBFVUExNDJYeDhuR0pLUVJ0Zm9kc29CbFZDTDNvMWxIRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728070),
('0NgKQ3BHhlmtAVOsCU4S53TNwNZGNQ74EymvQpWQ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWJUQUMyWDRRZ3dBMTZONjZ0UFZQckdsMHdpVWpTOGkxc0tCaEo2YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726165),
('1bcUZ8cauK4O99cRkeAx9tg8gBgzuiSfIxbdPvFE', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzhYdEJuWDJqRWNveTRvOUxqVjBPRVptM2dRRExzZ1hCaldFeFpBeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724167),
('1dkvLwdTXHJ0ypY7IYcSbsiywUzTirDqt0ZPyBqG', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzl1SFNpYnNremtWWlJpNGt1MEdIYkdwbXJiNVA1enhCbG04dllnVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723235),
('1suUIOeR08ROxhW4W6rX9CYySddN2a5K72gRVXZS', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWxqSENiVllPN2NFd0JiQmNFM1pPWUN3ckhraTRwVU1XaTJ4VGh2ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725442),
('287jcAMr3bxR0crGt5EQB5T4zzWg8RET1oLeqxvk', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWxlVUJJWElXMG1FM0E2dEZPZGVOYlRRMkZGdTBjRUVheUZQcEo4RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721714),
('2CPsbXPRTzrEKJv3mPoJmr6GBwRIwgHCiVHcaHkP', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmMxbkNxbndFRkpnUmxPZzVLT1pSaHpTWVlCenN2a20zRkxsUjFpSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728745),
('2E9gDOcuXRzrJzo2W2Y8G0pyrWF3sm4AiwizAzOb', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm1JbVV2bFRYTFIxNHR3RTNWelkzSzhtY1hZYkxJRTB2bWJZazEyZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721832),
('2kAM6cS3bkvF3JnLhL8vlF3z6VZmDCzhIdSJcuwy', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlUzejBnQUhOMVp6eWVNM093c0hoT0xtV1NyaDMxTkR1ZVYySHJ1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722813),
('2mJtreT1AEHrvemfzAMWnDhiCqZYgtxLEjVrJYkl', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUZOQUR5amhnYmc3MUR4TnI4bHR5NDhMeW1GQVZqeU1TamZrS3BFaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726866),
('3DwErqkRJ0QnDasa71CBCdUvjUg55u1MS7nfZtDp', NULL, '172.20.10.3', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT2h6azVhbkoxR2NGb250cUIxTnpaWWpaWXJtUmFkbWVZSnJoZ0VvaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727967),
('3EgEdOatYYOPW9HRgTZDXFtItpWlp8oPsq899rF2', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXM5c1lDbjNOUnk1RHNYNzRGS05NNWVEWHp1RmxHQ2dDVk84dDlWNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721733),
('3Fo7EzVVLLCBBWp8puWnkv2fhGzZwytQ29QvixJe', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVJDVVJnUkdnQmpOanF1SDgwd05KeDdhaXFQbEVkczN5SzlscWZlRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726810),
('3u6defeg9pXtnKJVdxrN9r8OkwYkHksUhdq8NBgw', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnN5REdmZlE4NEY4Mzc1aHlTZVNnMWpXamVWRkswM1l5NUJXY2kyWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728216),
('3yVyRIKtVBEjuTgRPk66OCQUHVd6KQrcy1ZRV0OQ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT29COVhNRFNSeTVyb3NETEJjb1N5TmRKQzg0Y0JOOEJtUGVEU0dFMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728472),
('477xYDFty1SsXa5JHfmsFUwZMyck2LKLYdhAGMai', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzd5SFV3SlNqSktVNmFPeHFERmJYUlI4ckJTb2xXQ3Bvcnd1eE5QbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727184),
('4SBjEyHBuvU944SAvCFJmzJIeqb2QBBBhieL0o7h', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnRCOEZlNVZnbFRPVkdHWGdSUUhuYWg3VnBKQXlObkd2d3A2ZGJ1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728595),
('51VkGoxwg95kzMGxUP9CRTmm8xY1KtFIFmgkORHF', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUQ3QmV4aTVKOXl2dWNxSkJNNHFWbWlLdlE0RW9oTUowRDJyTzB2cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728591),
('5MZsutaVVGqkVkxchYAJ5bxZ7SPM87QKdFScbEqN', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnBjZDhUdGZXajFvbUllU3RzRTRhT2tpMDE0RFF0Z3lkemVBWEdPMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724147),
('66mebIyPIsMhcL93luXDxtR2x3g4ZtGLibpbz5wD', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlg3aFB5OEtldURSWmtBV09hZGlLZlowOG9yS0tTWWpvcXFyU0I3ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742729351),
('6AkNCHhO6VqURqbCYBHMwoUHLyrq3fw4JasiGRCa', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWExaWtKVVVDVWVjdDREdnlTWFlJZnlwa0R1NnVmcWZYN08yaVZwbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725569),
('6gMREB0a85FoKIhWPPd0T5TryeMQhsCBu0g60XAO', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHp1V2hXTDBrR29nNEE4UUtsOEFJRGRZMmVlR0IzR0lkQVRPb2h1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726430),
('6OTWHp2oeL22UptUOvpDGF1nX5uJEHpNJ1asjuOV', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNngxSkNYbFZOSzBsa0VqT2hhU2plMzNNNE5zZktyQ2VzQTBzOXdPbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723057),
('6RXsXS6xr20eS6bFO1lmOepVuxtXT4zQDwn1Z6Dz', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWdxTWVSalNtdWV2amdaZTY1ME51M1hDNzdvVEhzaXl2cUcyN3F6MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725705),
('6v7cTYSSbtCe5CNsoTvHu6zV1wdlHQV8r0LqPPwF', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0dZMVA1TFI2RzdTUVFHeG45SmZ5Tks1M1ExaWowNUlBYkY2aGptMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727194),
('6zTkZ7Iik1VwgwiVjdxG6yWd1E9AmTrY98pHIwO4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjZDaU9GckJPZjU5bVowbGFSeHVVQW11VDEzNWxtcnNEYVFCSE1PRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725339),
('76ir6G1YGUz2bpWVWfkjZxQ1H6Xur2CUSMJaQkkl', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlk4d2FjRlBraUpzQlJXVVZFSFg3SHN1QzdrVTk4aWN5VTVoQzlNVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727066),
('7FXSDBUxmP1pG4y4AaNWrjyAmtCqkX7HDObRmCTt', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1R2U3JtbWM2Y1hqTEViQU1SUzlZbUhDOGRXd3VqME92S3RudnAwUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728574),
('7gL43Ud1U6SuhFAJem22iE6U3B1QUkDSIYt4geXC', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUVaN3g5RHROQ244WHJGaXdMZXA3bzE4NjZNb2pjeHZVYjNUMHo4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727459),
('7kdcfXlWLycRndBFVs1URZvMTsiwpMeinLA9ltiu', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWJRYkJxQXlVaWt4WmtNSDk5VWw4Y3pTbFh6S2RSbUcyaFFlSExqciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L2l0ZW0vMi9saWtlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728080),
('8bjirbsPayILQyhIu8HHxInTjEy8gAV5bXOFdBmA', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3ZEbjI4bkcwOVNuTWVzMzVFaXlCcldsNDBodHBGOEc2eDFzODVmayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722548),
('8DAI6X42teJly9KOsHhOjPPrUDnWbEbCF7vwybjd', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2dQZEg0WHBTNDhwUHh0Szk1b3lwbnJLRWNCVndMY0ZmVk9rZmJSQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728797),
('9F4Mr3x54xabS4oHbFObkYJzm5AaaVIZ8EBzG6l9', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmhBMzVDMlg0UmR4eGFFZUFrV0VCYVFBVDlkdWx6blFhODA5MHdRbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723108),
('9HctfwyRUBdrC7lhhmIK9u5Lk9fhJeJVELVND8Id', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlNjQ3U3bmFPRmZ0QmMwa1dkanl6U1NYMjRRUFFsZ2s2T1RFNlJ6eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728770),
('9pzJHi3khGIfu9OGrNV79s6y9nofZN9v18ewQMwl', NULL, '172.20.10.3', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiampSWkhWOFlXU0dxSFRVdjRuYXU0VnNJS1hCQVFoMEk2WkROMnpRMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL3N0b3JhZ2UvdXBsb2Fkcy9hdXRob3JzL2JsYW5rLXBpY3R1cmUucG5nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721733),
('9V7maKKh9K8Fejzz8N2acMQmxecqwfA08el9InYn', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXQ5QUZFUk1pOU9zdFEzYjJNcTBzVG02Mjh3TFBCSWtMWFlzYjhORCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722955),
('a2V0y53kv7tlGDXgtlzPO9dly98R1VfsEOTZTySC', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHNUTFU1WDRaYjdkYWNTbmlKcDBuSzMzaVhjN0hjbnZtM0NPY1dUTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726821),
('ABM33nhtXAmPVSMoJwnAjspBaqywLGarHUu7fjV5', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFNDSllwNGVrcXIybHlsczRDRlEwTHpvYmtDb2tkSldHMWNhYWxmeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725577),
('AHLaOjAKgKI5Qg8HJNKlbTPWYvJPX4wbY2LgH6p7', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTJsQjlwV1o4MmJ4QUV1Z3BwRFViSExIUzl5a2Z0aE9pb1p0RUZZWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728003),
('AIShaWormGZyIxXnHO9OQHyOtYHVBB3oqIqvtF4B', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEdQVE5NNlp5Mzh6bVNnczBtd0toaVJSZ1hLam5FVXlXSmY4YUg2eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725475),
('aPTDnzZshJX01mKl5wGFK81xgRZgwhzL3PXplvpU', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0ROVkdlZVV4eTFIR1o1THdGdldLRjdKb2RHY3NHT2F6dnM2TFZiZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727141),
('AWWlXDa490qaFmfGVhdKMdx3loFzN2EbVUZeBmuK', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVZSOWVUVmhFTFhMeFpUbU1WWUtHeHhwZ3lzVXRFbEEyNE1IMGFSVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723939),
('b7HPvluNOrW7nTlo7cVVOjhhJvkAbVoHwHpp5qA8', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXJmTFZ4SEdUVlhjV3hCb080T2l4eWlCT0Q3R25zNnB4VEVWRzN4MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727174),
('BF3yl2CZlAzxnHCYxnqsDbpZNGMKOCACPJC1wKEG', NULL, '172.20.10.3', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUlFM0tYZG5hTUtjdU9YWWNrbFVUaWVXWGl0QktiUjVLc2dldzBZciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL3N0b3JhZ2UvdXBsb2Fkcy9hdXRob3JzL2JsYW5rLXBpY3R1cmUucG5nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721726),
('Blh6jscg1Rth7AI1xYAOwWj1UxFuJXa35QsqHZSs', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGowRWZUNmk4djY4VW5La1gyemN4Q3RzOFFzaWl6VnFwS0d3TUpLViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728619),
('bnBbkuiuu3PRW5QreuR2nj4HqpuhaACte8p3ZDX4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmpsTVp3RDVWUGVVSW5VeTM5Rks2TW82aDdvZjR1RERSREltUE9qaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728303),
('bRemeiv2x0OXvOyeESLgTt7I01976dtgpQ2nocr4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWtEWTd6SEkwV2ZFdUx5R0ZhNm1Sb2RueVcwak9yZThUbUg2amtvYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726922),
('CfI2EPm9c6kWffJuVoTfhJIdMIsy9OxcGhAaqEPA', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieENneWRqV2NybWlsSHp3Wkx3MnBLQ29pcjhXWktBa3FQV3dWREtwMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728636),
('coWlArKCgj606aRVwawIT4PI5VOhmZdkmkh2C0Iy', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUJ4b2k5TnRYcGRzclNRclpDcGZVZTROd0pjVVVLSU04NGRYVkZ5YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725593),
('CW47tzGCjL4otzN7S0s7refRYnRr7p56U4C6CXeA', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTFpMW9MTlFlZW52cFk0YWhLdU5XVWdJanU5cnZxZjVidXFwZ3M2ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728450),
('CzV3kfw5jVvAkQmANcSsEKikvz8I4v0WZp5SDrLu', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDBsaUtLN3JPN0NxV3NLelpXR2hhSGU4YzF4YlZmR1lMZnNIekdRaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727111),
('DgaA4RQaHjza3VPWBTrBeFemGHoppRz6EOVEI5NZ', NULL, '172.20.10.3', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoianJCT3UzOUdpcnlLSE5ibkJyUUR3Rkd6SEg2UlBraW5YREYwdXNvbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727918),
('DhBcTxoCa1VsdkqtREGp6ZmJiniXnipWXZ9y7D7M', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWZ0QzhwQTdOTUI4MUdGOVU5dlpqNTQ2enZXNWZITHFpTE1ZSGdRayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728784),
('dqKqysHthAmMNmsKsdLFmXceJx4ktQm8WMNnYaMV', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUh3alNoUFIzWjJoMGt2bG43REh0cTlDcnJTMjA2QlBudGlGQnMxVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725386),
('DtifmZE1gszFkRDtVJPiiXLK0CKmugLoSpcUs5tZ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFhzOWVpWXBpcllCNHpZbDZPZGpCU3ViU3pwVE1BQVkyaThUMWNuWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728608),
('Dy8ANNcLQ71KjqifNoinXGXfFuD31rwGDSCHyZO3', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejBIOUQ0eHRFUlZjbDVQQXJVYnpPR25GS2dWVUtrNDJaT0IxSnlKZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726465),
('E7bIi9g4U4cwo3plc3whHGT3fLl9xDoUBot7PGSK', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXZDRkJzNmhJeU5IMzF6QUFmRXFHTlNiWjFLNGcwQ1ZCUlhGc3p4QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728603),
('ECbhNlfHEp2BjLqXkQwGonuaPesTV8tzSFKNDURj', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWJVcXNaV3NoWE5WRkRxMmVwN1dLeFVyeHo2VmwzUHVXd1gxeDJmcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723423),
('ekaakW8bwoi1acz5vf7R5DLyXOlu579Nj5y7JDmO', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXlJVTFlcm1ISHpYTEhkbVNRUXBqVnRuM0pUNkpkTm5ySUlMbk9zcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721350),
('eRIAnu9h7ccAnjOpPxzPDs6AcWeaFRthtDSZo8A4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1luZEhsdWpQZmVPSnlkeTB3UmFnYnU5YTB0UnVZczFqT1hhTndlOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9zdG9jay1tYXJrZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1742728622),
('EuSiQHKeaQ4x31caG7Pv5r7aSQMBeRxGqPui2Azt', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzZMemVoV2FKVk12NEFucnNyMkg3dTliazh0Q3RobXVSb050NmRyYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727061),
('Fdqm37dFHUJyhp8UtCYMNMRWzzmSxPLED0RhHIzg', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODRsVzVlNEllczNDZksxbnJETDdldDV0Q0JncUlScVRuM2M4STlWciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728549),
('fJMougvowyAaxYiQYjib7XTw9Pvaf9X8Wvdn19d6', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkJ0N0h2c3JJREpzcWlydnJWT2M1SVl0TjFPNmh5M1BHeXhwdjFYYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721993),
('fkIY6kvgjjJbHkzYg8jXNqHNn68ujDBazq6NcHeP', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk1hbThoVER5R1NQdFBNSmk4UlptSjFvV3EzbWhiUjRDdUc4c2YwbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724207),
('fwnyDe8jaf3IV4hcONGErYeVyvGBq2GG9JNSWSIP', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDBUNnhScjg3MzBlbWNFTW40S0thUTRXM0kwZktWMjNLQVU1NTZMVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721789),
('gE3WfvaRjtfQS3UkNzeiW1TL234DdneRydlWNBAk', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJLcVNhWVVaNUdTYjNxbmNpTzJnMThqQXk1eDE2MFpDcklYbGRFSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723204),
('gFgNZqstKnWPbBhvgIpceVRbm13nQsYkB6CevrR0', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXpnZkhocEQ0cTl4RUUzWEpBRHpHZUR4ZkYzWmdGT0F6TjJYeVlHeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722908),
('gPTFllTfIiwRGyocUzBlXTh8yU9xE1RAwN1EL4On', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFh3Y3M1cnBkNUlzamJ3MnlaQ3l0aXhFRjNRZ0lkanJGQ3dIdXVBUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726103),
('GQ9TM3mRlbKRuK2VC7APZGT6u7Gz65mYf9iJo7Ro', NULL, '172.20.10.3', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiREpSc3dmMUxnb3VLVDE1THlxMEU2ZkNCNUVlMVNyUUlnZHhZeGJOVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727917),
('h013WnGJ5nwRaWf7EEyVfyuCFjEzkWKZDm6NKkix', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0hxWlFSVXpPUUV2ZDJrRGlEZ1cxTnljVk5TMHBPVG5aQ3QzaXZ6ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726517),
('h1JQ3UNVmwdnDZ0XSZ3JrLhZewyI3S8kr3VELL8K', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2hGRUdxMnZQUXhZam4wT2ViWUpSU090RkVMUVRXUVUzY0hGNUNhWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723329),
('h3uEAkYiUGjPGVSXLLu3yfNv5W8IzltGnJ7ioCHW', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVdiUlA0cHZKa1pwWHR5aVJTWXl6SGduUXlqZmc5N3pxTGlHdUlyWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726708),
('H3ZEQblZHQksWPbsQ7NQaNs9Z08RoyUp0UUBD871', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1RnZjZOamNLazBOYmREOUUxSWl4YVNwNHpTTHVyaktVcXMyanBMMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742729311),
('h63dXLDyzpOAT3MEjpd9l9RgS2NA1XlU0UZocQoh', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGRndHM5dVIyY25hU203OVk0VWNKZFlmSldZQ0lPV3R3dTlVd1A0dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727911),
('HePLfpBcDpuaOudzHBwxU1T9Lq9xGxjSJ3UurtYZ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUhrNDZIZWpNcmVjTTJ6eUFaNk93YWlYZlBwMVYwZFFwQXpuYVRwZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723468),
('hs26HydebsGJZXqx4tNN8Ir7S300iisjpIz35lME', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUtMTHBma0NDZG45SEZTc01FbWJBVDRNcTdBUzlxU21SNGNBUDF1ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726915),
('hx07FNAbCa48ZsPnufKUQvd4zhNeuecnxy3frCJH', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3dTdFlTWEJ6bG5LOFJ2OGNkSkwxeWtvWlVtbUVpT3I3UlRQRG1WTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727156),
('I2djdS3aJb0g6HTTJ6V0RYTpASgYj4ddRU0lL22S', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXp4NHJJcjR6azd0c1R2NjBseDY5ZzB2c3dud3FiNHBMTXVGZ2NTUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725683),
('I37AALz9icPtIyMB7UzhRBCDFS4bGt6wLZUIOAbd', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW9qT0MxZlU1M05jM1dUWTBhWWpMWXZLWUFXc21YT2VrMEFTbExxOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728168),
('i3oW3z5TuIjFVA9rboTFZkuDoQryGJ1sbfLlzHvM', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRng4aWhMZURKdFhyc05zZ1V4OWZ1YUpIOUJVSFFCOGNSRjAySE9lOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727209),
('i5fmLDHE5gKtjsnF3wQIL33NaQw7SbBo3HvaUD7Y', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnIyQzJSUmlUTklqTWFoSWZPZ2c3VkRTWXZVbm1iNUZjWXJKZjlYQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725529),
('IjgscziavCJxczA0OMzweBGHndKLIaG3vt5rmsTg', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW1pOVRFMzZrUjZFUkR0OE41WEZaRkU5SnFPVlJOenJHbGgyRWpVaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721981),
('ILhRC2lam7uatHDFkmjcC46SILmpksoB3VfN44oc', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTVETjhVcG5qN3A2YndCb285bWY1YzhsNHlMV3BmWUdmNkJFSVRNSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728609),
('IlZ0QHqTQ23NED0s2k51d2ypH9ypKse2MrhA7NYC', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTFuNFNEVnlWZlVPV1pTaXhZUmFmWVo3Yzg2ZmgxRzBPMGR4MGU1aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728155),
('ItKBe9BjCAWpthTsTviaAePWz8VcSmZgqQyBseou', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFEzblQzZEdyekhXSlUyQ1NmdkQwRTk4SnZCWGNvOHNYUGJUMU9jViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726775),
('iUyDHm0EixyhLgQ8WrVMO38nNbwUz7iA7bXu1USY', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTJCZVBFZUlSN1pkc3ZGd0VnMWxEZWo2c0tCRDBlSXRRamJ5MnhLQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727917),
('ixIJnYJLC8Ug1x9gU6GMcenylOj7baSe4eVsEHZc', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmloWk9wR3h1TkJSZDBUY1BjaXhDZWY5Q1M5NkxjRmZkMlVnZmsxOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723447),
('ixt7nEv5KmK8LkzhOFM8jeaxOWtrU7EOd5H9Od4g', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUtCNlJUWHlJckJQdXJmTmhqYXM0cE5WN3BGVjBNUkw5cllndnhSaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742722000),
('IzRXxLO7iMN09ie9L3vIPY2aY0gWFOa3WHyB0Xgt', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0VjcE9xVUppUHNQRnR0SkQ5M1loRUloMTY2cXhIY25INjgxRnQyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726403),
('j8eL4V3aEJ5n1pWEWUGw4S2pXSsuT99NstBGE7ob', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhQc25aWFF5MEdXb3hkVnhtSXpOV2dWVzJZT2l3U1ViaEx1N3dEZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726874),
('jGU3yZCmBGIzxBjccYtdDqA6rmsrmEw2nUY5W2Hy', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWFKckpuWFNEc1hqaTRmdDMyYWhNZ2FkdFZJTVZSU1ZYQjBhRjVBSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725499),
('JN7CQ1iYEZgiWhB6aMUgA8ZDw20iam8TOxrIfmtJ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTRLazZ4dXRycjFVaW11MEloV09kMXdqQjhpTkFodGVUc1hzQ3hrQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724037),
('jPho7npSbYwcUfRiyTkTJ7BHITB6RjI086VroTxe', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXdvUEdGTkJwcGdrWklHVTVWOFkyM3JDTk16bGx4OXM5SE9JMVd4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725522),
('jVyBT4jJWo4ATRYbJcLhgSJuL7hkbYPPeAdx4tLJ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmlzbWZWUFJCdjg2VEFDZkRaNXN4N0M2c0Foek9sRFdGUVl0UzBTcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723022),
('Jw2FonX53oRwVGG2enEkxdOj7jlT3rZpp6X0ZeD7', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFV1R0RJdjVOeEtPQzQ3ZTRmd2RpcUpMbENickJIQ3lXMDduS05DbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725619),
('k50X2WjFEYoCdQVmTOf95w4Dlg54ruIKBNCc11NO', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3U5aVJWRUs1ajBZOFcydXVqZkJ3WFowZFExcmMyb3k1TU84SU1uTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721257),
('k7k1b63WNuyb0eA0vgC4pg3eLliVEdSerTh0PVMD', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXJEV1lQWmtPODI3MXU1Sk9IZU9CTXBtWUxSRDgxa0xNeDJnU25HUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727966),
('kDbVJDtGmKR8T2LLaNKSUwcJOYXqtS4GleZm2Hva', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREJjUnhDekhDYlJYRFd3ZmtENEh4Tm1tZ1pHSHlJUWUzMEFYWG85OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742729361),
('KiWVvTBS8TDaHgGgcSSRxtI5TpiH6FfAHHNZvrjN', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlJSQjBJcEREbkFzWmtST1ozTFRvbXNQZ0Y1clJaNllVbVlDMVZtMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726908),
('KmvGmcLs68csFgYvqE6jbgQg9F4AhHumqkE79tHz', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXpLMVN1dnBvcVZMaVhZWFlkU3VGZWYxSXJSUzNvNUlHN2ZBU2hjciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728133),
('Kt3G7IKbqv8b3sQf3BSZ7C4I3TziL3BppX8QPX2N', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXFRSUNIZ0oyN2p4WjFoSUVnUzhHN2hyZW41VVliVURHTEhGa2x0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728078),
('ktApnYrzcbE9iXBv6zB5gF32hqBC30XeSllyLsZv', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlMwNlB0S0NkQ2JLc0wyNE80UHVSRWUwQWM2OGF5dUxDSnNUNzBOWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728108),
('LhX6ACbMJgPqCpwCU1YIJNho5j4mhcRWixaITsxj', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczVvSU8ycmhJOVVTeDFra1BjMlZzMUJOTDFGak5heVF6YVVRV0txZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728844);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lLle9uEdL4lfnmtUxxa9p5kZdtyKfPgyUxXM5qoO', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHBpamJ4Y203RmhSellCRzVRR1Z6NHV3UVFhVHBiWVFEVWNhZnpmNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721839),
('lNgWOfvRBuL0NZRFomTZZCRtQm3VQ3DmrxZh6CbQ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDJWd1M5UjhNYWJQS0NXS3VWWDNONk9RU05ETm1uZzFSNUpHWUZ5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722972),
('LXCINJl2uXRJrX2yDX0BDUdrvzV1IQkcLIyIgyFB', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlFsQldHRXV5aXRHNkVibFlhOHpjeFNFMVN2WTNCRTZVTXZMUDlFUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723243),
('mBS0E9Vj18dip1A6RlqJh4pPrFP25J1xds2laKOV', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHBSYnVSc1Z1bEtaWmhlUlU0eW5pYnZoRnhwZ1hUQkNtTmU1ZlVlSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725449),
('MoY0dtknldgtUEvJo7czdBn60QL0iJwzme2JKiLO', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0dDaDFIemFrcHhQMXVMNkQ2dEtSZVZVRVl5SEswb1NYUURvNUNUQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728440),
('mRRyzoEzS1NNVaTU4XXi8890LhltJarMYuMFG3Zh', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkowaGtIdDl6Y1VNT1JUdlFKc2JmNmhEaUdxcVRrN2tMU09lSTg4ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725380),
('MYFzO7lRbpRdMyPeR5KILtLqj75xTuYvADxH0HKV', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU1ETzNKRXJuSHMwNm5GYXZwTE9HZXZrQzZjbUYxamYzemFvWW51RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725644),
('n6c2UhVwXaK6MovzkWaXoRW12m45DA8QqIhyHGS3', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3U5U0pmZ0pxa2FmZG9BMUtXT0dHR0pRcTZYRVRxYk90U3BtTERlTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726764),
('nFfJy6NVG50fesuVxLalMn7UOrFgPWVHVszyZkxu', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmVXSjZqVFVSVGVhZTdVVXljNjVWSm1rbnFxVXZhRDE5U0dSYTJ0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724060),
('nj9hHx9tmEn32pogWwxwOqMievFRoU3Ilg6dXL76', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnJ2RGM0T00zVXZEZDJGYk4xWXpXakxSTUhrS1FQNE1EVktZZ2ZCcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722906),
('NomaqMZiUTMUqs86tGR6SDpLlApjRMwBpEhE023E', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHdqaVVTRjhUczVHNG52aTlXRGFOWkhpeXllZVZaRE9oZ3RJbnNwMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722503),
('nP81yASssLas6W85ConaHqLthwS80358mLPhRYPB', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2N1UlNpSmF2UEhnRzhYRWxMNm1vWHVLc0R6eFhySnpFUlREQW5VRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726204),
('NtyxRlF14b0zG5fzbZcMYrXqhTPDPUpRUCamH5mK', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnE5RndqUkk2dVlORnUyM3JLNWJPUW5MYm1Gblg0YjhOYTRicnlOYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726407),
('Nzj1HI5Z1mq4Lz25u3mxO01c9Xg7IpTr43W0k2Lb', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXBhTmlRWmppYVhpVmFXZXVFQWZlOFdKWHA1STZwVjVpdnp3YVA4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728672),
('OacGh5Wwna9igXezfFF6Ge41SCAhlIHhUxQ0wEgn', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNER4T2dpaDZOc1d3TUpuejRBdDJ6STRkRDZKSEJWUmhBYTVheXZtQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726881),
('oAI5GHOX1sHlsMLf5NcYu5jb274gHV2YZEXbQ2yz', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjJXNzF5SkNIRmhxZ0hxZUhaNGxZRmtxaWhsVXpFanZpUkU1VFJKWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724930),
('ODIB4Byb93c6CgUpwHsZcEjQg1MP5ZLehORtZAja', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNE9iNHdVQmx3NmgxeE96c1VWQ0NacG1ReVN0R3hNNFZYdWh3NHBuTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728382),
('oDVNurSuWFJqj8opDjJe2TomaVC5IhEs7RgQuv2P', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2lRQ3hTeVFoS3VEWUxqNmNxRUdTM0VLUWppdkd1TGJtaG56TTBUciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728806),
('OJgrIYGb83xADr55xu8R3WkSEFb34JLR54ypAJL1', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3hub1RDd2doT3NLekYxWnZtNHB4SjBXb2MyalBoQkxMSHlmQ1ZGYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723610),
('ONWkBxpoKWiWEz9KsgLmBvvLE0WICs0OuKAXYALK', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTRWR25jaU5rckpBYjJ0OHN0ZGVLWGNNd0lsVE5mR3JSSEFrdWhTYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728627),
('p5Ba744k4Ju2Xi4yozJNPCuGnn9vtAZGvHAXk3Vh', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDFWcmVwUWRleUZZRHZ1Znh4UmtDTWNFQnc2UG1SZ29zQmJaeDRxZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723384),
('pinAmJG3VVvNz0SrWoUq0IYFQe90JaUNSKzjdLme', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEtpbUFHRFRHU3FSd0pHMTFFMEFkNHFpREhJVnNrV0x2VGxQVGhDVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728733),
('PlEVJb7whPxO7ERbpab5PRt1fzXi3kUMQnZv6KX2', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1hUYkFRN2ZlaHFuSUViVUNvSHpTQ2w4ZFVVVUgzSzVwYnV1eGh1diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725420),
('ps49Z1WrbO1lRK97COyCCjIet1Repb25oYHTmzLO', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHVNc1V3NmhPaWQ4MVQ0anNnQWp5SjJpbUxCWEVwWFMydTF1WHQyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727202),
('PuOkd7utqt9shdj2HbDyciKNh693my17j8eHCDg5', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0xNcTBQODI5cVNmV3gzZVV4dlVaNmxXbjlQTEZjOHBGTmNtQjZDaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722915),
('pZuu63NAwDj4XHKa77bwWK55PASTrtMTipmvOv2r', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzVQdENXdWZmS1ZWVEVMODJJcWdia0o2YnRZWnFwVDhTdmhsRGRzbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727123),
('Q1XIgoX3awzSNNz4dUjoD4k3PWcQEisffpzyfOva', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEk5U3VBdFhWc2ZEWDFsVnYzM0dwYlZmWTlMNW1wNUd1UEl5ZUJUeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726793),
('qcspAhdAyzAWgt2OxVnBNyJWtamaomZ271Kzo5h8', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0RLRGFMaGpNeTFhaWRxUnNmdFB4NDg1NkZNcUY3T1dDWUs4WXg1NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725410),
('QknpLIbupxLXqf99mhEdFlBpv8CRH3hjGLlSnpWZ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnhyWkZBb2NyNjVFbnZSQ3NhTVN0VVFxaUdkMTdtcU5hV0NibGJxTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728015),
('QWCX78ygJlZLYXWgZfjZJj9LOUF364kay2OwLLdK', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDhSbWl0UGhLMmQ2TjVzTUNDWXlTdzREamsyQktvNndXOUFmd2NaayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728599),
('r5OiGPrHz82a4y77xrFkNCKE9MF271VFD3PZRfM4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGN6Sk9EY0RCZ28yUVhmZ2NDMGJ4alNkcWx0NDVjV3VUdjNSYVM5RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728384),
('Re6jcPcuI07wsnA08QVRc8E5wLbdwUecU02r3yun', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkF4WGZRRVhoZmJvOUNienBleWxISFNWM1VlZlpKdWdVZE9SWURENSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728402),
('RKNFBChpCPNpJcDhl7hMlSS37SpOEHV0V10xGw3p', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1BmTXI2OFFuMk8yckJTMGJZYWI0MHZIb3Uxc0dhOEJuemljWlp3dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9maW5hbmNpYWwtdGlwcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728626),
('rlxyjX6Lk9moj0THJ6YSGEV2b2gZrR0ClCQYUoxr', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWURFNEVOYWNpbU9jd1RsZ0VMck1Ka0FOdXNCeDg4VDhrR0FKRlkwcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728295),
('RORxzvMPOdtAPPxBRhY9WMw5gn1t4IkpuPt7iQEA', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR282bFRBNVE4TlJhVmxRUVhOYmNJVTQ4M1dzQTZMZFF5VW52ZnRIdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721725),
('RRUszpTpiBeEvm6xnBKVIiQgdNpAelepcBP7D0QY', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXdZMmpaaUE2TUs5a0FVTjAwVzZlVFlkNDZUY1FURndzejdlVHJWMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725658),
('S9mYZ9klb7bze0lfPYJVY07bMMCI7curKlwExPty', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhzQmtCQWtrZWZvQ1NlWXV3SVhoYTF5aVVhbWlqMEtzREZWSzFORiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723033),
('SDLY9QvFvTwO6cNFd294A5i74DH71H5k9d5HSst8', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmJsSUpGMTdGaWlZemxuVnJJVWU1UURtT0dhcUhFSTd3MjI2Wk5rNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725487),
('sEDUxkPLNZSNbciMthUsqaPO4ovTxHlNrbpkUEOV', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHhPU0sxYXpiTXl0OGFsZ25NNUZaUzM2eHZ6dzVwMEtuV2hpUkEwWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742728605),
('sfDaLTTz1o5E4E8Lgvy8sCrjE5ppyzDJoynCAZbb', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFJTb2xVbzJCVGRxS3VYaExsZ1phZUh2OTl1MWcxVEFsSVdXSjFiNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723434),
('sjqALGcoojCTJqiYzkwFxE9uObox3RE1kcuBQjNd', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2pPYXZuTlJ2VGxEeUs0VUJUcHZWRVcxS3B1NFAyb2FqcU9meEJsVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723363),
('srz4FKQbXFfF8XWiXokpjTolDDjs2w1azwJwRooS', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJLUGt5SmFOUjdsSGpCeUR6ZXdTSkNTZnQ1SkU0T1RkNEpsaUtkMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722948),
('SUr7T6Iw2PUZUSRicQXY5gh2s3y3OoWll7k2wqi8', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFpac1d4YkxUdEg0TkdUUmlueGJmVWpNTlZWSFZiYnY2Um5DNFZCRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723188),
('t3vvZYKntURLbx9AEv1wUEYH1yzWM92zsfFopThg', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2h4eVphUUhQN1g2TnpyZHBDeU5wUUlETE96VGtaZUcxME1uMUpsRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723969),
('teKTlwFiUBdVSuhenBLwViWBTcnDSHhUaZukV5yn', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREFYa1hDSmY3YllMOVFZekZBZVI5V2ppMVE0a3p6VU1TQkh1MURQOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727958),
('tKNgK3lcmhH8e2gsdoJHx3aM6TxU95B2o3iFfonF', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmhKQlRtV2Y3ZUNPOVhZcnQzUGJmY21wUlpWcEJJOXhNSEFFRUdWdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723378),
('TtYcsv97stEtF0xQXcu4KVbfSKNTQOJHnx0uGFWh', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGlmbEVWaXprNWllczlyTjFVMzd3ZktDREdWZXA5RE5HZlhlb0dKNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723008),
('Tw7GUlufmg7nZU1O663cd0wg7IfI7vJSQP4hhND2', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUFHSk03MWJ3MXpQNHZqQmFPRFlmSXhsamZGWkVhTzZCUzY5QlFNZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727985),
('uauJirmjx0GXfZa85lGgB1XuLVP36cmbMCXBEbG8', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1JGUk4xVEY4WGhxa0NMQVNqb3VQOVVTMzVGRmVITHE4R2R5ZGdRdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728140),
('uhuePEL3T6j1sd9wIMQPqXlPNbYkjXRN9Y4yE6lg', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmUxaGFlSGp6T3ZieUMzZVVnZmFsWHhYV3dhY01kWDc5Umg1RHNDbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727991),
('UOmzcgrrAqgK3KQurpuBHFCpH4mIWqVwGli6djg5', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1I0VEwyMUNDNzV0WTdWRlpRd0FwZWtNVVA3QUZiWmVSWlVDRXlONiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727102),
('Uupgy5qQsoR20oHAMArJly2cFxt5Db7B3jRq4aYM', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWVaTERHRjU3UEQ3ZFVtVk5FZkJybnFYQzJaOHdhZE9kNDE1YTNMVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721841),
('uwedu6ziCOpWbGS6blaFXq2iXO1kk82P7KhtxOQ4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUlYWVBPTUVreWx2RFhlTUZKOXpYamxWSE1jZkFMcFV4UXI5R0JNeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725431),
('v98NHyVYZvSEsYrurTC9BfgLHwiGewzrLwTIU5g5', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkZUVmJRRW93YWNuMzdPMmc1QXYzeEo1OUhOUnhaZDdJRHd6MDNVNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742727950),
('VGAXj0K5pcB0dp8kheLvBLJ72QSmYtJrXgLheoUw', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHFHYklDT0U0U0NGWDlIUjBIcFlzR1pyd1hCSWRJaTk2aVJLUnV5ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725465),
('VJCZAmGb7OcBrqU8YzNrVzAld77q0r1Btef9HP9D', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWcwOUJldXFTVllKQlB0TW9DZVJHYm5FYUVwWlU4SERmNDJaWXhMaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727075),
('VnKIp4aqzLwazmGiFGPVX3MKnUbiH0hf4gXSndwB', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDBuazYzZDY2NE41N2VpTkowclhIM0p6eHJUdmVJSEhNMTczNURMYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728145),
('VoaFWtls24FhrQDCVkr2zeGsfUI0NlBur5UVvtGL', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlZlT21ROUQ5bWVzM3l4MFVNNEIzQVlqcUxONG5IbVdkaVNGUE9OcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728610),
('vtnb5okMZXOmhkUPIiPoElc5zjnN5fVWFqG7c42w', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlVsQ0h4QjA2dW5BNDYxRHBXSmVKblYzNVV4cXVwTTRwa25rdHlJTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728359),
('vXTavVnY1duV8tiuGMx8766Ta4P8c59ObfflI62k', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjJSVVIzRHJManFIVm1VWGVqdVNzODNPTHVhZlVuUGVIaGd3ZFA1NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728366),
('vYNpVipxieJGVCO8UWfXutquEmzdfQHNAmFG5X6n', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVNUM1plT3hnREFPZzQ4RjhNemhCWTc2U2M0Z0NPaGNkbFI0ZXlUMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726112),
('Wb1sOqYKz9aLYpvAXbmhT3qQpls3CNXUrN8y2sbY', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3gxTjNHY2Rac2c0c1dyenhxQzdGa1Y5R3o3dUUwRHRSWnd3WjlhMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726757),
('wewllbb5myu7LerWLXzbO80nbdMpMkqThPb1VZoJ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjlLVGZEZjBtb3FYWDVKZUZSdU5hZWJXQ0Y3VWxqQU1LeElVelNUaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722635),
('WFyx3bIF48lhymNeLJiBxB48LuDTbcPE15X1Ia9R', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFJlYzl5SUtkWkRWcjZKY2VSbnBUWHR1Vll0a3hrWTNtZHNTZW9WYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742724028),
('x1KRsk8bbrBDG62dFpLQ0FOYpZLAASM9L1iy6jT6', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXVRNE5oWHE2V0ZtejhQWWxVYkxSWjA3MEV3cTE1SlFsdHVUdm9TQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726174),
('X8nmKWxzw1bTfvsuwtBDSAQV9sisnbzdOaEJzwJ4', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3BMUGZIQVZ2ajhVbjNUVThHYnhkVzY4bkVjNEhBcE5Xb2E3Sk9FaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722662),
('XAcuDd44Qx8IVKIuTZgzggIWRRY4CqBA5Tay5qM1', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0R0amRkV3NXVzI1QXdKYUpWbFByU2tYM2Z3cTBrV0h3S3pPMVlGZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728178),
('xJRmqDsCPI3HnYhleIACD8XbDv8sBeuE91A3jmWD', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzl4Q1Z6VGh3SHBuSlBEWjdXWXkzYmlDNHV5Y090cVBIOXM1eVNEYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728866),
('y9mYtv9KT5IiuHo9Tiw15VX733wnpsTXj0bkwCE1', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjlGVjNsQlNRelBpZXp0aTV3UG96UkdDbE5lTXZUUVpmelBka29hRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726579),
('Yc7iDDi2eqoLrqaB0kTAoCcvaaLjlFmUGERY1NEQ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEJoeld2alZrejlsbHJqcThsMjVQRkljOWZKejczNGRZOVpoZEZQZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726394),
('ydHWlTNbREyqxc9V4YxiXSRFZcolvkkpjFgY2NFp', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREdFYVExWUpMSUdDc2R6dTdjZ1RrSlFLOUNDUERETFlwT2VqZUxodSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742721932),
('YFHHZHgickhrLSMlFPpkM2C0MQ0lloObv9izqYjy', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajJNZ2NLb3hyVUhhd1ZNYVdhWG5oUHdBckd3a3UxQjMzWUZNM3JVdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722807),
('yKMhsfrpC2QwZILcjSCHqIZ0DURDorN3Gonqe6Fr', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXgzUEw1akhld1Z2SWR4S25keHVpbjVYNGRuM1lHNzhnVTk4bFIxSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9ibG9ncy9pbnZlc3RtZW50LWFydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728624),
('ypsUgnwEwFpwyWitW2YQczGWiBKYGWJPKhN1j4co', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUtDaUIwRFZOcXV6UFJzeEtBTnBIcVJOVjVYR25VSldMQmR4WTU2SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742723050),
('YpY0OqK5kG5eQuTq45G5rpyAmJw8MOuUEvXxcgX9', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkpqbm91M1RycjZhamIzaE5lZEFkMHBweGZLdFlsU28wajNMUTM3SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726098),
('Ysrdx1BTnQXmWnN02ikAxz7ftED6fGvsPB8W9XoE', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDhjRFdzRWV1cmp2WmdaeUlicDZDbGN6ajdpMkJOWXdlMGRPT1dKRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742725718),
('Yu1ljuLbw2QKeAccqTEVlhnaDkSXMsdSSHVkZ02Y', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODlxZWdLTzY3R3VwVTNWZUNYY0pGTVpxSGRCS1pidzVHdlZKZ3RPNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726503),
('z1I9Gi8boTh7HU5aya0zlnY6LLnjmSkJq47l3kpa', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXpGakhrWDNITUVOdUY0WFZMdHZ1dGhjNUJpaTRKckZsQWYyYnFXSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726787),
('z1pvEMJbg5hbfStbXJuIOH3jLNdMtlZpOIITPm9M', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem12NzV0a1Rlcm1JeFNvelRTWUxlMjg1OWZMOFBMYW1rMFplQTlFciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742727095),
('Z56ervbUT1hMS8NKqzPosvIEyXKatWbjV3nKPcaI', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickVsbGhtNTN6ZVpDZVAxMXhNZDAwTDV1cWc3V1c4ejZjOHI2ZEllMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726187),
('z6EbffsyeRZe6j6vjDowPiwl3sFaK7UNYXX13CMp', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0VDbDFmNGJNYlpvc3Ztd2Q5SzQxNFN4cGRCZEVVVzlIcGhmSXBEdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742728179),
('Z8SkxMWYx8ADRQgL9YwIguN7g34XUKdcGrxpzMai', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmNwS0s0anBjcjhBRVV4U25IUDhuNWtreUgzZ0hWQXNYeWNxSnRZeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L3Bvd2VyLW9mLWNvbXBvdW5kLWludGVyZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1742729335),
('ZGzcUMXduJ4LZitQIFOj4aaCCcpfvkgclH0WWUJQ', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3VPbWIwZ1RzR2FqdzRHZGZLdDU3MkVIam80anJmSEt1NlJlWk1OOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742722921),
('ZTOoH2Sky5dgllXv8moqg7dIbr29iL57XMUiXMxS', NULL, '172.20.10.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWxaRVk0NUJhTTdVNzViMkZ6UGxiS2ZFeHBpZnN2S2pwYXc5aXQ2TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xNzIuMjAuMTAuMzo4MDAwL2FwaS9wb3N0L21vcmUtcGVvcGxlLWFyZS1yZWNvcmRlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1742726498);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_script` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `email`, `phone`, `whatsapp_number`, `support_script`, `location`, `on_maintenance`, `created_at`, `updated_at`) VALUES
(1, 'support@credittidestockcompany.com', '(223) 6574-832', '(223) 6574-832', '...', 'No 3 geneva, UK', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `symbol`, `name`, `icon`, `path`, `price`, `last_price`, `created_at`, `updated_at`) VALUES
(1, 'AAPL', 'Apple', 'FaApple', 'fa', 23.00, 22.98, '2025-02-11 22:44:45', '2025-02-11 22:44:45'),
(2, 'MSFT', 'Microsoft', 'FaMicrosoft', 'fa', 283.00, 238.00, '2025-02-12 16:31:15', '2025-02-12 16:31:29'),
(3, 'AMZN', 'Amazon', 'FaAmazon', 'fa', 3433.00, 2343.00, '2025-02-12 16:01:31', '2025-02-12 16:01:31'),
(4, 'GOOG', 'Alphabet', 'FaGoogle', 'fa', 854.00, 948.00, '2025-02-12 16:01:31', '2025-02-12 16:01:31'),
(5, 'META', 'Meta', 'FaMeta', 'fa6', 434.00, 343.00, '2025-02-12 16:02:32', '2025-02-12 16:02:32'),
(6, 'TSLA', 'Tesla', 'SiTesla', 'si', 457.00, 432.00, '2025-02-12 16:02:32', '2025-02-12 16:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `testimonies`
--

CREATE TABLE `testimonies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimony` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonies`
--

INSERT INTO `testimonies` (`id`, `name`, `position`, `testimony`, `image`, `created_at`, `updated_at`) VALUES
(1, 'James Az', 'Apple Investor', 'I just made my first $5,000 and I am so proud of myself, I cannot believe I could achieve something like this so easily.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` enum('deposit','withdrawal','investment','profit','loss','referral_bonus') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','rejected','cancelled','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` timestamp NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation_industry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onboarded` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hide_balance` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `email_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_subscription` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `profile_picture`, `email_verified_at`, `password`, `dob`, `phone`, `invitation_code`, `firstname`, `lastname`, `country`, `place_of_birth`, `residential_address`, `city`, `postal_code`, `occupation_industry`, `occupation`, `onboarded`, `remember_token`, `created_at`, `updated_at`, `hide_balance`, `two_factor_enabled`, `email_notifications`, `newsletter_subscription`) VALUES
(23, 'fritz', 'fritzdultimate@gmail.com', 'storage/uploads/profile/pictures/profile_23_1742120194.png', '2025-03-16 08:37:44', '$2y$12$gGga/X30Nyrd2qn3M7aJz.p2GZwQ2es3dV.i8gNdrzVTn6e1SeQ6q', '1999-11-27 23:00:00', NULL, 'D2F91AED', 'Chukwuemeka', 'Nwosu', 'Nigeria', 'Jos', 'Miracle junction, ifite awka', 'Anambra state', '420110', NULL, 'Software Engineer', 0, NULL, '2025-03-16 08:26:14', '2025-03-16 09:16:35', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_wallets`
--

CREATE TABLE `user_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_wallet_id` bigint UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_wallets`
--

INSERT INTO `user_wallets` (`id`, `admin_wallet_id`, `address`, `created_at`, `updated_at`, `user_id`) VALUES
(5, 1, NULL, '2025-03-16 09:24:54', '2025-03-16 09:24:54', 23),
(6, 2, NULL, '2025-03-16 09:24:54', '2025-03-16 09:24:54', 23),
(7, 3, NULL, '2025-03-16 09:24:54', '2025-03-16 09:24:54', 23),
(8, 4, NULL, '2025-03-16 09:24:54', '2025-03-16 09:24:54', 23);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_wallet_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','processing','completed','rejected','cancelled','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_wallets_symbol_unique` (`symbol`),
  ADD UNIQUE KEY `admin_wallets_address_unique` (`address`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users` (`user_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
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
-- Indexes for table `celebrity_investors`
--
ALTER TABLE `celebrity_investors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deposits_reference_unique` (`reference`),
  ADD KEY `deposits_user_id_foreign` (`user_id`),
  ADD KEY `deposits_user_wallet_id_foreign` (`user_wallet_id`);

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
-- Indexes for table `heroes`
--
ALTER TABLE `heroes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `heroes_slug_unique` (`slug`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investments_user_id_foreign` (`user_id`),
  ADD KEY `investments_stock_id_foreign` (`stock_id`),
  ADD KEY `investments_investment_plan_id_foreign` (`investment_plan_id`);

--
-- Indexes for table `investment_plans`
--
ALTER TABLE `investment_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `investment_plans_name_unique` (`name`);

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
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policies_policy_category_id_foreign` (`policy_category_id`);

--
-- Indexes for table `policy_categories`
--
ALTER TABLE `policy_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_user_id_foreign` (`user_id`),
  ADD KEY `referrals_referrer_id_foreign` (`referrer_id`);

--
-- Indexes for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_bonuses_user_id_foreign` (`user_id`),
  ADD KEY `referral_bonuses_referred_user_id_foreign` (`referred_user_id`),
  ADD KEY `referral_bonuses_investment_id_foreign` (`investment_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stocks_symbol_unique` (`symbol`);

--
-- Indexes for table `testimonies`
--
ALTER TABLE `testimonies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_reference_unique` (`reference`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_invitation_code_unique` (`invitation_code`);

--
-- Indexes for table `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wallets_admin_wallet_id_foreign` (`admin_wallet_id`),
  ADD KEY `user_wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `withdrawals_reference_unique` (`reference`),
  ADD KEY `withdrawals_user_id_foreign` (`user_id`),
  ADD KEY `withdrawals_user_wallet_id_foreign` (`user_wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `celebrity_investors`
--
ALTER TABLE `celebrity_investors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `heroes`
--
ALTER TABLE `heroes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `investment_plans`
--
ALTER TABLE `investment_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `policy_categories`
--
ALTER TABLE `policy_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `testimonies`
--
ALTER TABLE `testimonies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposits_user_wallet_id_foreign` FOREIGN KEY (`user_wallet_id`) REFERENCES `user_wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_investment_plan_id_foreign` FOREIGN KEY (`investment_plan_id`) REFERENCES `investment_plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investments_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `investments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policies_policy_category_id_foreign` FOREIGN KEY (`policy_category_id`) REFERENCES `policy_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD CONSTRAINT `question_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_referrer_id_foreign` FOREIGN KEY (`referrer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD CONSTRAINT `referral_bonuses_investment_id_foreign` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referral_bonuses_referred_user_id_foreign` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referral_bonuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD CONSTRAINT `user_wallets_admin_wallet_id_foreign` FOREIGN KEY (`admin_wallet_id`) REFERENCES `admin_wallets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdrawals_user_wallet_id_foreign` FOREIGN KEY (`user_wallet_id`) REFERENCES `user_wallets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
