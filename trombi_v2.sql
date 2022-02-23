-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Feb 09, 2022 at 01:44 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trombi_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `id_etudiant` int(11) NOT NULL,
  `nom_etudiant` varchar(50) NOT NULL,
  `prenom_etudiant` varchar(50) NOT NULL,
  `photo_etudiant` varchar(50) NOT NULL,
  `genre_etudiant` int(11) NOT NULL,
  `promo_etudiant` int(11) NOT NULL,
  `mail_etudiant` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`id_etudiant`, `nom_etudiant`, `prenom_etudiant`, `photo_etudiant`, `genre_etudiant`, `promo_etudiant`, `mail_etudiant`) VALUES
(1, 'Adam', 'Thierry', '', 2, 2, ''),
(2, 'Borel', 'Bertrand', '', 2, 2, ''),
(3, 'Boucly', 'Kevin', '', 2, 2, ''),
(4, 'Corlay', 'Morgan', '', 2, 2, ''),
(5, 'Coroller', 'Loic', '', 2, 2, ''),
(6, 'de-Sousa-Lustosa-Silva', 'Lucas', '', 2, 2, ''),
(7, 'Faudeil', 'Nathan', '', 2, 2, ''),
(8, 'Gavancha-Cassiano', 'Fabio', '', 2, 2, ''),
(9, 'Guichoux', 'Quentin', '', 2, 2, ''),
(10, 'Heller', 'Romain', '', 2, 2, ''),
(11, 'Ikheneche', 'Nacira', '', 1, 2, ''),
(13, 'Lannurien', 'Victor', '', 2, 2, ''),
(14, 'Laxalde', 'Ewen', '', 2, 2, ''),
(15, 'Le-Dem', 'Maina', '', 1, 2, ''),
(16, 'Lepelley', 'Perrine', '', 1, 2, ''),
(17, 'Le-Roch', 'Gwenn', '', 2, 2, ''),
(18, 'Nafoussi', 'Hichem', '', 2, 2, ''),
(19, 'Penfeunteun', 'Sylvia', '', 1, 2, ''),
(20, 'Plessis', 'Loic', '', 2, 2, ''),
(21, 'Poirier', 'Herve', '', 2, 2, ''),
(22, 'Sanchez', 'Pauline', '', 1, 2, ''),
(23, 'Sepehri', 'Shima', '', 1, 2, ''),
(24, 'Tanguy', 'Erwan', '', 2, 2, ''),
(25, 'Tanguy', 'Franky', '', 2, 2, ''),
(26, 'Ciceron', 'Virginie', '', 1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `libelle_genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id_genre`, `libelle_genre`) VALUES
(1, 'Femme'),
(2, 'Homme'),
(3, 'Autre');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id_promo` int(11) NOT NULL,
  `libelle_promo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id_promo`, `libelle_promo`) VALUES
(1, 'Promo 1'),
(2, 'Breizhmeiz'),
(3, 'Encadrant');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `genre_etudiant` (`genre_etudiant`,`promo_etudiant`),
  ADD KEY `promo_etudiant` (`promo_etudiant`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id_promo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id_promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_ibfk_1` FOREIGN KEY (`genre_etudiant`) REFERENCES `genre` (`id_genre`),
  ADD CONSTRAINT `etudiants_ibfk_2` FOREIGN KEY (`promo_etudiant`) REFERENCES `promotion` (`id_promo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
