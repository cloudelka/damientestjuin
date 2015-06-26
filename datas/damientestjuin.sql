-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 26 Juin 2015 à 13:23
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `damientestjuin`
--

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

CREATE TABLE IF NOT EXISTS `droit` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `lenom` varchar(45) DEFAULT NULL,
  `laperm` smallint(5) unsigned DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lenom_UNIQUE` (`lenom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `droit`
--

INSERT INTO `droit` (`id`, `lenom`, `laperm`) VALUES
(1, 'Administrateur', 0),
(2, 'Modérateur', 1),
(3, 'Utilisateur', 2);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lenom` varchar(50) DEFAULT NULL,
  `lextension` char(3) DEFAULT NULL,
  `lepoids` int(10) unsigned DEFAULT NULL,
  `lalargeur` int(10) unsigned DEFAULT NULL,
  `lahauteur` int(10) unsigned DEFAULT NULL,
  `letitre` varchar(60) DEFAULT NULL,
  `ladesc` varchar(500) DEFAULT NULL,
  `affiche` smallint(5) unsigned DEFAULT '2',
  `utilisateur_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lenom_UNIQUE` (`lenom`),
  KEY `fk_photo_utilisateur1_idx` (`utilisateur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

--
-- Contenu de la table `photo`
--

INSERT INTO `photo` (`id`, `lenom`, `lextension`, `lepoids`, `lalargeur`, `lahauteur`, `letitre`, `ladesc`, `affiche`, `utilisateur_id`) VALUES
(61, 'hq9mqdcrl1835gjjnbkdkpchp', 'jpg', 125167, 1920, 1080, 'PREMIER IMAGE', 'PREMIER IMAGE', 2, 1),
(62, 'rdena4h84pb8j3fnmi22fk0m9', 'jpg', 699378, 2560, 1600, '2eme image', '2eme image', 2, 1),
(63, 'q8qp5nifmefbjl2o6d5bkjefm', 'jpg', 1617042, 1920, 1080, '3eme image', '3eme image', 2, 1),
(64, '05c0c3qki07j3iq364621mm0l', 'jpg', 1310545, 1920, 1200, '4eme image', '4eme image', 2, 1),
(65, 'mg22ea12igki0kd3ae7mjg7gj', 'jpg', 1292553, 1920, 1200, '5eme image', '5eme image', 2, 1),
(66, '77anf2r4c0h8nd7lr91i8m4gr', 'jpg', 661362, 1920, 1200, '6eme image', '6eme image', 2, 1),
(67, 'ebk4pfqcfd2dpbaajh8obd6on', 'jpg', 793029, 1920, 1200, '7eme image', '7eme image', 2, 1),
(68, '3mckr3rpo76dp7i4n775p8la5', 'jpg', 1276108, 2560, 1440, '8eme image', '8eme image', 2, 1),
(69, '1f05o8d0ife76log4cmo6om3d', 'jpg', 1124636, 2560, 1440, '9eme image', '9eme image', 2, 1),
(70, '53qmip68rcigqi6mokhi8hpo0', 'jpg', 1080551, 2560, 1440, '10eme image', '10eme image', 2, 1),
(71, 'aj967obaopgb53dc3onp44k8g', 'jpg', 1277131, 2560, 1440, '11eme image', '11eme image', 2, 1),
(72, 'anoqrjob7kpd8bggfp7hmc4e1', 'jpg', 439474, 2560, 1600, '12eme image', '12eme image', 2, 1),
(73, 'qr5njnja47fcjh4q6cf585hkl', 'jpg', 3372602, 2560, 1600, '13eme image', '13eme image', 2, 1),
(74, 'pknb0dh939gk41fj19c10e83q', 'jpg', 372421, 1920, 1200, '14eme image', '14eme image', 2, 1),
(75, '9irgpfernf3411kf13db1455d', 'jpg', 1172054, 2560, 1440, '15eme image', '15eme image', 2, 1),
(76, 'ef46ri4q21k2dm8brdn1e1je6', 'jpg', 1855287, 2560, 1600, '16eme image', '16eme image', 2, 1),
(77, '89eq73od9152q41n1koq2ap8f', 'jpg', 1420776, 1920, 1200, '17eme image', '17eme image', 2, 1),
(78, 'rpd2e95pko7jlpplfc2jphfrm', 'jpg', 910202, 1920, 1200, '18eme image', '18eme image', 2, 1),
(79, 'ordkdcjo7bjmrrriomcrg1mil', 'jpg', 2178179, 1920, 1080, '19eme image', '19eme image', 2, 1),
(80, '8085fjheak6oc4dra5mfp261d', 'jpg', 1882699, 2560, 1600, '20eme image', '20eme image', 2, 1),
(81, 'fpmdomjjg8caqdj0ok5n7bfl2', 'jpg', 3737311, 2560, 1600, '21eme image', '21eme image', 2, 1),
(105, '20150626112213227c4ap3379a82akjkn8ng0rirk9ibh7lc7b', 'jpg', 720561, 1920, 1080, '22eme image', '22eme image', 2, 3),
(106, '20150626112245ggmi4je7p0qpfp6c1goec0e0hb1kcknj4m3g', 'jpg', 1696422, 1920, 1200, '23eme image', '23eme image', 2, 3),
(107, '20150626112304kglrng9fcb87g4rlqo2offo2l62600pmc0b7', 'jpg', 2630663, 1920, 1200, '24eme image', '24eme image', 2, 3),
(108, '201506261123140f5jeflejn34lkded9a6il0a972n8rm8m72b', 'jpg', 1643745, 1920, 1200, '25eme image', '25eme image', 2, 3),
(109, '20150626112331jljm00i134ijndajg72kog0dfpoejn57obam', 'jpg', 1639125, 1920, 1200, '26eme image', '26eme image', 2, 3),
(110, '201506261123540929dlqe0934r7iho18hcoahfm4h407dhid7', 'jpg', 2112887, 1920, 1200, '27eme image', '27eme image', 2, 3),
(111, '20150626112409lqf3qfh0m2jq5q0pri3o8f5frb4fgi3eh4bj', 'jpg', 511225, 1920, 1080, '28eme image', '28eme image', 2, 3),
(112, '20150626112423iq7g9r9h41qjqqoanijdl4a5jnpqp3fj2ece', 'jpg', 1222939, 1920, 1080, '29eme image', '29eme image', 2, 3),
(113, '20150626112458kp2idgqb2abqf7j8p6q6409rlkh26gmii118', 'jpg', 793910, 1920, 1080, '30eme image', '30eme image', 2, 3),
(114, '20150626112514k46r8drb0aj6qcg1h5m41lbc3p5jn9oak68n', 'jpg', 1604814, 1920, 1200, '31eme image', '31eme image', 2, 3),
(115, '201506261127067ilo0rdhll5kbcgo4fbicgqbalf5off2ae0r', 'jpg', 70287, 880, 587, '32eme image', '32eme image', 2, 3),
(116, '201506261127211c9kjr6d6qh3odjrjac8nq3cj2rr4pop84dk', 'jpg', 267364, 1280, 1024, '33eme image', '33eme image', 2, 3),
(117, '20150626112733l5oqpa8m0qmn8r1mnin96lbg14nf7j45kefl', 'jpg', 54556, 640, 395, '34eme image', '34eme image', 2, 3),
(118, '20150626112754ppkki6ih2mipp5h1bjdeo83afm3kab69ife9', 'jpg', 838268, 1920, 1080, '35eme image', '35eme image', 2, 3),
(119, '201506261128125jp6hib13fcirk4adk951a027f53qhq0mbq8', 'jpg', 1473615, 2560, 1600, '36eme image', '36eme image', 2, 3),
(120, '20150626112825gpj9lf9hlkgo761dcfjn7hj915apohaf9889', 'jpg', 1582851, 2560, 1600, '37eme image', '37eme image', 2, 3),
(121, '20150626112851a75qg0naoqr8koiminhldbrkji5ile6krraa', 'jpg', 320417, 1920, 1200, '38eme image', '38eme image', 2, 3),
(122, '20150626112907fq62og41j6q1ogrhd7qqpg2jf7i1ck5o638c', 'jpg', 1934892, 1680, 1050, '39eme image', '39eme image', 2, 3),
(123, '20150626112922jf9p5e0hb5ba229hj586h5556r45rcr1qa6h', 'jpg', 1869443, 2560, 1600, '40eme image', '40eme image', 2, 3),
(124, '201506261129359cgd2p1kma41i9j9d0h223qmi8q8g8m91gg7', 'jpg', 1201638, 1920, 1080, '41eme image', '41eme image', 2, 3),
(125, '2015062611294816gn2qrbd882ap0a7pbep1mk28q34gd2379c', 'jpg', 598348, 2560, 1600, '42eme image', '42eme image', 2, 3),
(126, '20150626113000keegc84bbjhgob2jlh9qae19b93kqcmp795o', 'jpg', 671592, 1920, 1080, '43eme image', '43eme image', 2, 3),
(127, '201506261131222eqq7cfbe3kj800ai4jcbao2laeg5oc2drjg', 'jpg', 779112, 2560, 1600, '44eme image', '44eme image', 2, 4),
(128, '2015062611313864aoqp66ga4hrdj4863cgdor9lgqpjkjci3c', 'jpg', 874445, 1920, 1200, '45eme image', '45eme image', 2, 4),
(129, '2015062611314797b18fd6alo4fi7c05bme08b11lfgcnacilk', 'jpg', 2582935, 1920, 1080, '46eme image', '46eme image', 2, 4),
(130, '20150626113157ahqdmom93ndmo9cbka7imj4fkdo0a8peg2lj', 'jpg', 1375880, 1920, 1080, '47eme image', '47eme image', 2, 4),
(131, '201506261132382gca1f9oadc3g0q6hjjr2iblc0m5eopqilir', 'jpg', 1292553, 1920, 1200, '48eme image', '48eme image', 2, 4),
(132, '20150626113249l2odicq60p6j1hkiig66rffc1cic48cd03jj', 'jpg', 1856784, 1920, 1080, '49eme image', '49eme image', 2, 4),
(133, '20150626113257irn0k7c5geh2n07flr5ql3n2hlrlcehfhcmk', 'jpg', 1271268, 1920, 1080, '50eme image', '50eme image', 2, 4),
(134, '20150626113309m0g42f4fndnirc942orpop5enr12rr4mfc17', 'jpg', 1313197, 1920, 1080, '51eme image', '51eme image', 2, 4),
(135, '20150626113326q6kl5dc2bo1pcaj55d4ebbhpa147m16ngbjn', 'jpg', 1522146, 1920, 1200, '52eme image', '52eme image', 2, 4),
(136, '20150626113335gagh8o9kgief65d1c0j153d72n6lblblp3pf', 'jpg', 3372602, 2560, 1600, '53eme image', '53eme image', 2, 4),
(137, '20150626113358joekb4kfd18052mg1p71plif7fk9epb186k6', 'jpg', 2096223, 1920, 1080, '54eme image', '54eme image', 2, 4),
(138, '20150626113713rf7krrm9li0m263na149g6l9napbo3bhl9gq', 'jpg', 105925, 800, 450, '55eme image', '55eme image', 2, 2),
(139, '20150626113725jb1fdn7gc5kgkg2c5o41633ngger3bl1r083', 'jpg', 145876, 800, 450, '56eme image', '56eme image', 2, 2),
(140, '2015062611374187hlie565j089jmmkaq9em39406g9ifdmhl0', 'jpg', 103915, 800, 450, '57eme image', '57eme image', 2, 2),
(141, '201506261138498o79pp7qg7g019e992o9e2dgkdbg5e6hgm47', 'jpg', 118488, 800, 450, '58eme image', '58eme image', 2, 2),
(142, '20150626113903ofcd45ldq845p1f7mqh8mrkkcjei0po1mpgp', 'jpg', 58539, 800, 450, '59eme image', '59eme image', 2, 2),
(143, '20150626113918j6cop289d8939djogq8lmedocagr7kd6909r', 'jpg', 189712, 800, 450, '60eme image', '60eme image', 2, 2),
(144, '201506261139317qlaoa1me871l5bbc6rf380rn56o9c30fm5o', 'jpg', 106293, 800, 450, '61eme image', '61eme image', 2, 2),
(145, '201506261139436abi39aojlaq0gmbph9lhn9j8h4q5bl2ape5', 'jpg', 71537, 800, 450, '62eme image', '62eme image', 2, 2),
(146, '201506261139533nbqcndn0j03l4bi2f8c83np8jiho89dgrek', 'jpg', 144868, 800, 450, '63eme image', '63eme image', 2, 2),
(147, '201506261140195d81mfcq1i1q1q7r0fjc1r1hm53fka8f9j4k', 'jpg', 62866, 800, 450, '64eme image', '64eme image', 2, 2),
(148, '201506261140331n64g48ocqo6k9n553ighh2d20f7l7gd0m2d', 'jpg', 65939, 800, 450, '65eme image', '65eme image', 2, 2),
(149, '20150626114045of64ef8iqic74j4qqcn4dr38jak3ejpcdf3a', 'jpg', 110281, 800, 450, '66eme image', '66eme image', 2, 2),
(150, '201506261140551q4h88a6d2r6fipd3gb3enjbhdla5075en2l', 'jpg', 101790, 800, 450, '67eme image', '67eme image', 2, 2),
(151, '20150626114104mq7amk30ada1cf8l746apo77004ebr51d6ip', 'jpg', 66772, 800, 450, '68eme image', '68eme image', 2, 2),
(152, '20150626114114op54crijk41m0nfnmqkb87cjrlh1n5p9acdo', 'jpg', 69942, 800, 450, '69eme image', '69eme image', 2, 2),
(153, '20150626114128dr0fibodie7m4k50q95edn8bci9n1nknnhf8', 'jpg', 59061, 800, 450, '70eme image', '70eme image', 2, 2),
(154, '20150626114139iih275m0ob9fcj8jedadi600e97p3lia62b1', 'jpg', 139146, 800, 450, '71eme image', '71eme image', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `photo_has_rubriques`
--

CREATE TABLE IF NOT EXISTS `photo_has_rubriques` (
  `photo_id` int(10) unsigned NOT NULL,
  `rubriques_id` int(10) unsigned NOT NULL,
  KEY `fk_photo_has_rubriques_rubriques1_idx` (`rubriques_id`),
  KEY `fk_photo_has_rubriques_photo1_idx` (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `photo_has_rubriques`
--

INSERT INTO `photo_has_rubriques` (`photo_id`, `rubriques_id`) VALUES
(61, 3),
(62, 1),
(63, 8),
(64, 5),
(65, 5),
(66, 5),
(67, 3),
(68, 3),
(69, 2),
(70, 9),
(71, 3),
(72, 4),
(73, 5),
(74, 7),
(75, 7),
(76, 4),
(77, 3),
(78, 6),
(79, 5),
(80, 8),
(81, 4),
(105, 3),
(106, 3),
(106, 5),
(107, 5),
(108, 5),
(109, 5),
(110, 7),
(110, 8),
(111, 4),
(112, 4),
(113, 5),
(113, 7),
(114, 3),
(114, 5),
(115, 1),
(116, 1),
(118, 4),
(119, 4),
(120, 4),
(121, 3),
(122, 4),
(123, 4),
(124, 3),
(124, 5),
(125, 1),
(126, 4),
(127, 1),
(127, 3),
(128, 7),
(128, 8),
(130, 5),
(129, 5),
(131, 3),
(131, 5),
(132, 5),
(133, 5),
(134, 5),
(135, 5),
(136, 5),
(137, 5),
(138, 1),
(140, 1),
(139, 1),
(142, 1),
(141, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(152, 1),
(151, 1),
(153, 1),
(154, 1);

-- --------------------------------------------------------

--
-- Structure de la table `rubriques`
--

CREATE TABLE IF NOT EXISTS `rubriques` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lintitule` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `rubriques`
--

INSERT INTO `rubriques` (`id`, `lintitule`) VALUES
(1, 'Animaux'),
(2, 'Architectures'),
(3, 'Artistiques'),
(4, 'Personnes'),
(5, 'Paysages'),
(6, 'Sports'),
(7, 'Technologies'),
(8, 'Transports'),
(9, 'Divers');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lelogin` varchar(100) DEFAULT NULL,
  `lepass` varchar(45) DEFAULT NULL,
  `lemail` varchar(150) DEFAULT NULL,
  `lenom` varchar(80) DEFAULT NULL,
  `valide` tinyint(3) unsigned DEFAULT '1',
  `droit_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lelogin_UNIQUE` (`lelogin`),
  KEY `fk_utilisateur_droit_idx` (`droit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `lelogin`, `lepass`, `lemail`, `lenom`, `valide`, `droit_id`) VALUES
(1, 'admin', 'admin', 'damien8651@gmail.com', 'Super Admin', 1, 1),
(2, 'modo', 'modo', 'modo@truc.be', 'MR le modo', 1, 2),
(3, 'util1', 'util1', 'util1@truc.be', 'utilisateur 1', 1, 3),
(4, 'util2', 'util2', 'util2@truc.be', 'utilisateur 2', 1, 3);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `photo_has_rubriques`
--
ALTER TABLE `photo_has_rubriques`
  ADD CONSTRAINT `fk_photo_has_rubriques_photo1` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_photo_has_rubriques_rubriques1` FOREIGN KEY (`rubriques_id`) REFERENCES `rubriques` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_droit` FOREIGN KEY (`droit_id`) REFERENCES `droit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
