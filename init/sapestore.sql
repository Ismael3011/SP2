-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 23, 2025 alle 15:14
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sapestore`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`ID`, `nombre`, `descripcion`) VALUES
(2, 'Zapatillas', 'Descubre nuestras increibles zapatillas.'),
(3, 'Sudaderas', 'Las mejores sudadedas del mercado.'),
(4, 'Camisetas', 'Y aves loco'),
(5, 'Pantalones Cortos', 'mmmm'),
(6, 'Chaquetones', 'No pases frio con los super chaquetones de SapeStore'),
(7, 'Conjuntos', 'No te preocupes por combinar la ropa, nosotros lo haremos por ti.'),
(8, 'Pantalones', 'Lo ultimo en moda desde Sapestore.');

-- --------------------------------------------------------

--
-- Struttura della tabella `categoria_marca`
--

CREATE TABLE `categoria_marca` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `marca_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `categoria_marca`
--

INSERT INTO `categoria_marca` (`ID`, `nombre`, `marca_id`) VALUES
(1, 'Dunk', 1),
(2, 'TN', 1),
(3, 'Yeezy', 6),
(4, 'Jordan', 1),
(5, 'Bad Bunny', 6),
(6, 'Travis Scott', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `ID` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_talla_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`ID`, `pedido_id`, `producto_talla_id`, `cantidad`) VALUES
(9, 7, 73, 1),
(10, 8, 25, 1),
(11, 9, 76, 1),
(12, 10, 37, 1),
(13, 11, 45, 1),
(14, 12, 62, 1),
(15, 13, 106, 1),
(16, 14, 54, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `marca`
--

CREATE TABLE `marca` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `marca`
--

INSERT INTO `marca` (`ID`, `nombre`, `descripcion`, `logo_url`) VALUES
(1, 'Nike', 'Desde 1986 dejando increibles productos.', 'fotos/Logo_NIKE.svg'),
(5, 'Off-White', 'Marca Francesa que revoluciono el mecado en 2016 y que a dia de hoy sigue dejando increibles productos a nuestra disposicion.', 'fotos/Off-White_Logo.svg.png'),
(6, 'Adidas', 'Adidas es una reconocida marca global de ropa y calzado deportivo, conocida por su innovación, estilo y rendimiento. Su icónico logo de las tres bandas simboliza calidad y compromiso con el deporte y la moda urbana', 'fotos/Logo_Adidas.png'),
(7, 'Palace', 'Palace es una marca de streetwear británica que mezcla la cultura del skate con un estilo urbano audaz y retro. Es conocida por su estética irreverente, colaboraciones exclusivas y su icónico logo triangular.', 'fotos/fc06494339406aa4f935cf7a8461fb37-fotor-bg-remover-20250327143559.png'),
(8, 'Stussy', 'Stüssy es una marca pionera del streetwear nacida en California, que fusiona surf, skate y cultura urbana con un estilo relajado y distintivo. Su logotipo manuscrito es un ícono del estilo callejero desde los años 80.', 'fotos/stussy-1-logo-png-transparent.png'),
(9, 'New Balance', 'New Balance es una marca estadounidense de calzado y ropa deportiva reconocida por su comodidad, calidad y diseño atemporal. Combina tecnología de alto rendimiento con un estilo clásico que trasciende generaciones.', 'fotos/new-balance-2-logo-png-transparent.png'),
(10, 'Trapstar', 'Marca de Londres, centrada en el Streetwear con grandes colaboraciones junto a CentralCee, Rondodasosa, Russ Millions...', 'fotos/2ed05ab080c6c1a1c0390d01cf296388-removebg-preview.png'),
(11, 'The North Face', 'Marca especializada en productos para el invierno, no te preocupes de pasar frio en esta seccion.', 'fotos/logo-north-face-1966-removebg-preview.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `pedidos`
--

CREATE TABLE `pedidos` (
  `ID` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `pedidos`
--

INSERT INTO `pedidos` (`ID`, `usuario_id`, `fecha`, `total`, `direccion`) VALUES
(7, 12, '2025-04-07 14:54:28', 60.00, 'sasasa, 04770, almeria'),
(8, 12, '2025-04-07 14:58:09', 180.00, 'sasa, 32, almeria'),
(9, 12, '2025-04-15 15:37:22', 80.00, 'sasa2, 1212, sasa'),
(10, 12, '2025-04-22 15:01:03', 110.00, 'sasasa, 04770, Almeria'),
(11, 12, '2025-04-22 15:03:18', 170.00, 'prueba, 04770, Almeria'),
(12, 12, '2025-04-22 15:13:24', 220.00, 'prueba2, 04770, Almeria'),
(13, 12, '2025-04-22 15:18:12', 450.00, 'prueba2, 04770, Almeria'),
(14, 12, '2025-04-22 15:19:34', 130.00, 'pruebaazules, 04770, Almeria');

-- --------------------------------------------------------

--
-- Struttura della tabella `producto`
--

CREATE TABLE `producto` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `categoria_marca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `producto`
--

INSERT INTO `producto` (`ID`, `nombre`, `descripcion`, `imagen_url`, `categoria_id`, `marca_id`, `categoria_marca_id`) VALUES
(19, 'Nike Low Cacao', 'sasasd', 'fotos/5013539_0.webp', 2, 1, 1),
(26, 'Nike Dunk Low Photon Dust', 'Maravilosas Dunks con toques de colores claros, perfectas para verano.', 'fotos/5010315_0.webp', 2, 1, 1),
(27, 'Nike Dunk Low Rose Whisper', 'Increibles Dunks con toques rosados, lanzadas en 2020 y perfectas para la moda actual.', 'fotos/5015639_0.jpg', 2, 1, 1),
(28, 'Nike Dunk Low Retro Panda', 'Increibles zapatillas de color negor y blanco perfectas para el dia a dia.', 'fotos/5011639_0.jpg', 2, 1, 1),
(29, 'Nike Dunk Low Next Nature Aster Pink', 'Preciosas Dunks de color rosa fuerte.', 'fotos/5015739_0.jpg', 2, 1, 1),
(30, 'Air Max Dn White', 'Combinacion de unas zapatillas depotivas con lo ultimo visto en el muno de la moda.', 'fotos/8011802_0.webp', 2, 1, 2),
(31, 'Nike Air Max Dn8', 'Combinacion de unas zapatillas depotivas con lo ultimo visto en el muno de la moda.', 'fotos/8016470_0.jpg', 2, 1, 2),
(32, 'Nike Air Max Dn8 Red', 'Combinacion de unas zapatillas depotivas con lo ultimo visto en el muno de la moda.', 'fotos/5015701_0.jpg', 2, 1, 2),
(33, 'Nike Air Max Dn8 Titanium', 'Combinacion de unas zapatillas depotivas con lo ultimo visto en el muno de la moda.', 'fotos/5012701_0.webp', 2, 1, 2),
(34, 'Air Jordan 1 Low Aquatone', 'Zapatillas de Michael Jordan utilizadas en 1987 ante los Lakers.', 'fotos/large-sport-shoe-5049112-0.jpg', 2, 1, 4),
(35, 'Air Jordan 1 Low Reverse Black Toe', 'Zapatillas de Michael Jordan utilizadas en 1987 ante los Lakers.', 'fotos/large-sport-shoe-5040132-0.jpg', 2, 1, 4),
(36, 'Air Jordan 1 Low Pink Salt', 'Zapatillas de Michael Jordan utilizadas en 1987 ante los Lakers.', 'fotos/large-sport-shoe-5043119-0.jpg', 2, 1, 4),
(38, 'Black Puffer', 'No pases frio con el chaqueton de TrapStar directamente desde Londres con la mejor calidad.', 'fotos/Giacca-imbottita-Irongate-Trapstar-con-cappuccio-staccabile1.webp', 6, 10, NULL),
(39, 'Conjunto TrapStar Negro', 'Precioso conjunto para verano, marca el estilo de Londres.', 'fotos/Conjunto-Corto-Trapstar-TRP-Flame-Negro-Rosa-2-430x491-1.webp', 7, 10, NULL),
(40, 'Conjunto TrapStar Blanco/Gris', 'Conjunto de Trapstar perfecto para verano.', 'fotos/Conjunto-Corto-Trapstar-TRP-Flame-Blanco-Caqui-2-430x491-1.webp', 7, 10, NULL),
(41, 'Camiseta Candy', 'Camiseta colorida de TrapStar marca la moda de Londres.', 'fotos/Maglietta-nera-di-Trapstar-Candy.webp', 4, 10, NULL),
(42, 'Off-White Out Of Office', 'Zapatillas de Off-White super coloridas, y combinables.', 'fotos/1268518.webp', 2, 5, NULL),
(43, 'Pickup Tee', 'Camiseta roja de Stussy con un estampado precioso.', 'fotos/1905130_CAYA_2.webp', 4, 8, NULL),
(44, 'CALIFORNIA GROWN TEE PIGMENT DYED', 'Creada por Stussy con un eslogan sencillo pero diferente.', 'fotos/1905135_NATL_2.webp', 4, 8, NULL),
(45, 'BIG & MEATY ZIP HOODIE', 'Sudadera zip de stussy perfecta para el invierno.', 'fotos/1975133_BLAC_2.webp', 3, 8, NULL),
(46, 'WHITE BIG & MEATY ZIP HOODIE', 'Creada por Stussy con un eslogan sencillo pero diferente.', 'fotos/1975133_ASHH_2.webp', 3, 8, NULL),
(47, 'FLEECE PANT FADED GRAPHIC', 'Pantalones 100 de lana con un color unico.', 'fotos/116667_WABL_1_47300067-b677-46a4-872e-7f309cc73f9d.webp', 8, 8, NULL),
(48, 'BIG OL', 'Pantalones 100 de lana con un color unico.', 'fotos/116577_BONE_1_719ff129-564d-4586-963d-738320d0bc5d.webp', 8, 8, NULL),
(49, 'HALF ZIP MOCK NECK SWEATER', 'Sudadera medio zip sin capucha de Stussy perfecta para entre tiempo.', 'fotos/117219_BLAC_1_76336322-02fb-41c7-9a79-44c1d245bdaa.webp', 3, 8, NULL),
(50, 'BIG OL\' SHORT LEATHER', 'Pantalones cortos atrevidos, para los mas atrevidos que quieren marcar la diferencia en verano.', 'fotos/112315_LIME_1.webp', 5, 8, NULL),
(51, 'New Balance 530', 'Zapatillas estilo Y2K de NewBalance, faciles de combinar.', 'fotos/8011899_0.webp', 2, 9, NULL),
(52, 'New Balance 550', 'Zapatillas de color verdoso, lo ultimo de NewBalance , imposible pasar desapercibido si vas con una de estas.', 'fotos/5041386_0.jpg', 2, 9, NULL),
(53, 'New Balance 1906R', 'Zapatillas deslumbrantes de NewBalance, perfectas para el estilo Y2k.', 'fotos/5012174_0.webp', 2, 9, NULL),
(54, 'Campus \"Deep Brown\" x Bad Bunny - Marrone scuro', 'Colaboracion con el artista de Puerto Rico Bad bunny, faciles de combinar y perfectas para salir.', 'fotos/ID2534_sivasdescalzo-adidas-BAD_BUNNY_CAMPUS-1714733550-1.webp', 2, 6, 5),
(55, 'Adidas Forum Buckle Low Bad Bunny Last Forum', 'Colaboracion con el artista de Puerto Rico Bad bunny, faciles de combinar y perfectas para salir.', 'fotos/adidas-forum-buckle-low-bad-bunny-last-forum-hq2153-resellzone.webp', 2, 6, 5),
(56, 'adidas Mens Forum Powerphase GZ2009 Bad Bunny Benito', 'Colaboracion con el artista de Puerto Rico Bad bunny, faciles de combinar y perfectas para salir.', 'fotos/71JxDsd3jZL._AC_SX695_.jpg', 2, 6, 5),
(57, 'SASA', 'sasasas', 'fotos/Screenshot 2025-04-11 144839.png', 4, 5, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `producto_imagen`
--

CREATE TABLE `producto_imagen` (
  `ID` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `imagen_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `producto_imagen`
--

INSERT INTO `producto_imagen` (`ID`, `producto_id`, `imagen_url`) VALUES
(5, 19, 'fotos/5013539_1.webp'),
(6, 19, 'fotos/5013539_2.webp'),
(7, 19, 'fotos/5013539_3.webp'),
(8, 19, 'fotos/5013539_4.jpg'),
(9, 26, 'fotos/5010315_1.webp'),
(10, 26, 'fotos/5010315_2.webp'),
(11, 26, 'fotos/5010315_3.webp'),
(12, 27, 'fotos/5015639_1.jpg'),
(13, 27, 'fotos/5015639_2.jpg'),
(14, 27, 'fotos/5015639_3.webp'),
(15, 28, 'fotos/5011639_1.webp'),
(16, 28, 'fotos/5011639_2.webp'),
(17, 28, 'fotos/5011639_3.webp'),
(18, 29, 'fotos/5015739_1.jpg'),
(19, 29, 'fotos/5015739_2.webp'),
(20, 29, 'fotos/5015739_3.jpg'),
(21, 30, 'fotos/8011802_1.webp'),
(22, 30, 'fotos/8011802_2.webp'),
(23, 30, 'fotos/8011802_3.jpg'),
(24, 31, 'fotos/8016470_1.jpg'),
(25, 31, 'fotos/8016470_2.jpg'),
(26, 31, 'fotos/8016470_3.jpg'),
(27, 32, 'fotos/5015701_1.jpg'),
(28, 32, 'fotos/5015701_2.jpg'),
(29, 32, 'fotos/5015701_3.jpg'),
(30, 33, 'fotos/5012701_1.jpg'),
(31, 33, 'fotos/5012701_2.jpg'),
(32, 33, 'fotos/5012701_3.jpg'),
(33, 34, 'fotos/large-sport-shoe-5049112-1.jpg'),
(34, 34, 'fotos/large-sport-shoe-5049112-2.jpg'),
(35, 34, 'fotos/large-sport-shoe-5049112-3.webp'),
(36, 35, 'fotos/large-sport-shoe-5040132-1.webp'),
(37, 35, 'fotos/large-sport-shoe-5040132-2.jpg'),
(38, 35, 'fotos/large-sport-shoe-5040132-3.webp'),
(39, 36, 'fotos/large-sport-shoe-5043119-1.webp'),
(40, 36, 'fotos/large-sport-shoe-5043119-2.webp'),
(41, 36, 'fotos/large-sport-shoe-5043119-3.webp'),
(42, 38, 'fotos/Giacca-imbottita-Irongate-Trapstar-con-cappuccio-staccabile.webp'),
(43, 39, 'fotos/Conjunto-Corto-Trapstar-TRP-Flame-Negro-Rosa-1-430x491-1.webp'),
(44, 40, 'fotos/Conjunto-Corto-Trapstar-TRP-Flame-Blanco-Caqui-1-430x491-1.webp'),
(45, 41, 'fotos/Maglietta-nera-di-Trapstar-Candy1.webp'),
(46, 42, 'fotos/1268521.webp'),
(47, 42, 'fotos/1268524.webp'),
(48, 42, 'fotos/1268527.webp'),
(49, 43, 'fotos/1905130_CAYA_1.webp'),
(50, 44, 'fotos/1905135_NATL_1.webp'),
(51, 45, 'fotos/1975133_BLAC_1.webp'),
(52, 46, 'fotos/1975133_ASHH_1.webp'),
(53, 47, 'fotos/116667_WABL_2_589cb46f-3bf0-4319-891c-94b03e6bff7f.webp'),
(54, 48, 'fotos/116577_BONE_2_41112010-fcdf-478c-a155-d3d9bd052bf2.webp'),
(55, 49, 'fotos/117219_BLAC_2_9b884dad-8069-4a0b-a770-98173fd67397.webp'),
(56, 50, 'fotos/112315_LIME_2.webp'),
(57, 51, 'fotos/8011899_1.webp'),
(58, 51, 'fotos/8011899_2.webp'),
(59, 51, 'fotos/8011899_3.webp'),
(60, 52, 'fotos/5041386_1.jpg'),
(61, 52, 'fotos/5041386_2.jpg'),
(62, 52, 'fotos/5041386_3.jpg'),
(63, 53, 'fotos/5012174_1.webp'),
(64, 53, 'fotos/5012174_2.jpg'),
(65, 53, 'fotos/5012174_3.webp'),
(66, 54, 'fotos/ID2534_sivasdescalzo-adidas-BAD_BUNNY_CAMPUS-1714733542-2.webp'),
(67, 54, 'fotos/ID2534_sivasdescalzo-adidas-BAD_BUNNY_CAMPUS-1714733516-3.webp'),
(68, 54, 'fotos/ID2534_sivasdescalzo-adidas-BAD_BUNNY_CAMPUS-1714733489-4.webp'),
(69, 55, 'fotos/adidas-forum-buckle-low-bad-bunny-last-forum-hq2153-resellzone-1.webp'),
(70, 56, 'fotos/61NpRHraQ+L._AC_SX625_.jpg'),
(71, 56, 'fotos/71E7pnpvBbL._AC_SX625_.jpg'),
(72, 56, 'fotos/71WTgc6QclL._AC_SX625_.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `producto_talla`
--

CREATE TABLE `producto_talla` (
  `ID` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `talla_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `producto_talla`
--

INSERT INTO `producto_talla` (`ID`, `producto_id`, `talla_id`) VALUES
(25, 19, 25),
(32, 26, 32),
(33, 26, 33),
(34, 26, 34),
(35, 27, 35),
(36, 27, 36),
(37, 27, 37),
(38, 28, 38),
(39, 28, 39),
(40, 29, 40),
(41, 29, 41),
(42, 30, 42),
(43, 30, 43),
(44, 30, 44),
(45, 31, 45),
(46, 31, 46),
(47, 32, 47),
(48, 32, 48),
(49, 32, 49),
(50, 33, 50),
(51, 33, 51),
(52, 33, 52),
(53, 34, 53),
(54, 34, 54),
(55, 34, 55),
(56, 35, 56),
(57, 35, 57),
(58, 35, 58),
(59, 36, 59),
(60, 36, 60),
(61, 38, 61),
(62, 38, 62),
(63, 39, 63),
(64, 39, 64),
(65, 39, 65),
(66, 40, 66),
(67, 40, 67),
(68, 41, 68),
(69, 41, 69),
(70, 41, 70),
(71, 42, 71),
(72, 42, 72),
(73, 43, 73),
(74, 43, 74),
(75, 44, 75),
(76, 44, 76),
(77, 44, 77),
(78, 45, 78),
(79, 45, 79),
(80, 45, 80),
(81, 46, 81),
(82, 47, 82),
(83, 47, 83),
(84, 48, 84),
(85, 48, 85),
(86, 49, 86),
(87, 49, 87),
(88, 49, 88),
(89, 50, 89),
(90, 50, 90),
(91, 50, 91),
(92, 51, 92),
(93, 51, 93),
(94, 51, 94),
(95, 52, 95),
(96, 52, 96),
(97, 52, 97),
(98, 52, 98),
(99, 52, 99),
(100, 53, 100),
(101, 53, 101),
(102, 54, 102),
(103, 54, 103),
(104, 54, 104),
(105, 55, 105),
(106, 55, 106),
(107, 56, 107),
(108, 56, 108),
(109, 57, 109);

-- --------------------------------------------------------

--
-- Struttura della tabella `talla`
--

CREATE TABLE `talla` (
  `ID` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `talla`
--

INSERT INTO `talla` (`ID`, `numero`, `precio`, `stock`) VALUES
(1, '42', 222.00, 12),
(2, '43', 100.00, 1),
(3, '44', 300.00, 10),
(4, '43', 288.00, 1),
(5, '43', 200.00, 10),
(6, '44', 300.00, 10),
(7, '43', 200.00, 6),
(8, 'S', 90.00, 5),
(9, 'M', 90.00, 12),
(10, 'L', 100.00, 10),
(11, '43', 220.00, 10),
(12, '43', 120.00, 10),
(13, 'L', 90.00, 10),
(14, 'S', 120.00, 11),
(15, 'M', 60.00, 12),
(16, 'S', 220.00, 12),
(17, '43', 120.00, 12),
(18, '44', 130.00, 10),
(19, '44', 190.00, 12),
(20, '44', 1200.00, 1),
(21, '44', 120.00, 12),
(22, '43', 190.00, 12),
(23, '44', 190.00, 12),
(24, '44', 220.00, 12),
(25, '44', 180.00, 11),
(26, '44.5', 240.00, 12),
(27, '44', 120.00, 0),
(28, '44', 200.00, 0),
(29, '44', 280.00, 0),
(30, '44', 220.00, 0),
(31, '44', 170.00, 10),
(32, '43', 180.00, 0),
(33, '44', 190.00, 10),
(34, '43.5', 200.00, 10),
(35, '42', 90.00, 0),
(36, '43', 100.00, 10),
(37, '44', 110.00, 9),
(38, '42', 110.00, 0),
(39, '43', 120.00, 10),
(40, '42', 120.00, 0),
(41, '43', 130.00, 10),
(42, '43', 170.00, 0),
(43, '44', 170.00, 11),
(44, '41', 170.00, 11),
(45, '42', 170.00, -1),
(46, '43', 170.00, 11),
(47, '42', 190.00, 0),
(48, '43', 190.00, 11),
(49, '44', 190.00, 11),
(50, '42', 190.00, 0),
(51, '43', 190.00, 11),
(52, '44', 190.00, 11),
(53, '42', 130.00, 0),
(54, '43', 130.00, 10),
(55, '44', 140.00, 11),
(56, '42', 90.00, 0),
(57, '43', 100.00, 11),
(58, '44', 100.00, 11),
(59, '42', 130.00, 0),
(60, '43', 140.00, 11),
(61, 'S', 190.00, 0),
(62, 'M', 220.00, 10),
(63, 'S', 130.00, 0),
(64, 'M', 130.00, 0),
(65, 'L', 130.00, 11),
(66, 'S', 130.00, 0),
(67, 'M', 130.00, 11),
(68, 'S', 120.00, 0),
(69, 'M', 120.00, 11),
(70, 'L', 120.00, 11),
(71, '42', 430.00, 0),
(72, '44', 450.00, 11),
(73, 'S', 60.00, 11),
(74, 'M', 60.00, 11),
(75, 'S', 80.00, 0),
(76, 'M', 80.00, 10),
(77, 'L', 80.00, 11),
(78, 'S', 155.00, 0),
(79, 'M', 155.00, 11),
(80, 'L', 155.00, 11),
(81, 'S', 155.00, 0),
(82, 'S', 140.00, 0),
(83, 'M', 140.00, 11),
(84, 'S', 160.00, 0),
(85, 'M', 160.00, 11),
(86, 'S', 175.00, 0),
(87, 'M', 175.00, 11),
(88, 'L', 175.00, 11),
(89, 'S', 225.00, 0),
(90, 'M', 225.00, 11),
(91, 'L', 225.00, 11),
(92, '42', 120.00, 0),
(93, '43', 120.00, 11),
(94, '44', 120.00, 11),
(95, '41', 150.00, 0),
(96, '41.5', 150.00, 11),
(97, '42', 160.00, 11),
(98, '43', 170.00, 11),
(99, '43.5', 170.00, 11),
(100, '42', 190.00, 0),
(101, '43', 190.00, 11),
(102, '41', 90.00, 0),
(103, '42', 100.00, 11),
(104, '42', 100.00, 11),
(105, '41', 450.00, 0),
(106, '42', 450.00, 10),
(107, '41', 340.00, 0),
(108, '42', 350.00, 11),
(109, 'S', 1212.00, 0),
(110, '43', 887.00, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rol` enum('admin','cliente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `usuario`
--

INSERT INTO `usuario` (`ID`, `nombre`, `contrasena`, `mail`, `direccion`, `telefono`, `rol`) VALUES
(9, 'Ismael', '$2y$10$Kr4Uk1X/7fzYRUimgX5fT.hXJ5L61dhDCuG3K3RsC/lugVVBS20eq', 'ismaelarchi@gmail.com', 'Santillana 2', '664716627', 'admin'),
(12, 'Ismael', '$2y$10$272WBh9RyEwBFGIxJvPmmewZzoSrcLTjkezNFzD2MgBPlatwJSg1u', 'iferarc3011@g.educaand.es', 'XXX', '666666666', 'cliente'),
(16, 'Ismael', '$2y$10$Csio/DBKPQ0wTs3/EIQ/xefW/whK1G2eC5gNA/SPDQh6KGnoXP1/y', 'infosapestore@gmail.com', 'Santillana 2', '666666662', 'cliente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `categoria_marca`
--
ALTER TABLE `categoria_marca`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indici per le tabelle `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_talla_id` (`producto_talla_id`);

--
-- Indici per le tabelle `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indici per le tabelle `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `fk_categoria_marca` (`categoria_marca_id`);

--
-- Indici per le tabelle `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indici per le tabelle `producto_talla`
--
ALTER TABLE `producto_talla`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `talla_id` (`talla_id`);

--
-- Indici per le tabelle `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `categoria_marca`
--
ALTER TABLE `categoria_marca`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `marca`
--
ALTER TABLE `marca`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `producto`
--
ALTER TABLE `producto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT per la tabella `producto_imagen`
--
ALTER TABLE `producto_imagen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT per la tabella `producto_talla`
--
ALTER TABLE `producto_talla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT per la tabella `talla`
--
ALTER TABLE `talla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT per la tabella `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `categoria_marca`
--
ALTER TABLE `categoria_marca`
  ADD CONSTRAINT `categoria_marca_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`producto_talla_id`) REFERENCES `producto_talla` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`ID`);

--
-- Limiti per la tabella `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_categoria_marca` FOREIGN KEY (`categoria_marca_id`) REFERENCES `categoria_marca` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`ID`) ON DELETE SET NULL;

--
-- Limiti per la tabella `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD CONSTRAINT `producto_imagen_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `producto_talla`
--
ALTER TABLE `producto_talla`
  ADD CONSTRAINT `producto_talla_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_talla_ibfk_2` FOREIGN KEY (`talla_id`) REFERENCES `talla` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;