-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 02 avr. 2020 à 18:44
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `essentialmode`
--

-- --------------------------------------------------------

--
-- Structure de la table `ems_description`
--

DROP TABLE IF EXISTS `ems_description`;
CREATE TABLE IF NOT EXISTS `ems_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `apperance` varchar(250) DEFAULT NULL,
  `type_of_crime` varchar(250) DEFAULT NULL,
  `fine` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ems_description`
--

INSERT INTO `ems_description` (`id`, `lastname`, `name`, `apperance`, `type_of_crime`, `fine`, `created_at`) VALUES
(5, 'La fuine', 'Robert', 'Kovix', 'Controle de routine', '02-04-2020 à 18h', '2020-04-02 15:14:47');

-- --------------------------------------------------------

--
-- Structure de la table `ems_notes`
--

DROP TABLE IF EXISTS `ems_notes`;
CREATE TABLE IF NOT EXISTS `ems_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` varchar(250) NOT NULL,
  `user_id` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ems_notes`
--

INSERT INTO `ems_notes` (`id`, `title`, `content`, `user_id`, `created_at`) VALUES
(7, 'az', 'azz', 'steam:11000010ba8f10e', '2020-04-02 15:11:12'),
(3, 'Fragile', 'Kdo', 'steam:11000010de58d35', '2020-03-03 16:05:10');

-- --------------------------------------------------------

--
-- Structure de la table `ems_records`
--

DROP TABLE IF EXISTS `ems_records`;
CREATE TABLE IF NOT EXISTS `ems_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(250) NOT NULL,
  `offence` varchar(250) DEFAULT NULL,
  `user_id` varchar(250) NOT NULL,
  `officer_id` varchar(250) NOT NULL,
  `time` varchar(250) DEFAULT NULL,
  `created_at` int(20) DEFAULT NULL,
  `fine` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ems_records`
--

INSERT INTO `ems_records` (`id`, `reason`, `offence`, `user_id`, `officer_id`, `time`, `created_at`, `fine`) VALUES
(1, 'Aggression', NULL, 'steam:11000010de58d35', 'steam:11000010ba8f10e', '0', NULL, '500'),
(4, 'Blessure par balle', NULL, 'steam:11000010ba8f10e', 'steam:11000010ba8f10e', '1h45', NULL, '5000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
