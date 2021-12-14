-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 13, 2021 at 12:34 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boi_pori`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `com_logo` varchar(100) DEFAULT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_email` varchar(60) NOT NULL,
  `com_phone` varchar(15) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `cur_format` varchar(10) NOT NULL,
  `admin_role` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `username`, `password`, `com_logo`, `com_name`, `com_email`, `com_phone`, `com_address`, `cur_format`, `admin_role`) VALUES
(1, 'admin', 'admin', 'd6161f2fd556e774df1aaa8ce51b7f3c', NULL, 'Inventory', 'inventory@gmail.com', NULL, NULL, '$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` text NOT NULL,
  `brand_cat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `brand_cat`) VALUES
(14, 'Mukhtodhara', 12),
(15, 'Annannya\r\n', 12),
(16, 'somokal', 14),
(17, 'jugantor', 14),
(18, 'Agami prokashoni', 11),
(19, 'Onupom Prokash', 11),
(20, 'Somoi Prokashoni', 10),
(21, 'Suborna', 10);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL,
  `products` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `products`) VALUES
(10, 'University Books', 0),
(11, 'College Books', 0),
(12, 'School Booksss', 0),
(14, 'Non Academic Books\r\n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `s_no` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `site_title` varchar(100) DEFAULT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_desc` varchar(255) DEFAULT NULL,
  `footer_text` varchar(100) NOT NULL,
  `currency_format` varchar(20) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`s_no`, `site_name`, `site_title`, `site_logo`, `site_desc`, `footer_text`, `currency_format`, `contact_phone`, `contact_email`, `contact_address`) VALUES
(1, 'Boi Pori', 'Buy Your Favourite Books easily', 'logo.jpg', 'BUY NOW!', 'BOI PORI', 'Taka', '01*********', 'admin@gmail.com', 'Sylhet, Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_qty` varchar(100) NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `product_user` int(11) NOT NULL,
  `order_date` varchar(11) NOT NULL,
  `pay_req_id` varchar(100) DEFAULT NULL,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `delivery` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_id`, `product_id`, `product_qty`, `total_amount`, `product_user`, `order_date`, `pay_req_id`, `confirm`, `delivery`) VALUES
(1, '1,2,', '1,1,', '390', 1, '2021-04-30', '4100d69c7e7a4e2aa7b70014495629ea', 0, 1),
(2, '3,', '1,', '250', 2, '2021-05-03', '0fe38dceb7384bb7a3b1432ec7f3193e', 0, 1),
(9, '', '', '', 3, '2021-12-13', '', 0, 0),
(10, '3,', '1,', '700', 3, '2021-12-13', '', 0, 0),
(167, '9,', '1,', '300', 3, '2021-12-13', NULL, 0, 0),
(166, '9,', '1,', '300', 3, '2021-12-13', NULL, 0, 0),
(165, '5,', '1,', '500', 3, '2021-12-13', NULL, 0, 0),
(164, '5,', '1,', '500', 3, '2021-12-13', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `item_number`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`) VALUES
(1, '1,2,', '4100d69c7e7a4e2aa7b70014495629ea', 390.00, '', 'credit'),
(2, '3,', '0fe38dceb7384bb7a3b1432ec7f3193e', 250.00, '', 'credit'),
(3, '', '', 0.00, '', 'credit'),
(4, '', '', 0.00, '', 'credit'),
(5, '', '', 0.00, '', 'credit'),
(6, '', '', 0.00, '', 'credit'),
(7, '', '', 0.00, '', 'credit'),
(8, '', '', 0.00, '', 'credit'),
(9, '', '', 0.00, '', 'credit'),
(10, '3,', '', 700.00, '', 'credit'),
(11, '3,5,', '0e7d6b8424394f21b28ff46777613aeb', 1200.00, '', 'credit'),
(12, '1,', 'f393b10056e343f7aa7a7d6eec759ec5', 300.00, '', 'credit'),
(13, '3,', 'e260f5ea1a5c494689b7725765ba4f3d', 700.00, '', 'credit'),
(14, '1,3,', '0ef0a7a80a7845c2a661b2fa7072c84a', 1000.00, '', 'credit'),
(15, '1,3,', 'ee3a28a7de9749c5bc8b66e614cf19c2', 1000.00, '', 'credit'),
(16, '1,3,', 'f23b0fecae8a46f295b1ea58bd557451', 1000.00, '', 'credit'),
(17, '1,3,', '', 1000.00, '', 'credit'),
(18, '1,3,', '1f1f8585bb524ab8b12eb20cd3cbcc1c', 1000.00, '', 'credit'),
(19, '1,3,', '', 1000.00, '', 'credit'),
(164, '5,', '', 500.00, '', 'credit'),
(165, '5,', '', 500.00, '', 'credit'),
(166, '9,', '', 300.00, '', 'credit'),
(167, '9,', '', 300.00, '', 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_sub_cat` int(11) NOT NULL,
  `product_brand` int(100) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `featured_image` text NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `product_keywords` text DEFAULT NULL,
  `product_views` int(11) DEFAULT 0,
  `product_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_cat`, `product_sub_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `featured_image`, `qty`, `product_keywords`, `product_views`, `product_status`) VALUES
