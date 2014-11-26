-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 26 Novembre 2014 à 16:00
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
  PRIMARY KEY (`id`),
  KEY `idUtil` (`idUtil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `medias`
--

INSERT INTO `medias` (`id`, `chemin`, `idUtil`) VALUES
(1, 'http://localhost:8080/trombi/IMG/photo.jpg', 1),
(2, 'http://localhost:8080/trombi/IMG/photo2.jpg', 1),
(3, 'http://localhost:8080/trombi/IMG/photo.jpg', 2),
(4, 'http://localhost:8080/trombi/IMG/photo.jpg', 3);

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
  PRIMARY KEY (`id`),
  KEY `idDroit` (`idDroit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `mdp`, `sexe`, `estAlternant`, `note`, `idDroit`, `chemin`) VALUES
(1, 'Jagoury', 'Matthieu', 'jagoury.m@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 4, 3, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(2, 'Stalter', 'Marianne', 'marianne.stalter@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '2', '1', 4, 3, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(3, 'Maurice', 'Remy', 'remy.maurice@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 4, 3, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(4, 'Debas', 'Thomas', 'thomas.debas@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 4, 3, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(5, 'Vannoote', 'Romain', 'romain.vannoote@epsi.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 4, 3, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(6, 'Caisse', 'Jean', 'jc@mail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 1, 1, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(7, 'Lemoi', 'Marc', 'ml@mail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 2, 2, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(8, 'Zetteaufrais', 'Mélanie', 'mz@mail.com', 'd41d8cd98f00b204e9800998ecf8427e', '2', '2', 3, 1, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(9, 'Dubois', 'Marcel', 'dm@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 4, 1, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(10, 'Petit', 'David', 'dp@mail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 3, 1, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(11, 'Vaast', 'Gabriel', 'gv@mail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '2', 5, 1, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(12, 'Parker', 'Anthony', 'ap@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 3, 1, 'http://localhost:8080/trombi/IMG/photo.jpg'),
(13, 'D''arras', 'Camille', 'cm@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '2', '2', 2, 2, 'http://localhost:8080/trombi/IMG/photo.jpg');

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
