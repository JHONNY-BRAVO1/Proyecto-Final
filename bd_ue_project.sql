-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2022 a las 03:36:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_ue_project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `cod_doc` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `ci` varchar(15) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecha_nac` date NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `cod_mat` varchar(10) DEFAULT NULL,
  `cod_grado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`cod_doc`, `nombre`, `apellidos`, `ci`, `direccion`, `fecha_nac`, `telefono`, `cod_mat`, `cod_grado`) VALUES
('D-001', 'Omar', 'Pedran Vazques', '9449414', 'Av. Roma No. 4512', '1999-06-30', '66154136', 'M-001', 'G-001'),
('D-002', 'Kevin', 'Vedrom Bolca', '465461', 'Distrito 10 No. 1000', '2000-07-30', '77756413', 'M-002', 'G-002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `rude` varchar(20) NOT NULL,
  `ci` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cod_ppff` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`rude`, `ci`, `nombre`, `apellidos`, `fecha_nacimiento`, `direccion`, `estado`, `cod_ppff`) VALUES
('AF002NT', 6598870, 'KEVIN', 'CANAZA SANGA', '2011-07-15', 'AV/BALLIVIAN/CALLE/CHUQIMIA', 'ACTIVO', 'P-001'),
('ES001TN', 7632541, 'CRISTHIAN', 'CHOQUEHUANCA APAZA', '2010-08-06', 'AV/BALLIVIAN/CALLE/TACACOMA', 'ACTIVO', 'P-002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `cod_grado` varchar(10) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `cod_paralelo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`cod_grado`, `descripcion`, `cod_paralelo`) VALUES
('G-001', 'Primero', 'PRL-01'),
('G-002', 'Segundo', 'PRL-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `cod_inscripcion` varchar(10) NOT NULL,
  `rude1` varchar(20) NOT NULL,
  `cod_grado1` varchar(10) NOT NULL,
  `cod_turno` varchar(10) NOT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_inscripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`cod_inscripcion`, `rude1`, `cod_grado1`, `cod_turno`, `fecha`, `tipo_inscripcion`) VALUES
