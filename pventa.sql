-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2016 a las 18:24:19
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pventa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajero`
--

CREATE TABLE IF NOT EXISTS `cajero` (
  `usu` varchar(255) NOT NULL,
  `deposito` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajero`
--

INSERT INTO `cajero` (`usu`, `deposito`) VALUES
('1128059636', '1'),
('111111', '1'),
('11223344', '1'),
('6868990', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `doc` varchar(255) NOT NULL,
  `cupo` varchar(255) NOT NULL,
  `puntos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`doc`, `cupo`, `puntos`) VALUES
('6868990', '0', ''),
('123456', '0', ''),
('1234567', '0', ''),
('12345678', '0', ''),
('68689900', '', ''),
('2020200', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE IF NOT EXISTS `contenido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposito` varchar(255) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `cant` varchar(255) NOT NULL,
  `minima` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`id`, `deposito`, `producto`, `cant`, `minima`) VALUES
(1, '1', '10', '83', '14'),
(2, '2', '10', '100', '7'),
(3, '1', '3', '97', '10'),
(5, '1', '123', '14', '5'),
(6, '2', '123', '500', '5'),
(7, '1', '111', '5', '1'),
(8, '2', '111', '10', '1'),
(9, '1', '11', '-22', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposito`
--

CREATE TABLE IF NOT EXISTS `deposito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dir` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `encargado` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `deposito`
--

INSERT INTO `deposito` (`id`, `nombre`, `dir`, `tel`, `encargado`, `estado`) VALUES
(1, 'Deposito Numero 1', 'Caracoles ', '5685748', 'MIGUEL', 's'),
(2, 'Deposito Numero 2', 'Centro', '224567', 'CASTRO', 'n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(255) NOT NULL,
  `empresa` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `web` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `moneda` varchar(22) COLLATE utf8_spanish_ci NOT NULL,
  `anno` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `empresa`, `nit`, `direccion`, `pais`, `ciudad`, `tel`, `fax`, `web`, `correo`, `fecha`, `moneda`, `anno`) VALUES
(1, 'big pollos', '6868990012', 'Av. Juan Pablo II Nro.3292', 'Bolivia', 'La Paz', '79689249', '79689279', 'Parabait.com', 'gustof123@gmail.com', '2015-09-09', 'Bs', '2014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factura` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(255) NOT NULL,
  `usu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `factura`, `valor`, `fecha`, `estado`, `usu`) VALUES
(12, '100000001', '4032000', '2014-02-10', 's', '1128059636'),
(13, '100000002', '2016000', '2014-02-10', 's', '1128059636'),
(14, '100000003', '4032000', '2014-02-10', 's', '1128059636'),
(15, '100000004', '2016000', '2014-02-10', 's', '1128059636'),
(16, '100000005', '1792000', '2014-02-10', 's', '1128059636'),
(17, '100000006', '100', '2015-08-06', 's', '1128059636'),
(18, '100000007', '600', '2015-08-06', 's', '6868990'),
(19, '100000008', '300', '2015-08-06', 's', '6868990'),
(20, '100000009', '200', '2015-08-06', 's', '6868990'),
(21, '100000010', '100', '2015-08-06', 's', '6868990'),
(22, '100000011', '100', '2015-08-07', 's', '6868990'),
(23, '100000012', '560000', '2015-08-11', 's', '6868990'),
(24, '100000013', '400', '2015-08-30', 's', '6868990'),
(25, '100000014', '400', '2015-09-01', 's', '6868990'),
(26, '100000015', '500', '2015-09-05', 's', '6868990'),
(27, '100000016', '66.5', '2015-09-05', 's', '6868990'),
(28, '100000017', '20', '2015-09-08', 's', '6868990'),
(29, '100000018', '70', '2015-09-09', 's', '6868990'),
(30, '100000019', '40', '2015-09-26', 's', '6868990'),
(31, '100000020', '40', '2015-09-26', 's', '6868990'),
(32, '100000021', '9', '2015-09-26', 's', '6868990'),
(33, '100000022', '10', '2015-09-26', 's', '6868990'),
(34, '100000023', '18', '2015-09-26', 's', '6868990'),
(35, '100000024', '9', '2015-09-26', 's', '6868990'),
(36, '100000025', '7', '2015-09-26', 's', '6868990'),
(37, '100000026', '7', '2015-09-26', 's', '6868990'),
(38, '100000027', '14', '2015-09-26', 's', '6868990'),
(39, '100000028', '7', '2015-09-26', 's', '6868990'),
(40, '100000029', '49', '2015-09-26', 's', '6868990'),
(41, '100000030', '7', '2015-09-26', 's', '6868990'),
(42, '100000031', '56', '2015-09-26', 's', '6868990'),
(43, '100000032', '7', '2015-09-26', 's', '6868990'),
(44, '100000033', '7', '2015-09-26', 's', '6868990'),
(45, '100000034', '10', '2015-09-26', 's', '6868990'),
(46, '100000035', '10.5', '2015-09-28', 's', '6868990'),
(47, '100000036', '10.5', '2015-09-28', 's', '6868990'),
(48, '100000037', '10.5', '2015-09-28', 's', '6868990'),
(49, '100000038', '10.5', '2015-09-28', 's', '6868990'),
(50, '100000039', '10.5', '2015-09-28', 's', '6868990'),
(51, '100000040', '10.5', '2015-09-28', 's', '6868990'),
(52, '100000041', '7', '2015-09-28', 's', '6868990');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE IF NOT EXISTS `iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id`, `nombre`, `valor`, `estado`) VALUES
(1, 'IVA 13%', '13', 's'),
(2, 'IVA 13%', '13', 's'),
(3, 'SIN IVA', '0', 's'),
(4, 'IT 3%', '3', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `ape` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `fecha` date NOT NULL,
  `tel` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `cel` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `nota` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `fechar` date NOT NULL,
  `estado` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `doc`, `nom`, `ape`, `fecha`, `tel`, `cel`, `sexo`, `dir`, `nota`, `fechar`, `estado`) VALUES
(13, '11223344', 'MARIA', 'GUTIERRES', '2014-02-10', '66736677', '30 30 40 55 65', 'f', 'LA ESPERANZA', 'NINGUNA', '2014-02-10', 's'),
(14, '6868990', 'Gustavo', 'Cancari', '2015-03-21', '', '79689249', 'm', 'c/luciano caballero', 'Desarrollador', '2015-08-06', 's'),
(15, '6868990', 'adolfo', 'paredes', '2001-02-13', '70525975', '70525975', 'm', 'cualquiera', '', '2015-08-06', 's'),
(16, '123456', 'juan', 'jose', '2015-08-12', '12345', '12345', 'm', 'gfhj', '', '2015-08-06', 's'),
(17, '1234567', 'sdsd', 'sdsfd', '0000-00-00', '79689249', '29689249', 'm', 'c/luciano', '', '2015-09-26', 's'),
(18, '12345678', 'sdsd', 'sdsfd', '0000-00-00', '79689249', '29689249', 'm', 'c/luciano', '', '2015-09-26', 's'),
(19, '68689900', 'adolfo', 'lima', '0000-00-00', 'm', 'alto lima', 'debe 100', 's', '68689900', '0000-00-00', ''),
(20, '2020200', 'miguel', 'angel', '0000-00-00', 'm', 'luciano', '', 's', '2020200', '0000-00-00', ''),
(21, '20202000', 'miguelp', 'angelp', '0000-00-00', '', '12347890', 'm', 'lucianoo', '', '0000-00-00', 's'),
(22, '20202000', 'miguelp', 'angelp', '0000-00-00', '', '12347890', 'm', 'lucianoo', '', '0000-00-00', 's'),
(23, '202020000', 'miguelpp', 'angelpp', '0000-00-00', '', '12347890', 'm', 'lucianoo', '', '0000-00-00', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `depart` varchar(255) NOT NULL,
  `unidad` varchar(255) NOT NULL,
  `defecto` varchar(255) NOT NULL,
  `ivacompra` varchar(255) NOT NULL,
  `ivaventa` varchar(255) NOT NULL,
  `costo_prov` varchar(255) NOT NULL,
  `ocosto_prov` varchar(255) NOT NULL,
  `a_venta` varchar(250) NOT NULL,
  `b_venta` varchar(255) NOT NULL,
  `c_venta` varchar(255) NOT NULL,
  `d_venta` varchar(255) NOT NULL,
  `a_costo` varchar(255) NOT NULL,
  `b_costo` varchar(255) NOT NULL,
  `c_costo` varchar(255) NOT NULL,
  `d_costo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `depart`, `unidad`, `defecto`, `ivacompra`, `ivaventa`, `costo_prov`, `ocosto_prov`, `a_venta`, `b_venta`, `c_venta`, `d_venta`, `a_costo`, `b_costo`, `c_costo`, `d_costo`) VALUES
('10', 'POLLO', '2', '2', 'A', '3', '3', '34650', '0', '10.5', '000', '000', '000', '10.2', '000', '000', '000'),
('3', 'IMPRESORA LASER', '1', '3', 'A', '1', '1', '400000', '10000', '99999', '600000', '700000', '800000', '400000', '400000', '400000', '400000'),
('123', 'ALAS', '2', '2', 'A', '3', '3', '3000', '0', '7', '8', '6', '0', '5', '5', '5', '0'),
('111', 'IMPRESORA LASER', '1', '3', 'A', '1', '1', '800000', '20000', '99999', '990000', '1000000', '950000', '800000', '800000', '800000', '800000'),
('11', 'pollojkhnj', '2', '3', 'A', '3', '3', '0', '10', '100', '0', '0', '0', '50', '0', '0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dir` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `nota` varchar(255) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `dir`, `tel`, `fax`, `nota`, `contacto`) VALUES
(1, 'COMPUTOWORKING', 'CENTRO COMERCIAL', '6679159', '3885999', 'COMPUTADORES SISTEMAS', 'GUILLERMO MARTINEZ'),
(2, 'SISTEMAS COMPUTADORES', 'CENTRO UNO', '6674656', '6647635', 'SISTEMAS', 'GUILLERMO MARTIENZ'),
(3, 'CASA DEL COMPUTO', 'CENTRO', '45454545', '67676767', 'PROVEEDOR BUENO', 'JORGE VASQUEZ'),
(4, 'COMPUTADORES Y MAS', 'CENTRO COMERCIAL 123', '6674667', '757575-500505', 'PROVEEDOR SOLO DE IMPRESORAS', 'JAIME LOZANO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_prov`
--

CREATE TABLE IF NOT EXISTS `pro_prov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(255) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `pro_prov`
--

INSERT INTO `pro_prov` (`id`, `producto`, `proveedor`) VALUES
(1, '10', '1'),
(2, '3', '1'),
(3, '123', '2'),
(4, '123', '3'),
(5, '111', '3'),
(6, '111', '4'),
(7, '123', '1'),
(8, '11', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE IF NOT EXISTS `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `nombre`, `estado`) VALUES
(1, 'BOLSA', 's'),
(2, 'KILOS', 's'),
(3, 'UNIDAD', 's'),
(4, 'CAJAS', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `username`
--

CREATE TABLE IF NOT EXISTS `username` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usu` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `con` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `username`
--

INSERT INTO `username` (`id`, `usu`, `con`, `correo`, `fecha`, `tipo`) VALUES
(13, '11223344', '11223344', 'MARIA_G@GMAIL.COM', '2014-02-10', 'c'),
(14, '6868990', '6868990', 'gustof123@gmail.com', '2015-03-21', 'a'),
(15, '6868990', '6868990', 'fg@jgvb.co', '2001-02-13', 'cliente'),
(16, '123456', '123456', 'fg@fgh.jh', '2015-08-12', 'cliente'),
(17, '1234567', '1234567', '', '0000-00-00', 'cliente'),
(18, '12345678', '12345678', '', '0000-00-00', 'cliente'),
(19, '68689900', '', '', '0000-00-00', 'cliente'),
(20, '2020200', '', '', '0000-00-00', 'cliente'),
(21, '20202000', '20202000', '', '0000-00-00', 'cliente'),
(22, '20202000', '20202000', '', '0000-00-00', 'cliente'),
(23, '202020000', '202020000', '', '0000-00-00', 'cliente');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
