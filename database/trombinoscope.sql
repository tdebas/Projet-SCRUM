-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 08 Décembre 2014 à 08:33
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `trombinoscope`
--

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

CREATE TABLE IF NOT EXISTS `droit` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Contenu de la table `droit`
--

INSERT INTO `droit` (`id`, `libelle`) VALUES
(1, 'etudiant'),
(2, 'administrateur'),
(3, 'superadministrateur');

-- --------------------------------------------------------

--
-- Structure de la table `medias`
--

CREATE TABLE IF NOT EXISTS `medias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `chemin` varchar(255) NOT NULL,
  `idUtil` int(255) NOT NULL,
  `nbVote` int(11) DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUtil` (`idUtil`)
) ;

--
-- Contenu de la table `medias`
--

--INSERT INTO `medias` (`id`, `chemin`, `idUtil`, `nbVote`, `note`) VALUES
--(1, '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `estAlternant` varchar(255) DEFAULT NULL,
  `note` int(255) DEFAULT NULL,
  `idDroit` int(255) NOT NULL,
  `chemin` varchar(255) NOT NULL,
  `nbVote` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDroit` (`idDroit`)
);

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `mdp`, `sexe`, `estAlternant`, `note`, `idDroit`, `chemin`, `nbVote`) VALUES
(1, 'Andrezejwski ', 'Thomas', 'Andrezejwski.Thomas@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(2, 'Bayart', 'Simon', 'Bayart.Simon@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(3, 'Berton', 'Pierre-Yves', 'berton.pierreyves@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(4, 'Bordet', 'William', 'bordet.william@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(5, 'Bos', 'Romain', 'bos.romain@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(6, 'Debas', 'Thomas', 'thomas.debas@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 3, '/IMG/photo.jpg', 0),
(7, 'Demailly', 'Sebastien', 'demailly.sebastien@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(8, 'Deszcz', 'Sebastien', 'deszcz.sebastien@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(9, 'Devosse Leger', 'Martin', 'devosseleger.martin@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(10, 'Devynck', 'Nicolas', 'devynck.nicolas@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(11, 'Drapich', 'Maxime', 'draphich.maxime@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(12, 'Durak', 'Thomas', 'durak.thomas@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(13, 'Gomes', 'Alexis', 'gomes.alexis@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(14, 'Jagoury', 'Matthieu', 'jagoury.matthieu@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 3, '/IMG/JagouryMatthieu_20141127_6922782.jpg', 0),
(15, 'Kaczmarek', 'Jeremy', 'kaczmarek.jeremy@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(16, 'Laigle', 'Florian', 'laigle.florian@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(17, 'Leduc', 'Thomas', 'leduc.thomas@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(18, 'Logie', 'Quentin', 'logie.quentin@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(19, 'Loterie', 'Aymeric', 'loterie.aymeric@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(20, 'Maurice', 'Remi', 'remi.maurice@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 3, '/IMG/photo.jpg', 0),
(21, 'Meurillon', 'Gregoire', 'meurillon.gregoire@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(22, 'Michel', 'Aurelien', 'michel.aurelien@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 0, 1, '/IMG/photo.jpg', 0),
(23, 'Neville', 'Nathan', 'neville.nathan@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(24, 'Pruvost', 'Quentin', 'pruvost.quentin@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0),
(25, 'Stalter', 'Marianne', 'marianne.stalter@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '2', '1', 0, 3, '/IMG/photo.jpg', 0),
(26, 'Vannoote', 'Romain', 'romain.vannoote@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 3, '/IMG/photo.jpg', 0),
(27, 'Wasilewski', 'David', 'wasilewski.david@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 0, 1, '/IMG/photo.jpg', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `medias`
--
ALTER TABLE `medias`
  ADD CONSTRAINT `medias_ibfk_1` FOREIGN KEY (`idUtil`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`idDroit`) REFERENCES `droit` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
