-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 10:28 PM
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
-- Database: `synextadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(28, 'Books'),
(29, 'Flowers'),
(30, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231018110152', '2023-10-18 13:03:11', 14),
('DoctrineMigrations\\Version20231018111804', '2023-10-18 13:18:15', 9),
('DoctrineMigrations\\Version20231018152557', '2023-10-18 17:27:23', 9),
('DoctrineMigrations\\Version20231018165207', '2023-10-18 18:53:14', 59),
('DoctrineMigrations\\Version20231019093126', '2023-10-19 11:31:44', 16),
('DoctrineMigrations\\Version20231019093923', '2023-10-19 11:39:34', 54),
('DoctrineMigrations\\Version20231019100538', '2023-10-19 12:06:30', 145),
('DoctrineMigrations\\Version20231019110412', '2023-10-19 13:04:20', 10);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`) VALUES
(31, 30, 'Pizza'),
(32, 30, 'Burger'),
(33, 30, 'Sushi'),
(34, 30, 'Spaghetti'),
(35, 30, 'Ice Cream'),
(36, 28, 'To Kill a Mockingbird'),
(37, 28, '1984'),
(38, 28, 'The Great Gatsby'),
(39, 28, 'Pride and Prejudice'),
(40, 28, 'The Catcher in the Rye'),
(41, 29, 'Rose'),
(42, 29, 'Tulip'),
(43, 29, 'Sunflower'),
(44, 29, 'Daisy'),
(45, 29, 'Lily');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(12, 32, 'ov5HPGt0DyjcjXbIyOzw', 'rHQtCbv0BpmdiCFOBwzsv8mBVOTnLTsQ01RygIQL8mU=', '2023-10-20 21:45:26', '2023-10-20 22:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `is_verified`) VALUES
(22, 'o@o.oo', '[]', '$2y$13$jbsE5Hh/7ldGxvDPWbZzmu38NcxjNDKur0EFmQvIHSqULriZQie9a', 'ouma', 'kbb', 1),
(23, 'zz.z', '[]', '$2y$13$FpH4a5Fw4bZsUCZOa.ZPhe2YEZ5/MOv/r84LZZ8z0w2DO9r3shMEW', 'zouhaier', 'kb', 0),
(24, 'z@z.z', '[]', '$2y$13$XlF38khAM3yVzugGwJkIx.buBOp9uS1Ci1zqbQni.bdoUD/LsNaka', 'yoo', 'yiiii', 1),
(25, 'ouma@ouma.ouma', '[]', '$2y$13$neHGOaMohCKdzSXUu5Jaz.6HcyCZ1abNcCXPIUNSJPZRhoU1X8KO2', 'oumaima', 'kboubi', 1),
(26, 'ouma@ouma@oumaa', '[]', '$2y$13$M2.Z3pTjUOPfzCR.DMzQX.3CDAk7oaYWpQ/7.UFAbnyv/PYojVwVy', 'kboubi', 'oumaima', 0),
(27, 'o@o.comm', '[]', '$2y$13$7SiA9R9RVU7c/4FE3JcpGu8hTC1qqy/JTJt1kFnOhJktUtJ3qGkW.', 'oumaima', 'kboubi', 1),
(28, 'oumaouma.o', '[]', '$2y$13$yOD9nb9BKKBNOAc/S6rT6eoglI/N.oP.wGyKZfEhvWyyoxS/eWbLe', 'oumaima', 'kb', 0),
(29, 'ouma@ouma.o', '[]', '$2y$13$ehyss4/1Ui29kigvDzfNa.w779DF588ElDGcdk0uKqJQFVSw.fTYC', 'test', 'test 2', 1),
(30, 'ouma@ouma.tn', '[]', '$2y$13$VdXkpLosXybyVD0qvnVDS.MLHHGUqbo2HoUTXG1LEokauzhIHVRuq', 'oumaima', 'kbb', 1),
(31, 'oumaima@gmail.com', '[]', '$2y$13$ZwRhIf5GU2ocObTQP8eqMeBIdw3iSL3n0ox/ZgIGaDYr.SlKPRaUW', 'ouma', 'test', 1),
(32, 'oumaima@gmail.tn', '[]', '$2y$13$X3V1hAVH5wVmrLaVQ9P8veqQOU28BOQqbO/8vpuFvZh0MSxK5BWBa', 'oumaima', 'kboubi', 1),
(33, 'oumaima@outlook.fr', '[]', '$2y$13$JtZ.EfSC5PJ3qi9onT7evewoDs49JFpslVos7uqMY8BVbwy5nLsbu', 'oumaima', 'kboubi', 0),
(34, 'oumaima@oumaima.tn', '[]', '$2y$13$O5owzZLfi0qOGtk1SlHNfeceykgb55a.tZCy8xJx6gtczDhg7W5Jm', 'ouma', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_list`
--

CREATE TABLE `user_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_list`
--

INSERT INTO `user_list` (`id`, `user_id`) VALUES
(2, 22),
(3, 24),
(4, 25),
(5, 27),
(6, 29),
(7, 34);

-- --------------------------------------------------------

--
-- Table structure for table `user_list_product`
--

CREATE TABLE `user_list_product` (
  `user_list_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_list_product`
--

INSERT INTO `user_list_product` (`user_list_id`, `product_id`) VALUES
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(3, 31),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 42),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(4, 41),
(4, 42),
(4, 43),
(4, 44),
(4, 45),
(5, 32),
(5, 33),
(5, 34),
(5, 36),
(5, 38),
(5, 41),
(5, 42),
(5, 43),
(5, 44),
(5, 45),
(6, 31),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(7, 36),
(7, 37),
(7, 38),
(7, 39),
(7, 40),
(7, 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `user_list`
--
ALTER TABLE `user_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3E49B4D1A76ED395` (`user_id`);

--
-- Indexes for table `user_list_product`
--
ALTER TABLE `user_list_product`
  ADD PRIMARY KEY (`user_list_id`,`product_id`),
  ADD KEY `IDX_8FC9A5A265A30881` (`user_list_id`),
  ADD KEY `IDX_8FC9A5A24584665A` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_list`
--
ALTER TABLE `user_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_list`
--
ALTER TABLE `user_list`
  ADD CONSTRAINT `FK_3E49B4D1A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_list_product`
--
ALTER TABLE `user_list_product`
  ADD CONSTRAINT `FK_8FC9A5A24584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8FC9A5A265A30881` FOREIGN KEY (`user_list_id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
