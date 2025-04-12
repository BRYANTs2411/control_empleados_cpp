-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         9.2.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para control_personal
CREATE DATABASE IF NOT EXISTS `control_personal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `control_personal`;

-- Volcando estructura para tabla control_personal.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int NOT NULL,
  `personas_id` int DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_empleados_personal` (`personas_id`),
  CONSTRAINT `FK_empleados_personal` FOREIGN KEY (`personas_id`) REFERENCES `personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla control_personal.empleados: ~9 rows (aproximadamente)
INSERT INTO `empleados` (`id`, `personas_id`, `cargo`) VALUES
	(1, 1, 'Jefe'),
	(2, 2, 'Gerente'),
	(3, 3, 'Subgerente'),
	(4, 4, 'Contador'),
	(5, 5, 'Vendedor'),
	(6, 6, 'Vendedora'),
	(7, 7, 'Vendedor'),
	(8, 8, 'Vendedora'),
	(9, 9, 'Vendedor');

-- Volcando estructura para tabla control_personal.personal
CREATE TABLE IF NOT EXISTS `personal` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla control_personal.personal: ~9 rows (aproximadamente)
INSERT INTO `personal` (`id`, `nombre`, `edad`, `genero`) VALUES
	(1, 'Bryant', 19, 'Masculino'),
	(2, 'Jimmy', 22, 'Masculino'),
	(3, 'Jaime', 21, 'Masculino'),
	(4, 'Mario', 25, 'Masculino'),
	(5, 'Fred', 23, 'Masculino'),
	(6, 'Berta', 20, 'Femenina'),
	(7, 'Esquivel', 21, 'Masculino'),
	(8, 'Andrea', 20, 'Femenina'),
	(9, 'Lenin', 25, 'Masculino');

-- Volcando estructura para tabla control_personal.registros
CREATE TABLE IF NOT EXISTS `registros` (
  `id` int NOT NULL,
  `empleados_id` int DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_registros_empleados` (`empleados_id`),
  CONSTRAINT `FK_registros_empleados` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla control_personal.registros: ~9 rows (aproximadamente)
INSERT INTO `registros` (`id`, `empleados_id`, `hora_entrada`, `hora_salida`, `fecha`) VALUES
	(1, 1, '08:00:00', '18:00:00', '2025-04-11'),
	(2, 3, '08:00:00', '18:00:00', '2025-04-11'),
	(3, 4, '09:00:00', '17:00:00', '2025-04-11'),
	(4, 5, '07:50:00', '18:00:00', '2025-04-11'),
	(5, 5, '20:51:07', '20:51:08', '2025-04-11'),
	(6, 6, '20:51:19', '20:51:20', '2025-04-11'),
	(7, 7, '20:51:28', '20:51:28', '2025-04-11'),
	(8, 8, '20:51:37', '20:51:38', '2025-04-11'),
	(9, 9, '20:51:46', '20:51:47', '2025-04-11');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
