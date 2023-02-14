-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 05:12 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moneymanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` int(10) NOT NULL,
  `expense_categories` varchar(255) NOT NULL,
  `expense_user_fk_id` int(11) DEFAULT NULL,
  `expense_dateTime` date NOT NULL,
  `expense_amount` int(11) NOT NULL,
  `expense_description` varchar(255) DEFAULT NULL,
  `expense_tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expensebycat`
--

CREATE TABLE `expensebycat` (
  `expense_cat_fk_id` int(11) NOT NULL,
  `expense_user_cat_id` int(11) NOT NULL,
  `expense_cat_amount` int(11) NOT NULL,
  `expense_cat_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expensecat`
--

CREATE TABLE `expensecat` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) DEFAULT NULL,
  `extra_cat_on_user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expensecat`
--

INSERT INTO `expensecat` (`categories_id`, `categories_name`, `extra_cat_on_user_id`) VALUES
(1, 'Food', 0),
(3, 'Transportation', 0),
(4, 'Entertainment', 0),
(5, 'Insurance', 0),
(6, 'Clothing', 0),
(7, 'Tax', 0),
(8, 'Shopping', 0),
(9, 'Telephone', 0),
(10, 'Sports', 0),
(11, 'Health', 0),
(12, 'Beauty', 0),
(13, 'Baby', 0),
(14, 'Pet', 0),
(15, 'Travel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `expense_budget`
--

CREATE TABLE `expense_budget` (
  `exp_bud_id` int(11) NOT NULL,
  `exp_cat_fk_id` int(11) NOT NULL,
  `exp_user_fk_id` int(11) NOT NULL,
  `exp_bud_cat` varchar(255) NOT NULL,
  `exp_bud_month` int(5) NOT NULL,
  `exp_bud_amount` int(255) NOT NULL,
  `exp_bud_used_amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `income_id` int(10) NOT NULL,
  `income_categories` varchar(255) NOT NULL,
  `income_user_fk_id` int(11) DEFAULT NULL,
  `income_dateTime` date NOT NULL,
  `income_amount` int(11) NOT NULL,
  `income_description` varchar(255) DEFAULT NULL,
  `income_tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomebycat`
--

