-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-02-2016 a las 12:40:42
-- Versión del servidor: 5.6.28-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `AtlasCRM_development`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_menus`
--

CREATE TABLE IF NOT EXISTS `opcion_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOpcion` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `rutaDeAcceso` varchar(255) DEFAULT NULL,
  `idOpcionPadre` int(11) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `opcion_menus`
--

INSERT INTO `opcion_menus` (`id`, `idOpcion`, `descripcion`, `rutaDeAcceso`, `idOpcionPadre`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 10, 'Actualizar Maestros', '', 0, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 11, 'Seguridad', '/seguridad/index', 10, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 12, 'Cambiar plantillas', 'javascript:menu(1)', 10, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 13, 'Crear BD', 'javascript:menu(2)', 10, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 14, 'Mayorista', '', 0, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 15, 'Crear Transportistas', '', 14, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 16, 'Indicadores1', 'ejemplo01', 15, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 17, 'Indicadores2', 'ejemplo02', 15, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 18, 'Indicadores3', '', 15, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 19, 'Indicadores31', 'ejemplo03', 18, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_por_rols`
--

CREATE TABLE IF NOT EXISTS `opciones_por_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOpcion` int(11) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  `detalles` varchar(255) DEFAULT NULL,
  `puedeGrabar` tinyint(1) DEFAULT NULL,
  `puedeConsultar` tinyint(1) DEFAULT NULL,
  `puedeEliminar` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `opciones_por_rols`
--

INSERT INTO `opciones_por_rols` (`id`, `idOpcion`, `idRol`, `detalles`, `puedeGrabar`, `puedeConsultar`, `puedeEliminar`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'Administrador/Administrador', 1, 1, 1, '2015-09-03 11:27:33', '2015-09-03 11:27:33'),
(2, 11, 1, 'Administrador/Actualizar usuarios', 1, 1, 1, '2015-09-03 11:28:44', '2015-09-03 11:28:44'),
(3, 12, 1, 'Administrador/Cambiar plantillas', 1, 1, 1, '2015-09-03 11:30:01', '2015-09-03 11:30:01'),
(4, 13, 1, 'Administrador/Crear BD', 1, 1, 1, '2015-09-03 11:31:13', '2015-09-03 11:31:13'),
(5, 14, 2, 'Mayorista/Menu Mayorista', 1, 1, 1, '2015-09-03 11:32:15', '2015-09-03 11:32:15'),
(6, 15, 2, 'Mayorista/Crear Transportistas', 1, 1, 1, '2015-09-03 11:33:22', '2015-09-03 11:33:22'),
(7, 16, 2, 'Mayorista/Indicadores1', 1, 1, 1, '2015-09-03 11:34:04', '2015-09-03 11:34:04'),
(8, 17, 2, 'Mayorista/Indicadores2', 0, 1, 0, '2015-09-03 11:34:56', '2015-09-03 11:34:56'),
(9, 18, 2, 'Mayorista/Indicadores3', 0, 1, 0, '2015-09-03 11:35:23', '2015-09-03 11:35:23'),
(10, 19, 2, 'Mayorista/Indicadores4', 1, 1, 0, '2015-09-03 11:36:17', '2015-09-03 11:36:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE IF NOT EXISTS `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRol` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`id`, `idRol`, `descripcion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, '1', 'System Admin', 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '2', 'Enterprise Admin', 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20150805051704'),
('20150902204602'),
('20150902205155'),
('20150902205316'),
('20150902211422'),
('20150902211530'),
('20150902211602'),
('20150903040527'),
('20150903040628'),
('20150903045302'),
('20150903214254');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `contrasenha` varchar(255) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  `preguntaSecreta` varchar(255) DEFAULT NULL,
  `respuestaSecreta` varchar(255) DEFAULT NULL,
  `recordarSesion` varchar(255) DEFAULT NULL,
  `formatoFoto` varchar(255) DEFAULT NULL,
  `foto` blob,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `idUsuario`, `email`, `username`, `contrasenha`, `idRol`, `preguntaSecreta`, `respuestaSecreta`, `recordarSesion`, `formatoFoto`, `foto`, `created_at`, `updated_at`) VALUES
(1, 17784842, 'jaikerkings@hotmail.com', 'jaikerkings', '12345', 1, 'holahola', 'holahola', NULL, 'data:image/jpeg;base64,', 0xffd8ffe000104a46494600010101004800480000ffdb0043000201010101010201010102020202020403020202020504040304060506060605060606070908060709070606080b08090a0a0a0a0a06080b0c0b0a0c090a0a0affdb004301020202020202050303050a0706070a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0affc20011080028001e03011100021101031101ffc4001b00000104030000000000000000000000000702040508030609ffc4001a010002030101000000000000000000000003040002060507ffda000c0301000210031000000101ed999acf34c9aaa3ba18b5e59ff3dd1c23e103eeb84c852c4e2b40dde5809aae4742b35c8c42842951e18c63556ad4bb26520f75b57fffc4001e10000104020301000000000000000000000302040506010700081121ffda0008010100010502c19585c255aef6d03e85b3560e95678bf544d442b1d7a176bb2b14d87de67e9f5d399a4c3ecc7f3478d57dcd3346d3ea44dc8e0d58a0c0b463250368ebfd1a7cc0749373b5cf082a1eaa2a97addcba48f3ffc40020110002020202020300000000000000000001030002043105121121132351ffda0008010301013f018bc46b2bd846a18ad886098cb6741599d56595ad4306a71996bbac8b1d4e532abdbe3a9865dcd66f5312cc538753e258ddb726c7dc0c7507a305a630fb6588ab0cbdbf27ffc40020110001030500030100000000000000000003000102040513213111124122ffda0008010201013f018f1565f7191e026e7d56bbac6ae78e7d525c86d131f9777569c71ae83b2928f15783155bfaf158c1172b925f149d16b8a46f0da64424482fd7c4e4c3a8710ae47869f6a63f5447fc296d0c4f2eafffc4003110000103020305030d00000000000000000102031100040513210612143141102251152324334252627172818291a1ffda0008010100063f023af5ae2f66b0c4299d61c75c89f9526c369ac3254bf56b0642ab9d168752455a30fa195323cdbba6a15ca3f94d5edc5bb41b6ddcc4047b9133d8bd3da3430ec4d39414f971a5dd2203829ae1d95aad9a194e3c84f77b05f3ccf1f77339f72344fd29e957f8ce1ad5b662374b7c4237849501a0f1ab57729a5a1cb64a8437095029f0a17968d3987b84f7f848dd57e2741f6ad3a48356b87373e9388a663e104d606b5f3f25b23f4902a06b5fffc40020100002020202030101000000000000000001110021315141816171b191f0ffda0008010100013f2158165f616b4802534c350aedd02ca1c5410d9a500c96d2073fa99725041e0971174f40890cd7e54d4999ea5cfdc3c025a6d2d33f73cc0338f7e8f5598469d4341c397e747b167cc15e8d641703cabb834a16e122c60016fb8e270057407f04a2b30da20a9c738b4883748121ff0025460db9027fffda000c03010002000300000010f685151bdf71d6bfffc40020110100020202010500000000000000000001001121513161714181a1b1c1ffda0008010301013f10a1650cc476eab85a82f10ad280e7be23c1e4f8267c4c012eeeacee538736f99c25d8ab43f58a4d6d46ecfaaf70d961dccafbcce744f28bf729749fffc4002111010002000602030000000000000000000100112131415171a161c191b1d1ffda0008010201013f1018218a392d8fc12a10694d600258ae4af501c6196ab5ed18d09448ed08c3c3884e6392f78c84b65c1ed8c422eee66d6f08276bf628be1ea762151c1f4422f04fffc4001f100101000301010002030000000000000001110021314181516171a1f0ffda0008010100013f10d7a8f7e6197b732529a952315df7372e70465a4829b0f639674348dfc630836c48aa7cfb81788d67cf6341619af5c194db83551bad82160947097bfc171936c0799461e14500594a5576bb7adb1aee94752c85e414a705de0252adc0fe302bf751b293be718ee8730db84b9e249a28e43f030e4024e076f04dfecf71f84dd1d1b502cd8f747a5c71127558fa47ee5ef3277712cf2a7f580c03cc7517e1cd7188a7651ff7dcffd9, '2015-09-03 17:19:03', '2015-09-03 17:19:03');
--
-- Base de datos: `glpi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_alerts`
--

CREATE TABLE IF NOT EXISTS `glpi_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php ALERT_* constant',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_authldapreplicates`
--

