-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2022 a las 00:50:40
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `php_sql_course`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `publish_date` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`id`, `publish_date`, `title`, `content`, `status`) VALUES
(6, '2016-02-14', 'Nuevo curso de AngularJS', '<p>ortor mi phasellus tellus mauris vehicula, et dui, cras vivamus donec vehicula convallis, quis volutpat, nunc dignissim ped</p>', 1),
(7, '2017-01-02', 'Nuevo curso de iOS', '<p>Sit in dictum dolor quis ut urna, erat vestibulum lacus malesuada, fermentum non, nibh egestas cubilia molestie integer. Luctus et malesuada lectus vel wisi, sit nec vivamus </p>', 2),
(8, '2015-09-16', 'Nuevo curso de Android', '<p>Velit ultrices donec at interdum, blandit nulla maecenas justo, mauris sed, curabitur risus aliquam quis. Felis luctus felis mus dapibus lobortis, sed faucibus libero officia libero</p>', 1),
(10, '2016-07-16', 'Nuevo curso de Laravel', '<p> consectetuer, cursus est accumsan. Fermentum iaculis diam amet, ipsum velit a enim velit, et eu, vitae ullamcorper, et cras sit tortor massa urna orci. Metus sodales rutrum ante sem, aliquam dui mollis nonummy. Orci eleifend turpis quam cum faucibus, in q</p>', 2),
(11, '2016-03-10', 'Nuevo curso de CodeIgniter', '<p>Faucibus volutpat cursus sapiente inceptos sapien, urna commodo orci cursus felis nascetur.</p>', 1),
(12, '2016-02-24', 'Nuevo curso de directivas de AngularJS', '<p>Vitae vivamus cursus, in et erat sed. Turpis erat elit facilisis, faucibus eget. </p>', 1),
(13, '2015-12-31', 'Nuevo curso de PostgresSQL', '<p>Vestibulum placerat consectetuer, accusantium liber</p>', 1),
(14, '2016-01-01', 'Nuevo curso de jQuery', 'Cras sodales suspendisse dui luctus enim, tempus imperdiet ridiculus.', 1),
(15, '2015-11-30', 'Nuevo curso de Foundation Framework', '<p>Tempor arcu nisl nulla, at at odio a, turpis diam vitae wisi, amet amet. Arcu pretium ridiculus erat ducimus, sociis id quam mauris, ac condimentum ad, amet interdum ut varius lobortis. Sit in dictum dolor quis ut urna, erat vestibulum lacus malesuada, fermentum non, nibh egestas cubilia molestie integer. Luctus et malesuada lectus vel wisi, sit nec vivamus nulla euismod arcu, augue purus ut elit pulvinar, urna mattis suscipit justo orci</p>', 1),
(16, '2015-07-16', 'Nuevo curso java', '<p>Java es bueno Java es grande </p>', 0),
(17, '2022-09-20', 'Curso Django', 'Curso para principiantes Django', 1),
(27, '2022-09-20', 'New Record', 'Final lap', 1),
(31, '2022-09-21', 'New course Final ', 'Security course', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status_id` int NOT NULL,
  `user_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `status_id`, `user_type_id`) VALUES
(1, 'admin@correo.com', '12345678', 1, 2),
(2, 'bernardo@correo.com', '23456789', 1, 1),
(3, 'sergio@correo.com', '34567890', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_log`
--

CREATE TABLE `user_log` (
  `id` int NOT NULL,
  `date_logged_in` date DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user_log`
--

INSERT INTO `user_log` (`id`, `date_logged_in`, `user_id`) VALUES
(1, '2015-11-11', 1),
(2, '2016-03-01', 1),
(3, '2016-03-02', 2),
(4, '2016-03-03', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_type`
--

CREATE TABLE `user_type` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user_type`
--

INSERT INTO `user_type` (`id`, `name`) VALUES
(1, 'Final'),
(2, 'Admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_status_idx` (`status_id`),
  ADD KEY `fk_user_user_type1_idx` (`user_type_id`);

--
-- Indices de la tabla `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_log_user1_idx` (`user_id`);

--
-- Indices de la tabla `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`);

--
-- Filtros para la tabla `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `fk_user_log_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