CREATE TABLE `incomebycat` (
  `income_cat_fk_id` int(11) NOT NULL,
  `income_user_cat_id` int(11) NOT NULL,
  `income_cat_amount` int(11) NOT NULL,
  `income_cat_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomecat`
--

CREATE TABLE `incomecat` (
  `income_categories_id` int(11) NOT NULL,
  `income_categories_name` varchar(255) NOT NULL,
  `extra_cat_on_user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `incomecat`
--

INSERT INTO `incomecat` (`income_categories_id`, `income_categories_name`, `extra_cat_on_user_id`) VALUES
(1, 'Salary', 0),
(2, 'Awards', 0),
(3, 'Grants', 0),
(4, 'Sale', 0),
(5, 'Rental', 0),
(6, 'Investments', 0),
(7, 'Lottery', 0),
(8, 'Dividends', 0);

-- --------------------------------------------------------

--
-- Table structure for table `income_budget`
--

CREATE TABLE `income_budget` (
  `inc_bud_id` int(11) NOT NULL,
  `inc_cat_fk_id` int(11) NOT NULL,
  `inc_user_fk_id` int(11) NOT NULL,
  `inc_bud_cat` int(11) NOT NULL,
  `inc_bud_amount` int(11) NOT NULL,
  `inc_bud_used_amount` int(11) NOT NULL,
  `inc_bud_start_date` date NOT NULL,
  `inc_bud_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifiy`
--

CREATE TABLE `notifiy` (
  `noti_id` int(255) NOT NULL,
  `noti_name` varchar(20) NOT NULL,
  `about_noti` text NOT NULL,
  `noti_user_fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminder_event`
--

CREATE TABLE `reminder_event` (
  `reminder_id` int(255) NOT NULL,
  `reminder_user_fk_id` int(11) NOT NULL,
  `reminder_schedule_fk_id` int(11) NOT NULL,
  `reminder_description` varchar(255) DEFAULT NULL,
  `reminder_date` date DEFAULT NULL,
  `reminder_amount` int(255) DEFAULT NULL,
  `reminder_type` varchar(10) DEFAULT NULL,
  `check_reminder` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminder_schedule`
--

CREATE TABLE `reminder_schedule` (
  `reminder_schedule_id` int(11) NOT NULL,
  `reminder_user_fk_id` int(11) NOT NULL,
  `reminder_description` varchar(255) NOT NULL,
  `reminder_start_date` date NOT NULL,
  `reminder_end_date` date NOT NULL,
  `reminder_repeat` varchar(10) NOT NULL,
  `reminder_amount` int(255) NOT NULL,
  `reminder_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

CREATE TABLE `tbl_images` (
  `id` int(11) NOT NULL,
  `name` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `average_rating` float(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `name`, `price`, `category`, `product_image`, `average_rating`) VALUES
(1, 'Tiny Handbags', 100.00, 'Fashion', 'gallery/handbag.jpeg', 5.0),
(2, 'Men\'s Watch', 300.00, 'Generic', 'gallery/watch.jpeg', 4.0),
(3, 'Trendy Watch', 550.00, 'Generic', 'gallery/trendy-watch.jpeg', 4.0),
(4, 'Travel Bag', 820.00, 'Travel', 'gallery/travel-bag.jpeg', 5.0),
(5, 'Plastic Ducklings', 200.00, 'Toys', 'gallery/ducklings.jpeg', 4.0),
(6, 'Wooden Dolls', 290.00, 'Toys', 'gallery/wooden-dolls.jpeg', 5.0),
(7, 'Advanced Camera', 600.00, 'Gadget', 'gallery/camera.jpeg', 4.0),
(8, 'Jewel Box', 180.00, 'Fashion', 'gallery/jewel-box.jpeg', 5.0),
(9, 'Perl Jewellery', 940.00, 'Fashion', 'gallery/perls.jpeg', 5.0);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `user_id` int(11) NOT NULL,
  `oauth_provider` varchar(10) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `mail_confirmation` tinyint(1) NOT NULL,
  `one_time_password` int(11) NOT NULL,
  `OTP_expired` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_user_fk_id` (`expense_user_fk_id`);

--
-- Indexes for table `expensebycat`
--
ALTER TABLE `expensebycat`
  ADD KEY `expense_cat_fk_id` (`expense_cat_fk_id`),
  ADD KEY `expense_user_cat_id` (`expense_user_cat_id`);

--
-- Indexes for table `expensecat`
--
ALTER TABLE `expensecat`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `expense_budget`
--
ALTER TABLE `expense_budget`
  ADD PRIMARY KEY (`exp_bud_id`),
  ADD KEY `exp_cat_fk_id` (`exp_cat_fk_id`),
  ADD KEY `exp_user_fk_id` (`exp_user_fk_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`),
  ADD KEY `income_user_fk_id` (`income_user_fk_id`);

--
-- Indexes for table `incomebycat`
--
ALTER TABLE `incomebycat`
  ADD KEY `income_user_cat_id` (`income_user_cat_id`),
  ADD KEY `income_cat_fk_id` (`income_cat_fk_id`);

--
-- Indexes for table `incomecat`
--
ALTER TABLE `incomecat`
  ADD PRIMARY KEY (`income_categories_id`);

--
-- Indexes for table `income_budget`
--
ALTER TABLE `income_budget`
  ADD PRIMARY KEY (`inc_bud_id`),
  ADD KEY `inc_cat_fk_id` (`inc_cat_fk_id`),
  ADD KEY `inc_user_fk_id` (`inc_user_fk_id`);

--
-- Indexes for table `notifiy`
--
ALTER TABLE `notifiy`
  ADD PRIMARY KEY (`noti_id`),
  ADD KEY `noti_user_fk_id` (`noti_user_fk_id`);

--
-- Indexes for table `reminder_event`
--
ALTER TABLE `reminder_event`
  ADD PRIMARY KEY (`reminder_id`),
  ADD KEY `reminder_user_fk_id` (`reminder_user_fk_id`),
  ADD KEY `reminder_schedule_fk_id` (`reminder_schedule_fk_id`);

--
-- Indexes for table `reminder_schedule`
--
ALTER TABLE `reminder_schedule`
  ADD PRIMARY KEY (`reminder_schedule_id`),
  ADD KEY `reminder_user_fk_id` (`reminder_user_fk_id`);

--
-- Indexes for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expense_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expensecat`
--
ALTER TABLE `expensecat`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `expense_budget`
--
ALTER TABLE `expense_budget`
  MODIFY `exp_bud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `income_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `incomecat`
--
ALTER TABLE `incomecat`
  MODIFY `income_categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `income_budget`
--
ALTER TABLE `income_budget`
  MODIFY `inc_bud_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifiy`
--
ALTER TABLE `notifiy`
  MODIFY `noti_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminder_event`
--
ALTER TABLE `reminder_event`
  MODIFY `reminder_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_user_fk_id` FOREIGN KEY (`expense_user_fk_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expensebycat`
--
ALTER TABLE `expensebycat`
  ADD CONSTRAINT `expense_cat_fk_id` FOREIGN KEY (`expense_cat_fk_id`) REFERENCES `expensecat` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expense_user_cat_id` FOREIGN KEY (`expense_user_cat_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense_budget`
--
ALTER TABLE `expense_budget`
  ADD CONSTRAINT `exp_cat_fk_id` FOREIGN KEY (`exp_cat_fk_id`) REFERENCES `expensecat` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exp_user_fk_id` FOREIGN KEY (`exp_user_fk_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_user_fk_id` FOREIGN KEY (`income_user_fk_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `incomebycat`
--
ALTER TABLE `incomebycat`
  ADD CONSTRAINT `income_cat_fk_id` FOREIGN KEY (`income_cat_fk_id`) REFERENCES `incomecat` (`income_categories_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `income_user_cat_id` FOREIGN KEY (`income_user_cat_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income_budget`
--
ALTER TABLE `income_budget`
  ADD CONSTRAINT `inc_cat_fk_id` FOREIGN KEY (`inc_cat_fk_id`) REFERENCES `incomecat` (`income_categories_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inc_user_fk_id` FOREIGN KEY (`inc_user_fk_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reminder_event`
--
ALTER TABLE `reminder_event`
  ADD CONSTRAINT `reminder_schedule_fk_id` FOREIGN KEY (`reminder_schedule_fk_id`) REFERENCES `reminder_schedule` (`reminder_schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reminder_schedule`
--
ALTER TABLE `reminder_schedule`
  ADD CONSTRAINT `reminder_user_fk_id` FOREIGN KEY (`reminder_user_fk_id`) REFERENCES `userinfo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
