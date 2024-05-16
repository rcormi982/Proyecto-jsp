-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2024 a las 13:34:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basketball_league`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `partido_jornada` int(2) DEFAULT NULL,
  `usuario_id` int(2) DEFAULT NULL,
  `comentarios` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `partido_jornada`, `usuario_id`, `comentarios`) VALUES
(1, 1, 2, 'Ha transcurrido todo con normalidad'),
(2, 4, 3, 'Todo correcto'),
(3, 1, 3, 'Ha estado muy interesante\r\n'),
(4, 5, 1, 'Todo ok'),
(5, 5, 3, 'Han faltado cinco puntos para cerrar acta'),
(6, 13, 5, 'Jornada de infarto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `jornada` int(2) NOT NULL,
  `equipos` varchar(100) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora` varchar(10) NOT NULL,
  `resultado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`jornada`, `equipos`, `lugar`, `fecha`, `hora`, `resultado`) VALUES
(1, 'Dyna Digital Málaga Basket `10 - CB Novaschool Rincón de la Victoria ', 'CEIP Félix Revello de Toro (Teatinos)', '19/12/2023', '17:45', '40-44'),
(2, 'Rincón Basket Club `10 - Dyna Digital Málaga Basket `10', 'Pabellón Rubén Ruzafa', '13/01/2024', '09:30', '24-36'),
(3, 'Dyna Digital Málaga Basket `10 - CB El Palo-La Fábrica de Málaga `10', 'CEIP Félix Revello de Toro (Teatinos)', '20/01/2024', '12:00', '36-25'),
(4, 'CD Adesa Málaga - Dyna Digital Málaga Basket `10 ', 'Colegio Salesiano San Bartolomé', '03/02/2024', '12:30', '44-52'),
(5, 'Unicasa 3cero5 Málaga - Dyna Digital Málaga Basket `10', 'IES Teatinos', '08/02/2024', '19:00', '27-72'),
(13, 'Dyna Digital Málaga Basket `10 - CB Mijas Unión Basket', 'Pabellón La Cala de Mijas', '05/05/2024', '13:00', '47-50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(2) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `es_administrador` tinyint(1) NOT NULL DEFAULT 0,
  `contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `usuario`, `es_administrador`, `contraseña`) VALUES
(1, 'Sergio', 'González Corbacho', 'sergon', 0, '1234'),
(2, 'Carlos', 'Martínez Chicón', 'carlosma', 0, '1234'),
(3, 'María', 'Lupión', 'malu', 0, '1234'),
(4, 'Rocío', 'Corbacho Millán', 'rociocor', 1, '1234'),
(5, 'Antonio', 'Corrales', 'anton', 0, '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`usuario_id`),
  ADD KEY `partido_jornada` (`partido_jornada`) USING BTREE;

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`jornada`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`partido_jornada`) REFERENCES `partidos` (`jornada`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
