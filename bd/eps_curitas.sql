-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2022 at 09:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eps_curitas`
--

-- --------------------------------------------------------

--
-- Table structure for table `especialidad`
--

CREATE TABLE `especialidad` (
  `id_cita_esp` bigint(20) UNSIGNED NOT NULL,
  `doc_esp` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `medico_esp` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `centro_esp` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_esp` date NOT NULL,
  `hora_esp` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `especialidad` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `especialidad`
--

INSERT INTO `especialidad` (`id_cita_esp`, `doc_esp`, `medico_esp`, `centro_esp`, `fecha_esp`, `hora_esp`, `especialidad`) VALUES
(1, '1098727947', 'Dra. Maria del Pilar Aranza Jimenez', 'Cra. 25 #29-36, Giron', '2022-09-12', '10:00 AM', 'Odontologia'),
(2, '1098727947', 'Dr. Vicente Jose Carmona Pertuz', 'Cl. 30a #23-64, Floridablanca', '2022-09-13', '11:00 AM', 'Optometria'),
(3, '1520487952', 'Dr. Nicolas Villareal Trujillo', 'Cl. 30a #23-64, Floridablanca', '2022-09-12', '11:00 AM', 'Odontologia');

-- --------------------------------------------------------

--
-- Table structure for table `general`
--

CREATE TABLE `general` (
  `id_cita_gen` bigint(20) UNSIGNED NOT NULL,
  `doc_gen` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `medico_gen` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `centro_gen` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_gen` date NOT NULL,
  `hora_gen` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `general`
--

INSERT INTO `general` (`id_cita_gen`, `doc_gen`, `medico_gen`, `centro_gen`, `fecha_gen`, `hora_gen`) VALUES
(3, '1098727947', 'Dra. Maria Carmenza Cuenca Arias', 'Cl. 30a #23-64, Floridablanca', '2022-09-16', '12:00 PM'),
(4, '1098727947', 'Dr. Dario Fuertes Bola??os', 'Cra. 11 #8-58, Piedecuesta', '2022-09-15', '4:00 PM'),
(5, '1520487952', 'Dr. Alberto Gonzalez', 'Cra. 11 #8-58, Piedecuesta', '2022-09-14', '12:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `ciudad` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `civil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`nombre`, `apellido`, `documento`, `correo`, `contrasena`, `ciudad`, `direccion`, `sexo`, `civil`) VALUES
('Juan', 'Celis', '100752518', 'juancho_celis@outlook.com', 'JuanchoCelis', 'Bucaramanga', 'Conjunto Tajamar Torre 2 - Apto 1104', 'Masculino', 'Soltero(a)'),
('Lessly', 'Barba', '101002547', 'lessly_barba@outlook.com', 'Less123*', 'Floridablanca', 'Transversal 15 # 20 - 81', 'Femenino', 'Viudo(a)'),
('Andres', 'Olarte', '1098727947', 'perst.12@hotmail.com', 'Bucaros2022', 'Giron', 'Calle 101 # 31 - 36', 'Masculino', 'Viudo(a)'),
('Juan', 'Soto', '1098790077', 'camilo_soto@hotmail.com', 'Cami123', 'Giron', 'Calle 101 # 31-36', 'Masculino', 'Casado(a)'),
('Mario', 'Hernandez', '1520487952', 'carlos19@hotmail.com', 'Carlitos2022', 'Bucaramanga', 'Carrea 25a # 15 - 40', 'Masculino', 'Casado(a)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_cita_esp`),
  ADD UNIQUE KEY `id_cita_esp` (`id_cita_esp`);

--
-- Indexes for table `general`
--
ALTER TABLE `general`
  ADD PRIMARY KEY (`id_cita_gen`),
  ADD UNIQUE KEY `id_cita_gen` (`id_cita_gen`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`documento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_cita_esp` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `general`
--
ALTER TABLE `general`
  MODIFY `id_cita_gen` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