CREATE TABLE IF NOT EXISTS `glpi_authldapreplicates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authldaps_id` int(11) NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '389',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authldaps_id` (`authldaps_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_authldaps`
--

CREATE TABLE IF NOT EXISTS `glpi_authldaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basedn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rootdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '389',
  `condition` text COLLATE utf8_unicode_ci,
  `login_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'uid',
  `use_tls` tinyint(1) NOT NULL DEFAULT '0',
  `group_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_condition` text COLLATE utf8_unicode_ci,
  `group_search_type` int(11) NOT NULL DEFAULT '0',
  `group_member_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email1_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_dn` tinyint(1) NOT NULL DEFAULT '1',
  `time_offset` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds',
  `deref_option` int(11) NOT NULL DEFAULT '0',
  `title_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_condition` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rootdn_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_number_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email2_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email3_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email4_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagesize` int(11) NOT NULL DEFAULT '0',
  `ldap_maxlimit` int(11) NOT NULL DEFAULT '0',
  `can_support_pagesize` tinyint(1) NOT NULL DEFAULT '0',
  `picture_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_default` (`is_default`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_authmails`
--

CREATE TABLE IF NOT EXISTS `glpi_authmails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connect_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_autoupdatesystems`
--

CREATE TABLE IF NOT EXISTS `glpi_autoupdatesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_blacklistedmailcontents`
--

CREATE TABLE IF NOT EXISTS `glpi_blacklistedmailcontents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_blacklists`
--

CREATE TABLE IF NOT EXISTS `glpi_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `glpi_blacklists`
--

INSERT INTO `glpi_blacklists` (`id`, `type`, `name`, `value`, `comment`) VALUES
(1, 1, 'empty IP', '', NULL),
(2, 1, 'localhost', '127.0.0.1', NULL),
(3, 1, 'zero IP', '0.0.0.0', NULL),
(4, 2, 'empty MAC', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_bookmarks`
--

CREATE TABLE IF NOT EXISTS `glpi_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php BOOKMARK_* constant',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `is_private` (`is_private`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_bookmarks_users`
--

CREATE TABLE IF NOT EXISTS `glpi_bookmarks_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bookmarks_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  KEY `bookmarks_id` (`bookmarks_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_budgets`
--

CREATE TABLE IF NOT EXISTS `glpi_budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `begin_date` (`begin_date`),
  KEY `is_template` (`is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `end_date` (`end_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_calendars`
--

CREATE TABLE IF NOT EXISTS `glpi_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `cache_duration` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_calendars`
--

INSERT INTO `glpi_calendars` (`id`, `name`, `entities_id`, `is_recursive`, `comment`, `date_mod`, `cache_duration`) VALUES
(1, 'Default', 0, 1, 'Default calendar', NULL, '[0,43200,43200,43200,43200,43200,0]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_calendars_holidays`
--

CREATE TABLE IF NOT EXISTS `glpi_calendars_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `holidays_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  KEY `holidays_id` (`holidays_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_calendarsegments`
--

CREATE TABLE IF NOT EXISTS `glpi_calendarsegments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `day` (`day`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `glpi_calendarsegments`
--

INSERT INTO `glpi_calendarsegments` (`id`, `calendars_id`, `entities_id`, `is_recursive`, `day`, `begin`, `end`) VALUES
(1, 1, 0, 0, 1, '08:00:00', '20:00:00'),
(2, 1, 0, 0, 2, '08:00:00', '20:00:00'),
(3, 1, 0, 0, 3, '08:00:00', '20:00:00'),
(4, 1, 0, 0, 4, '08:00:00', '20:00:00'),
(5, 1, 0, 0, 5, '08:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_cartridgeitems`
--

CREATE TABLE IF NOT EXISTS `glpi_cartridgeitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `cartridgeitemtypes_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `alarm_threshold` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_cartridgeitems_printermodels`
--

CREATE TABLE IF NOT EXISTS `glpi_cartridgeitems_printermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartridgeitems_id` int(11) NOT NULL DEFAULT '0',
  `printermodels_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_cartridgeitemtypes`
--

CREATE TABLE IF NOT EXISTS `glpi_cartridgeitemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_cartridges`
--

CREATE TABLE IF NOT EXISTS `glpi_cartridges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `cartridgeitems_id` int(11) NOT NULL DEFAULT '0',
  `printers_id` int(11) NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`),
  KEY `printers_id` (`printers_id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changecosts`
--

CREATE TABLE IF NOT EXISTS `glpi_changecosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `changes_id` (`changes_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes`
--

CREATE TABLE IF NOT EXISTS `glpi_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `content` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8_unicode_ci,
  `controlistcontent` longtext COLLATE utf8_unicode_ci,
  `rolloutplancontent` longtext COLLATE utf8_unicode_ci,
  `backoutplancontent` longtext COLLATE utf8_unicode_ci,
  `checklistcontent` longtext COLLATE utf8_unicode_ci,
  `global_validation` int(11) NOT NULL DEFAULT '1',
  `validation_percent` int(11) NOT NULL DEFAULT '0',
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `solution` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin_waiting_date` datetime DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `due_date` (`due_date`),
  KEY `global_validation` (`global_validation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_groups`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_items`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_problems`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `problems_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  KEY `problems_id` (`problems_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_projects`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`projects_id`),
  KEY `projects_id` (`projects_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_suppliers`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changes_users`
--

CREATE TABLE IF NOT EXISTS `glpi_changes_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changetasks`
--

CREATE TABLE IF NOT EXISTS `glpi_changetasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `changes_id` (`changes_id`),
  KEY `state` (`state`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `taskcategories_id` (`taskcategories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_changevalidations`
--

CREATE TABLE IF NOT EXISTS `glpi_changevalidations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `users_id_validate` int(11) NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8_unicode_ci,
  `comment_validation` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '2',
  `submission_date` datetime DEFAULT NULL,
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `changes_id` (`changes_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computerdisks`
--

CREATE TABLE IF NOT EXISTS `glpi_computerdisks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mountpoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesystems_id` int(11) NOT NULL DEFAULT '0',
  `totalsize` int(11) NOT NULL DEFAULT '0',
  `freesize` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `device` (`device`),
  KEY `mountpoint` (`mountpoint`),
  KEY `totalsize` (`totalsize`),
  KEY `freesize` (`freesize`),
  KEY `computers_id` (`computers_id`),
  KEY `filesystems_id` (`filesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computermodels`
--

CREATE TABLE IF NOT EXISTS `glpi_computermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computers`
--

CREATE TABLE IF NOT EXISTS `glpi_computers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `operatingsystems_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemversions_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemservicepacks_id` int(11) NOT NULL DEFAULT '0',
  `os_license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_licenseid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autoupdatesystems_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `computermodels_id` int(11) NOT NULL DEFAULT '0',
  `computertypes_id` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `computermodels_id` (`computermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `computertypes_id` (`computertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_computers`
--

INSERT INTO `glpi_computers` (`id`, `entities_id`, `name`, `serial`, `otherserial`, `contact`, `contact_num`, `users_id_tech`, `groups_id_tech`, `comment`, `date_mod`, `operatingsystems_id`, `operatingsystemversions_id`, `operatingsystemservicepacks_id`, `os_license_number`, `os_licenseid`, `autoupdatesystems_id`, `locations_id`, `domains_id`, `networks_id`, `computermodels_id`, `computertypes_id`, `is_template`, `template_name`, `manufacturers_id`, `is_deleted`, `is_dynamic`, `users_id`, `groups_id`, `states_id`, `ticket_tco`, `uuid`) VALUES
(1, 0, 'zzzzzzzzz', '', '', 'a1', 'aaa111', 4, 1, '', '2015-11-01 22:41:06', 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 4, 1, 0, 0.0000, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computers_items`
--

CREATE TABLE IF NOT EXISTS `glpi_computers_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computers_softwarelicenses`
--

CREATE TABLE IF NOT EXISTS `glpi_computers_softwarelicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `softwarelicenses_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`computers_id`,`softwarelicenses_id`),
  KEY `computers_id` (`computers_id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computers_softwareversions`
--

CREATE TABLE IF NOT EXISTS `glpi_computers_softwareversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `softwareversions_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted_computer` tinyint(1) NOT NULL DEFAULT '0',
  `is_template_computer` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`computers_id`,`softwareversions_id`),
  KEY `softwareversions_id` (`softwareversions_id`),
  KEY `computers_info` (`entities_id`,`is_template_computer`,`is_deleted_computer`),
  KEY `is_template` (`is_template_computer`),
  KEY `is_deleted` (`is_deleted_computer`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computertypes`
--

CREATE TABLE IF NOT EXISTS `glpi_computertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_computervirtualmachines`
--

CREATE TABLE IF NOT EXISTS `glpi_computervirtualmachines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `virtualmachinestates_id` int(11) NOT NULL DEFAULT '0',
  `virtualmachinesystems_id` int(11) NOT NULL DEFAULT '0',
  `virtualmachinetypes_id` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vcpu` int(11) NOT NULL DEFAULT '0',
  `ram` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  KEY `vcpu` (`vcpu`),
  KEY `ram` (`ram`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `uuid` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_configs`
--

CREATE TABLE IF NOT EXISTS `glpi_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`context`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=155 ;

--
-- Volcado de datos para la tabla `glpi_configs`
--

INSERT INTO `glpi_configs` (`id`, `context`, `name`, `value`) VALUES
(1, 'core', 'version', '0.85.4'),
(2, 'core', 'show_jobs_at_login', '0'),
(3, 'core', 'cut', '250'),
(4, 'core', 'list_limit', '15'),
(5, 'core', 'list_limit_max', '50'),
(6, 'core', 'url_maxlength', '30'),
(7, 'core', 'event_loglevel', '5'),
(8, 'core', 'use_mailing', '0'),
(9, 'core', 'admin_email', 'admsys@localhost'),
(10, 'core', 'admin_email_name', ''),
(11, 'core', 'admin_reply', ''),
(12, 'core', 'admin_reply_name', ''),
(13, 'core', 'mailing_signature', 'SIGNATURE'),
(14, 'core', 'use_anonymous_helpdesk', '0'),
(15, 'core', 'use_anonymous_followups', '0'),
(16, 'core', 'language', 'es_VE'),
(17, 'core', 'priority_1', '#fff2f2'),
(18, 'core', 'priority_2', '#ffe0e0'),
(19, 'core', 'priority_3', '#ffcece'),
(20, 'core', 'priority_4', '#ffbfbf'),
(21, 'core', 'priority_5', '#ffadad'),
(22, 'core', 'priority_6', '#ff5555'),
(23, 'core', 'date_tax', '2005-12-31'),
(24, 'core', 'cas_host', ''),
(25, 'core', 'cas_port', '443'),
(26, 'core', 'cas_uri', ''),
(27, 'core', 'cas_logout', ''),
(28, 'core', 'existing_auth_server_field_clean_domain', '0'),
(29, 'core', 'planning_begin', '08:00:00'),
(30, 'core', 'planning_end', '20:00:00'),
(31, 'core', 'utf8_conv', '1'),
(32, 'core', 'use_public_faq', '0'),
(33, 'core', 'url_base', 'http://localhost/glpi'),
(34, 'core', 'show_link_in_mail', '0'),
(35, 'core', 'text_login', ''),
(36, 'core', 'founded_new_version', ''),
(37, 'core', 'dropdown_max', '100'),
(38, 'core', 'ajax_wildcard', '*'),
(151, 'core', 'use_rich_text', '0'),
(150, 'core', 'maintenance_text', ''),
(149, 'core', 'maintenance_mode', '0'),
(42, 'core', 'ajax_limit_count', '50'),
(43, 'core', 'use_ajax_autocompletion', '1'),
(44, 'core', 'is_users_auto_add', '1'),
(45, 'core', 'date_format', '0'),
(46, 'core', 'number_format', '0'),
(47, 'core', 'csv_delimiter', ';'),
(48, 'core', 'is_ids_visible', '0'),
(49, 'core', 'dropdown_chars_limit', '50'),
(50, 'core', 'smtp_mode', '0'),
(51, 'core', 'smtp_host', ''),
(52, 'core', 'smtp_port', '25'),
(53, 'core', 'smtp_username', ''),
(54, 'core', 'proxy_name', ''),
(55, 'core', 'proxy_port', '8080'),
(56, 'core', 'proxy_user', ''),
(57, 'core', 'add_followup_on_update_ticket', '1'),
(58, 'core', 'keep_tickets_on_delete', '0'),
(59, 'core', 'time_step', '5'),
(60, 'core', 'decimal_number', '2'),
(61, 'core', 'helpdesk_doc_url', ''),
(62, 'core', 'central_doc_url', ''),
(63, 'core', 'documentcategories_id_forticket', '0'),
(64, 'core', 'monitors_management_restrict', '2'),
(65, 'core', 'phones_management_restrict', '2'),
(66, 'core', 'peripherals_management_restrict', '2'),
(67, 'core', 'printers_management_restrict', '2'),
(68, 'core', 'use_log_in_files', '1'),
(69, 'core', 'time_offset', '0'),
(70, 'core', 'is_contact_autoupdate', '1'),
(71, 'core', 'is_user_autoupdate', '1'),
(72, 'core', 'is_group_autoupdate', '1'),
(73, 'core', 'is_location_autoupdate', '1'),
(74, 'core', 'state_autoupdate_mode', '0'),
(75, 'core', 'is_contact_autoclean', '0'),
(76, 'core', 'is_user_autoclean', '0'),
(77, 'core', 'is_group_autoclean', '0'),
(78, 'core', 'is_location_autoclean', '0'),
(79, 'core', 'state_autoclean_mode', '0'),
(80, 'core', 'use_flat_dropdowntree', '0'),
(81, 'core', 'use_autoname_by_entity', '1'),
(148, 'core', 'keep_devices_when_purging_item', '0'),
(147, 'core', 'pdffont', 'helvetica'),
(84, 'core', 'softwarecategories_id_ondelete', '1'),
(85, 'core', 'x509_email_field', ''),
(86, 'core', 'x509_cn_restrict', ''),
(87, 'core', 'x509_o_restrict', ''),
(88, 'core', 'x509_ou_restrict', ''),
(89, 'core', 'default_mailcollector_filesize_max', '2097152'),
(90, 'core', 'followup_private', '0'),
(91, 'core', 'task_private', '0'),
(92, 'core', 'default_software_helpdesk_visible', '1'),
(93, 'core', 'names_format', '0'),
(94, 'core', 'default_graphtype', 'svg'),
(95, 'core', 'default_requesttypes_id', '1'),
(96, 'core', 'use_noright_users_add', '1'),
(97, 'core', 'cron_limit', '5'),
(98, 'core', 'priority_matrix', '{"1":{"1":1,"2":1,"3":2,"4":2,"5":2},"2":{"1":1,"2":2,"3":2,"4":3,"5":3},"3":{"1":2,"2":2,"3":3,"4":4,"5":4},"4":{"1":2,"2":3,"3":4,"4":4,"5":5},"5":{"1":2,"2":3,"3":4,"4":5,"5":5}}'),
(99, 'core', 'urgency_mask', '62'),
(100, 'core', 'impact_mask', '62'),
(101, 'core', 'user_deleted_ldap', '0'),
(102, 'core', 'auto_create_infocoms', '0'),
(103, 'core', 'use_slave_for_search', '0'),
(104, 'core', 'proxy_passwd', ''),
(105, 'core', 'smtp_passwd', ''),
(106, 'core', 'transfers_id_auto', '0'),
(107, 'core', 'show_count_on_tabs', '1'),
(108, 'core', 'refresh_ticket_list', '0'),
(109, 'core', 'set_default_tech', '1'),
(110, 'core', 'allow_search_view', '2'),
(111, 'core', 'allow_search_all', '1'),
(112, 'core', 'allow_search_global', '1'),
(113, 'core', 'display_count_on_home', '5'),
(114, 'core', 'use_password_security', '0'),
(115, 'core', 'password_min_length', '8'),
(116, 'core', 'password_need_number', '1'),
(117, 'core', 'password_need_letter', '1'),
(118, 'core', 'password_need_caps', '1'),
(119, 'core', 'password_need_symbol', '1'),
(120, 'core', 'use_check_pref', '0'),
(121, 'core', 'notification_to_myself', '1'),
(122, 'core', 'duedateok_color', '#06ff00'),
(123, 'core', 'duedatewarning_color', '#ffb800'),
(124, 'core', 'duedatecritical_color', '#ff0000'),
(125, 'core', 'duedatewarning_less', '20'),
(126, 'core', 'duedatecritical_less', '5'),
(127, 'core', 'duedatewarning_unit', '%'),
(128, 'core', 'duedatecritical_unit', '%'),
(129, 'core', 'realname_ssofield', ''),
(130, 'core', 'firstname_ssofield', ''),
(131, 'core', 'email1_ssofield', ''),
(132, 'core', 'email2_ssofield', ''),
(133, 'core', 'email3_ssofield', ''),
(134, 'core', 'email4_ssofield', ''),
(135, 'core', 'phone_ssofield', ''),
(136, 'core', 'phone2_ssofield', ''),
(137, 'core', 'mobile_ssofield', ''),
(138, 'core', 'comment_ssofield', ''),
(139, 'core', 'title_ssofield', ''),
(140, 'core', 'category_ssofield', ''),
(141, 'core', 'language_ssofield', ''),
(142, 'core', 'entity_ssofield', ''),
(143, 'core', 'registration_number_ssofield', ''),
(144, 'core', 'ssovariables_id', '0'),
(145, 'core', 'translate_kb', '0'),
(146, 'core', 'translate_dropdowns', '0'),
(152, 'core', 'attach_ticket_documents_to_mail', '0'),
(153, 'core', 'backcreated', '0'),
(154, 'core', 'task_state', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_consumableitems`
--

CREATE TABLE IF NOT EXISTS `glpi_consumableitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `consumableitemtypes_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `alarm_threshold` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_consumableitemtypes`
--

CREATE TABLE IF NOT EXISTS `glpi_consumableitemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_consumables`
--

CREATE TABLE IF NOT EXISTS `glpi_consumables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `consumableitems_id` int(11) NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_in` (`date_in`),
  KEY `date_out` (`date_out`),
  KEY `consumableitems_id` (`consumableitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contacts`
--

CREATE TABLE IF NOT EXISTS `glpi_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacttypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `usertitles_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `contacttypes_id` (`contacttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `usertitles_id` (`usertitles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contacts_suppliers`
--

CREATE TABLE IF NOT EXISTS `glpi_contacts_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `contacts_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contacttypes`
--

CREATE TABLE IF NOT EXISTS `glpi_contacttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contractcosts`
--

CREATE TABLE IF NOT EXISTS `glpi_contractcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `contracts_id` (`contracts_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contracts`
--

CREATE TABLE IF NOT EXISTS `glpi_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contracttypes_id` int(11) NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `notice` int(11) NOT NULL DEFAULT '0',
  `periodicity` int(11) NOT NULL DEFAULT '0',
  `billing` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `accounting_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint(1) NOT NULL DEFAULT '0',
  `monday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `monday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_monday` tinyint(1) NOT NULL DEFAULT '0',
  `max_links_allowed` int(11) NOT NULL DEFAULT '0',
  `alert` int(11) NOT NULL DEFAULT '0',
  `renewal` int(11) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin_date` (`begin_date`),
  KEY `name` (`name`),
  KEY `contracttypes_id` (`contracttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `use_monday` (`use_monday`),
  KEY `use_saturday` (`use_saturday`),
  KEY `alert` (`alert`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contracts_items`
--

CREATE TABLE IF NOT EXISTS `glpi_contracts_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  KEY `FK_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contracts_suppliers`
--

CREATE TABLE IF NOT EXISTS `glpi_contracts_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_contracttypes`
--

CREATE TABLE IF NOT EXISTS `glpi_contracttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_crontasklogs`
--

CREATE TABLE IF NOT EXISTS `glpi_crontasklogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crontasks_id` int(11) NOT NULL,
  `crontasklogs_id` int(11) NOT NULL COMMENT 'id of ''start'' event',
  `date` datetime NOT NULL,
  `state` int(11) NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int(11) NOT NULL COMMENT 'for statistics',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'message',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `crontasks_id` (`crontasks_id`),
  KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `glpi_crontasklogs`
--

INSERT INTO `glpi_crontasklogs` (`id`, `crontasks_id`, `crontasklogs_id`, `date`, `state`, `elapsed`, `volume`, `content`) VALUES
(1, 18, 0, '2015-11-01 22:19:13', 0, 0, 0, 'Run mode: GLPI'),
(2, 18, 1, '2015-11-01 22:19:13', 2, 0.141282, 0, 'Action completed, no processing required'),
(3, 19, 0, '2015-11-01 22:25:42', 0, 0, 0, 'Run mode: GLPI'),
(4, 19, 3, '2015-11-01 22:25:42', 2, 0.0092659, 0, 'Action completed, fully processed'),
(5, 20, 0, '2015-11-01 22:31:33', 0, 0, 0, 'Run mode: GLPI'),
(6, 20, 5, '2015-11-01 22:31:33', 2, 0.00930119, 0, 'Action completed, no processing required'),
(7, 21, 0, '2015-11-01 22:41:08', 0, 0, 0, 'Run mode: GLPI'),
(8, 21, 7, '2015-11-01 22:41:08', 2, 0.00715113, 0, 'Action completed, no processing required'),
(9, 22, 0, '2015-11-01 22:58:05', 0, 0, 0, 'Run mode: GLPI'),
(10, 22, 9, '2015-11-01 22:58:05', 2, 0.0118029, 0, 'Action completed, no processing required'),
(11, 23, 0, '2015-11-01 23:15:00', 0, 0, 0, 'Run mode: GLPI'),
(12, 23, 11, '2015-11-01 23:15:00', 2, 0.0100691, 0, 'Action completed, no processing required'),
(13, 24, 0, '2015-11-01 23:28:02', 0, 0, 0, 'Run mode: GLPI'),
(14, 24, 13, '2015-11-01 23:28:02', 1, 0.00721884, 1, 'Clean 1 temporary file created since more than 3600 seconds\n'),
(15, 24, 13, '2015-11-01 23:28:02', 2, 0.00996494, 1, 'Action completed, fully processed'),
(16, 25, 0, '2015-11-01 23:38:53', 0, 0, 0, 'Run mode: GLPI'),
(17, 25, 16, '2015-11-01 23:38:53', 2, 0.00773096, 0, 'Action completed, no processing required'),
(18, 5, 0, '2015-11-01 23:51:29', 0, 0, 0, 'Run mode: GLPI'),
(19, 5, 18, '2015-11-01 23:51:29', 2, 0.00800395, 0, 'Action completed, no processing required'),
(20, 6, 0, '2015-11-01 23:59:11', 0, 0, 0, 'Run mode: GLPI'),
(21, 6, 20, '2015-11-01 23:59:11', 2, 0.00665307, 0, 'Action completed, no processing required'),
(22, 8, 0, '2015-11-02 00:00:40', 0, 0, 0, 'Run mode: GLPI'),
(23, 8, 22, '2015-11-02 00:00:40', 2, 0.498566, 237, 'Action completed, fully processed'),
(24, 9, 0, '2015-11-08 21:01:18', 0, 0, 0, 'Run mode: GLPI'),
(25, 9, 24, '2015-11-08 21:01:18', 2, 0.156411, 0, 'Action completed, no processing required'),
(26, 12, 0, '2015-11-08 21:09:39', 0, 0, 0, 'Run mode: GLPI'),
(27, 12, 26, '2015-11-08 21:09:39', 1, 0.103955, 3, 'Clean 3 session files created since more than 1440 seconds\n'),
(28, 12, 26, '2015-11-08 21:09:39', 2, 0.107475, 3, 'Action completed, fully processed'),
(29, 13, 0, '2015-11-08 23:05:43', 0, 0, 0, 'Run mode: GLPI'),
(30, 13, 29, '2015-11-08 23:05:43', 1, 0.288562, 1, 'Clean 1 graph file created since more than 3600 seconds\n'),
(31, 13, 29, '2015-11-08 23:05:43', 2, 0.300167, 1, 'Action completed, fully processed');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_crontasks`
--

CREATE TABLE IF NOT EXISTS `glpi_crontasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'task name',
  `frequency` int(11) NOT NULL COMMENT 'second between launch',
  `param` int(11) DEFAULT NULL COMMENT 'task specify parameter',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int(11) NOT NULL DEFAULT '1' COMMENT '1:internal, 2:external',
  `allowmode` int(11) NOT NULL DEFAULT '3' COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int(11) NOT NULL DEFAULT '0',
  `hourmax` int(11) NOT NULL DEFAULT '24',
  `logs_lifetime` int(11) NOT NULL DEFAULT '30' COMMENT 'number of days',
  `lastrun` datetime DEFAULT NULL COMMENT 'last run date',
  `lastcode` int(11) DEFAULT NULL COMMENT 'last run return code',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`name`),
  KEY `mode` (`mode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Task run by internal / external cron.' AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `glpi_crontasks`
--

INSERT INTO `glpi_crontasks` (`id`, `itemtype`, `name`, `frequency`, `param`, `state`, `mode`, `allowmode`, `hourmin`, `hourmax`, `logs_lifetime`, `lastrun`, `lastcode`, `comment`) VALUES
(2, 'CartridgeItem', 'cartridge', 86400, 10, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL),
(3, 'ConsumableItem', 'consumable', 86400, 10, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL),
(4, 'SoftwareLicense', 'software', 86400, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL),
(5, 'Contract', 'contract', 86400, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 23:51:00', NULL, NULL),
(6, 'InfoCom', 'infocom', 86400, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 23:59:00', NULL, NULL),
(7, 'CronTask', 'logs', 86400, 30, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL),
(8, 'CronTask', 'optimize', 604800, NULL, 1, 1, 3, 0, 24, 30, '2015-11-02 00:00:00', NULL, NULL),
(9, 'MailCollector', 'mailgate', 600, 10, 1, 1, 3, 0, 24, 30, '2015-11-08 21:01:00', NULL, NULL),
(10, 'DBconnection', 'checkdbreplicate', 300, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL),
(11, 'CronTask', 'checkupdate', 604800, NULL, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL),
(12, 'CronTask', 'session', 86400, NULL, 1, 1, 3, 0, 24, 30, '2015-11-08 21:09:00', NULL, NULL),
(13, 'CronTask', 'graph', 3600, NULL, 1, 1, 3, 0, 24, 30, '2015-11-08 23:05:00', NULL, NULL),
(14, 'ReservationItem', 'reservation', 3600, NULL, 1, 1, 3, 0, 24, 30, '2012-04-05 20:31:57', NULL, NULL),
(15, 'Ticket', 'closeticket', 43200, NULL, 1, 1, 3, 0, 24, 30, '2014-01-15 14:35:00', NULL, NULL),
(16, 'Ticket', 'alertnotclosed', 43200, NULL, 1, 1, 3, 0, 24, 30, '2014-04-16 15:32:00', NULL, NULL),
(17, 'SlaLevel_Ticket', 'slaticket', 300, NULL, 1, 1, 3, 0, 24, 30, '2014-06-18 08:02:00', NULL, NULL),
(18, 'Ticket', 'createinquest', 86400, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 22:19:00', NULL, NULL),
(19, 'Crontask', 'watcher', 86400, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 22:25:00', NULL, NULL),
(20, 'TicketRecurrent', 'ticketrecurrent', 3600, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 22:31:00', NULL, NULL),
(21, 'PlanningRecall', 'planningrecall', 300, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 22:41:00', NULL, NULL),
(22, 'QueuedMail', 'queuedmail', 60, 50, 1, 1, 3, 0, 24, 30, '2015-11-01 22:58:00', NULL, NULL),
(23, 'QueuedMail', 'queuedmailclean', 86400, 30, 1, 1, 3, 0, 24, 30, '2015-11-01 23:15:00', NULL, NULL),
(24, 'Crontask', 'temp', 3600, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 23:28:00', NULL, NULL),
(25, 'MailCollector', 'mailgateerror', 86400, NULL, 1, 1, 3, 0, 24, 30, '2015-11-01 23:38:00', NULL, NULL),
(26, 'Crontask', 'circularlogs', 86400, 4, 0, 1, 3, 0, 24, 30, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicecases`
--

CREATE TABLE IF NOT EXISTS `glpi_devicecases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecasetypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecasetypes_id` (`devicecasetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicecasetypes`
--

CREATE TABLE IF NOT EXISTS `glpi_devicecasetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicecontrols`
--

CREATE TABLE IF NOT EXISTS `glpi_devicecontrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_raid` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicedrives`
--

CREATE TABLE IF NOT EXISTS `glpi_devicedrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_writer` tinyint(1) NOT NULL DEFAULT '1',
  `speed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicegraphiccards`
--

CREATE TABLE IF NOT EXISTS `glpi_devicegraphiccards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `memory_default` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `chipset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `chipset` (`chipset`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_deviceharddrives`
--

CREATE TABLE IF NOT EXISTS `glpi_deviceharddrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `cache` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `capacity_default` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicememories`
--

CREATE TABLE IF NOT EXISTS `glpi_devicememories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `size_default` int(11) NOT NULL DEFAULT '0',
  `devicememorytypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicememorytypes_id` (`devicememorytypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicememorytypes`
--

CREATE TABLE IF NOT EXISTS `glpi_devicememorytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `glpi_devicememorytypes`
--

INSERT INTO `glpi_devicememorytypes` (`id`, `name`, `comment`) VALUES
(1, 'EDO', NULL),
(2, 'DDR', NULL),
(3, 'SDRAM', NULL),
(4, 'SDRAM-2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicemotherboards`
--

CREATE TABLE IF NOT EXISTS `glpi_devicemotherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chipset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicenetworkcards`
--

CREATE TABLE IF NOT EXISTS `glpi_devicenetworkcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `mac_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicepcis`
--

CREATE TABLE IF NOT EXISTS `glpi_devicepcis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicepowersupplies`
--

CREATE TABLE IF NOT EXISTS `glpi_devicepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `power` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_atx` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_deviceprocessors`
--

CREATE TABLE IF NOT EXISTS `glpi_deviceprocessors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `frequency_default` int(11) NOT NULL DEFAULT '0',
  `nbcores_default` int(11) DEFAULT NULL,
  `nbthreads_default` int(11) DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_devicesoundcards`
--

CREATE TABLE IF NOT EXISTS `glpi_devicesoundcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_displaypreferences`
--

CREATE TABLE IF NOT EXISTS `glpi_displaypreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  KEY `rank` (`rank`),
  KEY `num` (`num`),
  KEY `itemtype` (`itemtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=255 ;

--
-- Volcado de datos para la tabla `glpi_displaypreferences`
--

INSERT INTO `glpi_displaypreferences` (`id`, `itemtype`, `num`, `rank`, `users_id`) VALUES
(32, 'Computer', 4, 4, 0),
(34, 'Computer', 45, 6, 0),
(33, 'Computer', 40, 5, 0),
(31, 'Computer', 5, 3, 0),
(30, 'Computer', 23, 2, 0),
(86, 'DocumentType', 3, 1, 0),
(49, 'Monitor', 31, 1, 0),
(50, 'Monitor', 23, 2, 0),
(51, 'Monitor', 3, 3, 0),
(52, 'Monitor', 4, 4, 0),
(44, 'Printer', 31, 1, 0),
(38, 'NetworkEquipment', 31, 1, 0),
(39, 'NetworkEquipment', 23, 2, 0),
(45, 'Printer', 23, 2, 0),
(46, 'Printer', 3, 3, 0),
(63, 'Software', 4, 3, 0),
(62, 'Software', 5, 2, 0),
(61, 'Software', 23, 1, 0),
(83, 'CartridgeItem', 4, 2, 0),
(82, 'CartridgeItem', 34, 1, 0),
(57, 'Peripheral', 3, 3, 0),
(56, 'Peripheral', 23, 2, 0),
(55, 'Peripheral', 31, 1, 0),
(29, 'Computer', 31, 1, 0),
(35, 'Computer', 3, 7, 0),
(36, 'Computer', 19, 8, 0),
(37, 'Computer', 17, 9, 0),
(40, 'NetworkEquipment', 3, 3, 0),
(41, 'NetworkEquipment', 4, 4, 0),
(42, 'NetworkEquipment', 11, 6, 0),
(43, 'NetworkEquipment', 19, 7, 0),
(47, 'Printer', 4, 4, 0),
(48, 'Printer', 19, 6, 0),
(53, 'Monitor', 19, 6, 0),
(54, 'Monitor', 7, 7, 0),
(58, 'Peripheral', 4, 4, 0),
(59, 'Peripheral', 19, 6, 0),
(60, 'Peripheral', 7, 7, 0),
(64, 'Contact', 3, 1, 0),
(65, 'Contact', 4, 2, 0),
(66, 'Contact', 5, 3, 0),
(67, 'Contact', 6, 4, 0),
(68, 'Contact', 9, 5, 0),
(69, 'Supplier', 9, 1, 0),
(70, 'Supplier', 3, 2, 0),
(71, 'Supplier', 4, 3, 0),
(72, 'Supplier', 5, 4, 0),
(73, 'Supplier', 10, 5, 0),
(74, 'Supplier', 6, 6, 0),
(75, 'Contract', 4, 1, 0),
(76, 'Contract', 3, 2, 0),
(77, 'Contract', 5, 3, 0),
(78, 'Contract', 6, 4, 0),
(79, 'Contract', 7, 5, 0),
(80, 'Contract', 11, 6, 0),
(84, 'CartridgeItem', 23, 3, 0),
(85, 'CartridgeItem', 3, 4, 0),
(88, 'DocumentType', 6, 2, 0),
(89, 'DocumentType', 4, 3, 0),
(90, 'DocumentType', 5, 4, 0),
(91, 'Document', 3, 1, 0),
(92, 'Document', 4, 2, 0),
(93, 'Document', 7, 3, 0),
(94, 'Document', 5, 4, 0),
(95, 'Document', 16, 5, 0),
(96, 'User', 34, 1, 0),
(98, 'User', 5, 3, 0),
(99, 'User', 6, 4, 0),
(100, 'User', 3, 5, 0),
(101, 'ConsumableItem', 34, 1, 0),
(102, 'ConsumableItem', 4, 2, 0),
(103, 'ConsumableItem', 23, 3, 0),
(104, 'ConsumableItem', 3, 4, 0),
(105, 'NetworkEquipment', 40, 5, 0),
(106, 'Printer', 40, 5, 0),
(107, 'Monitor', 40, 5, 0),
(108, 'Peripheral', 40, 5, 0),
(109, 'User', 8, 6, 0),
(110, 'Phone', 31, 1, 0),
(111, 'Phone', 23, 2, 0),
(112, 'Phone', 3, 3, 0),
(113, 'Phone', 4, 4, 0),
(114, 'Phone', 40, 5, 0),
(115, 'Phone', 19, 6, 0),
(116, 'Phone', 7, 7, 0),
(117, 'Group', 16, 1, 0),
(118, 'AllAssets', 31, 1, 0),
(119, 'ReservationItem', 4, 1, 0),
(120, 'ReservationItem', 3, 2, 0),
(125, 'Budget', 3, 2, 0),
(122, 'Software', 72, 4, 0),
(123, 'Software', 163, 5, 0),
(124, 'Budget', 5, 1, 0),
(126, 'Budget', 4, 3, 0),
(127, 'Budget', 19, 4, 0),
(128, 'Crontask', 8, 1, 0),
(129, 'Crontask', 3, 2, 0),
(130, 'Crontask', 4, 3, 0),
(131, 'Crontask', 7, 4, 0),
(132, 'RequestType', 14, 1, 0),
(133, 'RequestType', 15, 2, 0),
(134, 'NotificationTemplate', 4, 1, 0),
(135, 'NotificationTemplate', 16, 2, 0),
(136, 'Notification', 5, 1, 0),
(137, 'Notification', 6, 2, 0),
(138, 'Notification', 2, 3, 0),
(139, 'Notification', 4, 4, 0),
(140, 'Notification', 80, 5, 0),
(141, 'Notification', 86, 6, 0),
(142, 'MailCollector', 2, 1, 0),
(143, 'MailCollector', 19, 2, 0),
(144, 'AuthLDAP', 3, 1, 0),
(145, 'AuthLDAP', 19, 2, 0),
(146, 'AuthMail', 3, 1, 0),
(147, 'AuthMail', 19, 2, 0),
(210, 'IPNetwork', 14, 1, 0),
(209, 'WifiNetwork', 10, 1, 0),
(150, 'Profile', 2, 1, 0),
(151, 'Profile', 3, 2, 0),
(152, 'Profile', 19, 3, 0),
(153, 'Transfer', 19, 1, 0),
(154, 'TicketValidation', 3, 1, 0),
(155, 'TicketValidation', 2, 2, 0),
(156, 'TicketValidation', 8, 3, 0),
(157, 'TicketValidation', 4, 4, 0),
(158, 'TicketValidation', 9, 5, 0),
(159, 'TicketValidation', 7, 6, 0),
(160, 'NotImportedEmail', 2, 1, 0),
(161, 'NotImportedEmail', 5, 2, 0),
(162, 'NotImportedEmail', 4, 3, 0),
(163, 'NotImportedEmail', 6, 4, 0),
(164, 'NotImportedEmail', 16, 5, 0),
(165, 'NotImportedEmail', 19, 6, 0),
(166, 'RuleRightParameter', 11, 1, 0),
(167, 'Ticket', 12, 1, 0),
(168, 'Ticket', 19, 2, 0),
(169, 'Ticket', 15, 3, 0),
(170, 'Ticket', 3, 4, 0),
(171, 'Ticket', 4, 5, 0),
(172, 'Ticket', 5, 6, 0),
(173, 'Ticket', 7, 7, 0),
(174, 'Calendar', 19, 1, 0),
(175, 'Holiday', 11, 1, 0),
(176, 'Holiday', 12, 2, 0),
(177, 'Holiday', 13, 3, 0),
(178, 'SLA', 4, 1, 0),
(179, 'Ticket', 18, 8, 0),
(180, 'AuthLdap', 30, 3, 0),
(181, 'AuthMail', 6, 3, 0),
(208, 'FQDN', 11, 1, 0),
(183, 'FieldUnicity', 1, 1, 0),
(184, 'FieldUnicity', 80, 2, 0),
(185, 'FieldUnicity', 4, 3, 0),
(186, 'FieldUnicity', 3, 4, 0),
(187, 'FieldUnicity', 86, 5, 0),
(188, 'FieldUnicity', 30, 6, 0),
(189, 'Problem', 21, 1, 0),
(190, 'Problem', 12, 2, 0),
(191, 'Problem', 19, 3, 0),
(192, 'Problem', 15, 4, 0),
(193, 'Problem', 3, 5, 0),
(194, 'Problem', 7, 6, 0),
(195, 'Problem', 18, 7, 0),
(196, 'Vlan', 11, 1, 0),
(197, 'TicketRecurrent', 11, 1, 0),
(198, 'TicketRecurrent', 12, 2, 0),
(199, 'TicketRecurrent', 13, 3, 0),
(200, 'TicketRecurrent', 15, 4, 0),
(201, 'TicketRecurrent', 14, 5, 0),
(202, 'Reminder', 2, 1, 0),
(203, 'Reminder', 3, 2, 0),
(204, 'Reminder', 4, 3, 0),
(205, 'Reminder', 5, 4, 0),
(206, 'Reminder', 6, 5, 0),
(207, 'Reminder', 7, 6, 0),
(211, 'IPNetwork', 10, 2, 0),
(212, 'IPNetwork', 11, 3, 0),
(213, 'IPNetwork', 12, 4, 0),
(214, 'IPNetwork', 13, 5, 0),
(215, 'NetworkName', 12, 1, 0),
(216, 'NetworkName', 13, 2, 0),
(217, 'RSSFeed', 2, 1, 0),
(218, 'RSSFeed', 4, 2, 0),
(219, 'RSSFeed', 5, 3, 0),
(220, 'RSSFeed', 19, 4, 0),
(221, 'RSSFeed', 6, 5, 0),
(222, 'RSSFeed', 7, 6, 0),
(223, 'Blacklist', 12, 1, 0),
(224, 'Blacklist', 11, 2, 0),
(225, 'ReservationItem', 5, 3, 0),
(226, 'QueueMail', 16, 1, 0),
(227, 'QueueMail', 7, 2, 0),
(228, 'QueueMail', 20, 3, 0),
(229, 'QueueMail', 21, 4, 0),
(230, 'QueueMail', 22, 5, 0),
(231, 'QueueMail', 15, 6, 0),
(232, 'Change', 12, 1, 0),
(233, 'Change', 19, 2, 0),
(234, 'Change', 15, 3, 0),
(235, 'Change', 7, 4, 0),
(236, 'Change', 18, 5, 0),
(237, 'Project', 3, 1, 0),
(238, 'Project', 4, 2, 0),
(239, 'Project', 12, 3, 0),
(240, 'Project', 5, 4, 0),
(241, 'Project', 15, 5, 0),
(242, 'Project', 21, 6, 0),
(243, 'ProjectState', 12, 1, 0),
(244, 'ProjectState', 11, 2, 0),
(245, 'ProjectTask', 2, 1, 0),
(246, 'ProjectTask', 12, 2, 0),
(247, 'ProjectTask', 14, 3, 0),
(248, 'ProjectTask', 5, 4, 0),
(249, 'ProjectTask', 7, 5, 0),
(250, 'ProjectTask', 8, 6, 0),
(251, 'ProjectTask', 13, 7, 0),
(252, 'CartridgeItem', 9, 5, 0),
(253, 'ConsumableItem', 9, 5, 0),
(254, 'ReservationItem', 9, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_documentcategories`
--

CREATE TABLE IF NOT EXISTS `glpi_documentcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `unicity` (`documentcategories_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_documents`
--

CREATE TABLE IF NOT EXISTS `glpi_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `sha1sum` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_blacklisted` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `users_id` (`users_id`),
  KEY `documentcategories_id` (`documentcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sha1sum` (`sha1sum`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_documents_items`
--

CREATE TABLE IF NOT EXISTS `glpi_documents_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documents_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_documenttypes`
--

CREATE TABLE IF NOT EXISTS `glpi_documenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_uploadable` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ext`),
  KEY `name` (`name`),
  KEY `is_uploadable` (`is_uploadable`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=73 ;

--
-- Volcado de datos para la tabla `glpi_documenttypes`
--

INSERT INTO `glpi_documenttypes` (`id`, `name`, `ext`, `icon`, `mime`, `is_uploadable`, `date_mod`, `comment`) VALUES
(1, 'JPEG', 'jpg', 'jpg-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(2, 'PNG', 'png', 'png-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(3, 'GIF', 'gif', 'gif-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(4, 'BMP', 'bmp', 'bmp-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(5, 'Photoshop', 'psd', 'psd-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(6, 'TIFF', 'tif', 'tif-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(7, 'AIFF', 'aiff', 'aiff-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(8, 'Windows Media', 'asf', 'asf-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(9, 'Windows Media', 'avi', 'avi-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(44, 'C source', 'c', 'c-dist.png', '', 1, '2011-12-06 09:48:34', NULL),
(27, 'RealAudio', 'rm', 'rm-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(16, 'Midi', 'mid', 'mid-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(17, 'QuickTime', 'mov', 'mov-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(18, 'MP3', 'mp3', 'mp3-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(19, 'MPEG', 'mpg', 'mpg-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(20, 'Ogg Vorbis', 'ogg', 'ogg-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(24, 'QuickTime', 'qt', 'qt-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(10, 'BZip', 'bz2', 'bz2-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(25, 'RealAudio', 'ra', 'ra-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(26, 'RealAudio', 'ram', 'ram-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(11, 'Word', 'doc', 'doc-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(12, 'DjVu', 'djvu', '', '', 1, '2004-12-13 19:47:21', NULL),
(42, 'MNG', 'mng', '', '', 1, '2004-12-13 19:47:22', NULL),
(13, 'PostScript', 'eps', 'ps-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(14, 'GZ', 'gz', 'gz-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(37, 'WAV', 'wav', 'wav-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(15, 'HTML', 'html', 'html-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(34, 'Flash', 'swf', 'swf-dist.png', '', 1, '2011-12-06 09:48:34', NULL),
(21, 'PDF', 'pdf', 'pdf-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(22, 'PowerPoint', 'ppt', 'ppt-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(23, 'PostScript', 'ps', 'ps-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(40, 'Windows Media', 'wmv', 'wmv-dist.png', '', 1, '2011-12-06 09:48:34', NULL),
(28, 'RTF', 'rtf', 'rtf-dist.png', '', 1, '2004-12-13 19:47:21', NULL),
(29, 'StarOffice', 'sdd', 'sdd-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(30, 'StarOffice', 'sdw', 'sdw-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(31, 'Stuffit', 'sit', 'sit-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(43, 'Adobe Illustrator', 'ai', 'ai-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(32, 'OpenOffice Impress', 'sxi', 'sxi-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(33, 'OpenOffice', 'sxw', 'sxw-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(46, 'DVI', 'dvi', 'dvi-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(35, 'TGZ', 'tgz', 'tgz-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(36, 'texte', 'txt', 'txt-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(49, 'RedHat/Mandrake/SuSE', 'rpm', 'rpm-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(38, 'Excel', 'xls', 'xls-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(39, 'XML', 'xml', 'xml-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(41, 'Zip', 'zip', 'zip-dist.png', '', 1, '2011-12-06 09:48:34', NULL),
(45, 'Debian', 'deb', 'deb-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(47, 'C header', 'h', 'h-dist.png', '', 1, '2011-12-06 09:48:34', NULL),
(48, 'Pascal', 'pas', 'pas-dist.png', '', 1, '2011-12-06 09:48:34', NULL),
(50, 'OpenOffice Calc', 'sxc', 'sxc-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(51, 'LaTeX', 'tex', 'tex-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(52, 'GIMP multi-layer', 'xcf', 'xcf-dist.png', '', 1, '2004-12-13 19:47:22', NULL),
(53, 'JPEG', 'jpeg', 'jpg-dist.png', '', 1, '2005-03-07 22:23:17', NULL),
(54, 'Oasis Open Office Writer', 'odt', 'odt-dist.png', '', 1, '2006-01-21 17:41:13', NULL),
(55, 'Oasis Open Office Calc', 'ods', 'ods-dist.png', '', 1, '2006-01-21 17:41:31', NULL),
(56, 'Oasis Open Office Impress', 'odp', 'odp-dist.png', '', 1, '2006-01-21 17:42:54', NULL),
(57, 'Oasis Open Office Impress Template', 'otp', 'odp-dist.png', '', 1, '2006-01-21 17:43:58', NULL),
(58, 'Oasis Open Office Writer Template', 'ott', 'odt-dist.png', '', 1, '2006-01-21 17:44:41', NULL),
(59, 'Oasis Open Office Calc Template', 'ots', 'ods-dist.png', '', 1, '2006-01-21 17:45:30', NULL),
(60, 'Oasis Open Office Math', 'odf', 'odf-dist.png', '', 1, '2006-01-21 17:48:05', NULL),
(61, 'Oasis Open Office Draw', 'odg', 'odg-dist.png', '', 1, '2006-01-21 17:48:31', NULL),
(62, 'Oasis Open Office Draw Template', 'otg', 'odg-dist.png', '', 1, '2006-01-21 17:49:46', NULL),
(63, 'Oasis Open Office Base', 'odb', 'odb-dist.png', '', 1, '2006-01-21 18:03:34', NULL),
(64, 'Oasis Open Office HTML', 'oth', 'oth-dist.png', '', 1, '2006-01-21 18:05:27', NULL),
(65, 'Oasis Open Office Writer Master', 'odm', 'odm-dist.png', '', 1, '2006-01-21 18:06:34', NULL),
(66, 'Oasis Open Office Chart', 'odc', '', '', 1, '2006-01-21 18:07:48', NULL),
(67, 'Oasis Open Office Image', 'odi', '', '', 1, '2006-01-21 18:08:18', NULL),
(68, 'Word XML', 'docx', 'doc-dist.png', NULL, 1, '2011-01-18 11:40:42', NULL),
(69, 'Excel XML', 'xlsx', 'xls-dist.png', NULL, 1, '2011-01-18 11:40:42', NULL),
(70, 'PowerPoint XML', 'pptx', 'ppt-dist.png', NULL, 1, '2011-01-18 11:40:42', NULL),
(71, 'Comma-Separated Values', 'csv', 'csv-dist.png', NULL, 1, '2011-12-06 09:48:34', NULL),
(72, 'Scalable Vector Graphics', 'svg', 'svg-dist.png', NULL, 1, '2011-12-06 09:48:34', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_domains`
--

CREATE TABLE IF NOT EXISTS `glpi_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_dropdowntranslations`
--

CREATE TABLE IF NOT EXISTS `glpi_dropdowntranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  KEY `typeid` (`itemtype`,`items_id`),
  KEY `language` (`language`),
  KEY `field` (`field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_entities`
--

CREATE TABLE IF NOT EXISTS `glpi_entities` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_subject_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authldaps_id` int(11) NOT NULL DEFAULT '0',
  `mail_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_ldapfilter` text COLLATE utf8_unicode_ci,
  `mailing_signature` text COLLATE utf8_unicode_ci,
  `cartridges_alert_repeat` int(11) NOT NULL DEFAULT '-2',
  `consumables_alert_repeat` int(11) NOT NULL DEFAULT '-2',
  `use_licenses_alert` int(11) NOT NULL DEFAULT '-2',
  `send_licenses_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_contracts_alert` int(11) NOT NULL DEFAULT '-2',
  `send_contracts_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_infocoms_alert` int(11) NOT NULL DEFAULT '-2',
  `send_infocoms_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_reservations_alert` int(11) NOT NULL DEFAULT '-2',
  `autoclose_delay` int(11) NOT NULL DEFAULT '-2',
  `notclosed_delay` int(11) NOT NULL DEFAULT '-2',
  `calendars_id` int(11) NOT NULL DEFAULT '-2',
  `auto_assign_mode` int(11) NOT NULL DEFAULT '-2',
  `tickettype` int(11) NOT NULL DEFAULT '-2',
  `max_closedate` datetime DEFAULT NULL,
  `inquest_config` int(11) NOT NULL DEFAULT '-2',
  `inquest_rate` int(11) NOT NULL DEFAULT '0',
  `inquest_delay` int(11) NOT NULL DEFAULT '-10',
  `inquest_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autofill_warranty_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '-2',
  `entities_id_software` int(11) NOT NULL DEFAULT '-2',
  `default_contract_alert` int(11) NOT NULL DEFAULT '-2',
  `default_infocom_alert` int(11) NOT NULL DEFAULT '-2',
  `default_cartridges_alarm_threshold` int(11) NOT NULL DEFAULT '-2',
  `default_consumables_alarm_threshold` int(11) NOT NULL DEFAULT '-2',
  `delay_send_emails` int(11) NOT NULL DEFAULT '-2',
  `is_notif_enable_default` int(11) NOT NULL DEFAULT '-2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`name`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `glpi_entities`
--

INSERT INTO `glpi_entities` (`id`, `name`, `entities_id`, `completename`, `comment`, `level`, `sons_cache`, `ancestors_cache`, `address`, `postcode`, `town`, `state`, `country`, `website`, `phonenumber`, `fax`, `email`, `admin_email`, `admin_email_name`, `admin_reply`, `admin_reply_name`, `notification_subject_tag`, `ldap_dn`, `tag`, `authldaps_id`, `mail_domain`, `entity_ldapfilter`, `mailing_signature`, `cartridges_alert_repeat`, `consumables_alert_repeat`, `use_licenses_alert`, `send_licenses_alert_before_delay`, `use_contracts_alert`, `send_contracts_alert_before_delay`, `use_infocoms_alert`, `send_infocoms_alert_before_delay`, `use_reservations_alert`, `autoclose_delay`, `notclosed_delay`, `calendars_id`, `auto_assign_mode`, `tickettype`, `max_closedate`, `inquest_config`, `inquest_rate`, `inquest_delay`, `inquest_URL`, `autofill_warranty_date`, `autofill_use_date`, `autofill_buy_date`, `autofill_delivery_date`, `autofill_order_date`, `tickettemplates_id`, `entities_id_software`, `default_contract_alert`, `default_infocom_alert`, `default_cartridges_alarm_threshold`, `default_consumables_alarm_threshold`, `delay_send_emails`, `is_notif_enable_default`) VALUES
(0, 'Root entity', -1, 'Root entity', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, -10, 1, NULL, 1, 0, 0, NULL, '0', '0', '0', '0', '0', 1, -10, 0, 0, 10, 10, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_entities_knowbaseitems`
--

CREATE TABLE IF NOT EXISTS `glpi_entities_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_entities_reminders`
--

CREATE TABLE IF NOT EXISTS `glpi_entities_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_entities_rssfeeds`
--

CREATE TABLE IF NOT EXISTS `glpi_entities_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_events`
--

CREATE TABLE IF NOT EXISTS `glpi_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `item` (`type`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `glpi_events`
--

INSERT INTO `glpi_events` (`id`, `items_id`, `type`, `date`, `service`, `level`, `message`) VALUES
(1, -1, 'system', '2015-11-01 22:19:30', 'login', 3, 'glpi log in from IP 127.0.0.1'),
(2, 1, 'Location', '2015-11-01 22:28:26', 'setup', 4, 'glpi adds the item Cuarto'),
(3, 1, 'groups', '2015-11-01 22:31:00', 'setup', 4, 'glpi adds the item Asus Group'),
(4, 1, 'computers', '2015-11-01 22:41:06', 'inventory', 4, 'glpi adds the item zzzzzzzzz'),
(5, 1, 'problem', '2015-11-01 22:45:29', 'maintain', 4, 'glpi adds the item compu dañada'),
(6, -1, 'system', '2015-11-01 22:58:17', 'login', 3, 'tech log in from IP 127.0.0.1'),
(7, -1, 'system', '2015-11-08 21:01:24', 'login', 3, 'tech log in from IP 127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_fieldblacklists`
--

CREATE TABLE IF NOT EXISTS `glpi_fieldblacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_fieldunicities`
--

CREATE TABLE IF NOT EXISTS `glpi_fieldunicities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `fields` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `action_refuse` tinyint(1) NOT NULL DEFAULT '0',
  `action_notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores field unicity criterias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_filesystems`
--

CREATE TABLE IF NOT EXISTS `glpi_filesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `glpi_filesystems`
--

INSERT INTO `glpi_filesystems` (`id`, `name`, `comment`) VALUES
(1, 'ext', NULL),
(2, 'ext2', NULL),
(3, 'ext3', NULL),
(4, 'ext4', NULL),
(5, 'FAT', NULL),
(6, 'FAT32', NULL),
(7, 'VFAT', NULL),
(8, 'HFS', NULL),
(9, 'HPFS', NULL),
(10, 'HTFS', NULL),
(11, 'JFS', NULL),
(12, 'JFS2', NULL),
(13, 'NFS', NULL),
(14, 'NTFS', NULL),
(15, 'ReiserFS', NULL),
(16, 'SMBFS', NULL),
(17, 'UDF', NULL),
(18, 'UFS', NULL),
(19, 'XFS', NULL),
(20, 'ZFS', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_fqdns`
--

CREATE TABLE IF NOT EXISTS `glpi_fqdns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fqdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `fqdn` (`fqdn`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups`
--

CREATE TABLE IF NOT EXISTS `glpi_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `ldap_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ldap_value` text COLLATE utf8_unicode_ci,
  `ldap_group_dn` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_requester` tinyint(1) NOT NULL DEFAULT '1',
  `is_assign` tinyint(1) NOT NULL DEFAULT '1',
  `is_notify` tinyint(1) NOT NULL DEFAULT '1',
  `is_itemgroup` tinyint(1) NOT NULL DEFAULT '1',
  `is_usergroup` tinyint(1) NOT NULL DEFAULT '1',
  `is_manager` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ldap_field` (`ldap_field`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `ldap_value` (`ldap_value`(200)),
  KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  KEY `groups_id` (`groups_id`),
  KEY `is_requester` (`is_requester`),
  KEY `is_assign` (`is_assign`),
  KEY `is_notify` (`is_notify`),
  KEY `is_itemgroup` (`is_itemgroup`),
  KEY `is_usergroup` (`is_usergroup`),
  KEY `is_manager` (`is_manager`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_groups`
--

INSERT INTO `glpi_groups` (`id`, `entities_id`, `is_recursive`, `name`, `comment`, `ldap_field`, `ldap_value`, `ldap_group_dn`, `date_mod`, `groups_id`, `completename`, `level`, `ancestors_cache`, `sons_cache`, `is_requester`, `is_assign`, `is_notify`, `is_itemgroup`, `is_usergroup`, `is_manager`) VALUES
(1, 0, 0, 'Asus Group', '', NULL, NULL, NULL, '2015-11-01 22:31:00', 0, 'Asus Group', 1, NULL, NULL, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups_knowbaseitems`
--

CREATE TABLE IF NOT EXISTS `glpi_groups_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups_problems`
--

CREATE TABLE IF NOT EXISTS `glpi_groups_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `glpi_groups_problems`
--

INSERT INTO `glpi_groups_problems` (`id`, `problems_id`, `groups_id`, `type`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups_reminders`
--

CREATE TABLE IF NOT EXISTS `glpi_groups_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups_rssfeeds`
--

CREATE TABLE IF NOT EXISTS `glpi_groups_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_groups_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_groups_users`
--

CREATE TABLE IF NOT EXISTS `glpi_groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_userdelegate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_manager` (`is_manager`),
  KEY `is_userdelegate` (`is_userdelegate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_holidays`
--

CREATE TABLE IF NOT EXISTS `glpi_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_perpetual` (`is_perpetual`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_infocoms`
--

CREATE TABLE IF NOT EXISTS `glpi_infocoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int(11) NOT NULL DEFAULT '0',
  `warranty_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `order_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `immo_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `warranty_value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `sink_time` int(11) NOT NULL DEFAULT '0',
  `sink_type` int(11) NOT NULL DEFAULT '0',
  `sink_coeff` float NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `bill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `alert` int(11) NOT NULL DEFAULT '0',
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `buy_date` (`buy_date`),
  KEY `alert` (`alert`),
  KEY `budgets_id` (`budgets_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_interfacetypes`
--

CREATE TABLE IF NOT EXISTS `glpi_interfacetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `glpi_interfacetypes`
--

INSERT INTO `glpi_interfacetypes` (`id`, `name`, `comment`) VALUES
(1, 'IDE', NULL),
(2, 'SATA', NULL),
(3, 'SCSI', NULL),
(4, 'USB', NULL),
(5, 'AGP', ''),
(6, 'PCI', ''),
(7, 'PCIe', ''),
(8, 'PCI-X', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ipaddresses`
--

CREATE TABLE IF NOT EXISTS `glpi_ipaddresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `version` tinyint(3) unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `binary_0` int(10) unsigned NOT NULL DEFAULT '0',
  `binary_1` int(10) unsigned NOT NULL DEFAULT '0',
  `binary_2` int(10) unsigned NOT NULL DEFAULT '0',
  `binary_3` int(10) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `mainitems_id` int(11) NOT NULL DEFAULT '0',
  `mainitemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `textual` (`name`),
  KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ipaddresses_ipnetworks`
--

CREATE TABLE IF NOT EXISTS `glpi_ipaddresses_ipnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddresses_id` int(11) NOT NULL DEFAULT '0',
  `ipnetworks_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  KEY `ipnetworks_id` (`ipnetworks_id`),
  KEY `ipaddresses_id` (`ipaddresses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ipnetworks`
--

CREATE TABLE IF NOT EXISTS `glpi_ipnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `ipnetworks_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `addressable` tinyint(1) NOT NULL DEFAULT '0',
  `version` tinyint(3) unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_0` int(10) unsigned NOT NULL DEFAULT '0',
  `address_1` int(10) unsigned NOT NULL DEFAULT '0',
  `address_2` int(10) unsigned NOT NULL DEFAULT '0',
  `address_3` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `netmask_0` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask_1` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask_2` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask_3` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway_0` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_1` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_2` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_3` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `network_definition` (`entities_id`,`address`,`netmask`),
  KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ipnetworks_vlans`
--

CREATE TABLE IF NOT EXISTS `glpi_ipnetworks_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipnetworks_id` int(11) NOT NULL DEFAULT '0',
  `vlans_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicecases`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicecases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecases_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicecases_id` (`devicecases_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicecontrols`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicecontrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecontrols_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicecontrols_id` (`devicecontrols_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicedrives`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicedrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicedrives_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicedrives_id` (`devicedrives_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicegraphiccards`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicegraphiccards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicegraphiccards_id` int(11) NOT NULL DEFAULT '0',
  `memory` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  KEY `specificity` (`memory`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_deviceharddrives`
--

CREATE TABLE IF NOT EXISTS `glpi_items_deviceharddrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deviceharddrives_id` int(11) NOT NULL DEFAULT '0',
  `capacity` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `deviceharddrives_id` (`deviceharddrives_id`),
  KEY `specificity` (`capacity`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicememories`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicememories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicememories_id` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicememories_id` (`devicememories_id`),
  KEY `specificity` (`size`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicemotherboards`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicemotherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicemotherboards_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicemotherboards_id` (`devicemotherboards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicenetworkcards`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicenetworkcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  KEY `specificity` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicepcis`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicepcis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicepcis_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicepcis_id` (`devicepcis_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicepowersupplies`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicepowersupplies_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_deviceprocessors`
--

CREATE TABLE IF NOT EXISTS `glpi_items_deviceprocessors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deviceprocessors_id` int(11) NOT NULL DEFAULT '0',
  `frequency` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `nbcores` int(11) DEFAULT NULL,
  `nbthreads` int(11) DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `deviceprocessors_id` (`deviceprocessors_id`),
  KEY `specificity` (`frequency`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `nbcores` (`nbcores`),
  KEY `nbthreads` (`nbthreads`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_devicesoundcards`
--

CREATE TABLE IF NOT EXISTS `glpi_items_devicesoundcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicesoundcards_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicesoundcards_id` (`devicesoundcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_problems`
--

CREATE TABLE IF NOT EXISTS `glpi_items_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_projects`
--

CREATE TABLE IF NOT EXISTS `glpi_items_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_items_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_items_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_itilcategories`
--

CREATE TABLE IF NOT EXISTS `glpi_itilcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_helpdeskvisible` tinyint(1) NOT NULL DEFAULT '1',
  `tickettemplates_id_incident` int(11) NOT NULL DEFAULT '0',
  `tickettemplates_id_demand` int(11) NOT NULL DEFAULT '0',
  `is_incident` int(11) NOT NULL DEFAULT '1',
  `is_request` int(11) NOT NULL DEFAULT '1',
  `is_problem` int(11) NOT NULL DEFAULT '1',
  `is_change` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`),
  KEY `is_change` (`is_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_knowbaseitemcategories`
--

CREATE TABLE IF NOT EXISTS `glpi_knowbaseitemcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_knowbaseitems`
--

CREATE TABLE IF NOT EXISTS `glpi_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `answer` longtext COLLATE utf8_unicode_ci,
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `is_faq` (`is_faq`),
  KEY `date_mod` (`date_mod`),
  FULLTEXT KEY `fulltext` (`name`,`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_knowbaseitems_profiles`
--

CREATE TABLE IF NOT EXISTS `glpi_knowbaseitems_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_knowbaseitems_users`
--

CREATE TABLE IF NOT EXISTS `glpi_knowbaseitems_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_knowbaseitemtranslations`
--

CREATE TABLE IF NOT EXISTS `glpi_knowbaseitemtranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `answer` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item` (`knowbaseitems_id`,`language`),
  FULLTEXT KEY `fulltext` (`name`,`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_links`
--

CREATE TABLE IF NOT EXISTS `glpi_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `open_window` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_links_itemtypes`
--

CREATE TABLE IF NOT EXISTS `glpi_links_itemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `links_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  KEY `links_id` (`links_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_locations`
--

CREATE TABLE IF NOT EXISTS `glpi_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `building` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  KEY `locations_id` (`locations_id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_locations`
--

INSERT INTO `glpi_locations` (`id`, `entities_id`, `is_recursive`, `name`, `locations_id`, `completename`, `comment`, `level`, `ancestors_cache`, `sons_cache`, `building`, `room`, `latitude`, `longitude`, `altitude`) VALUES
(1, 0, 0, 'Cuarto', 0, 'Cuarto', '', 1, NULL, NULL, '1', '1', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_logs`
--

CREATE TABLE IF NOT EXISTS `glpi_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `linked_action` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `id_search_option` int(11) NOT NULL DEFAULT '0' COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `itemtype_link` (`itemtype_link`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `glpi_logs`
--

INSERT INTO `glpi_logs` (`id`, `itemtype`, `items_id`, `itemtype_link`, `linked_action`, `user_name`, `date_mod`, `id_search_option`, `old_value`, `new_value`) VALUES
(1, 'Location', 1, '0', 20, 'glpi (2)', '2015-11-01 22:28:26', 0, '', ''),
(2, 'Group', 1, '0', 20, 'glpi (2)', '2015-11-01 22:31:00', 0, '', ''),
(3, 'Computer', 1, '0', 20, 'glpi (2)', '2015-11-01 22:41:06', 0, '', ''),
(4, 'Problem', 1, 'User', 15, 'glpi (2)', '2015-11-01 22:45:29', 0, '', 'glpi (2)'),
(5, 'Problem', 1, 'User', 15, 'glpi (2)', '2015-11-01 22:45:29', 0, '', 'glpi (2)'),
(6, 'Problem', 1, 'User', 15, 'glpi (2)', '2015-11-01 22:45:29', 0, '', 'tech (4)'),
(7, 'Problem', 1, 'Group', 15, 'glpi (2)', '2015-11-01 22:45:29', 0, '', 'Asus Group (1)'),
(8, 'Problem', 1, 'Group', 15, 'glpi (2)', '2015-11-01 22:45:29', 0, '', 'Asus Group (1)'),
(9, 'Problem', 1, 'Group', 15, 'glpi (2)', '2015-11-01 22:45:29', 0, '', 'Asus Group (1)'),
(10, 'Problem', 1, '0', 20, 'glpi (2)', '2015-11-01 22:45:29', 0, '', ''),
(11, 'User', 4, '', 0, 'tech (4)', '2015-11-01 22:58:17', 15, '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_mailcollectors`
--

CREATE TABLE IF NOT EXISTS `glpi_mailcollectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize_max` int(11) NOT NULL DEFAULT '2097152',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accepted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refused` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_kerberos` tinyint(1) NOT NULL DEFAULT '0',
  `errors` int(11) NOT NULL DEFAULT '0',
  `use_mail_date` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_manufacturers`
--

CREATE TABLE IF NOT EXISTS `glpi_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_monitormodels`
--

CREATE TABLE IF NOT EXISTS `glpi_monitormodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_monitors`
--

CREATE TABLE IF NOT EXISTS `glpi_monitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `have_micro` tinyint(1) NOT NULL DEFAULT '0',
  `have_speaker` tinyint(1) NOT NULL DEFAULT '0',
  `have_subd` tinyint(1) NOT NULL DEFAULT '0',
  `have_bnc` tinyint(1) NOT NULL DEFAULT '0',
  `have_dvi` tinyint(1) NOT NULL DEFAULT '0',
  `have_pivot` tinyint(1) NOT NULL DEFAULT '0',
  `have_hdmi` tinyint(1) NOT NULL DEFAULT '0',
  `have_displayport` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `monitortypes_id` int(11) NOT NULL DEFAULT '0',
  `monitormodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `monitormodels_id` (`monitormodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `monitortypes_id` (`monitortypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_monitortypes`
--

CREATE TABLE IF NOT EXISTS `glpi_monitortypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_netpoints`
--

CREATE TABLE IF NOT EXISTS `glpi_netpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `complete` (`entities_id`,`locations_id`,`name`),
  KEY `location_name` (`locations_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkaliases`
--

CREATE TABLE IF NOT EXISTS `glpi_networkaliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `networknames_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fqdns_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `networknames_id` (`networknames_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkequipmentfirmwares`
--

CREATE TABLE IF NOT EXISTS `glpi_networkequipmentfirmwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkequipmentmodels`
--

CREATE TABLE IF NOT EXISTS `glpi_networkequipmentmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkequipments`
--

CREATE TABLE IF NOT EXISTS `glpi_networkequipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmenttypes_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmentmodels_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmentfirmwares_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `domains_id` (`domains_id`),
  KEY `networkequipmentfirmwares_id` (`networkequipmentfirmwares_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkequipmenttypes`
--

CREATE TABLE IF NOT EXISTS `glpi_networkequipmenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkinterfaces`
--

CREATE TABLE IF NOT EXISTS `glpi_networkinterfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networknames`
--

CREATE TABLE IF NOT EXISTS `glpi_networknames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `fqdns_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `FQDN` (`name`,`fqdns_id`),
  KEY `name` (`name`),
  KEY `fqdns_id` (`fqdns_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkportaggregates`
--

CREATE TABLE IF NOT EXISTS `glpi_networkportaggregates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `networkports_id_list` text COLLATE utf8_unicode_ci COMMENT 'array of associated networkports_id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkportaliases`
--

CREATE TABLE IF NOT EXISTS `glpi_networkportaliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `networkports_id_alias` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `networkports_id_alias` (`networkports_id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkportdialups`
--

CREATE TABLE IF NOT EXISTS `glpi_networkportdialups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkportethernets`
--

CREATE TABLE IF NOT EXISTS `glpi_networkportethernets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `netpoints_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'T, LX, SX',
  `speed` int(11) NOT NULL DEFAULT '10' COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `netpoint` (`netpoints_id`),
  KEY `type` (`type`),
  KEY `speed` (`speed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkportlocals`
--

CREATE TABLE IF NOT EXISTS `glpi_networkportlocals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkports`
--

CREATE TABLE IF NOT EXISTS `glpi_networkports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `logical_number` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instantiation_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `on_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `mac` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkports_networkports`
--

CREATE TABLE IF NOT EXISTS `glpi_networkports_networkports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id_1` int(11) NOT NULL DEFAULT '0',
  `networkports_id_2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  KEY `networkports_id_2` (`networkports_id_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkports_vlans`
--

CREATE TABLE IF NOT EXISTS `glpi_networkports_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `vlans_id` int(11) NOT NULL DEFAULT '0',
  `tagged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networkportwifis`
--

CREATE TABLE IF NOT EXISTS `glpi_networkportwifis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `wifinetworks_id` int(11) NOT NULL DEFAULT '0',
  `networkportwifis_id` int(11) NOT NULL DEFAULT '0' COMMENT 'only usefull in case of Managed node',
  `version` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'a, a/b, a/b/g, a/b/g/n, a/b/g/n/y',
  `mode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ad-hoc, managed, master, repeater, secondary, monitor, auto',
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `essid` (`wifinetworks_id`),
  KEY `version` (`version`),
  KEY `mode` (`mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_networks`
--

CREATE TABLE IF NOT EXISTS `glpi_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_notepads`
--

CREATE TABLE IF NOT EXISTS `glpi_notepads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date` (`date`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_notifications`
--

CREATE TABLE IF NOT EXISTS `glpi_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=58 ;

--
-- Volcado de datos para la tabla `glpi_notifications`
--

INSERT INTO `glpi_notifications` (`id`, `name`, `entities_id`, `itemtype`, `event`, `mode`, `notificationtemplates_id`, `comment`, `is_recursive`, `is_active`, `date_mod`) VALUES
(1, 'Alert Tickets not closed', 0, 'Ticket', 'alertnotclosed', 'mail', 6, '', 1, 1, '2010-02-16 16:41:39'),
(2, 'New Ticket', 0, 'Ticket', 'new', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(3, 'Update Ticket', 0, 'Ticket', 'update', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(4, 'Close Ticket', 0, 'Ticket', 'closed', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(5, 'Add Followup', 0, 'Ticket', 'add_followup', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(6, 'Add Task', 0, 'Ticket', 'add_task', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(7, 'Update Followup', 0, 'Ticket', 'update_followup', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(8, 'Update Task', 0, 'Ticket', 'update_task', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(9, 'Delete Followup', 0, 'Ticket', 'delete_followup', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(10, 'Delete Task', 0, 'Ticket', 'delete_task', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(11, 'Resolve ticket', 0, 'Ticket', 'solved', 'mail', 4, '', 1, 1, '2010-02-16 16:41:39'),
(12, 'Ticket Validation', 0, 'Ticket', 'validation', 'mail', 7, '', 1, 1, '2010-02-16 16:41:39'),
(13, 'New Reservation', 0, 'Reservation', 'new', 'mail', 2, '', 1, 1, '2010-02-16 16:41:39'),
(14, 'Update Reservation', 0, 'Reservation', 'update', 'mail', 2, '', 1, 1, '2010-02-16 16:41:39'),
(15, 'Delete Reservation', 0, 'Reservation', 'delete', 'mail', 2, '', 1, 1, '2010-02-16 16:41:39'),
(16, 'Alert Reservation', 0, 'Reservation', 'alert', 'mail', 3, '', 1, 1, '2010-02-16 16:41:39'),
(17, 'Contract Notice', 0, 'Contract', 'notice', 'mail', 12, '', 1, 1, '2010-02-16 16:41:39'),
(18, 'Contract End', 0, 'Contract', 'end', 'mail', 12, '', 1, 1, '2010-02-16 16:41:39'),
(19, 'MySQL Synchronization', 0, 'DBConnection', 'desynchronization', 'mail', 1, '', 1, 1, '2010-02-16 16:41:39'),
(20, 'Cartridges', 0, 'CartridgeItem', 'alert', 'mail', 8, '', 1, 1, '2010-02-16 16:41:39'),
(21, 'Consumables', 0, 'ConsumableItem', 'alert', 'mail', 9, '', 1, 1, '2010-02-16 16:41:39'),
(22, 'Infocoms', 0, 'Infocom', 'alert', 'mail', 10, '', 1, 1, '2010-02-16 16:41:39'),
(23, 'Software Licenses', 0, 'SoftwareLicense', 'alert', 'mail', 11, '', 1, 1, '2010-02-16 16:41:39'),
(24, 'Ticket Recall', 0, 'Ticket', 'recall', 'mail', 4, '', 1, 1, '2011-03-04 11:35:13'),
(25, 'Password Forget', 0, 'User', 'passwordforget', 'mail', 13, '', 1, 1, '2011-03-04 11:35:13'),
(26, 'Ticket Satisfaction', 0, 'Ticket', 'satisfaction', 'mail', 14, '', 1, 1, '2011-03-04 11:35:15'),
(27, 'Item not unique', 0, 'FieldUnicity', 'refuse', 'mail', 15, '', 1, 1, '2011-03-04 11:35:16'),
(28, 'Crontask Watcher', 0, 'Crontask', 'alert', 'mail', 16, '', 1, 1, '2011-03-04 11:35:16'),
(29, 'New Problem', 0, 'Problem', 'new', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(30, 'Update Problem', 0, 'Problem', 'update', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(31, 'Resolve Problem', 0, 'Problem', 'solved', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(32, 'Add Task', 0, 'Problem', 'add_task', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(33, 'Update Task', 0, 'Problem', 'update_task', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(34, 'Delete Task', 0, 'Problem', 'delete_task', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(35, 'Close Problem', 0, 'Problem', 'closed', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(36, 'Delete Problem', 0, 'Problem', 'delete', 'mail', 17, '', 1, 1, '2011-12-06 09:48:33'),
(37, 'Ticket Validation Answer', 0, 'Ticket', 'validation_answer', 'mail', 7, '', 1, 1, '2014-01-15 14:35:24'),
(38, 'Contract End Periodicity', 0, 'Contract', 'periodicity', 'mail', 12, '', 1, 1, '2014-01-15 14:35:24'),
(39, 'Contract Notice Periodicity', 0, 'Contract', 'periodicitynotice', 'mail', 12, '', 1, 1, '2014-01-15 14:35:24'),
(40, 'Planning recall', 0, 'PlanningRecall', 'planningrecall', 'mail', 18, '', 1, 1, '2014-01-15 14:35:24'),
(41, 'Delete Ticket', 0, 'Ticket', 'delete', 'mail', 4, '', 1, 1, '2014-01-15 14:35:26'),
(42, 'New Change', 0, 'Change', 'new', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(43, 'Update Change', 0, 'Change', 'update', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(44, 'Resolve Change', 0, 'Change', 'solved', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(45, 'Add Task', 0, 'Change', 'add_task', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(46, 'Update Task', 0, 'Change', 'update_task', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(47, 'Delete Task', 0, 'Change', 'delete_task', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(48, 'Close Change', 0, 'Change', 'closed', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(49, 'Delete Change', 0, 'Change', 'delete', 'mail', 19, '', 1, 1, '2014-06-18 08:02:07'),
(50, 'Ticket Satisfaction Answer', 0, 'Ticket', 'replysatisfaction', 'mail', 14, '', 1, 1, '2014-06-18 08:02:08'),
(51, 'Receiver errors', 0, 'MailCollector', 'error', 'mail', 20, '', 1, 1, '2014-06-18 08:02:08'),
(52, 'New Project', 0, 'Project', 'new', 'mail', 21, '', 1, 1, '2014-06-18 08:02:09'),
(53, 'Update Project', 0, 'Project', 'update', 'mail', 21, '', 1, 1, '2014-06-18 08:02:09'),
(54, 'Delete Project', 0, 'Project', 'delete', 'mail', 21, '', 1, 1, '2014-06-18 08:02:09'),
(55, 'New Project Task', 0, 'ProjectTask', 'new', 'mail', 22, '', 1, 1, '2014-06-18 08:02:09'),
(56, 'Update Project Task', 0, 'ProjectTask', 'update', 'mail', 22, '', 1, 1, '2014-06-18 08:02:09'),
(57, 'Delete Project Task', 0, 'ProjectTask', 'delete', 'mail', 22, '', 1, 1, '2014-06-18 08:02:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_notificationtargets`
--

CREATE TABLE IF NOT EXISTS `glpi_notificationtargets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `notifications_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items` (`type`,`items_id`),
  KEY `notifications_id` (`notifications_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=123 ;

--
-- Volcado de datos para la tabla `glpi_notificationtargets`
--

INSERT INTO `glpi_notificationtargets` (`id`, `items_id`, `type`, `notifications_id`) VALUES
(1, 3, 1, 13),
(2, 1, 1, 13),
(3, 3, 2, 2),
(4, 1, 1, 2),
(5, 1, 1, 3),
(6, 1, 1, 5),
(7, 1, 1, 4),
(8, 2, 1, 3),
(9, 4, 1, 3),
(10, 3, 1, 2),
(11, 3, 1, 3),
(12, 3, 1, 5),
(13, 3, 1, 4),
(14, 1, 1, 19),
(15, 14, 1, 12),
(16, 3, 1, 14),
(17, 1, 1, 14),
(18, 3, 1, 15),
(19, 1, 1, 15),
(20, 1, 1, 6),
(21, 3, 1, 6),
(22, 1, 1, 7),
(23, 3, 1, 7),
(24, 1, 1, 8),
(25, 3, 1, 8),
(26, 1, 1, 9),
(27, 3, 1, 9),
(28, 1, 1, 10),
(29, 3, 1, 10),
(30, 1, 1, 11),
(31, 3, 1, 11),
(32, 19, 1, 25),
(33, 3, 1, 26),
(34, 21, 1, 2),
(35, 21, 1, 3),
(36, 21, 1, 5),
(37, 21, 1, 4),
(38, 21, 1, 6),
(39, 21, 1, 7),
(40, 21, 1, 8),
(41, 21, 1, 9),
(42, 21, 1, 10),
(43, 21, 1, 11),
(75, 1, 1, 41),
(46, 1, 1, 28),
(47, 3, 1, 29),
(48, 1, 1, 29),
(49, 21, 1, 29),
(50, 2, 1, 30),
(51, 4, 1, 30),
(52, 3, 1, 30),
(53, 1, 1, 30),
(54, 21, 1, 30),
(55, 3, 1, 31),
(56, 1, 1, 31),
(57, 21, 1, 31),
(58, 3, 1, 32),
(59, 1, 1, 32),
(60, 21, 1, 32),
(61, 3, 1, 33),
(62, 1, 1, 33),
(63, 21, 1, 33),
(64, 3, 1, 34),
(65, 1, 1, 34),
(66, 21, 1, 34),
(67, 3, 1, 35),
(68, 1, 1, 35),
(69, 21, 1, 35),
(70, 3, 1, 36),
(71, 1, 1, 36),
(72, 21, 1, 36),
(73, 14, 1, 37),
(74, 3, 1, 40),
(76, 3, 1, 42),
(77, 1, 1, 42),
(78, 21, 1, 42),
(79, 2, 1, 43),
(80, 4, 1, 43),
(81, 3, 1, 43),
(82, 1, 1, 43),
(83, 21, 1, 43),
(84, 3, 1, 44),
(85, 1, 1, 44),
(86, 21, 1, 44),
(87, 3, 1, 45),
(88, 1, 1, 45),
(89, 21, 1, 45),
(90, 3, 1, 46),
(91, 1, 1, 46),
(92, 21, 1, 46),
(93, 3, 1, 47),
(94, 1, 1, 47),
(95, 21, 1, 47),
(96, 3, 1, 48),
(97, 1, 1, 48),
(98, 21, 1, 48),
(99, 3, 1, 49),
(100, 1, 1, 49),
(101, 21, 1, 49),
(102, 3, 1, 50),
(103, 2, 1, 50),
(104, 1, 1, 51),
(105, 27, 1, 52),
(106, 1, 1, 52),
(107, 28, 1, 52),
(108, 27, 1, 53),
(109, 1, 1, 53),
(110, 28, 1, 53),
(111, 27, 1, 54),
(112, 1, 1, 54),
(113, 28, 1, 54),
(114, 31, 1, 55),
(115, 1, 1, 55),
(116, 32, 1, 55),
(117, 31, 1, 56),
(118, 1, 1, 56),
(119, 32, 1, 56),
(120, 31, 1, 57),
(121, 1, 1, 57),
(122, 32, 1, 57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_notificationtemplates`
--

CREATE TABLE IF NOT EXISTS `glpi_notificationtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `css` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `glpi_notificationtemplates`
--

INSERT INTO `glpi_notificationtemplates` (`id`, `name`, `itemtype`, `date_mod`, `comment`, `css`) VALUES
(1, 'MySQL Synchronization', 'DBConnection', '2010-02-01 15:51:46', '', NULL),
(2, 'Reservations', 'Reservation', '2010-02-03 14:03:45', '', NULL),
(3, 'Alert Reservation', 'Reservation', '2010-02-03 14:03:45', '', NULL),
(4, 'Tickets', 'Ticket', '2010-02-07 21:39:15', '', NULL),
(5, 'Tickets (Simple)', 'Ticket', '2010-02-07 21:39:15', '', NULL),
(6, 'Alert Tickets not closed', 'Ticket', '2010-02-07 21:39:15', '', NULL),
(7, 'Tickets Validation', 'Ticket', '2010-02-26 21:39:15', '', NULL),
(8, 'Cartridges', 'CartridgeItem', '2010-02-16 13:17:24', '', NULL),
(9, 'Consumables', 'ConsumableItem', '2010-02-16 13:17:38', '', NULL),
(10, 'Infocoms', 'Infocom', '2010-02-16 13:17:55', '', NULL),
(11, 'Licenses', 'SoftwareLicense', '2010-02-16 13:18:12', '', NULL),
(12, 'Contracts', 'Contract', '2010-02-16 13:18:12', '', NULL),
(13, 'Password Forget', 'User', '2011-03-04 11:35:13', NULL, NULL),
(14, 'Ticket Satisfaction', 'Ticket', '2011-03-04 11:35:15', NULL, NULL),
(15, 'Item not unique', 'FieldUnicity', '2011-03-04 11:35:16', NULL, NULL),
(16, 'Crontask', 'Crontask', '2011-03-04 11:35:16', NULL, NULL),
(17, 'Problems', 'Problem', '2011-12-06 09:48:33', NULL, NULL),
(18, 'Planning recall', 'PlanningRecall', '2014-01-15 14:35:24', NULL, NULL),
(19, 'Changes', 'Change', '2014-06-18 08:02:07', NULL, NULL),
(20, 'Receiver errors', 'MailCollector', '2014-06-18 08:02:08', NULL, NULL),
(21, 'Projects', 'Project', '2014-06-18 08:02:09', NULL, NULL),
(22, 'Project Tasks', 'ProjectTask', '2014-06-18 08:02:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_notificationtemplatetranslations`
--

CREATE TABLE IF NOT EXISTS `glpi_notificationtemplatetranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `language` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `glpi_notificationtemplatetranslations`
--

INSERT INTO `glpi_notificationtemplatetranslations` (`id`, `notificationtemplates_id`, `language`, `subject`, `content_text`, `content_html`) VALUES
(1, 1, '', '##lang.dbconnection.title##', '##lang.dbconnection.delay## : ##dbconnection.delay##\n', '&lt;p&gt;##lang.dbconnection.delay## : ##dbconnection.delay##&lt;/p&gt;'),
(2, 2, '', '##reservation.action##', '======================================================================\n##lang.reservation.user##: ##reservation.user##\n##lang.reservation.item.name##: ##reservation.itemtype## - ##reservation.item.name##\n##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech## ##ENDIFreservation.tech##\n##lang.reservation.begin##: ##reservation.begin##\n##lang.reservation.end##: ##reservation.end##\n##lang.reservation.comment##: ##reservation.comment##\n======================================================================\n', '&lt;!-- description{ color: inherit; background: #ebebeb;border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; } --&gt;\n&lt;p&gt;&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.reservation.user##:&lt;/span&gt;##reservation.user##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.reservation.item.name##:&lt;/span&gt;##reservation.itemtype## - ##reservation.item.name##&lt;br /&gt;##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech####ENDIFreservation.tech##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.reservation.begin##:&lt;/span&gt; ##reservation.begin##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.reservation.end##:&lt;/span&gt;##reservation.end##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.reservation.comment##:&lt;/span&gt; ##reservation.comment##&lt;/p&gt;'),
(3, 3, '', '##reservation.action##  ##reservation.entity##', '##lang.reservation.entity## : ##reservation.entity## \n\n \n##FOREACHreservations## \n##lang.reservation.itemtype## : ##reservation.itemtype##\n\n ##lang.reservation.item## : ##reservation.item##\n \n ##reservation.url## \n\n ##ENDFOREACHreservations##', '&lt;p&gt;##lang.reservation.entity## : ##reservation.entity## &lt;br /&gt; &lt;br /&gt;\n##FOREACHreservations## &lt;br /&gt;##lang.reservation.itemtype## :  ##reservation.itemtype##&lt;br /&gt;\n ##lang.reservation.item## :  ##reservation.item##&lt;br /&gt; &lt;br /&gt;\n &lt;a href="##reservation.url##"&gt; ##reservation.url##&lt;/a&gt;&lt;br /&gt;\n ##ENDFOREACHreservations##&lt;/p&gt;'),
(4, 4, '', '##ticket.action## ##ticket.title##', ' ##IFticket.storestatus=5##\n ##lang.ticket.url## : ##ticket.urlapprove##\n ##lang.ticket.autoclosewarning##\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description## ##ENDIFticket.storestatus##\n ##ELSEticket.storestatus## ##lang.ticket.url## : ##ticket.url## ##ENDELSEticket.storestatus##\n\n ##lang.ticket.description##\n\n ##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.authors## : ##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors## ##ELSEticket.authors##--##ENDELSEticket.authors##\n ##lang.ticket.creationdate## : ##ticket.creationdate##\n ##lang.ticket.closedate## : ##ticket.closedate##\n ##lang.ticket.requesttype## : ##ticket.requesttype##\n##lang.ticket.item.name## : \n\n##FOREACHitems##\n\n ##IFticket.itemtype## \n  ##ticket.itemtype## - ##ticket.item.name## \n  ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model## \n  ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial##  \n  ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial## \n ##ENDIFticket.itemtype##\n\n##ENDFOREACHitems##\n##IFticket.assigntousers## ##lang.ticket.assigntousers## : ##ticket.assigntousers## ##ENDIFticket.assigntousers##\n ##lang.ticket.status## : ##ticket.status##\n##IFticket.assigntogroups## ##lang.ticket.assigntogroups## : ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##\n ##lang.ticket.urgency## : ##ticket.urgency##\n ##lang.ticket.impact## : ##ticket.impact##\n ##lang.ticket.priority## : ##ticket.priority##\n##IFticket.user.email## ##lang.ticket.user.email## : ##ticket.user.email ##ENDIFticket.user.email##\n##IFticket.category## ##lang.ticket.category## : ##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n ##lang.ticket.content## : ##ticket.content##\n ##IFticket.storestatus=6##\n\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description##\n ##ENDIFticket.storestatus##\n ##lang.ticket.numberoffollowups## : ##ticket.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.ticket.numberoftasks## : ##ticket.numberoftasks##\n\n##FOREACHtasks##\n\n [##task.date##] ##lang.task.isprivate## : ##task.isprivate##\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##', '<!-- description{ color: inherit; background: #ebebeb; border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; }    -->\n<div>##IFticket.storestatus=5##</div>\n<div>##lang.ticket.url## : <a href="##ticket.urlapprove##">##ticket.urlapprove##</a> <strong>&#160;</strong></div>\n<div><strong>##lang.ticket.autoclosewarning##</strong></div>\n<div><span style="color: #888888;"><strong><span style="text-decoration: underline;">##lang.ticket.solvedate##</span></strong></span> : ##ticket.solvedate##<br /><span style="text-decoration: underline; color: #888888;"><strong>##lang.ticket.solution.type##</strong></span> : ##ticket.solution.type##<br /><span style="text-decoration: underline; color: #888888;"><strong>##lang.ticket.solution.description##</strong></span> : ##ticket.solution.description## ##ENDIFticket.storestatus##</div>\n<div>##ELSEticket.storestatus## ##lang.ticket.url## : <a href="##ticket.url##">##ticket.url##</a> ##ENDELSEticket.storestatus##</div>\n<p class="description b"><strong>##lang.ticket.description##</strong></p>\n<p><span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.title##</span>&#160;:##ticket.title## <br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.authors##</span>&#160;:##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors##    ##ELSEticket.authors##--##ENDELSEticket.authors## <br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.creationdate##</span>&#160;:##ticket.creationdate## <br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.closedate##</span>&#160;:##ticket.closedate## <br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.requesttype##</span>&#160;:##ticket.requesttype##<br />\n<br /><span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.item.name##</span>&#160;: \n<p>##FOREACHitems##</p>\n<div class="description b">##IFticket.itemtype## ##ticket.itemtype##&#160;- ##ticket.item.name## ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model## ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial## ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype## </div><br />\n<p>##ENDFOREACHitems##</p>\n##IFticket.assigntousers## <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.assigntousers##</span>&#160;: ##ticket.assigntousers## ##ENDIFticket.assigntousers##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;">##lang.ticket.status## </span>&#160;: ##ticket.status##<br /> ##IFticket.assigntogroups## <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.assigntogroups##</span>&#160;: ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.urgency##</span>&#160;: ##ticket.urgency##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.impact##</span>&#160;: ##ticket.impact##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.priority##</span>&#160;: ##ticket.priority## <br /> ##IFticket.user.email##<span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.user.email##</span>&#160;: ##ticket.user.email ##ENDIFticket.user.email##    <br /> ##IFticket.category##<span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;">##lang.ticket.category## </span>&#160;:##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##    <br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.ticket.content##</span>&#160;: ##ticket.content##</p>\n<br />##IFticket.storestatus=6##<br /><span style="text-decoration: underline;"><strong><span style="color: #888888;">##lang.ticket.solvedate##</span></strong></span> : ##ticket.solvedate##<br /><span style="color: #888888;"><strong><span style="text-decoration: underline;">##lang.ticket.solution.type##</span></strong></span> : ##ticket.solution.type##<br /><span style="text-decoration: underline; color: #888888;"><strong>##lang.ticket.solution.description##</strong></span> : ##ticket.solution.description##<br />##ENDIFticket.storestatus##</p>\n<div class="description b">##lang.ticket.numberoffollowups##&#160;: ##ticket.numberoffollowups##</div>\n<p>##FOREACHfollowups##</p>\n<div class="description b"><br /> <strong> [##followup.date##] <em>##lang.followup.isprivate## : ##followup.isprivate## </em></strong><br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.followup.author## </span> ##followup.author##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.followup.description## </span> ##followup.description##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.followup.date## </span> ##followup.date##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.followup.requesttype## </span> ##followup.requesttype##</div>\n<p>##ENDFOREACHfollowups##</p>\n<div class="description b">##lang.ticket.numberoftasks##&#160;: ##ticket.numberoftasks##</div>\n<p>##FOREACHtasks##</p>\n<div class="description b"><br /> <strong> [##task.date##] <em>##lang.task.isprivate## : ##task.isprivate## </em></strong><br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.task.author##</span> ##task.author##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.task.description##</span> ##task.description##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.task.time##</span> ##task.time##<br /> <span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"> ##lang.task.category##</span> ##task.category##</div>\n<p>##ENDFOREACHtasks##</p>'),
(5, 12, '', '##contract.action##  ##contract.entity##', '##lang.contract.entity## : ##contract.entity##\n\n##FOREACHcontracts##\n##lang.contract.name## : ##contract.name##\n##lang.contract.number## : ##contract.number##\n##lang.contract.time## : ##contract.time##\n##IFcontract.type####lang.contract.type## : ##contract.type####ENDIFcontract.type##\n##contract.url##\n##ENDFOREACHcontracts##', '&lt;p&gt;##lang.contract.entity## : ##contract.entity##&lt;br /&gt;\n&lt;br /&gt;##FOREACHcontracts##&lt;br /&gt;##lang.contract.name## :\n##contract.name##&lt;br /&gt;\n##lang.contract.number## : ##contract.number##&lt;br /&gt;\n##lang.contract.time## : ##contract.time##&lt;br /&gt;\n##IFcontract.type####lang.contract.type## : ##contract.type##\n##ENDIFcontract.type##&lt;br /&gt;\n&lt;a href="##contract.url##"&gt;\n##contract.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcontracts##&lt;/p&gt;'),
(6, 5, '', '##ticket.action## ##ticket.title##', '##lang.ticket.url## : ##ticket.url## \n\n##lang.ticket.description## \n\n\n##lang.ticket.title##  :##ticket.title## \n\n##lang.ticket.authors##  :##IFticket.authors##\n##ticket.authors## ##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##   \n\n##IFticket.category## ##lang.ticket.category##  :##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n\n##lang.ticket.content##  : ##ticket.content##\n##IFticket.itemtype##\n##lang.ticket.item.name##  : ##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##', '&lt;div&gt;##lang.ticket.url## : &lt;a href="##ticket.url##"&gt;\n##ticket.url##&lt;/a&gt;&lt;/div&gt;\n&lt;div class="description b"&gt;\n##lang.ticket.description##&lt;/div&gt;\n&lt;p&gt;&lt;span\nstyle="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;\n##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title##\n&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;\n##lang.ticket.authors##&lt;/span&gt;\n##IFticket.authors## ##ticket.authors##\n##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;&#160\n;&lt;/span&gt;&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; &lt;/span&gt;\n##IFticket.category##&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;\n##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;\n##lang.ticket.content##&lt;/span&gt;&#160;:\n##ticket.content##&lt;br /&gt;##IFticket.itemtype##\n&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;\n##lang.ticket.item.name##&lt;/span&gt;&#160;:\n##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##&lt;/p&gt;'),
(15, 15, '', '##lang.unicity.action##', '##lang.unicity.entity## : ##unicity.entity## \n\n##lang.unicity.itemtype## : ##unicity.itemtype## \n\n##lang.unicity.message## : ##unicity.message## \n\n##lang.unicity.action_user## : ##unicity.action_user## \n\n##lang.unicity.action_type## : ##unicity.action_type## \n\n##lang.unicity.date## : ##unicity.date##', '&lt;p&gt;##lang.unicity.entity## : ##unicity.entity##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.itemtype## : ##unicity.itemtype##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.message## : ##unicity.message##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_user## : ##unicity.action_user##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_type## : ##unicity.action_type##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.date## : ##unicity.date##&lt;/p&gt;'),
(7, 7, '', '##ticket.action## ##ticket.title##', '##FOREACHvalidations##\n\n##IFvalidation.storestatus=2##\n##validation.submission.title##\n##lang.validation.commentsubmission## : ##validation.commentsubmission##\n##ENDIFvalidation.storestatus##\n##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##\n\n##lang.ticket.url## : ##ticket.urlvalidation##\n\n##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n##IFvalidation.commentvalidation##\n##lang.validation.commentvalidation## : ##validation.commentvalidation##\n##ENDIFvalidation.commentvalidation##\n##ENDFOREACHvalidations##', '&lt;div&gt;##FOREACHvalidations##&lt;/div&gt;\n&lt;p&gt;##IFvalidation.storestatus=2##&lt;/p&gt;\n&lt;div&gt;##validation.submission.title##&lt;/div&gt;\n&lt;div&gt;##lang.validation.commentsubmission## : ##validation.commentsubmission##&lt;/div&gt;\n&lt;div&gt;##ENDIFvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;&lt;/div&gt;\n&lt;div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href="##ticket.urlvalidation##"&gt; ##ticket.urlvalidation## &lt;/a&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;p&gt;##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n&lt;br /&gt; ##IFvalidation.commentvalidation##&lt;br /&gt; ##lang.validation.commentvalidation## :\n&#160; ##validation.commentvalidation##&lt;br /&gt; ##ENDIFvalidation.commentvalidation##\n&lt;br /&gt;##ENDFOREACHvalidations##&lt;/p&gt;'),
(8, 6, '', '##ticket.action## ##ticket.entity##', '##lang.ticket.entity## : ##ticket.entity##\n \n##FOREACHtickets##\n\n##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.status## : ##ticket.status##\n\n ##ticket.url## \n ##ENDFOREACHtickets##', '&lt;table class="tab_cadre" border="1" cellspacing="2" cellpadding="3"&gt;\n&lt;tbody&gt;\n&lt;tr&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.title##&lt;/span&gt;&lt;/td&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.attribution##&lt;/span&gt;&lt;/td&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td style="text-align: left;" width="auto" bgcolor="#cccccc"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##lang.ticket.content##&lt;/span&gt;&lt;/td&gt;\n&lt;/tr&gt;\n##FOREACHtickets##                   \n&lt;tr&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;&lt;a href="##ticket.url##"&gt;##ticket.title##&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##IFticket.assigntousers####ticket.assigntousers##&lt;br /&gt;##ENDIFticket.assigntousers####IFticket.assigntogroups##&lt;br /&gt;##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##&lt;br /&gt;##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##&lt;/span&gt;&lt;/td&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td width="auto"&gt;&lt;span style="font-size: 11px; text-align: left;"&gt;##ticket.content##&lt;/span&gt;&lt;/td&gt;\n&lt;/tr&gt;\n##ENDFOREACHtickets##\n&lt;/tbody&gt;\n&lt;/table&gt;'),
(9, 9, '', '##consumable.action##  ##consumable.entity##', '##lang.consumable.entity## : ##consumable.entity##\n \n\n##FOREACHconsumables##\n##lang.consumable.item## : ##consumable.item##\n \n\n##lang.consumable.reference## : ##consumable.reference##\n\n##lang.consumable.remaining## : ##consumable.remaining##\n\n##consumable.url## \n\n##ENDFOREACHconsumables##', '&lt;p&gt;\n##lang.consumable.entity## : ##consumable.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHconsumables##\n&lt;br /&gt;##lang.consumable.item## : ##consumable.item##&lt;br /&gt;\n&lt;br /&gt;##lang.consumable.reference## : ##consumable.reference##&lt;br /&gt;\n##lang.consumable.remaining## : ##consumable.remaining##&lt;br /&gt;\n&lt;a href="##consumable.url##"&gt; ##consumable.url##&lt;/a&gt;&lt;br /&gt;\n   ##ENDFOREACHconsumables##&lt;/p&gt;'),
(10, 8, '', '##cartridge.action##  ##cartridge.entity##', '##lang.cartridge.entity## : ##cartridge.entity##\n \n\n##FOREACHcartridges##\n##lang.cartridge.item## : ##cartridge.item##\n \n\n##lang.cartridge.reference## : ##cartridge.reference##\n\n##lang.cartridge.remaining## : ##cartridge.remaining##\n\n##cartridge.url## \n ##ENDFOREACHcartridges##', '&lt;p&gt;##lang.cartridge.entity## : ##cartridge.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHcartridges##\n&lt;br /&gt;##lang.cartridge.item## :\n##cartridge.item##&lt;br /&gt; &lt;br /&gt;\n##lang.cartridge.reference## :\n##cartridge.reference##&lt;br /&gt;\n##lang.cartridge.remaining## :\n##cartridge.remaining##&lt;br /&gt;\n&lt;a href="##cartridge.url##"&gt;\n##cartridge.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcartridges##&lt;/p&gt;'),
(11, 10, '', '##infocom.action##  ##infocom.entity##', '##lang.infocom.entity## : ##infocom.entity## \n \n\n##FOREACHinfocoms## \n\n##lang.infocom.itemtype## : ##infocom.itemtype##\n\n##lang.infocom.item## : ##infocom.item##\n \n\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n\n##infocom.url## \n ##ENDFOREACHinfocoms##', '&lt;p&gt;##lang.infocom.entity## : ##infocom.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHinfocoms##\n&lt;br /&gt;##lang.infocom.itemtype## : ##infocom.itemtype##&lt;br /&gt;\n##lang.infocom.item## : ##infocom.item##&lt;br /&gt; &lt;br /&gt;\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n&lt;br /&gt; &lt;a href="##infocom.url##"&gt;\n##infocom.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHinfocoms##&lt;/p&gt;'),
(12, 11, '', '##license.action##  ##license.entity##', '##lang.license.entity## : ##license.entity##\n\n##FOREACHlicenses## \n\n##lang.license.item## : ##license.item##\n\n##lang.license.serial## : ##license.serial##\n\n##lang.license.expirationdate## : ##license.expirationdate##\n\n##license.url## \n ##ENDFOREACHlicenses##', '&lt;p&gt;\n##lang.license.entity## : ##license.entity##&lt;br /&gt;\n##FOREACHlicenses##\n&lt;br /&gt;##lang.license.item## : ##license.item##&lt;br /&gt;\n##lang.license.serial## : ##license.serial##&lt;br /&gt;\n##lang.license.expirationdate## : ##license.expirationdate##\n&lt;br /&gt; &lt;a href="##license.url##"&gt; ##license.url##\n&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHlicenses##&lt;/p&gt;'),
(13, 13, '', '##user.action##', '##user.realname## ##user.firstname##\n\n##lang.passwordforget.information##\n\n##lang.passwordforget.link## ##user.passwordforgeturl##', '&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.information##&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.link## &lt;a title="##user.passwordforgeturl##" href="##user.passwordforgeturl##"&gt;##user.passwordforgeturl##&lt;/a&gt;&lt;/p&gt;'),
(14, 14, '', '##ticket.action## ##ticket.title##', '##lang.ticket.title## : ##ticket.title##\n\n##lang.ticket.closedate## : ##ticket.closedate##\n\n##lang.satisfaction.text## ##ticket.urlsatisfaction##', '&lt;p&gt;##lang.ticket.title## : ##ticket.title##&lt;/p&gt;\n&lt;p&gt;##lang.ticket.closedate## : ##ticket.closedate##&lt;/p&gt;\n&lt;p&gt;##lang.satisfaction.text## &lt;a href="##ticket.urlsatisfaction##"&gt;##ticket.urlsatisfaction##&lt;/a&gt;&lt;/p&gt;'),
(16, 16, '', '##crontask.action##', '##lang.crontask.warning## \n\n##FOREACHcrontasks## \n ##crontask.name## : ##crontask.description##\n \n##ENDFOREACHcrontasks##', '&lt;p&gt;##lang.crontask.warning##&lt;/p&gt;\n&lt;p&gt;##FOREACHcrontasks## &lt;br /&gt;&lt;a href="##crontask.url##"&gt;##crontask.name##&lt;/a&gt; : ##crontask.description##&lt;br /&gt; &lt;br /&gt;##ENDFOREACHcrontasks##&lt;/p&gt;'),
(17, 17, '', '##problem.action## ##problem.title##', '##IFproblem.storestatus=5##\n ##lang.problem.url## : ##problem.urlapprove##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description## ##ENDIFproblem.storestatus##\n ##ELSEproblem.storestatus## ##lang.problem.url## : ##problem.url## ##ENDELSEproblem.storestatus##\n\n ##lang.problem.description##\n\n ##lang.problem.title##  :##problem.title##\n ##lang.problem.authors##  :##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors## ##ELSEproblem.authors##--##ENDELSEproblem.authors##\n ##lang.problem.creationdate##  :##problem.creationdate##\n ##IFproblem.assigntousers## ##lang.problem.assigntousers##  : ##problem.assigntousers## ##ENDIFproblem.assigntousers##\n ##lang.problem.status##  : ##problem.status##\n ##IFproblem.assigntogroups## ##lang.problem.assigntogroups##  : ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##\n ##lang.problem.urgency##  : ##problem.urgency##\n ##lang.problem.impact##  : ##problem.impact##\n ##lang.problem.priority## : ##problem.priority##\n##IFproblem.category## ##lang.problem.category##  :##problem.category## ##ENDIFproblem.category## ##ELSEproblem.category## ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##\n ##lang.problem.content##  : ##problem.content##\n\n##IFproblem.storestatus=6##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description##\n##ENDIFproblem.storestatus##\n ##lang.problem.numberoftickets## : ##problem.numberoftickets##\n\n##FOREACHtickets##\n [##ticket.date##] ##lang.problem.title## : ##ticket.title##\n ##lang.problem.content## ##ticket.content##\n\n##ENDFOREACHtickets##\n ##lang.problem.numberoftasks## : ##problem.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n', '&lt;p&gt;##IFproblem.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.problem.url## : &lt;a href="##problem.urlapprove##"&gt;##problem.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style="color: #888888;"&gt;&lt;strong&gt;&lt;span style="text-decoration: underline;"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style="text-decoration: underline; color: #888888;"&gt;&lt;strong&gt;##lang.problem.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style="text-decoration: underline; color: #888888;"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description## ##ENDIFproblem.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEproblem.storestatus## ##lang.problem.url## : &lt;a href="##problem.url##"&gt;##problem.url##&lt;/a&gt; ##ENDELSEproblem.storestatus##&lt;/div&gt;\n&lt;p class="description b"&gt;&lt;strong&gt;##lang.problem.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.title##&lt;/span&gt;&#160;:##problem.title## &lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.authors##&lt;/span&gt;&#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors##    ##ELSEproblem.authors##--##ENDELSEproblem.authors## &lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.creationdate##&lt;/span&gt;&#160;:##problem.creationdate## &lt;br /&gt; ##IFproblem.assigntousers## &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.assigntousers##&lt;/span&gt;&#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.problem.status## &lt;/span&gt;&#160;: ##problem.status##&lt;br /&gt; ##IFproblem.assigntogroups## &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.assigntogroups##&lt;/span&gt;&#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.urgency##&lt;/span&gt;&#160;: ##problem.urgency##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.impact##&lt;/span&gt;&#160;: ##problem.impact##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.priority##&lt;/span&gt; : ##problem.priority## &lt;br /&gt;##IFproblem.category##&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.problem.category## &lt;/span&gt;&#160;:##problem.category##  ##ENDIFproblem.category## ##ELSEproblem.category##  ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##    &lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.problem.content##&lt;/span&gt;&#160;: ##problem.content##&lt;/p&gt;\n&lt;p&gt;##IFproblem.storestatus=6##&lt;br /&gt;&lt;span style="text-decoration: underline;"&gt;&lt;strong&gt;&lt;span style="color: #888888;"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style="color: #888888;"&gt;&lt;strong&gt;&lt;span style="text-decoration: underline;"&gt;##lang.problem.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style="text-decoration: underline; color: #888888;"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description##&lt;br /&gt;##ENDIFproblem.storestatus##&lt;/p&gt;\n&lt;div class="description b"&gt;##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##&lt;/div&gt;\n&lt;p&gt;##FOREACHtickets##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##ticket.date##] &lt;em&gt;##lang.problem.title## : &lt;a href="##ticket.url##"&gt;##ticket.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; &lt;/span&gt;&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.problem.content## &lt;/span&gt; ##ticket.content##\n&lt;p&gt;##ENDFOREACHtickets##&lt;/p&gt;\n&lt;div class="description b"&gt;##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class="description b"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(18, 18, '', '##recall.action##: ##recall.item.name##', '##recall.action##: ##recall.item.name##\n\n##recall.item.content##\n\n##lang.recall.planning.begin##: ##recall.planning.begin##\n##lang.recall.planning.end##: ##recall.planning.end##\n##lang.recall.planning.state##: ##recall.planning.state##\n##lang.recall.item.private##: ##recall.item.private##', '&lt;p&gt;##recall.action##: &lt;a href="##recall.item.url##"&gt;##recall.item.name##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;##recall.item.content##&lt;/p&gt;\n&lt;p&gt;##lang.recall.planning.begin##: ##recall.planning.begin##&lt;br /&gt;##lang.recall.planning.end##: ##recall.planning.end##&lt;br /&gt;##lang.recall.planning.state##: ##recall.planning.state##&lt;br /&gt;##lang.recall.item.private##: ##recall.item.private##&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;'),
(19, 19, '', '##change.action## ##change.title##', '##IFchange.storestatus=5##\n ##lang.change.url## : ##change.urlapprove##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description## ##ENDIFchange.storestatus##\n ##ELSEchange.storestatus## ##lang.change.url## : ##change.url## ##ENDELSEchange.storestatus##\n\n ##lang.change.description##\n\n ##lang.change.title##  :##change.title##\n ##lang.change.authors##  :##IFchange.authors## ##change.authors## ##ENDIFchange.authors## ##ELSEchange.authors##--##ENDELSEchange.authors##\n ##lang.change.creationdate##  :##change.creationdate##\n ##IFchange.assigntousers## ##lang.change.assigntousers##  : ##change.assigntousers## ##ENDIFchange.assigntousers##\n ##lang.change.status##  : ##change.status##\n ##IFchange.assigntogroups## ##lang.change.assigntogroups##  : ##change.assigntogroups## ##ENDIFchange.assigntogroups##\n ##lang.change.urgency##  : ##change.urgency##\n ##lang.change.impact##  : ##change.impact##\n ##lang.change.priority## : ##change.priority##\n##IFchange.category## ##lang.change.category##  :##change.category## ##ENDIFchange.category## ##ELSEchange.category## ##lang.change.nocategoryassigned## ##ENDELSEchange.category##\n ##lang.change.content##  : ##change.content##\n\n##IFchange.storestatus=6##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description##\n##ENDIFchange.storestatus##\n ##lang.change.numberofproblems## : ##change.numberofproblems##\n\n##FOREACHproblems##\n [##problem.date##] ##lang.change.title## : ##problem.title##\n ##lang.change.content## ##problem.content##\n\n##ENDFOREACHproblems##\n ##lang.change.numberoftasks## : ##change.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n', '&lt;p&gt;##IFchange.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.change.url## : &lt;a href="##change.urlapprove##"&gt;##change.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style="color: #888888;"&gt;&lt;strong&gt;&lt;span style="text-decoration: underline;"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style="text-decoration: underline; color: #888888;"&gt;&lt;strong&gt;##lang.change.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style="text-decoration: underline; color: #888888;"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description## ##ENDIFchange.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEchange.storestatus## ##lang.change.url## : &lt;a href="##change.url##"&gt;##change.url##&lt;/a&gt; ##ENDELSEchange.storestatus##&lt;/div&gt;\n&lt;p class="description b"&gt;&lt;strong&gt;##lang.change.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.title##&lt;/span&gt;&#160;:##change.title## &lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.authors##&lt;/span&gt;&#160;:##IFchange.authors## ##change.authors## ##ENDIFchange.authors##    ##ELSEchange.authors##--##ENDELSEchange.authors## &lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.creationdate##&lt;/span&gt;&#160;:##change.creationdate## &lt;br /&gt; ##IFchange.assigntousers## &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.assigntousers##&lt;/span&gt;&#160;: ##change.assigntousers## ##ENDIFchange.assigntousers##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.change.status## &lt;/span&gt;&#160;: ##change.status##&lt;br /&gt; ##IFchange.assigntogroups## &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.assigntogroups##&lt;/span&gt;&#160;: ##change.assigntogroups## ##ENDIFchange.assigntogroups##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.urgency##&lt;/span&gt;&#160;: ##change.urgency##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.impact##&lt;/span&gt;&#160;: ##change.impact##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.priority##&lt;/span&gt; : ##change.priority## &lt;br /&gt;##IFchange.category##&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.change.category## &lt;/span&gt;&#160;:##change.category##  ##ENDIFchange.category## ##ELSEchange.category##  ##lang.change.nocategoryassigned## ##ENDELSEchange.category##    &lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.change.content##&lt;/span&gt;&#160;: ##change.content##&lt;/p&gt;\n&lt;p&gt;##IFchange.storestatus=6##&lt;br /&gt;&lt;span style="text-decoration: underline;"&gt;&lt;strong&gt;&lt;span style="color: #888888;"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style="color: #888888;"&gt;&lt;strong&gt;&lt;span style="text-decoration: underline;"&gt;##lang.change.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style="text-decoration: underline; color: #888888;"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description##&lt;br /&gt;##ENDIFchange.storestatus##&lt;/p&gt;\n&lt;div class="description b"&gt;##lang.change.numberofproblems##&#160;: ##change.numberofproblems##&lt;/div&gt;\n&lt;p&gt;##FOREACHproblems##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##problem.date##] &lt;em&gt;##lang.change.title## : &lt;a href="##problem.url##"&gt;##problem.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; &lt;/span&gt;&lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt;##lang.change.content## &lt;/span&gt; ##problem.content##\n&lt;p&gt;##ENDFOREACHproblems##&lt;/p&gt;\n&lt;div class="description b"&gt;##lang.change.numberoftasks##&#160;: ##change.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class="description b"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style="color: #8b8c8f; font-weight: bold; text-decoration: underline;"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(20, 20, '', '##mailcollector.action##', '##FOREACHmailcollectors##\n##lang.mailcollector.name## : ##mailcollector.name##\n##lang.mailcollector.errors## : ##mailcollector.errors##\n##mailcollector.url##\n##ENDFOREACHmailcollectors##', '&lt;p&gt;##FOREACHmailcollectors##&lt;br /&gt;##lang.mailcollector.name## : ##mailcollector.name##&lt;br /&gt; ##lang.mailcollector.errors## : ##mailcollector.errors##&lt;br /&gt;&lt;a href="##mailcollector.url##"&gt;##mailcollector.url##&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHmailcollectors##&lt;/p&gt;\n&lt;p&gt;&lt;/p&gt;'),
(21, 21, '', '##project.action## ##project.name## ##project.code##', '##lang.project.url## : ##project.url##\n\n##lang.project.description##\n\n##lang.project.name## : ##project.name##\n##lang.project.code## : ##project.code##\n##lang.project.manager## : ##project.manager##\n##lang.project.managergroup## : ##project.managergroup##\n##lang.project.creationdate## : ##project.creationdate##\n##lang.project.priority## : ##project.priority##\n##lang.project.state## : ##project.state##\n##lang.project.type## : ##project.type##\n##lang.project.description## : ##project.description##\n\n##lang.project.numberoftasks## : ##project.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##', '&lt;p&gt;##lang.project.url## : &lt;a href="##project.url##"&gt;##project.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.project.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.project.name## : ##project.name##&lt;br /&gt;##lang.project.code## : ##project.code##&lt;br /&gt; ##lang.project.manager## : ##project.manager##&lt;br /&gt;##lang.project.managergroup## : ##project.managergroup##&lt;br /&gt; ##lang.project.creationdate## : ##project.creationdate##&lt;br /&gt;##lang.project.priority## : ##project.priority## &lt;br /&gt;##lang.project.state## : ##project.state##&lt;br /&gt;##lang.project.type## : ##project.type##&lt;br /&gt;##lang.project.description## : ##project.description##&lt;/p&gt;\n&lt;p&gt;##lang.project.numberoftasks## : ##project.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt; ##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(22, 22, '', '##projecttask.action## ##projecttask.name##', '##lang.projecttask.url## : ##projecttask.url##\n\n##lang.projecttask.description##\n\n##lang.projecttask.name## : ##projecttask.name##\n##lang.projecttask.project## : ##projecttask.name##\n##lang.projecttask.creationdate## : ##projecttask.creationdate##\n##lang.projecttask.state## : ##projecttask.state##\n##lang.projecttask.type## : ##projecttask.type##\n##lang.projecttask.description## : ##projecttask.description##\n\n##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##', '&lt;p&gt;##lang.projecttask.url## : &lt;a href="##projecttask.url##"&gt;##projecttask.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.projecttask.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.name## : ##projecttask.name##&lt;br /&gt;##lang.projecttask.project## : &lt;a href="##projecttask.projecturl##"&gt;##projecttask.name##&lt;/a&gt;&lt;br /&gt;##lang.projecttask.creationdate## : ##projecttask.creationdate##&lt;br /&gt;##lang.projecttask.state## : ##projecttask.state##&lt;br /&gt;##lang.projecttask.type## : ##projecttask.type##&lt;br /&gt;##lang.projecttask.description## : ##projecttask.description##&lt;/p&gt\n&lt;p&gt;##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt;##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_notimportedemails`
--

CREATE TABLE IF NOT EXISTS `glpi_notimportedemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `subject` text,
  `messageid` varchar(255) NOT NULL,
  `reason` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `mailcollectors_id` (`mailcollectors_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_operatingsystems`
--

CREATE TABLE IF NOT EXISTS `glpi_operatingsystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_operatingsystemservicepacks`
--

CREATE TABLE IF NOT EXISTS `glpi_operatingsystemservicepacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_operatingsystemversions`
--

CREATE TABLE IF NOT EXISTS `glpi_operatingsystemversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_peripheralmodels`
--

CREATE TABLE IF NOT EXISTS `glpi_peripheralmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_peripherals`
--

CREATE TABLE IF NOT EXISTS `glpi_peripherals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `peripheraltypes_id` int(11) NOT NULL DEFAULT '0',
  `peripheralmodels_id` int(11) NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `peripheralmodels_id` (`peripheralmodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `peripheraltypes_id` (`peripheraltypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_peripheraltypes`
--

CREATE TABLE IF NOT EXISTS `glpi_peripheraltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_phonemodels`
--

CREATE TABLE IF NOT EXISTS `glpi_phonemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_phonepowersupplies`
--

CREATE TABLE IF NOT EXISTS `glpi_phonepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_phones`
--

CREATE TABLE IF NOT EXISTS `glpi_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firmware` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `phonetypes_id` int(11) NOT NULL DEFAULT '0',
  `phonemodels_id` int(11) NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonepowersupplies_id` int(11) NOT NULL DEFAULT '0',
  `number_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_headset` tinyint(1) NOT NULL DEFAULT '0',
  `have_hp` tinyint(1) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `phonemodels_id` (`phonemodels_id`),
  KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `phonetypes_id` (`phonetypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_phonetypes`
--

CREATE TABLE IF NOT EXISTS `glpi_phonetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_planningrecalls`
--

CREATE TABLE IF NOT EXISTS `glpi_planningrecalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `before_time` int(11) NOT NULL DEFAULT '-10',
  `when` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `before_time` (`before_time`),
  KEY `when` (`when`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_plugins`
--

CREATE TABLE IF NOT EXISTS `glpi_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`directory`),
  KEY `state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_printermodels`
--

CREATE TABLE IF NOT EXISTS `glpi_printermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_printers`
--

CREATE TABLE IF NOT EXISTS `glpi_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_serial` tinyint(1) NOT NULL DEFAULT '0',
  `have_parallel` tinyint(1) NOT NULL DEFAULT '0',
  `have_usb` tinyint(1) NOT NULL DEFAULT '0',
  `have_wifi` tinyint(1) NOT NULL DEFAULT '0',
  `have_ethernet` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `memory_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `printertypes_id` int(11) NOT NULL DEFAULT '0',
  `printermodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `init_pages_counter` int(11) NOT NULL DEFAULT '0',
  `last_pages_counter` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `printermodels_id` (`printermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `printertypes_id` (`printertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `last_pages_counter` (`last_pages_counter`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_printertypes`
--

CREATE TABLE IF NOT EXISTS `glpi_printertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_problemcosts`
--

CREATE TABLE IF NOT EXISTS `glpi_problemcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `problems_id` (`problems_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_problems`
--

CREATE TABLE IF NOT EXISTS `glpi_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `content` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8_unicode_ci,
  `causecontent` longtext COLLATE utf8_unicode_ci,
  `symptomcontent` longtext COLLATE utf8_unicode_ci,
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `solution` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin_waiting_date` datetime DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `due_date` (`due_date`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_problems`
--

INSERT INTO `glpi_problems` (`id`, `name`, `entities_id`, `is_recursive`, `is_deleted`, `status`, `content`, `date_mod`, `date`, `solvedate`, `closedate`, `due_date`, `users_id_recipient`, `users_id_lastupdater`, `urgency`, `impact`, `priority`, `itilcategories_id`, `impactcontent`, `causecontent`, `symptomcontent`, `solutiontypes_id`, `solution`, `actiontime`, `begin_waiting_date`, `waiting_duration`, `close_delay_stat`, `solve_delay_stat`) VALUES
(1, 'compu dañada', 0, 0, 0, 2, 'lalalalala', '2015-11-01 22:45:29', '2015-11-01 22:43:00', NULL, NULL, NULL, 2, 2, 3, 3, 3, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_problems_suppliers`
--

CREATE TABLE IF NOT EXISTS `glpi_problems_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_problems_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_problems_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_problems_users`
--

CREATE TABLE IF NOT EXISTS `glpi_problems_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `glpi_problems_users`
--

INSERT INTO `glpi_problems_users` (`id`, `problems_id`, `users_id`, `type`, `use_notification`, `alternative_email`) VALUES
(1, 1, 2, 1, 0, ''),
(2, 1, 2, 3, 0, ''),
(3, 1, 4, 2, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_problemtasks`
--

CREATE TABLE IF NOT EXISTS `glpi_problemtasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `problems_id` (`problems_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `state` (`state`),
  KEY `taskcategories_id` (`taskcategories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_profilerights`
--

CREATE TABLE IF NOT EXISTS `glpi_profilerights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rights` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`profiles_id`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=750 ;

--
-- Volcado de datos para la tabla `glpi_profilerights`
--

INSERT INTO `glpi_profilerights` (`id`, `profiles_id`, `name`, `rights`) VALUES
(1, 1, 'computer', 0),
(2, 1, 'monitor', 0),
(3, 1, 'software', 0),
(4, 1, 'networking', 0),
(5, 1, 'internet', 0),
(6, 1, 'printer', 0),
(7, 1, 'peripheral', 0),
(8, 1, 'cartridge', 0),
(9, 1, 'consumable', 0),
(10, 1, 'phone', 0),
(734, 6, 'queuedmail', 0),
(12, 1, 'contact_enterprise', 0),
(13, 1, 'document', 0),
(14, 1, 'contract', 0),
(15, 1, 'infocom', 0),
(16, 1, 'knowbase', 2048),
(20, 1, 'reservation', 1024),
(21, 1, 'reports', 0),
(22, 1, 'dropdown', 0),
(24, 1, 'device', 0),
(25, 1, 'typedoc', 0),
(26, 1, 'link', 0),
(27, 1, 'config', 0),
(29, 1, 'rule_ticket', 0),
(30, 1, 'rule_import', 0),
(31, 1, 'rule_ldap', 0),
(32, 1, 'rule_softwarecategories', 0),
(33, 1, 'search_config', 0),
(684, 5, 'location', 0),
(679, 7, 'domain', 31),
(36, 1, 'profile', 0),
(37, 1, 'user', 0),
(39, 1, 'group', 0),
(40, 1, 'entity', 0),
(41, 1, 'transfer', 0),
(42, 1, 'logs', 0),
(43, 1, 'reminder_public', 1),
(44, 1, 'rssfeed_public', 1),
(45, 1, 'bookmark_public', 0),
(46, 1, 'backup', 0),
(47, 1, 'ticket', 5),
(51, 1, 'followup', 5),
(52, 1, 'task', 1),
(64, 1, 'planning', 0),
(716, 2, 'state', 0),
(709, 2, 'taskcategory', 0),
(67, 1, 'statistic', 0),
(68, 1, 'password_update', 1),
(70, 1, 'show_group_hardware', 0),
(71, 1, 'rule_dictionnary_software', 0),
(72, 1, 'rule_dictionnary_dropdown', 0),
(73, 1, 'budget', 0),
(75, 1, 'notification', 0),
(76, 1, 'rule_mailcollector', 0),
(728, 7, 'solutiontemplate', 31),
(79, 1, 'calendar', 0),
(80, 1, 'sla', 0),
(81, 1, 'rule_dictionnary_printer', 0),
(85, 1, 'problem', 0),
(702, 2, 'netpoint', 0),
(697, 4, 'knowbasecategory', 31),
(691, 5, 'itilcategory', 0),
(89, 1, 'tickettemplate', 0),
(90, 1, 'ticketrecurrent', 0),
(91, 1, 'ticketcost', 1),
(671, 6, 'changevalidation', 20),
(94, 1, 'ticketvalidation', 0),
(95, 2, 'computer', 33),
(96, 2, 'monitor', 33),
(97, 2, 'software', 33),
(98, 2, 'networking', 33),
(99, 2, 'internet', 1),
(100, 2, 'printer', 33),
(101, 2, 'peripheral', 33),
(102, 2, 'cartridge', 33),
(103, 2, 'consumable', 33),
(104, 2, 'phone', 33),
(733, 5, 'queuedmail', 0),
(106, 2, 'contact_enterprise', 33),
(107, 2, 'document', 33),
(108, 2, 'contract', 33),
(109, 2, 'infocom', 1),
(110, 2, 'knowbase', 2049),
(114, 2, 'reservation', 1025),
(115, 2, 'reports', 1),
(116, 2, 'dropdown', 0),
(118, 2, 'device', 0),
(119, 2, 'typedoc', 1),
(120, 2, 'link', 1),
(121, 2, 'config', 0),
(123, 2, 'rule_ticket', 0),
(124, 2, 'rule_import', 0),
(125, 2, 'rule_ldap', 0),
(126, 2, 'rule_softwarecategories', 0),
(127, 2, 'search_config', 1055),
(683, 4, 'location', 31),
(678, 6, 'domain', 0),
(130, 2, 'profile', 0),
(131, 2, 'user', 2049),
(133, 2, 'group', 1),
(134, 2, 'entity', 32),
(135, 2, 'transfer', 0),
(136, 2, 'logs', 0),
(137, 2, 'reminder_public', 0),
(138, 2, 'rssfeed_public', 0),
(139, 2, 'bookmark_public', 0),
(140, 2, 'backup', 1024),
(141, 2, 'ticket', 37917),
(145, 2, 'followup', 5),
(146, 2, 'task', 1),
(748, 6, 'projecttask', 1025),
(749, 7, 'projecttask', 1025),
(158, 2, 'planning', 1),
(715, 1, 'state', 0),
(708, 1, 'taskcategory', 0),
(161, 2, 'statistic', 1),
(162, 2, 'password_update', 1),
(164, 2, 'show_group_hardware', 0),
(165, 2, 'rule_dictionnary_software', 0),
(166, 2, 'rule_dictionnary_dropdown', 0),
(167, 2, 'budget', 33),
(169, 2, 'notification', 0),
(170, 2, 'rule_mailcollector', 0),
(726, 5, 'solutiontemplate', 0),
(727, 6, 'solutiontemplate', 0),
(173, 2, 'calendar', 0),
(174, 2, 'sla', 0),
(175, 2, 'rule_dictionnary_printer', 0),
(179, 2, 'problem', 1057),
(701, 1, 'netpoint', 0),
(696, 3, 'knowbasecategory', 31),
(690, 4, 'itilcategory', 31),
(183, 2, 'tickettemplate', 0),
(184, 2, 'ticketrecurrent', 0),
(185, 2, 'ticketcost', 1),
(669, 4, 'changevalidation', 1044),
(670, 5, 'changevalidation', 20),
(188, 2, 'ticketvalidation', 15384),
(189, 3, 'computer', 127),
(190, 3, 'monitor', 127),
(191, 3, 'software', 127),
(192, 3, 'networking', 127),
(193, 3, 'internet', 31),
(194, 3, 'printer', 127),
(195, 3, 'peripheral', 127),
(196, 3, 'cartridge', 127),
(197, 3, 'consumable', 127),
(198, 3, 'phone', 127),
(732, 4, 'queuedmail', 31),
(200, 3, 'contact_enterprise', 127),
(201, 3, 'document', 127),
(202, 3, 'contract', 127),
(203, 3, 'infocom', 31),
(204, 3, 'knowbase', 6175),
(208, 3, 'reservation', 1055),
(209, 3, 'reports', 1),
(210, 3, 'dropdown', 31),
(212, 3, 'device', 31),
(213, 3, 'typedoc', 31),
(214, 3, 'link', 31),
(215, 3, 'config', 0),
(217, 3, 'rule_ticket', 0),
(218, 3, 'rule_import', 0),
(219, 3, 'rule_ldap', 0),
(220, 3, 'rule_softwarecategories', 0),
(221, 3, 'search_config', 3103),
(682, 3, 'location', 31),
(677, 5, 'domain', 0),
(224, 3, 'profile', 1),
(225, 3, 'user', 7199),
(227, 3, 'group', 31),
(228, 3, 'entity', 96),
(229, 3, 'transfer', 0),
(230, 3, 'logs', 0),
(231, 3, 'reminder_public', 0),
(232, 3, 'rssfeed_public', 0),
(233, 3, 'bookmark_public', 0),
(234, 3, 'backup', 1024),
(235, 3, 'ticket', 128031),
(239, 3, 'followup', 15383),
(240, 3, 'task', 13329),
(745, 3, 'projecttask', 1025),
(746, 4, 'projecttask', 1025),
(747, 5, 'projecttask', 0),
(252, 3, 'planning', 3073),
(714, 7, 'taskcategory', 31),
(707, 7, 'netpoint', 31),
(255, 3, 'statistic', 1),
(256, 3, 'password_update', 1),
(258, 3, 'show_group_hardware', 0),
(259, 3, 'rule_dictionnary_software', 0),
(260, 3, 'rule_dictionnary_dropdown', 0),
(261, 3, 'budget', 127),
(263, 3, 'notification', 0),
(264, 3, 'rule_mailcollector', 0),
(724, 3, 'solutiontemplate', 31),
(725, 4, 'solutiontemplate', 31),
(267, 3, 'calendar', 31),
(268, 3, 'sla', 0),
(269, 3, 'rule_dictionnary_printer', 0),
(273, 3, 'problem', 1151),
(695, 2, 'knowbasecategory', 0),
(689, 3, 'itilcategory', 31),
(277, 3, 'tickettemplate', 0),
(278, 3, 'ticketrecurrent', 0),
(279, 3, 'ticketcost', 31),
(667, 2, 'changevalidation', 1044),
(668, 3, 'changevalidation', 1044),
(282, 3, 'ticketvalidation', 15384),
(283, 4, 'computer', 127),
(284, 4, 'monitor', 127),
(285, 4, 'software', 127),
(286, 4, 'networking', 127),
(287, 4, 'internet', 31),
(288, 4, 'printer', 127),
(289, 4, 'peripheral', 127),
(290, 4, 'cartridge', 127),
(291, 4, 'consumable', 127),
(292, 4, 'phone', 127),
(294, 4, 'contact_enterprise', 127),
(295, 4, 'document', 127),
(296, 4, 'contract', 127),
(297, 4, 'infocom', 31),
(298, 4, 'knowbase', 7199),
(302, 4, 'reservation', 1055),
(303, 4, 'reports', 1),
(304, 4, 'dropdown', 31),
(306, 4, 'device', 31),
(307, 4, 'typedoc', 31),
(308, 4, 'link', 31),
(309, 4, 'config', 31),
(311, 4, 'rule_ticket', 1055),
(312, 4, 'rule_import', 31),
(313, 4, 'rule_ldap', 31),
(314, 4, 'rule_softwarecategories', 31),
(315, 4, 'search_config', 3103),
(681, 2, 'location', 0),
(676, 4, 'domain', 31),
(318, 4, 'profile', 31),
(319, 4, 'user', 7199),
(321, 4, 'group', 31),
(322, 4, 'entity', 3199),
(323, 4, 'transfer', 31),
(324, 4, 'logs', 1),
(325, 4, 'reminder_public', 31),
(326, 4, 'rssfeed_public', 31),
(327, 4, 'bookmark_public', 31),
(328, 4, 'backup', 1055),
(329, 4, 'ticket', 128031),
(333, 4, 'followup', 15383),
(334, 4, 'task', 13329),
(742, 7, 'project', 1151),
(743, 1, 'projecttask', 0),
(744, 2, 'projecttask', 1025),
(346, 4, 'planning', 3073),
(713, 6, 'taskcategory', 0),
(706, 6, 'netpoint', 0),
(349, 4, 'statistic', 1),
(350, 4, 'password_update', 1),
(352, 4, 'show_group_hardware', 0),
(353, 4, 'rule_dictionnary_software', 31),
(354, 4, 'rule_dictionnary_dropdown', 31),
(355, 4, 'budget', 127),
(357, 4, 'notification', 31),
(358, 4, 'rule_mailcollector', 31),
(722, 1, 'solutiontemplate', 0),
(723, 2, 'solutiontemplate', 0),
(361, 4, 'calendar', 31),
(362, 4, 'sla', 31),
(363, 4, 'rule_dictionnary_printer', 31),
(367, 4, 'problem', 1151),
(694, 1, 'knowbasecategory', 0),
(688, 2, 'itilcategory', 0),
(371, 4, 'tickettemplate', 31),
(372, 4, 'ticketrecurrent', 31),
(373, 4, 'ticketcost', 31),
(665, 7, 'change', 1151),
(666, 1, 'changevalidation', 0),
(376, 4, 'ticketvalidation', 15384),
(377, 5, 'computer', 0),
(378, 5, 'monitor', 0),
(379, 5, 'software', 0),
(380, 5, 'networking', 0),
(381, 5, 'internet', 0),
(382, 5, 'printer', 0),
(383, 5, 'peripheral', 0),
(384, 5, 'cartridge', 0),
(385, 5, 'consumable', 0),
(386, 5, 'phone', 0),
(731, 3, 'queuedmail', 0),
(388, 5, 'contact_enterprise', 0),
(389, 5, 'document', 0),
(390, 5, 'contract', 0),
(391, 5, 'infocom', 0),
(392, 5, 'knowbase', 0),
(396, 5, 'reservation', 0),
(397, 5, 'reports', 0),
(398, 5, 'dropdown', 0),
(400, 5, 'device', 0),
(401, 5, 'typedoc', 0),
(402, 5, 'link', 0),
(403, 5, 'config', 0),
(405, 5, 'rule_ticket', 0),
(406, 5, 'rule_import', 0),
(407, 5, 'rule_ldap', 0),
(408, 5, 'rule_softwarecategories', 0),
(409, 5, 'search_config', 0),
(680, 1, 'location', 0),
(675, 3, 'domain', 31),
(412, 5, 'profile', 0),
(413, 5, 'user', 1025),
(415, 5, 'group', 0),
(416, 5, 'entity', 0),
(417, 5, 'transfer', 0),
(418, 5, 'logs', 0),
(419, 5, 'reminder_public', 0),
(420, 5, 'rssfeed_public', 0),
(421, 5, 'bookmark_public', 0),
(422, 5, 'backup', 0),
(423, 5, 'ticket', 9223),
(427, 5, 'followup', 12295),
(428, 5, 'task', 8193),
(739, 4, 'project', 1151),
(740, 5, 'project', 1150),
(741, 6, 'project', 1151),
(440, 5, 'planning', 1),
(712, 5, 'taskcategory', 0),
(705, 5, 'netpoint', 0),
(443, 5, 'statistic', 1),
(444, 5, 'password_update', 1),
(446, 5, 'show_group_hardware', 0),
(447, 5, 'rule_dictionnary_software', 0),
(448, 5, 'rule_dictionnary_dropdown', 0),
(449, 5, 'budget', 0),
(451, 5, 'notification', 0),
(452, 5, 'rule_mailcollector', 0),
(720, 6, 'state', 0),
(721, 7, 'state', 31),
(455, 5, 'calendar', 0),
(456, 5, 'sla', 0),
(457, 5, 'rule_dictionnary_printer', 0),
(461, 5, 'problem', 1024),
(700, 7, 'knowbasecategory', 31),
(687, 1, 'itilcategory', 0),
(465, 5, 'tickettemplate', 1),
(466, 5, 'ticketrecurrent', 0),
(467, 5, 'ticketcost', 31),
(663, 5, 'change', 1054),
(664, 6, 'change', 1151),
(470, 5, 'ticketvalidation', 3088),
(471, 6, 'computer', 127),
(472, 6, 'monitor', 127),
(473, 6, 'software', 127),
(474, 6, 'networking', 127),
(475, 6, 'internet', 31),
(476, 6, 'printer', 127),
(477, 6, 'peripheral', 127),
(478, 6, 'cartridge', 127),
(479, 6, 'consumable', 127),
(480, 6, 'phone', 127),
(730, 2, 'queuedmail', 0),
(482, 6, 'contact_enterprise', 96),
(483, 6, 'document', 127),
(484, 6, 'contract', 96),
(485, 6, 'infocom', 0),
(486, 6, 'knowbase', 6175),
(490, 6, 'reservation', 1055),
(491, 6, 'reports', 1),
(492, 6, 'dropdown', 0),
(494, 6, 'device', 0),
(495, 6, 'typedoc', 0),
(496, 6, 'link', 0),
(497, 6, 'config', 0),
(499, 6, 'rule_ticket', 0),
(500, 6, 'rule_import', 0),
(501, 6, 'rule_ldap', 0),
(502, 6, 'rule_softwarecategories', 0),
(503, 6, 'search_config', 0),
(674, 2, 'domain', 0),
(506, 6, 'profile', 0),
(507, 6, 'user', 1055),
(509, 6, 'group', 1),
(510, 6, 'entity', 97),
(511, 6, 'transfer', 1),
(512, 6, 'logs', 0),
(513, 6, 'reminder_public', 31),
(514, 6, 'rssfeed_public', 31),
(515, 6, 'bookmark_public', 0),
(516, 6, 'backup', 0),
(517, 6, 'ticket', 37895),
(521, 6, 'followup', 13319),
(522, 6, 'task', 13329),
(736, 1, 'project', 0),
(737, 2, 'project', 1025),
(738, 3, 'project', 1151),
(534, 6, 'planning', 1),
(711, 4, 'taskcategory', 31),
(704, 4, 'netpoint', 31),
(537, 6, 'statistic', 1),
(538, 6, 'password_update', 1),
(540, 6, 'show_group_hardware', 0),
(541, 6, 'rule_dictionnary_software', 0),
(542, 6, 'rule_dictionnary_dropdown', 0),
(543, 6, 'budget', 96),
(545, 6, 'notification', 0),
(546, 6, 'rule_mailcollector', 0),
(718, 4, 'state', 31),
(719, 5, 'state', 0),
(549, 6, 'calendar', 0),
(550, 6, 'sla', 1),
(551, 6, 'rule_dictionnary_printer', 0),
(555, 6, 'problem', 1121),
(699, 6, 'knowbasecategory', 0),
(693, 7, 'itilcategory', 31),
(686, 7, 'location', 31),
(559, 6, 'tickettemplate', 1),
(560, 6, 'ticketrecurrent', 1),
(561, 6, 'ticketcost', 31),
(661, 3, 'change', 1151),
(662, 4, 'change', 1151),
(564, 6, 'ticketvalidation', 3088),
(565, 7, 'computer', 127),
(566, 7, 'monitor', 127),
(567, 7, 'software', 127),
(568, 7, 'networking', 127),
(569, 7, 'internet', 31),
(570, 7, 'printer', 127),
(571, 7, 'peripheral', 127),
(572, 7, 'cartridge', 127),
(573, 7, 'consumable', 127),
(574, 7, 'phone', 127),
(729, 1, 'queuedmail', 0),
(576, 7, 'contact_enterprise', 96),
(577, 7, 'document', 127),
(578, 7, 'contract', 96),
(579, 7, 'infocom', 0),
(580, 7, 'knowbase', 6175),
(584, 7, 'reservation', 1055),
(585, 7, 'reports', 1),
(586, 7, 'dropdown', 0),
(588, 7, 'device', 0),
(589, 7, 'typedoc', 0),
(590, 7, 'link', 0),
(591, 7, 'config', 0),
(593, 7, 'rule_ticket', 1055),
(594, 7, 'rule_import', 0),
(595, 7, 'rule_ldap', 0),
(596, 7, 'rule_softwarecategories', 0),
(597, 7, 'search_config', 0),
(673, 1, 'domain', 0),
(600, 7, 'profile', 0),
(601, 7, 'user', 1055),
(603, 7, 'group', 1),
(604, 7, 'entity', 97),
(605, 7, 'transfer', 1),
(606, 7, 'logs', 1),
(607, 7, 'reminder_public', 31),
(608, 7, 'rssfeed_public', 31),
(609, 7, 'bookmark_public', 0),
(610, 7, 'backup', 0),
(611, 7, 'ticket', 128031),
(615, 7, 'followup', 13335),
(616, 7, 'task', 13329),
(735, 7, 'queuedmail', 0),
(628, 7, 'planning', 2049),
(710, 3, 'taskcategory', 31),
(703, 3, 'netpoint', 31),
(631, 7, 'statistic', 1),
(632, 7, 'password_update', 1),
(634, 7, 'show_group_hardware', 0),
(635, 7, 'rule_dictionnary_software', 0),
(636, 7, 'rule_dictionnary_dropdown', 0),
(637, 7, 'budget', 96),
(639, 7, 'notification', 0),
(640, 7, 'rule_mailcollector', 31),
(672, 7, 'changevalidation', 1044),
(717, 3, 'state', 31),
(643, 7, 'calendar', 31),
(644, 7, 'sla', 31),
(645, 7, 'rule_dictionnary_printer', 0),
(649, 7, 'problem', 1151),
(698, 5, 'knowbasecategory', 0),
(692, 6, 'itilcategory', 0),
(685, 6, 'location', 0),
(653, 7, 'tickettemplate', 31),
(654, 7, 'ticketrecurrent', 31),
(655, 7, 'ticketcost', 31),
(659, 1, 'change', 0),
(660, 2, 'change', 1057),
(658, 7, 'ticketvalidation', 15384);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_profiles`
--

CREATE TABLE IF NOT EXISTS `glpi_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interface` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'helpdesk',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `helpdesk_hardware` int(11) NOT NULL DEFAULT '0',
  `helpdesk_item_type` text COLLATE utf8_unicode_ci,
  `ticket_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `problem_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint(1) NOT NULL DEFAULT '0',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `change_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  PRIMARY KEY (`id`),
  KEY `interface` (`interface`),
  KEY `is_default` (`is_default`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `glpi_profiles`
--

INSERT INTO `glpi_profiles` (`id`, `name`, `interface`, `is_default`, `helpdesk_hardware`, `helpdesk_item_type`, `ticket_status`, `date_mod`, `comment`, `problem_status`, `create_ticket_on_login`, `tickettemplates_id`, `change_status`) VALUES
(1, 'Self-Service', 'helpdesk', 1, 1, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '{"1":{"2":0,"3":0,"4":0,"5":0,"6":0},"2":{"1":0,"3":0,"4":0,"5":0,"6":0},"3":{"1":0,"2":0,"4":0,"5":0,"6":0},"4":{"1":0,"2":0,"3":0,"5":0,"6":0},"5":{"1":0,"2":0,"3":0,"4":0},"6":{"1":0,"2":0,"3":0,"4":0,"5":0}}', NULL, NULL, '[]', 0, 0, NULL),
(2, 'Observer', 'central', 0, 1, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '[]', NULL, NULL, '[]', 0, 0, NULL),
(3, 'Admin', 'central', 0, 3, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '[]', NULL, NULL, '[]', 0, 0, NULL),
(4, 'Super-Admin', 'central', 0, 3, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '[]', NULL, NULL, '[]', 0, 0, NULL),
(5, 'Hotliner', 'central', 0, 3, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '[]', NULL, NULL, '[]', 1, 0, NULL),
(6, 'Technician', 'central', 0, 3, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '[]', NULL, NULL, '[]', 0, 0, NULL),
(7, 'Supervisor', 'central', 0, 3, '["Computer","Monitor","NetworkEquipment","Peripheral","Phone","Printer","Software"]', '[]', NULL, NULL, '[]', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_profiles_reminders`
--

CREATE TABLE IF NOT EXISTS `glpi_profiles_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_profiles_rssfeeds`
--

CREATE TABLE IF NOT EXISTS `glpi_profiles_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_profiles_users`
--

CREATE TABLE IF NOT EXISTS `glpi_profiles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `users_id` (`users_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `glpi_profiles_users`
--

INSERT INTO `glpi_profiles_users` (`id`, `users_id`, `profiles_id`, `entities_id`, `is_recursive`, `is_dynamic`) VALUES
(2, 2, 4, 0, 1, 0),
(3, 3, 1, 0, 1, 0),
(4, 4, 6, 0, 1, 0),
(5, 5, 2, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projectcosts`
--

CREATE TABLE IF NOT EXISTS `glpi_projectcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `projects_id` (`projects_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projects`
--

CREATE TABLE IF NOT EXISTS `glpi_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `projectstates_id` int(11) NOT NULL DEFAULT '0',
  `projecttypes_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `plan_start_date` datetime DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `real_start_date` datetime DEFAULT NULL,
  `real_end_date` datetime DEFAULT NULL,
  `percent_done` int(11) NOT NULL DEFAULT '0',
  `show_on_global_gantt` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttypes_id` (`projecttypes_id`),
  KEY `priority` (`priority`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `show_on_global_gantt` (`show_on_global_gantt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projectstates`
--

CREATE TABLE IF NOT EXISTS `glpi_projectstates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_finished` (`is_finished`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `glpi_projectstates`
--

INSERT INTO `glpi_projectstates` (`id`, `name`, `comment`, `color`, `is_finished`) VALUES
(1, 'New', NULL, '#06ff00', 0),
(2, 'Processing', NULL, '#ffb800', 0),
(3, 'Closed', NULL, '#ff0000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projecttasks`
--

CREATE TABLE IF NOT EXISTS `glpi_projecttasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `plan_start_date` datetime DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `real_start_date` datetime DEFAULT NULL,
  `real_end_date` datetime DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT '0',
  `effective_duration` int(11) NOT NULL DEFAULT '0',
  `projectstates_id` int(11) NOT NULL DEFAULT '0',
  `projecttasktypes_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `percent_done` int(11) NOT NULL DEFAULT '0',
  `is_milestone` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projecttasks_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_projecttasks_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  KEY `projects_id` (`projecttasks_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projecttaskteams`
--

CREATE TABLE IF NOT EXISTS `glpi_projecttaskteams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projecttasktypes`
--

CREATE TABLE IF NOT EXISTS `glpi_projecttasktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projectteams`
--

CREATE TABLE IF NOT EXISTS `glpi_projectteams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_projecttypes`
--

CREATE TABLE IF NOT EXISTS `glpi_projecttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_queuedmails`
--

CREATE TABLE IF NOT EXISTS `glpi_queuedmails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `sent_try` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `sender` text COLLATE utf8_unicode_ci,
  `sendername` text COLLATE utf8_unicode_ci,
  `recipient` text COLLATE utf8_unicode_ci,
  `recipientname` text COLLATE utf8_unicode_ci,
  `replyto` text COLLATE utf8_unicode_ci,
  `replytoname` text COLLATE utf8_unicode_ci,
  `headers` text COLLATE utf8_unicode_ci,
  `body_html` longtext COLLATE utf8_unicode_ci,
  `body_text` longtext COLLATE utf8_unicode_ci,
  `messageid` text COLLATE utf8_unicode_ci,
  `documents` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `entities_id` (`entities_id`),
  KEY `sent_try` (`sent_try`),
  KEY `create_time` (`create_time`),
  KEY `send_time` (`send_time`),
  KEY `sent_time` (`sent_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_registeredids`
--

CREATE TABLE IF NOT EXISTS `glpi_registeredids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'USB, PCI ...',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`items_id`,`itemtype`),
  KEY `device_type` (`device_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_reminders`
--

CREATE TABLE IF NOT EXISTS `glpi_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `is_planned` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `begin_view_date` datetime DEFAULT NULL,
  `end_view_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `is_planned` (`is_planned`),
  KEY `state` (`state`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_reminders_users`
--

CREATE TABLE IF NOT EXISTS `glpi_reminders_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_requesttypes`
--

CREATE TABLE IF NOT EXISTS `glpi_requesttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_helpdesk_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail_default` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_helpdesk_default` (`is_helpdesk_default`),
  KEY `is_mail_default` (`is_mail_default`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `glpi_requesttypes`
--

INSERT INTO `glpi_requesttypes` (`id`, `name`, `is_helpdesk_default`, `is_mail_default`, `comment`) VALUES
(1, 'Helpdesk', 1, 0, NULL),
(2, 'E-Mail', 0, 1, NULL),
(3, 'Phone', 0, 0, NULL),
(4, 'Direct', 0, 0, NULL),
(5, 'Written', 0, 0, NULL),
(6, 'Other', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_reservationitems`
--

CREATE TABLE IF NOT EXISTS `glpi_reservationitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_reservations`
--

CREATE TABLE IF NOT EXISTS `glpi_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationitems_id` int(11) NOT NULL DEFAULT '0',
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `group` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `reservationitems_id` (`reservationitems_id`),
  KEY `users_id` (`users_id`),
  KEY `resagroup` (`reservationitems_id`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_rssfeeds`
--

CREATE TABLE IF NOT EXISTS `glpi_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `refresh_rate` int(11) NOT NULL DEFAULT '86400',
  `max_items` int(11) NOT NULL DEFAULT '20',
  `have_error` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `have_error` (`have_error`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_rssfeeds_users`
--

CREATE TABLE IF NOT EXISTS `glpi_rssfeeds_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ruleactions`
--

CREATE TABLE IF NOT EXISTS `glpi_ruleactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `field_value` (`field`(50),`value`(50))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `glpi_ruleactions`
--

INSERT INTO `glpi_ruleactions` (`id`, `rules_id`, `action_type`, `field`, `value`) VALUES
(6, 6, 'fromitem', 'locations_id', '1'),
(2, 2, 'assign', 'entities_id', '0'),
(3, 3, 'assign', 'entities_id', '0'),
(4, 4, 'assign', '_refuse_email_no_response', '1'),
(5, 5, 'assign', '_refuse_email_no_response', '1'),
(7, 7, 'fromuser', 'locations_id', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_rulecriterias`
--

CREATE TABLE IF NOT EXISTS `glpi_rulecriterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `condition` (`condition`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `glpi_rulecriterias`
--

INSERT INTO `glpi_rulecriterias` (`id`, `rules_id`, `criteria`, `condition`, `pattern`) VALUES
(9, 6, 'locations_id', 9, '1'),
(2, 2, 'uid', 0, '*'),
(3, 2, 'samaccountname', 0, '*'),
(4, 2, 'MAIL_EMAIL', 0, '*'),
(5, 3, 'subject', 6, '/.*/'),
(6, 4, 'x-auto-response-suppress', 6, '/\\S+/'),
(7, 5, 'auto-submitted', 6, '/\\S+/'),
(8, 5, 'auto-submitted', 1, 'no'),
(10, 6, 'items_locations', 8, '1'),
(11, 7, 'locations_id', 9, '1'),
(12, 7, 'users_locations', 8, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_rulerightparameters`
--

CREATE TABLE IF NOT EXISTS `glpi_rulerightparameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `glpi_rulerightparameters`
--

INSERT INTO `glpi_rulerightparameters` (`id`, `name`, `value`, `comment`) VALUES
(1, '(LDAP)Organization', 'o', ''),
(2, '(LDAP)Common Name', 'cn', ''),
(3, '(LDAP)Department Number', 'departmentnumber', ''),
(4, '(LDAP)Email', 'mail', ''),
(5, 'Object Class', 'objectclass', ''),
(6, '(LDAP)User ID', 'uid', ''),
(7, '(LDAP)Telephone Number', 'phone', ''),
(8, '(LDAP)Employee Number', 'employeenumber', ''),
(9, '(LDAP)Manager', 'manager', ''),
(10, '(LDAP)DistinguishedName', 'dn', ''),
(12, '(AD)User ID', 'samaccountname', ''),
(13, '(LDAP) Title', 'title', ''),
(14, '(LDAP) MemberOf', 'memberof', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_rules`
--

CREATE TABLE IF NOT EXISTS `glpi_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `sub_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `match` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `sub_type` (`sub_type`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `condition` (`condition`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `glpi_rules`
--

INSERT INTO `glpi_rules` (`id`, `entities_id`, `sub_type`, `ranking`, `name`, `description`, `match`, `is_active`, `comment`, `date_mod`, `is_recursive`, `uuid`, `condition`) VALUES
(2, 0, 'RuleRight', 1, 'Root', '', 'OR', 1, NULL, NULL, 0, '500717c8-2bd6e957-53a12b5fd35745.02608131', 0),
(3, 0, 'RuleMailCollector', 3, 'Root', '', 'OR', 1, NULL, NULL, 0, '500717c8-2bd6e957-53a12b5fd36404.54713349', 0),
(4, 0, 'RuleMailCollector', 1, 'Auto-Reply X-Auto-Response-Suppress', 'Exclude Auto-Reply emails using X-Auto-Response-Suppress header', 'AND', 1, NULL, '2011-01-18 11:40:42', 1, '500717c8-2bd6e957-53a12b5fd36d97.94503423', 0),
(5, 0, 'RuleMailCollector', 2, 'Auto-Reply Auto-Submitted', 'Exclude Auto-Reply emails using Auto-Submitted header', 'AND', 1, NULL, '2011-01-18 11:40:42', 1, '500717c8-2bd6e957-53a12b5fd376c2.87642651', 0),
(6, 0, 'RuleTicket', 1, 'Ticket location from item', '', 'AND', 0, 'Automatically generated by GLPI 0.84', NULL, 1, '500717c8-2bd6e957-53a12b5fd37f94.10365341', 1),
(7, 0, 'RuleTicket', 2, 'Ticket location from user', '', 'AND', 0, 'Automatically generated by GLPI 0.84', NULL, 1, '500717c8-2bd6e957-53a12b5fd38869.86002585', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_slalevelactions`
--

CREATE TABLE IF NOT EXISTS `glpi_slalevelactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_slalevelcriterias`
--

CREATE TABLE IF NOT EXISTS `glpi_slalevelcriterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_slalevels`
--

CREATE TABLE IF NOT EXISTS `glpi_slalevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slas_id` int(11) NOT NULL DEFAULT '0',
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `match` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `slas_id` (`slas_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_slalevels_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_slalevels_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_slas`
--

CREATE TABLE IF NOT EXISTS `glpi_slas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `resolution_time` int(11) NOT NULL,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `definition_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_of_working_day` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `calendars_id` (`calendars_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_softwarecategories`
--

CREATE TABLE IF NOT EXISTS `glpi_softwarecategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `softwarecategories_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `softwarecategories_id` (`softwarecategories_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_softwarecategories`
--

INSERT INTO `glpi_softwarecategories` (`id`, `name`, `comment`, `softwarecategories_id`, `completename`, `level`, `ancestors_cache`, `sons_cache`) VALUES
(1, 'FUSION', NULL, 0, 'FUSION', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_softwarelicenses`
--

CREATE TABLE IF NOT EXISTS `glpi_softwarelicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `softwarelicensetypes_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `softwareversions_id_buy` int(11) NOT NULL DEFAULT '0',
  `softwareversions_id_use` int(11) NOT NULL DEFAULT '0',
  `expire` date DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `expire` (`expire`),
  KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  KEY `entities_id` (`entities_id`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `softwareversions_id_use` (`softwareversions_id_use`),
  KEY `date_mod` (`date_mod`),
  KEY `softwares_id_expire` (`softwares_id`,`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_softwarelicensetypes`
--

CREATE TABLE IF NOT EXISTS `glpi_softwarelicensetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_softwarelicensetypes`
--

INSERT INTO `glpi_softwarelicensetypes` (`id`, `name`, `comment`) VALUES
(1, 'OEM', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_softwares`
--

CREATE TABLE IF NOT EXISTS `glpi_softwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_update` tinyint(1) NOT NULL DEFAULT '0',
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_helpdesk_visible` tinyint(1) NOT NULL DEFAULT '1',
  `softwarecategories_id` int(11) NOT NULL DEFAULT '0',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_update` (`is_update`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `softwares_id` (`softwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_softwareversions`
--

CREATE TABLE IF NOT EXISTS `glpi_softwareversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `operatingsystems_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `softwares_id` (`softwares_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `operatingsystems_id` (`operatingsystems_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_solutiontemplates`
--

CREATE TABLE IF NOT EXISTS `glpi_solutiontemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_solutiontypes`
--

CREATE TABLE IF NOT EXISTS `glpi_solutiontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ssovariables`
--

CREATE TABLE IF NOT EXISTS `glpi_ssovariables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `glpi_ssovariables`
--

INSERT INTO `glpi_ssovariables` (`id`, `name`, `comment`) VALUES
(1, 'HTTP_AUTH_USER', ''),
(2, 'REMOTE_USER', ''),
(3, 'PHP_AUTH_USER', ''),
(4, 'USERNAME', ''),
(5, 'REDIRECT_REMOTE_USER', ''),
(6, 'HTTP_REMOTE_USER', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_states`
--

CREATE TABLE IF NOT EXISTS `glpi_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `states_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_visible_computer` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_monitor` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_networkequipment` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_peripheral` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_phone` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_printer` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_softwareversion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `unicity` (`states_id`,`name`),
  KEY `is_visible_computer` (`is_visible_computer`),
  KEY `is_visible_monitor` (`is_visible_monitor`),
  KEY `is_visible_networkequipment` (`is_visible_networkequipment`),
  KEY `is_visible_peripheral` (`is_visible_peripheral`),
  KEY `is_visible_phone` (`is_visible_phone`),
  KEY `is_visible_printer` (`is_visible_printer`),
  KEY `is_visible_softwareversion` (`is_visible_softwareversion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_suppliers`
--

CREATE TABLE IF NOT EXISTS `glpi_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliertypes_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `suppliertypes_id` (`suppliertypes_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_suppliers_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_suppliers_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_suppliertypes`
--

CREATE TABLE IF NOT EXISTS `glpi_suppliertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_taskcategories`
--

CREATE TABLE IF NOT EXISTS `glpi_taskcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_helpdeskvisible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ticketcosts`
--

CREATE TABLE IF NOT EXISTS `glpi_ticketcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tickets_id` (`tickets_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ticketfollowups`
--

CREATE TABLE IF NOT EXISTS `glpi_ticketfollowups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `requesttypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `users_id` (`users_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `requesttypes_id` (`requesttypes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ticketrecurrents`
--

CREATE TABLE IF NOT EXISTS `glpi_ticketrecurrents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `begin_date` datetime DEFAULT NULL,
  `periodicity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT '0',
  `next_creation_date` datetime DEFAULT NULL,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `next_creation_date` (`next_creation_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `requesttypes_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `solution` longtext COLLATE utf8_unicode_ci,
  `global_validation` int(11) NOT NULL DEFAULT '1',
  `slas_id` int(11) NOT NULL DEFAULT '0',
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `due_date` datetime DEFAULT NULL,
  `begin_waiting_date` datetime DEFAULT NULL,
  `sla_waiting_duration` int(11) NOT NULL DEFAULT '0',
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  `takeintoaccount_delay_stat` int(11) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `validation_percent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `request_type` (`requesttypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `global_validation` (`global_validation`),
  KEY `slas_id` (`slas_id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `due_date` (`due_date`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `type` (`type`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `name` (`name`),
  KEY `locations_id` (`locations_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickets_tickets`
--

CREATE TABLE IF NOT EXISTS `glpi_tickets_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id_1` int(11) NOT NULL DEFAULT '0',
  `tickets_id_2` int(11) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `unicity` (`tickets_id_1`,`tickets_id_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickets_users`
--

CREATE TABLE IF NOT EXISTS `glpi_tickets_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ticketsatisfactions`
--

CREATE TABLE IF NOT EXISTS `glpi_ticketsatisfactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `date_begin` datetime DEFAULT NULL,
  `date_answered` datetime DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_id` (`tickets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickettasks`
--

CREATE TABLE IF NOT EXISTS `glpi_tickettasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `users_id` (`users_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `state` (`state`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `begin` (`begin`),
  KEY `end` (`end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickettemplatehiddenfields`
--

CREATE TABLE IF NOT EXISTS `glpi_tickettemplatehiddenfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickettemplatemandatoryfields`
--

CREATE TABLE IF NOT EXISTS `glpi_tickettemplatemandatoryfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_tickettemplatemandatoryfields`
--

INSERT INTO `glpi_tickettemplatemandatoryfields` (`id`, `tickettemplates_id`, `num`) VALUES
(1, 1, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickettemplatepredefinedfields`
--

CREATE TABLE IF NOT EXISTS `glpi_tickettemplatepredefinedfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_tickettemplates`
--

CREATE TABLE IF NOT EXISTS `glpi_tickettemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_tickettemplates`
--

INSERT INTO `glpi_tickettemplates` (`id`, `name`, `entities_id`, `is_recursive`, `comment`) VALUES
(1, 'Default', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_ticketvalidations`
--

CREATE TABLE IF NOT EXISTS `glpi_ticketvalidations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id_validate` int(11) NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8_unicode_ci,
  `comment_validation` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '2',
  `submission_date` datetime DEFAULT NULL,
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `tickets_id` (`tickets_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_transfers`
--

CREATE TABLE IF NOT EXISTS `glpi_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keep_ticket` int(11) NOT NULL DEFAULT '0',
  `keep_networklink` int(11) NOT NULL DEFAULT '0',
  `keep_reservation` int(11) NOT NULL DEFAULT '0',
  `keep_history` int(11) NOT NULL DEFAULT '0',
  `keep_device` int(11) NOT NULL DEFAULT '0',
  `keep_infocom` int(11) NOT NULL DEFAULT '0',
  `keep_dc_monitor` int(11) NOT NULL DEFAULT '0',
  `clean_dc_monitor` int(11) NOT NULL DEFAULT '0',
  `keep_dc_phone` int(11) NOT NULL DEFAULT '0',
  `clean_dc_phone` int(11) NOT NULL DEFAULT '0',
  `keep_dc_peripheral` int(11) NOT NULL DEFAULT '0',
  `clean_dc_peripheral` int(11) NOT NULL DEFAULT '0',
  `keep_dc_printer` int(11) NOT NULL DEFAULT '0',
  `clean_dc_printer` int(11) NOT NULL DEFAULT '0',
  `keep_supplier` int(11) NOT NULL DEFAULT '0',
  `clean_supplier` int(11) NOT NULL DEFAULT '0',
  `keep_contact` int(11) NOT NULL DEFAULT '0',
  `clean_contact` int(11) NOT NULL DEFAULT '0',
  `keep_contract` int(11) NOT NULL DEFAULT '0',
  `clean_contract` int(11) NOT NULL DEFAULT '0',
  `keep_software` int(11) NOT NULL DEFAULT '0',
  `clean_software` int(11) NOT NULL DEFAULT '0',
  `keep_document` int(11) NOT NULL DEFAULT '0',
  `clean_document` int(11) NOT NULL DEFAULT '0',
  `keep_cartridgeitem` int(11) NOT NULL DEFAULT '0',
  `clean_cartridgeitem` int(11) NOT NULL DEFAULT '0',
  `keep_cartridge` int(11) NOT NULL DEFAULT '0',
  `keep_consumable` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `keep_disk` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `glpi_transfers`
--

INSERT INTO `glpi_transfers` (`id`, `name`, `keep_ticket`, `keep_networklink`, `keep_reservation`, `keep_history`, `keep_device`, `keep_infocom`, `keep_dc_monitor`, `clean_dc_monitor`, `keep_dc_phone`, `clean_dc_phone`, `keep_dc_peripheral`, `clean_dc_peripheral`, `keep_dc_printer`, `clean_dc_printer`, `keep_supplier`, `clean_supplier`, `keep_contact`, `clean_contact`, `keep_contract`, `clean_contract`, `keep_software`, `clean_software`, `keep_document`, `clean_document`, `keep_cartridgeitem`, `clean_cartridgeitem`, `keep_cartridge`, `keep_consumable`, `date_mod`, `comment`, `keep_disk`) VALUES
(1, 'complete', 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_usercategories`
--

CREATE TABLE IF NOT EXISTS `glpi_usercategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_useremails`
--

CREATE TABLE IF NOT EXISTS `glpi_useremails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`email`),
  KEY `email` (`email`),
  KEY `is_default` (`is_default`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_users`
--

CREATE TABLE IF NOT EXISTS `glpi_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `language` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int(11) NOT NULL DEFAULT '0',
  `list_limit` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `auths_id` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_sync` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `usertitles_id` int(11) NOT NULL DEFAULT '0',
  `usercategories_id` int(11) NOT NULL DEFAULT '0',
  `date_format` int(11) DEFAULT NULL,
  `number_format` int(11) DEFAULT NULL,
  `names_format` int(11) DEFAULT NULL,
  `csv_delimiter` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_ids_visible` tinyint(1) DEFAULT NULL,
  `dropdown_chars_limit` int(11) DEFAULT NULL,
  `use_flat_dropdowntree` tinyint(1) DEFAULT NULL,
  `show_jobs_at_login` tinyint(1) DEFAULT NULL,
  `priority_1` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_2` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_3` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_4` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_5` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_6` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `followup_private` tinyint(1) DEFAULT NULL,
  `task_private` tinyint(1) DEFAULT NULL,
  `default_requesttypes_id` int(11) DEFAULT NULL,
  `password_forget_token` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_forget_token_date` datetime DEFAULT NULL,
  `user_dn` text COLLATE utf8_unicode_ci,
  `registration_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_count_on_tabs` tinyint(1) DEFAULT NULL,
  `refresh_ticket_list` int(11) DEFAULT NULL,
  `set_default_tech` tinyint(1) DEFAULT NULL,
  `personal_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_token_date` datetime DEFAULT NULL,
  `display_count_on_home` int(11) DEFAULT NULL,
  `notification_to_myself` tinyint(1) DEFAULT NULL,
  `duedateok_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatewarning_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatecritical_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatewarning_less` int(11) DEFAULT NULL,
  `duedatecritical_less` int(11) DEFAULT NULL,
  `duedatewarning_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatecritical_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_options` text COLLATE utf8_unicode_ci,
  `is_deleted_ldap` tinyint(1) NOT NULL DEFAULT '0',
  `pdffont` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint(1) DEFAULT NULL,
  `privatebookmarkorder` longtext COLLATE utf8_unicode_ci,
  `backcreated` tinyint(1) DEFAULT NULL,
  `task_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `firstname` (`firstname`),
  KEY `realname` (`realname`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `locations_id` (`locations_id`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `usercategories_id` (`usercategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `authitem` (`authtype`,`auths_id`),
  KEY `is_deleted_ldap` (`is_deleted_ldap`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `glpi_users`
--

INSERT INTO `glpi_users` (`id`, `name`, `password`, `phone`, `phone2`, `mobile`, `realname`, `firstname`, `locations_id`, `language`, `use_mode`, `list_limit`, `is_active`, `comment`, `auths_id`, `authtype`, `last_login`, `date_mod`, `date_sync`, `is_deleted`, `profiles_id`, `entities_id`, `usertitles_id`, `usercategories_id`, `date_format`, `number_format`, `names_format`, `csv_delimiter`, `is_ids_visible`, `dropdown_chars_limit`, `use_flat_dropdowntree`, `show_jobs_at_login`, `priority_1`, `priority_2`, `priority_3`, `priority_4`, `priority_5`, `priority_6`, `followup_private`, `task_private`, `default_requesttypes_id`, `password_forget_token`, `password_forget_token_date`, `user_dn`, `registration_number`, `show_count_on_tabs`, `refresh_ticket_list`, `set_default_tech`, `personal_token`, `personal_token_date`, `display_count_on_home`, `notification_to_myself`, `duedateok_color`, `duedatewarning_color`, `duedatecritical_color`, `duedatewarning_less`, `duedatecritical_less`, `duedatewarning_unit`, `duedatecritical_unit`, `display_options`, `is_deleted_ldap`, `pdffont`, `picture`, `begin_date`, `end_date`, `keep_devices_when_purging_item`, `privatebookmarkorder`, `backcreated`, `task_state`) VALUES
(2, 'glpi', '$2y$10$HLHLyBHMRYCwwWpUjAGR2egMoYjCDna.OwySzxaZtuNRJr1gOPh7a', '', '', '', '', NULL, 0, NULL, 0, 20, 1, NULL, 0, 1, '2015-11-01 22:19:30', '2015-11-01 22:19:30', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'post-only', '3177926a7314de24680a9938aaa97703', '', '', '', '', NULL, 0, NULL, 0, 20, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'tech', '$2y$10$nHLoc795zX3FvT3fyVBOBeFOx6zO21.pnuhC4vYVXsdKNEt63K3vS', '', '', '', '', NULL, 0, NULL, 0, 20, 1, NULL, 0, 1, '2015-11-08 21:01:24', '2015-11-01 23:01:48', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '8n5xrdjuwwm4cn93gdg5vviys07i13j9qn6h1pbxl', '2015-11-01 23:01:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'normal', 'fea087517c26fadd409bd4b9dc642555', '', '', '', '', NULL, 0, NULL, 0, 20, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_usertitles`
--

CREATE TABLE IF NOT EXISTS `glpi_usertitles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_virtualmachinestates`
--

CREATE TABLE IF NOT EXISTS `glpi_virtualmachinestates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_virtualmachinesystems`
--

CREATE TABLE IF NOT EXISTS `glpi_virtualmachinesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_virtualmachinetypes`
--

CREATE TABLE IF NOT EXISTS `glpi_virtualmachinetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_vlans`
--

CREATE TABLE IF NOT EXISTS `glpi_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `tag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glpi_wifinetworks`
--

CREATE TABLE IF NOT EXISTS `glpi_wifinetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `essid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ad-hoc, access_point',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `essid` (`essid`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
--
-- Base de datos: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'AtlasCRM_development', 'rols', 'created_at', '', '', '_', ''),
(2, 'AtlasCRM_development', 'rols', 'updated_at', '', '', '_', ''),
(3, 'AtlasCRM_development', 'opciones_por_rols', 'created_at', '', '', '_', ''),
(4, 'AtlasCRM_development', 'opciones_por_rols', 'updated_at', '', '', '_', ''),
(5, 'AtlasCRM_development', 'usuarios', 'foto', '', '', '_', ''),
(6, 'AtlasCRM_development', 'usuarios', 'created_at', '', '', '_', ''),
(7, 'AtlasCRM_development', 'usuarios', 'updated_at', '', '', '_', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"AtlasCRM_development","table":"opcion_menus"},{"db":"AtlasCRM_development","table":"rols"},{"db":"AtlasCRM_development","table":"usuarios"},{"db":"AtlasCRM_development","table":"opciones_por_rols"},{"db":"primero","table":"arbols"},{"db":"primero","table":"estudiantes"},{"db":"primero","table":"mensajes"},{"db":"primero","table":"usuarios"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2015-09-02 18:31:23', '{"lang":"es"}');
--
-- Base de datos: `primero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbols`
--

CREATE TABLE IF NOT EXISTS `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `text` varchar(25) NOT NULL DEFAULT '',
  `vinculo` varchar(100) NOT NULL DEFAULT '',
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `arbols`
--

INSERT INTO `arbols` (`id`, `tipo`, `text`, `vinculo`, `padre_id`) VALUES
(10, 1, 'Administrador', '', 0),
(11, 1, 'Actualizar usuarios', 'javascript:menu(0)', 10),
(12, 1, 'Cambiar plantillas', 'javascript:menu(1)', 10),
(13, 1, 'Crear BD', 'javascript:menu(2)', 10),
(14, 2, 'Mayorista', '', 0),
(15, 2, 'Crear Transportistas', '', 14),
(16, 2, 'Indicadores1', 'ejemplo01', 15),
(17, 2, 'Indicadores2', 'ejemplo02', 15),
(18, 2, 'Indicadores3', '', 15),
(19, 2, 'Indicadores31', 'ejemplo03', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idestado` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `idestado`, `nombre`) VALUES
(1, 1, 'Alto Orinoco'),
(2, 1, 'Maroa'),
(3, 1, 'Pto. Ayacucho'),
(4, 2, 'Anaco'),
(5, 2, 'Pto. La Cruz'),
(6, 3, 'Barquisimeto'),
(7, 3, 'Cabudare'),
(8, 3, 'Carora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE IF NOT EXISTS `clases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semana` varchar(2) NOT NULL,
  `objetivo` text NOT NULL,
  `padre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id`, `semana`, `objetivo`, `padre`) VALUES
(1, '01', 'Presentacion de la Asignatura', 0),
(2, '01', 'Practica de HTML', 1),
(3, '01', 'Practica de JavaScript', 1),
(4, '01', 'Practica de Css', 1),
(5, '02', 'Curso de Sun Java Studio Creator', 0),
(6, '02', 'Sesion 01', 5),
(7, '02', 'Sesion 02', 5),
(8, '03', 'Mer del Sistema', 0),
(9, '03', 'Diseno Detallado', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`) VALUES
(1, 'Amazonas'),
(2, 'Anzoategui'),
(3, 'Lara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL DEFAULT '',
  `na` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `celular` varchar(20) NOT NULL DEFAULT '',
  `formato` varchar(30) NOT NULL DEFAULT '',
  `foto` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `cedula`, `na`, `email`, `celular`, `formato`, `foto`) VALUES
(1, '21000000', 'Edgar Gonzalez', 'egonzale@ucla.edu.ve', '04263546772', 'data:image/jpeg;base64,', 0xffd8ffe000104a46494600010101004800480000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108001e002003012200021101031101ffc4001800010003010000000000000000000000000605070804ffc400281000020201040103040301000000000000010203041100051221063141510713147122326191ffc400190100020301000000000000000000000000010500020406ffc4002211000103020603000000000000000000000100020311310405124161a1132191ffda000c03010002110311003f00bd4749eba093fd58f1c8ed257aa6c5b0eb912a2ac680f7d132b2e0f5faec77ae5fab5bb6e15361869d349960b2cdf973c79c2c63038b1c7418b7c8cf123b04ea928d16575451c989002e7b24fa003d4e92b9d4b2e9328c9e2c547e599d7b0af6569ad9fc8ab6f12490fd992a5b4e47f1ac14fb8c818a970159b2bc8119ff003e08266fbceb3d51abbe59db64f24378539f6c7582a01570ef8c2f0c281d7614020e4e41c0ce5f7d37f24f23dee7bf16eea6c4101c0b9f6d632926403115000271dfc8f7fecba8c24801d7e12ec6e12381c446f078f7d1a50fd4bb7ed9137bdb6cc1cda39da19228dc31001642bfc80f51de71fa3ea060ec1041b778c538770915569c508675cf5246578e06324f35185c649eb1eda77a88de761adbe529aac8f3572e558cf5df848a5595810704672a3b23af6d12ddc2cd14ba46975907a35ebcde57523682589a44748ac4d5258a69e5014873ca255051524c609e98f43246ac7ab5a3a95d608f3c17dc9c9249c93ff750b43c4e0a7b9d7bcd7edd99202e624944688ac4712d88d17278960339c723a45f3a22bbaacae0ea0160bfffd9);
INSERT INTO `estudiantes` (`id`, `cedula`, `na`, `email`, `celular`, `formato`, `foto`) VALUES
(2, '22000000', 'Camila Gonzalez', 'camila@ucla.edu.ve', '04124589511', 'data:image/jpeg;base64,', 0xffd8ffe000104a46494600010200006400640000ffec00114475636b79000100040000003c0000ffee000e41646f62650064c000000001ffdb0084000604040405040605050609060506090b080606080b0c0a0a0b0a0a0c100c0c0c0c0c0c100c0e0f100f0e0c1313141413131c1b1b1b1c1f1f1f1f1f1f1f1f1f1f010707070d0c0d181010181a1511151a1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1fffc000110801ce01d003011100021101031101ffc400c3000001050101010000000000000000000004000203050607010801000301010101000000000000000000000003040205010610000103030104060604080a0705050900020003040112052232421306115262231407213172334324518253154192637393342516617181d1a283d394350891a1b1b2b34454d2a3552656c1e1c28418c36474b47585362737110100020202020101050507040203000000010211032104311213514161223214f091d152057181b1c1427233a1e1f182d215e22324ffda000c03010002110311003f00e121d7487760f041b098165b23db4038100f402da4345b3b6280480943610090d16d1eca011fb2b020f041b07d9beb020edf41b0562c84c0080758b2d9e1b0807d8868f407806b061e8047ecad82faa8062c03ececa01232de727805c8c8f4c88659bb402c4c8b5b0b58f8471fdbb812e652dbb385dc1e5b73e2ba562c648b76d64d60581d8214652dbb22c30805f1457b045bb02c3949b7f41be299096db50c8f2ddc2d6d3ad9add9453b6cbe4f9573904af01230ec296d55d4df952ce7b25142c744ac454d9ba9cf36e0ef12aaba3d8a9943f7f4bbb68ac5a9eb60a8da3a3f323e3b04973af06c761611f99c08838ab13d7c1b1b054b811670f1a390de97338323629644636ac54fb9d5d886f313d947ba9aec2343387b78207a3cbd00af403c36100af402403d00900900ac4347a030601a5745f3707820d8101b0b2d959a900ff61008010090d1fddf6901e1f6100f004024345bdb4804b020fb0d06c251b16041e08360fb37d64105e8070076965b3f710090d2604079db5830fbfb0807ad831008d601588021a66e2da4acbcb4e17b8fe5e7dfec23296ddac34707030581d9bcd66652dbb332b3038a3db4a994d6b648e4efda200b3963d0cfbd581d000268c8f88f0cdb97ee8026c31f0a5fded7e18d96b2f2640fd38291e65f02ce2c6b3f28cadb31d6c070f3171cf959c7d7db47a9b1c219d988af86b684c14bb7f09b1763f33cbd8e9c46f63cb82f7d99fbb5575b79b12c54b6654374c1d6ac5646dca5980fe30c4ef14c8d792a65284fbbac06b3b2326c6c6a0261e3188eef1efe37c350df564d8d89bc7b72a3dfb08f436bb0444302d16de668f4535d895dc6f757ec2145772bdd8c61b028535ba2e09f50900e00b500f402403d00900900acb500f434700203040bab2f99810c9da97264250d8596cb74d00c403c100af5a6ce407a0b2f20e41b07a018807d8b020f041b0702c083c36d06c2559048040668660fdf41907d8b2d9e17a03c0586cf0ec201fad0f4acb900e00dc44cb7691d071a6f958095329ad76ab1984618db1d6b33282db97c0c80fb0953296d70d224b7768dc586c29bcf9688e28067809cf8dee958086b21dd878d69dbdd9365881926b25cb2d680e23c7f66029b963289d920e91fcb11fb628c8caaa7437df2b02358b75d8dc4b3991e58962379b1f88a9aec4bba149e3f2b8cd1c5230fb334ec658ce0ff00deadf0b811fa5cbdfd5606b59e6273563a226955d667ea32ad910f0db6d3a4caaab519c84fd8c2761c923fc9dab5f1333b3079f33639a2f080c15e1d747c454f6f0763f2b0673fc19138a0fd9e9eec113a45bb0be82f3f8c997bae8bccd9ddcb0f766953a8dd5b57b1f2adca8fa4b5de95357469b728a5c9b88f4a54d57523204ef130d4497951ea699b88cbcf8c82f34c327560eb10549eb2d1e804080706c201e805b1ba80c1002eacbe6e12b269726408bee1596c81008d00b7100969b20d268094165e41e083608fd9403100f0db58107820d84a3b0b020f041b075fb8b208c2e40441b68660405e8320f596cf040786b0d9e0807fd5d087a41ab46a405ae3203ee9ebd84a996764b57061b627dd254cb99b6eb2006da0d0b3329706bcf5c766d9fd9a54c8f431de03017bbfa305a6c248cdf086c8ad588017c366677da58686323e0f293023f35aff00268195986371cc7c2105ee59ca0973208ec0a3232a991322ed85d7ad56ad52597cce55bea97d7555682f0c664f24041ada13f6095d58c23b4e59f79e885ac06c5556f84b6a6411c97d83bda2d847c6f738171f2a0fe83df47a8f9f063d0eed8dcf76b596276642043b655e648c9735c91b36c8bf6d132f32d372f3dc769dc5c82ee5e0bdbec389532bf454c893df8aed971683b12a6add36e176d6540afbcb5a5cd5753b982fbe1bb3bd114af88faf704479f11f0bf60d1f0aaaf6846def251f1d9c9d5dc41b1c9e0b2d1e80758807a017d5402bd01cfc36d755f2d0dc797fc82f733bb561820e3d86e528e9d4028015a0d7d34a56bd3d24a6dbb6d16c43aba346b8d7ef7cce671c1fcfbc8af72b3d461f20e3580e568d1d4c2a075a8d3d35a52bd3d3458d7b266712dedd5ae75fbd33189c72b6e4bf2b65732417244426bb9e1f16af384dfa5ca56b4a0da35fa166db6d9e1b9d5a75d6bef133368cb35cdbcbb5c1649c8475a715970da76835b868415e8adb5ad29d345bd7799f25f6755622b6af8b2835a6a43ecb5020ba868360406da1a230d480562c659882b3b68c9b107d972323076fa3230d1729729cde6193e1618df20a844215310a5a14e92ad48bd0a7999ce214d2948a7bdfc3514f2679969e8a301e8ffef0d7f3af3366fdf4fde865f93fcd2c37531864ed294e9ad1975a70bf1295bebfc944723db4cfdb30c5ce812a1bc42e85696d6a25d34ad2b4ad3d1d054afa695444e46cd535e7cc0700315a652a03d41993af71032787d543d3c02ed84038197360d265ed247418d73b600de9725edbb5b8f8065bbf9c44ca0dfbf2b3eec6c004a9943ed93243cd88d970a545b26abcf25c2bf85a3f2869b15c82891a5e44be52e00f88f9ace5e4caef19cbd06285ee95e7f688c973234e480858d0ac3590e66e5bacac40c05778f619da95581eaa1c84cb44ef75b055561efab2f2f30c357f7f20fd8155535bdbb2993cab6e9fbd78fdb57535a1bb2f39eb8f5dcad8a25b5d5444e5d68a64513dae6f19e1da59f47bee57eabf7d1e83dc6c498fdf61ac88ba574c09d041b171b1e3716cbf42c5a4fa357cb10f06c4c0bc8b8c7f10d4b685d4b2c1d6715e3dd8f6b767da296fc37829dcbcc3fae2958762f75f6fd47a3292f1b29874c26e8b159f3652fc38171cf1b6eb74af5e7ae5efbe06c4cc30c159a8c122614c6de56cd3cc3e00609730e9f5fb02001216fb121e1d7ad367a019ec2017d64060295a939411a74956bd14a53d75aaeabe5eb1976cf2319762e40db786ad9f847ab6d7d7e9702aa0d9689be61deaeab574562639f6fe2f7cf26644bc936dc61e23b58ac7453a694f53875afa6b5a2f2b688b665efc56b69b56b1cfb7f0693c9ab9ac2cd6cb49d0e3d0a9fc3402a556627996b7d663d627ecab9f799d8f93379ab21562a3ddca7aa542ad69d3d35a7abd0b5aef1599cbcd9d7b6cd54f5fb18f93859d1d9278aa04234e92a0d6b5ad29fcb4a26d76c4ce136ce95e95cce02b0c3afba2d35a8cbd544c99c466536ba4da711e568380994f59b7fe92fe64af9e17c742ff00580ef30f467386ed3a0bd74ad3d34ad3f8132b6898e08d9aa693894ed6167952875a8074ee956bd3feaa55627755457a5798fb0fae1658faad2fe2aff3d2895f23d9e95e3e871622536152a5a5d1e9e8a56bd3fec47c8dcf52d106468522405e1d141f574957a3fd9d289be18d7d7b5a3308e4c57639505ca53d3eaad3d555ec5b2cecd5349e5d1bc972afdfb4ad3d15e03ffeca2c7fa9b9ff00863fdcd3f983cf195e559ac8c620f0e7181e3a1b7c42b8dd36fd1e9ecd17bce710f7149a4dad9e27ecfee55f2d79d053650b5926c2ac95753cd0136e852b5dab7a6a274a7f07a51398f2cd35d2f1f8279fa4affccce5d8d93c2bb94111f1b0e83c670694ef982ad07a6b5a7aea1d34ad2bf47f22f2d1f6bdebdb13ebfe9b7fd25c54a03e015afa0a94e9f57afa11ed075baf687b5c7c821e9f452bd5ad7d28f6811d7b609bc749a53a6b51a7f074d7f9979ed0f7f4d6fb8ea407c7f08d7f8abffb97bed0f27af62a635ea7a887fd7fccbcf7833e092ab125bad285d151afe1a2f6272c5f5cd46c48cf916d6b3eba5c9396b70787b80ecd01f11f4b943beeb59724188fc18fa03fdf4a99416e554ecfe00d81b695326ead79514bcadc7d73fb34d9d780b5c4e138f64bc915ff0066c254ecc06a20bdf05a6ac058c9532b0065bd874bfab0464a9932407685905b6ab2af9d9583142cdb342aac3353b3c65ee8515833d59f9cf4e7fdd68faaa9ac0f567e7467cafe292ae9622ece4b07c36055d4b21ba964467df2d65a151174b6a21f0d6e814c8ba6b50d06759efacfbb5f18a8984e28715dee43b68f71f191c06eebc08564451147d3301ab6fbd786c517671ad13d3b09193e0c398f958176c2306c592e3e49b4eeb44e8cb75dad441cada61d45ccec75b12a6b7584b66265a3f05d11bfe1b8b55e05a72c6bd8d7e1cc36656c5eaaaecc25b53294f1ac6b3025a987b30371325b120032d09530a74cb40cf5c0b4291d6ad8f367a88555440169ad3471a016b402d9240623076fdf316ead294be9e9afd3f83fd6ba9bff0024be77a38f9ab9fabe9ee5793cb2785c7c7c6f86ae6422f4cc26d9a03deba54a86e5b4a97456b4a6d2e7570ee445e364cdb3eb9e3e82a5cde538d204339487e2aa14a8f89628e9d9d35e8f4d40fd1d3d2bd9c0bc5a7f2e7fba53e2e4e0a419960fc3d19121a3fe15aa354e9af4db752821d3f8511818988fc59cfde0587cc796f9e429ea39327a7f442bcfb249bd22766b9fba3fc545e763c45cabcbc45eb1872bfd4d30bdfb619eb46236ff0067ff00270ec54c08d241e3a56a1d15a1747afd2a8d95cc609eb6d8a5a265f49f24f3e67b23889336783117138a68028eb42e0991507d55b8ce95e81a7a69d1ebad14d1276eea6bada223336b399f9b9cb1581cc157a3053c3cca8ca8d6ecdaf57a0c69f834b9eafe05aace24caff00fb75c7f35270dff256725e1bcb0993a25957e3c870c01ce9a8d7a6ad8fa68351afe1fa562b3c3cece98bef889fa7f11dca5cd0ff003e565633398965c8e0d74f896c4ad12a95296d2a753a89fa7a695a17e05ec4e4aec75e3af8b52d3957f2c4e83ccdcbb3393726ed1c918fbab8c975e8a955b6eb6810fa7d350f5747e10aaf239e0cddae756c8db5ff00579fdbf6e4b030e3797bcb32f332c5b3cf4aba3c46e9d15a0f4d7d023f4d3d179d7f8a888e06f89ec6c8a47148e5c372b987b2b9179f70eaed6a6446e97acccabd245fcb55b8ae206cdd169c57f2d5bff25fa7efdf4faf80ff00fb28b3f69b6ff863fdc9fcf4a52b32352bff0042cfff009a717b1f99e57fe1b7fbbff8b9d63429492d5469e9f4ff00a3a2a8b786baf1f8a1f419ddfb825c7dafb9f574fafa7c3e8e9fe1f52f3ec623f3ff00effe6a3e7b72b5f2af96ba77785d1fa025e4f8879d68c762ff00dffe27e368ebbe4a4c8cd055c75e9222db614a9111565354a08d29e9ad6a8ff48bc7ff00d713f48ff295e47cdf31e0f91f0ede3b1ce4a9edd01a7a155b76a6235a19548803a0a9e9a529e9fa57b99882ada297d969b4e23eacc67f98b9c3993278cc7e4308e457a1ba32f840c3f4738553a055c213e9ad94ad3a2ef574accccca8d3a356aadad5b673c7986cb99f9cb9c31f9506b0d883c9c726a8e1382d3ce504ea654a8f4b5e8f50d2ab733293575354d7f1dbd7f738ef3c731cfcce74e5e463d224aa7432f323421b2ad748d695a1f4950ba7d74aacc7339576a5756b8a567313ca7c0635c98e681b19f88e244a5dd7e1a974db61ae0b5b00952832a2c86481afaeb3157b0cccb92fca7fc3c7df4c83216b8ec53716c78fbe94b36dace17cd3dd6252dac302bc480fc5e0b2888670419572ef97d0009b12301644c96f968bbf3886aa04e03e47dea1556c69c301dd4dcb19052e35c16023232aefdd8e2eb35a9d85cab6772c3026aad3bc99ab2f91c6ebb1a1feb159aae9af4524b8ddef0807f38e2a66e86f411131ac34d718c745ebdf6794ae014e9efbf2383f043470c10f6fc8490f708fa86b5ae84dcc68dc100901b77a3651eeb5dc8337e2b52037fde242cb7260585a2d419ab83c34e83dc449758584479bd01b86972a6b22c263f14fb0a7d91935746117350ec3f7c1fabb89558c063e704a8a6778968f78afd5647b64d8f3f85b775869962ab76a3133dbe16d5e0b99ba9975badb30bdb1b31bd4d11875ebb33089d8d6d860b512644a14d893225eeb5864c4073f6c6b4af4d2bd15a7aaabb767ca57cbb7790c6f499e64e113ae5623fa8ab5ad7d0e053f0ae6ec888bf0ef5364cf5eb369ff0057f137cfd2911e7013264cbb48ac7410d7a2b4e974d14889bf22fb26345a6b389f6fe0d4792cdb8e6026d6bd267746b8abe9ad6b56cbd35aacc7993375bf2667fd3fc16ad817eef73c7a3d526474fe8e8bcfabcb4c7c9aff00b200f99b80cb67397f03171f11d91518cf03b5682a76d1d6d9a52b5e8f66a8fa4b3a26b1f245a71edc7f8b1594f2c6b87e55899896df05d7a4d2378170085d1af41950aa55afa7a787eae8fc289bdbce4ed53a6db3d2b5f119cba49e2f0186e4f83cbd9e99581e30292648d2b5a19b95ad0ca95b44f66b68ff002231111822bb2d7d937a4671c05e6cc763739c8b4918891e387035e807bd353e150468e0956b41f50da5d3fc0bc9e61bd379d7bb168c7ba5c3e7b205e599e5459645cc5d062b4341ad842d70c28474ad6bd255a17a6abd89e1e5e958dfe9fcdcff0089dce79acdbfc8f1735839156b1f24787340294bc44f4db7f4748da74a8174226786746ba7cd34b47e28f0e3de5ee4727fbdb1cdc3ab4e526321411dda11f0c869f4d2a3e8afd28b4446307d2f6bd767bfee6bbfcc23d298c88456dca8b6119bb03f00f15c2a1d69fc254a517b1f993eabcfe9ed31e6670e510d9a36dd2945a99635d710e9de4c0d7efea529aabc07ff00d9458fb555bfe18ff735bcedc8d90e699ecbad3b1da65a8e2c103e4e095481d373a69601fa3553f0a26273987b5bd6b598b44ce673fe0afc2793a31a50399092d1b235a54988dc42a9d295d9a99d02da57f0f4511eb33e47ea2223f0c63fb565e66f32c5818d3c2b2e0f8d955019423d1d0d35d34b5bafd0475e8f47d1fc68b4fd8f3ad4ccc5bfd31ff593f98b113f37e58e01ac6355926d0b44601d1d3d146c9b2e8e9ad3a6d3f42f26382b4da2bbefedc793eb1b23cb9e55d7c55291f20dc969e600ad2e8729241c0a57d74ad6d6eee847887bed1b3b1c73131fe49b39cc79cc7f21e27985874467cc75b075ca80d695a103a55e81ad3a3d6145eccf035d2b7db6d73e23fecc1613cd2e60cb7333390e37cd38d04071c265b1a56393d43a8d294f474ddf85131312debd7a6dae6b589c47e2fef6cfccce75cf727e61a671ef51b60e283c6356c1c2b8de36fd1753b3444cce704eaaebd9aa6f78ce27f87f172ba4b919ccabb3a40d6f90e1bc675a506e71c2b8abd14f453d35589e1bbec8b622b1f86b0dc4106e2c7b03612a5cbd970f919fc26af774254955960a4649fc8e52c6b5a7cd4d8682243f02d681bde3f889526419e32593b607e9123d5bc0d65e707b68f8861610603efeb90898630b308077f612a646058430b7426b263d0eddb40f657cb0b47675a32d65147c56fba8c8c99399b456f65042925c6b914362acbe400048c00559a6e55e8cfb301c7dd3554dd0de86e5ac63406b0004cad8add5c33f0635ceeced9aaaa963909930b5d75efa8b54b97b0819f92f6d1b2e358ee5b9c1c7f052bddbdf11255eae46c864e0cab087401af0db70523511d8897b84acf0c86f32d6972f32b300e2c7d7ad62b1954f312f1c57ce3ddaf6db4adb1803b3919b7c025ee1e8908d16637e9652583ec1185ba3e1abd0fc67e3a7f00fb09334cb75d9896ef0d9207dab1733b118763adb330b03d3a0f612225d1890ee8589b126c4843ec2d34781f5d01815d897cc4359c9fcef91e5aad4e019b4ef4108baddb5ad87d15a8f41d2b4f5d14bb3566730e8e9ecd229e97afb464ce6ee79cb7343c35995371da50449e72da56a01d3511a085294f5d514d589ccbcddd9adabe94afad7395b72ef9999be5d844c4175c62fa051de1d1b2a1d94e81ad6fa57a3d6b13aa73c4a8fd46bb5622f5ccc276fce0ce0c3c945bdea35943339a1c362bc523a5a55a956970f4d29babcf86df51faad3989f49cd7c7ed95935e7df3532cb6d04a7841b1a000f86895e8a0d3a294e9a8f4d51f0dbeac4edeb4f9a5bf6ff00d82e53ce9cee59a6199cf3afb71df092d01311829470295a0956ca6ae8a157d15f42f3e2b7d5ba763af4999ad6d99e3fbbf7a9f9c3cc2cdf333a0ec890e1c91116e922a2db7516c6b52b445aa529eb2f5ad575f3992f6766b5a7a6989af23796bccbcde071cf458afb814923409234069d172da547a6bc5a17456b42f4f42f275ce783637ebb563e4accdabf6fed2746f33b28c601fc2344e063a4154dd8b6335a1156b4af4f12b4be9b34f52c7c73e3264f6754dbde6b3ef1fb7edc24c7799b9985827f10db8610655dc78bc369c0ad4e94a1741394a90fabf07f1fad7b3ae7ea3e7d5698bdab3ef1fb7d54d8ace488d92ae41b1b1ca18b8df47456a24dd6950afa69d15f57e15e5aadd37e6666638b0ce6de72caf33491767993eff40813c42db7a02b5ad0682dd069ebafad7b58fb64bb5ab15f4a46232a81f553521ec2fb96b9a723cbefd25c072acc81121172800e693a74152d72842b330dc5ab35f5bc661747e767358957e65cad7e9a4589ff00656bd6df52e6fa23fd36fdff00fe41a679cfcdb219ab6326453a695a56c0623d7d3db686e47a4fd5e7c9aa3c5267fb7ff32c6c897939f245f92e59412bc406b5daf5dd5ad7d35aad4444336becd93133c447886d301e68730e061562c67c858ad6ee155b0742855f5d46ff0048f4fd144a889fb146cf8afcde3f17dc0398fccbe61e602682519bc0d1748018836d8f4fafa01ba529d35a7a3a6be95af5facb14d95a7fc75fef91190e7ccccbc047c3bce91c08b5a1c68f506a9402a50a94ade2343af45f5f5d567067bd2b69bd6bf8e54d8690510db75aa7418568435f47a2a35e9a57d3e85e5a723462b1cadb99b9ab37ccb31a3c81d6549b05a17081b6e946c4aa741b5ba0d368aa8cfda5de694a7a5231132d160e01466a84e53a0d4f6973f7ce564ec9e10eb4a884d865f27e2f2d3c2245d8b3bc7132206133dcaa7896825c5d661ef151696e16b89b2506bdb52da0c81678ab4afb5032223e2808af3140cac82375052b0ce443408c0c8808c9ac64d96ca0655fe0f8aeac3d4a60d8b476a028a46a2593215f2d941b0cce5990168ecdf4f8966414487e1639bdbe7eed3624a965333b460ba3ad1ed2c7c0b63f18b7117b155ab3f96d56075cd3e9287b11f89671230143345e54cc7e1539b2e0c8130dc34dbce59a70d5c7e0662119ff00ccb3ef143b21752d90fe19c3103ea222cf704616eb0d8f889916181b10f5876d2361f50996be2ca69e046b4bb9778f781f038865fad0776b3783e672ace0f1ef8e43df33a11ae4a98c29e440e15f60ebfb3566b47b45e2724e31203fe1a97b3ab2abadb30dec73e3b006a1db576345cd90170dfbe09545d90861be9ed9fb4280c0dfa17625f310781f5c52e4d84a054eb2cb7099a34190770e886fd612f0a9f421e7ac170a9f42c37ea5d14140c3db112cc24e8a254990781516e5b84bd09526c1fd1443678201f7e843584768dfea43cf583ed1fa1030f7a10f4ee8a57d6b0f20e6c069f8106c43de8a7d45965346eb90a0345cbd8fa13be24f716252f62d86800f6cd2e5cd9b659ce64cc5a1e1da2bde35e441981dcb7dc341c5f7c69b1030da8037322f04d672cc31a0078cc9181ec5e8c190d944b24b00f0251791ccc60df40c9c61a6c4618c9340d8bba118191000e6fa19ca091b4819471d9eeaf58342ce3b740202bce368d95932159399ee906c33b223715d0656e25990f930e1019ee07bb4c892a5879ccf166033be6baf08ecbafbb5c6a19a97758dd5562a585d37d8566b9733b11f896b86b0a2ba0428d92a663f0aa9d8df34ef61374ce48ddc161279c3c903c25a0fde3695d88c19d7b65b0910d8e17898fee5efe82822cbf0afb3bdb0d362c30411b8122c32d1b6b576ea673085d0ef46b4bb83e1a4fcbc77ba86b7ba1aebce56d936781910901b0f7bc52c49bba0a5c3e287183fac5baef66da148f33ab48d8f2a6b6f64b6ae1a0e599fb86a5df55fd6bf2d2ffb8a1762b3c007b4998279e67d54073fbd75a5f31041b5b49726c25ef0960d816ca0d8100bc05ad00f402df40797acb457a017784bd9109593b52a4d8121a906c1d620d87b62010201c0b0d91a01f62cbc3f4203c682e3ec2265aa4ac23c3e2ba160a54c97b6ed5c767851c037d2bd9cbdb27c879cb6c686f347b17596139bd99d85e1652dbcfe237d45d1eb4e53f6b6659a89e644e29e067a153b7af943af661dab92f99d8cb420312d61f0d477a2ed3759e6e003e3c60db50de14cc8be5bd8e0da8879b9a0265b14d84b046ce947ab593819bbb08f51934f4eca26044abcc3bd3bd2a60d891021dd0588661592038b210641eeb368a561ed659fc86a76c4654d6558d46d4ebdd4f76b3322d653e5834f07ebb8a9d3296cc9632371f3207db566eb32d6ce8cdf823ec029a2c1cd2446d6ebd6aec69b21b40bc0b3735f5d2bb16335c227a3383325d9af42f6b62b7559f91dc5876aa6a9a386d797a4f161f07e0bc1f88b9d7ae1d6eb58a433c2246bb29da2190e38704ffab4891120b2cc9f80367a8a9d364dba1498c3b607d74fdf394bd5be1a8901e3b07787be00bd439c2ed97ca5c4f7ad019fb08b4bda85cce3785ac13755cadb5098fee9d0783fac5aec4e59d5c4b6711ee3b41d75cc98c4bafa6d98439166db1e0df442dc82bd361e61cf036d7625f370983b69726c25681bdf583605820d8101b0bc07a0120101a03c3dad95968acd1b2807ecaf6441c9526c0967d941b0720d87a07da403802e3402ded9586c900f03df5978786add404ecf50052a659cb478c6784d5fbe69532877dd6b1233f28ac0d84df8d2ed95c358d08a37823e32a92e7be66f8b7639835ee7e227f4e7129ef5c87e40f2c79733b8975e943fd65db0ba77dd88437ae19f8992fdcde68f0916494bc65f6711676d0debdf9772c64f627430302d0f02e3ed8e5d38911043c1bfa12a1bdcd032f5c9b09605f776ecaa7d58f6447b68f51ec1cc2e3d09730f6240c803124a983224435aa3a537016385ce9a0c83a585ad22d05d6597900e111a96d2a6b2470dce1007d7716664af664b984f84d3a61b6aad32f559ca18d70a681fd74fdb661a3cd85b8e967d8b14d5b3d7379ccd915aebaec69b24b40bc0b36b495d8b1baa0e97181a7669dbb68d76135cc31b9e8d6d80ba7abc399d8e16bc8d3c0be5ccb5a9fbf5c42ce9d9b0c9e35cb78c1b0b99a6ce9dfc2b223d6c8b0f6c16f6154959c7c6b1967ce271c63d9af8868a59ede18a7997d8be3b457fcc39de02b339414a61b5e5b8d7403fc450ef9c2ea532099071894ec7dc03bd79b646a5a9c60763981eff00bb4aadcdb559a364d89b61ec1ab227293670d0630edb00d4dba30b7ab6caca40364d1d8950e95655a61a2f4d8555873cfaabad2f9884bb49526408690da50d4809bb686cf4025868af4020343509476106c1e896620e004b9362132c19076d20d83c36d0cc1fa106c118219335a01f668b165e1e1b680b5c646e2ebb52cad966a31901c94e805b6021ccd966aa3c3e10d802b4564d960e59a1032cfe4314129a38eeefad56459873fbf395a2cd82d0decc90eedcea2a6b74d6ab23968d8e958668ce4f0721e22c718e1fc3fb456511ec746f2cb2bc580ec469fe30453b1b7faeb99dba2eead9d0221f15dda50c2995c01da760264172b06b52b729f223c3190debcc0c9c119beaa2205a42cb8dabb6a6dd06ea95586968c37d20e288808f207689af2cc42b23c6e2bbd85358d8b1f936784d19a2b054f2e799e032b00076d555953a785c729c0b0ccedd8058db62f696700fee677b6695526ac164e35d0d75a9666206e1a3709ab0c52b6d8d884b908771bba76d66b6130c3f3646e11b5d75d7eb59ccec428f97e49b1970dcd49bdbe619e94e25db30c6dce8b61eff00bc5f3fb3897726730cd6731a18eca6bb80cffa69fd728a2078a75df0facc3e1f5d3376bcbdf666b98664a82ff05a68590db556be507b61a5e4b99f2fc1d5ac143daae1768b646e4d9e14f07b600f42c6b96c447d716cea1a36480b90877357ef826d6ccdcb1fded86695b46b5ae813f6d2a1d3a4ab1d0b08c3613617525ceb6975a5f3309412a4c8101ed21b4c1788a01e86ce03402333586882f404b676d0d41f507077906c10075d7b2dc4080f692a4c883f73696041c8360f034330601996f20d83ccccb42192403ef5978223b3c52b37101aac2628df2000d8fb44b41b2cdc4180db016021cdd9659833beb4326786bb420655f3a05a6b19314b3a1c592d1b32051ee3d587ce797ac3ad3af4222bc159ab791bb419e5bc67f1d365b2e90dff0066a6ecec33afadd371877919a960d95db209905cace269da545651e5641c3b15358192b3f111581690b2c02d536e83354a8670700afeba8d5a18f25bb5011ce7808ac5e5989158e641a68ccd4d62a6ca7cf49b9ab013706e9e58f90cf1666cec232a6786af1d0fc2e11d78f45ea7b58bdaa9ccb3fb2e3806f85e9da89ab0b9967ba0f6d594b3710b38919ce1076d2b6d8d8811e1b59deb35b72f26181e748d6cd0f6175fad6737b10c533a6783ddb576ce611e89c4bb5f2c3d6935d4782f5f3fdbe25dcd33985d730e29bc8c50331d6ceb6dc53e9dfcbdb31b04dbc4e6613c7a00ddef17634dbda12dac13ce3c530d311de8e57801d899d2e50efb603f20490745a4befd70bba36cb579e8ce13067f6277ae7525614706fea3c08bc839aef5a303dc46ab337554764da95d8bd36c28bb3d4007be950ba92af977f16c4d85f49737d95d17cec425682e41b10950d253407bf59020e41b078250883c3da41b10975acb507d9720d82b10309400ed40c1f62c350f106c1f7a1e9203d597848097bc2b00112d42eb1902e74190dff789529b759d1b0d0022b40ca21cb995ec765b224d82e6475968eca0a30f88268040605a0ed44cb5eeac9d8a61dd616a54c8f704ce3586b6d32d6158664309158ca487a38eb353595565aec4c0b6cd2b3582ad2bdb004553594d682bd662cf30704f01db24c8b0c086a7b0ee802d6b7eecfaa630bb6d191eaaac8337683151ee83eb2cfc865c6b5daa58855590ecf7aeaf4ada37273384211837d0556acfe4e4819802d4aad708b1f0f8f2acb77d2a45e5a2e61b0603511adf58b11af855730f75175e8b02c6d3750d9cb0ef33c50680b6ef5449abb661b836024c8457f7a77f5d7b6f264b03cf5c4f157aec74dccec39e007ce076d74efe10e88e5d7b96e4f171a1f915c3ed7977344f0e8b1cf8b15a32d8305c6ac72f6cc173fc0e13b1de01d17aec75a784b6647cc5cc30ec08912ebdebef71b5d4d308374abf9224b9166d9fa34aec41bd79758961c58bd7bc170a21d657c1fd5da33dcd09b12043416cc345a42be5b262ff0060d33548111deee96556b37201b07d842ed7e1cc41759c58810c820c883d0c9c080f77d020edf41b0786da51b1022f41b10786add59620e0d28360f41b83ef40c15eb0c43c0341b07a1e95f68eca03d59784809e39da17af25b96cf93a058072cf7d2e5ccec59bd88ce84439f32b888009905cc8bb2e5e80af76d000c893c2ded69532d7a2b24648f7092a647a2bfe6df2d648f63703a0c3b4834de81968a38581af42d60ac94892c2323014e600ef2445860cbdb77aa9b1618092cdc63adf5166b76bd5363b991be2d8e95fedaaab23d56521e077586c2c6e826b2a2cb3dc26ac52c429ac87c7f0c5a378f712c59592e6715fbcd06eaaaaa5bdc59001db5a93621a0e588c1c53906952976c88906dbf940ea02c599d9c2ab9ddeeeacec5e9ba86be594682e2887d75449ad2b2c9df624c8568b3de9af6de4c9739e743f983ec2ec74dccec30b1f5488fedae9dfc26d70e95ca077352239ededae1f6bcba5ae5d23087c58161ed82e5e0eb2b79d000a183c63a19576894b6702e6397e2b2c766c0686d77b4c399b65658c336a547792bb10675e5d960bdc7c6b476ee58b8530ed87881dd3a1d434a9902ec6fc401f5d16900b26cec7e226ea901e3877060b4ab5992cfba042ed7e1cdc352eb39498101281a0120102c3c83b6906c085968f0ed8a02504a3a0f41907fd54365eda0121b2402b100ac40259787a00d8e06ed816e84a96364ba560e1f0a2b41d84a973764b4710c16a253e160cc96c76c93624612f8f6facb392bd414eca8759191eaa491338ba016664d884565e95306c4ace2407096a2189d8b2006d81bf4de9b1254d82cbc96ab12b6cb71ac25e649558362a1cde5bc33426a498a3d06c5ab5c07c35a6c553c6bc2bf27877daefa38a6454d8dd80b13312a31d8e9158912de0464de893043845b6973679e807227c28a0d0253dd2a733ef74214c8203f9c05e4b166ce37cae342cdb30bd2e535bc81c7f12ee36f99a2be58b28b9d24ddc5f62c54d4ed40b1d18ca46342ddcbd6acc4b54d46ef5d3ec29ac5ca9c19f983f6d7bf69ce55cee67f7a3a0bb7d2f08b7b2801c27e3fb6af94511cb71cb67c2cbb4776830b1737b0e9f5e1d2f96ced90607beb8db2155c273bd9f70cb0bb5d8e70d5dd59437f2f9b8efe2eadbb97d055cdb348d07ca83dd44ad8ab4ba9f2749e3e103a80b89d987475ac190b643bd43536a936c2bbb2e12c4057e443ba3ec1a6d4078fc33d815bd8f759b219ee0d1add2d6e6fbebb0e7a5403c36100f407962c3c84cd20d83965a3c1012eca51d0780765064260f650d9c7a900cda4367a018807d8804b2f0f0405ef2b43f1591699dcdb712a48d92e9b22358d0000a54b99b249abc456625ac11bc62379926448c07398e16f2ce47aa2f0d71de8c8f54a11ad25989130b38ec87553620a9917c6068742d4c311508f49b92a64d8d6af3ef5d004ab4b73617c1d49baa0a9d8cbe7399e0c377821771bd95aac37ad9c91ce769deef1018fb4b7bb55568362e307cf3109f064df13bfb488aa79be5d231392625080015e09b152e6327e4f979898d19b5a0d62fa1aaed625d86fe266d8eec286fad556e9b2060eb5786b530d2a78ecb96ba6685325898dc79fb3a01792c597793936b42c86d9e84b94d6f2962036d3a1f910457cb1663f9b0eefae6a9a9da86e2754d85d8696acc4b5001dc3a6a6b172a730b76f636d7bf69ce29ce266eca75ebb7fbb5dbe97843bd4f203bd8eaf92221ab8276ca68c3f26b9bd8f2e9f5e1d371da6c78572f741b70bce9aa19fe75b4cebca1bf97cf9990e1651d00ebafa5a39b6681a0bb1b67612b62ad2dc796b32e866065b0762e4f6e387475b50f05b28c3aeb994936c203687b06b50026402ee2a6d42be205a46b7b1eeb29076b4608d6e96b73505d873d280201fb8b0d250d2805ad644425041b107f4f69658883c0106c425d686e0f0d941907ac3648076e21b2d8de402d687a5676500c30b52c256901d0fcb8c6b969cb3dff7693287b766fa7336b5a12e5cca79549bd6e8df5a36f19554e92648148c1909e37742dc1966af1f8a71f1bedd09909ac52e07037566d4c08be411bd6a96d7c1b1ab2841e37536763582b1c224a9b0c88830cf8b7adc558b585ce070584d8aa6b30f9e800e91de3b88c2cca5e483c6e4e3bb899ad0de07eecf7d5da250ef873df3630987c3e67f600f04c3f58b3ddab22b94536c1de5ef990fb4e844945787da297768caad3bf0efd86cd84a8a061b0689d8d5f596660313d830dff869735f67baedeac607c8c838f2857366abb558c9da4746fa5c9960f12c61abfe31a513834cf8f920ea3281815e32d077ae6b3581865f33dfba01d40bd53581859e1b4ca8e7d844bcdcd507ea077efa54a6aaae6f7508fd8717ba7c990e1dcc2cfce806fd97aee68f09b70296cdbe08f7cc13f21a5c332651da3b943be576874bc0f7b8ef6171f6b70aae77936e22f0dbbdb54f5936e705cc39c7cbc821df35f4d49fc2e35a3f1358cb36e34fb0a2a4fe2742d1f8567e5c3d6cf759eda8fb953b44ba4480d60f2e651764e0dabd620b57ba6e13a69b0103416bbb3b8b506d024e3fe9a6c2ea39ed96eeaeb214a08072c34785e48096c593620afb43420d883c38972cb110940106c41e8660f41904b0d902025bf4a1b336900fbd0f4bdb403b83d424b099a6772e1d680ed1c9b03c2e2da049971fb3659e4ded3a092e536a73c9dcc2e359230db05a53ae32b0e304a6af040d9183f187c295edadc0b3658cca9b0d597684c84d64d939fc58eb36be46ba618f913cd4b6a65752709624c0b2f44559b42d60b3c7d94d8d696d2b3643849f1523d8f97c3269362a197c843d578255a0facb2999873a0be194c55c12994dd5256d86132198cafed3090d0bdf79858e3863de35f9a5669db947bb5e18a9d25e624b521a69b8e0036773bff94554f29638763f2cb9cdc74023baefe6d733b15f575b5dbd9d61a9edbfeda569d82fad599e80129ae307be058bd5ee8b33920cdd1003db050dd71b7ea04a6306005a0ebdd740c22335aac0c2a727a6787e695558183f961e71defaebec3b12a4adce80f33745004a94d566b9ba4f031b20c0b5d962f74f9321c73984ee9e1d80f78bb9a3c26dc8af6c9a8fd80716f21a2e56d514143be5768740c3bd6f1595cbdadc2979bdefd9277ee2a7ac9b73879b3f3a067beeafa2a4fe1726d1f89b230f9530ec28a93f89d2b47e10fc96f70398cc3505ebdef5782f44bb0597340b87f6afc9001e835880af30f9834d801f58ca0bd6a0da05977f15361751cf0174d19e08097eaa1a2df403d65bc250db40c255934f0403ef435932f40c997ac0810c9e841b07de8106020d83f421e1201777b6b122ab3c2466e54f683b69725edb3b6e3386c45004a7036f2a2e66ca8311cf56da3d54f5ab87273c971724eb2771deaa9598c347cb792e17cbbbfd5a548f4cb651e184a6af02d6b08f6425f9b1d0081ae5335338bdc96835996a2424b816eb4a936241005ab7021a0e5e7b41a6426dcb578eed84c4f101dd3d0836243bac83a1b282813d0eddd4063399f9558947c6687832bed1329b45a8e4fcd3cb12e3dfa6f576bde9ada52f97b24d8942c98efa3b3b330d68abbc63e65a0162e3db995cb809370eb44915867e743ef48c37d2a555641185ba02e4ac1b32520f84d0023054c023d421622b06c84c9837e29a30df6ac55564a90fc8616b5280fed567b9f999b3a58038562976f84b66279f0fe55a66edb3bd55d68e5a8722cb3d73a065d75d8ac709b71f1d9f9088f5bf69c471793e1aa34bca01a4c0370d737b0ba8dc41d3343a9628f649acd73fcc06b0cef5efeed5bd5843bece3b18cdfc8b56ecdfe85dcdfe1ceebf96e402e8aeeadc503a71e151867b859c68d337f82b4bb6c1e23ac5eb89bfcaa93ddbc5a4986e254f234ca3f61360c89230ef5a3ec2cd44abf267a82c254d57e873c05d3467fd540390d1e1b080203d9593f07206080ed597a57a03dbd0c648d032702c1b09b7106c1db2810408360b5f590f0900b681625eb5de5ec0e2cf3907b8972837d9d2a74c0618ff00889557275f32e5fccd9b71fbcf7361b54d6ae9ebae13796b84632212e598dfb8bd92766ec04c9c3978cc9181890587dda54a9eb5f2d9e124cbf0a121a69ce07c471608dd0d134f457c6fb5096243e461dc17b43ac1665b8944d4c6dd6ac776d2a4c89052cdb1d85b83616189bda635ed9a6426dcb86b52631307706e0415321cd971a403c19eba021f00dba07a52a207ba9727ca50666d342991232ca0721c5872b8ad0a36eccb7aead1c786e10d80954e4cb2e23c3b07592259c02901d44a91909c1df3460d89059165b460d8854bb25b6bea23025164c1c7e2b521ad761a32549fc90cda723db5bee7e666ce94016c7bfb0a5dbe12d9cbfcc279ce3fb00afeb4350e4f963b48d75eb1c26dcb0c71dd8103ea1a5cb546bb9599d37f5f5ae6761751ad699f9a68faeb9d33c9b6f0c179a4766381a22db75c5d8e94391d9b39d72fb3c59fd805d5de9f4796c8764c2ddc50ba71e1558cb3ef2d699bfc15a5dab978ee8017f517137f95523a585a2930cc4a85e0f9f3f61320d893cf717953254f993d40a9aafd0c2002e9a3c15881823d2868f6b520254bc1b92bf52303257ad619c9e8c0c98b3811299183624e0043509bbbb106c158b0d96fa01df55009008d625ed6d88750e4d81e0f10076eb3d6972e4772d9945cd33cda8166fbda16a2ac68860b260e147b01362abb0e9be48e341ac5ba0642666ede8cb89da697cc5e52899369a08ac5f37ed1187bd4dfeae7b1e7e630a2ec169d719fb46166bc3ad5db165d6072a12b6cac34ad9c93b7afecd406a14a884d90af43608af314d897bf221fb902fbee586be510616980207cab38e176c2dc427991611b4eca6c4153297eedbb41efad7c63e433eedb7751f18f9111c3b7616268d877412e68013b19bb929af739a8cd8eb40f70f2deb112dc42a9d3b92a4d8844676820c857c8d406836197cf19b4d59d74ea4658db21f97b361ae0c82d1f0d79b34cc975bb55cb31838eea46db15be5b87bba8a0955b21c39173fbda9d31df357f563953772ace1992ee52384375c610cddc3707b695be783f4371ca0cf75f5170f7cf2b9ad30b4a39a9bed132e49e6d3df3a0d7d75dce8d78733b12caf2d86b33556e2f4796c1a0b9a3ec02961d28f0acc705f923f61337f8234bb17299dd8b0bfa8b89bfcaa95cba178af0aaa865859290aaa1da3b80166ad4aab33b86a9aafd0c3ecec12e9918240c19a10c1201fc65ee0648cd1819457ad619ca50460652dfa9670225305ebcc1b129434a59f07a0d82586cb7d00900e401d81c69e4722d4701fce2cca7dd6c43aef05b8b1c590dc04a971f6db32ca738b26515930dc3598d8b34433a11bc50eca646d5d86ab90b25f73ca364c899ff00e34565ceed68e1dc3126c3b1c1e0db355561c2bfe1963fcc5c24498d01c7687c687bbb1236f0b7adb5cc9e8d91c63e1c51265ff86955e5d8aede1abc2679b94161e87913055b52f4cf4684a994b6a1cc9b8b4cfaa09760be81eabac633dc019aa2213cc8eb1b0d82db4c882e64f036dadb5bf779e885d9ed8a3dc7a2bdd7ae353cdd40475e04b9b845bdec2535e889d7ad140f454c87ae44a8880fed25499101de3dc40804e9a0d864b9b1eb40155d78cc91be5cfc325664afb974e356610fbbb2f96527c642378faeb89b7599b25bbcb1b631c037c012ebacbac38a73bbce11760cdc57f563932ee6591d565dd75dca47086ed072db3fac3376c05ea0df3c1fa1d2b93635f140fb6b87be795cd44b67ba03ea1a557c9532e11e67bdc5cd17617d37f4faf0e6f627957f2e3402dd6f5eee1d769e38774ea961d28f0afc4b3fb5247b099bfc11a5d6f920c0b1dacb6017137f9552d07c30b09785559f9baa7d9d842aa828e1dd2cd5a954e58f6015355fa18a35d34e61a0106cacc3d934d360a92beedd432619ea402dc43c84a068360f03eca25b810ca5499020129b83d06c16e21b2402402faa80e85c818ae031e39d1d67eed4b2837d9ae742e4b94007238d6e7427639efad449f49629964f1d28d990241f669b12bf5dc43c1c7b1e0220b3e22d7a60672d5f2cf3fe4a1be112510806c710d1ef843bfab96f7139888f8dee909be689bb933a6549cdf018cc59123dbc6fb40dc4a9baad3b7d1cf3270f2b80941c5d8fb45987435edcb4383e646e50d865ad3605f5e5a0664f51291cc1867c59482a617111e72d004f8b157817e25362c2901dd99d4589b37ea05d9376da5cd87aa2392b1937088cee46461099b8b391101643c68c9b1007b694d60d3340c0278cf6d1068196f68bd360305cdf3159d28e51763c39e19f7a6bb169e1cc977df27231861803b77ae16f95b66af98665be203a80a1c19adc8b992c7d8917edb2afeaf96af0e7938363b6bb94b708af0bde563b89d3fa8a3eddb83b4bb060e3786c347ed9af9ed9e554ac25bd7c704ad51cb130e05cfecb9f7f3b796deb5f4dd39e1cdec47264106da8a8b783e8d347b3c1e853596d00f2f071733203b0b5b7c13a5d4390c2e61d0ea2e3ed5566803642f594f0a7901f3aede83615ed6903bd7b0a28a7c9f02c68ed4e85d461f42eaa72403f71661ec9869b0549a864c3403c3610f20b7d06c2500b77912dc0a652a4c84c7d84a6e0f041b05ec21b2bd009012c70e2c868037cd01d97131b850da6407714b2e36cb2cc19df4b92a863d1b468158896e255f93e5e6322c5f6d8f07c44d89322ecd3a1918b0cf16efb9befe25a9fef955aa4c898709c07c592dc73f877efa3d326dae681e730aff7a2477a2689e3444acb9639c1b632920e40d80f75d2a689b775933dccf079927bb0486c659f78e1efacc31a630a1c8408be3efc016b67de6aeed36154df0bbc1f30b1208e3ba564a0f79a9288985ec73b9dbd054c2ed93b5ad4b3162b6413d25362c35c0433ed2c4d947a9af1a54d87aa1bd6f2f3089d7919180eec9d2b197b1011d7af2464c88440775e7b886f089e3b7610300a43d6a20293273f701360303cd26664ba3d5845d8652cb9d576c97325f48f9590dc6397e3f5ecbd70b6cadb19cc332d6a41efde9758335399641ee293b67c65575cfbc3192c2d30d3b0ba516e10de1a3e5680e100336fbe351f66dc35a5d972000c4284c86e2e45bcaa90938ed85f5d148e5a98e1c6b99996264a3901acd93701cfcdaee75678733b11cab0348b416eda6dbc374699a0b61a9acb6813958fff0031ad6df04e9753e4867e764075d71f6aab2eb64ecedaca7856c80f9d30ec20d85606f81e8b17b0a28a4c8feabdbbd3a175187bf52ec613cc919a305cc9a677ace04492306449cb4c996203ddf449584a0ce8bd2a4612b3b7ad12a220402549b107a0f3c0d00beaad830ced40240178c3b67c733eba03b6e33bd8e07d8514c39330b3004b982a649d0b132618420769a5cc0291022490d4226098746c514ee526f6e3959f934191bd4f2f0f956b59ebb16f27c6c563b00c8af758464d8d81c30373bf2f7337fbc5af6666e6c7e58cac5377c2e803f79db47b15374a1cb13a31f19a6ac95f6972cced666cdc6240f8017eda54dca9b2d6fb46c582a039bda906c22379c402e32022335966203bcf20c8802f3c686d171ae402bcd003ba6800659e935b8694120f6d32033396678bbaadd329b74654b1f1574c0ea2a66e962987d01817bc1e078db1dd58dae16c9110ce66e6775d834520d88629a0baf03dc3eed5f536197cb4673c5596eb33b1535b25dd5742e4bc6dd918f1edd0cfbc5cedf636cd9f30bdf3ad320a137529f99a7f85c49f6f42a3a55e53ee972707aecf4d8ff05ed0bb9f6258945202dc8b4cf5162cdd5a568fbab14f653553e2cce2f303461beea76d2f4baf7281fed630ebae46ef2aacb53b09d3f6d293c2bdefd74ec141b00778d155145164434fd754d5751cfccd76f08e6511bd723054c9cd06858c0894c8c1b12f3bcbd65a4db88066ede89183c2f24a9181008951107a549910950d9201eb60c3403500e1fe9a03adf2466c25430032d61a1c6d4f30e75e1b003b92a6105e4683204c5e9b30d04799b412a601b676d0f66a477a0a943b965b7ace5b8d81cc1823d9464c8d8678662ef742b3ecdcdc4d81d5b11ec54dc39c6e3bb600e858886a6c342036d026c50b9b19234ac190af33322b0106c3db34a021bed4044f1acb51005de26f20d88457dc162193c034a011d8801241a02b241e95b86954ec6375db00532029332c9b0e83202a8a49548c9b1205ce8000d88bdc5e98755966db1848ec86fae5cca68861f9924989b4d0aab4c1910cfb27f3a61db550a147c571e7f19df73175a3d9edeae9bc978af0701dca48db78ef6d73b658ab2bf2125c95970f6d2aa6ea65fcc299684289f6ceb6ba5d4a22dd2c2e3debb3334cf62f7174afe1344a574f8b948e6b163ead0001f0b654f653567e4775948e7f954edbe0bd2ec7ca7fe2cd1f5c17237795565d1b36c877db4a4f0083dede8361583ef5d4554514f910ee0fdb54d5751cd4d76dccc1801a90309565ac1e8183c034ac1b0943d941b063beca25884cd7612a4d8101d7b964d3c0100edcd6810408360f402b3ae80668403c1016186cacac64a09005f9c6d2a60a9875de5ecc313a281b449530e67628d403d7026cd93e113bc324a9180f62c4b4943b69720c3640b6178c8708daf5a02608cda07b9de1ae1d940f74cc80082de5988279e464c8855c8e23a6b26266a3008de801cc178f202ba8360248593413a8041b77da807202278d68a8857c8341b101c02e3b17b064c93b271d0f6dd1379320b9965dd64e74f37b71365aa2eb1d8a3b034efa5c95b1a6cc9f7b1d90dc051e088863f9a6c1740cc55da20d8865dd3317da7813ef2c6b86d7198ae3f09901dbd6e286f2f6f2df7349b187c347881b81de2c27af2c3e3cf8b20de342aaf0c4f3649099cc1101aff96e22ea69873bb1cb3f8c64ed90f05aa9982b4f01f187c5c905e8de6e86cc01bf61430b997c89dcf86adf54cf8221d8f934fe6b1e663b7a1733b06c3472c00663aa62214dbc683615ec9deedfdb5e54f55658341e9df5555768734b7b2bb68f0565baed40c1a1b6b2de0402060e58107dff005106c16def225884ad02549b02401ceaac9a4017201c8107a0d83efb500af04032f402403af6ef5e4c3cac34dca13df8a6e981159f6697309b751d0b13cc91650e922bd4b1673b0b60c901a6c0c1de26edd5896137192e41d7e8da5e324d1b77a009e30207a21392d8a07a047a4ead0b396e21103d72326441c160adbc4b7a00574ff1178f2013af020d804ec96ee5934271b4a01fc6d280671b4a00778d6844043bcb5da832205c481c768c17b05ccb392f901f69df11c72db4c82a65540f3f8c9561eb0f889b27d1adc0648265960d9625c97b134e93f346f19680053e18886072d3dcc8cab1ab95da20d88178cc3f1653407b01ef166f2c443a9f27636d942f1ec32a1bca6dd2a1e7fcc1ceca7870d7ad698eb72080c21c5b10ab6f0e6520cfef4c83bbecf117674c39d3c81bf818b30df3f78a9982a78458164fc7b56256f37436af06ad1d450c2e65722cfcc0aa67c110ec5c9a768e33a806b99d8361a9ccd9e31d53110a1de341b0ac674ba60bca9e17321dd5fd7555576872fb35aec91261fb482a4fb102083876a0d83ec043471a02500d2b12f6128002549909965b2bf4a0121b2404d676d0d1201880480759db5e544aef978fe62ceba5ed2a5711d9e1714c36ef51c209161ccedc130091bff11320b96823e49c2b0c4af03448c0a09ee125cd461304f58c0c2509eda303097c7dcb43069bc818426f5da2e59c358340fb48c0c25e302dfb0c223c95a8f61802f6496326fc6af91926cb61191f185393d725bc0301eea2301283da5186308a5cf61a6af321047a3dcb3f3b9db1ac4a164cafbcd551d6c3c89c36ad044762818ec1829775706c4e4f88f1b0779b440b5963d40e67306508c0075a323d597c7830fcabe40e8545a5b9d7868d9f03186f8ba2f52da4a9e14f963ee1d032b2ff00888d55cb3b670c57dfd0587420e35af1328fe22e9ebd5882a9d8c3a2e1a01b11da39169bc6b9db6cdd9b30798c2619e78cb5d97b89554b6ab9e6301c9935d9ceeffbb59b29d706f334ce062e41f6137551ede581367e4c25efcd35d88945656e6deb9d08e1b9ef1362135bc8de5967e6239f50d2bb52ab455b3971b5dea0d72b99196173a07db554918756e4dfd49a32dc35ccec79186ab31c327cfd84822aa2eef8aeed214d7c2bcff585ec1b28b26cb8703653a1569729edaedb126806ad682a4afd481096c41b07d8868900e0b1625ec250d9da4a9320fef0965b7b60201c1c3b90d9e809435021a3c00084ef4045602012011ea2d02bca89158c7b85280cd2f6952d99859b1b060a38412ce65838ee833d44c82e576f3c6c0c40076c441981183cace992244736b4327ef1362a30b575e7c775230301ce7be3ba8c0c17de56f596060bef5736d03063d9bb76c96f0de117ef23776d2303089ee670eb2d7c63011de640eb23e3180e7cc376f2dfc43dccfbd5beb23e21ee6b33c2ed44b180282785e8c045232568f7428ac356866b2732ebee2d1ed2aab44d6963f21275d96e85d38ac4a0ddbf0daf97bced39d74316e8f1ac0eed4dbbaf937afd8cb607cf9067070644a1bc3b8e1a8be159f22ab27cc98d06ac07dbfc647c23e45233cdb8a68b822e8999aa2da598ece56b0799189d2bc247dc52db5191ca9f99e4cb983e19ad77af7457046d9cacf9239318c67cf4a1be49a3b1daf52a9a72dec1678b204cf6d736d63d5bce39272670b1d14b47fcc26ea7bea64765b6200321b6b264431fcef25c7c1ac735b6f1d8aed154dba426459621b0d1fc0c787fde2aa929ecc11bc6fba6f7db1abe909ade5b0e568774a699df5076a5d3d556c32d0ed6143ae4db3192035b5edaba58c3a47285e3002f5ccec79186c321a880edd762424aa96fb63c833eba14d7c2bffe6857b06c9990d515d4e853a5c9ecebaedb728a469d841524d7b48662046b41b105ad61a24038112da50d2952122f0d2340381780900400201e0776da01705cf6d630f305e19c2dd46060cb356f02dcdcd99111c2f304a9d854cb64077420ec29d0cd95460ddfc6eda0a91793d20d75ec4015cad19f1638c5b6f1a034660d98ace5980522368464c8579de3a2dd0b32dc07f13b86295353603c87982dd4d8979ea08de6faa29912f40f1b8a7670853a28c4d82cb9916ee0e94c8a153657bb260e8d56076137d0af628ef305b0e923d07b2ca20443d8937fd548f6c9b1b2161e271ac0eb2bd1eb9322c0a5e562bad18342408aea7968521c062568764aaab54b6a2be472a9ba5603e37a66bd89675b51e57f2c72fc3c8cb7b98a77840e17cbb808d962e7539c731c6a319997e0ae38bc63e1b9d655794f3af0a5237378897b1a8a9b606e37e5cfc516e6c2de38675df96d394ccf5bc1adf7b42e6f621d6d34cc36d8cc5030ef1a46b7972f6ddd195c33301d76cdbb3de25564a94b2f3cc418e61f18fe1adfc41558ee3ca91e21dbac47a0594893c26b5edacd20598f96774a7646f87eaff9c575212d94b9e92d8e20e23457986b90e2bb4c11b997c7337147031d17deaa994b156eb94f5e5346c5eb97db7521b6ce32df85303ea2e653c990e7f234ba1a5745eba3f2d85b8b0350ef0d7483b85af61288867e5feaaefe75064017bdf82f20da9b3acb24005c9d0aaae4fbebb6d49861720a93c19b10dc425dc41b106fd65860eb101368eaa25b3812a43d05e1a96cbb7500cb3b2bc078076901386a0403c1940171e338eec3447ec2d612fccb58fcb7992d6d30e7e2a303e61c1c99cc05b7187ebaccd0a9de61e065c53d6d081a54d0a9ec1f1cdc168f8aa72a2c1a70774d000ed9a0d83f2000ebb1d93df40696232db4d341d4404cf180fc548cb30af90f196f232642b1d7a515e1a56a1b85519bfc5b2d24d8a9b088832245a1a234d8d255b60d83e5ef3c658af6982640fae9b1a92db7b5b8cf2073e437cdc80b2aa8a239ecaedaff002f7cb223f3593bcfda4c8a173d91d13c84e406b5fbe3ed926fa15fa95a8792dcabe1ec0863623d07ea509f945808d14d98b0c6c3ecacdba982a9db960b37e4e034edf148803ecd4b6ae17d3b32c565b93f3904af06b8c97ecafe554bb02e0ef5a2035e7caf7dd4b96879160bc445748d90f78da769a933609e272a407e1dfe3076d533a8a9b29e41e484ac90c1589be089b64ffdde96f8de0d23e7c153af2220f2ae5653a1c51e0c604a9da6eaeae25d0b078a898c8fa36fed1733b1b9d8d34c42cef71f1b03b967e238a5b51b9452f31160b56471bcfe1b7d74dd5a4a957e3234ec9cae33b77e716ad21ade330c35c10dc535ae155224f16f35aa40b3399392c418a667ef8d5d484b664a09b933c5de5b60afa4117331d19c76659b808d9235d5b3e4d66ec95f6efa83b6aa1b8cf05b1cd7329e4c8739c87eb4ba2f5d23081fb2c3d850ef0d348fd547b009444286585b1c3b66832014bd24d2f20da94ed20e99a742aab9558bb030567650307fb086b05de11a0608034a060e0040c25b34ed2c49a5de6e25c83c19d7b28c9be89519183d90d6b532f2670b06b1a7287ba1d7f6695372e76c4347cbde5be7f2cefbaf0ccfda1a6ebd194fbbb918745c37945838763d2ae927dbf76afa7532e3eeef72d1b587c3c13f978cdfd414d94d3b4e759377aa01d84992a6ead960c34066edd7875d67658da430fcc2f5ac19dbacd73365975219f8f1af0b0eebcd4b93620a5877e001b88c9b109598cd96441e3dc40c2ec0cc836903063a1a365670cc419e182cd448c19101cd96dd2d3b61d74559f51d1e060dad7909379fd9c754d6c3d564cf3561f1dfe1b8a6effb47bbc4dfd433fa50f2fcc2e6774bba7463876051fa81fa556c8e6ae63776e7386a68dc67e86a13efbcc116b7dcfc64c8dc3f4353c33d9112f7a5f8cb7facb3d9e8d56b8fe76ccc530e1492fc647eb24a9fe9f1fb7fe5a8c7f9af9213b25b4dc80fc45669ee420bf4a61b0c773260334165c319efb3354ced8b21bf5e60265b9601d1bc06f59d9d46a776187cb7266dded0981a86fd455a7b9873accf291c3957b5759f669536c2cf97d992cb72c39ade8574795b7c35569ece1e7c3953479e05f29901b0f613e489b0e671ae307a2e799f69266cab4ad63cf6077ac3ed8a9a6d93fc0b098c16b75d234b9d791f260a5e61f7478315ad1d85ad74f564b1d81b9de34d2d08d970d0049061ab1ad00a38a0564bcaee35acd322803bb27c1c7f1120b603dda769d7cb1b2ce7b96cdbf93c91bc7b01eedb5d7d35e1cdd963b0c7f346176d822f386b4afa0c3723429121d1ef8d4379ca99ab4fca01c29b1193dfd691bce6c336173077a87ed0e752c009f5698e81863f906bd850ef0d1bbfabdfd84b2214f913d2c820c80b3761a5ec37266403e5d3a156972cb1760cc197ee2060f4378240c12061286c206132c48200eca5c8151e03effba6892b26daebb83caa67addfd1a3296db9a3c672930ebbc28ec719e5aa4fb26ddd8c43a86079020c38e0f4a684dffb357d3abece3edee4c4ad4c3c0fe63ecd36384f3b66c4133c616d58991d9c173a7d8f366d13d5ad7b2f22021f1c76c6f4993628a7cb49e29dfa4c03de28f659552192907c774cfe082e6ecb2ea404336ef33b52726c42b1e0884ede68c9b104d784b8d34608e636d7c440c04979bb7403b7ad618887b1ce73e57991588c1b103419ed125b5ea20237651ec3d4c38c9596fe444719191f2186cb962220ac4a236536206250d86b5f2d447b1a8f96a6c52482498959b8b331eaf27122e3e49f6b64955a76973d7896c396fcc8c9403b245d258fb3355ebfea1edfb7fd9ceec7470e8b8ccae0f3f1ef8e420f7d99abf5dbd9cc9ebe15f9ce5588f89de237a5763a988675ed9732e61e4f360bff00b45cc9d78974f56f737e63e4cf197da3c1941eedcebadebdf996b76bc3151f2b98c3caf0f2b58075d5d4d7ec96377ab4b8ecde366581c51faea59d78515df95a8045ea8a54db0aab5c88f18db43a04bf1566f7683bb3dfb7409235d3d807be73eb514089a7988aee8b9e793628153cc3927dfbef2d00aaa6b47b2cc783c0d5e61b6aea55ccd965b72dc37df9e01d73ef141da9c2cebb6b99e18b40c86c02875ce5d38af0b8e59d5998e16ec02cef2dadcd85d14ec50fda1cd647eb461db5698e8189d31638287786a277bab3b0964429321b4ca0c8092c2ee12f61b945967ad6813a14e972fd95d838c402403fead8805f596a5a4a0972133206e9e81d6976b196b3418ce5ebf5c81535ac9ad66a2263407400a5def926d6c2eb138a7e64a08f1dad6699ae9329edba21d6f03cb113191f40fcd1fbc7176ebd5c3896db959bda7db55563096d4c817a1b6eedac5e0554f2f14e35ae3a86f4555b2bc330fb0564a68979ab660454f773105d68cc1fd7f0d3addbc191ad97ce4ce29b506295e67ef1c515aea220cc8844878de08109bca6b49b10c94b93b6a3ac2f66bef8708cfa80a9ac06830319b95001e903acd2181b231b8e6b59da800bc04174ef068416a64fcac23c34b99191a1192864f08dd740c91c6eca06439b281930d9eca0643f0503288d9b5621b8943c1b75a6c1b121fc36834dcbcc87e0989a3232781a2acc5f2360e61f87200da7480c1535b26ddab2eadca7e62c5c88844cada0f7c37d753afda8971b7f4a61a2cb61e23ec6b113034cdd1ec87dbd1c9f9b396ce1bf7da567c37171776ac3add7ec65cbf99f0313237e91f141fd34eebf63d0cdd4f67379d877e2ba7a480c3e1aeafc9943b74e1ec1e63c946200e2685e7c192e9d8f45fc7e6d7dddb21537c2e846f17fbcf288364417bf0991d80eee79ff008a5a16be16677820cab8eca000d008f84a9d8133331ce018112675a9ea9bb17f6554286e3ee803437deaad9256ad132e8b8980c625a03f8c6b93d9bfb3ad09721f35c2f6d4daa864341cada798cfb00b1ba596af26f37e15d00dbb1c5344bd73791fad07b6ac32ae85890bbc2076d43bcad8d1e43694f0cc33f90bca4341d74d8320d743bd6812abe5b099b3b6f054d5768f0e5ebb2f4900cdf403ec402b16a5a3e3838e9d8037a5c86cb0d846230819eda8ad62ad669a3c6d1780a9ad64d6b2c20c67dd0d9d66699ae9992b7db10eafca9cb8c63a2f18ff005a797d0f57ad18cb85bb74e57cf774adf7ca7c6021a3191ef82da5998079868d94a9a0f6554ec3c595b7a12edd6c41b4d8c4f30e2a2c3037aed85c6ecd712ba9667e2637e5ce5ba561fc36d23dd4440596c811682464d885264386227792cd61532800c5c67a8f5aa6b01bbc6070b1ad58361a8d832432e13bdeeda00e8f196665acac198c9532322019b4d03246081930c103288d96f7d03285d040ca2f0d6a06439b2b10dc487e0de9b06c4a2366d4646509b28c8ca2e0a6b5ae98446cee23d86c9c14737da2d2562f74de6249b62d0ea1c8bcf370062f245786c36e1aebeadb98723b3d4cb5599c531318e09eb03f889fbb5661ced338971ae6fe5b722ba7a6cfb37171f76ac4bb1aaf9873c9d0e2e4c8e39f7334151ab60fccc466397e4477750d9db5d3d7b90eeeaa98233e2565c999222440497ccec5ee4d8911aedd6b196a1618e071a2e3190d88c9b1557981cc75de13447ad2ed7f52a94cb5786c2378763c5caf7df66a5b7617523097c7f1e686ad67eedb58b51b86820c37345fd7535afea642e39582eccc8331d8048dd2cb472c2e68ff00114b590e79219f9c00edae89b5748e5b8d73ad01fb6a1de56c5b640fbfec29e198524bfd6a3fb69b06425e0b6ecf6812abe5b51665edb3edb8a9aaed1e1cdfeaaecbd2ddd9402040c1e068182e8eca55a5e351cb787b43c498eb52da5efb365121b766ca44ec4f6b2e22434a9b26b59b0e4dc204a9be20c7432bafd1d789737b3d8cc3a1ec87601773c438f6be6425fc53bcd183511d976f230080100e3400b2f896e814a9e1bab0f3a37de797f0f77cab3adc5ccec5732a6a7e7822c587b2dfe4d63b7ab076bb665cfe59b622661beb994e1d2d5af2a49c0fba1635b66886cc898d620871a55a6f5fddb69b0073dcc8db460cb437bc7fd0589a36b3880e16b776d2e681751e305abc79322c1941732202307d75979930e35a81930d9591945c1eba06511b2837261b28190ef4640890e6ca0d89446ca1bc8775940c87305a7888c010109eb4d896e64993e16f26c49530ea7c81cdbf78b5f744d2f9a0fd5dc3df5d8eb7672e3f67af81bcd984f1514c0c46f04aee6af74dab67abe74e7fc54bc74a0c8c5d167bcb14da55dad953c4e6483916ac94226a99eb7b1bab6603bd8482f819c22fead11723d15bfbb7285dd63626c6e1f1256702e68bd667b26fc235ae5b71d20075cb194a9de3d166018ac6714238ebfb44a89c993185566737c52b07701363564b9dd843cb20e3b341e35e763c33a21be8ff00abbb7ff56b992bb02b96d9369d33b7599a37068e405c6006a680c24b0fda9c201df54d855d2f96ec6b59ee029ac56c3f2661e2bb094352b0fdfb3eda0db0b00b67999ee02cd1ec7966739a2cfc75751d2ebb9baeb167ee2015e833040818586261f8a98016fe714b692ece918e8768858a6b4a5b597b1d9053c548b596cd069b036cf426c6b4b6b3a572f635b878d00b7598778be93adae21c4db391b28dc220643fac546c2ebaf288c13f061b6751180758940cd914056e5a498b460d6d9a56ee1baaaa246631908ce410fe514d15ca9ab0fcc9953c9cab03dc02e4767b3955af5619f901c5200bb429b572e9ebb61099b6d688facfed110ca97267aacffbb4d8097138471a77c43a3afe1b6b1376db0830ed04b9b85c34cda21a57854c88b1054c8800d17ac8c98608194461a365646511b281930c2e041b94461a6c40c87365022439b28322439b3d443790ee85db028190ef465a3039b3d7400e68896624c4d893620f079f61d6a4452b253277b6e26f5ad894bbe330ed583cdb19fc0c7c986d985921bea38bb15b65c2df4c4b9ef98bcb6051ddd3a0d431f865badb2f97330ccac6651e640882c35d2ebede0ad9b2616b8798e383c5bacf614f34594bb41c6940601c5d09330a6b279cf97d93b3e22cc6b3ad2a79d9831d66eeb4d8d096d728f278a66776d826c6ac153bb2afef0b5ddacd3227054c65aae5b8d6ca699d8352f63c2cd10d8ecb07a77d73257e12e31e01ccc78e08dc5347900369d0bd4d018c30fdb9f5d53615748c485d0b676cd4d62b622ccf0c5d3b1286a579fbf8f66fa0db2c819b8a41db7e859a3d8f2c7f339b632ac0ea2ba8e975dce81758b82fac8320c45193c356ea56d0d9f29e36c6b8dbe6a3d9255a5ba88c85895494b695c470b567672957dcb303c66503a81adc577575e50efb3a299f0874afa4726110039bfb66bd360c34325675d00c5e4b590eea5c8c2b659830d719d21b03ae9769f586eb5f69729cf739b99ac91c78e4410a31fbcebae47677f2ec75b4f00bc4da1a173aeb013bc42db2b1140ac973d861a306b6d362ad49984872b2b910b3fac73a89b152e6cd43201e22c0d80d0a593265711012a4b995985e2b49d2efa01e1a500ac404365ab2d1a6172019c141b934c103286cb965ec0530dc41901dd04361cc2edd400ee821a890860836243982f20650982740c9a1b6b513c9530d4796598fbbb37230ce97cae435b7d87174faf7733b146f799314dcac7181ed826efa399a6ef94bcd2c09b13c9eb491a36faa99a7b29394e31bac7d75adc3555a3960e13a1be06a6874f584c9870a2d9be9ba0ad92c7cee23aed9b8ae73364adb0da86cdbe0fc34ada6ea58351822803ceedfd9a5d0db2d7938f8f927641ec07bb7127b1e14696c80eeb03ae77ae64a99458c3bb9adad5a2f5ab8dadb67b8662d28ae5518f681c2e61faea9b49f674283a1a6814b694d656e59ef7a7be978375a18e174a856230362f8d9d1ed9ad519acf2e73cc2f5d94755d475fad1c3043b0ba85c19ad06417b08a32231ecb8fca06412b68753c343e134003b8b9db652da5a38e095594d691bb8b71cc936f0ddf2440e0403907b6f2fa1e8ebcc391d9b72d07bd76fdc5d245077d641b0f43b686509e940446f5a162f258ac8196f36c01bcebb6025caaac393f3ef36b93af831c48d93f8804b93d9dfc3ada3accae3d96d8638517db71c35c7b4fb2efcab56bc2b41d77bfdc5abb2a2cf649cb3ba2bcd1ac28401f7ecd37999fbb57455abbab63b08df2df2903c623f79e43fa0da6c550decaf82ce85cc95532ba8e0765e95254c8d0d85a60f404a0807efa022305968cb100db2d43dca13040c9a60b26c04782d41901cc2e4361cc370d0111806c219890868322411838bc8194269d03288d6664d882bdf6254496d6db2eaa74dd2eea3bac7921331d1dedb0783bcfce2e9dafecf9e9a7ab8bf9bbcbc0ec537807f38a6b429d5771de5b0f0b224750159b9556ad0417b8b7dea5853550e65eb41d302d77a6e84db259579e709d066dbd5ce66c95d605ef0a67bef187f56095b54ea119393a8efb8ff002897436cbee500e162dd7b70cd27b1e14696c990f747b800b992a65558e7bff31c7dcd6b571b5d0f326051414572a8cce3a37173667db4cb49f66f9ad2fd9d40535a535999cf1f7520c3ae9983758ec36a76123036344f05a61f8eb34235cf2e4b9c3ba63a7db5751f43d48e1895d1220906c1ab579625aae4e8171f88fd1a8af25cd9d0e0b36e8df522095c070ed0415235a0375d6990df34eead3329f6ce21d42233c084d470ea2faaeb4621c8db399120168d89a412f43cf6d61a0f20d7bec3d414892db43c691a012774e20d88f672ce71e67398e9c768b47d982e46edb8974fafa18a08c6ebf79ae6cba785870784360925c8c049d25b686c0db5a8811195280392a4684d883634e5d0bcbae4c09d94f1ce8fcab3fd35775ebeae66eb7b0be729e73b386c8fb98da1b6d4ddcb64cebd43c40d0a2512b26b520a9121a50c250402359076d20177846806bc16a0158801cc0d00c36565b844616820d80e7c3b340ac80ef036801082e5a6a039820d80aead00ee820043588688fdd2740750e409fe2b979d64cb5c53bdb5d8d3670fb555579840d9403fcb25760751f3fcb0e03aed83601a2b2b2d0231e764575e34adb06ea8526781c69ad6aaebc24ec4b1e727515ba174e25cd99e56105edbb166c6695ae4e4fcbb4f06c18296caa5aee5665cfba43b66a0ed4ac886a0ced900cf6143483621590b863cc2d1f6d6acd6d743cb07c8029ac5d1538667f6a5ff005d12659ae83b121e4a94d66472c7fb3645bbe69f2a6abbe56d4308fb09525ed5ecbe200cb33d1602dd48ebf971dcb1fce3aa9abe83afe18cbcd744983d06c1cc8715d000db359bcb1774be5e81c061a050de50decd5c70d8492a478077482a577ca71b8b9403dc05d5e853328fb93887468ecef2efe310e3c4e6529af61937697a10bcf5ba162cd5555919ec4568de74ac535aca6b5727e7ff00315b6a3d80447f66c75d417df95fd7d0e598cc9655d94ebc44466f286f1974e23d5a889c469aed9a9e4dc2591241a1bccb5a5c8c296f7f2322c6aeb3e2389f102630d061b979c7e5351e38def3c7ef13620a9ec61d7671c4e56e57e0b5a1eb2c5d3ed57d61c7d36f6973a640c8af3df5c3bdb32ec69af0b58e096ccac1a06c47420a94c1b6860edf40233590406809500af04030cf4a01bec202230596e03d8e5c836111f616404775200435a6a111837b6836023bb4b403bbb28009edf58869086ad1d84e80d4794f92fda8ec12f8c162bbaf6733bb55c73f85d8b740f4181a6ee4bd7707cb336de1bfb695aa5d2b4078e77581768db7136d066a86779ce7def8835b0aad30e5f62595de54ccb9d32b2c79dad3b7add946959443f1501d8fbe1ad4b6552e87caccb63023deb97d8974621600f5d3ddec025e98362026243f6f71aed17ac598dae9199d58b6af5358ba2b71fa0e43c1d4eed12659a033e0620d932b0cc2f712a535994ccff81e8df34f95356979401be144bfa89525ed5b664edc5cb3ebe85ba91d7f2e3f96fd68ec54d5f41d7f0c482e89307de836171cb11b8f3ef31d0091792af2e9b8f0b41437943795c068465899117f74bcc1532db721c6e2b4ebdd75dcfe9f5c4b97d8b36f4d22bad7e5cd9f288cd6805764dbb280a7cf663eee8bc63db3f76a7ecece1569a72e49cefcd4fb10bc4ca2d67fabb00b8f6d9cbafab4f0e54f499d3dff001120af33f76b16974621a2c343e135c63d66a6b49b12b60d23ff006d292c42bce33f3a45805a3ed106c4b41121b10dab3a8b769f77979c43a2f97b84e109e4643565feedb5d7e9eac4387dadbca9f9ff0031e3329e103622a5777670a3ab5c29e2039b6b8f1ccaebf2b38da564a91ad1e84172200d020fd9419018d0c260d8403afb900ac40340ed3402bf520223bd65b42801dd596c39d880164021a80e7a475a0d80ee82d341cf5200475790009eda7403f92e79c3e77683738adabb423ef465d03ccd7805a0640b6fe1a37a1d11871acf1b032b8276df6776e25d61d5aa9dd66d3033d8b37153582f630999f7aefb4ba30e5ef557e04d842360ac58fa2fb0200d4f0391b07a1c535976b745c305a07a6c643ddae4ba4880c0a5483ec201d890f9f6baff0068bcbb5b9d3b2d60e2d4574b0afc480170837ccd60d9159b920412c03a9620a9516642dc4340b5acf86af94cfe4239f501174db8b985ef90699ebacd1bd11cb97e4ff5a35751dcd11c308ba2441e07d9bcd06c3a072b40e145bedd66a3bca5bcb6b102d150de50de5601a836515962648c1c748196b6ded0a9ac1532ec1cb78dfbbb16d33bff00117d068ae1c7dd6599ab9342be43cbd010f51a02b39b314e4a8ad4801bf82a2ecd7853d7d9cbe72e6c9efe4732ef1448019d0db66b916abe87af3c2be23202e85e2b1695b30d4470b834296d254c9783374b5dc8130b38f18181ee9054cad7138d3c9e49a881af5f78ace9eacca1ec6f753c9c96313863b34704176267d21cc98f671f078e5487641ed99af9dec6ccbb515c2ca3ec25e9e4d8e4701ac1523638684172203482041719064187b6860fb2e4020404bba68088f61010de80699e9596cc33d1db400a6772cb61cf61010bbdb43501de41b01debd69a0e6801246caf202bcf6d3a033aecc387cd51de025768237c65d6e5c33e6290791744bc280777f9c46f438c392737c0e14f9178ec022b0e8559c76639e08cfea2aab05ec6572deeaf3db564397bd4e5a4b653610c0a8f240476562c7d171863b9f378cb6014d65dadd3b19ab080f5dacd725d2051c2df1a7d4404f8930f14d075cdb5e5dadce97933bb166a2ba5809890b4f8dd4058365164f53467be7a1054abf991e6ed067b0b5acf86a394f87f7585bd445d36e09cc261c78e1b800b343f4472e7b930be43bedaba8eee88e187faaba954bae45632371e63416a56cb0d92ea18c6405a05ce9947695f35b3b695329ad037717968f6979aff000b41c8b87f1992f1663dcb2bafd3d5287b5b1d400d7d038a1e449b4749200500d1796fad0431c3bd405ab21a12b6465af0c2f3bf9578acefcc47118937ed037d437eae5768edfa38be6793f33809164860acfb705cedfa25d8d1d882c74cb543ed355d88b2e9ae1906825e5e725e040439651cde01b3f2869bafaf943be1d0fcbac3f02078e77df1e8e22ed74a9eae4f76decaff0032b2b6c70883b6697dfb99d0d6c5440d2be7dd95ab40802d904152340ed04172236b6d020c1ea5ba106411f0cf610c1e06805bdad190781a320c3b35ace40430d48c830cee464e34cd1908bdb596839a021782e586a03ba83a101adb01dd4003217906027b8829b50ce665901951e5ba56007f4d5fa24adf3c3e85c332c3bcab08c076da5761c3df3cb8ff003ec0f9f91d4b17321d1d0e45913308b66e2e9f5c6f554866e8e61b67b69f08b7c65556d5c0ed826c21c61e349b9375c3418c0705a3ed82877cba7ae1d2f1e76e3a133d75ca55100a39f7b343b7620d88118f06dac9470159bcb5b9d4323a71c7db50de5340182f690004b868d9601e2a3b3f5d320293984ee94b753e1abe50ff00080d295b536e03963ba698228de8f2c2e64ed75dbfaeaea3b7a3c3086ba88b5cb47ca10f8ae9bca1df61b25d220b3a034a8a651656001b69732f7023df90321bfa3869fd58f6927b1c43ad72ce35bc762c191db3d6e2faaeb6a8887cf763672b075eb4552407641b74ef404d20ed1b1681bc1b5abd006477aedb5e5a30d5794c60d90a5cdf056dae15d91c4449cd1b321a1780fe19af2daa260eaf626b2e61cc9e516be2e21de09fd9ae5767a70ebf5bbb38653ee4cac169d03684cd9f79a941f16177cabde58c0e632c71e44ab99c7fc36c37d5fa230877ed7533e1c585c11d162eb4d3d61c98b7b4b917364ff199b3ea33a17cef7efcbe8ba1af8091365738d5947bd0070069da415294376c41722fdb4082b2d4190850c1e1db403d2b20c33b761190699f6b5ace421751908b66fd28c9c461a6fdb4640791790685b6911ec2007bd61a8426083a1119adb01dd4004ed962f20c57c8d5a37d36a191e7cbdac5818ee1deabeace652ef9e1f41f97b31b9de5f63defc958baf58e1c4df3cb9ff3bb3f3f2ec5c787574387e79e704383d45d3eb8de10387601a7c27c654b359e03e56a6c21dd18928fc321d5b68c9baa1a582cdaec76addb50ef974f5c3a000709d683a9f0d73d5440789ff37d737506441630eeccb5a760d26f2cee755c89fc9286f29a1558b33e119ee221a2e35d30de3d8004c80cd6424f1ddbd6ea7c36bcb1a71ad752c4ada9b72aa46a9e67db451bd1e58ce61d334d5d476f4786136bdb5d3d92865d1b9561b6c450bd73764972d7c7d9515ca991cc85a37a6ea2a65a0e45c578ec9719d1d0cabffa76a98973bbd7cc3a819808afa9af870b199097f1cec0596c700008d8801dd0b9d00404b23dd201473d080978c80f6f6edda4341f5fb680c767b931894e9bd1ee65e3f79db6d4bbf5654d77e17181c6f858a01b81eedb468d582b6ecc9bcc33f8115d3ea02f7b36c43de9d39719bf8f29d7bae6be6bb36ccbe9b54703a3a96244ad63e91d94c892e4682c9278693404bad6e5e411de9326412f41203dedac830ef4045b24804668065e86d09e94044b0d2134040686d0a0223b16da0ee9e84057c83d0bc86a016e5e69b536199e7667898777d856f5fca7df1c3af790d33c579681ab5b26e02e94389be3956737b374f906b9575bd6702e6c66c9a5d435d3ea5b8377018fee2c5b823502cdb35b41deaa6425ecd43e31937ddd1b6b77f04f5ebcb5789ef736d7e4543775ebe1b50071d94601fa4504cac8458f073e60cbae95326c1d8c0fdae07db45cadce9790e1f823050dd34020eea3800220cbabe74971ac4c87bafa1b4c81ad9cdc00ec26d8fb3a1e10385890bf7014d6f29accfb477ca3ed9a6d1457cb1fcc87fb44c15b475fade191c4c6f153c03715bb25ce9753c6336d8b99b24b96823829ee966459ebd009baca99750e53c68633161d73d6be9fabab0e2766f9584878ddd00aed9384daa044467843db5eb2234200700ba42008743ba400ed2013a1da400f7a1a3b8c6801dd3708ac05e67255b811ee9ab119c1baeb962b9eb25c2c6bbd73d0b9dfd42d88753ab4e5cea382f9ab5b32edd2385ac700b12624b95835b49b125c8d68d6891165c807d8b72f20c3499320d30b75af410069403ef59065e8088f6101098694033bc24365de58801dd586915fa900c4368b65003bdb1ad6da0a6800cc2ed66bc86a02bc9b53619ce6ff00f0d3f615bd7637c70e8dfe5d8fff0022c80fcab8ba50e1ef8e4573633f392d72b6a9eb38173d336cafaeaaeb58ddca2307183d45a36d5909f414b0e2c3d9db4c87bbea13041c299796e2d5fc11a2ad2f2b071724ec8eba8b62e6c221fce9eab172e65641f103def6cd2a64d83a085b946bdb4db95b9d0659dcd07fde286e9a148ec9e2ba008832e1f9a74b11e3ee19a640d6a78e1738407b89b63ece811cf8586dadc535bca6b33f06cd07db4da28af962b327c5c8bbedab68ebf5bc2bf9461dce9bca8ec59ceb78748c78695cc94d65d440d37acdf92977cb703c66500cf603de2e97535e50efb3a29bda7d85f50e34a688ce9bcd0548ed6b4f4edc4044d06b404a7b1a900081da694d93a6801cd0f4af311403e20384779ade0a83f22f5ad6ca326c394f3e4c3328f1febae0f7adc3b3d4aa8a382e1fdae9dd671c2d5e4312b065360b912062024674a088d2b522afa294a53f0af597988899ee667abf71362c631bafcce76552b48e34a6d7047d1c5aff002f42af4f52d6e67881b2f4d7f9bf37d203cfcff9738c7bc24be78992a5374e87dc871631b543a57a2b4a57855ff6a7cf5b4c7dad569bad198d7111f7ccff0010d4e73f2be94e8fdeecb7f738dfd8af3e0d3f7b5f0eff00e4afef9fe2f2bce3e5717af9bb2b5ffe4e37f628fd3e8fbc7c1bff0092bfbe7f8bcaf38795b5f5f3765bfb9c6fec51fa7d1f78f877ff00257f7cff0012fdf0f2b7ff005765bfb9c6fec51fa7d1f7bdf877ff00257f7cff0012af37f9595f5f3765bfb9c6fec51fa7d1f78f877ff257f7cff179fbdbe567e1e6ecb57ff938ff00d8a3f4fa7ef1f0effe4afef9fe26fef57953ff00ab32dfdce3ff00628fd3e9fbc7c3bff92bfbe7f8bcaf34f9515a747ef665bfb9c7fec51fa7d3f78f877ff257f7cff17bfbd5e54ffeadcb7f738ffd8a3f4fa7ef1f0eff00e4afef9fe27c6ce794f2df1629ce5918e47d34a3cfc68e0dd2bf82eaf0911d6d0ccebdf119f4afef9fe2273bcb9cc5806067b8419ce5f70686198843d350a5694f4bcd8f4e9f4ed0a46fe84d79af30356fa5e71f96df4900cc969f685d64e8e3674e9131f4d2b45ce98c1931834d78113c176da1e4043d283a10bb6221e40078f5a641b0ce7367f859aafa7e4abf86f7fcb9ff00fc2e6dfb1c57175e7c387daf2b0e697ae7ddedae576255f59c3f9f03bdebeb54f4a556d516659b4a3e9b2f695b1394f3c04bee6801322705cf24cb3c2174ed598967d571cb3c46af03df3536e95da1b38816cdd7d45cb58971e173a61db7100fc632659403dc0358b31b9b89676b06a6b268526259375f378f716dad859ed5222076d035abe3b3dfbbedaf25459ae3d38bec5897296ccf81f09abff389f45bae184967c59067db5751d2d70b8e5681c28a01d74add673ade1b3880a6aa6b2c80ec1b0166bcc956f0db7284371a8a676edafa5fe9faf30e3f66dcb511d9e29d9b80baa8256ad05a82a5e9ad3d233d2804d201c7a50009e934a6c8f6100219a1e9a1c422b10166cb36b49f62a153997ad1da535a4d871fe647bc5664f56c02f9cedd9f45d6a9470b4b42e6d14ed59c705e433235904d82e553cee6e872c4d1a56b4e9e10d7a2bd1e8278295a7f2d2bd09babf3419d7fcf0baff32f969f898980e5bc639585867d9789e8cc77742162ad836dd6de8d14a1d74aebf6671888f04ff48a45a6d7b736700a5294a7453d14a7aa94523baf501d7bfcbfe35fae4725264452ac47638d1979c6ebc322173a2b695696d6b4e8fc09daa1cfefdb888c9d37cd7e6a6e23a7279401862dad1c78d97804685e8e9a910f453d689bcfd1e57ab4cf1672428b24640c7268c5f2a8d05aad2b42ad4fa2a3e8af5ba69d092e8663cae5be43e7376a746f0b30ead958e528d156d2a5295e8afa3d7d155af592e77d3eb0862728734cc76433171725e7621f0a4803655ab67d52a53d555e7acbd9db58f3290391f9c0e4bb1430f2ca432206eb5468ae1172ea056b4e8deb0ba3f897beb2f3e6a6339857e530d97c53d463270de84e952e007c09ba953e91ba94e9a7f12f2630dd6f16f13906bc68901d8bfcb467f2c1cdcff2ff008823c3c886ebe510eb520171a30a52a14afa07a68e56ee8f5aa7ad69ce1c8feafaabf1fbe3f1651047622e7f98e2470a351a36626351d91f4083627a4469f82945c9eec63635999a5667ccd6041eda91e186879011ef69074057510f2013c9906c32fce27fb34d57d3f255fc3a2f90000d797d2cfaeeb8baf3e1c3ed7958734870883d85c5ec4abeb38973a05ce999f5d55d2955b553cdecf0a063deec2b3af3923b1c295a0bbea6b4ddd382b4f2b2741bfbbaf3f6d6224fb545e334b4d3c7b666a6dd26eb6ec03bd68cf6ec502c28f635c5404384370a6d86b1663736d933b9ab2dd0a6b2680304dbbbc3b5edb8e2db5b03e4fbd911fb0681acc820d9bb21792a2cb99c76e3acec25ca5b28659db8e3f613e8e8eb860af5751d3d70dde3235a00a5d8e3da5a08e09744b691511971f7c190df34feb69e4adf6c43a8418de161b40be9bad3eb0e1efe6577040385a75a6c5e12faa5e3365b0429b1b607c3324b78863c3d3b091881e4e05ecd621ee72619a5cf23e4c07776565b457dc801e4f5110f044467ae9b0069e9044332cd66e4da07a94bbaca74d5c7de337e6baf76d7cb6d97d251611d2a92362c19bd65991ac83882a551cf14e9e56985da67fe3826e9fcf07f5bf3c7edf60fff00357fe35cb7ff00e1a5ff00c465763b5e60bfe8bf96dfdb1fe6e1aa576c901dbfc82e64ca4a6e4609e20ae3f1ccf1230d06942a13af548ba4bf0fa4ea9faa7ec733bdae23f17db2a2cee67ce8cbe224e3b21887ab0a40d28fdb12a35b46b42dafc1b2b333693694d359cc4f3fdabacf41e57ca4fe57c5ca2a63b3bf76c09507225d1c27bd351f0cf747a695eef417d35e8fe0aea62270552d6ac5a639ae67ff0029dccb651ae6ff0031186a63edb31b14fc88cd0b87416dea301d0e00d2bd027daa7a519e65e7ac7a538fb55dc8d33175f2ef2d3a4e5b26cce7e5367959916a55902ed5cad1be19d3515e1d17d6b5fa5795f0dee89f922222318e0472c1419584e7176bcc93db170a1323909a0e9ca6181ad6adb952a9074d0dc71c1b695a5b41e9fc28af89e5e6ccc5abf863edf0cf79ad302040c77293b2a4e527e38ca43d94974e8a90bc3a01aad6a6550e8afd3f83fd19bfd0deac6666fe227ec7364b5a480ea5fe5b3fff004dff00f6e93fefb29fd7fcce67f57ff87ff68ff3583a5d1cd5cd7ffeb93bfe22e5f7ff00e4fdbeac57f253fd9027bbb144f109ec21980e61a506c0491a569a8564941b0caf38ff008711abfae559d4fc978dff00f5cb41f6ceae9c7871fb3e52f37eac89b3d405ccde6e871ce7265b29401db4685c179fe05bcbf11dea2bbad29b7b2989071d86663af7386a9db2342e32702d69a8e1d448a58fd9022205d29a00d8641b4adb61ae1b5774f08eeb3717315413bc3f0b23d841908b9799f9a046d6773559b7b850efb52a89615bcbc07c0e31efa25bd89647bf0bfae9723588c607cc4b5e5cddb2233276c500450aac3359979c1c5c8d5b8a8d10e8d18a0bc80d5d85d474d82cda0a5d8e15a5703b89744d6968f94e1f1e6f18c7402e975a5276ed886b42678c872d9d40f01b7e1dc546dec7ab9b4e571839e7071cd01da6f7da75d2e7b52f2d5737e699f98c6647ef68af9597d9c0f86953dc974fa9a6261b5c7e79c771cd3c63df18778dab7f5b2e7efd383647323e1b0c6d9f768fd6c8d1a72af9dced3a29d811af58d9fd4667f6ff00b29d5d3cacb97b99e266a39d83c1780fbc6cd5dd5ddec97b3d5c2d4d589511e9402699b8ef3443c5832069b00d967dd22588f2c4f34c9e140907d85ccec59d3ebd5cc22038be6b64bb745947d1b695591759b5b8b6cc8d0d282a4365318ce4f1cfc13ad441ea5350fae8435a10d7f90a94aad56d89cb74bface56590cd61399f171b977cc862ac3ccd6838fe678fe80e2745b4273ecc8b7a85a6abadafb34d918b792ebaedaed37d3fdf562a77f97de64e2d0f0f97c6e4a0394b999357a8d56a35afa3a69d35a74f47d0b53a27ec9595fea94ff556d121bffa7fe7dffa8c67f7a15e7c166bff00b4d5f4b7ee5bf2ef955e6e72e3ef3f86c96322baf8d01d2e332e748d2bd34a7438274a7a7e85a8d378f05ecefe8bfe68b7ee5e3980ff00306e013679ec6540e9512a74c4f4d2be8afc25efa5fea57ea7adfcb6ff00ab3796f273cd2cbb919cc84ec63c70d80891ebc7682d65aad6a03a283d3d1757d35f4acce9b49d4fea1a6be22dfb93b1e54f9bacbb39e0ca63aaf64e3d61ce70e43464eb151a0546b53a1576469aa9e9fe147c37793dfd138e2dc7dc9f977cb7f3979719799c36571915b905437478ac39d2434e8a57a5c03e8fe45ec6abc7879b3bba2ff9a2c9323e5f79d59219c1372d8c74724db4ccda71238dedb0446dd34852db48ebb3d1fc289d579795eef5e3188b71fdaaecaf93de69e58220e467e3647816691e3113ed50c5a1f50d4c69422e8ed56abc9d3696ebfd434d7388b73f72bfff00a7fe7dff00a8c67f7a15e7c166ff00fb4d5f4b7ee4d17fcbdf39b8f88cbc8632247f4d5c9157e8e5b4a76695a2f63af6796fea9af1c45a7fb9b0c364b937cbc65e81c9814e61e667c0426e61cafcbb5f87a2e1f4747a7603d3f4af2fbe9a638e6526ca6cec4e767e0a7d91f6a831f19e649f764bd591365bc72a648ad3a2f79daf4997453d145c4ddb66f6cca8b4c7d9e20659a529943b8866109ec20d805234ad350ac78106c321ce9aa06857f5cab3b4794501c6b90e26e685d38f0e3f67c84e673fda2ef5c173379ba1c7f986f7f38d4701db751a170bf315906b970d9dbb0d55d694dbdcff009664b6c3c20e8aa76c8d0d14ee18ba61d8eed475b2cbc08c4836d076cd2b6d8521a690f7cbb5a6f529b04ed9e01d3ebe84190970760ca0046d6772e33d27e56ceba5512c198c0b600225bd899dda0f6d2e46b1b8900f152c2d5e5c5a51664db74c03b08a1baa191ce3d6e35d3eb9ab7442ca32ed1db7f6c15d85d4758880b9ce158706a147aa6b36586e1c5c68006dbc6bb1f2b97b570f3df2be11a11d67de38a1dfb0aad45c707c605e025a3de386b56a0a4e192e6680131f8e0424f6bf760a6b6a5f4dd85ec4006210321a0fed16ad5f64f371b1c1b12078c6f04dd5d62e6e8a770dd74ef63fac489d5c9bd2b6192e4bbc79d66b21ee6c5d8e9f10a7b16cba41986f2eb46ccb89350e01c52b371320b95903368058bd64402002c898586975f06ddcdf9f265b8de0fdb1ae4772ce9752ac5475c2cbb330b58e08c9530b06816448b0415296c5a0f5eb0fa42a34302f410953a695fe4aa1e82a6070455b698e8bd3f996ff00eca3dedf56be4b7d64dfb8b07ff8746fd0b7fcc8f92df591f25beb254c160cbd58e8dfa16ff9967e4b7d65b8d96faca23c260bfe8237e85bfe647c96fac9917b7d4bee4c17fe1f1bf421fcc8f92df5967e4b7d64d3c2617ff0f8dfa16ff991f25beb23e4b7d6517dc989e9e9f011acfccb7fcc8f92df5911b2df5934b0b87ffa18ff00a20fe647c96fac99179faa2fb9f1167ea31ff441fccb3f25beb23de7ea80b1789bbf5263f441fcc8f92df591ef3f57858bc4907a2147fd107f323e4b7d65af79faa669a69aa500405b669ea11a50694fe4a2ccce59994c0bc664459720a930d9b502023c1ad06c029008810af742d4c836197e6180730da8e03b66afebf2f6d38a4be85c0e37eece57851ba80ba71c3e6ad39bb9ef333d61c878b6d71fb939b3a7d68737c7c3727f343566e1dee264462aa76cacbcc58d762647e3a76894db1c9702c9bb3c03b6ae9979adb2759e3ca303dc50d5788c79fce752c4ad817cf7ba052c9a965b36c00d5be9520b07ab2962dec63608e673be54766e5e50baac3bb6b1b61a5b471e969a3ebf0d01618ebf8eeac58b955e44edbccf7137529d2cce6cdbfbb6cebeb5569855565c34902aa614d5d81ad2a0a38f61b0ac27c2fdf5556a9acdc61198933240cba5c10642f54fab9760f96ca843375e0f7206a1df5375556d07246fe2f82d3b6327af867be9fee274e12f2f04195224331dd1394ceb71c31464a98c29ccce6731c5c671459078fbc5bd756a68d0645e08ae9c702d0c9a65b6fa9734526672afb806d63631489a61ddb00a48b29d3af0ce72c78ec3f8be2b45f784af867b8991bf0aa75e5a9c6339594ff1a43a567d9ae974f67b4b937ab5b12370857627c21b8bb10c96e202a671ac4f837ed72ae7f9974f6a306c02f9eefdb9773a35e1491c171b2e9cc2ce3a325cc2c23ec2d9522dad282a4e3bd681e068078584b2116f6d203cb2edb586e0aceba0c844864cdf4034cd0203ba68361099e95901ef402bd0d3dbc100532866458583ba82a48c010215d20106c029008810ad97a9320d833078a3c8f3363e3db7ebbdc57f43992fb338a3b466dee0306005b0162e9eee21f37aa73771ae71c9005fab635b8b8579cd9dcd10aff2e2071dd91943d8d86d5d78c55e6f92e7c0fd932ec4bd125ec721c246707291eddfd6af9979ada6764fcc1ee199d8a5aaf1b1c2d74356b34ad81711cf8fec02964d5864196ec6812a4172c336cf335bd8c6c099e3e2e79a65a5e50baad6585de2190dc04b6931838ec2daf73c3405ae3ced23d5b8b162e545963d0ef6f426ea53a58fcf49ef403b0afd30aaaa478f5aa6614d5d8c02e5cf9e5c7ce177898ddef18c7401aa74d70877ce57186cdc5c49c891207c481e8e1a7ebbe12faa9f9b3240300fe58ac336cf867b8a1ed4e5768152330d8e0639c5db306cd4b6ec371a16d8c936c26423ba2128f5b8e026eaec26ddad2bc00d6523cb31133675a6d7b392b6465612e783ed4891a746b7356daa6b6cbca530ce729e6f22c6665c806aff00121637d8588e4cdf5c2f8219bf3ccdd1d67d74c8d1328be7c34b8f87c215dfd3ab0e62c0361553407deb20c33b4769014f3a4eff0051276db106eaae65c533d33c666643ddbb1b5f33dcb665f4bd3ae20f88176da8554cad99004173235ae18af3095282300f0e25f61ad83900fded0b208f4fb680466686d119dc80602c34466ddb7a007334080e661b6836023a7d55988683de991008dd01059c020782e4602c20d84482a56c3a905ca1306d65ac87799b9032ad9616a361ba952f05c77ec02f29536d66c3cb5c3b83324665d1d0016377aedf529eae3f7f67b8be77e64891583d428ed6d2ba5d771a9613b3b2ac01d066a3d34756f7c3a962f02de1f02d440dbdb71553086f7cb2bcee17635df61c59d2dc38e61f5679a00dc054cf832166f3dc5e60b2efd5962c7c4ae0cdb1778db76038a6b79362565cb61c58a07d7353f64dcae275971a9b50c972f1f0b8a6b50c6c53b37bbcdbd84d8f05d57af077b2ecdf4869341e2135203b080b3826e70bea2558ab2872cce93f6ef556937539fe41e327ccd74621d1890467b09b106c4bb7b36e8e9af40fd2b9da7ef717767ec69630b3485dc90d7574fe1dafa1746b8432ac6dc1ae41b2e0d29d0e74b6075a70ea5f474f4a8b96ad84fe61b93c85d3c93420fd8df7435a569c3fe3a57a126ff79da950c949a72cb5c01b8acf57a3ff006a86d15746565cbad038d33f78bd565aa877d40122729f8b4aa66a8ab9dd8caf2404469ae8c59b9223f474f49d2a2e5df46ae85aa4411afef666439cc0fcb6ab926ab123d2bd0221513a547e9e90a92b6993f869b951fa0cd1f051a86743d3a868dd7fd35a2668f3ca6ed4ce1b27ea4538ab229648aed0fafa3fd0bbba2298e65c5bf91cd54acf52e95bee2922f6990f7525840ed5cfa10198e63732038d95586d711fa8f410f4d29d03f4fa6b450f6f38e16f5319e5c7591a7176abc5fa3a17cd6ece797d2e9c6385a44da4879395ac741522016f82530238096bb8bc0f75203dd4b21ea01a752fa10d9ba900caddbb4e95868c2abbbd4e8400ef71be84080a752fa106c057aaff00d0b50d077c9fa0f741d3fcb44c8c002349553efab5a2c85847a0d9eb405ac2a968e8a74a5952b3d482e526e2cb3c8572ebfd14e940e55390ab9f869d03f4af254d03b42c1d405e3e1315da3e8ad7a3f929d35546ac17b32dc497a7b78169bc1304f45a6cbc2434e9fe42ad2bfea5d5ae5cdae3ed72aced2455de265eb5173e1b35fe7a7a147d8fbdd0d38fb1a0e49670547e8e3d200a497b962a254b7f88ba2dff005aab5e137672d965bdc1ad5d0d33f6b9e739ff00873bd3e81b3d693a57c38ef2e503efba7457a7a47a0bf807e954c9909da23fbedde80e92bfd5d3458b19195dccab9480ed59a749d76a9f429ade4c85f72bd1bf0a16d7a4be853f64de47c8defe10d5fc0a6d4397902ea403b29d2b50f7607c1907dec7521a52451be811e9f58fd29b05d5621573c53be8d350d55fa121a4989a95e7e8d3f4a02c71f75bea4ab1565466eae51a91653a4acf52ab49ba9ccdfa95dd35a7417d0bab0b603d6a57fa29d29906c3ffd9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE IF NOT EXISTS `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nro` varchar(6) NOT NULL DEFAULT '',
  `descripcion` varchar(250) NOT NULL DEFAULT '',
  `vinculo` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `nro`, `descripcion`, `vinculo`) VALUES
(1, '01', 'Bienvenidos al Curso Extjs', 'inicio'),
(2, '02', 'Visita la pagina de la egonzale.org', 'http://egonzale.org');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(10) NOT NULL DEFAULT '',
  `clave` varchar(20) NOT NULL DEFAULT '',
  `nivel` char(2) NOT NULL DEFAULT '',
  `fecharegistro` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `nivel`, `fecharegistro`) VALUES
(1, '21000000', 'yiyi', '1', '2013-06-03'),
(2, '19000000', 'ed', '1', '2013-06-03'),
(3, '20000000', 'paola', '1', '2013-06-03'),
(4, '00000002', 'eva', '1', '2013-06-03'),
(5, '00000001', 'adan', '1', '2013-06-03'),
(6, '22000000', 'camila', '2', '2013-06-03'),
(7, '23111222', 'Taylor Swift', '2', '2013-06-03'),
(8, '23111333', 'Meghan Trainor', '2', '2013-06-03'),
(9, '23111444', 'Maroon Five', '2', '2013-06-03'),
(10, '23111555', 'Tove Lo', '2', '2013-06-03'),
(11, '23111666', 'Nicki Minaj', '2', '2013-06-03');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
