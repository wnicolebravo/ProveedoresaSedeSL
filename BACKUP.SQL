/* BACK UP DE LA BASE DE DATOS A SEDE, PROYECTO QUE PRESENTARE PARA EL FINAL DE CURSADA, DETALLO DEBAJO LO QUE CONTIENE ESTE BACK:
TABLA
-PROVEEDORES
-PEDIDOS
-PRODUCTOS
-DETALLEPEDIDO
-SEDE

FUNCIONES: 
-Costeo
-TotalPedidos


CONTIENE VISTAS:
-vista_CalendarioPedidos
-vista_tipoProd
-vista_Productos
-vista_detallesPedidos
-


CONTIENE STORED PROCEDURES:
-PRODUCTOS_DE_COMPRA_MINIMA
-PROV_UBI

*/

-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: ProvASEDE
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `IDProv` int NOT NULL,
  `tipoProd` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `nomProv` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `dirProv` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `telProv` int NOT NULL,
  `redesProv` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `emailProv` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`IDProv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'Panaeria de masa madre','Aliter Mother','Soldado de Dependencia 3000',1560042301,'@AlitermotherPanes  (instagram)','alitermother@gmail.com.ar'),(2,'Croissant veganas','CroqueMonseiur','Juan b Justoli 340',1579859022,'@Croquemonseiur','CROISSANT@gmail.com'),(3,'Cookies estilo NY','CookieMonster','Muñoz 1204,CABA',1570021355,'@CookieMonsta','cookiesmonsta@gmail.es'),(4,'Pasteleria vegana','VeganMash','Guatebuena 3444,CABA',1523949501,'@Veganmash','veganmash@vegan.com.ar'),(5,'Ensalada de Fruta','FrutitasBB','Av Hablao 912, CABA.',1598324421,'@damefrutitabb','frutitasmas@mandandofruta.com.ar');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:30


--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `IDProd` int NOT NULL,
  `nomProd` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `IDProv` int NOT NULL AUTO_INCREMENT,
  `loteProd` int NOT NULL,
  `cantProd` int NOT NULL,
  `pesoProd` int NOT NULL,
  `preUnProd` int NOT NULL,
  PRIMARY KEY (`IDProd`),
  KEY `Productos_ibfk_1` (`IDProv`),
  CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`IDProv`) REFERENCES `Proveedores` (`IDProv`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (9,'Lemon Pie',4,240,1,750,750),(12,'Cheesecake de frutos rojos',4,420,1,750,800),(23,'Chocotorta',4,160,1,750,650),(27,'Ensalada de frutas de estacion',5,56,1,250,180),(60,'Torta Bruce',4,323,1,750,600),(89,'Cookie con chips de chocolate NY',3,1230,1,100,95),(721,'Croissant vegano',2,982,1,100,95),(914,'Pan lactal',1,1222,1,500,120),(923,'Brioche',1,2123,1,1000,180),(929,'Pan de campo de masa madre',1,2339,1,500,90);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarPrecioProducto` BEFORE UPDATE ON `Productos` FOR EACH ROW BEGIN
  IF NEW.preUnProd <> OLD.preUnProd
    THEN
      SET NEW.preUnProd = NEW.preUnProd * 2;
  END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:35


