-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2025 a las 02:36:30
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
-- Base de datos: `pokedex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo_primario` varchar(30) NOT NULL,
  `tipo_secundario` varchar(30) DEFAULT NULL,
  `hp` int(10) UNSIGNED DEFAULT NULL,
  `ataque` int(10) UNSIGNED DEFAULT NULL,
  `defensa` int(10) UNSIGNED DEFAULT NULL,
  `ataque_esp` int(10) UNSIGNED DEFAULT NULL,
  `defensa_esp` int(10) UNSIGNED DEFAULT NULL,
  `velocidad` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `nombre`, `tipo_primario`, `tipo_secundario`, `hp`, `ataque`, `defensa`, `ataque_esp`, `defensa_esp`, `velocidad`) VALUES
(1, 'Bulbasaur', 'Planta', 'Veneno', 45, 49, 49, 65, 65, 45),
(2, 'Ivysaur', 'Planta', 'Veneno', 60, 62, 63, 80, 80, 60),
(3, 'Venusaur', 'Planta', 'Veneno', 80, 82, 83, 100, 100, 80),
(4, 'Charmander', 'Fuego', NULL, 39, 52, 43, 60, 50, 65),
(5, 'Charmeleon', 'Fuego', NULL, 58, 64, 58, 80, 65, 80),
(6, 'Charizard', 'Fuego', 'Volador', 78, 84, 78, 109, 85, 100),
(7, 'Squirtle', 'Agua', NULL, 44, 48, 65, 50, 64, 43),
(8, 'Wartortle', 'Agua', NULL, 59, 63, 80, 65, 80, 58),
(9, 'Blastoise', 'Agua', NULL, 79, 83, 100, 85, 105, 78),
(10, 'Caterpie', 'Bicho', NULL, 45, 30, 35, 20, 20, 45),
(11, 'Metapod', 'Bicho', NULL, 50, 20, 55, 25, 25, 30),
(12, 'Butterfree', 'Bicho', 'Volador', 60, 45, 50, 90, 80, 70),
(13, 'Weedle', 'Bicho', 'Veneno', 40, 35, 30, 20, 20, 50),
(14, 'Kakuna', 'Bicho', 'Veneno', 45, 25, 50, 25, 25, 35),
(15, 'Beedrill', 'Bicho', 'Veneno', 65, 90, 40, 45, 80, 75),
(16, 'Pidgey', 'Normal', 'Volador', 40, 45, 40, 35, 35, 56),
(17, 'Pidgeotto', 'Normal', 'Volador', 63, 60, 55, 50, 50, 71),
(18, 'Pidgeot', 'Normal', 'Volador', 83, 80, 75, 70, 70, 101),
(19, 'Rattata', 'Normal', NULL, 30, 56, 35, 25, 35, 72),
(20, 'Raticate', 'Normal', NULL, 55, 81, 60, 50, 70, 97),
(21, 'Spearow', 'Normal', 'Volador', 40, 60, 30, 31, 31, 70),
(22, 'Fearow', 'Normal', 'Volador', 65, 90, 65, 61, 61, 100),
(23, 'Ekans', 'Veneno', NULL, 60, 95, 69, 65, 79, 80),
(24, 'Arbok', 'Veneno', NULL, 60, 95, 69, 65, 79, 80),
(25, 'Pikachu', 'Electrico', NULL, 35, 55, 40, 50, 50, 90),
(26, 'Raichu', 'Electrico', NULL, 60, 90, 55, 90, 80, 110),
(27, 'Sandshrew', 'Tierra', NULL, 50, 75, 85, 20, 30, 40),
(28, 'Sandslash', 'Tierra', NULL, 75, 100, 110, 45, 55, 65),
(29, 'Nidoran_f', 'Veneno', NULL, 55, 47, 52, 40, 40, 41),
(30, 'Nidorina', 'Veneno', 'Tierra', 70, 62, 67, 55, 55, 56),
(31, 'Nidoqueen', 'Veneno', 'Tierra', 90, 92, 87, 75, 85, 76),
(32, 'Nidoran_m', 'Veneno', NULL, 46, 57, 40, 40, 40, 50),
(33, 'Nidorino', 'Veneno', 'Tierra', 61, 72, 57, 55, 55, 65),
(34, 'Nidoking', 'Veneno', 'Tierra', 81, 102, 77, 85, 75, 85),
(35, 'Clefairy', 'Hada', NULL, 70, 45, 48, 60, 65, 35),
(36, 'Clefable', 'Hada', NULL, 95, 70, 73, 95, 90, 60),
(37, 'Vulpix', 'Fuego', NULL, 38, 41, 40, 50, 65, 65),
(38, 'Ninetales', 'Fuego', NULL, 73, 76, 75, 81, 100, 100),
(39, 'Jigglypuff', 'Normal', 'Hada', 115, 45, 20, 45, 25, 20),
(40, 'Wigglytuff', 'Normal', 'Hada', 140, 70, 45, 85, 50, 45),
(41, 'Zubat', 'Veneno', 'Volador', 40, 45, 35, 30, 40, 55),
(42, 'Golbat', 'Veneno', 'Volador', 75, 80, 70, 65, 75, 90),
(43, 'Oddish', 'Planta', 'Veneno', 45, 50, 55, 75, 65, 30),
(44, 'Gloom', 'Planta', 'Veneno', 60, 65, 70, 85, 75, 40),
(45, 'Vileplume', 'Planta', 'Veneno', 75, 80, 85, 110, 90, 50),
(46, 'Paras', 'Bicho', 'Planta', 35, 70, 55, 45, 55, 25),
(47, 'Parasect', 'Bicho', 'Planta', 60, 95, 80, 60, 80, 30),
(48, 'Venonat', 'Bicho', 'Veneno', 60, 55, 50, 40, 55, 45),
(49, 'Venomoth', 'Bicho', 'Veneno', 70, 65, 60, 90, 75, 90),
(50, 'Diglett', 'Tierra', NULL, 10, 55, 25, 35, 45, 95),
(51, 'Dugtrio', 'Tierra', NULL, 35, 100, 50, 50, 70, 120),
(52, 'Meowth', 'Normal', NULL, 40, 45, 35, 40, 40, 90),
(53, 'Persian', 'Normal', NULL, 65, 70, 60, 65, 65, 115),
(54, 'Psyduck', 'Agua', NULL, 50, 52, 48, 65, 50, 55),
(55, 'Golduck', 'Agua', NULL, 80, 82, 78, 95, 80, 85),
(56, 'Mankey', 'Lucha', NULL, 40, 80, 35, 35, 45, 70),
(57, 'Primeape', 'Lucha', NULL, 65, 105, 60, 60, 70, 95),
(58, 'Growlithe', 'Fuego', NULL, 55, 70, 45, 70, 50, 60),
(59, 'Arcanine', 'Fuego', NULL, 90, 110, 80, 100, 80, 95),
(60, 'Poliwag', 'Agua', NULL, 40, 50, 40, 40, 40, 90),
(61, 'Poliwhirl', 'Agua', NULL, 65, 65, 65, 50, 50, 90),
(62, 'Poliwrath', 'Agua', 'Lucha', 90, 95, 95, 70, 90, 70),
(63, 'Abra', 'Psiquico', NULL, 25, 20, 15, 105, 55, 90),
(64, 'Kadabra', 'Psiquico', NULL, 40, 35, 30, 120, 70, 105),
(65, 'Alakazam', 'Psiquico', NULL, 55, 50, 45, 135, 95, 120),
(66, 'Machop', 'Lucha', NULL, 70, 80, 50, 35, 35, 35),
(67, 'Machoke', 'Lucha', NULL, 80, 100, 70, 50, 60, 45),
(68, 'Machamp', 'Lucha', NULL, 90, 130, 80, 65, 85, 55),
(69, 'Bellsprout', 'Planta', 'Veneno', 50, 75, 35, 70, 30, 40),
(70, 'Weepinbell', 'Planta', 'Veneno', 65, 90, 50, 85, 45, 55),
(71, 'Victreebel', 'Planta', 'Veneno', 80, 105, 65, 100, 70, 70),
(72, 'Tentacool', 'Agua', 'Veneno', 40, 40, 35, 50, 100, 70),
(73, 'Tentacruel', 'Agua', 'Veneno', 80, 105, 65, 100, 70, 70),
(74, 'Geodude', 'Roca', 'Tierra', 40, 80, 100, 30, 30, 20),
(75, 'Graveler', 'Roca', 'Tierra', 55, 95, 115, 45, 45, 35),
(76, 'Golem', 'Roca', 'Tierra', 80, 120, 130, 55, 65, 45),
(77, 'Ponyta', 'Fuego', NULL, 50, 85, 55, 65, 65, 90),
(78, 'Rapidash', 'Fuego', NULL, 65, 100, 70, 80, 80, 105),
(79, 'Slowpoke', 'Agua', 'Psiquico', 90, 65, 65, 40, 40, 15),
(80, 'Slowbro', 'Agua', 'Psiquico', 95, 75, 110, 100, 80, 30),
(81, 'Magnemite', 'Electrico', 'Acero', 25, 35, 70, 95, 55, 45),
(82, 'Magneton', 'Electrico', 'Acero', 50, 60, 95, 120, 70, 70),
(83, 'Farfetchd', 'Normal', 'Volador', 52, 90, 55, 58, 62, 60),
(84, 'Doduo', 'Normal', 'Volador', 35, 85, 45, 35, 35, 75),
(85, 'Dodrio', 'Normal', 'Volador', 60, 110, 70, 60, 60, 110),
(86, 'Seel', 'Agua', NULL, 65, 45, 55, 45, 70, 45),
(87, 'Dewgong', 'Agua', 'Hielo', 90, 70, 80, 70, 95, 70),
(88, 'Grimer', 'Veneno', NULL, 80, 80, 50, 40, 50, 25),
(89, 'Muk', 'Veneno', NULL, 105, 105, 75, 65, 100, 50),
(90, 'Shellder', 'Agua', NULL, 30, 65, 100, 45, 25, 40),
(91, 'Cloyster', 'Agua', 'Hielo', 50, 95, 180, 85, 45, 70),
(92, 'Gastly', 'Fantasma', 'Veneno', 30, 35, 30, 100, 35, 80),
(93, 'Haunter', 'Fantasma', 'Veneno', 45, 50, 45, 115, 55, 95),
(94, 'Gengar', 'Fantasma', 'Veneno', 60, 65, 60, 130, 75, 110),
(95, 'Onix', 'Roca', 'Tierra', 35, 45, 160, 30, 45, 70),
(96, 'Drowzee', 'Psiquico', NULL, 60, 48, 45, 43, 90, 42),
(97, 'Hypno', 'Psiquico', NULL, 85, 73, 70, 73, 115, 67),
(98, 'Krabby', 'Agua', NULL, 30, 105, 90, 25, 25, 50),
(99, 'Kingler', 'Agua', NULL, 55, 130, 115, 50, 50, 75),
(100, 'Voltorb', 'Electrico', NULL, 40, 30, 50, 55, 55, 100),
(101, 'Electrode', 'Electrico', NULL, 60, 50, 70, 80, 80, 150),
(102, 'Exeggcute', 'Planta', 'Psiquico', 60, 40, 80, 60, 45, 40),
(103, 'Exeggutor', 'Planta', 'Psiquico', 95, 95, 85, 125, 75, 55),
(104, 'Cubone', 'Tierra', NULL, 50, 50, 95, 40, 50, 35),
(105, 'Marowak', 'Tierra', NULL, 60, 80, 110, 50, 80, 45),
(106, 'Hitmonlee', 'Lucha', NULL, 50, 120, 53, 35, 110, 87),
(107, 'Hitmonchan', 'Lucha', NULL, 50, 105, 79, 35, 110, 76),
(108, 'Lickitung', 'Normal', NULL, 90, 55, 75, 60, 75, 30),
(109, 'Koffing', 'Veneno', NULL, 40, 65, 95, 60, 45, 35),
(110, 'Weezing', 'Veneno', NULL, 65, 90, 120, 85, 70, 60),
(111, 'Rhyhorn', 'Tierra', 'Roca', 80, 85, 95, 30, 30, 25),
(112, 'Rhydon', 'Tierra', 'Roca', 105, 130, 120, 45, 45, 40),
(113, 'Chansey', 'Normal', NULL, 250, 5, 5, 35, 105, 50),
(114, 'Tangela', 'Planta', NULL, 65, 55, 115, 100, 40, 60),
(115, 'Kangaskhan', 'Normal', NULL, 105, 95, 80, 40, 80, 90),
(116, 'Horsea', 'Agua', NULL, 30, 40, 70, 70, 25, 60),
(117, 'Seadra', 'Agua', NULL, 55, 65, 95, 95, 45, 85),
(118, 'Goldeen', 'Agua', NULL, 45, 67, 60, 35, 50, 63),
(119, 'Seaking', 'Agua', NULL, 80, 92, 65, 65, 80, 68),
(120, 'Staryu', 'Agua', NULL, 30, 45, 55, 70, 55, 85),
(121, 'Starmie', 'Agua', 'Psiquico', 60, 75, 85, 100, 85, 115),
(122, 'Mr. Mime', 'Psiquico', 'Hada', 40, 45, 65, 100, 120, 90),
(123, 'Scyther', 'Bicho', 'Volador', 70, 110, 80, 55, 80, 105),
(124, 'Jynx', 'Hielo', 'Psiquico', 65, 50, 35, 115, 95, 95),
(125, 'Electabuzz', 'Electrico', NULL, 65, 83, 57, 95, 85, 105),
(126, 'Magmar', 'Fuego', NULL, 65, 95, 57, 100, 85, 93),
(127, 'Pinsir', 'Bicho', NULL, 65, 125, 100, 55, 70, 85),
(128, 'Tauros', 'Normal', NULL, 75, 100, 95, 40, 70, 110),
(129, 'Magikarp', 'Agua', NULL, 20, 10, 55, 15, 20, 80),
(130, 'Gyarados', 'Agua', 'Volador', 95, 125, 79, 60, 100, 81),
(131, 'Lapras', 'Agua', 'Hielo', 130, 85, 80, 85, 95, 60),
(132, 'Ditto', 'Normal', NULL, 48, 48, 48, 48, 48, 48),
(133, 'Eevee', 'Normal', NULL, 65, 75, 70, 65, 85, 75),
(134, 'Vaporeon', 'Agua', NULL, 130, 65, 60, 110, 95, 65),
(135, 'Jolteon', 'Electrico', NULL, 65, 65, 60, 110, 95, 130),
(136, 'Flareon', 'Fuego', NULL, 65, 130, 65, 95, 110, 65),
(137, 'Porygon', 'Normal', NULL, 65, 60, 70, 85, 75, 40),
(138, 'Omanyte', 'Roca', 'Agua', 35, 40, 10, 95, 55, 35),
(139, 'Omastar', 'Roca', 'Agua', 70, 60, 125, 115, 70, 55),
(140, 'Kabuto', 'Roca', 'Agua', 30, 80, 90, 55, 45, 55),
(141, 'Kabutops', 'Roca', 'Agua', 60, 115, 105, 65, 70, 80),
(142, 'Aerodactyl', 'Roca', 'Volador', 80, 105, 65, 60, 75, 130),
(143, 'Snorlax', 'Normal', NULL, 160, 110, 65, 65, 110, 30),
(144, 'Articuno', 'Hielo', 'Volador', 90, 85, 100, 95, 125, 85),
(145, 'Zapdos', 'Electrico', 'Volador', 90, 90, 85, 125, 90, 100),
(146, 'Moltres', 'Fuego', 'Volador', 90, 100, 90, 125, 85, 90),
(147, 'Dratini', 'Dragon', NULL, 41, 64, 45, 50, 50, 50),
(148, 'Dragonair', 'Dragon', NULL, 61, 84, 65, 70, 70, 70),
(149, 'Dragonite', 'Dragon', 'Volador', 91, 134, 95, 100, 100, 80),
(150, 'Mewtwo', 'Psiquico', NULL, 106, 110, 90, 154, 90, 130),
(151, 'Mew', 'Psiquico', NULL, 100, 100, 100, 100, 100, 100);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
COMMIT;

--
-- SE agrega numero de pokedex
ALTER TABLE pokemon
    ADD COLUMN dex_entry int not null;

-- Se carga numero de pokedex
UPDATE  pokemon
set pokemon.dex_entry = id;

ALTER TABLE pokemon
    DROP COLUMN tipo_primario,
    DROP COLUMN tipo_secundario;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
