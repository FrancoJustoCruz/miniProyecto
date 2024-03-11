-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2024 a las 13:27:02
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
-- Base de datos: `mini`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombres`, `apellidos`, `direccion`, `correo_electronico`, `dni`, `edad`, `fecha_creacion`, `telefono`) VALUES
(1, 'Lethia', 'Souch', '5 Vera Trail', 'lsouch4@huffingtonpost.com', '258-27-6619', 96, '2008-05-29 13:02:42', '840-922-3612'),
(2, 'Debee', 'Peckett', '83 Cherokee Crossing', 'dpeckett3@squarespace.com', '664-16-6083', 81, '2014-06-22 12:10:12', '574-903-5691'),
(3, 'Juliet', 'Bamb', '911 Fair Oaks Plaza', 'jbamb2@ycombinator.com', '165-46-7196', 40, '2011-08-14 16:43:18', '634-640-4340'),
(4, 'Millard', 'Beare', '87 Dwight Trail', 'mbeare5@bandcamp.com', '318-48-8283', 37, '2009-06-24 04:03:45', '815-391-6091'),
(5, 'Waldemar', 'Grayshon', '33360 Gerald Drive', 'wgrayshon6@dailymotion.com', '408-47-7658', 12, '2015-05-30 13:20:55', '237-793-9168'),
(6, 'Bernard', 'Tiner', '573 Rowland Plaza', 'btiner8@blogtalkradio.com', '116-53-6380', 137, '2002-06-28 22:58:55', '943-245-0691'),
(7, 'Erhart', 'Spalls', '547 Algoma Way', 'espalls1@dropbox.com', '151-79-8931', 42, '2012-01-15 16:52:55', '965-582-0731'),
(8, 'Leslie', 'Heffernon', '6513 Moulton Plaza', 'lheffernon9@nasa.gov', '356-49-8560', 129, '2008-03-29 19:55:41', '206-248-1552'),
(9, 'Nixie', 'Burbridge', '8914 Melby Park', 'nburbridge7@wikispaces.com', '738-36-8257', 3, '2005-08-31 13:57:15', '503-753-7960'),
(10, 'Wilhelmina', 'Korous', '802 Warbler Park', 'wkorous0@pinterest.com', '231-02-3918', 133, '2018-06-01 14:03:48', '553-937-2530');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
