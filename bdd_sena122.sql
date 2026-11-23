-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2026 a las 21:33:21
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
-- Base de datos: `bdd_sena122`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `id_administrativo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`id_administrativo`, `nombre`, `apellido`, `cargo`, `correo`) VALUES
(1, 'Luis', 'Martinez', 'Coordinador', 'luis@sena.edu.co'),
(2, 'Ana', 'Rodriguez', 'Secretaria', 'ana@sena.edu.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendices`
--

CREATE TABLE `aprendices` (
  `id_aprendices` int(11) NOT NULL,
  `nombre_ap` varchar(100) NOT NULL,
  `apellido_ap` varchar(100) NOT NULL,
  `documento_ap` varchar(50) DEFAULT NULL,
  `correo_ap` varchar(100) DEFAULT NULL,
  `id_ficha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprendices`
--

INSERT INTO `aprendices` (`id_aprendices`, `nombre_ap`, `apellido_ap`, `documento_ap`, `correo_ap`, `id_ficha`) VALUES
(1, 'nicolas', 'vega', '1002003001', 'senic@gmail.com', 1),
(2, 'Andres', 'Perez', '1002003002', 'andres@gmail.com', 1),
(3, 'Laura', 'Torres', '1002003003', 'laura@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas`
--

CREATE TABLE `fichas` (
  `id_ficha` int(11) NOT NULL,
  `codigo_ficha` varchar(100) NOT NULL,
  `nombre_programa` varchar(150) NOT NULL,
  `jornada` varchar(50) DEFAULT NULL,
  `id_instructores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fichas`
--

INSERT INTO `fichas` (`id_ficha`, `codigo_ficha`, `nombre_programa`, `jornada`, `id_instructores`) VALUES
(1, '3065001', 'Procesamiento de Datos e Inteligencia Artificial', 'Diurna', 1),
(2, '3065002', 'Analisis y Desarrollo de Software', 'Nocturna', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `id_instructores` int(11) NOT NULL,
  `nombre_instructor` varchar(100) NOT NULL,
  `apellido_instructor` varchar(100) NOT NULL,
  `documento_instructor` varchar(20) DEFAULT NULL,
  `cargo_instructor` varchar(30) DEFAULT NULL,
  `correo_instructores` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`id_instructores`, `nombre_instructor`, `apellido_instructor`, `documento_instructor`, `cargo_instructor`, `correo_instructores`) VALUES
(1, 'Carlos', 'Ramirez', '1001001001', 'Instructor', 'carlos@sena.edu.co'),
(2, 'Maria', 'Gomez', '1001001002', 'Instructor', 'maria@sena.edu.co');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`id_administrativo`);

--
-- Indices de la tabla `aprendices`
--
ALTER TABLE `aprendices`
  ADD PRIMARY KEY (`id_aprendices`),
  ADD KEY `fk_aprendiz_ficha` (`id_ficha`);

--
-- Indices de la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD PRIMARY KEY (`id_ficha`),
  ADD KEY `fk_fichas_instructores` (`id_instructores`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`id_instructores`),
  ADD UNIQUE KEY `documento_instructor` (`documento_instructor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  MODIFY `id_administrativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aprendices`
--
ALTER TABLE `aprendices`
  MODIFY `id_aprendices` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fichas`
--
ALTER TABLE `fichas`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `instructores`
--
ALTER TABLE `instructores`
  MODIFY `id_instructores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendices`
--
ALTER TABLE `aprendices`
  ADD CONSTRAINT `fk_aprendiz_ficha` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD CONSTRAINT `fk_fichas_instructores` FOREIGN KEY (`id_instructores`) REFERENCES `instructores` (`id_instructores`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