('I-001', 'AF002NT', 'G-001', 'T-001', '2022-02-02', 'NUEVO'),
('I-002', 'ES001TN', 'G-002', 'T-002', '2022-03-12', 'NUEVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `cod_mat` varchar(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`cod_mat`, `descripcion`, `sigla`) VALUES
('M-001', 'Matematicas', 'MAT-001'),
('M-002', 'Lenjuaje', 'LEN-002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `cod_nota` varchar(10) NOT NULL,
  `rude` varchar(20) NOT NULL,
  `primer_trimestre` int(11) NOT NULL,
  `segundo_trimestre` int(11) NOT NULL,
  `tercer_trimestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`cod_nota`, `rude`, `primer_trimestre`, `segundo_trimestre`, `tercer_trimestre`) VALUES
('N-001', 'ES001TN', 96, 86, 82),
('N-002', 'AF002NT', 75, 75, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paralelo`
--

CREATE TABLE `paralelo` (
  `cod_paralelo` varchar(10) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paralelo`
--

INSERT INTO `paralelo` (`cod_paralelo`, `descripcion`) VALUES
('PRL-01', 'PARALELO-A'),
('PRL-02', 'PARALELO-B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_laboral`
--

CREATE TABLE `permiso_laboral` (
  `cod_permiso` varchar(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `cod_doc` varchar(10) DEFAULT NULL,
  `cod_admi` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permiso_laboral`
--

INSERT INTO `permiso_laboral` (`cod_permiso`, `descripcion`, `fecha`, `fecha_inicio`, `fecha_final`, `cod_doc`, `cod_admi`) VALUES
('PL-0001', 'Viaje', '2022-06-01', '2022-06-06', '2022-06-17', 'D-001', NULL),
('PL-0002', 'Auncencia de viaje', '2022-04-10', '2022-04-11', '2022-04-15', NULL, 'PA-002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_administrativo`
--

CREATE TABLE `personal_administrativo` (
  `cod_admi` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `ci` varchar(15) NOT NULL,
  `fecha_nac` date NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal_administrativo`
--

INSERT INTO `personal_administrativo` (`cod_admi`, `nombre`, `apellidos`, `ci`, `fecha_nac`, `direccion`, `telefono`, `cargo`) VALUES
('231231', '231312', '213212331', '321321', '2022-02-01', '1323213', '3213213', 'dire'),
('PA-001', 'Jose Carlos', 'Villagran Torrez', '4874459', '2000-03-25', 'AV. Francia No. 1412', '76451561', 'portero'),
('PA-002', 'Abril', 'Quiroga Lopez', '1548123', '1999-03-25', 'Av. La Paz No. 1574', '64784132', 'regentes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ppff`
--

CREATE TABLE `ppff` (
  `cod_ppff` varchar(10) NOT NULL,
  `ci` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `tipo_pariente` varchar(20) NOT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ppff`
--

INSERT INTO `ppff` (`cod_ppff`, `ci`, `nombre`, `apellidos`, `fecha_nacimiento`, `direccion`, `tipo_pariente`, `telefono`) VALUES
('P-001', 7956231, 'RUBEN', 'COPA COLQUE', '1990-01-11', 'AV/BALLIVIAN/CALLE/TACACOMA', 'PADRE', 77785669),
('P-002', 6033623, 'ANA', 'RUIZ APAZA', '1997-06-22', 'AV/CHOQUIMIA/CALLE/CALAMA', 'MADRE', 73321458);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `cod_turno` varchar(10) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `inicio` varchar(20) NOT NULL,
  `fin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`cod_turno`, `turno`, `inicio`, `fin`) VALUES
('123123123', 'Ã±andu', '18:26', '14:30'),
('T-001', 'MaÃ±ana', '08:00', '12:00'),
('T-002', 'TARDE', '13:00', '18:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cod_usr` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod_usr`, `nombre`, `apellidos`, `usuario`, `contraseña`, `tipo_usuario`) VALUES
(1, 'Kevin', 'Canaza Sanga', 'KevinCS', '9994841', 'ADMINISTRADOR'),
(2, 'Alison Cielo', 'Alaro Vino', 'AlisonAV', '9173259', 'ADMINISTRADOR'),
(3, 'Cristhian', ' Choquehuanca Apaza', 'CristhianCA', '7099250', 'ADMINISTRADOR'),
(6, 'Admi', 'Nistrador', 'admin', 'admin', 'ADMINISTRADOR');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`cod_doc`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD KEY `FK_Cod_mat` (`cod_mat`),
  ADD KEY `FK_Cod_grado` (`cod_grado`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`rude`),
  ADD KEY `FK_cod_ppff` (`cod_ppff`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`cod_grado`),
  ADD KEY `FK_cod_paralelo` (`cod_paralelo`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`cod_inscripcion`),
  ADD KEY `FK_Rude1` (`rude1`),
  ADD KEY `FK_Cod_grado02` (`cod_grado1`),
  ADD KEY `FK_Cod_turno` (`cod_turno`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`cod_mat`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`cod_nota`),
  ADD KEY `FK_rude` (`rude`);

--
-- Indices de la tabla `paralelo`
--
ALTER TABLE `paralelo`
  ADD PRIMARY KEY (`cod_paralelo`);

--
-- Indices de la tabla `permiso_laboral`
--
ALTER TABLE `permiso_laboral`
  ADD PRIMARY KEY (`cod_permiso`),
  ADD KEY `FK_Cod_doc01` (`cod_doc`),
  ADD KEY `FK_Cod_admi` (`cod_admi`);

--
-- Indices de la tabla `personal_administrativo`
--
ALTER TABLE `personal_administrativo`
  ADD PRIMARY KEY (`cod_admi`),
  ADD UNIQUE KEY `ci` (`ci`);

--
-- Indices de la tabla `ppff`
--
ALTER TABLE `ppff`
  ADD PRIMARY KEY (`cod_ppff`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`cod_turno`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod_usr`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod_usr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `FK_Cod_grado` FOREIGN KEY (`cod_grado`) REFERENCES `grado` (`cod_grado`),
  ADD CONSTRAINT `FK_Cod_mat` FOREIGN KEY (`cod_mat`) REFERENCES `materias` (`cod_mat`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `FK_cod_ppff` FOREIGN KEY (`cod_ppff`) REFERENCES `ppff` (`cod_ppff`);

--
-- Filtros para la tabla `grado`
--
ALTER TABLE `grado`
  ADD CONSTRAINT `FK_cod_paralelo` FOREIGN KEY (`cod_paralelo`) REFERENCES `paralelo` (`cod_paralelo`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `FK_Cod_grado02` FOREIGN KEY (`cod_grado1`) REFERENCES `grado` (`cod_grado`),
  ADD CONSTRAINT `FK_Cod_turno` FOREIGN KEY (`cod_turno`) REFERENCES `turno` (`cod_turno`),
  ADD CONSTRAINT `FK_Rude1` FOREIGN KEY (`rude1`) REFERENCES `estudiantes` (`rude`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `FK_rude` FOREIGN KEY (`rude`) REFERENCES `estudiantes` (`rude`);

--
-- Filtros para la tabla `permiso_laboral`
--
ALTER TABLE `permiso_laboral`
  ADD CONSTRAINT `FK_Cod_admi` FOREIGN KEY (`cod_admi`) REFERENCES `personal_administrativo` (`cod_admi`),
  ADD CONSTRAINT `FK_Cod_doc01` FOREIGN KEY (`cod_doc`) REFERENCES `docentes` (`cod_doc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
