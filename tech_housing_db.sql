-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 24-04-2023 a las 00:54:08
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tech_housing_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitaciones`
--

CREATE TABLE `capacitaciones` (
  `id_capacitacion` int(11) NOT NULL COMMENT 'Identificador único de la capacitación',
  `nombre_capacitacion` varchar(255) NOT NULL COMMENT 'Nombre de la capacitación',
  `nombre_institucion` varchar(255) NOT NULL COMMENT 'Nombre de la institución que impartió la capacitación',
  `periodo_capacitacion` date NOT NULL COMMENT 'Período en que se realizó la capacitación',
  `modalidad_capacitacion` varchar(255) NOT NULL COMMENT 'Modalidad en que se impartió la capacitación',
  `horas_capacitacion` int(11) NOT NULL COMMENT 'Horas de duración de la capacitación',
  `descripcion_capacitacion` text NOT NULL COMMENT 'Descripción de la capacitación',
  `estado_capacitacion` varchar(255) NOT NULL COMMENT 'Estado actual de la capacitación',
  `fuente_financiamiento_capacitacion` varchar(255) NOT NULL COMMENT 'Fuente de financiamiento de la capacitación',
  `id_empleado` int(11) NOT NULL COMMENT 'Identificador único del empleado que recibió la capacitación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL COMMENT 'Identificador único del cargo',
  `nombre_cargo` varchar(255) NOT NULL COMMENT 'Nombre del cargo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL COMMENT 'Identificador único del departamento',
  `nombre_departamento` varchar(255) NOT NULL COMMENT 'Nombre del departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL COMMENT 'Identificador único del empleado',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre del empleado',
  `apellido` varchar(255) NOT NULL COMMENT 'Apellido del empleado',
  `correo_electronico` varchar(255) NOT NULL COMMENT 'Correo electrónico del empleado',
  `id_departamento` int(11) NOT NULL COMMENT 'Identificador único del departamento al que pertenece el empleado',
  `id_cargo` int(11) NOT NULL COMMENT 'Identificador único del cargo que ocupa el empleado',
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_mision`
--

CREATE TABLE `empleado_mision` (
  `id_empleado` int(11) NOT NULL COMMENT 'Identificador único del empleado que participó en la misión',
  `id_mision` int(11) NOT NULL COMMENT 'Identificador único de la misión en la que participó el empleado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misiones`
--

CREATE TABLE `misiones` (
  `id_mision` int(11) NOT NULL COMMENT 'Identificador único de la misión',
  `nombre_mision` varchar(255) NOT NULL COMMENT 'Nombre de la misión',
  `periodo_mision` date NOT NULL COMMENT 'Período en que se realizó la misión',
  `nombre_institucion_mision` varchar(255) NOT NULL COMMENT 'Nombre de la institución que solicitó la misión',
  `descripcion_mision` text NOT NULL COMMENT 'Descripción de la misión'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL,
  `nombre_modulo` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modify` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `create` int(11) NOT NULL DEFAULT 0,
  `read` int(11) NOT NULL DEFAULT 0,
  `update` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibos_capacitaciones`
--

CREATE TABLE `recibos_capacitaciones` (
  `id_recibo` int(11) NOT NULL COMMENT 'Identificador único del recibo',
  `tipo_recibo` varchar(255) NOT NULL COMMENT 'Tipo de recibo, por ejemplo, "factura" o "recibo de caja"',
  `imagen_recibo` mediumblob NOT NULL COMMENT 'Imagen del recibo escaneado o fotografiado',
  `id_capacitacion` int(11) NOT NULL COMMENT 'Identificador único de la capacitación a la que se refiere el recibo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `rol_role` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_role` text COLLATE utf8_spanish_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de administracion de permisos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `apellido_usuario` varchar(255) NOT NULL,
  `correo_usuario` varchar(255) NOT NULL,
  `contraseña_usuario` varchar(255) NOT NULL,
  `telefono_usuario` varchar(14) NOT NULL,
  `status` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `capacitaciones`
--
ALTER TABLE `capacitaciones`
  ADD PRIMARY KEY (`id_capacitacion`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `id_role_fk2` (`id_role`);

--
-- Indices de la tabla `empleado_mision`
--
ALTER TABLE `empleado_mision`
  ADD PRIMARY KEY (`id_empleado`,`id_mision`),
  ADD KEY `id_mision` (`id_mision`);

--
-- Indices de la tabla `misiones`
--
ALTER TABLE `misiones`
  ADD PRIMARY KEY (`id_mision`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `id_role_fk1` (`id_role`),
  ADD KEY `Id_modulo_fk1` (`id_modulo`);

--
-- Indices de la tabla `recibos_capacitaciones`
--
ALTER TABLE `recibos_capacitaciones`
  ADD PRIMARY KEY (`id_recibo`),
  ADD KEY `id_capacitacion` (`id_capacitacion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_role_fk` (`id_role`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `capacitaciones`
--
ALTER TABLE `capacitaciones`
  MODIFY `id_capacitacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la capacitación';

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cargo';

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del departamento';

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del empleado';

--
-- AUTO_INCREMENT de la tabla `misiones`
--
ALTER TABLE `misiones`
  MODIFY `id_mision` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la misión';

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recibos_capacitaciones`
--
ALTER TABLE `recibos_capacitaciones`
  MODIFY `id_recibo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del recibo';

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `capacitaciones`
--
ALTER TABLE `capacitaciones`
  ADD CONSTRAINT `capacitaciones_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`),
  ADD CONSTRAINT `id_role_fk2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado_mision`
--
ALTER TABLE `empleado_mision`
  ADD CONSTRAINT `empleado_mision_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `empleado_mision_ibfk_2` FOREIGN KEY (`id_mision`) REFERENCES `misiones` (`id_mision`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `Id_modulo_fk1` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_role_fk1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);

--
-- Filtros para la tabla `recibos_capacitaciones`
--
ALTER TABLE `recibos_capacitaciones`
  ADD CONSTRAINT `recibos_capacitaciones_ibfk_1` FOREIGN KEY (`id_capacitacion`) REFERENCES `capacitaciones` (`id_capacitacion`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `id_role_fk` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
