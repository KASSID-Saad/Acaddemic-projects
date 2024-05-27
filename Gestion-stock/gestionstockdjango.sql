-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 mai 2024 à 14:57
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionstockdjango`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_achat`
--

CREATE TABLE `api_achat` (
  `id` bigint(20) NOT NULL,
  `date_Achat` date NOT NULL,
  `quantite` int(11) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `produit_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `api_achat`
--

INSERT INTO `api_achat` (`id`, `date_Achat`, `quantite`, `client_id`, `produit_id`) VALUES
(1, '2024-01-01', 100, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `api_administrateur`
--

CREATE TABLE `api_administrateur` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `api_administrateur`
--

INSERT INTO `api_administrateur` (`id`, `nom`, `prenom`, `login`, `password`, `image`) VALUES
(1, 'aa', 'ww', 'admin1', 'test00', 'hahahah1111');

-- --------------------------------------------------------

--
-- Structure de la table `api_client`
--

CREATE TABLE `api_client` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `api_client`
--

INSERT INTO `api_client` (`id`, `nom`, `prenom`, `email`, `telephone`, `adresse`) VALUES
(1, 'Kassid', 'Saad', 'saadkassid@gmail.com', '0600000000', 'ain borja');

-- --------------------------------------------------------

--
-- Structure de la table `api_fournisseur`
--

CREATE TABLE `api_fournisseur` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `adresse` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `api_fournisseur`
--

INSERT INTO `api_fournisseur` (`id`, `libelle`, `telephone`, `email`, `adresse`) VALUES
(1, 'Ismail HIdara', '0600000000', 'ismailhidara@gmail.com', 'hay farah');

-- --------------------------------------------------------

--
-- Structure de la table `api_produit`
--

CREATE TABLE `api_produit` (
  `id` bigint(20) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `prixU` decimal(8,2) NOT NULL,
  `quantite` int(11) NOT NULL,
  `fournisseur_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `api_produit`
--

INSERT INTO `api_produit` (`id`, `reference`, `designation`, `prixU`, `quantite`, `fournisseur_id`) VALUES
(1, 'Iphone13', 'maarif', 10000.00, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add achat', 7, 'add_achat'),
(26, 'Can change achat', 7, 'change_achat'),
(27, 'Can delete achat', 7, 'delete_achat'),
(28, 'Can view achat', 7, 'view_achat'),
(29, 'Can add administrateur', 8, 'add_administrateur'),
(30, 'Can change administrateur', 8, 'change_administrateur'),
(31, 'Can delete administrateur', 8, 'delete_administrateur'),
(32, 'Can view administrateur', 8, 'view_administrateur'),
(33, 'Can add fournisseur', 9, 'add_fournisseur'),
(34, 'Can change fournisseur', 9, 'change_fournisseur'),
(35, 'Can delete fournisseur', 9, 'delete_fournisseur'),
(36, 'Can view fournisseur', 9, 'view_fournisseur'),
(37, 'Can add produit', 10, 'add_produit'),
(38, 'Can change produit', 10, 'change_produit'),
(39, 'Can delete produit', 10, 'delete_produit'),
(40, 'Can view produit', 10, 'view_produit'),
(41, 'Can add client', 11, 'add_client'),
(42, 'Can change client', 11, 'change_client'),
(43, 'Can delete client', 11, 'delete_client'),
(44, 'Can view client', 11, 'view_client');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$UOSwUEv1L1MXc3ojpoKYDY$Sh9aJEabUrs/9D4xE7KQpUlNs/vtdQBP9Pws1EeYqrg=', NULL, 1, 'admin', '', '', '', 1, 1, '2024-04-11 03:09:02.415424'),
(2, 'hh', NULL, 0, 'admin2', '', '', '', 0, 1, '2024-04-11 03:34:51.345471'),
(3, 'admin', '0000-00-00 00:00:00.000000', 1, 'ismail', 'is', 'mail', 'ismail@gmail.com', 1, 1, '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'API', 'achat'),
(8, 'API', 'administrateur'),
(11, 'API', 'client'),
(9, 'API', 'fournisseur'),
(10, 'API', 'produit'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'API', '0001_initial', '2024-04-11 02:53:55.651996'),
(2, 'API', '0002_alter_achat_date_achat', '2024-04-11 02:53:56.350992'),
(3, 'API', '0003_alter_achat_id_alter_administrateur_id_and_more', '2024-04-11 02:54:05.911310'),
(4, 'contenttypes', '0001_initial', '2024-04-11 02:54:06.257113'),
(5, 'auth', '0001_initial', '2024-04-11 02:54:14.415864'),
(6, 'admin', '0001_initial', '2024-04-11 02:54:16.223825'),
(7, 'admin', '0002_logentry_remove_auto_add', '2024-04-11 02:54:16.269799'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-11 02:54:16.334762'),
(9, 'contenttypes', '0002_remove_content_type_name', '2024-04-11 02:54:17.083798'),
(10, 'auth', '0002_alter_permission_name_max_length', '2024-04-11 02:54:18.673807'),
(11, 'auth', '0003_alter_user_email_max_length', '2024-04-11 02:54:18.807882'),
(12, 'auth', '0004_alter_user_username_opts', '2024-04-11 02:54:18.848856'),
(13, 'auth', '0005_alter_user_last_login_null', '2024-04-11 02:54:19.385533'),
(14, 'auth', '0006_require_contenttypes_0002', '2024-04-11 02:54:19.460490'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2024-04-11 02:54:19.561450'),
(16, 'auth', '0008_alter_user_username_max_length', '2024-04-11 02:54:19.728646'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2024-04-11 02:54:19.834585'),
(18, 'auth', '0010_alter_group_name_max_length', '2024-04-11 02:54:19.957514'),
(19, 'auth', '0011_update_proxy_permissions', '2024-04-11 02:54:20.009502'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2024-04-11 02:54:20.126417'),
(21, 'sessions', '0001_initial', '2024-04-11 02:54:20.650098');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_achat`
--
ALTER TABLE `api_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_achat_client_id_40a2e025_fk` (`client_id`),
  ADD KEY `API_achat_produit_id_c8252f85_fk` (`produit_id`);

--
-- Index pour la table `api_administrateur`
--
ALTER TABLE `api_administrateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `api_client`
--
ALTER TABLE `api_client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `api_fournisseur`
--
ALTER TABLE `api_fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `api_produit`
--
ALTER TABLE `api_produit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `API_produit_fournisseur_id_d417984a_fk` (`fournisseur_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `api_achat`
--
ALTER TABLE `api_achat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `api_administrateur`
--
ALTER TABLE `api_administrateur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `api_client`
--
ALTER TABLE `api_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `api_fournisseur`
--
ALTER TABLE `api_fournisseur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `api_produit`
--
ALTER TABLE `api_produit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_achat`
--
ALTER TABLE `api_achat`
  ADD CONSTRAINT `API_achat_client_id_40a2e025_fk` FOREIGN KEY (`client_id`) REFERENCES `api_client` (`id`),
  ADD CONSTRAINT `API_achat_produit_id_c8252f85_fk` FOREIGN KEY (`produit_id`) REFERENCES `api_produit` (`id`);

--
-- Contraintes pour la table `api_produit`
--
ALTER TABLE `api_produit`
  ADD CONSTRAINT `API_produit_fournisseur_id_d417984a_fk` FOREIGN KEY (`fournisseur_id`) REFERENCES `api_fournisseur` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
