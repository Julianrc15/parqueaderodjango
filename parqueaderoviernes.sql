-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2022 a las 01:36:34
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueaderoviernes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celdas`
--

CREATE TABLE `celdas` (
  `id_celda` int(11) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `id_tarifa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `id_tarifa` int(11) NOT NULL,
  `valor_tarifa` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiquetes`
--

CREATE TABLE `tiquetes` (
  `id_tiquete` int(11) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `valor_pagado` int(11) NOT NULL,
  `id_celda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `celdas`
--
ALTER TABLE `celdas`
  ADD PRIMARY KEY (`id_celda`),
  ADD KEY `fk_id_tarifa` (`id_tarifa`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`id_tarifa`);

--
-- Indices de la tabla `tiquetes`
--
ALTER TABLE `tiquetes`
  ADD PRIMARY KEY (`id_tiquete`),
  ADD KEY `fk_id_celda` (`id_celda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `celdas`
--
ALTER TABLE `celdas`
  MODIFY `id_celda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `id_tarifa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiquetes`
--
ALTER TABLE `tiquetes`
  MODIFY `id_tiquete` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `celdas`
--
ALTER TABLE `celdas`
  ADD CONSTRAINT `fk_id_tarifa` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifas` (`id_tarifa`);

--
-- Filtros para la tabla `tiquetes`
--
ALTER TABLE `tiquetes`
  ADD CONSTRAINT `fk_id_celda` FOREIGN KEY (`id_celda`) REFERENCES `celdas` (`id_celda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