(1, '608746e46b277', 14, 1, 16, 'Pother Dabi', '300', 'The book is about a secret society named Pather Dabi whose goal is to free India from British rule.And Sarat Chandra chattopadhyay played a great role for making a Revolutionary mind in young Indians,which gives an effort to the Indians to free from this Torture by British.Sharat Chandra chattopadhyay helped to create an independent consciousness among the Indians.And he also mentioned that independence is the only way to save Indians and also mentioned that proper relationship is not only family relations but also a relation with anyone who is struggling to save India from the British rule, through the words of his novel.The leader of the organization is Sabyasachi Mallick, who is described as being highly educated, having studied medicine, engineering, and law in Europe and America.[3][4] Sabyasachi is also endowed with physical strength and courage which enable him to elude British intelligence. His physical feats include swimming across a torrential river, and traversing the Eastern Himalayas on foot.[4]', 'novel1.jpg', 90, NULL, 16, 1),
(2, '608c49011b61d', 14, 2, 16, 'Kakababu samagra', '450', 'Kakababu alias Raja Roy Chowdhury is a fictional adventurer character created by Bengali author Sunil Gangopadhyay, that has attained legendary stature in Indian, particularly, Bengali literature. The series, falling under the adventure genre of literature, targeted at children and teenagers, started in the autumn of 1979 with the publication of Bhoyonkor Sundor in Anandamela magazine, Puja issue. Since then, the series continued for 33 years on popular demand, with over 36 adventure novels in print until the death of the author in 2012.[1]', 'fiction1.jpg', 100, NULL, 20, 1),
(3, '608c4a7fd90c2', 14, 6, 17, 'The silent patient', '700', 'Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word.', 'thriller1.jpg', 100, NULL, 23, 1),
(5, '608746e46b288\r\n', 14, 8, 17, 'Chaya Songi', '500', 'Chaya Songi by Humayun Ahmed is another popular novel by Humayun Ahmed. This book is the collection of some awesome horror book. There are seven books in this collection. Some awesome comments of Humayun Ahmed published in this book. If you read this book on the first page, you can see this. People ask Humayun Ahmed that, Do you believe in Ghost? Humayun Ahmed has given this answer with fun.', 'adv1.jpg', 100, NULL, 13, 1),
(6, '608746e46b266', 14, 2, 17, 'Time Machine', '500', 'The Time Machine is a science fiction novella by H. G. Wells, published in 1895. The work is generally credited with the popularization of the concept of time travel by using a vehicle or device to travel purposely and selectively forward or backward through time.', 'adv2.jpg', 100, NULL, 2, 1),
(7, '608746e46b264', 14, 9, 16, 'White Fang', '790', 'White Fang is a novel by American author Jack London (1876–1916) — and the name of the book\'s eponymous character, a wild wolfdog. First serialized in Outing magazine, it was published in 1906. The story details White Fang\'s journey to domestication in Yukon Territory and the Northwest Territories during the 1890s Klondike Gold Rush. It is a companion novel (and a thematic mirror) to London\'s best-known work, The Call of the Wild (1903), which is about a kidnapped, domesticated dog embracing his wild ancestry to survive and thrive in the wild.\r\n\r\nMuch of White Fang is written from the viewpoint of the titular canine character, enabling London to explore how animals view their world and how they view humans. White Fang examines the violent world of wild animals and the equally violent world of humans. The book also explores complex themes including morality and redemption.', 'myst1.jpg', 100, NULL, 3, 1),
(8, '608746e46b263', 14, 12, 17, 'Pahar Churai Ajib Bari', '550', 'This is a bangla story telling book written by rakib hasan. Many children enjoy reading it. The book mainly belong to the mystery catagories but there is also a horror feeling which also gives us a thriller vibe.', 'horror1.jpg', 10, NULL, 2, 1),
(9, '608c4a7fd90cc', 14, 12, 16, 'Nishithini', '300', 'The books of Misir Ali series. Nisithini is the 2nd part of Debi. The mystery and the biological book type. After the death of Ranu, the shadow of Ranu falls in Nilu. Nilu achieved the supernatural power of Ranu. The goddess who lived in Ranu Who entered the body of Nilu. Which amazed Misir Ali But he does not believe. The story is about Firoz. Firoz came back to insane after visiting his friend Ajmal’s house of Mohamanganj. The unknown reason, Suddenly, he fell violently. A man came to him in a powerful position, Talk to him. This is how the story goes forward. Enjoy this novel filled with mysteries.', 'horror2.jpg', 40, NULL, 0, 1),
(10, '608c4a7fe90cc', 14, 9, 16, 'Thin Goyenda', '400', 'Tin Goyenda is a series of juvenile detective novels written by Rakib Hasan and published in Bangladesh by Sheba Prokashoni. The Tin Goyenda series is a subseries of Kishore Thriller series of Sheba Prokashoni. Apart from Tin Goyenda, Kishore Thriller Adventure is another subseries.', 'det2.jpg', 10, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart`
--

CREATE TABLE `product_cart` (
  `s_no` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_cat_title` varchar(100) NOT NULL,
  `cat_parent` int(11) NOT NULL,
  `cat_products` int(11) NOT NULL DEFAULT 0,
  `show_in_header` tinyint(4) NOT NULL DEFAULT 1,
  `show_in_footer` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_cat_id`, `sub_cat_title`, `cat_parent`, `cat_products`, `show_in_header`, `show_in_footer`) VALUES
(1, 'Novel', 14, 1, 1, 1),
(2, 'Fiction', 14, 2, 1, 1),
(3, 'physics', 12, 0, 1, 1),
(4, 'chemestry', 11, 0, 1, 1),
(5, 'biology', 10, 0, 1, 1),
(6, 'Thriller', 14, 1, 1, 1),
(7, 'Comic', 14, 0, 1, 1),
(8, 'Action/Adventures', 14, 1, 1, 1),
(9, 'Detective/Mystery', 14, 2, 1, 1),
(10, 'Bangla', 10, 0, 1, 1),
(11, 'English', 10, 0, 1, 1),
(12, 'Horror', 14, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `username`, `email`, `password`, `mobile`, `address`, `city`, `user_role`) VALUES
(4, 'Ayesha', 'Afroze', 'ayesha@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', '64637283893', 'Dhaka, Sylhet', 'Dhaka', 1),
(5, 'Rim', 'Chowdhury', 'rim@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', '838837575785', 'Chittagong, Bangladesh', 'Chittagong', 1),
(3, 'Trina', 'Chakraborty', 'trina@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', '9999999999', 'ctg, Bangladesh', 'ctg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cart`
--
ALTER TABLE `product_cart`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_cart`
--
ALTER TABLE `product_cart`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
