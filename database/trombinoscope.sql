-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 11 Décembre 2014 à 20:31
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
  `note` int(11) NOT NULL DEFAULT '0',
  `nbVote` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idUtil` (`idUtil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Contenu de la table `medias`
--

INSERT INTO `medias` (`id`, `chemin`, `idUtil`, `note`, `nbVote`) VALUES
(19, '/IMG/Debas_Thomas_20141211_4343053.jpg', 4, 0, 0),
(20, '/IMG/Devosse-Leger_Martin_20141211_8019696.jpg', 16, 0, 0),
(21, '/IMG/Devosse-Leger_Martin_20141211_7160025.jpg', 16, 0, 0),
(22, '/IMG/Vannoote_Romain_20141211_2566954.jpg', 17, 0, 0),
(23, '/IMG/Jagoury_Matthieu_20141211_8043690.jpg', 20, 0, 0),
(24, '/IMG/Maurice_Remy_20141211_9295809.jpg', 19, 0, 0),
(25, '/IMG/Kaczmarek_ Jeremy_20141211_3147750.jpg', 21, 0, 0),
(26, '/IMG/Devosse-Leger_Martin_20141211_7615564.jpg', 16, 0, 0),
(27, '/IMG/Debas_Thomas_20141211_8294568.jpg', 4, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `mdp`, `sexe`, `estAlternant`, `note`, `idDroit`, `chemin`, `nbVote`) VALUES
(4, 'Debas', 'Thomas', 'thomas.debas@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1', '1', 17, 3, '/IMG/Debas_Thomas_20141211_6675834.jpg', 1),
(16, 'Devosse-Leger', 'Martin', 'mdevosse@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1 ', '1 ', 18, 1, '/IMG/Devosse-Leger_Martin_20141211_5704221.jpg', 1),
(17, 'Vannoote', 'Romain', 'rvannoote@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1 ', '1 ', 7, 1, '/IMG/Vannoote_Romain_20141211_2065165.jpg', 1),
(18, 'Stalter', 'Marianne', 'mstalter@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '2 ', '1 ', 12, 1, '/IMG/Stalter_Marianne_20141211_3736660.jpg', 1),
(19, 'Maurice', 'Remy', 'rmaurice@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1 ', '2 ', 18, 1, '/IMG/Maurice_Remy_20141211_7607976.jpg', 1),
(20, 'Jagoury', 'Matthieu', 'mjagoury@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '1 ', '1 ', 10, 1, '/IMG/Jagoury_Matthieu_20141211_3835197.jpg', 2),
(21, 'Kaczmarek', ' Jeremy', 'jkaczmarek@team-it.fr', 'd41d8cd98f00b204e9800998ecf8427e', '2 ', '1 ', 17, 1, '/IMG/Kaczmarek_ Jeremy_20141211_3467928.jpg', 1);

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


/*Alter table utilisateur ADD nbVote int Not null Default 0;*/
/*Alter table medias ADD nbVote int Not null Default 0;*/
/*Alter table medias ADD note int Not null Default 0;*/