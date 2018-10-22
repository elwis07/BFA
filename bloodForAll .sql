-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 22 oct. 2018 à 10:00
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bloodForAll`
--

-- --------------------------------------------------------

--
-- Structure de la table `banques`
--

CREATE TABLE `banques` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `localisation` varchar(55) NOT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `departement_idDepartement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `banques`
--

INSERT INTO `banques` (`id`, `nom`, `email`, `num`, `localisation`, `longitude`, `latitude`, `departement_idDepartement`) VALUES
(1, 'banque1', 'banque1.benin@gamil.com', 64251417, 'quelques part', NULL, NULL, 2),
(2, 'banque2', 'banque2.benin@gmail.com', 98451201, 'quelque part', NULL, NULL, 3),
(3, 'banque3', 'banque3.benin@gmail.com', 97451203, 'Ganhi', NULL, NULL, 8),
(4, 'banque4', 'banque4.benin@gmail.com', 66521445, 'quelque part', NULL, NULL, 4),
(5, 'banque5', 'banque5.benin@gmail.com', 64451202, 'quelques part', NULL, NULL, 5),
(6, 'banque6', 'banque6.benin@gmail.com', 65124785, 'quelque part', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `banques_has_users`
--

CREATE TABLE `banques_has_users` (
  `id` int(11) NOT NULL,
  `banques_id` int(11) NOT NULL,
  `users_idusers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `idDepartement` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`idDepartement`, `nom`) VALUES
(1, 'Couffo'),
(2, 'Alibori'),
(3, 'Atacora'),
(4, 'Atlantique'),
(5, 'Borgou'),
(6, 'Collines'),
(7, 'Donga'),
(8, 'Littoral'),
(9, 'Mono'),
(10, 'Oueme'),
(11, 'Plateau'),
(12, 'Zou');

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`id`, `nom`, `description`) VALUES
(1, 'Administrateur', 'administrateur hopital'),
(2, 'Medecin', 'médecin'),
(3, 'Agent banque', 'agent'),
(4, 'Super admin', 'super admin'),
(5, 'Donneur', 'donneurs');

-- --------------------------------------------------------

--
-- Structure de la table `groupeSanguin`
--

CREATE TABLE `groupeSanguin` (
  `id_groupeSanguin` int(11) NOT NULL,
  `groupeSanguin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupeSanguin`
--

INSERT INTO `groupeSanguin` (`id_groupeSanguin`, `groupeSanguin`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+ '),
(8, 'O-');

-- --------------------------------------------------------

--
-- Structure de la table `hopital`
--

CREATE TABLE `hopital` (
  `id_hopital` int(11) NOT NULL,
  `codeHopital` varchar(50) NOT NULL,
  `nom_hopital` varchar(45) NOT NULL,
  `email_hopital` varchar(50) DEFAULT NULL,
  `num_hopital` int(11) NOT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `localisation` varchar(45) NOT NULL,
  `adminId` int(11) DEFAULT NULL,
  `departement_idDepartement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hopital`
--

INSERT INTO `hopital` (`id_hopital`, `codeHopital`, `nom_hopital`, `email_hopital`, `num_hopital`, `longitude`, `latitude`, `localisation`, `adminId`, `departement_idDepartement`) VALUES
(1, '101010', 'homel', 'homelCotonou@gmail.bj', 67871117, NULL, NULL, 'ganhi', NULL, 8),
(2, '111111', 'CNHU', 'cnhu.benin@gmail.com', 65454789, NULL, NULL, 'himm', NULL, 8);

-- --------------------------------------------------------

--
-- Structure de la table `hopital_has_users`
--

CREATE TABLE `hopital_has_users` (
  `id` int(11) NOT NULL,
  `compteActif` int(11) DEFAULT NULL,
  `hopital_id` int(11) NOT NULL,
  `hopital_codeHopital` varchar(50) NOT NULL,
  `users_idusers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hopital_has_users`
--

INSERT INTO `hopital_has_users` (`id`, `compteActif`, `hopital_id`, `hopital_codeHopital`, `users_idusers`) VALUES
(1, 1, 1, '101010', 1),
(2, 0, 2, '111111', 1),
(3, NULL, 1, '101010', 3),
(4, NULL, 1, '101010', 6),
(5, NULL, 1, '101010', 7),
(6, NULL, 1, '101010', 8),
(7, NULL, 1, '101010', 9),
(8, NULL, 1, '101010', 10),
(9, NULL, 1, '101010', 11);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `date_mise_a_jour` date NOT NULL,
  `groupeSanguin_idgroupeSanguin` int(11) NOT NULL,
  `banques_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenoms` varchar(45) NOT NULL,
  `pseudo` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `num` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `departement_idDepartement` int(11) NOT NULL,
  `groupeSanguin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idusers`, `nom`, `prenoms`, `pseudo`, `password`, `email`, `num`, `status`, `departement_idDepartement`, `groupeSanguin_id`) VALUES
(1, 'koulo', 'elwis', 'elwis07', '12345678', 'elwis.cindy@gmail.com', '67871117', 0, 8, 1),
(3, 'ADECHINA', 'Zianath', 'ziana07', '12345678', 'koulo.elwis07@gmail.com', '64521214', 0, 8, 5),
(4, 'sidi ali', 'yasminath', 'yasminath07', '12345678', 'sidiali@gmail.com', '64521210', 0, 8, 5),
(5, 'sidi ali', 'yasm', 'yasminath08', '12345678', 'sidiai@gmail.com', '64521211', 0, 8, 5),
(6, 'sidi ali', 'yasm1', 'yasminath09', '12345678', 'sidioi@gmail.com', '64521217', 0, 8, 5),
(7, 'seneque', 'jhhfgh', 'nek04', '12345678', 'elwis.loi@gmail.com', '64521015', 0, 3, 1),
(8, 'koulo', 'sergio', 'sergio07', '12345678', 'sergio.koulo@gmail.com', '6787117', 0, 8, 2),
(9, 'koulo', 'hugues', 'huguo', '12345678', 'koulo.huguo@gmail.com', '64521415', 0, 4, 6),
(10, 'koulo', 'pauline', 'pauline', '12345678', 'paupau.koulo@gmail.com', '65120235', 0, 3, 6),
(11, 'ochoumaré', 'loic', 'loic07', '12345678', 'loic.ochu@gmail.com', '66323069', 0, 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users_has_group`
--

CREATE TABLE `users_has_group` (
  `id` int(10) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users_has_group`
--

INSERT INTO `users_has_group` (`id`, `users_idusers`, `group_id`) VALUES
(1, 3, 2),
(2, 4, 2),
(3, 5, 2),
(4, 6, 2),
(5, 7, 2),
(6, 8, 2),
(7, 9, 2),
(8, 10, 2),
(9, 11, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `banques`
--
ALTER TABLE `banques`
  ADD PRIMARY KEY (`id`,`departement_idDepartement`),
  ADD KEY `fk_banques_departement1_idx` (`departement_idDepartement`);

--
-- Index pour la table `banques_has_users`
--
ALTER TABLE `banques_has_users`
  ADD PRIMARY KEY (`id`,`banques_id`,`users_idusers`),
  ADD KEY `fk_banques_has_users_users1_idx` (`users_idusers`),
  ADD KEY `fk_banques_has_users_banques1_idx` (`banques_id`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`idDepartement`);

--
-- Index pour la table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupeSanguin`
--
ALTER TABLE `groupeSanguin`
  ADD PRIMARY KEY (`id_groupeSanguin`);

--
-- Index pour la table `hopital`
--
ALTER TABLE `hopital`
  ADD PRIMARY KEY (`id_hopital`,`codeHopital`,`departement_idDepartement`),
  ADD KEY `fk_hopital_departement1_idx` (`departement_idDepartement`);

--
-- Index pour la table `hopital_has_users`
--
ALTER TABLE `hopital_has_users`
  ADD PRIMARY KEY (`id`,`hopital_id`,`hopital_codeHopital`,`users_idusers`),
  ADD KEY `fk_hopital_has_users_users1_idx` (`users_idusers`),
  ADD KEY `fk_hopital_has_users_hopital1_idx` (`hopital_id`,`hopital_codeHopital`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`,`groupeSanguin_idgroupeSanguin`,`banques_id`),
  ADD KEY `fk_stock_groupeSanguin1_idx` (`groupeSanguin_idgroupeSanguin`),
  ADD KEY `fk_stock_banques1_idx` (`banques_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`,`departement_idDepartement`,`groupeSanguin_id`),
  ADD KEY `fk_users_departement1_idx` (`departement_idDepartement`),
  ADD KEY `fk_users_groupeSanguin1_idx` (`groupeSanguin_id`);

--
-- Index pour la table `users_has_group`
--
ALTER TABLE `users_has_group`
  ADD PRIMARY KEY (`id`,`users_idusers`,`group_id`),
  ADD KEY `fk_users_has_group_group1_idx` (`group_id`),
  ADD KEY `fk_users_has_group_users1_idx` (`users_idusers`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `banques`
--
ALTER TABLE `banques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `banques_has_users`
--
ALTER TABLE `banques_has_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `idDepartement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `groupeSanguin`
--
ALTER TABLE `groupeSanguin`
  MODIFY `id_groupeSanguin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `hopital`
--
ALTER TABLE `hopital`
  MODIFY `id_hopital` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `hopital_has_users`
--
ALTER TABLE `hopital_has_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `users_has_group`
--
ALTER TABLE `users_has_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `banques`
--
ALTER TABLE `banques`
  ADD CONSTRAINT `fk_banques_departement1` FOREIGN KEY (`departement_idDepartement`) REFERENCES `departement` (`idDepartement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `banques_has_users`
--
ALTER TABLE `banques_has_users`
  ADD CONSTRAINT `fk_banques_has_users_banques1` FOREIGN KEY (`banques_id`) REFERENCES `banques` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_banques_has_users_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `hopital`
--
ALTER TABLE `hopital`
  ADD CONSTRAINT `fk_hopital_departement1` FOREIGN KEY (`departement_idDepartement`) REFERENCES `departement` (`idDepartement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `hopital_has_users`
--
ALTER TABLE `hopital_has_users`
  ADD CONSTRAINT `fk_hopital_has_users_hopital1` FOREIGN KEY (`hopital_id`,`hopital_codeHopital`) REFERENCES `hopital` (`id_hopital`, `codeHopital`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hopital_has_users_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_banques1` FOREIGN KEY (`banques_id`) REFERENCES `banques` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stock_groupeSanguin1` FOREIGN KEY (`groupeSanguin_idgroupeSanguin`) REFERENCES `groupeSanguin` (`id_groupeSanguin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_departement1` FOREIGN KEY (`departement_idDepartement`) REFERENCES `departement` (`idDepartement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groupeSanguin1` FOREIGN KEY (`groupeSanguin_id`) REFERENCES `groupeSanguin` (`id_groupeSanguin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_has_group`
--
ALTER TABLE `users_has_group`
  ADD CONSTRAINT `fk_users_has_group_group1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_group_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
