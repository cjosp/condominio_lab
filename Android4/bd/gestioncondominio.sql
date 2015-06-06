-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2014 a las 19:29:11
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gestioncondominio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbols`
--

CREATE TABLE IF NOT EXISTS `arbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `text` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vinculo` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `codigocondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrebanco` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `rifbanco` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusbanco` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `codigocargo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecargo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuscargo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `codigoestado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombreestado` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusestado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `codigomunicipio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombremunicipio` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `estatusmunicipio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idestadomunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `fk_municipios_estados1_idx` (`idestadomunicipio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=7 ;



--
-- Estructura de tabla para la tabla `ciudads`
--

CREATE TABLE IF NOT EXISTS `ciudads` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `codigociudad` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombreciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusciudad` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idmunicipiociudad` int(11) NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudades_municipios1_idx` (`idmunicipiociudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantedepagos`
--

CREATE TABLE IF NOT EXISTS `comprobantedepagos` (
  `idcomprobantedepago` int(11) NOT NULL AUTO_INCREMENT,
  `codigocomprobantedepago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcioncomprobantedepago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacomprobantedepago` date NOT NULL,
  `montototalcomprobante` float NOT NULL,
  `nombrearchivocomprobantedepago` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatoarchivocomprobantedepago` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivocomprobantedepago` blob,
  `estatuscomprobantedepago` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idproveedorxcondominiocomprobantedepago` int(11) NOT NULL,
  PRIMARY KEY (`idcomprobantedepago`),
  KEY `fk_comprobantedepago_proveedorxcondominios1_idx` (`idproveedorxcondominiocomprobantedepago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condominios`
--

CREATE TABLE IF NOT EXISTS `condominios` (
  `idcondominio` int(11) NOT NULL,
  `rifcondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `direccioncondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `nombredocumentocondominio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatodocumentocondominio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `documentocondominio` blob,
  `interesmoracondominio` float NOT NULL,
  `tiempomoracondominio` int(11) NOT NULL,
  `nombrefotocondominio` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotocondominio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotocondominio` blob,
  `estatuscondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idciudadcondominio` int(11) NOT NULL,
  `idtipocondominiocondominio` int(11) NOT NULL,
  PRIMARY KEY (`idcondominio`),
  KEY `fk_condominios_ciudads1_idx` (`idciudadcondominio`),
  KEY `fk_condominios_tipocondominios1_idx` (`idtipocondominiocondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areacomuns`
--

CREATE TABLE IF NOT EXISTS `areacomuns` (
  `idareacomun` int(11) NOT NULL AUTO_INCREMENT,
  `codigoareacomun` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionareacomun` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusareacomun` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `capacidadareacomun` int(11) NOT NULL,
  `idcondominioareacomun` int(11) NOT NULL,
  `nombreareacomun` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idareacomun`),
  KEY `fk_areacomuns_condominios1_idx` (`idcondominioareacomun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlvisitas`
--

CREATE TABLE IF NOT EXISTS `controlvisitas` (
  `idcontrolvisita` int(11) NOT NULL AUTO_INCREMENT,
  `codigocontrolvisita` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechavisita` date NOT NULL,
  `horavisita` time NOT NULL,
  `idvisitantecontrolvisita` int(11) NOT NULL,
  `idempleadocontrolvisita` int(11) NOT NULL,
  `idinmueblecontrolvisita` int(11) NOT NULL,
  `estatuscontrolvisita` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcontrolvisita`),
  KEY `fk_controlvisitas_visitantes1_idx` (`idvisitantecontrolvisita`),
  KEY `fk_controlvisitas_empleados1_idx` (`idempleadocontrolvisita`),
  KEY `fk_controlvisitas_inmuebles1_idx` (`idinmueblecontrolvisita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copropietarios`
--

CREATE TABLE IF NOT EXISTS `copropietarios` (
  `idcopropietario` int(11) NOT NULL AUTO_INCREMENT,
  `cedulacopropietario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombrecopropietario` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidocopropietario` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `correocopropietario` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefonocopropietario` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacreacioncopropietario` date NOT NULL,
  `estatuscopropietario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `direccioncopropietario` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechanacimientocopropietario` date NOT NULL,
  `nombrefotocopropietario` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotocopropietario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotocopropietario` blob,
  `twittercopropietario` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idciudadcopropietario` int(11) NOT NULL,
  PRIMARY KEY (`idcopropietario`),
  KEY `fk_copropietarios_ciudads1_idx` (`idciudadcopropietario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacions`
--

CREATE TABLE IF NOT EXISTS `cotizacions` (
  `idcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigocotizacion` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcioncotizacion` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechacotizacioncotizacion` date NOT NULL,
  `fechavencimientocotizacioncotizacion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `aprobacioncotizacion` tinyint(1) NOT NULL,
  `montocotizacion` float NOT NULL,
  `estatuscotizacion` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idproveedorxcondominiocotizacion` int(11) NOT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `fk_cotizacions_proveedorxcondominios1_idx` (`idproveedorxcondominiocotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE IF NOT EXISTS `cuentas` (
  `numerocuenta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `idbancocuenta` int(11) NOT NULL,
  `idcondominiocuenta` int(11) NOT NULL,
  `cedulatitularcuenta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombretitularcuenta` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `tipocuenta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `saldodisponible` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionbanco` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`numerocuenta`,`idbancocuenta`,`idcondominiocuenta`),
  KEY `fk_cuentas_bancos1_idx` (`idbancocuenta`),
  KEY `fk_cuentas_condominios1_idx` (`idcondominiocuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE IF NOT EXISTS `detalles` (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idcomprobantedepagodetalle` int(11) DEFAULT NULL,
  `idcotizaciondetalle` int(11) DEFAULT NULL,
  `descripciondetalle` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `montodetalle` float NOT NULL,
  `idtipoegresodetalle` int(11) NOT NULL,
  `idproveedorxserviciodetalle` int(11) NOT NULL,
  `idformapagodetalle` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_comprobantedepagos1_idx` (`idcomprobantedepagodetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_cotizacions1_idx` (`idcotizaciondetalle`),
  KEY `fk_detallecomprobantecotizacionservicio_tipoegresos1_idx` (`idtipoegresodetalle`),
  KEY `fk_detalledecomprobante_proveedorxservicios1_idx` (`idproveedorxserviciodetalle`),
  KEY `fk_detalles_formapagos1_idx` (`idformapagodetalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresonocomunxinmuebles`
--

CREATE TABLE IF NOT EXISTS `egresonocomunxinmuebles` (
  `idegresonocomunxinmueble` int(11) NOT NULL AUTO_INCREMENT,
  `idegresosnocomun` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `estatusegresonocomunxinmueble` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idegresonocomunxinmueble`),
  KEY `fk_egresonocomunxinmuebles_egresosnocomuns1_idx` (`idegresosnocomun`),
  KEY `fk_egresonocomunxinmuebles_inmuebles1_idx` (`idinmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE IF NOT EXISTS `egresos` (
  `idegreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigoegreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionegreso` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `fechaegreso` date NOT NULL,
  `montoegreso` float NOT NULL,
  `estatusegreso` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `iddetalles` int(11) NOT NULL,
  `idcondominio` int(11) NOT NULL,
  `idformapagopago` int(11) NOT NULL,
  PRIMARY KEY (`idegreso`),
  KEY `fk_egresos_detalles1_idx` (`iddetalles`),
  KEY `fk_egresos_condominios1_idx` (`idcondominio`),
  KEY `fk_egresos_formapagos1_idx` (`idformapagopago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresosnocomuns`
--

CREATE TABLE IF NOT EXISTS `egresosnocomuns` (
  `idegresosnocomun` int(11) NOT NULL AUTO_INCREMENT,
  `codigonocomun` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionnocomun` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `montonocomuns` float NOT NULL,
  `fechanocomun` date NOT NULL,
  `estatusegresonocomun` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `iddetalle` int(11) NOT NULL,
  `idcondominio` int(11) NOT NULL,
  `egresosnocomunscol` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idegresosnocomun`),
  KEY `fk_egresosnocomuns_detalles1_idx` (`iddetalle`),
  KEY `fk_egresosnocomuns_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresoxrecibo`
--

CREATE TABLE IF NOT EXISTS `egresoxrecibo` (
  `idegresoxrecibo` int(11) NOT NULL AUTO_INCREMENT,
  `montoegresoxrecibo` float NOT NULL,
  `estatusegresoxrecibo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idrecibocobro` int(11) NOT NULL,
  `idegreso` int(11) DEFAULT NULL,
  `idegresonocomunxinmueble` int(11) NOT NULL,
  PRIMARY KEY (`idegresoxrecibo`),
  KEY `fk_egresoxrecibocobroxinmuebles_egresos1_idx` (`idegreso`),
  KEY `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1_idx` (`idrecibocobro`),
  KEY `fk_egresoxrecibo_egresonocomunxinmuebles1_idx` (`idegresonocomunxinmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaempledo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombreempledo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidoempledo` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `direccionempledo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoempledo` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `correoempledo` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechanacimientoempleado` date DEFAULT NULL,
  `nombrefotoempleado` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotoempleado` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotoempleado` blob,
  `sueldobase` float NOT NULL,
  `estatusempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idloginempleado` int(11) NOT NULL,
  `idcondominioempleado` int(11) NOT NULL,
  `idcargoempleado` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_logins1_idx` (`idloginempleado`),
  KEY `fk_empleados_condominios1_idx` (`idcondominioempleado`),
  KEY `fk_empleados_cargo1_idx` (`idcargoempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondoreservas`
--

CREATE TABLE IF NOT EXISTS `fondoreservas` (
  `idfondoreserva` int(11) NOT NULL AUTO_INCREMENT,
  `codigofondoreserva` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrefondoreserva` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `objetivofondoreserva` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `cuentas` float NOT NULL,
  `montofijfondoreserva` float NOT NULL,
  `saldoactual` float NOT NULL,
  `estatusfondoreserva` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idcondominiofondoreserva` int(11) NOT NULL,
  PRIMARY KEY (`idfondoreserva`),
  KEY `fk_fondoreservas_condominios1_idx` (`idcondominiofondoreserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapagos`
--

CREATE TABLE IF NOT EXISTS `formapagos` (
  `idformapagopago` int(11) NOT NULL AUTO_INCREMENT,
  `codigoformapago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionforma` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusformadepago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idformapagopago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencianotificaciones`
--

CREATE TABLE IF NOT EXISTS `frecuencianotificaciones` (
  `idfrecuencianotificaciones` int(11) NOT NULL,
  `codigofrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombrefrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusfrecuencianotificaciones` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idfrecuencianotificaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioareas`
--

CREATE TABLE IF NOT EXISTS `horarioareas` (
  `idhorarioarea` int(11) NOT NULL AUTO_INCREMENT,
  `codigohorario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `diahorario` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  `estatushorario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idareacomun` int(11) NOT NULL,
  PRIMARY KEY (`idhorarioarea`),
  KEY `fk_horariopordiadeareas_areacomuns1_idx` (`idareacomun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariopordiadeempleados`
--

CREATE TABLE IF NOT EXISTS `horariopordiadeempleados` (
  `idhorariopordiadeempleado` int(11) NOT NULL AUTO_INCREMENT,
  `codigohorariopordiadeempleado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `diahorariopordiadeempleado` date NOT NULL,
  `horainiciohorariopordiadeempleado` time NOT NULL,
  `horafinhorariopordiadeempleado` time NOT NULL,
  `estatushorariopordiadeempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idempleadohorariopordiadeempleado` int(11) NOT NULL,
  PRIMARY KEY (`idhorariopordiadeempleado`),
  KEY `fk_horariopordiadeempleados_empleados1_idx` (`idempleadohorariopordiadeempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores`
--

CREATE TABLE IF NOT EXISTS `indicadores` (
  `idindicadores` int(11) NOT NULL AUTO_INCREMENT,
  `codigoindicadores` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreindicadores` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusindicadores` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idindicadores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE IF NOT EXISTS `ingresos` (
  `idingresos` int(11) NOT NULL,
  `codigoingreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechaingreso` float NOT NULL,
  `montoingreso` float NOT NULL,
  `estatusingreso` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idpagoingreso` int(11) NOT NULL,
  `descripcioningreso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idingresos`),
  KEY `fk_ingresos_pagos1_idx` (`idpagoingreso`),
  KEY `fk_ingresos_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE IF NOT EXISTS `inmuebles` (
  `idinmueble` int(11) NOT NULL AUTO_INCREMENT,
  `codigoinmueble` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `metroscuadradosinmueble` float NOT NULL,
  `alicuotainmueble` float NOT NULL,
  `descripcioninmueble` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `estatusinmueble` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `codigocatastralinmueble` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `idcopropietarioinmueble` int(11) NOT NULL,
  `idlogininmueble` int(11) NOT NULL,
  `idcondominioinmueble` int(11) NOT NULL,
  PRIMARY KEY (`idinmueble`),
  KEY `fk_inmuebles_copropietarios1_idx` (`idcopropietarioinmueble`),
  KEY `fk_inmuebles_logins1_idx` (`idlogininmueble`),
  KEY `fk_inmuebles_condominios1_idx` (`idcondominioinmueble`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juntacondominios`
--

CREATE TABLE IF NOT EXISTS `juntacondominios` (
  `idjuntacondominio` int(11) NOT NULL AUTO_INCREMENT,
  `codigojuntacondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechainicio` date NOT NULL,
  `fechaculminacion` date NOT NULL,
  `estatusvigenciacargo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusjuntacondominio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idloginjuntacondominio` int(11) NOT NULL,
  `idcargojuntacondominio` int(11) NOT NULL,
  `idcondominiocondominio` int(11) NOT NULL,
  `idcopropietario` int(11) NOT NULL,
  PRIMARY KEY (`idjuntacondominio`),
  KEY `fk_juntacondominios_logins1_idx` (`idloginjuntacondominio`),
  KEY `fk_juntacondominios_cargo1_idx` (`idcargojuntacondominio`),
  KEY `fk_juntacondominios_condominios1_idx` (`idcondominiocondominio`),
  KEY `fk_juntacondominios_copropietarios1_idx` (`idcopropietario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `usuariologin` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `paswordlogin` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecharegistrologin` date NOT NULL,
  `estatuslogin` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idrollogin` int(11) NOT NULL,
  PRIMARY KEY (`idlogin`),
  KEY `fk_logins_rols1_idx` (`idrollogin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE IF NOT EXISTS `movimientos` (
  `idmovimientos` int(11) NOT NULL AUTO_INCREMENT,
  `codigomovimiento` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `montomovimiento` float NOT NULL,
  `cuentas_numerocuenta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `cuentas_idbancocuenta` int(11) NOT NULL,
  `idcondominiocuentamovimiento` int(11) NOT NULL,
  PRIMARY KEY (`idmovimientos`),
  KEY `fk_movimientos_cuentas1_idx` (`cuentas_numerocuenta`,`cuentas_idbancocuenta`,`idcondominiocuentamovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE IF NOT EXISTS `multas` (
  `idmulta` int(11) NOT NULL AUTO_INCREMENT,
  `codigomulta` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionmullta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `montomulta` float NOT NULL,
  `fechamulta` date NOT NULL,
  `idtipomultamulta` int(11) NOT NULL,
  `idinmueblemulta` int(11) NOT NULL,
  `idrecibocobro` int(11) NOT NULL,
  PRIMARY KEY (`idmulta`),
  KEY `fk_multas_tipomultas1_idx` (`idtipomultamulta`),
  KEY `fk_multas_inmuebles1_idx` (`idinmueblemulta`),
  KEY `fk_multas_recibocobros1_idx` (`idrecibocobro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominaempleados`
--

CREATE TABLE IF NOT EXISTS `nominaempleados` (
  `idempleado` int(11) NOT NULL,
  `idnomina` int(11) NOT NULL,
  `fechanominaempleado` date NOT NULL,
  `sueldoneto` float NOT NULL,
  `asignacionesnominaempleado` float NOT NULL,
  `deduccionesnominaempleado` float NOT NULL,
  `sueldototal` float NOT NULL,
  `estatusnominaempleado` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idempleado`,`idnomina`),
  KEY `fk_nominaempleados_empleados1_idx` (`idempleado`),
  KEY `fk_nominaempleados_nominas1_idx` (`idnomina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

CREATE TABLE IF NOT EXISTS `nominas` (
  `idnomina` int(11) NOT NULL,
  `codigonominanomina` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechanomina` date NOT NULL,
  `sueldosbasestotalesnomina` float NOT NULL,
  `asignacionestotalesnomina` float NOT NULL,
  `deduccionestotalesnomina` float NOT NULL,
  `sueldostotalesnomina` float NOT NULL,
  `estatusnomina` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idegresonomina` int(11) NOT NULL,
  PRIMARY KEY (`idnomina`),
  KEY `fk_nominas_egresos1_idx` (`idegresonomina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE IF NOT EXISTS `noticias` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `codigonoticia` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechanoticia` date NOT NULL,
  `descripcionnoticia` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `nombrearchivonoticia` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatoarchivonoticia` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivonoticia` blob,
  `estatusnoticia` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idtiponoticiamaestronoticia` int(11) NOT NULL,
  `idloginnoticia` int(11) DEFAULT NULL,
  `cedulaautor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idnoticia`),
  KEY `fk_noticias_tiponoticiamaestros1_idx` (`idtiponoticiamaestronoticia`),
  KEY `fk_noticias_logins1_idx` (`idloginnoticia`),
  KEY `fk_noticias_rols1_idx` (`idrol`),
  KEY `fk_noticias_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE IF NOT EXISTS `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `codigopago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionpago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nrodocumento` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `montopago` float NOT NULL,
  `validacionpago` tinyint(1) NOT NULL,
  `fechapago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuspago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idformapagopago` int(11) NOT NULL,
  `idrazondepagopago` int(11) NOT NULL,
  `idreservacionpago` int(11) DEFAULT NULL,
  `idrecibocobropago` int(11) DEFAULT NULL,
  `idcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pagos_formapagos1_idx` (`idformapagopago`),
  KEY `fk_pagos_razondepagos1_idx` (`idrazondepagopago`),
  KEY `fk_pagos_reservacions1_idx` (`idreservacionpago`),
  KEY `fk_pagos_recibocobros1_idx` (`idrecibocobropago`),
  KEY `fk_pagos_condominios1_idx` (`idcondominio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `cedulapersona` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `primernombrepersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `segundonombrepersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `primerapellidopersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `segundoapellidopersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatuspersona` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE IF NOT EXISTS `proveedors` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `rifproveedor` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `razonsocialproveedor` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `correoproveedor` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoproveedor` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusproveesor` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `idciudadproveedor` int(11) NOT NULL,
  `nombreproveedor` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedors_ciudads1_idx` (`idciudadproveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorxcondominios`
--

CREATE TABLE IF NOT EXISTS `proveedorxcondominios` (
  `idproveedorxcondominio` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedorproveedorxcndominio` int(11) NOT NULL,
  `idcondominioproveedorxcondominio` int(11) NOT NULL,
  PRIMARY KEY (`idproveedorxcondominio`),
  KEY `fk_proveedorxcondominios_proveedors1_idx` (`idproveedorproveedorxcndominio`),
  KEY `fk_proveedorxcondominios_condominios1_idx` (`idcondominioproveedorxcondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorxservicios`
--

CREATE TABLE IF NOT EXISTS `proveedorxservicios` (
  `idproveedorxservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedorxcondominioproveedorxservicio` int(11) NOT NULL,
  `idservicioproveedorxservicio` int(11) NOT NULL,
  `estatusproveedorxservicio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `codigoproveedorxservicio` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproveedorxservicio`),
  KEY `fk_proveedorxservicios_proveedorxcondominios1_idx` (`idproveedorxcondominioproveedorxservicio`),
  KEY `fk_proveedorxservicios_servicios1_idx` (`idservicioproveedorxservicio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razondepagos`
--

CREATE TABLE IF NOT EXISTS `razondepagos` (
  `idrazondepago` int(11) NOT NULL AUTO_INCREMENT,
  `codigorazondepago` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrerazondepago` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrazondepago` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrazondepago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibocobros`
--

CREATE TABLE IF NOT EXISTS `recibocobros` (
  `idrecibocobro` int(11) NOT NULL AUTO_INCREMENT,
  `codigorecibocobro` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecharecibocobro` date NOT NULL,
  `cuotapendienterecibo` float NOT NULL,
  `fechavencimientorecibo` date NOT NULL,
  `abonorecibocobro` float NOT NULL,
  `montorecibocobro` float NOT NULL,
  `estatuscancelacionrecibo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrecibocobro` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idinmueblerecibocobro` int(11) NOT NULL,
  PRIMARY KEY (`idrecibocobro`),
  KEY `fk_recibocobros_inmuebles1_idx` (`idinmueblerecibocobro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reciboxfondoreserva`
--

CREATE TABLE IF NOT EXISTS `reciboxfondoreserva` (
  `idreciboxfondoreserva` int(11) NOT NULL AUTO_INCREMENT,
  `idrecibocobroreciboxfondoreserva` int(11) NOT NULL,
  `fondoreservas_idfondoreserva` int(11) NOT NULL,
  PRIMARY KEY (`idreciboxfondoreserva`),
  KEY `fk_recibocobros_has_fondoreservas_fondoreservas1_idx` (`fondoreservas_idfondoreserva`),
  KEY `fk_recibocobros_has_fondoreservas_recibocobros1_idx` (`idrecibocobroreciboxfondoreserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamosugerencias`
--

CREATE TABLE IF NOT EXISTS `reclamosugerencias` (
  `idreclamosugerencia` int(11) NOT NULL AUTO_INCREMENT,
  `codigoreclamosugerencia` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `razonreclamosugerencia` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fechareclamosugerencia` date NOT NULL,
  `descripcionreclamosugerencia` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `estatusreclamosugerencia` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `idinmueblereclamosugerencia` int(11) NOT NULL,
  `codigoinmuebledestinatario` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idreclamosugerencia`),
  KEY `fk_reclamosugerencias_inmuebles1_idx` (`idinmueblereclamosugerencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacions`
--

CREATE TABLE IF NOT EXISTS `reservacions` (
  `idreservacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigoreservacion` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fechareservacion` date NOT NULL,
  `nombrelistainvitadosreservacion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatolistainvitadosreservacion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `listainvitadosreservacion` blob,
  `estatusreservacion` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `montoapagar` float NOT NULL,
  `idareacomunreservacion` int(11) NOT NULL,
  `idinmueblereservacion` int(11) NOT NULL,
  `montoabonado` float DEFAULT NULL,
  PRIMARY KEY (`idreservacion`),
  KEY `fk_reservacions_areacomuns1_idx` (`idareacomunreservacion`),
  KEY `fk_reservacions_inmuebles1_idx` (`idinmueblereservacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE IF NOT EXISTS `rols` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `codigorol` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombrerol` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusrol` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `codigoservicio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `descripcionservicio` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estatusservicio` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superusuarios`
--

CREATE TABLE IF NOT EXISTS `superusuarios` (
  `idsuperusuario` int(11) NOT NULL AUTO_INCREMENT,
  `codigosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombresuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `apellidosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `telefonosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correosuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombrefotosuperusuario` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `formatofotosuperusuario` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fotosuperusuario` blob,
  `estatussuperusuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idloginsuperusuario` int(11) NOT NULL,
  PRIMARY KEY (`idsuperusuario`),
  KEY `fk_superusuarios_logins1_idx` (`idloginsuperusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocondominios`
--

CREATE TABLE IF NOT EXISTS `tipocondominios` (
  `idtipocondominio` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipocondominio` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombretipocondominio` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatustipocondominio` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipocondominio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoegresos`
--

CREATE TABLE IF NOT EXISTS `tipoegresos` (
  `idtipoegreso` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipoegreso` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombretipoegreso` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatustipoegreso` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipoegreso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomultas`
--

CREATE TABLE IF NOT EXISTS `tipomultas` (
  `idtipomulta` int(11) NOT NULL AUTO_INCREMENT,
  `codigotipomulta` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombremulta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatus` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipomulta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiponoticiamaestros`
--

CREATE TABLE IF NOT EXISTS `tiponoticiamaestros` (
  `idtiponoticiamaestro` int(11) NOT NULL AUTO_INCREMENT,
  `nombretiponoticiamaestro` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatustiponoticiamaestro` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idtiponoticiamaestro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `idunidades` int(11) NOT NULL AUTO_INCREMENT,
  `codigounidades` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreunidades` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `estatusunidades` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idunidades`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioporindicadores`
--

CREATE TABLE IF NOT EXISTS `usuarioporindicadores` (
  `idusuarioporindicadores` int(11) NOT NULL AUTO_INCREMENT,
  `codigousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `valordemetausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechametausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valoramarillousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valorrojousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `valorverdeusuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechaamarillousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fecharojousuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `fechaverdeusuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correoresponsablemetausuarioporindicadores` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idindicadoresusuarioporindicadores` int(11) NOT NULL,
  `idrolusuarioporindicadores` int(11) NOT NULL,
  `idcondominiousuarioporindicadores` int(11) NOT NULL,
  `idfrecuencianotificacionesusuarioporindicadores` int(11) NOT NULL,
  `idunidadesusuarioporindicadores` int(11) NOT NULL,
  PRIMARY KEY (`idusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_indicadores1_idx` (`idindicadoresusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_rols1_idx` (`idrolusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_condominios1_idx` (`idcondominiousuarioporindicadores`),
  KEY `fk_usuarioporindicadores_frecuencianotificaciones1_idx` (`idfrecuencianotificacionesusuarioporindicadores`),
  KEY `fk_usuarioporindicadores_unidades1_idx` (`idunidadesusuarioporindicadores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitantes`
--

CREATE TABLE IF NOT EXISTS `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `cedulavisitante` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `nombrevisitante` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellidovisitante` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estatusvisitante` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idvisitante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `areacomuns`
--
ALTER TABLE `areacomuns`
  ADD CONSTRAINT `fk_areacomuns_condominios1` FOREIGN KEY (`idcondominioareacomun`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ciudads`
--
ALTER TABLE `ciudads`
  ADD CONSTRAINT `fk_ciudades_municipios1` FOREIGN KEY (`idmunicipiociudad`) REFERENCES `municipios` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprobantedepagos`
--
ALTER TABLE `comprobantedepagos`
  ADD CONSTRAINT `fk_comprobantedepago_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominiocomprobantedepago`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `condominios`
--
ALTER TABLE `condominios`
  ADD CONSTRAINT `fk_condominios_ciudads1` FOREIGN KEY (`idciudadcondominio`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_condominios_tipocondominios1` FOREIGN KEY (`idtipocondominiocondominio`) REFERENCES `tipocondominios` (`idtipocondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `controlvisitas`
--
ALTER TABLE `controlvisitas`
  ADD CONSTRAINT `fk_controlvisitas_empleados1` FOREIGN KEY (`idempleadocontrolvisita`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_controlvisitas_inmuebles1` FOREIGN KEY (`idinmueblecontrolvisita`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_controlvisitas_visitantes1` FOREIGN KEY (`idvisitantecontrolvisita`) REFERENCES `visitantes` (`idvisitante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `copropietarios`
--
ALTER TABLE `copropietarios`
  ADD CONSTRAINT `fk_copropietarios_ciudads1` FOREIGN KEY (`idciudadcopropietario`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cotizacions`
--
ALTER TABLE `cotizacions`
  ADD CONSTRAINT `fk_cotizacions_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominiocotizacion`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `fk_cuentas_bancos1` FOREIGN KEY (`idbancocuenta`) REFERENCES `bancos` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuentas_condominios1` FOREIGN KEY (`idcondominiocuenta`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `fk_detallecomprobantecotizacionservicio_comprobantedepagos1` FOREIGN KEY (`idcomprobantedepagodetalle`) REFERENCES `comprobantedepagos` (`idcomprobantedepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detallecomprobantecotizacionservicio_cotizacions1` FOREIGN KEY (`idcotizaciondetalle`) REFERENCES `cotizacions` (`idcotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detallecomprobantecotizacionservicio_tipoegresos1` FOREIGN KEY (`idtipoegresodetalle`) REFERENCES `tipoegresos` (`idtipoegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalledecomprobante_proveedorxservicios1` FOREIGN KEY (`idproveedorxserviciodetalle`) REFERENCES `proveedorxservicios` (`idproveedorxservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalles_formapagos1` FOREIGN KEY (`idformapagodetalle`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresonocomunxinmuebles`
--
ALTER TABLE `egresonocomunxinmuebles`
  ADD CONSTRAINT `fk_egresonocomunxinmuebles_egresosnocomuns1` FOREIGN KEY (`idegresosnocomun`) REFERENCES `egresosnocomuns` (`idegresosnocomun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresonocomunxinmuebles_inmuebles1` FOREIGN KEY (`idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD CONSTRAINT `fk_egresos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresos_detalles1` FOREIGN KEY (`iddetalles`) REFERENCES `detalles` (`iddetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresos_formapagos1` FOREIGN KEY (`idformapagopago`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresosnocomuns`
--
ALTER TABLE `egresosnocomuns`
  ADD CONSTRAINT `fk_egresosnocomuns_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresosnocomuns_detalles1` FOREIGN KEY (`iddetalle`) REFERENCES `detalles` (`iddetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresoxrecibo`
--
ALTER TABLE `egresoxrecibo`
  ADD CONSTRAINT `fk_egresoxrecibocobroxinmuebles_egresos1` FOREIGN KEY (`idegreso`) REFERENCES `egresos` (`idegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresoxrecibocobroxinmuebles_recibocobroinmuebles1` FOREIGN KEY (`idrecibocobro`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresoxrecibo_egresonocomunxinmuebles1` FOREIGN KEY (`idegresonocomunxinmueble`) REFERENCES `egresonocomunxinmuebles` (`idegresonocomunxinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_cargo1` FOREIGN KEY (`idcargoempleado`) REFERENCES `cargos` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_condominios1` FOREIGN KEY (`idcondominioempleado`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_logins1` FOREIGN KEY (`idloginempleado`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fondoreservas`
--
ALTER TABLE `fondoreservas`
  ADD CONSTRAINT `fk_fondoreservas_condominios1` FOREIGN KEY (`idcondominiofondoreserva`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horarioareas`
--
ALTER TABLE `horarioareas`
  ADD CONSTRAINT `fk_horariopordiadeareas_areacomuns1` FOREIGN KEY (`idareacomun`) REFERENCES `areacomuns` (`idareacomun`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horariopordiadeempleados`
--
ALTER TABLE `horariopordiadeempleados`
  ADD CONSTRAINT `fk_horariopordiadeempleados_empleados1` FOREIGN KEY (`idempleadohorariopordiadeempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `fk_ingresos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingresos_pagos1` FOREIGN KEY (`idpagoingreso`) REFERENCES `pagos` (`idpago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `fk_inmuebles_condominios1` FOREIGN KEY (`idcondominioinmueble`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_copropietarios1` FOREIGN KEY (`idcopropietarioinmueble`) REFERENCES `copropietarios` (`idcopropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_logins1` FOREIGN KEY (`idlogininmueble`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `juntacondominios`
--
ALTER TABLE `juntacondominios`
  ADD CONSTRAINT `fk_juntacondominios_cargo1` FOREIGN KEY (`idcargojuntacondominio`) REFERENCES `cargos` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_juntacondominios_condominios1` FOREIGN KEY (`idcondominiocondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_juntacondominios_copropietarios1` FOREIGN KEY (`idcopropietario`) REFERENCES `copropietarios` (`idcopropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_juntacondominios_logins1` FOREIGN KEY (`idloginjuntacondominio`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `fk_logins_rols1` FOREIGN KEY (`idrollogin`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_movimientos_cuentas1` FOREIGN KEY (`cuentas_numerocuenta`, `cuentas_idbancocuenta`, `idcondominiocuentamovimiento`) REFERENCES `cuentas` (`numerocuenta`, `idbancocuenta`, `idcondominiocuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `fk_multas_inmuebles1` FOREIGN KEY (`idinmueblemulta`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_multas_recibocobros1` FOREIGN KEY (`idrecibocobro`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_multas_tipomultas1` FOREIGN KEY (`idtipomultamulta`) REFERENCES `tipomultas` (`idtipomulta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_municipios_estados1` FOREIGN KEY (`idestadomunicipio`) REFERENCES `estados` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nominaempleados`
--
ALTER TABLE `nominaempleados`
  ADD CONSTRAINT `fk_nominaempleados_empleados1` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nominaempleados_nominas1` FOREIGN KEY (`idnomina`) REFERENCES `nominas` (`idnomina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD CONSTRAINT `fk_nominas_egresos1` FOREIGN KEY (`idegresonomina`) REFERENCES `egresos` (`idegreso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_logins1` FOREIGN KEY (`idloginnoticia`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_rols1` FOREIGN KEY (`idrol`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_tiponoticiamaestros1` FOREIGN KEY (`idtiponoticiamaestronoticia`) REFERENCES `tiponoticiamaestros` (`idtiponoticiamaestro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos_condominios1` FOREIGN KEY (`idcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_formapagos1` FOREIGN KEY (`idformapagopago`) REFERENCES `formapagos` (`idformapagopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_razondepagos1` FOREIGN KEY (`idrazondepagopago`) REFERENCES `razondepagos` (`idrazondepago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_recibocobros1` FOREIGN KEY (`idrecibocobropago`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagos_reservacions1` FOREIGN KEY (`idreservacionpago`) REFERENCES `reservacions` (`idreservacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD CONSTRAINT `fk_proveedors_ciudads1` FOREIGN KEY (`idciudadproveedor`) REFERENCES `ciudads` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedorxcondominios`
--
ALTER TABLE `proveedorxcondominios`
  ADD CONSTRAINT `fk_proveedorxcondominios_condominios1` FOREIGN KEY (`idcondominioproveedorxcondominio`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedorxcondominios_proveedors1` FOREIGN KEY (`idproveedorproveedorxcndominio`) REFERENCES `proveedors` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedorxservicios`
--
ALTER TABLE `proveedorxservicios`
  ADD CONSTRAINT `fk_proveedorxservicios_proveedorxcondominios1` FOREIGN KEY (`idproveedorxcondominioproveedorxservicio`) REFERENCES `proveedorxcondominios` (`idproveedorxcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedorxservicios_servicios1` FOREIGN KEY (`idservicioproveedorxservicio`) REFERENCES `servicios` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recibocobros`
--
ALTER TABLE `recibocobros`
  ADD CONSTRAINT `fk_recibocobros_inmuebles1` FOREIGN KEY (`idinmueblerecibocobro`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reciboxfondoreserva`
--
ALTER TABLE `reciboxfondoreserva`
  ADD CONSTRAINT `fk_recibocobros_has_fondoreservas_fondoreservas1` FOREIGN KEY (`fondoreservas_idfondoreserva`) REFERENCES `fondoreservas` (`idfondoreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recibocobros_has_fondoreservas_recibocobros1` FOREIGN KEY (`idrecibocobroreciboxfondoreserva`) REFERENCES `recibocobros` (`idrecibocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reclamosugerencias`
--
ALTER TABLE `reclamosugerencias`
  ADD CONSTRAINT `fk_reclamosugerencias_inmuebles1` FOREIGN KEY (`idinmueblereclamosugerencia`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reservacions`
--
ALTER TABLE `reservacions`
  ADD CONSTRAINT `fk_reservacions_areacomuns1` FOREIGN KEY (`idareacomunreservacion`) REFERENCES `areacomuns` (`idareacomun`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservacions_inmuebles1` FOREIGN KEY (`idinmueblereservacion`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `superusuarios`
--
ALTER TABLE `superusuarios`
  ADD CONSTRAINT `fk_superusuarios_logins1` FOREIGN KEY (`idloginsuperusuario`) REFERENCES `logins` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioporindicadores`
--
ALTER TABLE `usuarioporindicadores`
  ADD CONSTRAINT `fk_usuarioporindicadores_condominios1` FOREIGN KEY (`idcondominiousuarioporindicadores`) REFERENCES `condominios` (`idcondominio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_frecuencianotificaciones1` FOREIGN KEY (`idfrecuencianotificacionesusuarioporindicadores`) REFERENCES `frecuencianotificaciones` (`idfrecuencianotificaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_indicadores1` FOREIGN KEY (`idindicadoresusuarioporindicadores`) REFERENCES `indicadores` (`idindicadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_rols1` FOREIGN KEY (`idrolusuarioporindicadores`) REFERENCES `rols` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarioporindicadores_unidades1` FOREIGN KEY (`idunidadesusuarioporindicadores`) REFERENCES `unidades` (`idunidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `codigoestado`, `nombreestado`, `estatusestado`) VALUES
(1, 'E-1', 'Lara', 'A'),
(2, 'E-2', 'Merida', 'A');

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`idmunicipio`, `codigomunicipio`, `nombremunicipio`, `estatusmunicipio`, `idestadomunicipio`) VALUES
(1, 'M-1', 'Iribarren', 'A', 1),
(2, 'M-2', 'Palavecino', 'A', 1),
(3, 'M-3', 'Torres', 'A', 1),
(4, 'M-4', 'Jimenez', 'A', 1),
(5, 'M-6', 'Libertador', 'A', 2),
(6, 'M-7', 'Campo Elías', 'A', 2);

--
-- Volcado de datos para la tabla `ciudads`
--

INSERT INTO `ciudads` (`idciudad`, `codigociudad`, `nombreciudad`, `estatusciudad`, `idmunicipiociudad`) VALUES
(1, 'C-1', 'Barquisimeto', 'A', 1),
(2, 'C-2', 'Cabudare', 'A', 2);

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`idrol`, `codigorol`, `nombrerol`, `estatusrol`) VALUES
(1, 'R-1', 'Administrador', 'A'),
(2, 'R-2', 'Junta de Condominio', 'A'),
(3, 'R-3', 'Copropietario', 'A'),
(4, 'R-4', 'Empleado', 'A');

--
-- Volcado de datos para la tabla `copropietarios`
--

INSERT INTO `copropietarios` (`idcopropietario`, `cedulacopropietario`, `nombrecopropietario`, `apellidocopropietario`, `correocopropietario`, `telefonocopropietario`, `fechacreacioncopropietario`, `estatuscopropietario`, `direccioncopropietario`, `fechanacimientocopropietario`, `nombrefotocopropietario`, `formatofotocopropietario`, `fotocopropietario`, `twittercopropietario`, `idciudadcopropietario`) VALUES
(1, '19422094', 'Xioang', 'Sanguino', 'xio@aon.com', '0416-1326547', '2014-01-02', 'A', 'El sisal', '1990-11-04', '1', '.jpg', 0xffd8ffe000104a46494600010200006400640000ffec00114475636b79000100040000004b0000ffee002641646f62650064c0000000010300150403060a0d000018be00002a7300003ce600004c60ffdb00840003020202020203020203050303030505040303040506050505050506080607070707060808090a0a0a09080c0c0c0c0c0c0e0e0e0e0e10101010101010101010010304040606060c08080c120e0c0e1214101010101411101010101011111010101010101110101010101010101010101010101010101010101010101010101010ffc200110800de012003011100021101031101ffc400e3000001050101010000000000000000000004020305060708010001000301010101000000000000000000000002030104050610000104010303030305000203000000000100020304051011062012133021312214074041322315504233244411000103020305040804050403010000000100110221033141125161221304718132421091a1b1c123140520f0d1e13040f152627282332492b243631200010206030000000000000000000000110021203040708001506090130002020201030303050101010000000000011121103141205161307181f091a140b1c1d1e1f15060ffda000c03010002110311000001a3ee14066610fa5e0681ba138160483da3983a0e02b4f43e0f83dc3ed4f83c1d22000487c0806c19064190600701c070142195cacd28c200e70e0330340807c3dc0ad1cc1d31b47f0d46ac7cdc4e6b86bb39d32399282ad88da5b155746cdf81a040360c03020c03683602841a5090200ed2440b03770b020190c88d9e8575693c3f35e0a16cead18fba9936d53cfe88fdcaf50b5d71a78e4779659d9cdb799b4b63fa340d68de03ea320280c02857d28581407e8701c066e1383e18ce6e5d1af5af17556e5546cecaad8b36503a673737ea3e46f4da8572277267761b532ebcb16ebe7d292ba532df2b29edc6746818106018050aea50a0380fd0d0340c07833a4de7157ea3e0eab32bc69977641b9e90bcf68cba4b498be76cdea677db2faa9b2cd8f4d134a174479dbb79ac98d6f64bbea69cf8503180cc0e02095d4a180781da199866eb786353ae36bbaf73d37fe3e861ccd1d2055e1e14f214b820cae866d5bb225f4c33bec8dda4fb642d668b15b99ede1ca1ddcc7514a0973376d5d00d68060174adae9a07e856e1b8079b8babe55379217b7787ae1392f99f44f16efe6111acbc978c75d6fcee8195d3558eb4aabdb1c93af8fc7269737e85f43e2bd8214caef2e51f578e7b562c0d1b4ad5d9f56de6b01585d9002db0bc2b39b81ab80ad40a276df9dd5a2f3d729aaf3d7772e7f64795ed3cb685a25ffceeb9fe6bd63aa21f44ab1d50ad5b9d80702502d6bbabf0f5ec5c1d3cebddcf907a3c4500a0b6c283a5b7356cdac2e9805199ce6e139b18020f6fe7a76df0f4e2564c4bbb928744003e035182757469a957c798a6c5b4d90f80918c156b49165d87ceebd1783a7943dbf353793060a6b81d1fb9b9e6d697430c4c331568d624d4afb2f5ff0095e849b2e3fe8f153d88208d34114509056b2142856801161f3037df01c9f45cedcf2bcbd344e8e6529d1fe47a39774c334f438df6514d783b5f72dcbb5ecde76372431818d09a5d89cdeedf27bf9d3d2e28fb2daafcd93793eb583bb92908a3e3e86cb26ebf695933cd652569c29336f688702cc11a6c1ba370744c46b98fabc1596c4ee68da76326a0213371456e7d60a14d02576479ba3a9e54e75eee5b8c7a6f9ab8e79fd6cfa3c34934a65d5693a4b645a8cad770e6f6aefc9f431fb98277fcbd49bcf24581b4a5e769a9edef87a756c591f53838b1f0a0ec9d2f4a3410d9a287241b186180d23687c3dbb132e6bdbcbeb29a65415eb73a51a8928b59364adecae38fa52766afc5f5deb45bdd709519b39eba7e5026c9a96e8f267f8baf7269e85ebf9dcd8056e6e608040456692143379e4c41af79fd7ac799e8dc7ab9f37efe47aa903ab10a50774f285ead8da71cd91a3e8f1e8d43cffb706fce6ea494d22cbe37d3e0e614f22790d9f9abef2f46a4d3b5fa3c525d3218c681b3593237348020327371b57d2be6bda959d2ff00dfcb505213d4e0a9527199b9432acadad88ed8adb412d7a99b6f9df7559bf3c94e8568eec8a0e6aeaf910f1363e3adaf8fa9eacb5befe23fb2038360d834117812040380cf2dcfe3ea8e9b86db46e3ea9aefe3cc7b39b3c74a6b2c6a5275f7d69300314bc66f45707d8d02892eb6600f640a7d345e8f9bca2be3efdc77b971f4b42e9ddfc521dfccc8780d0321198120483eac6f27438bb17c97abdf2b1e5fa575f4bcec9fa61925e10b3b47b382f394698c0294d891f65e2fafa4d79e5870b3657520e7e842d3c1c5fafe7f5ae3be91e775e8f7e723aa325ddcad68931b35a08bc090326d29cd6f55d744061589a14ef1fd5b0fa3e7d4fa6588f44a988e2cda32d031f3e060a7532517c1f671fd1e7cbe6c6639ccb092f429b7f9ccbba3c5bf71f4ef9c56d1bab9c57590eee5634419e1ac845e04aecef35fe9bfa0574440e6baad20637a771764377f1e11d51adc5c17600462b29f1d91fb8e77c738bebccbf98d9452ebaf25cfd0c5eff2d557e2db792bbfc9887457448bea833a360806c21f09b854ee7ab73a15d307e8913c3d52bddcade357b8baf239df1af53cc7528d2ed71f06a61b3e9ec9609e7f53264f5ecb4e0804ab8ca36d2c50eae50eff008c3b136ae3b6cdcef3b791bd3073a24ce880418d9b0cbb6ae3e8f15999d0eece55e607cd733ae1e66a336bdcbd3c83d7079c21088dd1197a213d0d79b9f1ae2fb19eeaf1dfc4858de268309dd28de57207578134674cf17469d072f566fbb97dbcd90468831b3428567e344a32134fece7f301e165ba3b640a16a7f275f327a1c559699daead683d9c18d644ecda33d4d03252935a1cfa39dbafcbdc61ed445bc3c51f8ac2bbd35c3d5a0b4953694ea8b5d314b6360d8340ff002de411908cca34976f2a57528c342a676738e8f092b652d9cfdd3cec9a6a91ecf6c1ac46e7e61834da56a1ab12d3bdcba72caf1338bb6469d29cb59fb49c4655146bc956468c6cd682538ba1f31b476b1a43af9bc5d423332a7cd8fde62a353b9ba702ece7c899637576dcb5952d5f333a7984c86e6a318131c16a348a87ea7e4aee8b8e231ef346e8f45fba22c68d034135c7d0b310ade6699d50fb06a4e8460e1693eee468d0235c256bcd1d9c8266eb73ea974a10af47b7356a9379440ce8b1383ce96646eace5ade2b2639e86d26d6eb3a27b39c7d1a06827b96dea336acb7526f2f8c44dda93b294fb70febe66b1a9bcfd3c9d4c8dd42b58a1ee68d1148d5990808c03468069cb4db70e5e8dced05c9953d53e2dd19351d7115d5901ccb2f2dfd56461f1a57443e044dda93a15a378bae63d4e07ad3611b02f3fd1c5ba6015e262bb4ea5990628198f189d63635d538fab667958e93638ae75264591facc746475446bcc63180b572dfdd1136f80ab47e6df175a9bb3271e36164f3beaf9ea7c8ce7bf30f9fe966ddfc166654be7c158d4505830bc4aba871754e5e51b87b3d98839f5993592e8a9c662f11faa438301fffda00080101000105026b108d06211a6c6991a6c69b1211211a11af1af1af1af1af1af1af1af12f1af1aec5e35e68bbc3415e35e34634634634624634634634634634c8d358835358991a6c69b126c6846833647b5a831762f114eec608e4aef699eab4d8c9d58d3b272350cdec60bf0cc67736319dc8e4a3821cfdca76305c8eb5e00070ecd9162ec4588c68c68c7b231a7468c69ad4189b1a646991a6c69b1a6c68354f345599c9393b00e1d7f2d660f1be2367355e012bb2169976f5cc7bce62494606db1eea6596d96b0fecc2ead256963919729be16f20e341cd86c4f4a7e3dcc5453413b7b1762ec5d88b11627468c69d1a6b13589ac4c8d358991a6b1358bb765ccf38d81bc7f14fcb642a63abe2e0c8e518d187c2caf57b1f3caccbe1f210be7b6e863e2d4e4cb4d4b1d0d3867898c8e5a95ad17e36c42f89f73b32341f12cde1599389c26a7360790cb1b62e43900b17968b22d2c5da8b116a2c4589cc4d626b13234c626313189ac5ecc1c9794c18e85f24f95b5c7b0d0606a58f2470d0c345e5f230364bdd827f0989d8dc76464c763a8e0ebd9c988999be595e275ce4f937b71dceadb25a392af7e2327dbab18bad7599ce211e421b556ee12de3f28d7965e7c6dc6f34ed556dd6bd1f6a2c4589cc4e626b531898c4d66c9ad4c66cad5b868c59ce4f6247e5ee3a79780f17711b6c6d1844792e650461992ca5d3632b95acf8b3992b8dab996d77dfe413d84f6dd3160a9c5909f27108496d1925c6b7c4b1de6b2c831fe33d8d7bb92713a994ad95c45dc359c7dfef53b9d0c98be41671d2e2399e3722b6dd1622c4f626b131a98dd93426355ec954c74797ccbee3f217cc4de1bc7ad673250528ab4133d913f90e55d90176c4749f0e7e50f964f2c185bf154bec8e2963c7c312cede6435b07343520e4f79ae0f9fb5ff0075238d0c9cd5a6c3f2db2daf4f3f4b20e161ee5cd38fb72b4dec96a4df71f710776ca2b4f6ac2f2bb98e58ee578ac82d814e62635319b26b535ab379e8316cbd967db92dda10c05b2cd3f00e3b1e1f1334a5cb3f9ec7c2dca72099ce7cc6435bff00353bad863bd6819e872060657cb44c667f251597419211457ac89148417a048314b6237c36a562e37cca492616592b39cf1b104903b64e68286ed22472658734704cfcf9280b531a9a17d2c19ae5d1d757af4d62481fdd3e52c77cfc1b09febe5896431720e5be793257ac30cd2484fc1f74e98ecf7f79884ae7c54ef3dafc5de4e6da85a5fab47b47dd2266ed2c7f71e35c89819718dca54cad6342fb3644207640ee7f19547788b5342bb93a38c6720e56fc8196dbdc4bcb9d5c761909749f8f711f618be5d9291b1c97f1d4c5c9ec5973a8c9daea4e265feb44155aa4960c5190bedf30d4ca996787beeb54ed648191191ce63e2200eee2b10ff527ac6c5b82373db566920978e5e659adcea9786dc4fd93d10a161749c4b1bfe6e10a685ccaed892f3e6739c01258df781a1b162e1fb8c8b0c7429724c84d6a6e318219cb7cb78ee2f0589a41f0c13455bec8d473e46556cd3d5a1df1cb3478d1fe836cd76e404125bc8c6e8c719cc5daf7b1792c5c82d324ac698eda1745536af3ec35f65a548e0e5c75f2d65cc2a9b7533b81b185682b6f6e1780932f916b031a42685cf7161aa484b0c2cddcd8cb4fff00270eaa25ce72b95f05210499177119e7c7cdc8bbb250cb4c358f12056ed08c6298ceea31c30c198b1dcb8d49da3c2fb52e1789e27109cdbb6d4d4fc95b21c22dc6e88cf8db33b6bcd035cfdebc5e454eab6c49c720845aa18982edafc89c77fd5e3fdbb18a274aee1f826e1b188a6857e84590ab9dc74b4ee578bda48f66c8dda0e3145f432fcae5f34152bb0225b0d87e7eef64f2fdd58cfdbfa2b45b96c32ca2ce3acb2bf86fc92f81d88a7f8c69b2c5d8a38a281ac92363e6757965636059ec456c9c1db2559c343248a0ddd83a1327b851c9d623b1b2b276727fc6d2bee71bfc7cea726dda3401342e57c7e3c956151d148f6ac7d6fbbbd40c6fbdc82b4aea14abcadab2c2d91f7fb618b150bd832ce1e59208e38da04b054b8d3044d62bb34b61ff0089ed7665f25d952482f4a4dded065b0c750f0b991735c36c987c8aa1776e16263866eb78a6c2bbb998d60898e0884422114d4d5b05c9b8f006481ed7e178ec94ea6131af6e4f93f74357070473d0b34fecdf6211229cb2b511ff00bb76799ddde2654aed73806b9fdbb9857e3576dcc391c3d966b00e7b9a3b03bba8998cc182bcb5f3789ff232b49c04b8f6ca1f6e20ea704b65b1d67fd4e47428a09a80458d70ab88c7466c568a710d68e2b1c946d0f19edefbf1b77cac6d6c7c825eca94d9e0a2227b26b52c914d337b595e43b5b715f8d232fe5bc90773fb08959beddfb3035a179bfb7f2183e28651e4c706c956f46c34eac0d6558082e737528a6a6a09ad739359da36ee46391b7394d8f24dc7d8eab2ce3cf2f20f03e5cdd774eeb4c6d68aa0faad591348e6b9ecae0c6d9feb5f896abe5cee79edee8cba4b1d9f5463bedbff0091d9afe68fedc5362319e3d2c51c7039f68b2ab238a31dd2928e8514d4146cee5da1adfd98084e3dd366a38e38dd59d5ecd76971e51e38a1b0f605235f6e7b0ffb52226f6c53128c6e627f6b23fc5347edf8ee764feda319264d95567f749bf89ac3259fc91278947df256c1897b3018b7309fe2d6f6bc85f1d01463b8b5a18374df7447b7680f9a16da89d4c0ad1ba481fc877b58c7032032b408a1719aeb77201337947830f84bbc8f275e8d5c262b2b21fb983b9955d2f60a4e2c8e497db1ed6bacfe45b226e455a2f2c5c1b1f19ab5dc3673f75082e73915b685054e3d81d22d9390faa7d911ed91c7f9d97e94f142d7182e36945da5b130d8a6eb03ed408a8e3ee65ae71ae3d530547396db0c31426c4b3d7fa6c303176f8e26fd6a8c3fdf9abe32396a12b7b38adbeca2c0f608cb7c707d2c7687429a3b9ccf8723b9518d9a4a70ed77c84ed95ead148de54efb6cc9786cadad035f6a190383a1edfc7b8aa70d0b1622ad1e4b2272b629e3fc50c8d1db3d7055b73208e9cd1ccee51646138e4b1ecfa27db8a63d9fe556fa1d17f2fdce8742a9b7ba4d93d6dba68d8291bba88fb38294957db7dc793b21c949524f34133658d3ecb1eaf76b056c964684ace639e73f0796a52447250c914518ece519bab88594e4791bb2fe3faaeb517e42c936d5b740eefc5d3f359c5c734756bc4432b460d891bb00776a2513a54676441397fdbf6457f07efb87fc4b2f94f21c1326832514b4553c9f9948d81c1b467bab11c4dca6a18f0cb75a28e4af1b596a5bf7a27de6c975f250d8627964f81c3cf929acc91599dab8633eea7af1bc319bf8a26eca42530ea51518d827a6a1ee34298f5b7729631b7dbbe3939cd03f7d081097cf2c6fe158f35eb58b5f6b7ac192792c4ae6b9b6e464b1e40c89e5d33e5903993cd04714dd8e920df7e0d47c70c50ec1c7eb1ec9e7643647428a6e8efe2d1ec352bddae6fc48dee16220e6f30c6cd1b727fd765ad2f188cbc9fe75b0c8059ab379afc0e6cb2577c964c0ef3b6b80c9366aeeaf386c4e95b8dc209e5c0d410c0d690d03791390f72e474250d1c86a7497f8d797bc7eef6f70cb630dbad93c435b91b38d104cd8222cc54d2dcbf7fb1d6256c3f7ae89de430899fe300b9bfd13570d54a986ae3b8d92255636b2396409bec01df4dfddc8a29dab90f6e9287d0a378769dab9cf1bb52455b2136d7a395cda4258e2fed3358eef0bdef626deed67dc00d7ba561831196b52e1b8dd88e4a359b59afb6d6008397f25dcbdc2dd128944ea50d97eda14ff00e3eddb0f94399becaefdaf879b57c43ac546cddf2c103a2a71320b16054734455bb9f5e848fab8de2a5987adc0e210b311e48854db24fb8d8a575aec88eec6fcb13b74eeed8f727228afffda0008010200010502ff0092ee5badd17ecbc8bc883d1700bbd03fa82e5de8bf46e8ee81a34e80fe949db5db41a3bac1fd31768342e5badd172ee4020176f434adf75b7e80940279e82b65d8b65da9ad1a342016cb65b680a077fd06c89d40df4edd1c356e8d4342116a2d5ba6bb6f5ce9f289dd35ab6d0ad96c9cc5da98d5b21d4e6691bfd3df509e5141bd3b7aae6e8d3ede99d1c53075efd1b74140a3a10a40a3f437e971f64df6d3644fba27ab7d7640ad96da04f51fab27c37420a2e41bbb901d45cbe57c20740742514547f3ea3cee187a8fa40f4128a6fa92bb60d3edbec83bac7a20ea74099f1e94eedcb1489a503a1f40fcf59453533d22116a03de6f8620753d67a9ba1453537d23a6df54a9be99f9e91a145009be985fbb96db16afdfd0fdfa0a6e8fd5be90d07ca2df66a1e814351a8d1e868deb3ab5143e7473534fa0e287484347eacf8f4469f075210f8d36d495f3d406af4341d47a884d3a15ee8756c3a02017ee3528043e7a8e87a7f7d3743d1db5d96da3b51a0eb3d40f40d06bbadfd0768751eb04514d43a475efeb0e97263b5d907740f4374138f48f5420753ec41f47b8045dba08947a5beb37743476c87caf7ea2bd90451d46ade8ffda0008010300010502ff0092ed5b2d906aec5d88b576aed47f51dabb576e8741d447e9821aeeb7d47591aedfa30343a6daecb6eb2b6fd0eda34756fd275df52b6fd0b7a77d06a7428add028140ad911fa1f8d375be834dd02b74743d210768e1eb14d08227d0dce9bf46da76a081d0fa5be834013baf6d3df4dfa189c137409a9fea8d0ad96eb6f6d901d3b2d976945a46bbadf429a9de80e967c9d0104066c89d87500a380aee6b53bb5e9d5dc3423a027fc7a6135387501d1b260f77925dbadb703dd3e3ee0b6d068ef5236fb91efb6e8b7ace8137e47b8213506fd5beea78f51a14ef4e26ec9ea34e08fa50bbe83a7ee3d96dba7376286853bd20502895127a23a00e90abff0013d0d5646c7409c8fa9fb469df1a81d4143fc7a18acfca0868ef4cafd9ab7dc15fb6a47404cfe3d0c560e8dd4fac1deeeeb016c99ee4ff001d0e9ff5937dd3757758d4e9fb68d7270ea684e2ab33732140a1a04f3b349f74dd5de91ea051f95be811f66b5a4a6b7b1ae7e80ec026852c9bead4743d43a814740bd9396fd0094d95c179375b684ecd3215dff438ea343fa41a01d1dcbbca2edf4eff006df41d27ac7511d0751a6dd65043a4fac7408a3a375774effa509c350511d07ac2d91407e8c8d47b823d10d280d9140751f59db23a3774ef85edd417ba3ba08751e8ffda0008010202063f02c953af16ff00ffda0008010302063f02c95128a013a6e8a613abe82ea8e1193d37ffda0008010101063f02fe5cc41f0e3fcbd7f0572c772d5198dfb93198c9016a5cc272192d5c9760f8e1da8898116a69cd691b8268f1c8e03f7461d2dbe59f348d4f723cdaf16a90de9a72116a08e6ff00caebb980f6afa7e924f22cc42163a91cd80f05ccc6e2873271ae587b54ad5b22e4c60053fad548dc1a606ac362705f6838b846e13a5c0046f7cd5d9cfca74bf710a51845c0c7b1ce6818c38c3f6b0a3ad04310faa5905a6f4e9e531e1646e122e5b957564d877a3d6f4b2888e247e7e09c3c2503470cc858eb78b2d7b13db982fb3f933d358954d271382b76a585c3e2ab21d3f4f11a9b8ff55cab65e6310a5d6f57073e2898b1a6d0be4c7690437c768f6a20c79b5712dd51f0570cece86f116ee23da858b3168194755c6a00e4fb908c43767623b2afbd72face28f9065de7f3b973ba7b5f2a2ed6c073edafb11b973e6dbc650944537332faee92df3219b92047d7faae7d802128e16f7f723034312c5d72a46833cd6bb772372d8c1d699342e8f27e9fc7734652b360fcd34d5b15632b8f8900bab77645eeddf2115da2bb5318e9bd75dae8a81da1d7d4dfd5fe434d0fb0fb57ca9c763369c118310fe1d9eb5aae33508a6caa9c676e2d7011aa957cfd8b474f01066d437b28576ecc83942d45e6708c63bffa217616b40f287213f55eca942f42eb92daad6ac5fdcb9b61a765fe6408258fa97d4fdbfc5e680f6b04f663cbba31a7ec8c240c651cc8a1543a65e68647b16bb12f0d41d850b7d68d6d4331490fd5737a696a1edfe2732e9ec8e650b7668328ecde51b425cc91ace58f721f71eb61a611e284a953b173892d84453f446ecda44541938f72e5f4a354c523a3f55cee6883d59ea3f7652b9199b8055cd1c6c396684e3518088c9444e3a1a25daa25d9eb50b36b13c7a9a86a7e08fd5c8d7c32c29fd575066fa803a4e2e70f8a95b23c0071647b36201f3abe085ce9baa623291d217fd836eb89b7707adb35afa7917ff2aa2f4b9e653968f9be531c41f52e57511303e492d1773a144134c8be485cb326da25504216ba8ffaf74d2a5e04ee3faaa771fe0eabd2ae5018a949db62e543fe4978a4a074bd8817b92a7c546c5b808420308865cdbb3611ee60b916665aa2859fdacb444c4be231f72101260eeefed466fa810d2033a6c53b37c3c6551906408e2e167c861f151e5f9068ae2403fba919f85a4639e403377a1381d1cd8bd6ae648e968c8e21e8e09154fb3c283166c190d37640e209da809cf591424d02e5dc2237061318f7860572afc3c3982e0a9deb111cd8e1fd118cc34e05882b4e3a6b07cb727c10028c84399ccb43c92a8eed8844cf953d93a027714e3d7f8b9702f78faa3bca3333d5ab19155a92281691c529642aa376706bf75a5327dd8a36e3de70653e9e6f2228631259f7fe42e559118c3018bfe7b13cb1de851f73b29c25916c6a542f5acaac572e674ea8b3e4d8fad698cb78d84d7f55cb7e08f8403f1ef51b531e0f0e07c43fc54a3296acc4867f9aa7018643d1440ead230ac946e6991b9466620afa2fb8ee11917062725422796e3f047aee9a3a1eb2805a5f784e335b3d0c0b052e87a9acac01a67991bff03c8b3624d194ac7dbb8a4286f6201ddb5195c99323524d49406f5a6dd2229daa3ac3dab4d29042dc1a3188f62fa0fb589346929ed3fa2946e1794b1a834ddb11043772a20d8a0f9773fa345aa939054e0d35691624aab766a14aa22e5ba61adbe3f81d18dbb62643c8bd4b046172d785dda8420f9613c4f7a874b22f0a0d5b0fbd94e1a7e645da5e5214a02831088c9165a532ea7ac22848883e9d7d5dcd3b23893dc8d9b1f2ec8c239cbb536a6f4366423daa37ee0695dae0cdfaa8fdbecc8c4dcade90a10325cab63997002d002afbcd7da8fc985b0de793929c01b5e354c363ad2c83ad58406276236fa4b46658168f6f9ca22063072018e63bd7305eb6771985a6f40162c7431ac7705ccb74c982605be0b887ad1802fb0ad57c7cb10989f61a1ef62babebeec74032b93236397657260b08b639ea344250a07a84384e0ce326f8285f8562734372719fa000158b4dc521ae5da7d32ca10784437b56d655c500af4e5e514566d1f34828091610857d4aeca058ca912728e4372fa5b57345b839bd78788e93fafb1b7abb73a3b5f3683986a78888fc51be3c8353156fae838e70d5a65b3e3546edd0c1fc1b02e5dae103c5291a2b762c705b18c862f99aa1211e55b86040773b49daa57e0d384b86462fea28df20498b80706d8a3f2611d547110e57d5749d15d3d902d3ec40f5bd34ec3f8799123de9aed4ca586485eb2354738e68e87070c568bdd54cdb38c63001fbdd085a8f00de1e5a46973dca3a8336c42ef4c5c79b6321723b6a77ae9ae49f47556f503b24f509bd10247cab0d3b84ecd88446541e98f5718d254272744140e29f2daaeb0fcbab1cc140416c9194706c30a90a560b807138b217c45c03caea4462da34d3880c0115070752b3cbe0903c4643b9994fa184b4bbf36e904691b06d2a3ae72874d62223662f40622a7b77a3cbe232704ad12c65e51447973133507716cf6231c6390ff52fb874b71db46b031e2b67f75f4d64194ae4a1ca80c644bd0363928f55f7887d67dc1c1e4636ac96701b36cd1b92bc766914f729d9eadba9b53a4ad4c38c32fd5197dbefc2f8f2db97cb99f5d3da8f4fd65b36e4292b727894488f2e71ac08f71445caad50a1070c590330ec3005bd6ae5a9c8185c78e96f62e9fa7ebe3c38e87712d017fd587cde8be65b88d911503bbd11847c44b00147547e6dd695dfc13e9af077f0ee3929dbbb1d2d46c1c2259760752b4054b7bd74e6e3d48631aa667667f5d519d8cb2a00bea20f0bc3ff00adb26dcd9b6eced4d2ea2e5c19be989ec7002d16e9a880732fb49cd7d3c3b80d91a237674d21c6f41ce9882e0e062546e74a647554b5147a73ab548e91132cd5cb31acefe91370c63bb7afb97dd25c53e92108d8ff0055d12f680197cc9d6e577b9439778317d3bf7288971459c10c366481ba04ad5e14193e6e172251760f62f676e597fb5f1573a2eaa3a6fdb78486f8ad40509f02d56e3c20d01345aa5c23191c0ab6c34c4b52a7bb156ba9b5c5ca96a003619fbd3c7053eafecada2e3c8d934d27728759f703c71e216c7c537e13d45a83df8e7b91848619223256ec8f2d6e76455ab30f1c4d06e57615c23a5b3a618a8dc9b8f293dea31373830240cf3277af9589a0dda7e2aef593ec07121f13ea447989ad55bb02947c583ef42162801a905728f0e804eefdd5c9cb6d0e7b131e26153b7f75d7f427c3d45a8cbfdd6cd3d84a9463882eb487ad04720436dec40eb240a69937b17171692dafb68a1700c81d3b9943ef3d3f8a4d1ea235c850fc14b50690358151196ccc6dcd43453699380fb9bf556eec64ec6bb0fe88c09ab6a80c68ca50cdc9fe0fd6f4b16184a21688c5f253eafaa8f2ef5f7a6718a85c803a4caa4e617c98bc8e5b852aae5bbd1e235f090dd851b9088b96e5462f190dc7346668d5638041dc06323f053bc4708e221031f13a8da8c9e65ccb2738ac7492dda07c51b671150a7ab8b5111565b097323dbf2e4b51a838a6961eea29692699a7071382b532720d11df4576df5501381a31cdd5fe93fb4fca3fdd6cd627b59683572ccd9a872f639c88ec5aa638bca4e3faae8ef74c5ee44b4a3b6398646528f8863fc1d3214cd6b8d88bed64d20a10b71e115ef5138e2e305765cb94711911de7e014798d090c2e57f5098cc1117936654a19d238d288cbffa5da8046118e681ba70a87cd3cb8b4811357aa376478881a40393a9c882e4b14ecf992ba631f28993d8212458ad43bd365b3666be9c66c49402844606a477afb6f5b18bbc676ee654810def513b4d410ad5fb643307189f62f98753e07e38b7b958b9a3534838624800e2c14656cea8c851ab82e1fe070fad304cad69f0f98772b5d0d9e2b8d2998fa807f7a9c3a83aa43ca0135f5608698f2dbccdf04616bcb5969aff00450869688e33bf72f99e290006c6d8bea2ec7c3822092d12ef995096510c40c8200d6af8e2b50c0aea7acf2d8b1a49ff00299007b02b8ff9a85a7651f72614601cfb930ef5af651944edab2fb7c625b992b83dca139545625aa14622540ec30c1728c84e3468d3501985160da7009c537a63ddfc0a7a1ca8b647151bed58e637e650bee5a4cfa5d89fd5095c8ee939c3e0a446789c9ff3da8ddb9e5e1ef0b9978b4464a30871518d3051bb8cc976c0328bd30131b5681b5c3146e10c762bbd7c871759749076c2df08f6ba6db2f6294a5b1df6aa7e594a67797cf055dceb42fb6f471f28bb23dfa428e5a24f52842c45e71f14776442fa8be78a5588d89b040855fc422137a1932fcd1185df09c972ff00b705ca00eac0139f62911211d0cf12d8e5ee5307c9805c038a4706652bb7438c866c84851b6fe77a883e199604e03ff151d5115762cc4151e87a48b45fe6dc6f045ea4ab5f6fe9069b5623a21b7bf795ec0a3cca484ab1d8095232380f7bfeaa53231a05ab6e010e666cb951f0f4d6e106df2e23ff00b2688e18d64e10be640dd73cbc59863123b362207098e315c216b3f8f5cb3f4bfa18619fa5ed9d12c010ae591096b98312d9805c1270085b3263278ed739a99f348d357976a61e22dd8447144e40e1b28a1a2b2887d273c5fdc15be83a58f8cb49bcbb4951e9ecc788d673ce477a629e553e2dc9f0c8762ad75306f6ad11cb13b4e6b4fb16bc23015392eabad3e1bd72443ec7a0f5231c09a2e5690d1358e648feaa376dcb5e80c46274fecb543cd832d198fc42280f430f4ea884e3d386cd47b2b9a6b7c235036cff008bbbf7d109cbfe3b9512cd344bbd07ad4a50f08a91fe9752d7c31123bc843ae835cbb7ebab1311b119c8b009ad0e01475ae789ab6c54ee0a24f96bdeb8888ec085b89c6bdcaf4adffc97fe540e7c789f5273ea4eda5a8b9b38e3539fe68a9138072db90844e070f6ad43f13ecf4b0fc1a7d14aad60fcb1881b11b9d39d5ca11113b748afb51e92f78a3e13f9ec4349ddff008a845ab1a9edcd16a3e616afb7dfb960ff00f9c887f5288ebba99de83f140a1784c3509c88ee5aed4c10a04e272a21a8f601895ce71187923b147afea4bbf842b3d074f2e1b0e4ef91cdb60665c51739366a1659a26922a3d200d1f0c48146cfbd97bd488ddf8fb7f1e3e875ca3122199fee518f46230b912616e186faee65cc98e2cc6cd2b95746e7cd6bb72ed461d39702a49ed2b9b7ad8988d67aa9b69ec53b22dc231035c787885307c5b35031f0cda8316904610bb20008d2a355403ec44747d54c40f81cbd3f210bdd54cdc90157523e1d2dc3b55ce8eddad64bf266eda49dbb54aef51c772753245ae100176738a265112948191268b8f868348c171d3d247e16f4bfe2dcb869b15cea6e369bbb3fb32fdff652b3d3d049a623b6956dcb448f112ef20eca6078658ef0eae7537489c6e69b95afe6a5448b9a6328089c4b39ad1445ce084f5c212c1c0c94ade2cd08cb6697fd942950e08dca16c42a333986aa9f2b868e5ca043ea72fd88c2548eec4fe6a8ced388e4ea20514aef9a6cdb428d70c56919e3fc830cfd1a76a639a1d64039b5e3393134f62951939c46451d45a3a79674d367b99722e57a9b823c996c040f5bab5d3f5371a21a6238b6b0ca70870e8248daa3a4b44d04b043a5bb3d110e0494ceb69468144c99a2753c50818b4b55244d3bd188e18c4b00eecad407691b5085b34c8300de87c861e92ffc5a7a595db0cfaf73ae575674ca3c27000ad1843fb9b108465c38c633141238ab1cfb8dc911b7ae594701dcd446c13c5224096478a88d8ea4ea887798a3e1eb5cb194b1deecb01a8f0a263c2ce9ac474f966c5dcc712b4e919b5c19a1bbc51cfb173e98ea1950ec4e335a47f25abd254fadb0d238ff00a40a947a5fb9c7c4c2d4c8c0350763202d9f011a76230bd2d10b8c0866a443bd2b9fb143448c8ca8363c959ea3c5aa4f20ec701f0529c65427bc7e591d2e8e9a99961f9ef434d01a819f62d02d18c71e2a328fd50777738e15422069c0772d20b9382d471f45324caa3b3f8e74542afa0fd4b082d76baad336e1b6212d9d8ca1ae43955c06e47ea7a910689d1aa32ad7fc42872af47a9b7aa1a9b547cc3fba2131908719e51c5f0a1644c2fe070d32ae2c86beaa16b1d44899cb745439df77d33a786cddfeec78a3b15b8c3ab17eee73bb19c7cc0f0890ec5236ee0760c18f87faa1cb2372ff00a36f5cfb40f7ae9a5a06a10e28167953228198d32ce282dca9e8afe0ffda0008010103013f21c7f8faa9ef11e33c22f11788b17b4f69edc3d87b07e2332ae027a3da7b4f18f3c0788f11e23c478ba67e43c078717848ced8e552c6bc45d819d6e06b885dc2f75d82055ce42f740516daf60726b804f4f0408fd08031d9cee82038583b0586b91e21f889ed8fc6769d1578fd0a3abc637363b81b9a47b20a67b5b1555a73683c58990141bb781c9424d56683fa9b226794619837fa07b089449f4378fb9780a57d1ff45dd5580e6ae7600d04100d02895cec0a8b3dc18658787e3cb78fd1320450684bf6a189e1d9a94fba8584b36c8c64ddee71880e49cbb01e3ef3e04f90ae3e8ff24303bb13181bebb1791b8edcfc020e1b585b6be7e7f24448b42802cfd81c8e42080134440cb8b842decd5bb304b0761a083b104827dc1bc27e2788f1fa7474051334bc98d4cc04065f7d100c1db089d886460760371673b2c15fc79848df0ee4aa82422fa17722e749a706f8bebb792bca63e8bf81a4dc901d2d62136d3fcc2129ed81436dd5105c4253c501e7d7406bed200108952461d627136c2c10a0e585576d60214382029aff008c3e9504f8fc1d10154dd804f7d818271eec6131e59638226df80be52e81fe84b43b62207d564cfb87d025801fe0b0fd604acc48960bdc1043fd7b27d084a54481293c7d20fa228353f182210063aa9484213079c64249fb0a25503836ac711d70e0304c96549b85025062667a00b97d01948aa6e9a7a31f3475a091a9264159509527240243558058bee4103ba9150a30212656dd81e259cc1a014ca7e5a1fa6481f87dc81441a24b3269c6084b1fa807b96bda8ffa262f602e88d09dd8f74c6a5023ba6e0129989a512ca89f8c873c2193a19a0877a15340b942017fb880d54c95d9d500dad45846c39c506702831280c55fc722c2065c2d754f724736c47ee07ed76b4491f80153f26514f412a708fa7fc4478ea9fa0fe0400ab9249ce2064ba35230d9941eac0e197a0491315430223348b7e2241d14f32ca5092f04620a4ffd08429b0b2ec012b4805073e191c2fcaba4027b3501e2411d682ef2e4afabfa10acc16440c9f19ed1801112f5ac28a520292e8db12d65d0196a51e1326cda7835c29cb8bc8987208d363004806c1a7a10c256fb4136462a1b8100851f28c480db8d185cdc2156d804dbe9eec2199534e52318c05b8a22268fbb62b03262cc134682d9ba40c0d522b0962338308240419f76c443ec8a9e3f904e4754f6558163e056b047f43e4672c5bd9c9b813ea17c8841be7066431656114c369a64222d39287760d87cc2bf4a5b42620e500382dc0c4313ed8e8d10818127c120c416a301d01100bde20b36fc1005f5ed107b0d78c2a25922c2244bf6d80b38767953674021803275608349816f5cdab08942127a87ba04349f118e27df7d02324b3864047309720acf8640283ca0e5636ec1f394a9e44a8491f4107350b5ff000f3e10c8e39c205259d0988384c21b820cb775267ee51a2d6e0b213ed152a248a00a23948c822436ced9dd18e58781168871aabc209e25483bbb18ff00152f2f30ae6f9622bc9b10c48c61bef02b462192b1ce7e02097452c6efea0763b01053600a345c8ee342615f486cc0d972e91cc14260545c2d1c022e502a4b80a292db48117b3380045fb6c10f562710010927493b059e1124c1480b512e0aa40b96c29c6805c4b46f07987f4a65507dbfdc77140cb6c4d7d508722a9c80def432fa0495d4fdc6dcf009fe7f100b026e40c5e435d2720e4739402e494051ec04924d96992606b34bb2567e58090950aa121d0f388709d770638413d0169120182f081012ae66036a44012182302b125c0303da75497d08fbe2b1364910d372002e4042324b0926235250177941a28623bb3435b992c01534aa8021904a0d8c265cc2d835e6c9cab9afa68870c2894699e81c687dc4057d1e5010ae9ce3f20dbe798f95d300820826286a87c90d2882c33ec234260c83ab229064946c029f36ce180711444031b26d4425059542230b4c113875823a6402a65813ae06d09f80e197aec5b43031a9ec360a9c89bf000aa3095c0059c0a63285202e942600d7fef100e4bf6115823941f205038da43276ad08342082c0989cd06ca118e4b5756110f1dcb375c0314283493418acc59a18021edaf24c5277780ad44266ae0343a39259c18c9e2903962c71738c828222619f8b1097d0b4ce08701249b01d6d5c05dad0e0e5adc03b2f7d192b084228ad0221865ae836094018410456a36c404174f1c31df8f034209820a358411763e64ddde4ea990114914b87fd97c0e1265e189eeb9346dbe9c91e278b0625b940783671216945f3d6a0dd20a356422e112d52f7d0e1e7b3d0148a480542252815b5848656a80f6a96c08a64024a6171a04a2ae1b300102f814a5fceb7dde1a38087f631795bc20820a3de34bb89125154097524b87270c5dfe0471e4be0ee3f9207b4841a1fb9258fb0562b71b15012a92f805eff001f71cc4daa25ef9594936780af62e8473767736c692086fb46ea9801a29ee08308129a91dfaba78d20bb4eb664c842243bce14c37ec3a0af8bfad932841a7a5a158d0d60dda1883da8e44de0fde8fe408aa51157012126abeff712a32e532b297c0823c0320016c250a33ba015d321c17f09098508982d4db9d0a2332726dddf912c6a1ca0708013eb818908f9056e207cc927d0646250777bf6c367048999afd8607736b747f9e452291c3d25a634f06b2342f068436121e86ac6dc42424208d0781559a72ca685b87dfc8c7371f625891085005506081ef71005a65c0ac7a801abc64cba19055bae0dee03b3ae1d77636ccf7b2169e1a40a16923bbd28046fda219a24413c1e2810a19201cb99210be864470135f85e61f234f1b843a40b6355e0fa17a0e589123488a48a9ca57ccf94287a692e347cb0b42b6cb0ab4db76d119b5de979ff0091f22d449366828f911f4ec308535ad8bb6349037eb8902ada932f83702c3b8ede2088567c0405c480960ce00db9af7b3fb8281305c0baad36fa2811be225648622d796f6a95a7d782124642d34788fa16f6636b20d2458a05e4815f92c4af9e193dd6b8190da105490f4b270109ea39009e30eb83e988389058f62940026e1eda114a6fc1b2021586127780d8eb3931432e5200fa9c0a24a8bb872c709faa1f90dbc124976e9686ea46c0c037349a4dcbb77043344326bbdd920e3de07a9b1bc100d8d436aec291e052fb5215a9a2c37036c97e086c8f2855285ae7431b1843d24fc057378af93e07dd771e51ec816aa4f60a6a921b2e5e4345daa15b01b8ce00458d925a14f26463fc67680a39e0531cb931189c22d34ee49270047ccca4a2f387702f8ee41449d43553dcdcab424b52b916ad6e343cf422f6a3f0250aa47b41a81d0aa24d51f6ec3458f90949aab4a484e4d08697dcf7e7dc83938b00082e4281e801a145d4a4973a64011c686afa148db36764b790174096c1e14a4f1018c72bcc050c94e30157425192064878ba2b97ee39aa1b546e10aaaaa91f79af72e7de7ed8b1863420b310495f81610c77837087146ea879333edbf6e46154a469ad0e58d9117fc852a197445517d147e0434b7e604113c01b032948b0a9680be16559602bdd13b0106f0e99160080416436e600d3d528fb816371de46ddb2a4ececf322c8486b4506c890881d2503f0993a1ac3c1b21ec23fa4a7212d6d410e8a90a64161262c21e69de8669120b06296f49e12800078219a61dd00170b1db0d14527c4acd2c0a13bee08499f231ea92f11d84bd0bdc5a2d7d90eb8289caf75ee26d535f3dca35c40c38c30b1c069508918c59270b795f22ca18d74a6ceecfcd40e75f1c01f4b2db5e0c23538e08d9ef2d34244ac150cf414329c6d6005f8223c5d40139c0063f7280a414213d287b53b6dcb1ca52f0c5089ecd22486fb81b6b91f70e9ca7d102111947da105e078ed34b7131a261bfa55fb8cf5c318ad2e05c8d8baedd4f85ae0f255b6d61836ac143dd1c414ea7f2016610c72727ec03f0ae4c09ed0926913323de8c6a94862a73dccbf04de23b9b803cc2bf620caf0344a171e6cdd576a63df879e1792e061345af2a1a1b818fca24870fe087ec7b1b38d9d7828d24a8370612c7fffda0008010203013f21ff00d191a212bd101594b78c4bfa834251b8e7a27082a86d8a716d9104147b7e949210f644d0a086ac80948d94cf6244e080d8d409b4273fa093565c684a1bec41582edc4dc6317dc70c4c0a884488508ec4fad51ccce1448e049b160ec1d84c5b6284120c1e24e2642274caaf5549cb23589b1cd6243110ca647289124e458e80c188502509cf44fa0eb16344ca4d05812ac9cd8ab0306f8b7163a5a915b44b4414fd370cd0e343708ac492eb422915d5319d5327e971e8a664bb12eaa7a0ee17323e242163d474bf411181202b7024488e2b248af1ac9c2253d147822c8e4a86bf55e02cbc28d14a87a18eb22ae9e1d9b12764c4f26fa01a10e443f4dd0991160e84f1a16f05d0f54284848d13040f3386e8686989c9a35e8c99a62a098981318ba91444381118d1351a18f0496523fa49819468bb828910326270d21752c61a207668da19ae0d3437a4a14c5a448a0dc8a84e8584f4f06e2d0f2d0e3120a0e6fe8b690cd894924a24a2322b62789c2e9b043cba17a3810b7e837037846ad93211450dba41753f40b4094b12a12fadb8437dc91246aa0481b260f14c69e859982a84bc3acb9282372848b73d6d2c636272685a1882f9444ef0c8161b8c710b431890cb3121612c669758dc22466c48433911b52b0c5719a050c21090e584a066de1b28cb5e1e07beaedc3129a152c2193281ac1a9955d2e1e2848d0dd1b08232b705b058e84e574b4bc96f0c62a1232c505846ba210d18925ac6c531a6348dc91ea3d0216b0c78f635d8981e564c9c165ae969a12185587beb6247034358d3a1a841068ac99b14746716b0e24cb2211b794ec5d4eb263c69448843584c892470b15d4dc0e4210508562391a57531387963a1a2964d8811cc21eb0fad91b8211ac584c7435753161618f4705d44a31459d82e042fa192c624cd11c88db0fa7fffda0008010303013f21ff00d181331ba2439e111e84ec9a120d7e9d61498a66d21bea23f48824b11a1e06875d0689232684c80d47e820dd646121181a161a4364ce20620d9132491dbd6501be082c8149484e4b1629c0db1942509c612868491c7a35ea371484b24e07086c4246b8161a30fd20a3095111d106bad5e34b1108128b630f3263b130907247e9a116f1cabab5d2974a4e590b1b9e89c26f05925d44c50888161f4f3d0ba4810d1aeb4344897940d416a1a21c8d03ca16ba5663a565e1e594524a453b6440eba4514c1b04534446899288c9da35f54921e1626324090563702ca241849a9093807a90b8b1730f221296214f544870ca044610dd606417821af62b0b434e5092a3b1b42eed90d3878408212540d47a720d81844448d40a87d434076b0bd8f5a36110922e25924504bf4509084bd94525a70241068dbea54c92a3649069164218c4236c57d3387a1ad58f6251210316ba446cc68b8c70723708aa25604c4f26be8a4c491304a6e3c3261d21ac9c742128a20c4da44c21ba82c6f1646e5945e8242c322203d8902a2c1749a3b0a7c46219365148c6f092370b1a75a522440e843728d1105e5111858791b8a315047342538c70395243316683206851d69084258a1d4891321a648a8d0891e27c2d9049122e4896206e634c336ea4a5e161a58856a328766a0ef078107b0854524ec9e300fc9cc3259a2cb4ea5e49a1123c8a26404d116621194b9c4505a91cb2e192a89fcce2c22886ca2c351d2942188e328da204440c7594e6ab0d89969893a63f626062ddef1be391e12fd031e560d0994caa162887158bacef0f224122ca575ad8d8f28da36131849d14c311034d414718e6082483c243a3934b2fa9087d3b91bc262484812136d92d0d43b1ec8344e164a0c730c63c3df521f4a1dd1062464462ac2704e1e758c94c25121e1885bea43e842d9c945e576028610f344332272cbc2e9fffda000c0301000211031100001048c48648248493373f6db7fb7dbc04812c9a7da7576a2920927f5b026512486186d3781b2964176fb80601257acf638b8250d28827db00081475dd8d12d3021206d2503100925984f5c85265c13bae3cb2026434ab9d55f328e7b7f3225b203610e81b428f072208e6420a6a0028323a4910ba89250e542b7ea004d21ebb524688e48a020e775b84644f495cb55035a1ff00c5a3a7f1b40728a7e49b4fe611e4eb523203c1b3b45645fb5e94050020df102429d91181887be6ba7f8307638254fb635949b2b3051b6352ca08207b0c71b72202a5421ca008048001b961b50a31b563f0b3cc8c40334886007dda16adaf107308c08ae42d098c394b7234213198d3687f4188280499d184f671e10518ad8b7fd1c067c8d1927085a89185d35630914a2e27fd00409a09a08925cb8e3609cd6bcd2cf2678c4ef430eaa6877464b10176d5608456c11d6ed2703908371646fe124ea4155954e741f498ab57f9f92468e367684aff0086e86292bb1253f771614a3a8d0eb772503b7ee604ffda0008010103013f10c5a8f39013e0f805755b8ef7f401edf53f4ca4b57dababed341d25fb8c1a39ff004148f47b4f4ec3917de0dc9a8283a72fa6b3cc83cd16d886a789cf5de01fa1e999c6bf74ad8cc707bf401caf08dcb7ef2c1ecd50bfb1dc67644a12e05528ed0e12bec64958fba33e2f0b2e3eb9980e3a88dd07fe5c0fa3cabc2f2988fca289e18b5831820a3a6c2fb95f475cbd6f0c71a21d74673e776bea5998e513fdc792c9b9075c13f0bc4267f05d2bfcc12d154e3112721ac9a5bdd2a504a5f33088a69acda9f75fa3b8def6c334b12ee3b4ed200178cdd68bcf4bda99354a98bccd67095f7a1ec5082cf2f4cf1af443afbf461d9c5f2ea9acee088e71a2e2dc7db5a32a9e910b12707b9f7702aa053f7e1365187f5fb566ee49a89596196518cc581db6b369abeb2ff98427cee9fc7e28809fec15e1b841a7b14553ebf356996be9accf7c86777636c5295e2cc8206dc1a62b26e928702e9a30d67da50387520206de19bbbac6728cfddcd7d98beacca1f5b830074937856a5466bae34e267129a15a3a5b5b23e0a3f6b04bf2756153cf98e416d356e3e719de04cefe15a6feab5be6a668ae3023eec7356fb0e0c924d8dbf8d0d1a8b711f97705e73ca7107093d9dfc0abf73873462baa287c2bb65caf3a76e296b2426ad0ff00666e388619ccae1eff00b672b98ff162b0647adf03ae3702de82f5662700bccd9544f96a32cb5523e626234a2cada1186fb3145a90e70b37f24aea37f4b8833f38714468149f35b80617e3c91c5910b7676bfcc3e631a70e4701cdec26a0431ea21c7e4823c3d4baac50f14d732fbb8b4433df01125a76e3cd435d7d857e807b613786d1a724e434711e1ffb6ccc98937f65fc58aa36245106c573a1b7a21f61c6b5d0c6d7aa11cd0ea08bceae707ebc45f57764872ce58ea3df271f885398e09bada927f7879b3bf2d3f24c4a437d67c139770a574d1dc5a7cdf2dad9135d7a286fe3ab45d10760082d63f6120dfdd3fee0d6cab2739c9d77c048c5ef4f00ee714f0812d2cd38221420ad96576ece906a3467fa1617ec9fb075d3d9fb7ce29acd357d854f3e047112314dedcf40c0b5b31124f0158ea162ea8351d29680ff0045c188233726f9c7f0cf3d26fb590d76c68d76841d2c38e00c0d5f80468a5b5f008930c9b5707e2a21fbc08156a486d3bc5d83f12821aa7b9be6ff006597c9b38fbeca0f1db732ff006894b54eea2165697c49eb855616a9ff007919f6e22b68a48212e5df2778e6fe470b7b64adafda34f97c3bd9b0379de037f07b6acb611a7962a652766cedd6fd8ca9a983868652520b77d58f09a40eea068524c277dfa02c466198eab6d70665aca214dcf5d2a7b9a8187e62fbf872156811a4e1bdf88b356361212a571f2071777cba1590820386ddcf543d4b5d45a694bf0e5f8c0ec9a4bf6e73fa7cc2603b80e6d227e07800fb802523b9d2d15c4f345b8181894bdb303ec02076934a591caf8f4dc1be57a66bd0733d68e19d9112fc380b4e7e4344c57da0e5a3976557f116eda0bddb78d068c029b1bc3cf99fdf73dfe62f6a3c81b6d0f905e26f9a8b949daef0a562102668ed64d098262248662a880fba76bd1980b23798ef7f408f782c76e2e53ef2e4f1cd8d7d43619a9aac4b04e19ea75088d89086f8e9f34215adc85031ff005278ef85b7db2b6e39bfaf646e0078ff00a106b628dac4e3710a3b14ca0deffe18330262ba987cdb9e091333fb9af9ecbb3715249eab1caa65a6ca69e69dcfce88d8606db9253f0f3818df01791227682ed9c2b06efa442570a84e6eb5c744eb489a85c277d1611dc586faa3490a5d4c412541fe258e1fb7ea52746436cd628d5edf0e2e26831b4d0d2e035535786a1658a52037b520587b0ff2a5befe0bae8c2125f5c6abc0429670e1c73238d4f302891c150bd8e05c9c037ff5fc96320dbfc222488a33eca8ce0ea93ecee429c237caac3f199359abd932113a843dd747387fa99b08eaad6878ca80f79f692174a74af30b6fac6260c2fc251c4a89394d06532ddf2c1f53d02b1c2dd6accaab00f893325a9a172b28747f5415a190019aaec9d47e6ce328fab892666a931c9875cb4e7c370f7ba38e8df925b86cecd99701239678b68d385c3515c0d2384b93aea4d543b7ec62c7a93d438799c8478342b07cec504541a2d7b2365255e8e8f4c9de69ddc73083db42ece48fb51049a4c336e8b384d486880ebae0985abd832103c5bb29e8c100cb51058b7107d355c74bcd6b29306d8aa922e4470824bed1e1400dae8af1e869ca2a268ef92e0b8a74b47287414d3d3b3528b69a793129fd68043af0ebab11e0565be86ad4e7e94a730dd99c8538d770b46e02f1d484252139cd7126971f6387fb282c5b90f6c719e1f73f158c3093b1681f0512c64def811111e2c055f44f53213a7c06f224d55e68985e13914f8e2fdb1b25825734b54158645444c0496276cf60e76090e236ca4b5ae620c021db0a38408690479ccdd2954e34d38be8611acc072216e8d53a9d43fd24e8cb0cac8f82e5b08fdda90e5d100631a0afdf17c8acdd5b88372ec50546f17ea5b18beffe148b8a28c14294745631e14184394e917374eec6c8dfd0fb0e398184a60e1a48324ea246b7a622955a4bc6477ad889b060103f951c2e4ed8ac6dc1a98d7c02155b084854db6fd218e04fc874ee5bed19d3b0b698d30a71a2187fdba3c75c3f96e3b2d57ce590639f2ee3f6cc38d6e54c062109763434c69d2873e818219901a13fe084804b43da80ea53b12727fb10571522f05519c9e17ee3e963f7eb599e691b87c6c55eb81636a64ea862304af29f27d0aa2c73654d6d669bae96f03e094459e0fb15c472a1b0d2a0a4e72b04e98e8684e1d31a0d90e342812633108221f911c9afb14d9ed05c06227802e77c0b68bb3c8fb0a5ff00ee777a23e8d5be482fe28d0b51a21da24521fc0ec94eee73776cd98feb36fa3e568008f88ec298c680b2f86e12d48e4465358d120bb0ca3cb4068e49e36a62839ace0581cd988115120ca055c070869726c79086d07c0734804d8601ab494655372ba1cf71e47c3589cf562b30f9656db16a306998f925bc85aa7005ad9e2fafc679dd8702a2b4b7c2877ba9b4d34cc5053e612436b0a5fbe17ca745025800f9896d41e66e44a56c0249ae34cc38940dff00249348cd7b443b4692372543d17fd1cfb1dc3ef09833c0aa1bd6d072593e1a2c72c212e518fc59dba56552ff0026563a77bf2b9ea0ee2014234d37542099b4fc133426ea088f587e229834363fb8c1c2cbe56a78358a109c876352478d20c31115204289cb167e3f73584f5d85122344aaa13c614ec8bd260d01144e545c198a10f023757d16ea77dec29dbf209ea074462fc48a1d941eeb62dcb6e20feecac54d2e968df7e8a933f1fc940851a88aaa975f904c603b31b719c185396cd4050419332fd866b82668422b1584d75212413842a6b607356211aca26c57973f0ac7344d38e7615d67b8a333d36fb727a46d7b49e766a10c7d22b6d94240b2e8ce6a663ca4d7de7125ee201902e4834976775c6d4c6b44fc128a27a8121ead9cfbfe49b18b237d892a48e020f3434ab3295ab42d3a62325298e8f2af9d591c1c535401f65873d64a4780c5d6c16fe24e7fc07ce78da2a97811da55630ed1d004b6a817b25512d1cdf6cfea781fde147035128ec2242e19c1d45fb0fdb0135f7d15e7ebc70173ef89fecc84588679b5652fb49725e7228cdd49b0712a96873f0144a4dbb89753e4992c9822973f144ba4b4a55851b4b697428940520858dd54f91d30a90ae6499fb0af1ef3b99ebb2dd3ba111e4d25840d2e79d43ee194435892a4a7473a4f75b134b09b4c7f81eb1bab47afe507eccfdd87b52d7719242763c04bb5f93c224e1bbf708da5a263ae5d9772b7b17cb1e8291da8177944a743f6139d1fffda0008010203013f10ff00d7c420c720cc606bf5490571dbc1c5918eb0196b87d123f4574021780ad0d867270351b26304099b1fa6df9b63305885e00cba43f630540d06e8372b132d30ae1fa16c581ca1dd95981a361c82226a84944127902019e09362b8fd0896a07a11c170dd8b202834221291986f88068dc1a8cb95d363e94d0c5e2412e637c04e0bef0216287596430091c1d4fd0885c9146ba8993e8e3afac53e1507a8db1626c75b5e86a84fd21211bfa081469806f4c24910c089786212c96f5d293f4613d05208410ba65aae8c48b43e9265e2f407e97026eadadfa6e964cd97d48a7c9605e91021231fd38bd60ce7186e88e9279faa0332af558b4525d0ad71209d1968441161fa0ee7dd13a04169eb2d96e5a82af56d54c4d208b9f58e22e92f4a67af4ef7d5e6e942626f82cebd2fa1596dd29d43e8026e90003512b71c9188e926f402cac316c67e81293a601811849d20d261e12215865e8f40bc161cb62e8443c8297458e358005e863c5bc01a53d7a7a70108b243c3d742880fab0075c17426a3c8204e0164b58921f4e0506bd2006e32315b17a061bfa631c500f2e908503ce1f5f60fd166137f59ccedc4c8b07958d71af4402196d861fa48e20a23428441d221fa74161c0a1f578e50aca5fac42f5602c124f58b39e38d574237f4032ea8c89da1776c74a646d8b1eca247293a10fd82eecd8ccef91de2716535a236e885a3cc7d47ffda0008010303013f10ff00e491585688d0498ad9a05e9227fa9c8309e0a410284910d4f40b5fa7e1ac22e8395c7a429d21408048f804a0b97dfe990b4f1d985928268210de0f386843e4245f3647c4f58b2894283197cfe8c182992058b421810b6708f02b07fa0c8781c462b290d43838310c43d624493fac24a24642c379e8efe7d2f5659169eb846b7427d364b7399d3dacbe82ba728cd3cc23bbe8d8248a20e44231b368b3adb0dead3195ed430111eabb5c0f7c0ffac59ea09cb5253a414a71175aea4917a1e92cef38ce0197de11a58b4aba002aaf5442ff000927a55ad49ea11f8cb0b1025147ca4683f5e13c9308582ce9f291be8490a3c1e092b28d920a665a13d351468c6712666ae8b129e9ca017884ef9c93ae86dfd21a1018227703364d4c986f41a85878c015837c61e22583e469e9689c58ac3148457d08bf443c094f494a4143b61a8cdc086fbf421e47f4022d6535ce113916025a078946eba034e47290e1166040851423178c4a3e802c321b8c572046057464d048d5965b0b580157d1064109ee4a4c72e346fe800d462ab1083d834e32d1eac9c0442f84ff006783588251599a761318c5a0c4ea5981529634bc3911b9c879e09d0546be46bda912129825de24b62062a19f07c8d855fa22161ec583474c16e167a22b62027a3c10570102540acca6c61c445d27d0518846dd138a84e8228c940d608534c220cea3b175478ae13084e32120458e286cc5882c292722ba45160669e9042e9120c08deab6ed5516641230e0af59a620421a3222c238d960174ee3268ba0d902e13d3418b2976689381909a11efc3b7c7f5e0895ba17bc87043928ac3b227c50fc917dec94c7658f158c7a3fffd9, '@xioang', 1);
INSERT INTO `copropietarios` (`idcopropietario`, `cedulacopropietario`, `nombrecopropietario`, `apellidocopropietario`, `correocopropietario`, `telefonocopropietario`, `fechacreacioncopropietario`, `estatuscopropietario`, `direccioncopropietario`, `fechanacimientocopropietario`, `nombrefotocopropietario`, `formatofotocopropietario`, `fotocopropietario`, `twittercopropietario`, `idciudadcopropietario`) VALUES
(2, '18321654', 'Aurora', 'Zambrano', 'aur@do.com', '0414-7896541', '2012-02-03', 'A', 'Las brisas', '1987-05-08', '2', '.jpg', 0xffd8ffe000104a46494600010100000100010000ffdb008400090606131211151413141414151615181a1815181818171518171616171617171717181c261e171a241918151f2f202327292c2c2c151e3135302a35262b2c2901090a0a0e0c0e170f0f18291c1c1c29292929292929292929292c29292c292929292c2c292929292929292c2929292c292c29292c292c2c292c29292c29292c2cffc000110800c2010303012200021101031101ffc4001c0000010403010000000000000000000000000304050601020708ffc4003a10000103020403050605050002030000000100021103210405314112516106227181910713a1b1d1f03242c1e1f1142352627233821543b2ffc4001801010003010000000000000000000000000001020304ffc4001e11010100020301010101000000000000000001021103122131411322ffda000c03010002110311003f00edeb32b55941995958420ca10840210840210840210b04a0ca122fc6306ae6dfadfd131c4e78d1f84711f3f455b948b4c6d4a2173dcebda71a2ee1e06b6e26664026245e0a9267682ad4634d8f13662f17b6dd4855bc922d38ead75712d6d8912741ba49d8f685cf5d9c3e8d625f258ed1e3465c6b3a0eaa4eae6cd7b470ba645a0def3fa2caf2d69fca2d0fcee98b4df90ba45fda36004f0989fb3e0a91433114dc5956ce1606c244f3f209f56c5b5d6245c8f0b469cfa78aaff5c96fe58a23da2f6ee955a42831dab81746d17009e7a2a453cdded1fdba85b602c4827e816bdb6ca4b2b17b4775db6a6772a9f531246e45f45be3ecdb0cbcba4e6619c55798a951eef171247c52380cfb11873c546b5461ff005711ea342a2e962788dc0f2fa25da791fd96914aeafd85f6c65cf14b1af106c2ac0107fde04475d975f6b81008320e846842f2155a6264d8abd7613daa57c170d2ab35f0e369efb07fa38edfea6dc8841e84428fc933fa18ba62a50a81eddffc9a7939bab4f8a9040210840210841842108350b2b0b28328421065084db30cca950617d6a8da6d1f99c401fba0728544cd3db1e069da9fbcaeeff4696b7cdcf8f802aa99b7b54ab5c83483e847274c8ead8841d4731ed350a0f6b2a3b878adc5b03fec76dbd52e73aa312d7b5fff00241f58d179d7b4bda97d437738b88b93aad7b1f8ba9fd434b5c41dc4da3a89b854b6e96926f4f41d7cd9d78023c6ff00b2694b386bc999046a09d01d157b159afbba664c98bf31e3bfd147e1b31f74c75570e22f22235007e1246db7aae5b95b5d33092247b498e2e73298d5c45ccd81b18f0ea9ce3335a746981c56688277b6a7c15432ded09af55cf703dc80040dc6a01df4f54cfb6d8fe1a44124b9da0d041327efe976bf16dcd6d07da6cedb88abc4d20b7860f8871d3d755be53db1ad87e061702c16554737dd81d7d2c7ea14c53c2fbc60326f3b5b781f25bf49ad39fbddedd4198d6d76588248f19b1075d868aaf8ac3d4c3d6e3683eedda8bdba8034d145f64fb4868cb5c2cdd0fe68836eb6b6bb84be65dba06ab581a492787d493bf89596acba6dda59b590e622a5300dc45c1bc881ac6fa8f2518de2061afe1b921936f1076d878f8273c438389a0825a09235bebf3f8a8766325ce63b5117fdb9f5511352afc4718e1a804c6f78937bf5d2792aaf68bb21c449a42353e5ca3d15b70a059b504b75e3ff001d0c93e253e7e5e5bfecd31de1a45a3c54cba56e3b8e138ba0fa6e2d20b482b7c2e68e69bdd753ed1764c625bc42ee8b5a0799fe572ecdb28a941e5af1107c9746394ae7cb1b1226a36a365be9ba69c70547e1b125a53a73b70aea26b26ed1d7c2d4f7946a3a9bb983a8e44684742bb2f633db4d2ad14f19c345fa0aa3ff0013bfe86b4cfc3c17030eb2c499b20f64d2aad700e690e044820c823982355baf33f61fda5e232f3c3ff928937a4e2607561fca7e0bd03d97ed2d2c761db5a91b1b39a7f131c3569fbdd129742108042108345958598419421083152a0682490001249b0006a495e73f699dba38dc496d33fd9a6619c9c777c75dba2bafb6cedbfbba7fd151777de26b11ab59b53f176a7a01cd70e73903f662769f14ad4c606b75f0faa6187126f61cd30c662788db44416f7f26d725742ec36565ad355e3849d0c6d69d6de4551bb3f977be786881a4f3eabace1697baa629b5b11b833b731f2e8b1e4ba9a6dc73776c57aeeab543498681260ed1a0fdd38c5e20161ef5ac5b2245c1b4e93afa0f2698bc3f086d304713ccb8f268931d16d88c3b9cce10d9eeda3c2fceff007d173ba0dfb3bc3fdca84082e31e423d040f5501daec79756a6d70eeceb70098333e71f76572c8f2834a970bb71acf33e0011a04c3b4dd9b65704cc19045a0b79891b6bb5b855a5ff4ad97aa9d8bc387d331a40891078811a73307e4b4c0f136989d398bf21f7d4149e6791e228b0b9a789b13a1e2020ea0e9dd1f0e8a36963c81c0443a61c2f3be91e5e8b78c2fd2bfd4863dc4cc49dfee7629ee57943b1154380868369deffbdd33cbf09fd4d6e1034826373cbacc15d3f041b4d9c2009037b48e204cf4bc45ac07351965a4e38ecbe0e806b6c74e5af10173eae1afe8251c4e46d79247e2026641266359f123d146e2f380459c5a759d8006040f0dbacf34c0f6ca9b4ddd2368931ce7aac755bee2cb429b9962d207081ac6bd7f4bfe89fe5f50b6c092cd85cfdfeea1b2eed336b080db7e590001cf7bfa4d94a61eab2641001d79f4da0aa5f169aa93a9840e12cd7717baaaf6b3b38daec2207101a4011e7afa2b6e11c356933ca7aac668d0e131de533232c76f3a66d94ba83cb4836292c31910baaf6bfb2e2b31c580716b68d79fcd72af72e63c822e0c15d5865da3933c7ad2f496e420356a5cb466de176df60787770625f7e0269b4722e1c44fc08f55c6f28cbdf88acca54c4bdee0d03a9e7d17a9fb27d9f6e0b094a80896b7bc45b89e7f13bd7e4894c210840210841aa10b280547f691ed1db97b3dd5287e25e2c3514c1d1ef1b9e4dde2f6d5d7b43edf53cba8c087621e3fb74ce8069c6fff0051f13e71e70cc731a95ea3aad47173dee2e738ee4a0d31d8d7d57b9ef7173dc4973899249d494d1c56ee292e1ba2062f11dd8e698d36c94be2cdfc13decf60454a838b41b5ef7d2ca2d4c5ff00b0dd9de1636a39864dc38f28e5fb0f357b38302fa40b19da39f2f35a649820293411b7dc137d212b983a4708b8e7b80369dd71e796ebb70c7510b4b0c4bcb8c106d1f2035d93e7b1a2f0d81ce47411f2bfe890796b795844408e9077fd94366d52abc3835c583a69c8ebf7aaa4f57be24abe6dc33dedee2df5bf2481cdb8408bcda753cf6906c2153c64ec79efb9cf74eb32236f0e5e893c6e5029d3e2a751cc7cc4498dff00103622fb7a2d3ac67daa7f1d9987188b11e640d84ee2eaab9f658c2388774c5cc729d20deff31c9672e151d72ebcc9bee394294c5e5a780913aef7b44f84ebe83caf3fcb3bfe91dd86686c9d1c664ebb811e221c79d95bb1b55c74e67c20697dec1a3aaacf64709c24877f91b46d733e165697b649989b6fc86b1ca3e6ab9df56c278a7d60fad88731ce25adbf08b711373254d8c9581a200983d0081fc2695d829d70446a4111b4489f8290c4d68a4e8310db09bed234eba7d2eec8d10a197004c3a20c73bf484fe8609c0f76a4df41a6d737d23eeea818acdaaf14f144ebcd6b4f3aaae23bda74b6bf1e6b5e9b67df4ec396b5ed125f3ca6c796e6ca4dd8abdc193d36f18bae4986ed0d461fc60fafe9a7aa9fc1f699c477e5c37170df0d0f4dd6378db4e48bbd5a4d3e7a7d2ea2f24f66b43138c7baa02581b302209748b9990996599f82e0ce7f849b91d0fd5745ec83bfbaeeacf911c938f732d1c9ab8edc03b5fd987e03175283a4b419a6e3f9a993dd3e963d4150355abd19ed7bb1bfd6617ded3135b0e0b801abd9abdbd4db887811baf3bb84aec71bae7b07ecacb9f8c78b37b94ffe88ef3bc840f35da9553d96e18b32ac3022096977939ee23e055ad12108420108420c284ed876b2965f8735aa5c93c2c60d5ef8903a0dc9d87929b5c87dbd50a84e19dffd603c7fee60ff00f91f028395768b3dab8cc43ebd632e79d068d0346b46c00b28d43ecb20dfefcd4a1814d14a9dd2ed62cb5b1251086c50ef1f1576ec0e5e5cf6e800b9b797dd953aad39a91d575ef67394f778888f8dbc39ac792ea36e39babce1a9c340d605b7fd146e3ea0682675dc6ba7537f45255d86604fcbd4a82cc980dde5a1b3a4c931e31f3dd715f5db3c57734cecb9c381a5c6749b78262fa6e702e790d8fcbc57bf33afa2739c67a183b8db447e51e8449e4a89997686a8718b4adf0c36c33cd6b15a9b4900f84cdadadf41fba5b1d816d4a31a4cc137880623c3e208eab9bff575090493fcab86479ab8b035c6081aec63ecfc55f2c74a6396ceb29aa22f008b91d5baefaea9ed4cd5a40d04888f2eb6b027a881c8aab66d89346b120c075faf10899f9f9ac33125cd90e3e1e234f9aaf5fd5bb244e7cca6e8e2d6222e05a0dbe09cbf3c0e1dd04ee798dff7f5548c651707037fb3b29ccbf1261a2c3704cdcfdf868a6e11599b4c4e74e355b2620f97decac956b87b00d88324448d27c45fd02a9e6b9797779ba81e653ccb73c9a65a4438081accf86fafcb929b8f9e1dbdf4d733a7c3c45dbfacd8c7c8a88c3bef2354f739ae5eee800e9f7afdc265873b755b4f8cafd4851ae1b79bfca6274929e333491f8a236222750636e6b1d97cd3094aa3ce2e83ebb0b086b5aee13c5b3a645b5f828ea385258f7ddac1317de600eb78ba9d23699a39a3c36c789bb5c188d2c345dabb039af1fba713a8027c42e01806c8e733f330bb7f6619c1429f0dbba0c9b6c396a561c9ac755af1ef2dc7585cff0039f63183af5cd60e7d2e2771398d8e09264c48ee83c95e7035f8e9b5dcc0f5dd2eb7fac7e12c2e19b4d8d630435ad0d68e400803d12a842902108402108402639ce4f4f1345f4aa896bda4751c883b10403e49f2107953b65d92af81aee6556f7493c153f2bda371ea2ca09a57ad7b41d9da18da4695760734e87f334ff934ec579d3b6fecfabe5cf25c38a89710caa343b80e1b3a3e45040b4596c69936172e2000379b2d680b2b37b3ec07bfcd30cc8901fc6e1b45305f7f303d54d5618e27b0389a0f06bd37b27722deabae76570a198669b8b5b4babf665806d6a4ea6f008708fa1f5556c0e18328869b70c8f42b979b6e9e245e37101ac24ba00926fcb527f9dfcd739ce736a95dc5dc7ee99a34360b88b5a758e8a63b5d9b92e7539b0d4444c1d072d7cd51b39ce0d98df03b83b58f255e3e3fd5f933fc6d89cc5dc2449316324cccc6f6f4e4abb8ea9736fb1ba90c6e5989661db897b3868d47f0b1c63bc4499683722c7bd6d0a8d687d46388692d6c4981dd9b098d013bfd5744c74e7b764a857e1f2fd14b50c5f0f8c5fa697eb375061b78d13da4e8d4cf24b087fda0717341b6b03efc5670f4c31a0137b18d74e9e7af44cbde1a8f0459adf227c39ad6be20b8f08f351afc4eff004a62713361f5beff007e0b4a7897b63bbe4b0c6de0027c13ba396d43f923c4ecada576199d4d9d6fe5278ac387f79963f3f53f72b38bcb8c491e867e09850aa5a6e7cfa28d6be277b6b52a3859c3cd2d850db7117069372d01ce16d81227d427e2931cd1a1e771faf9a48e577969d369b7eca7668853035238bc244da6262dc948557b9fdd3c0ca62e1a01ef403ab4c3b5f0f34de931cde62364ee9522e3e43d137a47b4be4b80352a35ba02634b40d7e01760cb40686b7eec152bb1f8263aa4c12d022c625c7f15ed600479ab3670d2d7d2709680e3a6911d573f25ed74df09d66dd3fb3bff0081be6a4d467679b141bd549ae8c7e46397da10842b2a108420108420108420134cd72ba788a4ea555a1ec78820fcc723d53b420f3176c3b2953018975270259334df16730e9e7cc2e81ec4fb1f518e7e32b34b41670520e10e324173e0e82c003bc95d62b6158f8e36b5d17120183d252aa00ab998618b78e2c7889db42ac6a2f35a7a911a4acb9a6f169c7759382f6eb06f6e29ce00f0bee0ebde00037554af96835192e25aeb03200e3930d9db885813fe43915d7bb69959a8de200710bae795f03af76d30f6385bcf4b1e69c59cb8e93cb8d996d0f9b6555384063dd52902486dfba7474b09eeba64102e144d2c196c93200d66cac189a46225e22dc42388c0b02eb39c23fc89d05c0b28d38768bbdce71e449f35a6aa92cfa634308e83c4d80448769d44a6d0e71e11e66340a4710e73bbaddcd80fa6ca4309826d368e7373bc8d77b6c96e913d44bd9eed91a7a6df7a2c60b0f224ee64fd167184bddc0dd06a54b6170a278445a07e876532169d61f00ee0e21ddb6d61f7afa2d28b1c4df51faa88ff00e45f46a0b9e0362267c4852eec5b1ae32750a3d351198cc707552d69b0b4edfb5d31c5d2bdfcd37a85cca848137313a278ea551cde27c01b37f31ea46c3c7556418b2a169ee9f252385cc60dcc7a1f86e98fbb0355873244a8d2769b7b83a0880779b7afa279877360100ce8402413237b442af616b11e8ac193e2c09e7b5f7e7ccdd52c5a55c3b2cde088313b1fd3d77563cfe5f46f2458dac7c953f20c5f7a3583d27e5a6cad94ff00bffdb0627cc42c729eb6c7e3a6f66e99185a40dbb80c6a6f7bca9451d92d61eec3342d00790e4a457463771cf7e84210ac8084210084210084210084210084210098e39ede2009bc14f5c543beb4b8bbaeeb2e4ba9a6984dd55bb418814e66003f7a1d152334cb43c71d3b1f81e9a2befb40c9a9d5c339c009e9af942e7d9063c9a7c2e3f86d7bcc79ae7ebaf63a3b76f2abf568b0c8bb483f84dfd0f2f551388c3c12acb9f500d70708f0b5fe8a37198569671f2da7e5264ade5616691596501df791a081a6bb9beb6db54d332c7100802395faedb2775aa70b24db7f13d7ef750b3c449361cb65766181dc36b49d772a4e860eaf0014dc260ea20c1ea981793c2363f25254b1240b6da7d74f15788a8fc3e5bfdc1ef8b8013ea012074bd92b54ddafe29870d605898bc05be271dde045cfcd1c61e4f134366d61cfa79fc110538c3a41d05f8b7e91e2b4ad55b103d7658c4bc3a0e961227f3010ef8ca6a5bca5066a539dc26afa0e1ba70e92b42e275509628bc8d884ee83b80cedb724d5af2359ea9dd1730db425129fca2bf7bbb037fb2bac764b2d81c47537f4dfef92e3dd9fc4c3da3520e9f25dcf2230c1d1a02e7e4ba6fc7ec4ae16b169246c558a8d50e008dd54a9bc874f330a732fc470983a151c59ebc47262954210ba9804210804210804210804210804210810c63a18545b44292cc1d0c51af6c83aae6e5fadf8fe11c681529398eb483e7f15c7ebe57529567f14b2e48d6e3d25765a6c8fbba619a6554eb89df99bfcd531bb8be9c6b31c48788bb9c0e823f5374cfdd875120df84f32239fe8ad3da1ec654612e65f9458fc25548921c43b522fd4ad71679a07360480dbf846daa8f34499e92a6b1d6a87c3f45155cf140169d4fce16cc8851131af21e1ba74e7ecd4938440e452cd7b6237bc79a21a5181aebcfaad6b545b546c5a5357824c0f3fd1480d5736f7875d6eda92b7a381920baf33bdedcca76f6533a35acb6c5c7e2e71501a30ad67758702dbd8a529556bada1ea896299ba734a01bc247dd3799431bcd049601fc35db1bbac74baed791e2e5838a438fc63583a1f9f45c572c1fdca7b9e307e2bb4b1e0b4348b40e841d8cec4735cdcff00637e1f95314dd6fd14861eaa81c1bdc4c1b9117e63407a7d472852b87ad78e4b29e34c963cbf11c423709da80c2e2785e0a9e0575f1e5b8e6ce6ab2842168a042108042c210650b0b280421081a661f85336c16a758f77c935a1a2e5cfdc9be3f093ce89ad7739b76fc74212f2b15c888f9f3e52b1b1aca64786a03261dc8185cabda165268d5f78d8e13a81f775d0b1349cc771037daf723928bed135b8ac3b9a4f0b82bf1f27bea72c3c71cccaa4b9ae1bc69c88fe533c4b784f0b4759f15258fa25ae68e47e091c508911bebe4bb1c48d6d2e1bfc5274ee6769b259ee2e20697bac8a70378050235ea4364c4ad70a60752b5a9df7740956b41d3441a9aab56b8a57840487f50506ce3c826cf6ba53ba6f0754e0f0e91a8fbfe5128fa588e613ca550158ab871c36dd3ec97b3cfaaeb83c3b9851bd1ada53b2b979ad88611a34ebd42eacc692ebed63d6343f3501d9ecb594acdb40ff00d95a2a538f18fa2e4cf2ed5d5863d617c31e1e1f31e464fcc04fc58f8a60c6cc7fd029e3ce9e3f2509a777b2b1e06af13015597297c9b142082b4e2baacb39e25d0b5e25895d4c1ba16a0a1008958944a0d912b12b1283642c4a2540638b3de4cf8a0a7589777934aba85cd97d7463f080741be9b79ad4c4c13aa5f134a426cfa537fb0552c5e536c7612f26f6b78f22ab799d22d920418f5566388d9da693d7aa89cdb000bb5f23a5c5a0acacfd692fe289daacb1b55bc74c439bf89a3cccfa0f8aa555ab683f70ba862f00e04968bee06ea0f11d94a75dc4b4fbb3bce9d4aeae3e4f355cfc9c7eee39ed678d826d56a1024f9057dabecd6a00087033d3ee76f54a607d9439e66ad56f0807badd66d173e7e8b5ed19f5ae714c9e14b613583fc755d1311ec9cd2266b02d0245a1daf8c7f2a39fd9ea4c16267c53b43ad545f8533b9e90946e54664c8f253389c86a9934df0360754be45d9173ea7f79c4b46d26ff007fa27688d530c2643c438af1a036b9564cafd9f87c17cab561b2e631a1bc361a27c33001b0d06799b79acee57f1a4c67ea1f0fd91a0c3018091a93733f2528cc1060b00025e8bed23eab6b9d552b49a467043b8f43e0a568e343cf511fba4ea3406f4518e17b58ea0aa58b2cb40c9b6c7e5fca5df5803e6a2b00f3b9e49c628dbf54824cb91eff008403d5234aa180b4c43fbbe6a20b065d9bec54a8a8a8d42bc29ecaf329ee92b7c33fcac73c3f62703d09b87a16acb4732b329395995655bca256b2b12a12de5665272b20a0658b305367194ef14131ab6d17365f5d18fc2bc564d5d4ecb6156105f781d1030ab4a4709fe4264f798e137e1317d63629dd7ac0199e70a3ebe286a3559e9ac32c5b430d8778f98f8a698dc2387780d46cb77ba5f3f258ad55e6758490b4c5d9955681d349bfa2c3f1759da98f0597b09d4c251b5dba12480b56642b3de7524db9a8da3866b9dded04a90754e23a47c524cc14b801af452ab5c5b431b6034b2c6560974e9b2718e00380e5fa6b74e30ac6820ec6df143f4f4d13c50535a948b4f81bfd52b56aba41f14b51ac1e0f15bef650b34a4e2dfae89618b1d7c522222267c165ade5fba119abdeb8f44870c689e53302f7f9ad6a30c855d2c5b04cb4ec96c5682eb4c3d82da788e9fc20740c0098e6589e12d1cd3838960b1700794855acff00308acd0def58445efe49216a75b56c97c362e0a83c0e641c2f03eff71ea1396629a0ea14d86e2f187cca5a10aaf4b1e207787a8429fe955e91d0165085d0e6656108402c84210218851ced4a10b0cfeb7c7e1b3ff12d711a0421567c590d996de291e7e0842a4fad49d26896f82cd6164215d5a8f2d126c134c43441ff00a0b2852ce93a7bf89f925f2cd1de050852436cd139cb5bfdb2842b7e2bfa54fe1f34de99f995942a2e56a6a14a536d9a84225ad4d4a4da75f14214055fa1f01f259c2fe01e250841098aaa78df736122fa121f71d542f682abb8c09300131369332639dcfaa10b5c58e445b5dd63c4e9e26de4cea3ea7d53b6d43ccea37f11f24214a0fa8d431a9fb2b2842c6fd6f3e3ffd9, '@aurora', 1),
(3, '19456321', 'Zammy', 'Cristo', 'zam@dlo.com', '0414-4564566', '2011-07-08', 'A', 'Cabudare', '1989-11-15', '2', '.jpg', 0xffd8ffe000104a46494600010100000100010000ffdb008400090606131211151413141414151615181a1815181818171518171616171617171717181c261e171a241918151f2f202327292c2c2c151e3135302a35262b2c2901090a0a0e0c0e170f0f18291c1c1c29292929292929292929292c29292c292929292c2c292929292929292c2929292c292c29292c292c2c292c29292c29292c2cffc000110800c2010303012200021101031101ffc4001c0000010403010000000000000000000000000304050601020708ffc4003a10000103020403050605050002030000000100021103210405314112516106227181910713a1b1d1f03242c1e1f1142352627233821543b2ffc4001801010003010000000000000000000000000001020304ffc4001e11010100020301010101000000000000000001021103122131411322ffda000c03010002110311003f00edeb32b55941995958420ca10840210840210840210b04a0ca122fc6306ae6dfadfd131c4e78d1f84711f3f455b948b4c6d4a2173dcebda71a2ee1e06b6e26664026245e0a9267682ad4634d8f13662f17b6dd4855bc922d38ead75712d6d8912741ba49d8f685cf5d9c3e8d625f258ed1e3465c6b3a0eaa4eae6cd7b470ba645a0def3fa2caf2d69fca2d0fcee98b4df90ba45fda36004f0989fb3e0a91433114dc5956ce1606c244f3f209f56c5b5d6245c8f0b469cfa78aaff5c96fe58a23da2f6ee955a42831dab81746d17009e7a2a453cdded1fdba85b602c4827e816bdb6ca4b2b17b4775db6a6772a9f531246e45f45be3ecdb0cbcba4e6619c55798a951eef171247c52380cfb11873c546b5461ff005711ea342a2e962788dc0f2fa25da791fd96914aeafd85f6c65cf14b1af106c2ac0107fde04475d975f6b81008320e846842f2155a6264d8abd7613daa57c170d2ab35f0e369efb07fa38edfea6dc8841e84428fc933fa18ba62a50a81eddffc9a7939bab4f8a9040210840210841842108350b2b0b28328421065084db30cca950617d6a8da6d1f99c401fba0728544cd3db1e069da9fbcaeeff4696b7cdcf8f802aa99b7b54ab5c83483e847274c8ead8841d4731ed350a0f6b2a3b878adc5b03fec76dbd52e73aa312d7b5fff00241f58d179d7b4bda97d437738b88b93aad7b1f8ba9fd434b5c41dc4da3a89b854b6e96926f4f41d7cd9d78023c6ff00b2694b386bc999046a09d01d157b159afbba664c98bf31e3bfd147e1b31f74c75570e22f22235007e1246db7aae5b95b5d33092247b498e2e73298d5c45ccd81b18f0ea9ce3335a746981c56688277b6a7c15432ded09af55cf703dc80040dc6a01df4f54cfb6d8fe1a44124b9da0d041327efe976bf16dcd6d07da6cedb88abc4d20b7860f8871d3d755be53db1ad87e061702c16554737dd81d7d2c7ea14c53c2fbc60326f3b5b781f25bf49ad39fbddedd4198d6d76588248f19b1075d868aaf8ac3d4c3d6e3683eedda8bdba8034d145f64fb4868cb5c2cdd0fe68836eb6b6bb84be65dba06ab581a492787d493bf89596acba6dda59b590e622a5300dc45c1bc881ac6fa8f2518de2061afe1b921936f1076d878f8273c438389a0825a09235bebf3f8a8766325ce63b5117fdb9f5511352afc4718e1a804c6f78937bf5d2792aaf68bb21c449a42353e5ca3d15b70a059b504b75e3ff001d0c93e253e7e5e5bfecd31de1a45a3c54cba56e3b8e138ba0fa6e2d20b482b7c2e68e69bdd753ed1764c625bc42ee8b5a0799fe572ecdb28a941e5af1107c9746394ae7cb1b1226a36a365be9ba69c70547e1b125a53a73b70aea26b26ed1d7c2d4f7946a3a9bb983a8e44684742bb2f633db4d2ad14f19c345fa0aa3ff0013bfe86b4cfc3c17030eb2c499b20f64d2aad700e690e044820c823982355baf33f61fda5e232f3c3ff928937a4e2607561fca7e0bd03d97ed2d2c761db5a91b1b39a7f131c3569fbdd129742108042108345958598419421083152a0682490001249b0006a495e73f699dba38dc496d33fd9a6619c9c777c75dba2bafb6cedbfbba7fd151777de26b11ab59b53f176a7a01cd70e73903f662769f14ad4c606b75f0faa6187126f61cd30c662788db44416f7f26d725742ec36565ad355e3849d0c6d69d6de4551bb3f977be786881a4f3eabace1697baa629b5b11b833b731f2e8b1e4ba9a6dc73776c57aeeab543498681260ed1a0fdd38c5e20161ef5ac5b2245c1b4e93afa0f2698bc3f086d304713ccb8f268931d16d88c3b9cce10d9eeda3c2fceff007d173ba0dfb3bc3fdca84082e31e423d040f5501daec79756a6d70eeceb70098333e71f76572c8f2834a970bb71acf33e0011a04c3b4dd9b65704cc19045a0b79891b6bb5b855a5ff4ad97aa9d8bc387d331a40891078811a73307e4b4c0f136989d398bf21f7d4149e6791e228b0b9a789b13a1e2020ea0e9dd1f0e8a36963c81c0443a61c2f3be91e5e8b78c2fd2bfd4863dc4cc49dfee7629ee57943b1154380868369deffbdd33cbf09fd4d6e1034826373cbacc15d3f041b4d9c2009037b48e204cf4bc45ac07351965a4e38ecbe0e806b6c74e5af10173eae1afe8251c4e46d79247e2026641266359f123d146e2f380459c5a759d8006040f0dbacf34c0f6ca9b4ddd2368931ce7aac755bee2cb429b9962d207081ac6bd7f4bfe89fe5f50b6c092cd85cfdfeea1b2eed336b080db7e590001cf7bfa4d94a61eab2641001d79f4da0aa5f169aa93a9840e12cd7717baaaf6b3b38daec2207101a4011e7afa2b6e11c356933ca7aac668d0e131de533232c76f3a66d94ba83cb4836292c31910baaf6bfb2e2b31c580716b68d79fcd72af72e63c822e0c15d5865da3933c7ad2f496e420356a5cb466de176df60787770625f7e0269b4722e1c44fc08f55c6f28cbdf88acca54c4bdee0d03a9e7d17a9fb27d9f6e0b094a80896b7bc45b89e7f13bd7e4894c210840210841aa10b280547f691ed1db97b3dd5287e25e2c3514c1d1ef1b9e4dde2f6d5d7b43edf53cba8c087621e3fb74ce8069c6fff0051f13e71e70cc731a95ea3aad47173dee2e738ee4a0d31d8d7d57b9ef7173dc4973899249d494d1c56ee292e1ba2062f11dd8e698d36c94be2cdfc13decf60454a838b41b5ef7d2ca2d4c5ff00b0dd9de1636a39864dc38f28e5fb0f357b38302fa40b19da39f2f35a649820293411b7dc137d212b983a4708b8e7b80369dd71e796ebb70c7510b4b0c4bcb8c106d1f2035d93e7b1a2f0d81ce47411f2bfe890796b795844408e9077fd94366d52abc3835c583a69c8ebf7aaa4f57be24abe6dc33dedee2df5bf2481cdb8408bcda753cf6906c2153c64ec79efb9cf74eb32236f0e5e893c6e5029d3e2a751cc7cc4498dff00103622fb7a2d3ac67daa7f1d9987188b11e640d84ee2eaab9f658c2388774c5cc729d20deff31c9672e151d72ebcc9bee394294c5e5a780913aef7b44f84ebe83caf3fcb3bfe91dd86686c9d1c664ebb811e221c79d95bb1b55c74e67c20697dec1a3aaacf64709c24877f91b46d733e165697b649989b6fc86b1ca3e6ab9df56c278a7d60fad88731ce25adbf08b711373254d8c9581a200983d0081fc2695d829d70446a4111b4489f8290c4d68a4e8310db09bed234eba7d2eec8d10a197004c3a20c73bf484fe8609c0f76a4df41a6d737d23eeea818acdaaf14f144ebcd6b4f3aaae23bda74b6bf1e6b5e9b67df4ec396b5ed125f3ca6c796e6ca4dd8abdc193d36f18bae4986ed0d461fc60fafe9a7aa9fc1f699c477e5c37170df0d0f4dd6378db4e48bbd5a4d3e7a7d2ea2f24f66b43138c7baa02581b302209748b9990996599f82e0ce7f849b91d0fd5745ec83bfbaeeacf911c938f732d1c9ab8edc03b5fd987e03175283a4b419a6e3f9a993dd3e963d4150355abd19ed7bb1bfd6617ded3135b0e0b801abd9abdbd4db887811baf3bb84aec71bae7b07ecacb9f8c78b37b94ffe88ef3bc840f35da9553d96e18b32ac3022096977939ee23e055ad12108420108420c284ed876b2965f8735aa5c93c2c60d5ef8903a0dc9d87929b5c87dbd50a84e19dffd603c7fee60ff00f91f028395768b3dab8cc43ebd632e79d068d0346b46c00b28d43ecb20dfefcd4a1814d14a9dd2ed62cb5b1251086c50ef1f1576ec0e5e5cf6e800b9b797dd953aad39a91d575ef67394f778888f8dbc39ac792ea36e39babce1a9c340d605b7fd146e3ea0682675dc6ba7537f45255d86604fcbd4a82cc980dde5a1b3a4c931e31f3dd715f5db3c57734cecb9c381a5c6749b78262fa6e702e790d8fcbc57bf33afa2739c67a183b8db447e51e8449e4a89997686a8718b4adf0c36c33cd6b15a9b4900f84cdadadf41fba5b1d816d4a31a4cc137880623c3e208eab9bff575090493fcab86479ab8b035c6081aec63ecfc55f2c74a6396ceb29aa22f008b91d5baefaea9ed4cd5a40d04888f2eb6b027a881c8aab66d89346b120c075faf10899f9f9ac33125cd90e3e1e234f9aaf5fd5bb244e7cca6e8e2d6222e05a0dbe09cbf3c0e1dd04ee798dff7f5548c651707037fb3b29ccbf1261a2c3704cdcfdf868a6e11599b4c4e74e355b2620f97decac956b87b00d88324448d27c45fd02a9e6b9797779ba81e653ccb73c9a65a4438081accf86fafcb929b8f9e1dbdf4d733a7c3c45dbfacd8c7c8a88c3bef2354f739ae5eee800e9f7afdc265873b755b4f8cafd4851ae1b79bfca6274929e333491f8a236222750636e6b1d97cd3094aa3ce2e83ebb0b086b5aee13c5b3a645b5f828ea385258f7ddac1317de600eb78ba9d23699a39a3c36c789bb5c188d2c345dabb039af1fba713a8027c42e01806c8e733f330bb7f6619c1429f0dbba0c9b6c396a561c9ac755af1ef2dc7585cff0039f63183af5cd60e7d2e2771398d8e09264c48ee83c95e7035f8e9b5dcc0f5dd2eb7fac7e12c2e19b4d8d630435ad0d68e400803d12a842902108402108402639ce4f4f1345f4aa896bda4751c883b10403e49f2107953b65d92af81aee6556f7493c153f2bda371ea2ca09a57ad7b41d9da18da4695760734e87f334ff934ec579d3b6fecfabe5cf25c38a89710caa343b80e1b3a3e45040b4596c69936172e2000379b2d680b2b37b3ec07bfcd30cc8901fc6e1b45305f7f303d54d5618e27b0389a0f06bd37b27722deabae76570a198669b8b5b4babf665806d6a4ea6f008708fa1f5556c0e18328869b70c8f42b979b6e9e245e37101ac24ba00926fcb527f9dfcd739ce736a95dc5dc7ee99a34360b88b5a758e8a63b5d9b92e7539b0d4444c1d072d7cd51b39ce0d98df03b83b58f255e3e3fd5f933fc6d89cc5dc2449316324cccc6f6f4e4abb8ea9736fb1ba90c6e5989661db897b3868d47f0b1c63bc4499683722c7bd6d0a8d687d46388692d6c4981dd9b098d013bfd5744c74e7b764a857e1f2fd14b50c5f0f8c5fa697eb375061b78d13da4e8d4cf24b087fda0717341b6b03efc5670f4c31a0137b18d74e9e7af44cbde1a8f0459adf227c39ad6be20b8f08f351afc4eff004a62713361f5beff007e0b4a7897b63bbe4b0c6de0027c13ba396d43f923c4ecada576199d4d9d6fe5278ac387f79963f3f53f72b38bcb8c491e867e09850aa5a6e7cfa28d6be277b6b52a3859c3cd2d850db7117069372d01ce16d81227d427e2931cd1a1e771faf9a48e577969d369b7eca7668853035238bc244da6262dc948557b9fdd3c0ca62e1a01ef403ab4c3b5f0f34de931cde62364ee9522e3e43d137a47b4be4b80352a35ba02634b40d7e01760cb40686b7eec152bb1f8263aa4c12d022c625c7f15ed600479ab3670d2d7d2709680e3a6911d573f25ed74df09d66dd3fb3bff0081be6a4d467679b141bd549ae8c7e46397da10842b2a108420108420108420134cd72ba788a4ea555a1ec78820fcc723d53b420f3176c3b2953018975270259334df16730e9e7cc2e81ec4fb1f518e7e32b34b41670520e10e324173e0e82c003bc95d62b6158f8e36b5d17120183d252aa00ab998618b78e2c7889db42ac6a2f35a7a911a4acb9a6f169c7759382f6eb06f6e29ce00f0bee0ebde00037554af96835192e25aeb03200e3930d9db885813fe43915d7bb69959a8de200710bae795f03af76d30f6385bcf4b1e69c59cb8e93cb8d996d0f9b6555384063dd52902486dfba7474b09eeba64102e144d2c196c93200d66cac189a46225e22dc42388c0b02eb39c23fc89d05c0b28d38768bbdce71e449f35a6aa92cfa634308e83c4d80448769d44a6d0e71e11e66340a4710e73bbaddcd80fa6ca4309826d368e7373bc8d77b6c96e913d44bd9eed91a7a6df7a2c60b0f224ee64fd167184bddc0dd06a54b6170a278445a07e876532169d61f00ee0e21ddb6d61f7afa2d28b1c4df51faa88ff00e45f46a0b9e0362267c4852eec5b1ae32750a3d351198cc707552d69b0b4edfb5d31c5d2bdfcd37a85cca848137313a278ea551cde27c01b37f31ea46c3c7556418b2a169ee9f252385cc60dcc7a1f86e98fbb0355873244a8d2769b7b83a0880779b7afa279877360100ce8402413237b442af616b11e8ac193e2c09e7b5f7e7ccdd52c5a55c3b2cde088313b1fd3d77563cfe5f46f2458dac7c953f20c5f7a3583d27e5a6cad94ff00bffdb0627cc42c729eb6c7e3a6f66e99185a40dbb80c6a6f7bca9451d92d61eec3342d00790e4a457463771cf7e84210ac8084210084210084210084210084210098e39ede2009bc14f5c543beb4b8bbaeeb2e4ba9a6984dd55bb418814e66003f7a1d152334cb43c71d3b1f81e9a2befb40c9a9d5c339c009e9af942e7d9063c9a7c2e3f86d7bcc79ae7ebaf63a3b76f2abf568b0c8bb483f84dfd0f2f551388c3c12acb9f500d70708f0b5fe8a37198569671f2da7e5264ade5616691596501df791a081a6bb9beb6db54d332c7100802395faedb2775aa70b24db7f13d7ef750b3c449361cb65766181dc36b49d772a4e860eaf0014dc260ea20c1ea981793c2363f25254b1240b6da7d74f15788a8fc3e5bfdc1ef8b8013ea012074bd92b54ddafe29870d605898bc05be271dde045cfcd1c61e4f134366d61cfa79fc110538c3a41d05f8b7e91e2b4ad55b103d7658c4bc3a0e961227f3010ef8ca6a5bca5066a539dc26afa0e1ba70e92b42e275509628bc8d884ee83b80cedb724d5af2359ea9dd1730db425129fca2bf7bbb037fb2bac764b2d81c47537f4dfef92e3dd9fc4c3da3520e9f25dcf2230c1d1a02e7e4ba6fc7ec4ae16b169246c558a8d50e008dd54a9bc874f330a732fc470983a151c59ebc47262954210ba9804210804210804210804210804210810c63a18545b44292cc1d0c51af6c83aae6e5fadf8fe11c681529398eb483e7f15c7ebe57529567f14b2e48d6e3d25765a6c8fbba619a6554eb89df99bfcd531bb8be9c6b31c48788bb9c0e823f5374cfdd875120df84f32239fe8ad3da1ec654612e65f9458fc25548921c43b522fd4ad71679a07360480dbf846daa8f34499e92a6b1d6a87c3f45155cf140169d4fce16cc8851131af21e1ba74e7ecd4938440e452cd7b6237bc79a21a5181aebcfaad6b545b546c5a5357824c0f3fd1480d5736f7875d6eda92b7a381920baf33bdedcca76f6533a35acb6c5c7e2e71501a30ad67758702dbd8a529556bada1ea896299ba734a01bc247dd3799431bcd049601fc35db1bbac74baed791e2e5838a438fc63583a1f9f45c572c1fdca7b9e307e2bb4b1e0b4348b40e841d8cec4735cdcff00637e1f95314dd6fd14861eaa81c1bdc4c1b9117e63407a7d472852b87ad78e4b29e34c963cbf11c423709da80c2e2785e0a9e0575f1e5b8e6ce6ab2842168a042108042c210650b0b280421081a661f85336c16a758f77c935a1a2e5cfdc9be3f093ce89ad7739b76fc74212f2b15c888f9f3e52b1b1aca64786a03261dc8185cabda165268d5f78d8e13a81f775d0b1349cc771037daf723928bed135b8ac3b9a4f0b82bf1f27bea72c3c71cccaa4b9ae1bc69c88fe533c4b784f0b4759f15258fa25ae68e47e091c508911bebe4bb1c48d6d2e1bfc5274ee6769b259ee2e20697bac8a70378050235ea4364c4ad70a60752b5a9df7740956b41d3441a9aab56b8a57840487f50506ce3c826cf6ba53ba6f0754e0f0e91a8fbfe5128fa588e613ca550158ab871c36dd3ec97b3cfaaeb83c3b9851bd1ada53b2b979ad88611a34ebd42eacc692ebed63d6343f3501d9ecb594acdb40ff00d95a2a538f18fa2e4cf2ed5d5863d617c31e1e1f31e464fcc04fc58f8a60c6cc7fd029e3ce9e3f2509a777b2b1e06af13015597297c9b142082b4e2baacb39e25d0b5e25895d4c1ba16a0a1008958944a0d912b12b1283642c4a2540638b3de4cf8a0a7589777934aba85cd97d7463f080741be9b79ad4c4c13aa5f134a426cfa537fb0552c5e536c7612f26f6b78f22ab799d22d920418f5566388d9da693d7aa89cdb000bb5f23a5c5a0acacfd692fe289daacb1b55bc74c439bf89a3cccfa0f8aa555ab683f70ba862f00e04968bee06ea0f11d94a75dc4b4fbb3bce9d4aeae3e4f355cfc9c7eee39ed678d826d56a1024f9057dabecd6a00087033d3ee76f54a607d9439e66ad56f0807badd66d173e7e8b5ed19f5ae714c9e14b613583fc755d1311ec9cd2266b02d0245a1daf8c7f2a39fd9ea4c16267c53b43ad545f8533b9e90946e54664c8f253389c86a9934df0360754be45d9173ea7f79c4b46d26ff007fa27688d530c2643c438af1a036b9564cafd9f87c17cab561b2e631a1bc361a27c33001b0d06799b79acee57f1a4c67ea1f0fd91a0c3018091a93733f2528cc1060b00025e8bed23eab6b9d552b49a467043b8f43e0a568e343cf511fba4ea3406f4518e17b58ea0aa58b2cb40c9b6c7e5fca5df5803e6a2b00f3b9e49c628dbf54824cb91eff008403d5234aa180b4c43fbbe6a20b065d9bec54a8a8a8d42bc29ecaf329ee92b7c33fcac73c3f62703d09b87a16acb4732b329395995655bca256b2b12a12de5665272b20a0658b305367194ef14131ab6d17365f5d18fc2bc564d5d4ecb6156105f781d1030ab4a4709fe4264f798e137e1317d63629dd7ac0199e70a3ebe286a3559e9ac32c5b430d8778f98f8a698dc2387780d46cb77ba5f3f258ad55e6758490b4c5d9955681d349bfa2c3f1759da98f0597b09d4c251b5dba12480b56642b3de7524db9a8da3866b9dded04a90754e23a47c524cc14b801af452ab5c5b431b6034b2c6560974e9b2718e00380e5fa6b74e30ac6820ec6df143f4f4d13c50535a948b4f81bfd52b56aba41f14b51ac1e0f15bef650b34a4e2dfae89618b1d7c522222267c165ade5fba119abdeb8f44870c689e53302f7f9ad6a30c855d2c5b04cb4ec96c5682eb4c3d82da788e9fc20740c0098e6589e12d1cd3838960b1700794855acff00308acd0def58445efe49216a75b56c97c362e0a83c0e641c2f03eff71ea1396629a0ea14d86e2f187cca5a10aaf4b1e207787a8429fe955e91d0165085d0e6656108402c84210218851ced4a10b0cfeb7c7e1b3ff12d711a0421567c590d996de291e7e0842a4fad49d26896f82cd6164215d5a8f2d126c134c43441ff00a0b2852ce93a7bf89f925f2cd1de050852436cd139cb5bfdb2842b7e2bfa54fe1f34de99f995942a2e56a6a14a536d9a84225ad4d4a4da75f14214055fa1f01f259c2fe01e250841098aaa78df736122fa121f71d542f682abb8c09300131369332639dcfaa10b5c58e445b5dd63c4e9e26de4cea3ea7d53b6d43ccea37f11f24214a0fa8d431a9fb2b2842c6fd6f3e3ffd9, '@zammy', 2);

--
-- Volcado de datos para la tabla `tipocondominios`
--

INSERT INTO `tipocondominios` (`idtipocondominio`, `codigotipocondominio`, `nombretipocondominio`, `estatustipocondominio`) VALUES
(1, 'TC-1', 'Edificio', 'A'),
(2, 'TC-2', 'Conjunto Residencial', 'A');

--
-- Volcado de datos para la tabla `condominios`
--

INSERT INTO `condominios` (`idcondominio`, `rifcondominio`, `nombrecondominio`, `direccioncondominio`, `nombredocumentocondominio`, `formatodocumentocondominio`, `documentocondominio`, `interesmoracondominio`, `tiempomoracondominio`, `nombrefotocondominio`, `formatofotocondominio`, `fotocondominio`, `estatuscondominio`, `idciudadcondominio`, `idtipocondominiocondominio`) VALUES
(1, 'J-111111-1', 'La Florida', 'Cabudare', 'a', 'a', 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071312121512131415151517171d18181818181d1a1c1c1a181d1e1f1e181c1f1d1d2a201c1c251d1c1c22312125292b2e2e2e1a203338332c37282d2e2b010a0a0a0e0d0e1b10101b322420242c2c2c342c2c342c342c2c2c2c2c2c2c2c2c2c342c342c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2cffc000110800c2010303012200021101031101ffc4001c0000020203010100000000000000000000040503060002070108ffc4004010000201020403060306040503050100000102110321000412310541510613226171813291a114234252b1f03362c1d1071572e1f12492b27382a2c2d216ffc400190100030101010000000000000000000000010203000405ffc4002f110002020103020502050501000000000000010211031221311341042232516171813391a1d1e11442b1c1f052ffda000c03010002110311003f00b868c7ba70c6b656fbe06ee4e3d48cd3391a68802e360b89bba3d31813075008b463dd187393e0c59658e9e96c4c3811fcc3e589bcf05b58fa24210b8dd170d2bf08706de2181df24ebbae0f522fb834b095cd2c081718dd732a79918828e45889db0665387dc16bf96232d08a2d44b4541bf5c6572cbb0f5c10c14580c4156a8db10bb2806d0779c6f45c0c493f2c47ddced030d663d15e304228613b9c4429489381eaa69e6718c4959e4dc0c652cb23291cf70702a9c6e1e3961b7ec0d8654b4c41f9e33bcb58e16be63963ca4e498e78da1f20d4829ea91d7db02d625bae35a998388daa13865103912212a6e705d3cc83cc616b3138d061b4262ea19be602d8df03d3aeb209fa89c653cb6a59c78326648e78c944cdc86541b50b0f0e274a31893234b4a05b1c124e39a53df62a9012e5e4e26148f5c4f8f09c2ea61a34a6a06248c46ad7c4b80cc7918cc7b8cc00950d738dc1c79529463290137c75da214c2106ab6f82f2d94821ad63d31150a816d6c1a871394df61d4507ab4e3ddb11d3702d6c419de234d26584e22509f3181849b61555ed0a9d813811f8dbfe181f5c514242ea459f45b11324610af685f981f5c43578ed43b40f6c1e9c8da91600e003e7816b65db7fa617e5b8e7e617ea313d5e32846e4f9463549335a64f4d310e62a85dc81eb85398e26cdb1d23cb7f9e01669b9c3a83ee2dfb0daa714001024e04a9c4dc9991e9180b1ae28a2816c3ff00ccdff97e58c7e2ce760a30163cc6a40dc6397e25c9c5ba8df0ca866296fac5fdbf5c56c633563346458eabd1130e3e63fa623f091633e98af6ac7aaf1b18f4c0fb86be07f5134f3bf4c682a6133e618eec7e78d4bf9fd718d458a9d5c4f42adee71555ac46c4fcf128e20fd6701a097dca660118d9f3006285fe71546c63d06343c4ea9fc6df3c4ba63d9d056b838951a71cf071bae3f1fd07f6c7bfe775ff00391e6001fd30ae063a0547037c68999071ce1f3750992ee4f593881aa92664cfae19635ee0b67476e20b3b8c6639d7787a9f9e3cc374e26b639abc4d58c881889b880ff8c57d2b75c48b5075c36c253199cf3723894714a9f98e150f5c48b304c131bc0db0d713530e6ceb9dd8fcf11ebc4106c22ec257cc01323a88be03cc7100b302637f7138daa2814c67ab1b6bc28a1c4b569b6fe7862809c1d566a25353185f1a51cbb398517f9620a6daacb7bc5bae06a0d040a98f7bcc0a6a5c8e637c62d59da7e58da91a82756335620524de0c7eff00b63df2db03520e964bab19ac6345a2cc09552c06e40263d7a62027ae06b0e809d78f1aa605ab574c48df6f3f4eb8f32f559d8228124c0c2b986913eac7aa64606aecf4ddd1b75b40137b5fe4703ae7cc45fe430358686518f30470dcb1ad4cbdc4369e5b883fd71ee772c29a6a264ead22de6c3ffafd703a883a6c1bbcc603814b19fd31b53d4d713a46fd07ae1b583484138d6711234eff005c6ecc44122c70bac34630b8c6138f4b1240026d36e9cc9f4c78eb7fd30358749e6ac66a9c6bbdb6c6a5089c6d46a269c6bac72fd303f798de9a4901772607be318df5797d7198f333957462a58488fa89e98cc1b000657c4c4249800c0826fd04c9f6c4d5c6922548d5b4903e726d847c178ea50ac951c3900f8efa8c72307f4c316ed2d22b594a39571a69b15102183733611d3ae1758bb12b563ad74995d8c09837b5b9db0e7b3b9e506a2330536b13076606def8e78dc54ea900289316137f3c0c73658f23d6f063cbfe301cad50133a0f19ce829932ade2550ac01b8f0d3041e9b117f3c29ce541aaa41110bff8b0c5797344046a751881040bd98728883e7fef882a671892cc41d5cb97c8446154a82e436c9668064fe520f9723fdf16c4e334d8b2ae921402cc3c1d4480c77b8917c73da5574e966f846e00bc7979c75c4f4f3e1963c7ab756241b7f30d327dce19cec165ff0023c595036a5a84b060acab6246bd8da6c50dbfb606e11c5291aeff001312563489da7513241b6f6c52b3bc7ead50b4cce941e10a4c0f30060619b372581246df5f9f9e15bb194ab82f1c3d9d5ab6aa4cc244ec34c4dae4753cf90eb83b39c532a1b424b7f344092098b746b6d11cf153cbf16029a2352667802d50e928d7ba88bf3bcede589337c46a2d32b5b2e83503151948a86e0d8cec2dcaff005c061d43eabc51346e11148302649bca02bb092c27a636e0fc629b3696151cdc905522f049dc13cf9f3c5428f137d1a0b30224859e44c998c6f4b8af89596241048a9e2531b8822fd271b50351727ed052a602a6ad5abc5aa54137000f4d51b609a14ea664b554a261c78351110a1674da49b7a5ce28d9de2a2a3cc003711133d4dbc5efd716cec9f6a28d1a74a9b87fbb350b15591e316b8e7380e55c053b7b93f18e2549da9ab58d35002ee59b6d2790f5938328e628d3704218a6e0c8b91216ec49fcd3ed1b5f149cf67a93d60cfa8a480cb0274faeab1c5a78467f21de3cff000f4a901d7502c275480d26da6c679e327b1ac2730d45ea54aa5f660c74f88e9f088806e66dcc437960eaf99cbd54214212b2c0b42833242826369123a6293c678fa1abde50a4b4d54c800101a09bc4f84790b6065e34a2a06397cbe92412ba4cc7302498c66cda8b5d5e2f4d54acbd3222fa445c0d422d245f7ea312713e2146a06d156124321b969d2daac6ff001313fed8a2d7cd3546dbc447c3aa2206f16e436c6ed50d5745558981f112390927909c6b36a65d9b3f40d35aa2a2c811a482361a4888b4d8f9e0ca7c5f2c534a77681c312188169f0fbee0dc6dcf0af84765d6a1d350bd3804190609d8341037dc6dcad87d9eec75164528884aea81257593f08266c046db636a0ee2fcae616a52697a51650c58c8d04de0afc3e9cb1066b8c21564408e76d5ac28022e10589237b5a46e715939ccc36814682a80428a94c1b906d24da4906e7a1e871e65f2b5d5e5e80209b92c041f533cff00a60f00b63fc9e602a332b2317528159b4b5d85ed3f948f7c4e95168906af74d370a1a2395c91f28dce17f14e1f955a00857154c122a38a513bc18d240bde3a600a3c3456a8aa41425351d0534a8d84804d898bef7db01c8d6c7f473d44153dceb906cce16088bcceded79c469c7a8aa8069a9d4fb7898c4ee21796d179c54b8965e9d37551509f0ea2443007702401f3c31cae7728c1547da29d40b1ac10500176246f1bf31cb19b35b2e19814d28b5455a6ca0ea61a749d201b4310754fa73b615e438bf78c4e5a821245f5b224191b127cfeb81fbdf093f67a95a93340084990bf9b4ac729df7e5cf0babf0dad51ff0082b4c02597578758076ebb1898e5837b18719fed0d5ef1bfe9a22d166d8758be3309ab65cb312b5e9a2f25356e3eb8cc36a3588b29c18d15352baa348f816a02fb45c5f490637f3c1fc2b2d97794afddd2dc6b1248bda4a9206fb951fa609e359fa34e9a7de6aa8019058eabf3269cab1b9bc8e7bf33f239915903d2419865003228d6ca5e4d81898b49e46d077c0d48148415e8d0ef9697d9eb6904a960c3c4760eb2008244f94ce0b5ece80ca84a2026e7513084f51e191d0c6d8deb7153deaf7597567004bb91a9584c8b5845f68df0cf85711ad56b8a2e68bbd425554f78596019d27e152349dcf2c6d9ec11457ecb10cfe2a4690202d4ef910c191abc4c2d0263cb0b6a70196608c5d41d3ad61a4f41a49da47ae2e1c7383e66b15149da002142ab12749225c86201991fd3158cff0065ab2806b9ee79eb73a4cf2001209b8e5eb857b0281f31c06951597aac5ad3f76545f6b930600e5ef809b2d4e428a824aeed204f9c0b7d70551e3ca88d4d8f7baa558bc8d43a6c48d85c5fcef871c3f2195cc05082996699a6ae491179d4c146c09df1b97b192b1267f81f754d5f52b2bc90cad27c31362240be1667eaa2fc105605f6bc6d7898323db1d4f38786228efd0b3a28565766313aaf630c2646a13cb14fabc5692d44ee72e94088864663a663c4448d479dc6072cd403c1fbb5a41df2ed55de7430260126002003ab6980460fcc1cea1151d45818b83023f28627e9cb10714e20cae5e9d52e4190c02adee24699811d4ce04a5da07670c659d602cc3c69d85f7185e585504e5382662aab32d30a83727c3169882756d7db039a28ba69ea4d5cdd65ac60f317ff007c59d78f33ad5a441d554ab96a66eb65161226cb783cf0b7362a159eecd48fc4d46989062200b93eb38cf65b8fa13e0575f8752a5aa6a16a968216019e56260e07ab955027bc23c8107fe3078e059871a80559fcc608f3b02311e63852df53e90a6fcef2458da76e98c9def60945adda35e1f93a6e090d7933a8c1b7b47fc620d6aaf61276ded7e7d313d16a00e957257768b111f2f21bf5c3fe154324835352a2feb51ed1d62a95c644ecaf666926912cdde6a6520415d23622dbccf3e98829684f8945411ccb01e66cc0cfbf5c5d3ffe872ae748cb509bdc25b9fe2624fbc617671f2e46a5cb20e52498920d8058513fb9c172486a6207cad42daf4181ff00c75749e57f3c19c3b8abe5d996992c4820c8b09e63a1c1596cd7dd95284c35a05b4f488fddba632ba5328ada5d5adae74a24ff0028b58fa8dc6f81760dbb04d2cf8a84d42596a90046a2223cc35e41e7cf0c329c5e14d27af569a2a903bb37e7e1122d7e73b0c22cbe5c1800d3137275df63bf88edbdb05711e18c94c541569c1fc2ba8b0f51dd88f7c66987834a798542cb973575347f10accaed1037b9e7cf1e3712553511c311c9c785801336db6ebe78972196aa42b53647d6a7e16e437592a06f16f2c4398ecfd4eedab32acc9d4a590b089e5aafb72c2bd46b6b81953cbe4f3255a59a6449955027c258eab02b3ca41b607ff34a41c5149a74b54091a9a4dc58199f49de70bb2cd4504c82d1a42c1097eb044c0dadfd30c723a68d33534c92e019d47c4092aa3a35cdbcc4635b1aef90eadd9d450753b54d57517124c81f8444fe6262d7c6878065fba0116af88ea6d434baee34cc100581f399c1795cd86048a6e390100c0ea7519df6031bf1cad985a46a53d229a816d4b31205ef3ea441c129e54b835a99ea35d1d087555608477d1c801e1625483e9cf08b8b70d70542778509309a4c86b7517e5e20239613b71776a9ded462ec7a8910b6f5d86f8ba64f8d6599148645fbbd6abe107511b34c1d33b46a911b606a6f6123a65f0554708cc0b7735be58f7176a6f930006ee89e715dff00be3306a46d30f9392713ad5199d9c1d5224b5cc93bf3b79f960fec7f13342ad46550d234921da9b46f6d1b898247960b395a88869b52520493534962491713ca2d03d4f3c2ec864ebd40e5125695dbe11018fcf71ed8a26b84238b5ca1ee638fb060751a87789333d2313d3e3951e9b3e970a97069314224c5efe33ca01b4ed879c2b86e49d75b5202a802023eb0640f178dc45e77c1543b3caeeeda4c01abc4b7bcd9403a49b7adf09a921a31b12376c2bb23253ad56898106a302656c546a0c413fd3962bd9ecb66735515cbbe65878754911e52d03f418e9e7b30e94868a42a6b208b81122648b1f5dcfb61754e1959652a1866591215489b6a02645ff4c6c92743431293ab39b66782e67504148c9b44a1ebe66d1fbb63de1f4df2ae3c7a5a0a9005bc40865276da41c74be25f64a54fef9d57613aa41f5041338ae0e0b97cd56d34f3aa2a0f851934036e56de23013daa20962712a59fe22ee65c96698372666d3d79c9eb86dc2f2d932ca956a3a5451a74442b30b6e2e39ef1eb8078af08a995acf46a91ad6d22e09904445e08c62e56b0ccd4ad4d488a95006d16bb35ee3c460f9e0a8ec224cbb53eced3b05a5ae3ab7389f149eb6d8edcf04370508350a3495a45f40db9cc099988e5817b37c76ad1252bd22f79b821c123f948858237189b3549d98b9d69a9bc2a09901a6e0f40237e9e7894a3bf276425b7a7fc05669d69a8ef095048f15d4fb749f39c499acde5e9995a85bc27c2087306c4912277df9615e7384d2aa575b312822ec76f3bc4fb60ba793a3481229a85d563a010a18c0058fcb034aad87737de88aa719cb5203bba8a4c4c22b88b88126d33e7cb15bcef1c5657514a92866b9d00b11ebd4b62e7935424005115646a0a56cd12602f8c881cfae12bf0046965cb335e468a827a4e96658c6544a4a6d73fa32a3c3ebd346d5512990d02194189133e7be3a565a9e5fecfdd2d3a7e2a772acca18911ab4cc2cfae2a35782a968ee6a500907bc65d7aa7f0b4cafd70e8945fe2556722e35220bd8595636007cb14bdb6161071e7fd8e296532a4304a5b58c54f0893126475d81fa635190c8076d545b49b786a3379f362396e3ae235cee534165a86a300095b837e9603eb85d97e286e46a443705c06dcec7fdb02dfb0cd43dc238970c15aab3a8655b05257c5a40b924739e9cb032652952657d7702e7512099dd81f2b474c666789d7eed828ef2e402a088f42a40385bc3b26c0d955750b8967b9f23691e6719ea5cb32d2fd2865c5f8925330ab42a865d41c00478869b004c441b1f3c562af16766d294d18931a569ab7b444e1af10e1e1c42cda778806fcb7dfcf158fb1d5a7555f4d45d37044a85b00486d8199f7c14be4e79eabdd174a65a9c95a494895f0c536a667d748933c81c5473156abd4714d1cc412541206a3bb100dbd7e76c37e25da16d021aa291721aa9a8bb83e19d8c8fae07abdb8ab018e80a4dc2ea1ab9c4ea90260ef82ebb206a4deec5aaaebab5860431161d7693e7fd3169ff0eb31519eb9ee6a545450146c35f4277da0dbe58b0707cdd2cee5c3423480593e38f220da6c77c05c4a72ebdce59053a951a650cb429046cb2a600161cb7df13b8f251616bcc9ec31e32e2a52d34d2a8e5515a9b5af362b1d2363eb8e719fceb24d20c02cc10662fbefbdbcce3a936673cd4561fbaa9b997d511ca448b8c2a3c37288cdde942eed3aeb0249f30a18c49f2c65383293c337cf1ee73ae09d967ce54012b2a8d41605d80f62009f38fa63a4f0be11572e94f2fa6abd9969b3ad30404d5f090018116926d1d71ee5384500c568ca681f81d803ae7700c1204105874836b34cd542c4292acc3491062c2666d6279c795f0ce717b0d0c3286eabea7996e19926504a5007982294c8eb241f98c660319455b160c7ab0527dc8005b6db96331afe1fe481a25eebf32b3538c658d845622c74863fa786d82385e732ece57bbafaa3e000413bec48276e985f532108c036b60b6582d2645b78f3db96261c1bbbd2ecf1e28215d4438b11e113d46f86f2d7b83cdabd825f8e78b4d2cb25f9b103e816df3c4bf6ed6829e86a7518fc54de40bd86910679e22a6f48c82a2c79aef3ce7d70bf89710a1de3b7c4da40200110a00f5f94e16325c243648c9ade4582bf6a33141878eae9995151403a47386326dd0629ddabed4d4ceb866021542428f8849327e783b29c59cad54a5970e18b1d4c7c32fbb29900fa6d3cb15fe35907a0e5503545fce10c12403b45ba1f4c17276425075b0cbb3b925cc2b82afa9089878df6b79462c3c33b3d48924e8a67933993aad076e938a470bcf5405d609016398bf2e5cba473c5ab85e6dab527a668251a4c2ec144b1067a6a26d127ae1dcb60c71df72cd92e00bde354adf7a6010d4f4933373264ec23151e2d9ca74b52bbbb555a8e2353c69d5e031aa274c82237187399cc304259cb002c0c2fbcd89f9e39e716ada5882e0862db09e7b796249eae069c650d98de871a2d555c124b6fab5102d1260c90074c5cb8666197c752aa560370cba123cc100c7a9c732a755b42e804d883fbe4305e56a556210126c26ff08f9ed834f8114da3a31c9778a59423681b02607f3403a79f39388f873b31d2d6e620d895dadcc8f7c3ae09c66950a6806629be94551ae93061023f0cdb153e2f515ead5aa86ee49202c0827f9a77f4c374af91d65aec59f34d55280cc1134c8105d563c46075372472e785790ed037791dc80a580244f3d52627f0e936f2239e14e4b3d5a98b4209e4f324c4921832fd061864a9578d14a8c0bdee6fb9f1318e7cbae1ba692fdc0f2397f036e295033e9a599d6088f08d3041179bccefec703b51a6e5a68a56a8174a3ad200869f89daf3bf48f9602abc14a9352ae9473b167924f4016493e9c861bf673374f2ec5c82f234c14239ceab89fd9c2a947b05c26f7958af35d95cd5488a94c2c5c10646d600488b75c35caf66e2016558fc4164fce67eb8b13f6894545d64d2a4d4c98d249624d98150481eb8d737c632aff78330ab008d040504dc0249122e47cb19a93e19938af544e7ddaa6fb3b0a7351e4486680be5a79c822f27f5c43d8fed050a65d73549994c1560bb19bc4f97216b60ee2bd9fce66557c549c025c14735243003cac2072e78abd6e1b5e8540b5290660c09449d441fe52244fcb038e446b7b8f05fff00ca95285660a0b3b6b4682405e9e149933847c4aa575ca3ab323af301149027936fbc753e97c33e1fc0ea31156bb3d1607c088eb004104348326fb03cb060e18ca40430a5595cb80ccc18cfc44c48e44a98c6eaa4a994e84a5c1c733f5e7620c34413179b5f989c41c5291d4a9b7f2096b44ccec4f2c5d38ff648d22cfac1a0548034dc13b49e7ebf4c55db2fdd89203b08d85f48b03e66fcb05497639e7071d9a37e04f56877869bd441a6489d0481b9f3827ebe78e8fd9da1af2fde33b2d4aba599d55752ac7f0e7502073b639355cb3bf8cd2aa14f8a60c418bac8bfb62e1d98e215b2e146baa69cc9470242ed6244afa79604a2d79ac38f4a7e64ceaf4f354169ea6d5e11e3673e5022498dba75eb8e65db3e2b4eb56d547e114e258f39bf21fb1e7633315eb562e5485461a6626474b7ef6c415b84d2145f5f78f5891a3469000b7c40b0dafcf1a9b5b20c9dec8ae70ded0d5cb387562e6c1c09f841dbfb6ded8ea0d59aa2eb1529056019502b830dbabcd89b8db7be397714e12e8e88a41d53b1824739904f3e5f3c5e383f0fcc50a4a1e9662a161249a94d86d30bcc5cf33f2c26c9595c2da74dbfb062d464f08a2a4026f0b7bef7798c66095cbd437d0e3c8e991eb0d18f709e5f83ad47e5fe42fe13c26a66a987cbba97d3e2463a4822c608991eba77c40fc1eb50aaa6a33eb009820c11b5ff000b28d43aec3a620efa95386f0a1160478587a45e711711ed65465d1a8d41044bc13060402083ee6fbe2d19a7c2a39b2c5c77d564f47289591e9d320ea2acc778d326d2606e76c194f82d48857a68bf95698fa8b83845d98e33aea85a294c58cadc966e51625479807633be27e35c7331a882eb4219908546662562ff000d85f7813849639767b0d1cb8daf32dfe0338d7fd3229d6598dbe1036e703a7a62b390ed25443129a8b924b0311cb7f844fa606e2395aae7ef2a33104f8aa90a77d946a246de588b2d9708df782698604966d2ac7a124da05ad7bf2c18e2f7253ccefcbb170ca769bbca5068f78c0e9682ba67ac5c8178b8e470ac56afdeeba5428525533cd8b2c8e5c813e87028e2196a44956455658d280d46dbcf48b9bcdf738df2b9def66d5483ccc2820792ff00be2d1c4a3b8259a7254cdfb43940412f50963002169d2410490a24c63c5e114ca176a63c427c4c175482444f8835e2c312d62cca453d08749d80da39851ced853433956980b55752ac2fc6034c0217cedc80c612fdc8b2391aa2a45356493cd95881ce24dbd230fa9f676981e3d64f3862b3ebd707705cbb33d2aa1425305492c02dc34b0f14b1b5b962d9da4c9ad4a35337963de447dd581f880311d07972df139b6fd0cb628c56f25b14c6e09462dde2c0e4d3fae36a0b4e928043e9362cc2f1e9303d60e1e67385d5a54fbd7d0a8403a8383f16c08b1070a380f1ba26a540d937cd1592b504945006c56348b8df9ce171c66b91f23c7fda869c33872d69396a351caccb339007a698d47ca461af0dab9a5353bc28c01020a0589b403aa5be7817b3bc77319eac8817bacbf8810ab0ab00c0336e969e7875c778635246abdfd128ab3046936e84923db0ce2ef6dc5528d79b6fb15fe25946358542b50f82350a60e933f08d24c0f9e05151b514a72ee04e900ac8e66e04002e67eb8d3b37da06cc66551eb84a710c42db57200e922e70476c38af715fb82c6a2e9d94842666496b888b473be15e3937bd1459145795bfb84d4c89eecd620c85901a24f90937f6c5233fc51cbdcdaf1161693fa038b136433ddd450a554512a1f4a30221af7bdcc13303158cd766ebd568d3a08e7b800cfc406d3d79df1924df0734e7396cc6bd9bced47cc532731a154cc163e2d36d1b8f2e7b0c5d38ce781fbb80d56a0856d05c8e5afc326075c51b83f066a398a74490ceff0009885983d4f5fe98b6e7386d4662e431634c53251ee428d27e06dcf3f3c1692dc7c4f6d3b7d58d43b69d554a03eea390daa78b7fd702e738b51a54dab3545d2a749d2413ab7d3133317f4c4390a9532e752ae93a74f894907d64c9dbae07ca15122ad3a3514b9a8cbdd8bb9b6ab96bc4098d8627e4be4eb52c9a6a901f13cbe6788526a99734569d2275a5472ac41121982a11d62fc8e2bd98e14ab514d226b9551a888081c89dc802003d49b6d8bfd1e2ac92052a3a4fe134c4796d89f3759500157254bc578495b1e76047f5c521289cb931cdbb911d7cf55a99155585ad65d20ae9005a6545bd063de35c4f55074ee69bd6200d5a1089b49861d27e784fc573ab4fc74325a8eda3bdd26fbb4b291ed1897856692ad5a22a537a2ae84bea65628f24282d1a6204ec3e218adaed44d4296e98cb81767856d2d50525534d495463a8391e2101b4802fb611e7b88e47ed0682b5443ab46b6b293b73dafe58b1e4b83a54af5e92bc0a6502b101b5eb4d462236dac4e1067bb3595ab996565a752a5361de41690601f12ed71eb8152ec2b4bdc5bc1f2796ae0e73bc2ef49ca14092da79691372437ebd316bc96656ab22aad505c12a1a9e9f84917936db9e09a54516000205e395845c73b13f3c2eed0e7529d30b4e9a778cd20a855363b7a5f6c09e2bdd94c79a50da258070aa9f95bff8ff00fbc662a794e20cc809ab5509dd4eab7cb1988e8c7ec57fa8cdeffa144c8f67b3152034d9836ba8c0137079b133ed87743b1c0c6aa910640a6355b7825bc388b31c3e83dda9536f3d23f5c0d9ce3268a854a8d037f16a820f56bfd79460bcce4a82f1420ae5b8e72dd99c965d86a80cc60778e4924f92c28f5db0f1f299660cefa183496763627632769fae390f10cfbb3fc44eb3ccc9b9e538ddaab2af337d504ed7fd7029d6ec4ebc57f6973e255b2b4dc7706586e5509dfab91e2f9e17d2a4b58ca24dfe23107da4ff004c21a3c4f4ea0d24cc691788f5c1dc13b58d4895a796472769991e9161f2c74423f24e53d5c22c392e0c6a5fbb111f12a0502075b7d316be1fd9aa74909aae80989406e7a0ebbc7962af4fb5399a80a5555a608b8a6d0403e507ff002c2acc67ab4b12c74868f881d51b93cfd71a76bb09c056478254ee9aa2fda29a33c181ac73b86500e91046f62475c6d94e0f543944d0cf20f854ea86023e289f9f3c17d9eed4d4cbb1a749c14d5f0c5a6f3020699f7dbdb0c78bf68aa5775a94ea9cbba88914d5f9fc5321a62c46c6d81a535f005f420e1b90a28ecb98a87bd06191f4d3e5b4cded1b374c5952a5355b35355fe5223e7cfdb158e21965cd563586654390ba895d20b2aaa9e76d51317c45c37b35569b92fdd692a46b5b80771222fb6125862ce8867941556c3acd768292100344fe220c7c80d47e9eb889b8ad014cd61516a0931360584480080b22dbc9c2ea7c1eab17229a3e97d37246a02e5849db6dbcf00f11cab22aa1434b486a81603af8b4a12018dedd76c4e508a7b2633f113f80e4eda0d610a00c4d8dc88ebe5e98b4d1a6b55663503f987b6c71c9aae4bef51cb0d3a36040622e0187853cf9e1bf03ca67e8546d0c1811a484657207398321875e471ba77c6c186792f56e5c3899ee8ad1a26925473a540f8a4f3d36000b5cdb0c385f025a6cd56b115ab3285dbc2a04ecd12666f102d851d8ec9bad3acc429aa885d99839a8c6e74926205b948c35e1fc58d5a15ab91a45152cc01b90013e1b6f00ef187d0d2a46eac5cae57f40faa74885201f9ff5fd70b1f2799eff00be4cc8590aa5453990a4c49d53f88f4c1347394caea2da163512f6001fc44dc479ce1c8cc50a54fbc42b5cc4ae821bfed89bf4e670b1848a4f263edbb27a14c28152b841a762ca354f283c8fd710a715a7583108608284ed23c8c47b8c035daa3bea2e4afe52b6bf2bdc6366316034f9447d3092cd5b44d1f0ea4ee42acfb65f2c022d2afe26075a977d3b883a46b8dad83f2f4a918d61c89d41b5491ecc36f23f2c6f189b8565bbff0012b02930585c5ac40f3fd308b24e5491478b1634eff937a995aa5c0a7f794caceb252cdf94ad8f4bf9e1176578d6baf98a6f4d9d0430700050459849200e5b74383bb45da05a55572996a4b56b6cd261698e85a090dccf411cc8047ad902f51594aa4125c059d608234998ebbdf6c5e7a60a9adce58a9e4efb1617ad4188d5e1236d51cfa413d31a53e1cae350a40dc8121448b89dcdbd7cb0baad766f0ea6d2394d891cbd0617f1be1ab9945567a89a674b53728c27cc6f7eb858e585ee877e1a75b319d7e16ab7345bff006febb8c221c569f7950518215f4b4dcea51064ccdb0c385e48520c1b3998873005462e2c234893ce09b0c56727c21b2ef5fbc70ef56a9a8da6c06a24c09bf3bfb74c59ca315a9128e39cdd0f333c50aa3be89d2a4c29b98bede98a32f1dab9baf4982332ea4314e35295d44892444c8bc8b0f6c5a008d8918ca0a13e014c7a2006c2378e98cb3aaa0bf0d2ec1c56b79fc89c66345e21505a47d319896a5ff33a1436fe055db7e1c8edf69c9155a6a9f7814858604c9287c88b81cb1cd73154866162c09bdfe7bdcfa62c9c33348b4c0aa235f84ab1b193f841f8875b616768bb8054530001e640dc98bdf993d0e19c6b7382621149750d44ee401b127f7030466dc1d9a4917898f61f2c4235d479a6864d8000cdf90e64e1ef0dec6665c02534f42c600faccfb633696ed9a18e52e0afa5076d8c01e29f3f9e2c7c2f3b4fc14c256736d4100404fa2a9638d337d95cd53014a01e61d65bd07c44fa7cb178ec5766065d4bb77a1cf56d23d9434c7faafe582f328ab474e3c0dba687bc2b26aa8345314811311e2f7d5b7bce0c7e1b4ea02ad4c3c8bc8d46d8f5cb4c28551b97760aa3e52c4f944798c0f997a6559699fb654d3701c25350c220053e29f32d1d44e39a3094fccce9c99638d69afd8459aec92d59394254f3722692f525cc6dd0163e430bb2fc0ea972a1a9d4023c6858a1fcd06c0dfa0386dc133ad980eb5c5a910ab4f54535926142445a23c5a8f48c58111b95bccff41c87afcb1579de35a57ea4a3e1a393cf2dbe115fabd99005aa051e62493f4c429d9faea0b23293c84959fedef8b3d58a6a5e0b10249dcc0dfa47a0c53bb4ddbc14616924b15d419ecb0644800c9b82396d84865c92e0a4f0e25cec114aae6c38a4ca6e7f1fc27489df63f3c699bed4aa3b2b0468fbb15514f3dd4489f94838a9e63fc42a8d4929c1923c750c6fcc850223f7188329c2abe6547754cb024b6a1113cae4c0e58bca74bcc70c95caa0587355f28cfae6aab45c022399dac77931389322f40e60d435b4ab1792548203ab0b6e0c4f518594bb3b9c5056b536a83f0957a733d2e64cfa602a19134589ac950aa6e8ea51893b7894b061d48f2185593d9a34a134b745eabafd9954d2cdf7c0dff86eda475620b01bcd872c38cce71d92a87a6ec8c2a295060ba2fe21a9a4a696990a773efce2bd4ad51cb2a0a16017606c22445fcef187f438c554893aad12c0199107cef8a46566d134b80c3c592ad16a20c02142ab36ab2c1b06b72bf23cf05f026a7482ff00d2a920b43a02a64f8a029f009b09040b0c295cf530e1fba50c0cf84958911b6de7ef8d78af1415545204d3772007005803ce3c447a74c092664d2417c5b319e2e0e5ea68522e8fdd82add2eb17b73e781b2bc43348cbded5fbda84ae860340d248165117e6441b0bef872ec529a842734b106aca48027c65499316276361bc602ece668e65aa9cc7c08c34b2eec1a4782d70227df092849723f517621ed176a1a9653bdb2b982851832b7fdcb31d563a5f0bbb2bc4f34b452b7db6abf7bacb533a4a292c7690581f48c5c335d99c8d7554354100f856a2f33d3683e98872fd8d634d4d1d1ddc42ac952003037d42630545c552451648b69cd950afda3340b8026a35b536ca3c84dcee64f38f4c0b43b5f990413510de20817db981fb318038e70fa895eaaef0c4866e63f09f4223d8e132d0aa18ca95248e569ea79900df1cf24ed9cb933cdc9d33acf0fed1d07a7ab5052164af31e9d76c3653a8c0fdfeedf3c711fb6f53205b575bec204fb62dfd98e2f9ceef551a495696a8a8c4805277366d7ee41f960638f996a2f1f1b36a9adcbe6633e03e92b6588820cdb7f698be11713cf53473abbeeb229ea17f469b1b6d8a6f13ed6e61735512920a8a0ce9d25885204dd6fb9e9d3175e19da2cb55544ad956353bb57b483a5c48e7bf96f716c74ca3737a83d4d304a1c90e43314ebb32d270cca016055d480762752803e7821283313a61a37d04347fda4e2d3d99a99752c72f4eacb01a8345809d893f42712e468e599d9e0bee08640c0126775047be3745332f1335c94d6a6c0dd48f638cc1dc438216aaec9574a96300660a8027908b63303a0bff0041feb3e0e4b5385b8059e4937245cfb9dce3a0f07ecce573b964acabddb910c57f32d8c8dbfe70856d83f87714a997fe1bc0372a6e09fdf4c2eb740783d982e7bfc3ecd5225e8d41523e10bf76479ceadf1d1381e56a55cad0f0377ca4256350953604ead441d47e1ebbc5b0b78676b039d2e8418dc6df237f94e1fd3e22abe256227a73f6db0eb23d352e08a5252db9f81756ca7775dc5b500248373d3cc083b5f18955892047c337bdef6b7b636a99e6ef4d420348820dad6e6079624c8d7a552a95530e16594c48048836e5be27a62f83a1cb247760e2a8523558ef2d7f91d87c860904282c085b496b0f79db12663292761fb38a276d72559c3d25d6c0a1d08234cda49005cf2bed80b126f67432f11b6eac82b766b2f5eb35519ba8e03492a54056f51607d86f8b1f0ecb52cade199a2ee5cb13e6431f0e392306a2c6a3b3d26990aa7ef3df928f5bf9605e25da2af5c0a65884d828e7fea3bb1fdc62af1df2f617aea3c23a1768fb7c89a9690ef48b18fe183d19bf17a0b79e280bdfe7eb6900166061516155449f0aa8b0924fa9f3c5b3b35d89ab5421a83baa42f05416627731f2827a6c717ee1dc368e4d42504009e9776f5277f530079627d58c768a0c7164c9e696c737ecb76429f7e16bfdef8495a67c171cdae6563d27a63a9653e10a8aaaa2c2078401d237f6b629ddaee119ccc565a94ca525d01490cdaa07585e7d39e1ff0066e9d7a6915eb9acdcbc101474b8d64fae132ca325765fc3c1c36a1a92ab763e458ff7e43d2d8f1e92698682a073336f327f5c45c4f374a9a06a8da412028e658fe11d49c73de3d9bcce72ba6583fd9a9c6a201f19b803569b16bed200eb85c789cfe8532e68e3fa8db8957cbeb1dc89830496b7d79fee312706e14d5fc6f2a9b46ccc601b741045fe5d715aa5958ac129135aa2788b11f7642f524c0f52717fc845509aeb12c22554e8b8bc5b7f4c336d2a447164d6ed8567281a74c0a540391655f0803ccea3fef8e6b99e199f476ad528b6ad57d00380a7aaa19503cba63aceb27c2b68dcf4f21d4fe9f4c7a82040dbf7bf9e271c8e2572615939395670e9d4095528f0ca194c959b18369f3eb875c1e9d4a9e1a290144c03004f2b8104f489c5ab8cf0fcb54566af4d488898f1790045e49d80c670ad34d4c53d25dd9cde492c67c47afd06c31d109ca49b8a3927861092b7b0a18e6690d4c86144936200f6389a8f6caa53580207f2ff006c56bb57dbf71984a396a495903004382c2a3ab030b07e10444f393d2710e5f279aaabaaa656a23125a154058264010c488071572718dcaac8cd2bac7b9376978a9cd9a693069a1548b1831bdaf1a46fd715acd53aea4b23315988df7e63944da7d70667f219a5a81850aa140e48c7ac4dbd3eb880e64480cd3a81d42f267c84c11ed18e7d726ef939e4a4b9426a79eaa8eab54083788bdf958e1ce538f2d33a96ecde1279806e62d3e5ef818ad1aa49ad020d94b46ff226d07df0df872514934d29dc41b03cb91fc26fcbae3ae1bab683118f6733a849775a68ed32fa002401b120826e373d3cf16b141198394a5536bf5e4375febcb1ce2b70daa500564075120c9f8760277f511efd4ee03473149d4bd55281812096322648e47d30b2845bb3a54f6e4ea1c0f3872a1d05263241683236b444c6ff005c19c378b50a0cd3de29312ad1223d87e98abe573ea2a96d6749e446db089df9618257d418d360e498dfcc4efd04db074d7712d3e510710cd354aaee0b805891e2e5f2c663d6c8cdcd3bf928c6635bf727d287c955191916604f48d3fd4fea311f77a4dc41f3c18b8975da0dc743b63ced4cf6545217838634f8b551cc10391fdce06aca86c0c1e77b7f7180abd37504ee3aadede7cc7bc619333a0ecdf18aef175a427c414ea2447e68117c41d9ea872955ab212ccc34b6bb82bd22779e784b5b3e8bbb5fa0dfe985f98e38db531ee6e7e5b0fae3a23adf072e4e9a77276763e1fdada2c425456a6c4c08f1027f5fd70db421aaac402002263ac7f6c7cf4bc5183ad46760411066ebe9d3db167c9ff887980453a6a2b1eac0cfb47ea71d11c36adb392538f6443fe27766abae6ab570a3b977956d43981cb7de7962b7d95e26995adde3515aa40fc4763d57ce39e1a716cdd7cd54d351bbdaa41d2aa642cfd04733b0f2c32ecf70114416cc52a7204ea0ec4fa47c3f2c0924b65b935776749cbd3cc9542728fa1c03a92b06235091e129b7a9c1f5b24f448169636d5f131fac903909f6c0591eda28a7dd81a6100461e288000b45c62c59ba7433a8845553a09368224a95b83ea70b2c316b82f1cf923dec51aa77df0b389e7569fc00924c13234af324cf2b6c3ae3ced155ee4ba0ccad463a74d2b6a11ab50d4370445a6d1e78a171fe362a7dc950141058309d51f840e60f5db128608deecb4bc5b6aa2a887b4149ead7a15bbdef1a98352a498804a95089c858fb5ccdb1af07e135b3d55d94c2fc2f56e3ff006281fa5a66e62d8dfb37c3933d55fbf65445fc360c458402760008fd3cba7e4569d3d34292c0092aaa0901418dc799c1c9924ad4513c38d4ddcdfee0fc178450cb535a41352d831224b799f7f972c543b69c5a9e56a5139382c4195f11124907ce48e879c8c5cdcf784836452411cc91b83f94796e7d37de08d848e5fdba639e13d3b51db2c2a4d35b50afb2fc5ea666996a9963474d849dcf90201118679965406a3b90a2fb91fa6e7a0bf2c63e6d5412c6001727f7fbb62a3c4f38ed54be96237546688e8c47ec8c68c353be11b2e558e3eec734d9ea1152a0b0fe1a9fc20fe268b6b23e42dd4945da5e39de3fd8e8369247df383f08fc808d8f53c87ada1ccf6919d0d3a642b91f16fa40e63a9e9e784bd97e0e6b661a924f76a3554799dced27776dfd249f3ee5921085a3cc7ab24be58cfb11c110d76ccb06d14c9a54d4532640173201004f4e918e8eb5d4989f9a91fa8c0d572a740a544aa4586f6006c22f8459ce23f656a6b99ab0ae0f8899f2d33c8f998e78e592965f31df071c2d40b0543a8f90dbccf5fedff1859c478250ae3ef29ab9ea47887a302187b1186194ccd3aaa1a9323af55208f4b6d8daa0ebb621ba3a5a4d1cf78c7f8754619e9d76a7b93de1d6a00b9332185bcce14e4a9d3a2a10b104736045fa89b462d9db7e210172ea7e2f13f9283653fea3f453d70ab39e3d0889e372154df9eec41e824fb63bf0ea71b6cf33c4284655141596e125d036b8e969b1ea7d7cb02bf08ab210b53b890240240f5b74c5c72f4765e4a373bdbae182a0686807fdf0279b46c6c5e1fa8aee8e7d9acad5507529023737185992ab55029ef0905a4da0c4c48f718e959da0ba6ea2490058733fb3ed8599be114dcc89568dc5c5ccdc1f3c4fac9b4c697839766264e31522ceff00338f30cb27c22aa205d74da26e438dc93b0781131ed8cc57ad1ffac5e864f6ff001fb812ef8d9b6c798cc79fdcf4c1ce16719a845068245c8b1e44ed8cc66298fd48964f4b29d577c45c37e16ff5e33198ef97078f21a2a8d26c3e26fe989a9787275196c4b448b189da7198cc4f1722c467d8551ddb98b9a904f38d22de98b0677198cc51f25901cdb06652bb0b066020da4c6331985c9e9609706b44eacd520d710e60dc598c7cb0376cb2e8208550645e0633198e48f61f1fa595aecc31ef809dea5fcee77c341b93cf5feba7198cc6ceda96c4665aff00c39a85a957049201a71266354cc749e78b6328b63319819795f447a9e0bd0fea22ed1319a424c78be8b6c56788fc47dbf5c66331787e1a39bc4fe2329bc45c8a96247886d8b2f626b30d203100b09826f8f7198697a01e1fd674e563de2fae39cff8bbb65fd07ff7c663303c3f05bc57ac69fe18a819426049ac64f58d1be2e1587eb8cc663927eb67662f4239971f62735589fce07b695b618e407fd6a7fe939f7f0df198cc7a31f4fd8f2b2fadfd4b9e45446dcbfbe37cbfc47d7198cc7165f533bf07e1a34cc7e0ff0051ff00c4e23c663308ce889a118cc66330063fffd9, 6, 3, 'f', '.jpg', 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071312121512131415151517171d18181818181d1a1c1c1a181d1e1f1e181c1f1d1d2a201c1c251d1c1c22312125292b2e2e2e1a203338332c37282d2e2b010a0a0a0e0d0e1b10101b322420242c2c2c342c2c342c342c2c2c2c2c2c2c2c2c2c342c342c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2cffc000110800c2010303012200021101031101ffc4001c0000020203010100000000000000000000040503060002070108ffc4004010000201020403060306040503050100000102110321000412310541510613226171813291a114234252b1f03362c1d1071572e1f12492b27382a2c2d216ffc400190100030101010000000000000000000000010203000405ffc4002f110002020103020502050501000000000000010211031221311341042232516171813391a1d1e11442b1c1f052ffda000c03010002110311003f00b868c7ba70c6b656fbe06ee4e3d48cd3391a68802e360b89bba3d31813075008b463dd187393e0c59658e9e96c4c3811fcc3e589bcf05b58fa24210b8dd170d2bf08706de2181df24ebbae0f522fb834b095cd2c081718dd732a79918828e45889db0665387dc16bf96232d08a2d44b4541bf5c6572cbb0f5c10c14580c4156a8db10bb2806d0779c6f45c0c493f2c47ddced030d663d15e304228613b9c4429489381eaa69e6718c4959e4dc0c652cb23291cf70702a9c6e1e3961b7ec0d8654b4c41f9e33bcb58e16be63963ca4e498e78da1f20d4829ea91d7db02d625bae35a998388daa13865103912212a6e705d3cc83cc616b3138d061b4262ea19be602d8df03d3aeb209fa89c653cb6a59c78326648e78c944cdc86541b50b0f0e274a31893234b4a05b1c124e39a53df62a9012e5e4e26148f5c4f8f09c2ea61a34a6a06248c46ad7c4b80cc7918cc7b8cc00950d738dc1c79529463290137c75da214c2106ab6f82f2d94821ad63d31150a816d6c1a871394df61d4507ab4e3ddb11d3702d6c419de234d26584e22509f3181849b61555ed0a9d813811f8dbfe181f5c514242ea459f45b11324610af685f981f5c43578ed43b40f6c1e9c8da91600e003e7816b65db7fa617e5b8e7e617ea313d5e32846e4f9463549335a64f4d310e62a85dc81eb85398e26cdb1d23cb7f9e01669b9c3a83ee2dfb0daa714001024e04a9c4dc9991e9180b1ae28a2816c3ff00ccdff97e58c7e2ce760a30163cc6a40dc6397e25c9c5ba8df0ca866296fac5fdbf5c56c633563346458eabd1130e3e63fa623f091633e98af6ac7aaf1b18f4c0fb86be07f5134f3bf4c682a6133e618eec7e78d4bf9fd718d458a9d5c4f42adee71555ac46c4fcf128e20fd6701a097dca660118d9f3006285fe71546c63d06343c4ea9fc6df3c4ba63d9d056b838951a71cf071bae3f1fd07f6c7bfe775ff00391e6001fd30ae063a0547037c68999071ce1f3750992ee4f593881aa92664cfae19635ee0b67476e20b3b8c6639d7787a9f9e3cc374e26b639abc4d58c881889b880ff8c57d2b75c48b5075c36c253199cf3723894714a9f98e150f5c48b304c131bc0db0d713530e6ceb9dd8fcf11ebc4106c22ec257cc01323a88be03cc7100b302637f7138daa2814c67ab1b6bc28a1c4b569b6fe7862809c1d566a25353185f1a51cbb398517f9620a6daacb7bc5bae06a0d040a98f7bcc0a6a5c8e637c62d59da7e58da91a82756335620524de0c7eff00b63df2db03520e964bab19ac6345a2cc09552c06e40263d7a62027ae06b0e809d78f1aa605ab574c48df6f3f4eb8f32f559d8228124c0c2b986913eac7aa64606aecf4ddd1b75b40137b5fe4703ae7cc45fe430358686518f30470dcb1ad4cbdc4369e5b883fd71ee772c29a6a264ead22de6c3ffafd703a883a6c1bbcc603814b19fd31b53d4d713a46fd07ae1b583484138d6711234eff005c6ecc44122c70bac34630b8c6138f4b1240026d36e9cc9f4c78eb7fd30358749e6ac66a9c6bbdb6c6a5089c6d46a269c6bac72fd303f798de9a4901772607be318df5797d7198f333957462a58488fa89e98cc1b000657c4c4249800c0826fd04c9f6c4d5c6922548d5b4903e726d847c178ea50ac951c3900f8efa8c72307f4c316ed2d22b594a39571a69b15102183733611d3ae1758bb12b563ad74995d8c09837b5b9db0e7b3b9e506a2330536b13076606def8e78dc54ea900289316137f3c0c73658f23d6f063cbfe301cad50133a0f19ce829932ade2550ac01b8f0d3041e9b117f3c29ce541aaa41110bff8b0c5797344046a751881040bd98728883e7fef882a671892cc41d5cb97c8446154a82e436c9668064fe520f9723fdf16c4e334d8b2ae921402cc3c1d4480c77b8917c73da5574e966f846e00bc7979c75c4f4f3e1963c7ab756241b7f30d327dce19cec165ff0023c595036a5a84b060acab6246bd8da6c50dbfb606e11c5291aeff001312563489da7513241b6f6c52b3bc7ead50b4cce941e10a4c0f30060619b372581246df5f9f9e15bb194ab82f1c3d9d5ab6aa4cc244ec34c4dae4753cf90eb83b39c532a1b424b7f344092098b746b6d11cf153cbf16029a2352667802d50e928d7ba88bf3bcede589337c46a2d32b5b2e83503151948a86e0d8cec2dcaff005c061d43eabc51346e11148302649bca02bb092c27a636e0fc629b3696151cdc905522f049dc13cf9f3c5428f137d1a0b30224859e44c998c6f4b8af89596241048a9e2531b8822fd271b50351727ed052a602a6ad5abc5aa54137000f4d51b609a14ea664b554a261c78351110a1674da49b7a5ce28d9de2a2a3cc003711133d4dbc5efd716cec9f6a28d1a74a9b87fbb350b15591e316b8e7380e55c053b7b93f18e2549da9ab58d35002ee59b6d2790f5938328e628d3704218a6e0c8b91216ec49fcd3ed1b5f149cf67a93d60cfa8a480cb0274faeab1c5a78467f21de3cff000f4a901d7502c275480d26da6c679e327b1ac2730d45ea54aa5f660c74f88e9f088806e66dcc437960eaf99cbd54214212b2c0b42833242826369123a6293c678fa1abde50a4b4d54c800101a09bc4f84790b6065e34a2a06397cbe92412ba4cc7302498c66cda8b5d5e2f4d54acbd3222fa445c0d422d245f7ea312713e2146a06d156124321b969d2daac6ff001313fed8a2d7cd3546dbc447c3aa2206f16e436c6ed50d5745558981f112390927909c6b36a65d9b3f40d35aa2a2c811a482361a4888b4d8f9e0ca7c5f2c534a77681c312188169f0fbee0dc6dcf0af84765d6a1d350bd3804190609d8341037dc6dcad87d9eec75164528884aea81257593f08266c046db636a0ee2fcae616a52697a51650c58c8d04de0afc3e9cb1066b8c21564408e76d5ac28022e10589237b5a46e715939ccc36814682a80428a94c1b906d24da4906e7a1e871e65f2b5d5e5e80209b92c041f533cff00a60f00b63fc9e602a332b2317528159b4b5d85ed3f948f7c4e95168906af74d370a1a2395c91f28dce17f14e1f955a00857154c122a38a513bc18d240bde3a600a3c3456a8aa41425351d0534a8d84804d898bef7db01c8d6c7f473d44153dceb906cce16088bcceded79c469c7a8aa8069a9d4fb7898c4ee21796d179c54b8965e9d37551509f0ea2443007702401f3c31cae7728c1547da29d40b1ac10500176246f1bf31cb19b35b2e19814d28b5455a6ca0ea61a749d201b4310754fa73b615e438bf78c4e5a821245f5b224191b127cfeb81fbdf093f67a95a93340084990bf9b4ac729df7e5cf0babf0dad51ff0082b4c02597578758076ebb1898e5837b18719fed0d5ef1bfe9a22d166d8758be3309ab65cb312b5e9a2f25356e3eb8cc36a3588b29c18d15352baa348f816a02fb45c5f490637f3c1fc2b2d97794afddd2dc6b1248bda4a9206fb951fa609e359fa34e9a7de6aa8019058eabf3269cab1b9bc8e7bf33f239915903d2419865003228d6ca5e4d81898b49e46d077c0d48148415e8d0ef9697d9eb6904a960c3c4760eb2008244f94ce0b5ece80ca84a2026e7513084f51e191d0c6d8deb7153deaf7597567004bb91a9584c8b5845f68df0cf85711ad56b8a2e68bbd425554f78596019d27e152349dcf2c6d9ec11457ecb10cfe2a4690202d4ef910c191abc4c2d0263cb0b6a70196608c5d41d3ad61a4f41a49da47ae2e1c7383e66b15149da002142ab12749225c86201991fd3158cff0065ab2806b9ee79eb73a4cf2001209b8e5eb857b0281f31c06951597aac5ad3f76545f6b930600e5ef809b2d4e428a824aeed204f9c0b7d70551e3ca88d4d8f7baa558bc8d43a6c48d85c5fcef871c3f2195cc05082996699a6ae491179d4c146c09df1b97b192b1267f81f754d5f52b2bc90cad27c31362240be1667eaa2fc105605f6bc6d7898323db1d4f38786228efd0b3a28565766313aaf630c2646a13cb14fabc5692d44ee72e94088864663a663c4448d479dc6072cd403c1fbb5a41df2ed55de7430260126002003ab6980460fcc1cea1151d45818b83023f28627e9cb10714e20cae5e9d52e4190c02adee24699811d4ce04a5da07670c659d602cc3c69d85f7185e585504e5382662aab32d30a83727c3169882756d7db039a28ba69ea4d5cdd65ac60f317ff007c59d78f33ad5a441d554ab96a66eb65161226cb783cf0b7362a159eecd48fc4d46989062200b93eb38cf65b8fa13e0575f8752a5aa6a16a968216019e56260e07ab955027bc23c8107fe3078e059871a80559fcc608f3b02311e63852df53e90a6fcef2458da76e98c9def60945adda35e1f93a6e090d7933a8c1b7b47fc620d6aaf61276ded7e7d313d16a00e957257768b111f2f21bf5c3fe154324835352a2feb51ed1d62a95c644ecaf666926912cdde6a6520415d23622dbccf3e98829684f8945411ccb01e66cc0cfbf5c5d3ffe872ae748cb509bdc25b9fe2624fbc617671f2e46a5cb20e52498920d8058513fb9c172486a6207cad42daf4181ff00c75749e57f3c19c3b8abe5d996992c4820c8b09e63a1c1596cd7dd95284c35a05b4f488fddba632ba5328ada5d5adae74a24ff0028b58fa8dc6f81760dbb04d2cf8a84d42596a90046a2223cc35e41e7cf0c329c5e14d27af569a2a903bb37e7e1122d7e73b0c22cbe5c1800d3137275df63bf88edbdb05711e18c94c541569c1fc2ba8b0f51dd88f7c66987834a798542cb973575347f10accaed1037b9e7cf1e3712553511c311c9c785801336db6ebe78972196aa42b53647d6a7e16e437592a06f16f2c4398ecfd4eedab32acc9d4a590b089e5aafb72c2bd46b6b81953cbe4f3255a59a6449955027c258eab02b3ca41b607ff34a41c5149a74b54091a9a4dc58199f49de70bb2cd4504c82d1a42c1097eb044c0dadfd30c723a68d33534c92e019d47c4092aa3a35cdbcc4635b1aef90eadd9d450753b54d57517124c81f8444fe6262d7c6878065fba0116af88ea6d434baee34cc100581f399c1795cd86048a6e390100c0ea7519df6031bf1cad985a46a53d229a816d4b31205ef3ea441c129e54b835a99ea35d1d087555608477d1c801e1625483e9cf08b8b70d70542778509309a4c86b7517e5e20239613b71776a9ded462ec7a8910b6f5d86f8ba64f8d6599148645fbbd6abe107511b34c1d33b46a911b606a6f6123a65f0554708cc0b7735be58f7176a6f930006ee89e715dff00be3306a46d30f9392713ad5199d9c1d5224b5cc93bf3b79f960fec7f13342ad46550d234921da9b46f6d1b898247960b395a88869b52520493534962491713ca2d03d4f3c2ec864ebd40e5125695dbe11018fcf71ed8a26b84238b5ca1ee638fb060751a87789333d2313d3e3951e9b3e970a97069314224c5efe33ca01b4ed879c2b86e49d75b5202a802023eb0640f178dc45e77c1543b3caeeeda4c01abc4b7bcd9403a49b7adf09a921a31b12376c2bb23253ad56898106a302656c546a0c413fd3962bd9ecb66735515cbbe65878754911e52d03f418e9e7b30e94868a42a6b208b81122648b1f5dcfb61754e1959652a1866591215489b6a02645ff4c6c92743431293ab39b66782e67504148c9b44a1ebe66d1fbb63de1f4df2ae3c7a5a0a9005bc40865276da41c74be25f64a54fef9d57613aa41f5041338ae0e0b97cd56d34f3aa2a0f851934036e56de23013daa20962712a59fe22ee65c96698372666d3d79c9eb86dc2f2d932ca956a3a5451a74442b30b6e2e39ef1eb8078af08a995acf46a91ad6d22e09904445e08c62e56b0ccd4ad4d488a95006d16bb35ee3c460f9e0a8ec224cbb53eced3b05a5ae3ab7389f149eb6d8edcf04370508350a3495a45f40db9cc099988e5817b37c76ad1252bd22f79b821c123f948858237189b3549d98b9d69a9bc2a09901a6e0f40237e9e7894a3bf276425b7a7fc05669d69a8ef095048f15d4fb749f39c499acde5e9995a85bc27c2087306c4912277df9615e7384d2aa575b312822ec76f3bc4fb60ba793a3481229a85d563a010a18c0058fcb034aad87737de88aa719cb5203bba8a4c4c22b88b88126d33e7cb15bcef1c5657514a92866b9d00b11ebd4b62e7935424005115646a0a56cd12602f8c881cfae12bf0046965cb335e468a827a4e96658c6544a4a6d73fa32a3c3ebd346d5512990d02194189133e7be3a565a9e5fecfdd2d3a7e2a772acca18911ab4cc2cfae2a35782a968ee6a500907bc65d7aa7f0b4cafd70e8945fe2556722e35220bd8595636007cb14bdb6161071e7fd8e296532a4304a5b58c54f0893126475d81fa635190c8076d545b49b786a3379f362396e3ae235cee534165a86a300095b837e9603eb85d97e286e46a443705c06dcec7fdb02dfb0cd43dc238970c15aab3a8655b05257c5a40b924739e9cb032652952657d7702e7512099dd81f2b474c666789d7eed828ef2e402a088f42a40385bc3b26c0d955750b8967b9f23691e6719ea5cb32d2fd2865c5f8925330ab42a865d41c00478869b004c441b1f3c562af16766d294d18931a569ab7b444e1af10e1e1c42cda778806fcb7dfcf158fb1d5a7555f4d45d37044a85b00486d8199f7c14be4e79eabdd174a65a9c95a494895f0c536a667d748933c81c5473156abd4714d1cc412541206a3bb100dbd7e76c37e25da16d021aa291721aa9a8bb83e19d8c8fae07abdb8ab018e80a4dc2ea1ab9c4ea90260ef82ebb206a4deec5aaaebab5860431161d7693e7fd3169ff0eb31519eb9ee6a545450146c35f4277da0dbe58b0707cdd2cee5c3423480593e38f220da6c77c05c4a72ebdce59053a951a650cb429046cb2a600161cb7df13b8f251616bcc9ec31e32e2a52d34d2a8e5515a9b5af362b1d2363eb8e719fceb24d20c02cc10662fbefbdbcce3a936673cd4561fbaa9b997d511ca448b8c2a3c37288cdde942eed3aeb0249f30a18c49f2c65383293c337cf1ee73ae09d967ce54012b2a8d41605d80f62009f38fa63a4f0be11572e94f2fa6abd9969b3ad30404d5f090018116926d1d71ee5384500c568ca681f81d803ae7700c1204105874836b34cd542c4292acc3491062c2666d6279c795f0ce717b0d0c3286eabea7996e19926504a5007982294c8eb241f98c660319455b160c7ab0527dc8005b6db96331afe1fe481a25eebf32b3538c658d845622c74863fa786d82385e732ece57bbafaa3e000413bec48276e985f532108c036b60b6582d2645b78f3db96261c1bbbd2ecf1e28215d4438b11e113d46f86f2d7b83cdabd825f8e78b4d2cb25f9b103e816df3c4bf6ed6829e86a7518fc54de40bd86910679e22a6f48c82a2c79aef3ce7d70bf89710a1de3b7c4da40200110a00f5f94e16325c243648c9ade4582bf6a33141878eae9995151403a47386326dd0629ddabed4d4ceb866021542428f8849327e783b29c59cad54a5970e18b1d4c7c32fbb29900fa6d3cb15fe35907a0e5503545fce10c12403b45ba1f4c17276425075b0cbb3b925cc2b82afa9089878df6b79462c3c33b3d48924e8a67933993aad076e938a470bcf5405d609016398bf2e5cba473c5ab85e6dab527a668251a4c2ec144b1067a6a26d127ae1dcb60c71df72cd92e00bde354adf7a6010d4f4933373264ec23151e2d9ca74b52bbbb555a8e2353c69d5e031aa274c82237187399cc304259cb002c0c2fbcd89f9e39e716ada5882e0862db09e7b796249eae069c650d98de871a2d555c124b6fab5102d1260c90074c5cb8666197c752aa560370cba123cc100c7a9c732a755b42e804d883fbe4305e56a556210126c26ff08f9ed834f8114da3a31c9778a59423681b02607f3403a79f39388f873b31d2d6e620d895dadcc8f7c3ae09c66950a6806629be94551ae93061023f0cdb153e2f515ead5aa86ee49202c0827f9a77f4c374af91d65aec59f34d55280cc1134c8105d563c46075372472e785790ed037791dc80a580244f3d52627f0e936f2239e14e4b3d5a98b4209e4f324c4921832fd061864a9578d14a8c0bdee6fb9f1318e7cbae1ba692fdc0f2397f036e295033e9a599d6088f08d3041179bccefec703b51a6e5a68a56a8174a3ad200869f89daf3bf48f9602abc14a9352ae9473b167924f4016493e9c861bf673374f2ec5c82f234c14239ceab89fd9c2a947b05c26f7958af35d95cd5488a94c2c5c10646d600488b75c35caf66e2016558fc4164fce67eb8b13f6894545d64d2a4d4c98d249624d98150481eb8d737c632aff78330ab008d040504dc0249122e47cb19a93e19938af544e7ddaa6fb3b0a7351e4486680be5a79c822f27f5c43d8fed050a65d73549994c1560bb19bc4f97216b60ee2bd9fce66557c549c025c14735243003cac2072e78abd6e1b5e8540b5290660c09449d441fe52244fcb038e446b7b8f05fff00ca95285660a0b3b6b4682405e9e149933847c4aa575ca3ab323af301149027936fbc753e97c33e1fc0ea31156bb3d1607c088eb004104348326fb03cb060e18ca40430a5595cb80ccc18cfc44c48e44a98c6eaa4a994e84a5c1c733f5e7620c34413179b5f989c41c5291d4a9b7f2096b44ccec4f2c5d38ff648d22cfac1a0548034dc13b49e7ebf4c55db2fdd89203b08d85f48b03e66fcb05497639e7071d9a37e04f56877869bd441a6489d0481b9f3827ebe78e8fd9da1af2fde33b2d4aba599d55752ac7f0e7502073b639355cb3bf8cd2aa14f8a60c418bac8bfb62e1d98e215b2e146baa69cc9470242ed6244afa79604a2d79ac38f4a7e64ceaf4f354169ea6d5e11e3673e5022498dba75eb8e65db3e2b4eb56d547e114e258f39bf21fb1e7633315eb562e5485461a6626474b7ef6c415b84d2145f5f78f5891a3469000b7c40b0dafcf1a9b5b20c9dec8ae70ded0d5cb387562e6c1c09f841dbfb6ded8ea0d59aa2eb1529056019502b830dbabcd89b8db7be397714e12e8e88a41d53b1824739904f3e5f3c5e383f0fcc50a4a1e9662a161249a94d86d30bcc5cf33f2c26c9595c2da74dbfb062d464f08a2a4026f0b7bef7798c66095cbd437d0e3c8e991eb0d18f709e5f83ad47e5fe42fe13c26a66a987cbba97d3e2463a4822c608991eba77c40fc1eb50aaa6a33eb009820c11b5ff000b28d43aec3a620efa95386f0a1160478587a45e711711ed65465d1a8d41044bc13060402083ee6fbe2d19a7c2a39b2c5c77d564f47289591e9d320ea2acc778d326d2606e76c194f82d48857a68bf95698fa8b83845d98e33aea85a294c58cadc966e51625479807633be27e35c7331a882eb4219908546662562ff000d85f7813849639767b0d1cb8daf32dfe0338d7fd3229d6598dbe1036e703a7a62b390ed25443129a8b924b0311cb7f844fa606e2395aae7ef2a33104f8aa90a77d946a246de588b2d9708df782698604966d2ac7a124da05ad7bf2c18e2f7253ccefcbb170ca769bbca5068f78c0e9682ba67ac5c8178b8e470ac56afdeeba5428525533cd8b2c8e5c813e87028e2196a44956455658d280d46dbcf48b9bcdf738df2b9def66d5483ccc2820792ff00be2d1c4a3b8259a7254cdfb43940412f50963002169d2410490a24c63c5e114ca176a63c427c4c175482444f8835e2c312d62cca453d08749d80da39851ced853433956980b55752ac2fc6034c0217cedc80c612fdc8b2391aa2a45356493cd95881ce24dbd230fa9f676981e3d64f3862b3ebd707705cbb33d2aa1425305492c02dc34b0f14b1b5b962d9da4c9ad4a35337963de447dd581f880311d07972df139b6fd0cb628c56f25b14c6e09462dde2c0e4d3fae36a0b4e928043e9362cc2f1e9303d60e1e67385d5a54fbd7d0a8403a8383f16c08b1070a380f1ba26a540d937cd1592b504945006c56348b8df9ce171c66b91f23c7fda869c33872d69396a351caccb339007a698d47ca461af0dab9a5353bc28c01020a0589b403aa5be7817b3bc77319eac8817bacbf8810ab0ab00c0336e969e7875c778635246abdfd128ab3046936e84923db0ce2ef6dc5528d79b6fb15fe25946358542b50f82350a60e933f08d24c0f9e05151b514a72ee04e900ac8e66e04002e67eb8d3b37da06cc66551eb84a710c42db57200e922e70476c38af715fb82c6a2e9d94842666496b888b473be15e3937bd1459145795bfb84d4c89eecd620c85901a24f90937f6c5233fc51cbdcdaf1161693fa038b136433ddd450a554512a1f4a30221af7bdcc13303158cd766ebd568d3a08e7b800cfc406d3d79df1924df0734e7396cc6bd9bced47cc532731a154cc163e2d36d1b8f2e7b0c5d38ce781fbb80d56a0856d05c8e5afc326075c51b83f066a398a74490ceff0009885983d4f5fe98b6e7386d4662e431634c53251ee428d27e06dcf3f3c1692dc7c4f6d3b7d58d43b69d554a03eea390daa78b7fd702e738b51a54dab3545d2a749d2413ab7d3133317f4c4390a9532e752ae93a74f894907d64c9dbae07ca15122ad3a3514b9a8cbdd8bb9b6ab96bc4098d8627e4be4eb52c9a6a901f13cbe6788526a99734569d2275a5472ac41121982a11d62fc8e2bd98e14ab514d226b9551a888081c89dc802003d49b6d8bfd1e2ac92052a3a4fe134c4796d89f3759500157254bc578495b1e76047f5c521289cb931cdbb911d7cf55a99155585ad65d20ae9005a6545bd063de35c4f55074ee69bd6200d5a1089b49861d27e784fc573ab4fc74325a8eda3bdd26fbb4b291ed1897856692ad5a22a537a2ae84bea65628f24282d1a6204ec3e218adaed44d4296e98cb81767856d2d50525534d495463a8391e2101b4802fb611e7b88e47ed0682b5443ab46b6b293b73dafe58b1e4b83a54af5e92bc0a6502b101b5eb4d462236dac4e1067bb3595ab996565a752a5361de41690601f12ed71eb8152ec2b4bdc5bc1f2796ae0e73bc2ef49ca14092da79691372437ebd316bc96656ab22aad505c12a1a9e9f84917936db9e09a54516000205e395845c73b13f3c2eed0e7529d30b4e9a778cd20a855363b7a5f6c09e2bdd94c79a50da258070aa9f95bff8ff00fbc662a794e20cc809ab5509dd4eab7cb1988e8c7ec57fa8cdeffa144c8f67b3152034d9836ba8c0137079b133ed87743b1c0c6aa910640a6355b7825bc388b31c3e83dda9536f3d23f5c0d9ce3268a854a8d037f16a820f56bfd79460bcce4a82f1420ae5b8e72dd99c965d86a80cc60778e4924f92c28f5db0f1f299660cefa183496763627632769fae390f10cfbb3fc44eb3ccc9b9e538ddaab2af337d504ed7fd7029d6ec4ebc57f6973e255b2b4dc7706586e5509dfab91e2f9e17d2a4b58ca24dfe23107da4ff004c21a3c4f4ea0d24cc691788f5c1dc13b58d4895a796472769991e9161f2c74423f24e53d5c22c392e0c6a5fbb111f12a0502075b7d316be1fd9aa74909aae80989406e7a0ebbc7962af4fb5399a80a5555a608b8a6d0403e507ff002c2acc67ab4b12c74868f881d51b93cfd71a76bb09c056478254ee9aa2fda29a33c181ac73b86500e91046f62475c6d94e0f543944d0cf20f854ea86023e289f9f3c17d9eed4d4cbb1a749c14d5f0c5a6f3020699f7dbdb0c78bf68aa5775a94ea9cbba88914d5f9fc5321a62c46c6d81a535f005f420e1b90a28ecb98a87bd06191f4d3e5b4cded1b374c5952a5355b35355fe5223e7cfdb158e21965cd563586654390ba895d20b2aaa9e76d51317c45c37b35569b92fdd692a46b5b80771222fb6125862ce8867941556c3acd768292100344fe220c7c80d47e9eb889b8ad014cd61516a0931360584480080b22dbc9c2ea7c1eab17229a3e97d37246a02e5849db6dbcf00f11cab22aa1434b486a81603af8b4a12018dedd76c4e508a7b2633f113f80e4eda0d610a00c4d8dc88ebe5e98b4d1a6b55663503f987b6c71c9aae4bef51cb0d3a36040622e0187853cf9e1bf03ca67e8546d0c1811a484657207398321875e471ba77c6c186792f56e5c3899ee8ad1a26925473a540f8a4f3d36000b5cdb0c385f025a6cd56b115ab3285dbc2a04ecd12666f102d851d8ec9bad3acc429aa885d99839a8c6e74926205b948c35e1fc58d5a15ab91a45152cc01b90013e1b6f00ef187d0d2a46eac5cae57f40faa74885201f9ff5fd70b1f2799eff00be4cc8590aa5453990a4c49d53f88f4c1347394caea2da163512f6001fc44dc479ce1c8cc50a54fbc42b5cc4ae821bfed89bf4e670b1848a4f263edbb27a14c28152b841a762ca354f283c8fd710a715a7583108608284ed23c8c47b8c035daa3bea2e4afe52b6bf2bdc6366316034f9447d3092cd5b44d1f0ea4ee42acfb65f2c022d2afe26075a977d3b883a46b8dad83f2f4a918d61c89d41b5491ecc36f23f2c6f189b8565bbff0012b02930585c5ac40f3fd308b24e5491478b1634eff937a995aa5c0a7f794caceb252cdf94ad8f4bf9e1176578d6baf98a6f4d9d0430700050459849200e5b74383bb45da05a55572996a4b56b6cd261698e85a090dccf411cc8047ad902f51594aa4125c059d608234998ebbdf6c5e7a60a9adce58a9e4efb1617ad4188d5e1236d51cfa413d31a53e1cae350a40dc8121448b89dcdbd7cb0baad766f0ea6d2394d891cbd0617f1be1ab9945567a89a674b53728c27cc6f7eb858e585ee877e1a75b319d7e16ab7345bff006febb8c221c569f7950518215f4b4dcea51064ccdb0c385e48520c1b3998873005462e2c234893ce09b0c56727c21b2ef5fbc70ef56a9a8da6c06a24c09bf3bfb74c59ca315a9128e39cdd0f333c50aa3be89d2a4c29b98bede98a32f1dab9baf4982332ea4314e35295d44892444c8bc8b0f6c5a008d8918ca0a13e014c7a2006c2378e98cb3aaa0bf0d2ec1c56b79fc89c66345e21505a47d319896a5ff33a1436fe055db7e1c8edf69c9155a6a9f7814858604c9287c88b81cb1cd73154866162c09bdfe7bdcfa62c9c33348b4c0aa235f84ab1b193f841f8875b616768bb8054530001e640dc98bdf993d0e19c6b7382621149750d44ee401b127f7030466dc1d9a4917898f61f2c4235d479a6864d8000cdf90e64e1ef0dec6665c02534f42c600faccfb633696ed9a18e52e0afa5076d8c01e29f3f9e2c7c2f3b4fc14c256736d4100404fa2a9638d337d95cd53014a01e61d65bd07c44fa7cb178ec5766065d4bb77a1cf56d23d9434c7faafe582f328ab474e3c0dba687bc2b26aa8345314811311e2f7d5b7bce0c7e1b4ea02ad4c3c8bc8d46d8f5cb4c28551b97760aa3e52c4f944798c0f997a6559699fb654d3701c25350c220053e29f32d1d44e39a3094fccce9c99638d69afd8459aec92d59394254f3722692f525cc6dd0163e430bb2fc0ea972a1a9d4023c6858a1fcd06c0dfa0386dc133ad980eb5c5a910ab4f54535926142445a23c5a8f48c58111b95bccff41c87afcb1579de35a57ea4a3e1a393cf2dbe115fabd99005aa051e62493f4c429d9faea0b23293c84959fedef8b3d58a6a5e0b10249dcc0dfa47a0c53bb4ddbc14616924b15d419ecb0644800c9b82396d84865c92e0a4f0e25cec114aae6c38a4ca6e7f1fc27489df63f3c699bed4aa3b2b0468fbb15514f3dd4489f94838a9e63fc42a8d4929c1923c750c6fcc850223f7188329c2abe6547754cb024b6a1113cae4c0e58bca74bcc70c95caa0587355f28cfae6aab45c022399dac77931389322f40e60d435b4ab1792548203ab0b6e0c4f518594bb3b9c5056b536a83f0957a733d2e64cfa602a19134589ac950aa6e8ea51893b7894b061d48f2185593d9a34a134b745eabafd9954d2cdf7c0dff86eda475620b01bcd872c38cce71d92a87a6ec8c2a295060ba2fe21a9a4a696990a773efce2bd4ad51cb2a0a16017606c22445fcef187f438c554893aad12c0199107cef8a46566d134b80c3c592ad16a20c02142ab36ab2c1b06b72bf23cf05f026a7482ff00d2a920b43a02a64f8a029f009b09040b0c295cf530e1fba50c0cf84958911b6de7ef8d78af1415545204d3772007005803ce3c447a74c092664d2417c5b319e2e0e5ea68522e8fdd82add2eb17b73e781b2bc43348cbded5fbda84ae860340d248165117e6441b0bef872ec529a842734b106aca48027c65499316276361bc602ece668e65aa9cc7c08c34b2eec1a4782d70227df092849723f517621ed176a1a9653bdb2b982851832b7fdcb31d563a5f0bbb2bc4f34b452b7db6abf7bacb533a4a292c7690581f48c5c335d99c8d7554354100f856a2f33d3683e98872fd8d634d4d1d1ddc42ac952003037d42630545c552451648b69cd950afda3340b8026a35b536ca3c84dcee64f38f4c0b43b5f990413510de20817db981fb318038e70fa895eaaef0c4866e63f09f4223d8e132d0aa18ca95248e569ea79900df1cf24ed9cb933cdc9d33acf0fed1d07a7ab5052164af31e9d76c3653a8c0fdfeedf3c711fb6f53205b575bec204fb62dfd98e2f9ceef551a495696a8a8c4805277366d7ee41f960638f996a2f1f1b36a9adcbe6633e03e92b6588820cdb7f698be11713cf53473abbeeb229ea17f469b1b6d8a6f13ed6e61735512920a8a0ce9d25885204dd6fb9e9d3175e19da2cb55544ad956353bb57b483a5c48e7bf96f716c74ca3737a83d4d304a1c90e43314ebb32d270cca016055d480762752803e7821283313a61a37d04347fda4e2d3d99a99752c72f4eacb01a8345809d893f42712e468e599d9e0bee08640c0126775047be3745332f1335c94d6a6c0dd48f638cc1dc438216aaec9574a96300660a8027908b63303a0bff0041feb3e0e4b5385b8059e4937245cfb9dce3a0f07ecce573b964acabddb910c57f32d8c8dbfe70856d83f87714a997fe1bc0372a6e09fdf4c2eb740783d982e7bfc3ecd5225e8d41523e10bf76479ceadf1d1381e56a55cad0f0377ca4256350953604ead441d47e1ebbc5b0b78676b039d2e8418dc6df237f94e1fd3e22abe256227a73f6db0eb23d352e08a5252db9f81756ca7775dc5b500248373d3cc083b5f18955892047c337bdef6b7b636a99e6ef4d420348820dad6e6079624c8d7a552a95530e16594c48048836e5be27a62f83a1cb247760e2a8523558ef2d7f91d87c860904282c085b496b0f79db12663292761fb38a276d72559c3d25d6c0a1d08234cda49005cf2bed80b126f67432f11b6eac82b766b2f5eb35519ba8e03492a54056f51607d86f8b1f0ecb52cade199a2ee5cb13e6431f0e392306a2c6a3b3d26990aa7ef3df928f5bf9605e25da2af5c0a65884d828e7fea3bb1fdc62af1df2f617aea3c23a1768fb7c89a9690ef48b18fe183d19bf17a0b79e280bdfe7eb6900166061516155449f0aa8b0924fa9f3c5b3b35d89ab5421a83baa42f05416627731f2827a6c717ee1dc368e4d42504009e9776f5277f530079627d58c768a0c7164c9e696c737ecb76429f7e16bfdef8495a67c171cdae6563d27a63a9653e10a8aaaa2c2078401d237f6b629ddaee119ccc565a94ca525d01490cdaa07585e7d39e1ff0066e9d7a6915eb9acdcbc101474b8d64fae132ca325765fc3c1c36a1a92ab763e458ff7e43d2d8f1e92698682a073336f327f5c45c4f374a9a06a8da412028e658fe11d49c73de3d9bcce72ba6583fd9a9c6a201f19b803569b16bed200eb85c789cfe8532e68e3fa8db8957cbeb1dc89830496b7d79fee312706e14d5fc6f2a9b46ccc601b741045fe5d715aa5958ac129135aa2788b11f7642f524c0f52717fc845509aeb12c22554e8b8bc5b7f4c336d2a447164d6ed8567281a74c0a540391655f0803ccea3fef8e6b99e199f476ad528b6ad57d00380a7aaa19503cba63aceb27c2b68dcf4f21d4fe9f4c7a82040dbf7bf9e271c8e2572615939395670e9d4095528f0ca194c959b18369f3eb875c1e9d4a9e1a290144c03004f2b8104f489c5ab8cf0fcb54566af4d488898f1790045e49d80c670ad34d4c53d25dd9cde492c67c47afd06c31d109ca49b8a3927861092b7b0a18e6690d4c86144936200f6389a8f6caa53580207f2ff006c56bb57dbf71984a396a495903004382c2a3ab030b07e10444f393d2710e5f279aaabaaa656a23125a154058264010c488071572718dcaac8cd2bac7b9376978a9cd9a693069a1548b1831bdaf1a46fd715acd53aea4b23315988df7e63944da7d70667f219a5a81850aa140e48c7ac4dbd3eb880e64480cd3a81d42f267c84c11ed18e7d726ef939e4a4b9426a79eaa8eab54083788bdf958e1ce538f2d33a96ecde1279806e62d3e5ef818ad1aa49ad020d94b46ff226d07df0df872514934d29dc41b03cb91fc26fcbae3ae1bab683118f6733a849775a68ed32fa002401b120826e373d3cf16b141198394a5536bf5e4375febcb1ce2b70daa500564075120c9f8760277f511efd4ee03473149d4bd55281812096322648e47d30b2845bb3a54f6e4ea1c0f3872a1d05263241683236b444c6ff005c19c378b50a0cd3de29312ad1223d87e98abe573ea2a96d6749e446db089df9618257d418d360e498dfcc4efd04db074d7712d3e510710cd354aaee0b805891e2e5f2c663d6c8cdcd3bf928c6635bf727d287c955191916604f48d3fd4fea311f77a4dc41f3c18b8975da0dc743b63ced4cf6545217838634f8b551cc10391fdce06aca86c0c1e77b7f7180abd37504ee3aadede7cc7bc619333a0ecdf18aef175a427c414ea2447e68117c41d9ea872955ab212ccc34b6bb82bd22779e784b5b3e8bbb5fa0dfe985f98e38db531ee6e7e5b0fae3a23adf072e4e9a77276763e1fdada2c425456a6c4c08f1027f5fd70db421aaac402002263ac7f6c7cf4bc5183ad46760411066ebe9d3db167c9ff887980453a6a2b1eac0cfb47ea71d11c36adb392538f6443fe27766abae6ab570a3b977956d43981cb7de7962b7d95e26995adde3515aa40fc4763d57ce39e1a716cdd7cd54d351bbdaa41d2aa642cfd04733b0f2c32ecf70114416cc52a7204ea0ec4fa47c3f2c0924b65b935776749cbd3cc9542728fa1c03a92b06235091e129b7a9c1f5b24f448169636d5f131fac903909f6c0591eda28a7dd81a6100461e288000b45c62c59ba7433a8845553a09368224a95b83ea70b2c316b82f1cf923dec51aa77df0b389e7569fc00924c13234af324cf2b6c3ae3ced155ee4ba0ccad463a74d2b6a11ab50d4370445a6d1e78a171fe362a7dc950141058309d51f840e60f5db128608deecb4bc5b6aa2a887b4149ead7a15bbdef1a98352a498804a95089c858fb5ccdb1af07e135b3d55d94c2fc2f56e3ff006281fa5a66e62d8dfb37c3933d55fbf65445fc360c458402760008fd3cba7e4569d3d34292c0092aaa0901418dc799c1c9924ad4513c38d4ddcdfee0fc178450cb535a41352d831224b799f7f972c543b69c5a9e56a5139382c4195f11124907ce48e879c8c5cdcf784836452411cc91b83f94796e7d37de08d848e5fdba639e13d3b51db2c2a4d35b50afb2fc5ea666996a9963474d849dcf90201118679965406a3b90a2fb91fa6e7a0bf2c63e6d5412c6001727f7fbb62a3c4f38ed54be96237546688e8c47ec8c68c353be11b2e558e3eec734d9ea1152a0b0fe1a9fc20fe268b6b23e42dd4945da5e39de3fd8e8369247df383f08fc808d8f53c87ada1ccf6919d0d3a642b91f16fa40e63a9e9e784bd97e0e6b661a924f76a3554799dced27776dfd249f3ee5921085a3cc7ab24be58cfb11c110d76ccb06d14c9a54d4532640173201004f4e918e8eb5d4989f9a91fa8c0d572a740a544aa4586f6006c22f8459ce23f656a6b99ab0ae0f8899f2d33c8f998e78e592965f31df071c2d40b0543a8f90dbccf5fedff1859c478250ae3ef29ab9ea47887a302187b1186194ccd3aaa1a9323af55208f4b6d8daa0ebb621ba3a5a4d1cf78c7f8754619e9d76a7b93de1d6a00b9332185bcce14e4a9d3a2a10b104736045fa89b462d9db7e210172ea7e2f13f9283653fea3f453d70ab39e3d0889e372154df9eec41e824fb63bf0ea71b6cf33c4284655141596e125d036b8e969b1ea7d7cb02bf08ab210b53b890240240f5b74c5c72f4765e4a373bdbae182a0686807fdf0279b46c6c5e1fa8aee8e7d9acad5507529023737185992ab55029ef0905a4da0c4c48f718e959da0ba6ea2490058733fb3ed8599be114dcc89568dc5c5ccdc1f3c4fac9b4c697839766264e31522ceff00338f30cb27c22aa205d74da26e438dc93b0781131ed8cc57ad1ffac5e864f6ff001fb812ef8d9b6c798cc79fdcf4c1ce16719a845068245c8b1e44ed8cc66298fd48964f4b29d577c45c37e16ff5e33198ef97078f21a2a8d26c3e26fe989a9787275196c4b448b189da7198cc4f1722c467d8551ddb98b9a904f38d22de98b0677198cc51f25901cdb06652bb0b066020da4c6331985c9e9609706b44eacd520d710e60dc598c7cb0376cb2e8208550645e0633198e48f61f1fa595aecc31ef809dea5fcee77c341b93cf5feba7198cc6ceda96c4665aff00c39a85a957049201a71266354cc749e78b6328b63319819795f447a9e0bd0fea22ed1319a424c78be8b6c56788fc47dbf5c66331787e1a39bc4fe2329bc45c8a96247886d8b2f626b30d203100b09826f8f7198697a01e1fd674e563de2fae39cff8bbb65fd07ff7c663303c3f05bc57ac69fe18a819426049ac64f58d1be2e1587eb8cc663927eb67662f4239971f62735589fce07b695b618e407fd6a7fe939f7f0df198cc7a31f4fd8f2b2fadfd4b9e45446dcbfbe37cbfc47d7198cc7165f533bf07e1a34cc7e0ff0051ff00c4e23c663308ce889a118cc66330063fffd9, 'A', 2, 2);

--
-- Volcado de datos para la tabla `logins`
--

INSERT INTO `logins` (`idlogin`, `usuariologin`, `paswordlogin`, `fecharegistrologin`, `estatuslogin`, `idrollogin`) VALUES
(1, 'admin', '123', '2013-04-13', 'A', 1),
(2, 'aurora1', '123', '2012-10-13', 'A', 3),
(3, 'zammy1', '123', '2012-11-13', 'A', 3);

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `codigoinmueble`, `metroscuadradosinmueble`, `alicuotainmueble`, `descripcioninmueble`, `estatusinmueble`, `codigocatastralinmueble`, `idcopropietarioinmueble`, `idlogininmueble`, `idcondominioinmueble`) VALUES
(1, 'I-1', 20, 1500, 'Apartamento', 'A', '112', 2, 2, 1),
(2, 'I-2', 25, 1600, 'Apartamento', 'A', '223', 3, 3, 1);

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`idproveedor`, `rifproveedor`, `razonsocialproveedor`, `correoproveedor`, `telefonoproveedor`, `estatusproveesor`, `idciudadproveedor`, `nombreproveedor`) VALUES
(1, 'J-1212121-2', 'Los Aseadores', 'ase@dore.com', '0414-1212121', 'A', 1, 'Pedro Balza'),
(2, 'J-2121212-1', 'BarLuz', 'bar@luz.com', '0251-2121212', 'A', 1, 'Marcos Sanchez'),
(3, 'J-313131-3', 'Lara Gas', 'lar@gas.com', '0251-1236547', 'A', 1, 'Martin Urdaneta');

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idservicio`, `codigoservicio`, `descripcionservicio`, `estatusservicio`) VALUES
(1, 'S-1', 'Servicio de limpieza', 'A'),
(2, 'S-2', 'Servicio de luz', 'A'),
(3, 'S-3', 'Servicio de gas', 'A');

--
-- Volcado de datos para la tabla `proveedorxcondominios`
--

INSERT INTO `proveedorxcondominios` (`idproveedorxcondominio`, `idproveedorproveedorxcndominio`, `idcondominioproveedorxcondominio`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

--
-- Volcado de datos para la tabla `proveedorxservicios`
--

INSERT INTO `proveedorxservicios` (`idproveedorxservicio`, `idproveedorxcondominioproveedorxservicio`, `idservicioproveedorxservicio`, `estatusproveedorxservicio`, `codigoproveedorxservicio`) VALUES
(1, 1, 1, 'A', '1-1'),
(2, 2, 2, 'A', '2-2'),
(3, 3, 3, 'A', '3-3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