--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `IDPedido` int NOT NULL,
  `FechaPedido` date NOT NULL,
  `IDProv` int NOT NULL,
  `IDProd` int NOT NULL,
  `cantProd` int NOT NULL,
  `FechaEntrega` date NOT NULL,
  `preTotal` int NOT NULL,
  PRIMARY KEY (`IDPedido`),
  KEY `IDProd` (`IDProd`),
  KEY `IDProv` (`IDProv`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`IDProd`) REFERENCES `Productos` (`IDProd`),
  CONSTRAINT `Pedido_ibfk_2` FOREIGN KEY (`IDProv`) REFERENCES `Proveedores` (`IDProv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (12,'2021-09-11',1,929,10,'2021-09-12',900),(13,'2021-09-12',1,914,10,'2021-09-12',1200),(14,'2021-09-12',1,929,10,'2021-09-12',900),(15,'2021-09-11',4,12,5,'2021-09-12',4000),(123,'2021-09-11',3,89,80,'2021-09-12',7600),(338,'2021-09-12',5,27,20,'2021-09-15',3600),(456,'2021-09-12',4,9,9,'2021-09-13',5400),(457,'2021-09-12',4,12,10,'2021-09-13',8000),(2323,'2021-09-11',4,60,9,'2021-09-12',5400);
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_pedidos_nuevos` BEFORE INSERT ON `Pedido` FOR EACH ROW BEGIN
	INSERT INTO Movimientos (Detalle,FechaEntrada) VALUE ('Se ha insertado un pedido',current_timestamp());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:33


--
-- Table structure for table `Movimientos`
--

DROP TABLE IF EXISTS `Movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movimientos` (
  `IDMov` int NOT NULL,
  `Detalle` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `FechaEntrada` date DEFAULT NULL,
  PRIMARY KEY (`IDMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movimientos`
--

LOCK TABLES `Movimientos` WRITE;
/*!40000 ALTER TABLE `Movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Movimientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:34


--
-- Table structure for table `DetallesPedido`
--

DROP TABLE IF EXISTS `DetallesPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetallesPedido` (
  `DetaSoNP` int NOT NULL,
  `IDPedido` int NOT NULL,
  `DescDeta` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `FechaPedido` date NOT NULL,
  `IDSede` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`DetaSoNP`),
  KEY `IDPedido` (`IDPedido`),
  CONSTRAINT `DetallesPedido_ibfk_1` FOREIGN KEY (`IDPedido`) REFERENCES `Pedido` (`IDPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetallesPedido`
--

LOCK TABLES `DetallesPedido` WRITE;
/*!40000 ALTER TABLE `DetallesPedido` DISABLE KEYS */;
INSERT INTO `DetallesPedido` VALUES (110,338,'SIN KIWI','2021-09-12','1'),(111,12,'SIN HARINA INTEGRAL','2021-09-13','2'),(112,15,'SIN FRAMBUESA','2021-09-12','2'),(113,2323,'EXTRA CHOCOLATE','2021-09-12','2'),(114,338,'CON JUGO DE POMELO','2021-09-15','1');
/*!40000 ALTER TABLE `DetallesPedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:35


--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `IDPedido` int NOT NULL,
  `FechaPedido` date NOT NULL,
  `IDProv` int NOT NULL,
  `IDProd` int NOT NULL,
  `cantProd` int NOT NULL,
  `FechaEntrega` date NOT NULL,
  `preTotal` int NOT NULL,
  PRIMARY KEY (`IDPedido`),
  KEY `IDProd` (`IDProd`),
  KEY `IDProv` (`IDProv`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`IDProd`) REFERENCES `Productos` (`IDProd`),
  CONSTRAINT `Pedido_ibfk_2` FOREIGN KEY (`IDProv`) REFERENCES `Proveedores` (`IDProv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (12,'2021-09-11',1,929,10,'2021-09-12',900),(13,'2021-09-12',1,914,10,'2021-09-12',1200),(14,'2021-09-12',1,929,10,'2021-09-12',900),(15,'2021-09-11',4,12,5,'2021-09-12',4000),(123,'2021-09-11',3,89,80,'2021-09-12',7600),(338,'2021-09-12',5,27,20,'2021-09-15',3600),(456,'2021-09-12',4,9,9,'2021-09-13',5400),(457,'2021-09-12',4,12,10,'2021-09-13',8000),(2323,'2021-09-11',4,60,9,'2021-09-12',5400);
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_pedidos_nuevos` BEFORE INSERT ON `Pedido` FOR EACH ROW BEGIN
	INSERT INTO Movimientos (Detalle,FechaEntrada) VALUE ('Se ha insertado un pedido',current_timestamp());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:33

-
-- Temporary view structure for view `vista_CalendarioPedidos`
--

DROP TABLE IF EXISTS `vista_CalendarioPedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_CalendarioPedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_CalendarioPedidos` AS SELECT 
 1 AS `IDPedido`,
 1 AS `FechaPedido`,
 1 AS `FechaEntrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipoProd`
--

DROP TABLE IF EXISTS `vista_tipoProd`;
/*!50001 DROP VIEW IF EXISTS `vista_tipoProd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipoProd` AS SELECT 
 1 AS `IDProv`,
 1 AS `tipoProd`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_Productos`
--

DROP TABLE IF EXISTS `vista_Productos`;
/*!50001 DROP VIEW IF EXISTS `vista_Productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_Productos` AS SELECT 
 1 AS `IDProd`,
 1 AS `nomProd`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detallesPedidos`
--

DROP TABLE IF EXISTS `vista_detallesPedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_detallesPedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detallesPedidos` AS SELECT 
 1 AS `IDPedido`,
 1 AS `DescDeta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productosPedidos`
--

DROP TABLE IF EXISTS `vista_productosPedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_productosPedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productosPedidos` AS SELECT 
 1 AS `IDPedido`,
 1 AS `IDProv`,
 1 AS `IDProd`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_CalendarioPedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_CalendarioPedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_CalendarioPedidos` AS select `Pedido`.`IDPedido` AS `IDPedido`,`Pedido`.`FechaPedido` AS `FechaPedido`,`Pedido`.`FechaEntrega` AS `FechaEntrega` from `Pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipoProd`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipoProd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipoProd` AS select `Proveedores`.`IDProv` AS `IDProv`,`Proveedores`.`tipoProd` AS `tipoProd` from `Proveedores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_Productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_Productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_Productos` AS select `Productos`.`IDProd` AS `IDProd`,`Productos`.`nomProd` AS `nomProd` from `Productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detallesPedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_detallesPedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detallesPedidos` AS select `DetallesPedido`.`IDPedido` AS `IDPedido`,`DetallesPedido`.`DescDeta` AS `DescDeta` from `DetallesPedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productosPedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productosPedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productosPedidos` AS select `Pedido`.`IDPedido` AS `IDPedido`,`Pedido`.`IDProv` AS `IDProv`,`Pedido`.`IDProd` AS `IDProd` from `Pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'ProvASEDE'
--

--
-- Dumping routines for database 'ProvASEDE'
--
/*!50003 DROP FUNCTION IF EXISTS `Costeo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Costeo`(p_nombreproducto varchar(100)) RETURNS char(20) CHARSET utf8mb3 COLLATE utf8mb3_bin
    DETERMINISTIC
BEGIN 
declare var varchar(100);
 set var = (SELECT IF(preUnProd>100, "ALTO", "BAJO")
FROM Productos where p_nombreproducto=nomProd);
return var;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalPedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalPedidos`( ped INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE Ped INT;
    SELECT COUNT(*) INTO Ped FROM Pedido;
    RETURN Ped;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_de_compra_minima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Productos_de_compra_minima`(IN p_IDProd int)
BEGIN
 SELECT IF ( pesoProd < 500 , "Peso menor a 500,comprar min 5 u", "Peso mayor a 500,comprar 1 u")as Resultado, nomprod nombre_producto
 ,pesoProd peso_producto FROM Productos
 WHERE IDProd = p_IDProd;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Prov_Ubi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prov_Ubi`(IN Ubi CHAR(40))
BEGIN
	SELECT * FROM Proveedores 
    WHERE dirProv LIKE CONCAT ('%',Ubi,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 12:15:36


