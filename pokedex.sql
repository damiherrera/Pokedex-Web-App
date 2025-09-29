-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2025 a las 23:17:43
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
CREATE DATABASE IF NOT EXISTS `pokedex` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pokedex`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evoluciones`
--

CREATE TABLE `evoluciones` (
  `evoluciona_de` int(11) NOT NULL,
  `evoluciona_a` int(11) NOT NULL,
  `metodo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evoluciones`
--

INSERT INTO `evoluciones` (`evoluciona_de`, `evoluciona_a`, `metodo`) VALUES
(1, 2, 'Nivel 16'),
(2, 3, 'Nivel 32'),
(4, 5, 'Nivel 16'),
(5, 6, 'Nivel 36'),
(7, 8, 'Nivel 16'),
(8, 9, 'Nivel 36'),
(10, 11, 'Nivel 7'),
(11, 12, 'Nivel 10'),
(13, 14, 'Nivel 7'),
(14, 15, 'Nivel 10'),
(16, 17, 'Nivel 18'),
(17, 18, 'Nivel 36'),
(19, 20, 'Nivel 20'),
(21, 22, 'Nivel 20'),
(23, 24, 'Nivel 22'),
(25, 26, 'Piedra Trueno'),
(27, 28, 'Nivel 22'),
(29, 30, 'Nivel 16'),
(30, 31, 'Piedra Lunar'),
(32, 33, 'Nivel 16'),
(33, 34, 'Piedra Lunar'),
(35, 36, 'Piedra Lunar'),
(37, 38, 'Piedra Fuego'),
(39, 40, 'Piedra Lunar'),
(41, 42, 'Nivel 22'),
(43, 44, 'Nivel 21'),
(44, 45, 'Piedra Hoja'),
(46, 47, 'Nivel 24'),
(48, 49, 'Nivel 31'),
(50, 51, 'Nivel 26'),
(52, 53, 'Nivel 28'),
(54, 55, 'Nivel 33'),
(56, 57, 'Nivel 28'),
(58, 59, 'Piedra Fuego'),
(60, 61, 'Nivel 25'),
(61, 62, 'Piedra Agua'),
(63, 64, 'Nivel 16'),
(64, 65, 'Intercambio'),
(66, 67, 'Nivel 28'),
(67, 68, 'Intercambio'),
(69, 70, 'Nivel 21'),
(70, 71, 'Piedra Hoja'),
(72, 73, 'Nivel 30'),
(74, 75, 'Nivel 25'),
(75, 76, 'Intercambio'),
(77, 78, 'Nivel 40'),
(79, 80, 'Nivel 37'),
(81, 82, 'Nivel 30'),
(84, 85, 'Nivel 31'),
(86, 87, 'Nivel 34'),
(88, 89, 'Nivel 38'),
(90, 91, 'Piedra Agua'),
(92, 93, 'Nivel 25'),
(93, 94, 'Intercambio'),
(96, 97, 'Nivel 26'),
(98, 99, 'Nivel 28'),
(100, 101, 'Nivel 30'),
(102, 103, 'Piedra Hoja'),
(104, 105, 'Nivel 28'),
(109, 110, 'Nivel 34'),
(111, 112, 'Nivel 42'),
(116, 117, 'Nivel 32'),
(118, 119, 'Nivel 33'),
(120, 121, 'Piedra Agua'),
(129, 130, 'Nivel 20'),
(133, 134, 'Piedra Agua'),
(133, 135, 'Piedra Trueno'),
(133, 136, 'Piedra Fuego'),
(138, 139, 'Nivel 40'),
(140, 141, 'Nivel 40'),
(147, 148, 'Nivel 30'),
(148, 149, 'Nivel 55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `hp` int(10) UNSIGNED DEFAULT NULL,
  `ataque` int(10) UNSIGNED DEFAULT NULL,
  `defensa` int(10) UNSIGNED DEFAULT NULL,
  `ataque_esp` int(10) UNSIGNED DEFAULT NULL,
  `defensa_esp` int(10) UNSIGNED DEFAULT NULL,
  `velocidad` int(10) UNSIGNED DEFAULT NULL,
  `dex_entry` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `nombre`, `hp`, `ataque`, `defensa`, `ataque_esp`, `defensa_esp`, `velocidad`, `dex_entry`) VALUES
(1, 'Bulbasaur', 45, 49, 49, 65, 65, 45, 1),
(2, 'Ivysaur', 60, 62, 63, 80, 80, 60, 2),
(3, 'Venusaur', 80, 82, 83, 100, 100, 80, 3),
(4, 'Charmander', 39, 52, 43, 60, 50, 65, 4),
(5, 'Charmeleon', 58, 64, 58, 80, 65, 80, 5),
(6, 'Charizard', 78, 84, 78, 109, 85, 100, 6),
(7, 'Squirtle', 44, 48, 65, 50, 64, 43, 7),
(8, 'Wartortle', 59, 63, 80, 65, 80, 58, 8),
(9, 'Blastoise', 79, 83, 100, 85, 105, 78, 9),
(10, 'Caterpie', 45, 30, 35, 20, 20, 45, 10),
(11, 'Metapod', 50, 20, 55, 25, 25, 30, 11),
(12, 'Butterfree', 60, 45, 50, 90, 80, 70, 12),
(13, 'Weedle', 40, 35, 30, 20, 20, 50, 13),
(14, 'Kakuna', 45, 25, 50, 25, 25, 35, 14),
(15, 'Beedrill', 65, 90, 40, 45, 80, 75, 15),
(16, 'Pidgey', 40, 45, 40, 35, 35, 56, 16),
(17, 'Pidgeotto', 63, 60, 55, 50, 50, 71, 17),
(18, 'Pidgeot', 83, 80, 75, 70, 70, 101, 18),
(19, 'Rattata', 30, 56, 35, 25, 35, 72, 19),
(20, 'Raticate', 55, 81, 60, 50, 70, 97, 20),
(21, 'Spearow', 40, 60, 30, 31, 31, 70, 21),
(22, 'Fearow', 65, 90, 65, 61, 61, 100, 22),
(23, 'Ekans', 60, 95, 69, 65, 79, 80, 23),
(24, 'Arbok', 60, 95, 69, 65, 79, 80, 24),
(25, 'Pikachu', 35, 55, 40, 50, 50, 90, 25),
(26, 'Raichu', 60, 90, 55, 90, 80, 110, 26),
(27, 'Sandshrew', 50, 75, 85, 20, 30, 40, 27),
(28, 'Sandslash', 75, 100, 110, 45, 55, 65, 28),
(29, 'Nidoran_f', 55, 47, 52, 40, 40, 41, 29),
(30, 'Nidorina', 70, 62, 67, 55, 55, 56, 30),
(31, 'Nidoqueen', 90, 92, 87, 75, 85, 76, 31),
(32, 'Nidoran_m', 46, 57, 40, 40, 40, 50, 32),
(33, 'Nidorino', 61, 72, 57, 55, 55, 65, 33),
(34, 'Nidoking', 81, 102, 77, 85, 75, 85, 34),
(35, 'Clefairy', 70, 45, 48, 60, 65, 35, 35),
(36, 'Clefable', 95, 70, 73, 95, 90, 60, 36),
(37, 'Vulpix', 38, 41, 40, 50, 65, 65, 37),
(38, 'Ninetales', 73, 76, 75, 81, 100, 100, 38),
(39, 'Jigglypuff', 115, 45, 20, 45, 25, 20, 39),
(40, 'Wigglytuff', 140, 70, 45, 85, 50, 45, 40),
(41, 'Zubat', 40, 45, 35, 30, 40, 55, 41),
(42, 'Golbat', 75, 80, 70, 65, 75, 90, 42),
(43, 'Oddish', 45, 50, 55, 75, 65, 30, 43),
(44, 'Gloom', 60, 65, 70, 85, 75, 40, 44),
(45, 'Vileplume', 75, 80, 85, 110, 90, 50, 45),
(46, 'Paras', 35, 70, 55, 45, 55, 25, 46),
(47, 'Parasect', 60, 95, 80, 60, 80, 30, 47),
(48, 'Venonat', 60, 55, 50, 40, 55, 45, 48),
(49, 'Venomoth', 70, 65, 60, 90, 75, 90, 49),
(50, 'Diglett', 10, 55, 25, 35, 45, 95, 50),
(51, 'Dugtrio', 35, 100, 50, 50, 70, 120, 51),
(52, 'Meowth', 40, 45, 35, 40, 40, 90, 52),
(53, 'Persian', 65, 70, 60, 65, 65, 115, 53),
(54, 'Psyduck', 50, 52, 48, 65, 50, 55, 54),
(55, 'Golduck', 80, 82, 78, 95, 80, 85, 55),
(56, 'Mankey', 40, 80, 35, 35, 45, 70, 56),
(57, 'Primeape', 65, 105, 60, 60, 70, 95, 57),
(58, 'Growlithe', 55, 70, 45, 70, 50, 60, 58),
(59, 'Arcanine', 90, 110, 80, 100, 80, 95, 59),
(60, 'Poliwag', 40, 50, 40, 40, 40, 90, 60),
(61, 'Poliwhirl', 65, 65, 65, 50, 50, 90, 61),
(62, 'Poliwrath', 90, 95, 95, 70, 90, 70, 62),
(63, 'Abra', 25, 20, 15, 105, 55, 90, 63),
(64, 'Kadabra', 40, 35, 30, 120, 70, 105, 64),
(65, 'Alakazam', 55, 50, 45, 135, 95, 120, 65),
(66, 'Machop', 70, 80, 50, 35, 35, 35, 66),
(67, 'Machoke', 80, 100, 70, 50, 60, 45, 67),
(68, 'Machamp', 90, 130, 80, 65, 85, 55, 68),
(69, 'Bellsprout', 50, 75, 35, 70, 30, 40, 69),
(70, 'Weepinbell', 65, 90, 50, 85, 45, 55, 70),
(71, 'Victreebel', 80, 105, 65, 100, 70, 70, 71),
(72, 'Tentacool', 40, 40, 35, 50, 100, 70, 72),
(73, 'Tentacruel', 80, 105, 65, 100, 70, 70, 73),
(74, 'Geodude', 40, 80, 100, 30, 30, 20, 74),
(75, 'Graveler', 55, 95, 115, 45, 45, 35, 75),
(76, 'Golem', 80, 120, 130, 55, 65, 45, 76),
(77, 'Ponyta', 50, 85, 55, 65, 65, 90, 77),
(78, 'Rapidash', 65, 100, 70, 80, 80, 105, 78),
(79, 'Slowpoke', 90, 65, 65, 40, 40, 15, 79),
(80, 'Slowbro', 95, 75, 110, 100, 80, 30, 80),
(81, 'Magnemite', 25, 35, 70, 95, 55, 45, 81),
(82, 'Magneton', 50, 60, 95, 120, 70, 70, 82),
(83, 'Farfetchd', 52, 90, 55, 58, 62, 60, 83),
(84, 'Doduo', 35, 85, 45, 35, 35, 75, 84),
(85, 'Dodrio', 60, 110, 70, 60, 60, 110, 85),
(86, 'Seel', 65, 45, 55, 45, 70, 45, 86),
(87, 'Dewgong', 90, 70, 80, 70, 95, 70, 87),
(88, 'Grimer', 80, 80, 50, 40, 50, 25, 88),
(89, 'Muk', 105, 105, 75, 65, 100, 50, 89),
(90, 'Shellder', 30, 65, 100, 45, 25, 40, 90),
(91, 'Cloyster', 50, 95, 180, 85, 45, 70, 91),
(92, 'Gastly', 30, 35, 30, 100, 35, 80, 92),
(93, 'Haunter', 45, 50, 45, 115, 55, 95, 93),
(94, 'Gengar', 60, 65, 60, 130, 75, 110, 94),
(95, 'Onix', 35, 45, 160, 30, 45, 70, 95),
(96, 'Drowzee', 60, 48, 45, 43, 90, 42, 96),
(97, 'Hypno', 85, 73, 70, 73, 115, 67, 97),
(98, 'Krabby', 30, 105, 90, 25, 25, 50, 98),
(99, 'Kingler', 55, 130, 115, 50, 50, 75, 99),
(100, 'Voltorb', 40, 30, 50, 55, 55, 100, 100),
(101, 'Electrode', 60, 50, 70, 80, 80, 150, 101),
(102, 'Exeggcute', 60, 40, 80, 60, 45, 40, 102),
(103, 'Exeggutor', 95, 95, 85, 125, 75, 55, 103),
(104, 'Cubone', 50, 50, 95, 40, 50, 35, 104),
(105, 'Marowak', 60, 80, 110, 50, 80, 45, 105),
(106, 'Hitmonlee', 50, 120, 53, 35, 110, 87, 106),
(107, 'Hitmonchan', 50, 105, 79, 35, 110, 76, 107),
(108, 'Lickitung', 90, 55, 75, 60, 75, 30, 108),
(109, 'Koffing', 40, 65, 95, 60, 45, 35, 109),
(110, 'Weezing', 65, 90, 120, 85, 70, 60, 110),
(111, 'Rhyhorn', 80, 85, 95, 30, 30, 25, 111),
(112, 'Rhydon', 105, 130, 120, 45, 45, 40, 112),
(113, 'Chansey', 250, 5, 5, 35, 105, 50, 113),
(114, 'Tangela', 65, 55, 115, 100, 40, 60, 114),
(115, 'Kangaskhan', 105, 95, 80, 40, 80, 90, 115),
(116, 'Horsea', 30, 40, 70, 70, 25, 60, 116),
(117, 'Seadra', 55, 65, 95, 95, 45, 85, 117),
(118, 'Goldeen', 45, 67, 60, 35, 50, 63, 118),
(119, 'Seaking', 80, 92, 65, 65, 80, 68, 119),
(120, 'Staryu', 30, 45, 55, 70, 55, 85, 120),
(121, 'Starmie', 60, 75, 85, 100, 85, 115, 121),
(122, 'Mr. Mime', 40, 45, 65, 100, 120, 90, 122),
(123, 'Scyther', 70, 110, 80, 55, 80, 105, 123),
(124, 'Jynx', 65, 50, 35, 115, 95, 95, 124),
(125, 'Electabuzz', 65, 83, 57, 95, 85, 105, 125),
(126, 'Magmar', 65, 95, 57, 100, 85, 93, 126),
(127, 'Pinsir', 65, 125, 100, 55, 70, 85, 127),
(128, 'Tauros', 75, 100, 95, 40, 70, 110, 128),
(129, 'Magikarp', 20, 10, 55, 15, 20, 80, 129),
(130, 'Gyarados', 95, 125, 79, 60, 100, 81, 130),
(131, 'Lapras', 130, 85, 80, 85, 95, 60, 131),
(132, 'Ditto', 48, 48, 48, 48, 48, 48, 132),
(133, 'Eevee', 65, 75, 70, 65, 85, 75, 133),
(134, 'Vaporeon', 130, 65, 60, 110, 95, 65, 134),
(135, 'Jolteon', 65, 65, 60, 110, 95, 130, 135),
(136, 'Flareon', 65, 130, 65, 95, 110, 65, 136),
(137, 'Porygon', 65, 60, 70, 85, 75, 40, 137),
(138, 'Omanyte', 35, 40, 100, 95, 55, 35, 138),
(139, 'Omastar', 70, 60, 125, 115, 70, 55, 139),
(140, 'Kabuto', 30, 80, 90, 55, 45, 55, 140),
(141, 'Kabutops', 60, 115, 105, 65, 70, 80, 141),
(142, 'Aerodactyl', 80, 105, 65, 60, 75, 130, 142),
(143, 'Snorlax', 160, 110, 65, 65, 110, 30, 143),
(144, 'Articuno', 90, 85, 100, 95, 125, 85, 144),
(145, 'Zapdos', 90, 90, 85, 125, 90, 100, 145),
(146, 'Moltres', 90, 100, 90, 125, 85, 90, 146),
(147, 'Dratini', 41, 64, 45, 50, 50, 50, 147),
(148, 'Dragonair', 61, 84, 65, 70, 70, 70, 148),
(149, 'Dragonite', 91, 134, 95, 100, 100, 80, 149),
(150, 'Mewtwo', 106, 110, 90, 154, 90, 130, 150),
(151, 'Mew', 100, 100, 100, 100, 100, 100, 151);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon_extra_info`
--

CREATE TABLE `pokemon_extra_info` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `dex_descripcion` text NOT NULL,
  `habilidad_nombre` varchar(100) NOT NULL,
  `habilidad_descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon_extra_info`
--

INSERT INTO `pokemon_extra_info` (`id`, `categoria`, `dex_descripcion`, `habilidad_nombre`, `habilidad_descripcion`) VALUES
(1, 'Semilla', 'Tras nacer, crece alimentándose durante un tiempo de los nutrientes que contiene el bulbo de su lomo.', 'Espesura', 'Potencia los movimientos de tipo Planta cuando tiene poca salud'),
(2, 'Semilla', 'Cuanta más luz solar recibe, más aumenta su fuerza y más se desarrolla el capullo que tiene en el lomo.', 'Espesura', 'Potencia los movimientos de tipo Planta cuando tiene poca salud.'),
(3, 'Semilla', 'Puede convertir la luz del sol en energía. Por esa razón, es más poderoso en verano.', 'Espesura', 'Potencia los movimientos de tipo Planta cuando tiene poca salud.'),
(4, 'Lagartija', 'La llama de su cola indica su fuerza vital. Si está débil, la llama arderá más tenue.', 'Mar Llamas', 'Potencia los movimientos de tipo Fuego cuando tiene poca salud.'),
(5, 'Llama', 'Al agitar su ardiente cola, eleva poco a poco la temperatura a su alrededor para sofocar a sus rivales.', 'Mar Llamas', 'Potencia los movimientos de tipo Fuego cuando tiene poca salud.'),
(6, 'Llama', 'Cuando se enfurece de verdad, la llama de la punta de su cola se vuelve de color azul claro.', 'Mar Llamas', 'Potencia los movimientos de tipo Fuego cuando tiene poca salud.'),
(7, 'Tortuguita', 'Tras nacer, se le hincha el lomo y se le forma un caparazón. Escupe poderosa espuma por la boca.', 'Torrente', 'Potencia los movimientos de tipo Agua cuando tiene poca salud.'),
(8, 'Tortuga', 'Tiene una cola larga y peluda que simboliza la longevidad y lo hace popular entre los mayores.', 'Torrente', 'Potencia los movimientos de tipo Agua cuando tiene poca salud.'),
(9, 'Caparazón', 'Aumenta de peso deliberadamente para contrarrestar la fuerza de los chorros de agua que dispara.', 'Torrente', 'Potencia los movimientos de tipo Agua cuando tiene poca salud.'),
(10, 'Gusano', 'Para protegerse, despide un hedor horrible por las antenas con el que repele a sus enemigos.', 'Mudar', 'Cura los problemas de estado al evolucionar.'),
(11, 'Capullo', 'Como en este estado solo puede endurecer su coraza, permanece inmóvil a la espera de evolucionar.', 'Mudar', 'Cura los problemas de estado al evolucionar.'),
(12, 'Mariposa', 'Adora el néctar de las flores. Una pequeña cantidad de polen le basta para localizar prados floridos.', 'Ojo Compuesto', 'Aumenta la precisión de los movimientos.'),
(13, 'Oruga', 'El aguijón de la cabeza es muy puntiagudo. Se alimenta de hojas oculto en la espesura de bosques y praderas.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(14, 'Capullo', 'Aunque es casi incapaz de moverse, en caso de sentirse amenazado puede envenenar a los enemigos con su aguijón.', 'Mudar', 'Cura los problemas de estado al evolucionar.'),
(15, 'Abeja Veneno', 'Tiene tres aguijones venenosos, dos en las patas anteriores y uno en la parte baja del abdomen, con los que ataca a sus enemigos una y otra vez.', 'Enjambre', 'Potencia los movimientos de tipo Bicho cuando tiene poca salud.'),
(16, 'Pájaro Pequeño', 'Su docilidad es tal que suelen defenderse levantando arena en lugar de contraatacar.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(17, 'Pájaro', 'Su extraordinaria vitalidad y resistencia le permiten cubrir grandes distancias del territorio que habita en busca de presas.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(18, 'Pájaro', 'Este Pokémon vuela a una velocidad de 2 mach en busca de presas. Sus grandes garras son armas muy peligrosas.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(19, 'Ratón', 'Es propenso a hincar los incisivos en cualquier cosa que se le ponga por delante. Si se ve alguno, seguramente haya cuarenta cerca.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(20, 'Ratón', 'Gracias a las pequeñas membranas de las patas traseras, puede nadar por los ríos para capturar presas.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(21, 'Pájaro', 'A la hora de proteger su territorio, compensa su incapacidad para volar a gran altura con una increíble velocidad.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(22, 'Pájaro', 'Este Pokémon ha existido desde tiempos remotos. Al menor atisbo de peligro, alza el vuelo y huye.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(23, 'Serpiente', 'Puede desencajar la mandíbula libremente para engullir grandes presas, aunque esto le dificulte el movimiento por pesar demasiado.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(24, 'Cobra', 'El dibujo que tiene en el vientre parece una cara terrorífica. Los rivales más débiles salen huyendo nada más verlo.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(25, 'Ratón Eléctrico', 'Cuando se enfada, este Pokémon descarga la energía que almacena en el interior de las bolsas de las mejillas.', 'Electricidad Estática', 'Puede paralizar al contacto.'),
(26, 'Ratón Eléctrico', 'Su cola actúa como toma de tierra y descarga electricidad al suelo, lo que le protege de los calambrazos.', 'Electricidad Estática', 'Puede paralizar al contacto.'),
(27, 'Ratón', 'Excava madrigueras profundas en las que vive. Cuando lo ataca algún enemigo, se hace una bola y aguanta pacientemente sus embates.', 'Velo Arena', 'Aumenta la evasión en tormentas de arena.'),
(28, 'Ratón', 'Corre de un lado a otro a toda velocidad al tiempo que ataca hábilmente con las púas que tiene en la espalda y con sus afiladas garras.', 'Velo Arena', 'Aumenta la evasión en tormentas de arena.'),
(29, 'Pico Veneno', 'Posee un olfato más fino que los Nidoran♂. Usa los bigotes para percibir la dirección del viento y buscar comida a sotavento de sus depredadores.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(30, 'Pico Veneno', 'Se cree que el cuerno de la frente se le ha atrofiado para evitar herir a sus crías al alimentarlas.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(31, 'Taladro Veneno', 'Su defensa destaca sobre la capacidad ofensiva. Usa las escamas del cuerpo como una coraza para proteger a su prole de cualquier ataque.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(32, 'Pico Veneno', 'Mantiene sus grandes orejas levantadas, siempre alerta. Si advierte peligro, ataca inoculando una potente toxina con su cuerno frontal.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(33, 'Pico Veneno', 'Dondequiera que va, parte rocas con su cuerno, más duro que un diamante, en busca de una Piedra Lunar.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(34, 'Taladro Veneno', 'Una vez que se desboca, no hay quien lo pare. Solo se calma ante Nidoqueen, su compañera de toda la vida.', 'Punto Tóxico', 'Puede envenenar al contacto.'),
(35, 'Hada', 'En las noches de luna llena, Clefairy de diversos lugares se reúnen para bailar bajo su luz, la cual los hace flotar.', 'Gran Encanto', 'Puede enamorar al contacto.'),
(36, 'Hada', 'Se dice que este Pokémon emparentado con las hadas vive en zonas tranquilas en lo profundo de las montañas, ya que odia que lo vean.', 'Gran Encanto', 'Puede enamorar al contacto.'),
(37, 'Zorro', 'Si lo ataca un enemigo más fuerte que él, finge estar herido para confundirlo y huir en cuanto baja la guardia.', 'Absorbe Fuego', 'Recupera PS si recibe un ataque de fuego.'),
(38, 'Zorro', 'Cuentan algunas leyendas que cada una de sus nueve colas posee su propio y único poder sobrenatural.', 'Absorbe Fuego', 'Recupera PS si recibe un ataque de fuego.'),
(39, 'Globo', 'Cuando le tiemblan sus redondos y adorables ojos, entona una melodía agradable y misteriosa con la que duerme a sus enemigos.', 'Gran Encanto', 'Puede enamorar al contacto.'),
(40, 'Globo', 'Tiene un pelaje muy fino. Se recomienda no enfadarlo, o se inflará y golpeará con todo su cuerpo.', 'Gran Encanto', 'Puede enamorar al contacto.'),
(41, 'Murciélago', 'Emite ondas ultrasónicas por la boca para escrutar el entorno, lo que le permite volar con pericia por cuevas angostas.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(42, 'Murciélago', 'Le encanta chuparles la sangre a los seres vivos. En ocasiones comparte la preciada colecta con otros congéneres hambrientos.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(43, 'Hierba', 'Su nombre científico es Oddium viandantis. Se dice que, cuando cae la noche, puede llegar a desplazarse hasta 300 m con sus dos raíces.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(44, 'Hierba', 'El fluido que le cae lentamente de la boca no es saliva, sino una especie de néctar que utiliza para atraer a sus presas.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(45, 'Flor', 'El capullo florece de golpe con un chasquido, tras lo cual comienza a desprender un polen alergénico y venenoso.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(46, 'Hongo', 'Escarba en el suelo para extraer nutrientes de las raíces de los árboles, que las setas del lomo absorben después casi por completo.', 'Efecto Espora', 'Puede causar envenenamiento, parálisis o sueño.'),
(47, 'Hongo', 'Tras largo tiempo absorbiendo la energía del huésped, la seta parásita del lomo es la que parece controlar la voluntad de este Pokémon.', 'Efecto Espora', 'Puede causar envenenamiento, parálisis o sueño.'),
(48, 'Insecto', 'Rezuma veneno por todo su cuerpo. De noche, atrapa y come pequeños Pokémon insecto atraídos por la luz.', 'Foco Interno', 'Evita retroceder.'),
(49, 'Polilla Veneno', 'Tiene las alas cubiertas de escamas. Cada vez que las bate, esparce un polvillo sumamente venenoso.', 'Foco Interno', 'Evita retroceder.'),
(50, 'Topo', 'Vive 1 m por debajo del suelo, donde se alimenta de raíces. A veces también aparece en la superficie.', 'Velo Arena', 'Aumenta la evasión en tormentas de arena.'),
(51, 'Topo', 'Sus tres cabezas suben y bajan para remover la tierra cercana y facilitar así la excavación.', 'Velo Arena', 'Aumenta la evasión en tormentas de arena.'),
(52, 'Gato', 'Durante el día, se dedica a dormir. De noche, vigila su territorio con un brillo en los ojos.', 'Recogida', 'Puede recoger objetos tras el combate.'),
(53, 'Gato', 'Aunque es muy admirado por el pelaje, es difícil de entrenar como mascota porque enseguida suelta arañazos.', 'Recogida', 'Puede recoger objetos tras el combate.'),
(54, 'Pato', 'Padece continuamente dolores de cabeza. Cuando son muy fuertes, empieza a usar misteriosos poderes.', 'Humedad', 'Evita la autodestrucción.'),
(55, 'Pato', 'Cuando nada a toda velocidad usando sus largas extremidades palmeadas, su frente comienza a brillar.', 'Humedad', 'Evita la autodestrucción.'),
(56, 'Mono', 'Vive en grupos en las copas de los árboles. Si pierde de vista a su manada, se siente solo y se enfada.', 'Espíritu Vital', 'Evita quedarse dormido.'),
(57, 'Mono', 'Se pone furioso si nota que alguien lo está mirando. Persigue a cualquiera que establezca contacto visual con él.', 'Espíritu Vital', 'Evita quedarse dormido.'),
(58, 'Perrito', 'De naturaleza valiente y honrada, se enfrenta sin miedo a enemigos más grandes y fuertes.', 'Absorbe Fuego', 'Recupera PS si recibe un ataque de fuego.'),
(59, 'Legendario', 'Cuenta un antiguo pergamino que la gente se quedaba fascinada al verlo correr por las praderas.', 'Absorbe Fuego', 'Recupera PS si recibe un ataque de fuego.'),
(60, 'Renacuajo', 'La espiral que tiene en el vientre son sus vísceras, visibles a través de la piel. Cuando acaba de comer, se ven de manera aún más nítida.', 'Absorbe Agua', 'Recupera PS si recibe un ataque de agua.'),
(61, 'Renacuajo', 'Aunque puede vivir en tierra firme gracias a que sus extremidades inferiores se han desarrollado, por algún motivo prefiere el medio acuático.', 'Absorbe Agua', 'Recupera PS si recibe un ataque de agua.'),
(62, 'Renacuajo', 'Aunque puede nadar de forma hábil y enérgica utilizando todos sus músculos, por algún motivo prefiere vivir en tierra firme.', 'Absorbe Agua', 'Recupera PS si recibe un ataque de agua.'),
(63, 'Psi', 'Es capaz de usar sus poderes psíquicos aun estando dormido. Al parecer, el contenido del sueño influye en sus facultades.', 'Sincronía', 'Pasa problemas de estado al rival.'),
(64, 'Psi', 'Duerme suspendido en el aire gracias a sus poderes psíquicos. La cola, de una flexibilidad extraordinaria, hace las veces de almohada.', 'Sincronía', 'Pasa problemas de estado al rival.'),
(65, 'Psi', 'Posee una capacidad intelectual fuera de lo común que le permite recordar todo lo sucedido desde el instante de su nacimiento.', 'Sincronía', 'Pasa problemas de estado al rival.'),
(66, 'Luchador', 'Es una masa de músculos y, pese a su pequeño tamaño, tiene fuerza de sobra para levantar en brazos a 100 personas.', 'Agallas', 'Aumenta el Ataque si sufre un problema de estado.'),
(67, 'Luchador', 'Su musculoso cuerpo es tan fuerte que usa un cinto antifuerza para controlar sus movimientos.', 'Agallas', 'Aumenta el Ataque si sufre un problema de estado.'),
(68, 'Luchador', 'Mueve sus cuatro brazos a tal velocidad que resultan imposibles de ver. Puede asestar hasta mil puñetazos en dos segundos.', 'Agallas', 'Aumenta el Ataque si sufre un problema de estado.'),
(69, 'Hierba', 'Si detecta algún movimiento a su alrededor, sea cuando sea, reacciona enseguida extendiendo sus finas lianas en esa dirección.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(70, 'Planta Carnívora', 'Rezuma un fluido neutralizante que impide que su propio ácido lo disuelva.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(71, 'Planta Carnívora', 'Deja que sus presas se le acerquen a la boca, atraídas por el aroma a néctar. Una vez dentro, las disuelve con su ácido.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(72, 'Medusa', 'Cuando baja la marea, se pueden encontrar Tentacool deshidratados junto a la orilla.', 'Cura Natural', 'Cura los problemas de estado al cambiar.'),
(73, 'Medusa', 'En muy raras ocasiones, cuando se produce una aparición masiva de Tentacruel, los Pokémon pez de los alrededores se esfuman sin dejar rastro.', 'Cura Natural', 'Cura los problemas de estado al cambiar.'),
(74, 'Roca', 'En reposo parece una roca normal, pero responde agitando los puños con agresividad si se pisa por error.', 'Cabeza Roca', 'Evita el daño por retroceso.'),
(75, 'Roca', 'Camina muy lentamente, por lo que se desplaza rodando, sin importarle lo que pueda haber en su camino.', 'Cabeza Roca', 'Evita el daño por retroceso.'),
(76, 'Roca', 'Está cubierto por un duro caparazón formado por losas de piedra. Lo muda una vez al año para aumentar de tamaño.', 'Cabeza Roca', 'Evita el daño por retroceso.'),
(77, 'Caballo Fuego', 'Apenas una hora después de nacer, ya le crecen la cola y la crin de fuego, que le confieren un aspecto magnífico.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(78, 'Caballo Fuego', 'Su crin de fuego centellea cuando galopa como una flecha a velocidades que llegan a alcanzar los 240 km/h.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(79, 'Bobo', 'Increíblemente lento y torpe. Tarda cinco segundos en sentir dolor si lo atacan.', 'Despiste', 'Evita la confusión.'),
(80, 'Ermitaño', 'Según parece, cuando Slowpoke fue a pescar al mar, un Shellder le mordió la cola y así evolucionó a Slowbro.', 'Despiste', 'Evita la confusión.'),
(81, 'Imán', 'Las unidades laterales crean ondas electromagnéticas que contrarrestan la gravedad y le permiten flotar.', 'Imán', 'Aumenta la precisión de los movimientos eléctricos.'),
(82, 'Imán', 'Tres Magnemite se enlazan mediante una intensa fuerza magnética. Provoca un fuerte pitido en los oídos a quien se le acerque.', 'Imán', 'Aumenta la precisión de los movimientos eléctricos.'),
(83, 'Pato Loco', 'No puede vivir sin el puerro que lleva, así que lo protege de sus atacantes con todas sus fuerzas.', 'Foco Interno', 'Evita retroceder.'),
(84, 'Pájaro Cabeza', 'Sus cabezas gemelas comparten la misma información genética y combaten juntas al unísono.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(85, 'Pájaro Cabeza', 'Ahora cuenta con tres corazones y tres pares de pulmones. No alcanza las velocidades de Doduo, pero es capaz de correr durante más tiempo.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(86, 'Foca', 'La protuberancia que tiene en la cabeza es tan dura que la usa para abrirse paso a cabezazos por el hielo de los icebergs.', 'Gélido', 'Reduce el daño de ataques de tipo Hielo.'),
(87, 'Foca', 'Duerme en aguas poco profundas durante el día y, por la noche, cuando baja la temperatura del agua, nada en busca de comida.', 'Gélido', 'Reduce el daño de ataques de tipo Hielo.'),
(88, 'Lodo', 'Formados a partir de lodo, los Grimer se juntan en lugares sucios para aumentar el número de gérmenes de su cuerpo.', 'Hedor', 'Puede hacer retroceder al rival.'),
(89, 'Lodo', 'Está cubierto por un repugnante lodo. Es tan tóxico que hasta su rastro es venenoso.', 'Hedor', 'Puede hacer retroceder al rival.'),
(90, 'Bivalvo', 'Está metido en una concha más dura que el diamante, pero tiene un cuerpo muy blando.', 'Caparazón', 'Evita los golpes críticos.'),
(91, 'Bivalvo', 'A los Cloyster que viven en las fuertes corrientes marinas les crecen largas y afiladas púas en la concha.', 'Caparazón', 'Evita los golpes críticos.'),
(92, 'Gas', 'Su estrategia consiste en envolver al rival con su cuerpo gaseoso y envenenarlo a través de la piel.', 'Levitación', 'Inmune a ataques de tipo Tierra.'),
(93, 'Gas', 'Le gusta acechar en la oscuridad y tocarles el hombro a sus víctimas con su mano gaseosa. Estas se quedan temblando para siempre.', 'Levitación', 'Inmune a ataques de tipo Tierra.'),
(94, 'Sombra', 'Para quitarle la vida a su presa, se desliza en su sombra y espera su oportunidad en silencio.', 'Levitación', 'Inmune a ataques de tipo Tierra.'),
(95, 'Serpiente Roca', 'Al abrirse paso bajo tierra, va absorbiendo todo lo que encuentra. Eso hace que su cuerpo sea así de sólido.', 'Cabeza Roca', 'Evita el daño por retroceso.'),
(96, 'Hipnosis', 'Recuerda todos los sueños que engulle. Raramente come sueños de adultos porque los de los niños están más ricos.', 'Insomnio', 'Evita quedarse dormido.'),
(97, 'Hipnosis', 'Cuando mira al enemigo, usa diversos poderes psíquicos como la hipnosis.', 'Insomnio', 'Evita quedarse dormido.'),
(98, 'Pinza', 'Es fácil encontrarlo cerca del mar. Las largas pinzas que tiene vuelven a crecer si se las quitan de su sitio.', 'Caparazón', 'Evita los golpes críticos.'),
(99, 'Pinza', 'La pinza mayor posee una fuerza devastadora, pero es tan pesada que le cuesta usarla con precisión.', 'Caparazón', 'Evita los golpes críticos.'),
(100, 'Bola', 'Se mueve rodando. Si el terreno es irregular, una chispa provocada por algún bache lo hará explotar.', 'Electricidad Estática', 'Puede paralizar al contacto.'),
(101, 'Bola', 'Cuanta más energía almacena, mayor velocidad alcanza, aunque aumenta también el riesgo de que explote.', 'Electricidad Estática', 'Puede paralizar al contacto.'),
(102, 'Huevo', 'Si alguien confunde a una de sus cabezas con un huevo y la toca, se reagrupa con las otras para atacar todas juntas.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(103, 'Coco', 'Se lo llama la Selva Andante. Cada fruto tiene una cara distinta y voluntad propia.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(104, 'Hueso', 'Cuando llora al acordarse de su madre fallecida, su llanto resuena en el cráneo que lleva en la cabeza.', 'Cabeza Roca', 'Evita el daño por retroceso.'),
(105, 'Hueso', 'Ha evolucionado tras fortalecerse y superar su pena. Ahora lucha con arrojo blandiendo su hueso a modo de arma.', 'Cabeza Roca', 'Evita el daño por retroceso.'),
(106, 'Pateador', 'Endurece los músculos de las plantas de los pies en el momento en el que impactan contra su rival para potenciar al máximo sus patadas.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(107, 'Boxeador', 'Acorrala a sus enemigos con combinaciones de puñetazos con ambos puños, para luego darles el golpe de gracia con un directo a 500 km/h.', 'Vista Lince', 'Evita que disminuya la precisión.'),
(108, 'Lengua Larga', 'Si sus lametones no se tratan a tiempo, su saliva pegajosa y urticante puede provocar picores persistentes.', 'Despiste', 'Evita la confusión.'),
(109, 'Gas Veneno', 'Su cuerpo, con forma de globo y poco grosor, encierra gases muy tóxicos que pueden ocasionar explosiones espontáneas de gran magnitud.', 'Levitación', 'Inmune a ataques de tipo Tierra.'),
(110, 'Gas Veneno', 'Diluir sus venenosos gases internos lo máximo posible permite fabricar perfumes de alta gama.', 'Levitación', 'Inmune a ataques de tipo Tierra.'),
(111, 'Espinoso', 'Puede controlar un territorio de hasta 10 km de radio, pero, cuando se pone a correr, parece olvidársele dónde empieza y dónde acaba.', 'Pararrayos', 'Absorbe ataques eléctricos.'),
(112, 'Taladro', 'Hace chocar el cuerno con el de sus congéneres para afilarlo. Es capaz de horadar diamantes en bruto con él.', 'Pararrayos', 'Absorbe ataques eléctricos.'),
(113, 'Huevo', 'Un generoso Pokémon que pone huevos muy nutritivos y se los da a personas o Pokémon heridos.', 'Cura Natural', 'Cura los problemas de estado al cambiar.'),
(114, 'Enredadera', 'Sus lianas no dejan de crecer aunque se le desprendan. Aún se desconoce qué aspecto tiene sin ellas.', 'Clorofila', 'Aumenta la velocidad con sol.'),
(115, 'Canguro', 'Aunque lleve una cría en el marsupio, su juego de pies no pierde ligereza. Abruma al rival con ráfagas de ágiles puñetazos.', 'Fuerza Interna', 'Evita que retroceda.'),
(116, 'Dragón Marino', 'Si es atacado por un enemigo, por muy grande que sea, nada veloz a un lugar seguro gracias a su fornida aleta dorsal.', 'Nado Rápido', 'Aumenta la Velocidad bajo lluvia.'),
(117, 'Dragón Marino', 'En esta especie, es el macho quien se ocupa de cuidar a las crías, a las que defiende con sus púas venenosas de cualquiera que se les acerque.', 'Nado Rápido', 'Aumenta la Velocidad bajo lluvia.'),
(118, 'Pez Dorado', 'Sus aletas pectorales, caudal y dorsal ondean gráciles en el agua. Por eso se le llama el Bailarín Acuático.', 'Nado Rápido', 'Aumenta la Velocidad bajo lluvia.'),
(119, 'Pez', 'En otoño gana algo de peso para atraer a posibles parejas y se cubre de llamativos colores.', 'Nado Rápido', 'Aumenta la Velocidad bajo lluvia.'),
(120, 'Estrella', 'A finales de verano, se pueden ver grupos de Staryu en la orilla de la playa sincronizando el brillo de sus núcleos a ritmo regular.', 'Cura Natural', 'Cura los problemas de estado al cambiar.'),
(121, 'Misterioso', 'Su órgano central, conocido como núcleo, brilla con los colores del arcoíris cuando se dispone a liberar sus potentes poderes psíquicos.', 'Cura Natural', 'Cura los problemas de estado al cambiar.'),
(122, 'Barrera', 'Un experto de la pantomima capaz de crear paredes invisibles pero sólidas solo con sus gestos.', 'Filtro', 'Reduce el daño de ataques supereficaces.'),
(123, 'Mantis', 'Avanza por la hierba con sus afiladas guadañas, más rápido de lo que el ojo humano puede percibir.', 'Enjambre', 'Potencia los movimientos de tipo Bicho cuando tiene poca salud.'),
(124, 'Humanoide', 'En cierta parte de Galar se conocía a Jynx como la Reina del Hielo y se reverenciaba con cierto temor.', 'Despiste', 'Evita la confusión.'),
(125, 'Eléctrico', 'Su cuerpo descarga electricidad constantemente, por lo que eriza el cabello a cualquiera que se le acerque.', 'Electricidad Estática', 'Puede paralizar al contacto.'),
(126, 'Escupefuego', 'Fue descubierto junto al cráter de un volcán. Escupe llamaradas y su temperatura corporal alcanza los 1200 ºC.', 'Cuerpo Llama', 'Puede quemar al contacto.'),
(127, 'Cuerno', 'Los Pinsir se juzgan entre ellos por la robustez de la cornamenta. Cuanto más imponente sea, más agradará a sus congéneres del sexo opuesto.', 'Corte Fuerte', 'Aumenta el poder de ataques físicos.'),
(128, 'Toro', 'Cuando ve a un enemigo, se fustiga con las colas y carga ferozmente contra él.', 'Irascible', 'Aumenta el Ataque si es golpeado.'),
(129, 'Pez Débil', 'Un Pokémon desvalido y patético. A veces es capaz de saltar alto, pero rara vez más de 2 m.', 'Nado Rápido', 'Aumenta la Velocidad bajo lluvia.'),
(130, 'Atroz', 'Cuando aparece, monta en cólera. No deja de estar furioso hasta que lo destruye todo.', 'Intimidación', 'Reduce el Ataque del oponente al entrar.'),
(131, 'Transporte', 'Surca los mares transportando gente sobre el lomo. Al parecer, a veces entona un melodioso canto si está de buen humor.', 'Absorbe Agua', 'Recupera PS si recibe un ataque de agua.'),
(132, 'Transformación', 'Su habilidad para transformarse es perfecta, pero, si se le hace reír, perderá la fuerza y no podrá mantenerse transformado.', 'Flexibilidad', 'Evita quedar paralizado.'),
(133, 'Evolutivo', 'Es capaz de evolucionar de muchas maneras para adaptarse sin problemas a cualquier medio.', 'Fuga', 'Aumenta las probabilidades de escapar.'),
(134, 'Burbuja', 'Vive cerca del agua. Su cola termina en una aleta parecida a la de un pez, por lo que hay gente que lo confunde con una sirena.', 'Absorbe Agua', 'Recupera PS si recibe un ataque de agua.'),
(135, 'Relámpago', 'Concentra la débil actividad eléctrica de sus células para lanzar dañinas descargas.', 'Electricidad Estática', 'Puede paralizar al contacto.'),
(136, 'Llama', 'Calienta el aire que inhala en su saca de fuego y lo expulsa a 1700 ºC.', 'Cuerpo Llama', 'Puede quemar al contacto.'),
(137, 'Virtual', 'Un Pokémon artificial que no respira, por lo que se le supone la capacidad de desenvolverse sin problemas en cualquier entorno.', 'Descarga', 'Puede paralizar al contacto.'),
(138, 'Espiral', 'Varios ejemplares han escapado o bien han sido liberados tras su restauración, lo que comienza a suscitar una serie de problemas.', 'Caparazón', 'Evita los golpes críticos.'),
(139, 'Espiral', 'Se cree que se extinguió porque el excesivo tamaño y peso de su concha le impedían moverse con rapidez para capturar presas.', 'Caparazón', 'Evita los golpes críticos.'),
(140, 'Caparazón', 'Un Pokémon casi extinto. Cada tres días, muda el caparazón, que se va endureciendo de forma progresiva.', 'Arm. Batalla', 'Evita reducción de estadísticas.'),
(141, 'Caparazón', 'Despedaza a las presas que atrapa para sorber sus fluidos y deja los restos para que otros Pokémon den buena cuenta de ellos.', 'Arm. Batalla', 'Evita reducción de estadísticas.'),
(142, 'Fósil', 'Un feroz Pokémon de la época prehistórica al que no bastan todos los avances tecnológicos actuales para regenerar a la perfección.', 'Presión', 'Aumenta el gasto de PP del oponente.'),
(143, 'Dormilón', 'Este Pokémon es un glotón que lo único que hace aparte de comer es dormir. Puede ingerir hasta 400 kg de comida en un solo día.', 'Inmunidad', 'Evita ser envenenado.'),
(144, 'Ave Fría', 'Una de las aves legendarias. Es capaz de generar ventiscas congelando la humedad del aire.', 'Presión', 'Aumenta el gasto de PP del oponente.'),
(145, 'Ave Eléctrica', 'Una de las aves legendarias. Según dicen, vive en los nubarrones y controla los rayos a su antojo.', 'Presión', 'Aumenta el gasto de PP del oponente.'),
(146, 'Ave Fuego', 'Una de las aves legendarias. Dicen que su presencia anuncia la llegada de la primavera.', 'Presión', 'Aumenta el gasto de PP del oponente.'),
(147, 'Dragón', 'Durante la etapa de crecimiento, muda muchas veces de piel y se protege mediante una cascada.', 'Mudar', 'Cura los problemas de estado al subir de nivel.'),
(148, 'Dragón', 'Dicen que, cuando su cuerpo desprende un aura, el tiempo empieza a cambiar inmediatamente.', 'Mudar', 'Cura los problemas de estado al subir de nivel.'),
(149, 'Dragón', 'Dicen que viven en una isla en algún lugar del océano que solo ellos habitan.', 'Fuerza Interna', 'Evita que retroceda.'),
(150, 'Genético', 'Su ADN es casi el mismo que el de Mew. Sin embargo, su tamaño y carácter son muy diferentes.', 'Presión', 'Aumenta el gasto de PP del oponente.'),
(151, 'Nuevo', 'Si se observa a través de un microscopio, puede distinguirse cuán corto, fino y delicado es el pelaje de este Pokémon.', 'Sincronía', 'Pasa problemas de estado al rival.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon_tipos`
--

CREATE TABLE `pokemon_tipos` (
  `pokemon_id` int(11) NOT NULL,
  `tipo1_id` int(11) NOT NULL,
  `tipo2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon_tipos`
--

INSERT INTO `pokemon_tipos` (`pokemon_id`, `tipo1_id`, `tipo2_id`) VALUES
(1, 12, 17),
(2, 12, 17),
(3, 12, 17),
(4, 7, NULL),
(5, 7, NULL),
(6, 7, 18),
(7, 2, NULL),
(8, 2, NULL),
(9, 2, NULL),
(10, 3, NULL),
(11, 3, NULL),
(12, 3, 18),
(13, 3, 17),
(14, 3, 17),
(15, 3, 17),
(16, 11, 18),
(17, 11, 18),
(18, 11, 18),
(19, 11, NULL),
(20, 11, NULL),
(21, 11, 18),
(22, 11, 18),
(23, 17, NULL),
(24, 17, NULL),
(25, 5, NULL),
(26, 5, NULL),
(27, 16, NULL),
(28, 16, NULL),
(29, 17, NULL),
(30, 17, NULL),
(31, 17, 16),
(32, 17, NULL),
(33, 17, NULL),
(34, 17, 16),
(35, 8, NULL),
(36, 8, NULL),
(37, 7, NULL),
(38, 7, NULL),
(39, 11, 8),
(40, 11, 8),
(41, 17, 18),
(42, 17, 18),
(43, 12, 17),
(44, 12, 17),
(45, 12, 17),
(46, 3, 12),
(47, 3, 12),
(48, 3, 17),
(49, 3, 17),
(50, 16, NULL),
(51, 16, NULL),
(52, 11, NULL),
(53, 11, NULL),
(54, 2, NULL),
(55, 2, NULL),
(56, 10, NULL),
(57, 10, NULL),
(58, 7, NULL),
(59, 7, NULL),
(60, 2, NULL),
(61, 2, NULL),
(62, 2, 10),
(63, 13, NULL),
(64, 13, NULL),
(65, 13, NULL),
(66, 10, NULL),
(67, 10, NULL),
(68, 10, NULL),
(69, 12, 17),
(70, 12, 17),
(71, 12, 17),
(72, 2, 17),
(73, 2, 17),
(74, 14, 16),
(75, 14, 16),
(76, 14, 16),
(77, 7, NULL),
(78, 7, NULL),
(79, 2, 13),
(80, 2, 13),
(81, 5, 1),
(82, 5, 1),
(83, 11, 18),
(84, 11, 18),
(85, 11, 18),
(86, 2, NULL),
(87, 2, 9),
(88, 17, NULL),
(89, 17, NULL),
(90, 2, NULL),
(91, 2, 9),
(92, 6, 17),
(93, 6, 17),
(94, 6, 17),
(95, 14, 16),
(96, 13, NULL),
(97, 13, NULL),
(98, 2, NULL),
(99, 2, NULL),
(100, 5, NULL),
(101, 5, NULL),
(102, 12, 13),
(103, 12, 13),
(104, 16, NULL),
(105, 16, NULL),
(106, 10, NULL),
(107, 10, NULL),
(108, 11, NULL),
(109, 17, NULL),
(110, 17, NULL),
(111, 16, 14),
(112, 16, 14),
(113, 11, NULL),
(114, 12, NULL),
(115, 11, NULL),
(116, 2, NULL),
(117, 2, NULL),
(118, 2, NULL),
(119, 2, NULL),
(120, 2, NULL),
(121, 2, 13),
(122, 13, 8),
(123, 3, 18),
(124, 9, 13),
(125, 5, NULL),
(126, 7, NULL),
(127, 3, NULL),
(128, 11, NULL),
(129, 2, NULL),
(130, 2, 18),
(131, 2, 9),
(132, 11, NULL),
(133, 11, NULL),
(134, 2, NULL),
(135, 5, NULL),
(136, 7, NULL),
(137, 11, NULL),
(138, 14, 2),
(139, 14, 2),
(140, 14, 2),
(141, 14, 2),
(142, 14, 18),
(143, 11, NULL),
(144, 9, 18),
(145, 5, 18),
(146, 7, 18),
(147, 4, NULL),
(148, 4, NULL),
(149, 4, 18),
(150, 13, NULL),
(151, 13, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `descripcion`) VALUES
(1, 'Acero'),
(2, 'Agua'),
(3, 'Bicho'),
(4, 'Dragon'),
(5, 'Electrico'),
(6, 'Fantasma'),
(7, 'Fuego'),
(8, 'Hada'),
(9, 'Hielo'),
(10, 'Lucha'),
(11, 'Normal'),
(12, 'Planta'),
(13, 'Psiquico'),
(14, 'Roca'),
(15, 'Sinietro'),
(16, 'Tierra'),
(17, 'Veneno'),
(18, 'Volador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `name`, `password`, `role`) VALUES
(1, 'admin', '1234', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  ADD PRIMARY KEY (`evoluciona_de`,`evoluciona_a`),
  ADD KEY `evoluciona_a` (`evoluciona_a`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_dex_number` (`dex_entry`);

--
-- Indices de la tabla `pokemon_extra_info`
--
ALTER TABLE `pokemon_extra_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pokemon_tipos`
--
ALTER TABLE `pokemon_tipos`
  ADD PRIMARY KEY (`pokemon_id`),
  ADD KEY `tipo1_id` (`tipo1_id`),
  ADD KEY `tipo2_id` (`tipo2_id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evoluciones`
--
ALTER TABLE `evoluciones`
  ADD CONSTRAINT `evoluciones_ibfk_1` FOREIGN KEY (`evoluciona_de`) REFERENCES `pokemon` (`dex_entry`),
  ADD CONSTRAINT `evoluciones_ibfk_2` FOREIGN KEY (`evoluciona_a`) REFERENCES `pokemon` (`dex_entry`);

--
-- Filtros para la tabla `pokemon_extra_info`
--
ALTER TABLE `pokemon_extra_info`
  ADD CONSTRAINT `pokemon_extra_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pokemon` (`dex_entry`);

--
-- Filtros para la tabla `pokemon_tipos`
--
ALTER TABLE `pokemon_tipos`
  ADD CONSTRAINT `pokemon_tipos_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`dex_entry`),
  ADD CONSTRAINT `pokemon_tipos_ibfk_2` FOREIGN KEY (`tipo1_id`) REFERENCES `tipos` (`id`),
  ADD CONSTRAINT `pokemon_tipos_ibfk_3` FOREIGN KEY (`tipo2_id`) REFERENCES `tipos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
