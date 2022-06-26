-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.29 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sales_system
CREATE DATABASE IF NOT EXISTS `sales_system` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sales_system`;

-- Volcando estructura para tabla sales_system.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_dni` char(8) COLLATE utf8_bin NOT NULL,
  `customer_name` char(250) COLLATE utf8_bin NOT NULL,
  `customer_lastname` char(250) COLLATE utf8_bin NOT NULL,
  `customer_number_phone` tinyint NOT NULL,
  `customer_birth_date` date NOT NULL,
  PRIMARY KEY (`customer_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sales_system.product
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` char(250) COLLATE utf8_bin NOT NULL,
  `product_price` decimal(20,2) NOT NULL,
  `product_stock` smallint NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sales_system.provide_product
CREATE TABLE IF NOT EXISTS `provide_product` (
  `provide_id` int NOT NULL AUTO_INCREMENT,
  `provide_product_id` int NOT NULL,
  `provide_suplier_dni` char(8) COLLATE utf8_bin NOT NULL,
  `provide_product_date_in` datetime NOT NULL,
  PRIMARY KEY (`provide_id`),
  KEY `provide_product_id_FK1` (`provide_product_id`),
  KEY `provide_suplier_dni_FK2` (`provide_suplier_dni`),
  CONSTRAINT `provide_product_id_FK1` FOREIGN KEY (`provide_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `provide_suplier_dni_FK2` FOREIGN KEY (`provide_suplier_dni`) REFERENCES `supplier` (`supplier_dni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sales_system.sale
CREATE TABLE IF NOT EXISTS `sale` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `sale_customer_dni` char(8) COLLATE utf8_bin NOT NULL,
  `sale_product_id` int NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `sale_customer_dni_FK1` (`sale_customer_dni`),
  KEY `sale_product_id_FK2` (`sale_product_id`),
  CONSTRAINT `sale_customer_dni_FK1` FOREIGN KEY (`sale_customer_dni`) REFERENCES `customer` (`customer_dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_product_id_FK2` FOREIGN KEY (`sale_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sales_system.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_dni` char(8) COLLATE utf8_bin NOT NULL,
  `supplier_name` char(250) COLLATE utf8_bin NOT NULL,
  `supplier_lastname` char(250) COLLATE utf8_bin NOT NULL,
  `supplier_phone_number` char(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`supplier_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
