-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 08 Novembre 2016 à 16:57
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gsb_applifrais`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Fiche Signée, saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('MP', 'Mise en paiement'),
('RB', 'Remboursée'),
('VA', 'Validée');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR',
  PRIMARY KEY (`idVisiteur`,`mois`),
  KEY `fichefrais_ibfk_1` (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a131', '201604', 0, '0.00', '2016-09-20', 'CR'),
('a131', '201605', 0, '0.00', '2016-09-20', 'CR'),
('a131', '201606', 0, '0.00', '2016-09-20', 'CR'),
('a131', '201607', 0, '0.00', '2016-09-20', 'CR'),
('a131', '201608', 0, '0.00', '2016-09-20', 'CR'),
('a131', '201609', 0, '0.00', '2016-09-20', 'CR'),
('a131', '201610', 0, '0.00', '2016-10-04', 'CR'),
('a17', '201605', 0, '0.00', '2016-10-04', 'CR'),
('a17', '201606', 0, '0.00', '2016-10-04', 'CR'),
('a17', '201607', 0, '0.00', '2016-10-04', 'CR'),
('a17', '201608', 0, '0.00', '2016-10-04', 'CR'),
('a17', '201609', 0, '0.00', '2016-10-04', 'CR'),
('a17', '201610', 0, '0.00', '2016-10-18', 'CL'),
('a17', '201611', 0, '0.00', '2016-11-08', 'CR'),
('a55', '201605', 0, '0.00', '2016-10-18', 'CR'),
('a55', '201606', 0, '0.00', '2016-10-18', 'CR'),
('a55', '201607', 0, '0.00', '2016-10-18', 'CR'),
('a55', '201608', 0, '0.00', '2016-10-18', 'CR'),
('a55', '201609', 0, '0.00', '2016-10-18', 'CR'),
('a55', '201610', 0, '0.00', '2016-10-18', 'CL');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `idUtilisateur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `montantApplique` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`mois`,`idFraisForfait`),
  KEY `lignefraisforfait_ibfk_2` (`idFraisForfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idUtilisateur`, `mois`, `idFraisForfait`, `quantite`, `montantApplique`) VALUES
('a131', '201604', 'ETP', 0, '110.00'),
('a131', '201604', 'KM', 0, '0.62'),
('a131', '201604', 'NUI', 0, '80.00'),
('a131', '201604', 'REP', 0, '25.00'),
('a131', '201605', 'ETP', 0, '110.00'),
('a131', '201605', 'KM', 0, '0.62'),
('a131', '201605', 'NUI', 0, '80.00'),
('a131', '201605', 'REP', 0, '25.00'),
('a131', '201606', 'ETP', 0, '110.00'),
('a131', '201606', 'KM', 0, '0.62'),
('a131', '201606', 'NUI', 0, '80.00'),
('a131', '201606', 'REP', 0, '25.00'),
('a131', '201607', 'ETP', 0, '110.00'),
('a131', '201607', 'KM', 0, '0.62'),
('a131', '201607', 'NUI', 0, '80.00'),
('a131', '201607', 'REP', 0, '25.00'),
('a131', '201608', 'ETP', 0, '110.00'),
('a131', '201608', 'KM', 0, '0.62'),
('a131', '201608', 'NUI', 0, '80.00'),
('a131', '201608', 'REP', 0, '25.00'),
('a131', '201609', 'ETP', 0, '110.00'),
('a131', '201609', 'KM', 0, '0.62'),
('a131', '201609', 'NUI', 0, '80.00'),
('a131', '201609', 'REP', 0, '25.00'),
('a131', '201610', 'ETP', 0, '110.00'),
('a131', '201610', 'KM', 0, '0.62'),
('a131', '201610', 'NUI', 0, '80.00'),
('a131', '201610', 'REP', 0, '25.00'),
('a17', '201605', 'ETP', 0, '110.00'),
('a17', '201605', 'KM', 0, '0.62'),
('a17', '201605', 'NUI', 0, '80.00'),
('a17', '201605', 'REP', 0, '25.00'),
('a17', '201606', 'ETP', 0, '110.00'),
('a17', '201606', 'KM', 0, '0.62'),
('a17', '201606', 'NUI', 0, '80.00'),
('a17', '201606', 'REP', 0, '25.00'),
('a17', '201607', 'ETP', 0, '110.00'),
('a17', '201607', 'KM', 0, '0.62'),
('a17', '201607', 'NUI', 0, '80.00'),
('a17', '201607', 'REP', 0, '25.00'),
('a17', '201608', 'ETP', 0, '110.00'),
('a17', '201608', 'KM', 0, '0.62'),
('a17', '201608', 'NUI', 0, '80.00'),
('a17', '201608', 'REP', 0, '25.00'),
('a17', '201609', 'ETP', 0, '110.00'),
('a17', '201609', 'KM', 0, '0.62'),
('a17', '201609', 'NUI', 0, '80.00'),
('a17', '201609', 'REP', 0, '25.00'),
('a17', '201610', 'ETP', 0, '110.00'),
('a17', '201610', 'KM', 0, '0.62'),
('a17', '201610', 'NUI', 0, '80.00'),
('a17', '201610', 'REP', 0, '25.00'),
('a55', '201605', 'ETP', 0, '110.00'),
('a55', '201605', 'KM', 0, '0.62'),
('a55', '201605', 'NUI', 0, '80.00'),
('a55', '201605', 'REP', 0, '25.00'),
('a55', '201606', 'ETP', 0, '110.00'),
('a55', '201606', 'KM', 0, '0.62'),
('a55', '201606', 'NUI', 0, '80.00'),
('a55', '201606', 'REP', 0, '25.00'),
('a55', '201607', 'ETP', 0, '110.00'),
('a55', '201607', 'KM', 0, '0.62'),
('a55', '201607', 'NUI', 0, '80.00'),
('a55', '201607', 'REP', 0, '25.00'),
('a55', '201608', 'ETP', 0, '110.00'),
('a55', '201608', 'KM', 0, '0.62'),
('a55', '201608', 'NUI', 0, '80.00'),
('a55', '201608', 'REP', 0, '25.00'),
('a55', '201609', 'ETP', 0, '110.00'),
('a55', '201609', 'KM', 0, '0.62'),
('a55', '201609', 'NUI', 0, '80.00'),
('a55', '201609', 'REP', 0, '25.00'),
('a55', '201610', 'ETP', 0, '110.00'),
('a55', '201610', 'KM', 0, '0.62'),
('a55', '201610', 'NUI', 0, '80.00'),
('a55', '201610', 'REP', 0, '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lignefraishorsforfait_ibfk_1` (`idVisiteur`,`mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `codeProfil` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` char(10) NOT NULL,
  PRIMARY KEY (`codeProfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `profil`
--

INSERT INTO `profil` (`codeProfil`, `libelle`) VALUES
(1, 'Visiteur'),
(2, 'Comptable');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `idProfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_ibfk_1` (`idProfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `idProfil`) VALUES
('a131', 'Villachane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 2),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 2),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 1),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 2),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 2),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 2),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 2),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', 2),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 2),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 2),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', 1),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 1),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 2),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 2),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 2),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 2),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 2),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 2),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 2),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 2),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 2),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 1),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 1),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 2),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 2),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 2),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 2);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idUtilisateur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `visiteur_ibfk_1` FOREIGN KEY (`idProfil`) REFERENCES `profil` (`codeProfil`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
