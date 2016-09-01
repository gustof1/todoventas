-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-02-2014 a las 15:50:21
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `1nueva_demo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_tmp`
--

CREATE TABLE IF NOT EXISTS `caja_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `cant` varchar(255) NOT NULL,
  `usu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

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
('11223344', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `doc` varchar(255) NOT NULL,
  `cupo` varchar(255) NOT NULL,
  `puntos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`id`, `deposito`, `producto`, `cant`, `minima`) VALUES
(1, '1', '10', '93', '14'),
(2, '2', '10', '100', '7'),
(3, '1', '3', '98', '10'),
(5, '1', '123', '4', '5'),
(6, '2', '123', '5', '5'),
(7, '1', '111', '5', '1'),
(8, '2', '111', '10', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `estado`) VALUES
(1, 'SISTEMA', 's'),
(2, 'ALIMENTOS', 's'),
(3, 'JUGUETERIA', 's');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `deposito`
--

INSERT INTO `deposito` (`id`, `nombre`, `dir`, `tel`, `encargado`, `estado`) VALUES
(1, 'Deposito Numero 1', 'Caracoles ', '5685748', 'MIGUEL', 's'),
(2, 'Deposito Numero 2', 'Centro', '224567', 'CASTRO', 's');

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
(1, 'Tienda Gigante de Cartagena', '12222', 'Centro Edificio Comodoro Oficina 404', 'Colombia', 'Cartagena', '6686532', '6736478', 'www.softunicorn.net', 'jlvasquez63@gmail.com', '2014-02-06', '$', '2014');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `factura`, `valor`, `fecha`, `estado`, `usu`) VALUES
(12, '100000001', '4032000', '2014-02-10', 's', '1128059636'),
(13, '100000002', '2016000', '2014-02-10', 's', '1128059636'),
(14, '100000003', '4032000', '2014-02-10', 's', '1128059636'),
(15, '100000004', '2016000', '2014-02-10', 's', '1128059636'),
(16, '100000005', '1792000', '2014-02-10', 's', '1128059636');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id`, `nombre`, `valor`, `estado`) VALUES
(1, 'IVA 12%', '12', 's'),
(2, 'IVA 22%', '22', 's'),
(3, 'SIN IVA', '0', 's');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `doc`, `nom`, `ape`, `fecha`, `tel`, `cel`, `sexo`, `dir`, `nota`, `fechar`, `estado`) VALUES
(3, '1128059636', 'SoftUnicorn', 'Jorge', '1988-04-05', '6679159 - 73673', '3156856245', 'm', 'Barrio los Caracoles', 'NINGUNA', '2014-01-07', 's'),
(13, '11223344', 'MARIA', 'GUTIERRES', '2014-02-10', '66736677', '30 30 40 55 65', 'f', 'LA ESPERANZA', 'NINGUNA', '2014-02-10', 's');

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
  `a_venta` varchar(255) NOT NULL,
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
('10', 'COMPUTADOR DE MESA', '1', '3', 'A', '3', '1', '320000', '42000', '400000', '500000', '600000', '700000', '310000', '320000', '330000', '340000'),
('3', 'IMPRESORA LASER', '1', '3', 'A', '1', '1', '400000', '10000', '500000', '600000', '700000', '800000', '400000', '400000', '400000', '400000'),
('123', 'PORTÁTIL DEL NEGRO', '1', '3', 'A', '1', '1', '800000', '20000', '900000', '990000', '1000000', '950000', '800000', '800000', '800000', '800000'),
('111', 'IMPRESORA LASER', '1', '3', 'A', '1', '1', '800000', '20000', '900000', '990000', '1000000', '950000', '800000', '800000', '800000', '800000');

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
(4, 'COMPUTADORES Y MAS', 'CENTRO COMERCIAL CARTAGENA', '6674667', '757575-500505', 'PROVEEDOR SOLO DE IMPRESORAS', 'JAIME LOZANO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_prov`
--

CREATE TABLE IF NOT EXISTS `pro_prov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(255) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
(7, '123', '1');

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
(2, 'BOTELLA', 's'),
(3, 'UNIDAD', 's'),
(4, 'DOCENA', 's');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `username`
--

INSERT INTO `username` (`id`, `usu`, `con`, `correo`, `fecha`, `tipo`) VALUES
(3, '1128059636', 'demo', 'JLVASQUEZ63@GMAIL.COM', '1988-04-05', 'a'),
(13, '11223344', '11223344', 'MARIA_G@GMAIL.COM', '2014-02-10', 'c');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
