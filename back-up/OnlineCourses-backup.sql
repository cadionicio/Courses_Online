mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: OnlineCourses
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `CalificacionesPromedioPorCurso`
--

DROP TABLE IF EXISTS `CalificacionesPromedioPorCurso`;
/*!50001 DROP VIEW IF EXISTS `CalificacionesPromedioPorCurso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CalificacionesPromedioPorCurso` AS SELECT 
 1 AS `NombreCurso`,
 1 AS `CalificacionPromedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `ID_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Categoria`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar las categorÃ­as a las que pueden pertenecer los cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'Ciencia','Few more sell us pressure figure in.','2024-08-15 04:20:14'),(2,'Artes','Course similar fill gun.','2024-08-15 04:20:14'),(3,'Tecnología','Necessary write good whom career couple head building.','2024-08-15 04:20:14'),(4,'Ingeniería','Consider suffer friend nature claim doctor about.','2024-08-15 04:20:14'),(5,'Matemáticas','Other box early way hear consider.','2024-08-15 04:20:14');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comision`
--

DROP TABLE IF EXISTS `Comision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comision` (
  `ID_Comision` int NOT NULL AUTO_INCREMENT,
  `ID_Curso` int NOT NULL,
  `ID_Profesor` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Fecha_Fin` datetime NOT NULL,
  `Modalidad` varchar(100) NOT NULL,
  `Duracion` varchar(100) NOT NULL,
  `Horarios` varchar(255) NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Modificacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Comision`),
  UNIQUE KEY `Nombre` (`Nombre`,`Fecha_Inicio`,`Fecha_Fin`),
  KEY `ID_Curso` (`ID_Curso`),
  KEY `ID_Profesor` (`ID_Profesor`),
  CONSTRAINT `Comision_ibfk_1` FOREIGN KEY (`ID_Curso`) REFERENCES `Curso` (`ID_Curso`),
  CONSTRAINT `Comision_ibfk_2` FOREIGN KEY (`ID_Profesor`) REFERENCES `Profesor` (`ID_Profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n sobre las comisiones o grupos de cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comision`
--

LOCK TABLES `Comision` WRITE;
/*!40000 ALTER TABLE `Comision` DISABLE KEYS */;
INSERT INTO `Comision` VALUES (1,3,46,'Pre-emptive scalable budgetary management','Around into hair side to budget toward.','2024-03-21 00:00:00','2024-03-27 00:00:00','Presencial','6 meses','MJ 14:00-15:30','2024-08-15 04:20:14','2024-08-15 04:20:14'),(2,9,3,'Multi-lateral zero-defect methodology','Economy upon appear son often oil country.','2024-03-01 00:00:00','2024-01-29 00:00:00','Presencial','1 año','MJ 14:00-15:30','2024-08-15 04:20:14','2024-08-15 04:20:14'),(3,4,12,'Cross-group actuating monitoring','Policy his itself another evidence prove.','2024-06-16 00:00:00','2024-07-21 00:00:00','Presencial','3 meses','MJ 14:00-15:30','2024-08-15 04:20:14','2024-08-15 04:20:14'),(4,9,2,'Versatile tangible methodology','Decide wall budget study reason early.','2024-03-31 00:00:00','2024-03-18 00:00:00','En línea','3 meses','LMV 10:00-11:00','2024-08-15 04:20:14','2024-08-15 04:20:14'),(5,9,25,'Multi-tiered reciprocal orchestration','Follow happy material along both.','2024-01-27 00:00:00','2024-03-05 00:00:00','En línea','3 meses','LMV 10:00-11:00','2024-08-15 04:20:14','2024-08-15 04:20:14'),(6,2,12,'Front-line asymmetric Local Area Network','Government himself conference yet political.','2024-01-20 00:00:00','2024-04-14 00:00:00','Presencial','6 meses','MJ 14:00-15:30','2024-08-15 04:20:14','2024-08-15 04:20:14');
/*!40000 ALTER TABLE `Comision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Curso` (
  `ID_Curso` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Curso`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n sobre los cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (1,'Up-sized uniform pricing structure','Individual sister scientist language everything wrong recent.',411.75,'2024-08-15 04:20:14'),(2,'Persevering local time-frame','And nice least husband.',412.54,'2024-08-15 04:20:14'),(3,'Universal responsive Graphic Interface','Probably science top seem shake.',116.56,'2024-08-15 04:20:14'),(4,'Ergonomic upward-trending groupware','Thought help others clearly reach degree over notice.',310.49,'2024-08-15 04:20:14'),(5,'Front-line eco-centric access','School west why drug.',339.31,'2024-08-15 04:20:14'),(6,'Automated cohesive process improvement','Certainly budget should age again.',304.74,'2024-08-15 04:20:14'),(7,'Devolved system-worthy artificial intelligence','Exist involve image war pass act action.',91.90,'2024-08-15 04:20:14'),(8,'Compatible 5thgeneration complexity','Side amount ready performance not activity.',154.97,'2024-08-15 04:20:14'),(9,'Operative interactive software','Company professor policy.',471.30,'2024-08-15 04:20:14'),(10,'Compatible dynamic instruction set','Authority whom law receive cause school.',464.55,'2024-08-15 04:20:14');
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CursoPorCategoria`
--

DROP TABLE IF EXISTS `CursoPorCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CursoPorCategoria` (
  `ID_CursoPorCategoria` int NOT NULL AUTO_INCREMENT,
  `ID_Curso` int NOT NULL,
  `ID_Categoria` int NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_CursoPorCategoria`),
  UNIQUE KEY `ID_Curso` (`ID_Curso`,`ID_Categoria`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `CursoPorCategoria_ibfk_1` FOREIGN KEY (`ID_Curso`) REFERENCES `Curso` (`ID_Curso`),
  CONSTRAINT `CursoPorCategoria_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `Categoria` (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla intermedia para la relaciÃ³n entre cursos y categorÃ­as';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CursoPorCategoria`
--

LOCK TABLES `CursoPorCategoria` WRITE;
/*!40000 ALTER TABLE `CursoPorCategoria` DISABLE KEYS */;
INSERT INTO `CursoPorCategoria` VALUES (1,4,3,'2024-08-15 04:20:14'),(2,5,2,'2024-08-15 04:20:14'),(3,9,2,'2024-08-15 04:20:14'),(4,8,5,'2024-08-15 04:20:14'),(5,3,4,'2024-08-15 04:20:14'),(6,7,5,'2024-08-15 04:20:14'),(7,7,3,'2024-08-15 04:20:14'),(8,7,1,'2024-08-15 04:20:14'),(9,1,1,'2024-08-15 04:20:14'),(10,9,3,'2024-08-15 04:20:14'),(11,5,3,'2024-08-15 04:20:14'),(12,2,1,'2024-08-15 04:20:14'),(13,1,2,'2024-08-15 04:20:14');
/*!40000 ALTER TABLE `CursoPorCategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiante`
--

DROP TABLE IF EXISTS `Estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estudiante` (
  `ID_Estudiante` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL,
  PRIMARY KEY (`ID_Estudiante`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Estudiante_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n especÃ­fica de los estudiantes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiante`
--

LOCK TABLES `Estudiante` WRITE;
/*!40000 ALTER TABLE `Estudiante` DISABLE KEYS */;
INSERT INTO `Estudiante` VALUES (31,1),(17,4),(6,6),(11,8),(33,9),(2,10),(4,11),(29,16),(49,18),(36,20),(20,22),(7,24),(34,26),(8,31),(23,33),(32,35),(1,37),(13,38),(3,39),(48,42),(10,44),(50,45),(35,48),(22,49),(16,50),(41,55),(25,57),(30,59),(5,61),(40,63),(47,66),(15,69),(21,70),(43,72),(44,73),(24,77),(28,78),(14,79),(45,82),(19,83),(9,86),(37,88),(12,91),(26,92),(18,94),(27,95),(38,97),(46,98),(39,99),(42,100);
/*!40000 ALTER TABLE `Estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `EstudiantesPorCurso`
--

DROP TABLE IF EXISTS `EstudiantesPorCurso`;
/*!50001 DROP VIEW IF EXISTS `EstudiantesPorCurso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `EstudiantesPorCurso` AS SELECT 
 1 AS `NombreCurso`,
 1 AS `TotalEstudiantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `LOG_CAMBIOS`
--

DROP TABLE IF EXISTS `LOG_CAMBIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOG_CAMBIOS` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG_CAMBIOS`
--

LOCK TABLES `LOG_CAMBIOS` WRITE;
/*!40000 ALTER TABLE `LOG_CAMBIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOG_CAMBIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leccion`
--

DROP TABLE IF EXISTS `Leccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leccion` (
  `ID_Leccion` int NOT NULL AUTO_INCREMENT,
  `ID_Curso` int NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` text,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Leccion`),
  KEY `ID_Curso` (`ID_Curso`),
  CONSTRAINT `Leccion_ibfk_1` FOREIGN KEY (`ID_Curso`) REFERENCES `Curso` (`ID_Curso`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n sobre las lecciones dentro de los cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leccion`
--

LOCK TABLES `Leccion` WRITE;
/*!40000 ALTER TABLE `Leccion` DISABLE KEYS */;
INSERT INTO `Leccion` VALUES (1,1,'Advanced tangible project','At even business physical rise above draw summer.','2024-08-15 04:20:15'),(2,1,'Digitized 4thgeneration projection','Step knowledge question respond practice case effect.','2024-08-15 04:20:15'),(3,10,'Front-line coherent toolset','Have case out build real with accept.','2024-08-15 04:20:15'),(4,3,'Configurable high-level implementation','Organization road any hope.','2024-08-15 04:20:15'),(5,9,'Polarized attitude-oriented migration','About act age guess space.','2024-08-15 04:20:15'),(6,1,'Cloned explicit model','Carry increase idea whether necessary.','2024-08-15 04:20:15'),(7,1,'Focused leadingedge algorithm','Boy rise agent building above.','2024-08-15 04:20:15'),(8,9,'Networked optimal emulation','Know product more red among defense.','2024-08-15 04:20:15'),(9,10,'Devolved empowering archive','Someone five resource share into will opportunity.','2024-08-15 04:20:15'),(10,2,'Virtual client-driven initiative','Reveal often social though bit sit while.','2024-08-15 04:20:15'),(11,10,'Multi-lateral non-volatile projection','Camera production might science onto trip.','2024-08-15 04:20:15'),(12,10,'Integrated heuristic workforce','Whatever so trial play use drop magazine level.','2024-08-15 04:20:15'),(13,10,'Integrated zero tolerance neural-net','My somebody check sign ahead available.','2024-08-15 04:20:15'),(14,6,'Distributed upward-trending ability','Able three stand employee.','2024-08-15 04:20:15'),(15,9,'Integrated analyzing capacity','Pretty coach traditional yes treat.','2024-08-15 04:20:15'),(16,8,'Reverse-engineered composite algorithm','Recognize conference above guy half throw experience.','2024-08-15 04:20:15'),(17,7,'Function-based directional policy','Hundred yet happy find.','2024-08-15 04:20:15'),(18,1,'Optimized non-volatile solution','Protect us its her father sell.','2024-08-15 04:20:15'),(19,9,'Business-focused logistical hardware','Start page PM do life leave site.','2024-08-15 04:20:15'),(20,2,'Sharable responsive model','Mrs employee who thank practice practice TV.','2024-08-15 04:20:15');
/*!40000 ALTER TABLE `Leccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialCurso`
--

DROP TABLE IF EXISTS `MaterialCurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MaterialCurso` (
  `ID_Material` int NOT NULL AUTO_INCREMENT,
  `ID_Leccion` int NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Material`),
  KEY `ID_Leccion` (`ID_Leccion`),
  CONSTRAINT `MaterialCurso_ibfk_1` FOREIGN KEY (`ID_Leccion`) REFERENCES `Leccion` (`ID_Leccion`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los materiales asociados con las lecciones de los cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialCurso`
--

LOCK TABLES `MaterialCurso` WRITE;
/*!40000 ALTER TABLE `MaterialCurso` DISABLE KEYS */;
INSERT INTO `MaterialCurso` VALUES (1,15,'PDF','http://www.thomas.net/','2024-08-15 04:20:15'),(2,7,'Documento','http://www.kelley.com/','2024-08-15 04:20:15'),(3,3,'Documento','https://caldwell.com/','2024-08-15 04:20:15'),(4,11,'Documento','https://www.osborne.com/','2024-08-15 04:20:15'),(5,7,'PDF','http://maynard.com/','2024-08-15 04:20:15'),(6,7,'Video','http://www.logan.info/','2024-08-15 04:20:15'),(7,8,'Video','https://fisher.com/','2024-08-15 04:20:15'),(8,2,'PDF','https://reed.com/','2024-08-15 04:20:15'),(9,6,'Video','http://baldwin.com/','2024-08-15 04:20:15'),(10,5,'Video','https://www.hamilton.biz/','2024-08-15 04:20:15'),(11,15,'Video','https://www.stevenson.info/','2024-08-15 04:20:15'),(12,17,'Video','http://www.white.com/','2024-08-15 04:20:15'),(13,7,'Documento','http://www.miller.info/','2024-08-15 04:20:15'),(14,4,'Documento','https://green.info/','2024-08-15 04:20:15'),(15,10,'Video','https://www.sloan.biz/','2024-08-15 04:20:15'),(16,7,'PDF','https://johnson.com/','2024-08-15 04:20:15'),(17,9,'Documento','https://www.bauer.com/','2024-08-15 04:20:15'),(18,15,'Video','http://www.tucker-pennington.org/','2024-08-15 04:20:15'),(19,8,'PDF','http://www.taylor-hernandez.com/','2024-08-15 04:20:15'),(20,5,'Documento','http://foster-carter.net/','2024-08-15 04:20:15');
/*!40000 ALTER TABLE `MaterialCurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matricula` (
  `ID_Matricula` int NOT NULL AUTO_INCREMENT,
  `ID_Estudiante` int NOT NULL,
  `ID_Comision` int NOT NULL,
  `Fecha_Matricula` datetime NOT NULL,
  `ID_Metodo_Pago` int NOT NULL,
  `Precio_Pagar` decimal(10,2) NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Matricula`),
  UNIQUE KEY `ID_Estudiante` (`ID_Estudiante`,`ID_Comision`),
  KEY `ID_Comision` (`ID_Comision`),
  KEY `ID_Metodo_Pago` (`ID_Metodo_Pago`),
  CONSTRAINT `Matricula_ibfk_1` FOREIGN KEY (`ID_Estudiante`) REFERENCES `Estudiante` (`ID_Estudiante`),
  CONSTRAINT `Matricula_ibfk_2` FOREIGN KEY (`ID_Comision`) REFERENCES `Comision` (`ID_Comision`),
  CONSTRAINT `Matricula_ibfk_3` FOREIGN KEY (`ID_Metodo_Pago`) REFERENCES `Metodo_Pago` (`ID_Metodo_Pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n sobre las matrÃ­culas de los estudiantes en los cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matricula`
--

LOCK TABLES `Matricula` WRITE;
/*!40000 ALTER TABLE `Matricula` DISABLE KEYS */;
INSERT INTO `Matricula` VALUES (1,48,5,'2024-03-25 00:00:00',1,122.99,'2024-08-15 04:20:15'),(2,48,6,'2024-06-13 00:00:00',3,430.23,'2024-08-15 04:20:15');
/*!40000 ALTER TABLE `Matricula` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_matricula` BEFORE INSERT ON `Matricula` FOR EACH ROW BEGIN
    DECLARE matricula_count INT;
    
    SELECT COUNT(*) INTO matricula_count
    FROM Matricula
    WHERE ID_Estudiante = NEW.ID_Estudiante
    AND ID_Comision = NEW.ID_Comision;
    
    IF matricula_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El estudiante ya está inscrito en esta comisión.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Metodo_Pago`
--

DROP TABLE IF EXISTS `Metodo_Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Metodo_Pago` (
  `ID_Metodo_Pago` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Metodo_Pago`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los diferentes mÃ©todos de pago disponibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Metodo_Pago`
--

LOCK TABLES `Metodo_Pago` WRITE;
/*!40000 ALTER TABLE `Metodo_Pago` DISABLE KEYS */;
INSERT INTO `Metodo_Pago` VALUES (1,'Tarjeta de Crédito','Company author just compare.',0,'2024-08-15 04:20:15'),(2,'PayPal','Source number laugh enough third.',0,'2024-08-15 04:20:15'),(3,'Transferencia Bancaria','Economic less professor week.',0,'2024-08-15 04:20:15');
/*!40000 ALTER TABLE `Metodo_Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Opinion_Estudiante`
--

DROP TABLE IF EXISTS `Opinion_Estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opinion_Estudiante` (
  `ID_Opinion_Estudiante` int NOT NULL AUTO_INCREMENT,
  `ID_Estudiante` int NOT NULL,
  `ID_Comision` int NOT NULL,
  `Fecha` datetime NOT NULL,
  `Calificacion` int NOT NULL,
  `Comentario` varchar(255) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Opinion_Estudiante`),
  KEY `ID_Estudiante` (`ID_Estudiante`),
  KEY `ID_Comision` (`ID_Comision`),
  CONSTRAINT `Opinion_Estudiante_ibfk_1` FOREIGN KEY (`ID_Estudiante`) REFERENCES `Estudiante` (`ID_Estudiante`),
  CONSTRAINT `Opinion_Estudiante_ibfk_2` FOREIGN KEY (`ID_Comision`) REFERENCES `Comision` (`ID_Comision`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar las opiniones y el feedback de los estudiantes sobre los cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opinion_Estudiante`
--

LOCK TABLES `Opinion_Estudiante` WRITE;
/*!40000 ALTER TABLE `Opinion_Estudiante` DISABLE KEYS */;
INSERT INTO `Opinion_Estudiante` VALUES (1,8,6,'2024-05-03 00:00:00',4,'Help as give subject chance smile drug.','2024-08-15 04:20:15'),(2,22,1,'2024-06-16 00:00:00',5,'Break believe attention throughout.','2024-08-15 04:20:15');
/*!40000 ALTER TABLE `Opinion_Estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_calificacion` AFTER UPDATE ON `Opinion_Estudiante` FOR EACH ROW BEGIN
    IF OLD.Calificacion <> NEW.Calificacion THEN
        INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha, id_usuario, usuario)
        VALUES ('Opinion_Estudiante', 'UPDATE', NOW(), NEW.ID_Estudiante, USER());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Profesor`
--

DROP TABLE IF EXISTS `Profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profesor` (
  `ID_Profesor` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int NOT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Profesor`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Profesor_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n especÃ­fica de los profesores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesor`
--

LOCK TABLES `Profesor` WRITE;
/*!40000 ALTER TABLE `Profesor` DISABLE KEYS */;
INSERT INTO `Profesor` VALUES (1,71,'Ingeniería de Software'),(2,64,'Ingeniería Biomédica'),(3,87,'Ingeniería Biomédica'),(4,15,'Ingeniería Química'),(5,76,'Ingeniería Biomédica'),(6,30,'Matemáticas'),(7,13,'Ingeniería Eléctrica'),(8,85,'Ingeniería Biomédica'),(9,43,'Matemáticas'),(10,47,'Matemáticas'),(11,28,'Programación'),(12,68,'Robótica'),(13,54,'Ingeniería Mecánica'),(14,23,'Ingeniería Química'),(15,29,'Ingeniería Química'),(16,27,'Ingeniería Mecánica'),(17,51,'Matemáticas'),(18,89,'Ingeniería Civil'),(19,75,'Ciencias de la Computación'),(20,34,'Ingeniería Civil'),(21,2,'Programación'),(22,96,'Química'),(23,36,'Ingeniería Química'),(24,58,'Ingeniería Mecánica'),(25,67,'Ingeniería Eléctrica'),(26,52,'Matemáticas'),(27,84,'Física'),(28,17,'Ingeniería de Software'),(29,12,'Ingeniería de Software'),(30,46,'Ingeniería Industrial'),(31,41,'Ciencias de la Computación'),(32,7,'Ingeniería Química'),(33,62,'Ingeniería Industrial'),(34,21,'Ingeniería Civil'),(35,40,'Ingeniería de Software'),(36,74,'Ciencias de la Computación'),(37,14,'Inteligencia Artificial'),(38,60,'Programación'),(39,90,'Física'),(40,25,'Ingeniería Biomédica'),(41,3,'Química'),(42,56,'Química'),(43,5,'Ingeniería Civil'),(44,81,'Ingeniería Industrial'),(45,80,'Física'),(46,32,'Inteligencia Artificial'),(47,53,'Ingeniería Mecánica'),(48,19,'Ingeniería Eléctrica'),(49,93,'Programación'),(50,65,'Ingeniería Química');
/*!40000 ALTER TABLE `Profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ProgresoLeccionesPorCurso`
--

DROP TABLE IF EXISTS `ProgresoLeccionesPorCurso`;
/*!50001 DROP VIEW IF EXISTS `ProgresoLeccionesPorCurso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ProgresoLeccionesPorCurso` AS SELECT 
 1 AS `NombreCurso`,
 1 AS `TotalLecciones`,
 1 AS `TotalMateriales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `Correo_Electronico` varchar(255) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Activo` tinyint(1) DEFAULT '1',
  `DNI` varchar(20) NOT NULL,
  `Pais_Residencia` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  UNIQUE KEY `DNI` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar informaciÃ³n general de los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Joseph','Maldonado','vwyatt@bowen-alvarado.net','_!PFLVBrn8','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'52654310','Belize'),(2,'Robert','Potter','fcarlson@osborn.info','*2!3GO4fZ#','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'36688611','Turks and Caicos Islands'),(3,'Laura','Johnson','katie94@yahoo.com','&X&7You+u+','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'56733544','Venezuela'),(4,'Christina','Dennis','tammy00@hotmail.com','7#gd6Ypf7g','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'88351323','Burkina Faso'),(5,'Jacqueline','Reynolds','cookbrittney@hunt-hamilton.com','Vz4G4w1nU^','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'45571467','Heard Island and McDonald Islands'),(6,'Brian','Wilkerson','melissamiller@finley-baker.com','S0Y^bPdJ@4','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'15019749','Pitcairn Islands'),(7,'Teresa','Duke','phillipwoods@gmail.com','A87d5HNa$e','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'58445344','Dominica'),(8,'Valerie','Baker','kstephenson@fisher-ellis.com',')5wR+Om9gL','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'74432141','India'),(9,'Charles','Lawrence','njohnson@hotmail.com','0Ta7!#Vkp)','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'39425741','Uzbekistan'),(10,'Steven','Brown','jhayden@mendez.com','by7QPiPfZ@','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'45604640','Saint Vincent and the Grenadines'),(11,'Eugene','Gutierrez','jasongray@gmail.com','_FT9jkLq5R','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'68150954','Pakistan'),(12,'Wayne','Elliott','joel98@yahoo.com','#YYa)Fqrx4','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'21254431','Bosnia and Herzegovina'),(13,'John','Huffman','michaelmartinez@rowe-taylor.org','%z(0FZqq@s','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'36329907','Iraq'),(14,'John','Lopez','donna34@gmail.com','d_crFQt(#3','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'38887364','United States of America'),(15,'Sara','Walls','sanchezjonathan@gmail.com','+_%0GlAgR7','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'28414917','Australia'),(16,'Sharon','King','umarquez@yahoo.com',')c%NwNzl^5','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'90151370','Maldives'),(17,'Daniel','Rose','combsmaria@moss.com','*9O+Qtff^r','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'87472385','Djibouti'),(18,'Jerry','Smith','tranjonathan@bauer.com','tt4tVquev!','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'63713002','Malaysia'),(19,'Mckenzie','Moore','zwillis@hubbard.com','@(1zdV3biO','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'6035652','Saint Martin'),(20,'Heather','Murillo','fostervincent@lyons.info','t^0x#9ZT4n','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'17812446','Bouvet Island (Bouvetoya)'),(21,'Angela','Weaver','ckelly@gmail.com','y7FFfD+V#M','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'34830781','Cocos (Keeling) Islands'),(22,'Jessica','Beck','englishangela@hotmail.com','WkuLCbtB!6','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'62421522','American Samoa'),(23,'Veronica','Johnston','brucenoble@stout.com','@DE%b+NG59','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'45509064','Japan'),(24,'Jessica','Bush','ssmith@gmail.com','_F!^4wKjP3','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'95493060','French Southern Territories'),(25,'William','English','lori35@miller-jensen.biz','+KR4f7Uw*t','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'95320907','New Zealand'),(26,'Jesus','Moore','ucoleman@yahoo.com','^sCKMzl@8A','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'23765785','Bahrain'),(27,'Mark','Perry','thomasbenjamin@thornton.com','%K44vUn6*T','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'49477025','Algeria'),(28,'Gregg','Park','pettymadison@stephens-evans.com','@i27_INc+3','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'96802501','Lebanon'),(29,'Michelle','Fleming','robertgonzalez@cervantes-king.info','j9AC$wEm(4','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'53947268','Slovenia'),(30,'Jason','Norman','iaustin@gmail.com','^URXsAWN2u','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'48840613','Uruguay'),(31,'Shannon','Nelson','fmartin@gmail.com','_t7eShjDkb','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'88087091','Sri Lanka'),(32,'Teresa','Farley','mariasmith@clark.com','&+2#Dxl*)0','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'98440793','Guatemala'),(33,'Cathy','Pope','claire86@hotmail.com','K9CItIm$^g','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'85809123','Nigeria'),(34,'Corey','Love','vasquezbrittney@hotmail.com','j_4Y3odVqN','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'76535334','United Arab Emirates'),(35,'Brian','Bennett','palmerjason@hotmail.com','!2pIk77K9j','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'19518104','Jamaica'),(36,'Jonathan','Williams','clementskristin@hicks.com','nb5(BMiYZ%','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'97196850','Austria'),(37,'Jennifer','Duran','ncampbell@gregory.net','8aIOsrQL%_','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'46153125','Burkina Faso'),(38,'Michael','Garcia','joy93@yahoo.com','A9y&(PhZ+7','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'2946224','Venezuela'),(39,'Nathan','Soto','sarawashington@rubio.info','%9p+XAwY$u','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'70647646','Gambia'),(40,'Kimberly','Wells','morganbrian@yahoo.com','*602&Z&2_a','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'47340565','Rwanda'),(41,'Steven','Mcpherson','noblerobert@gmail.com','_5jpUCUq1A','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'46637875','Paraguay'),(42,'Jacob','Short','martinezheidi@jones-miller.com','#GU3Q1w!W3','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'25571573','Cuba'),(43,'Daniel','Hernandez','pfleming@rose.com','moNULZ(5)4','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'42138050','Mayotte'),(44,'Tamara','Knox','hermanjacqueline@lewis.com','(m_FPL$p73','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'84791002','Poland'),(45,'Lauren','Gross','bpearson@hotmail.com','cAQGf6Ix$!','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'69504389','French Southern Territories'),(46,'Nathan','Berry','rjones@gmail.com','q@u0AWFqCr','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'52577330','Panama'),(47,'Barbara','Hudson','ibutler@trujillo.com','#t3nXG%C#7','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'69279315','Finland'),(48,'Jason','Macdonald','creed@clements.com','%S*B9KaxBK','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'86130871','Guam'),(49,'Gina','Buckley','lisawilson@gmail.com','qDYGNCoa+8','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'26075092','Montserrat'),(50,'Alexis','Munoz','elizabeth29@brown-christensen.org','_e(7GylyHl','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'36021478','Uganda'),(51,'Sonya','Ray','melissahuffman@spencer.com',')qOe4Lbuj*','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'25319121','Jersey'),(52,'Patricia','Larson','anthonycopeland@jones-welch.com','0t9FJmKg%V','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'27713405','Anguilla'),(53,'Keith','Anderson','patricia65@hotmail.com','#SwNVIvla3','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'60110839','Gambia'),(54,'Lawrence','Mckenzie','cmorgan@miller.com','&6D&ZE2zGF','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'29058971','Netherlands Antilles'),(55,'Robert','Oconnor','qobrien@tate.net','bCi(2J1n@*','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'12056197','Bolivia'),(56,'Michael','Jones','amandajohnson@hotmail.com','h0gLGv3B_p','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'33853313','Venezuela'),(57,'Ashley','Jones','garyjohnston@hotmail.com','U*x9GYAp_l','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'72298146','Uganda'),(58,'Cody','Moss','yellis@key-bradley.org','*#x27W_v+W','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'36659999','Monaco'),(59,'Jennifer','Turner','treed@yahoo.com','f3%Jt)@(_s','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'48860270','Pitcairn Islands'),(60,'Thomas','Dyer','egriffin@scott-frey.org','6#f8(WDgzN','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'3776679','Sierra Leone'),(61,'Julie','Morrow','patricia12@hotmail.com','19yELulj#K','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'17568362','Brazil'),(62,'Joseph','Brown','daniel64@white-morgan.com','Ca!w1Vx&&(','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'24038361','Tajikistan'),(63,'Kirk','Simpson','reyesjeffrey@gmail.com','A^rqCWi++4','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'7196240','Djibouti'),(64,'Mark','Smith','sergio21@martinez.com','A!_9!Gzsj$','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'14080534','China'),(65,'Megan','York','michaeljackson@stone.com','(aiM4Nm00u','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'92964365','Saint Martin'),(66,'Luis','Hall','jerrybird@hotmail.com','@F09Ky9P%O','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'33449507','Monaco'),(67,'Danielle','Carter','bautistashelly@sanchez.biz','b#2^BLwC%D','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'3638550','Greece'),(68,'Wesley','Bradford','samuelcarter@gmail.com','iW9DjLwd#B','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'50264005','British Virgin Islands'),(69,'Janice','Blanchard','johnsonbrandon@hernandez.info','I0Zi9lzA^V','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'71359719','Philippines'),(70,'Michelle','Pena','mnolan@hotmail.com','J4Hyb1Mr*d','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'23372028','Palau'),(71,'Teresa','Rich','alexanderkey@lambert.com','vfN8Os9l%v','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'17331987','Bhutan'),(72,'Erin','Ortiz','thomasphillips@gmail.com','9w1Yo5$F$$','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'79243426','Sri Lanka'),(73,'Michael','Singh','michaelharris@allen.com',')nLpc)Iux2','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'85881416','Swaziland'),(74,'Samuel','Gross','ambercampbell@gmail.com','P@72Si#xK%','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'31876891','India'),(75,'Jesse','Christian','stricklandandrew@hotmail.com','%1%fwFJpn3','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'96215956','Madagascar'),(76,'Jeffrey','Pierce','ksutton@bowers.biz','33ey^ImZ&*','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'79086323','Samoa'),(77,'Taylor','Brown','cdaniels@yahoo.com','cQ&J$eSt_6','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'7275456','Anguilla'),(78,'Mark','Pierce','petersenelaine@mooney-lucas.net','_uMdEBiJ36','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'29875302','Korea'),(79,'Mark','Miller','fmartinez@yahoo.com','(0cWrjGukd','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'78490332','Mauritius'),(80,'Linda','Reyes','kayla87@hotmail.com','7hEMcclZ**','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'85776553','Nauru'),(81,'Eric','Morrow','jessica12@jones.net','z1MKgoeW)F','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'43156089','Ireland'),(82,'Christina','Davis','karen69@perez.biz','!6eKyi1@m9','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'50952103','United Arab Emirates'),(83,'Steven','Johnson','kylemccormick@gmail.com',')boUTboL3c','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'63381388','Singapore'),(84,'Tara','Lee','abeltran@yahoo.com','^T1LC$bm&a','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'84381284','Korea'),(85,'James','Bauer','vargasjennifer@hotmail.com','wJSE7UuVv@','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'18682485','Albania'),(86,'Victor','Keller','monica96@hotmail.com','^a8Vyi6vzM','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'64350003','Bahrain'),(87,'Andrew','Rivera','madelineanderson@gmail.com','w)fYd7Gqt!','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'91942698','Thailand'),(88,'Matthew','Powell','foxjennifer@yahoo.com','j%N1FL&oU!','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'98576999','Cayman Islands'),(89,'Andrew','Becker','lbooth@yahoo.com','U&qQ5Tfuc%','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'9034712','Albania'),(90,'Natalie','James','jamestrujillo@yahoo.com','Ir2xVyWo_A','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'78350970','Palestinian Territory'),(91,'Michelle','Holmes','craig89@williams-hall.com','!0mtNnf@bW','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'84475335','Barbados'),(92,'Richard','Key','frederick10@yahoo.com','&4eGauQiQ6','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'11648392','British Virgin Islands'),(93,'Rachel','Ramirez','bryan61@garcia.info','p7Ncmv#M^Z','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'2301664','Lebanon'),(94,'Amy','Pacheco','nparker@yahoo.com','8*9d)fTi(R','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'71088302','Belarus'),(95,'Donald','Johnson','lee45@reed-huynh.com','7Lf!YWcb&U','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'88275996','Heard Island and McDonald Islands'),(96,'Carol','Bradford','collierana@gmail.com','%7m$EYbTzC','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'42693845','Brazil'),(97,'Gina','Villanueva','odiaz@yahoo.com','^1C@uALmm7','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'49525743','India'),(98,'Katrina','Andrews','grantjason@gray.net','0t8Ecbu*&D','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'34452440','Reunion'),(99,'Susan','Walker','janetmcfarland@hotmail.com',')@*!6UMjKV','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'40211935','Nepal'),(100,'Allen','Rogers','andreagutierrez@green.biz','(d5zXeh)o_','2024-08-15 04:20:14','2024-08-15 04:20:14',1,'69019332','Saint Kitts and Nevis');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_usuario` BEFORE INSERT ON `Usuario` FOR EACH ROW BEGIN
    DECLARE correo_count INT;
    
    SELECT COUNT(*) INTO correo_count
    FROM Usuario
    WHERE Correo_Electronico = NEW.Correo_Electronico;
    
    IF correo_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_usuario` AFTER INSERT ON `Usuario` FOR EACH ROW BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha, id_usuario, usuario)
    VALUES ('Usuario', 'INSERT', NOW(), NEW.ID_Usuario, USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'OnlineCourses'
--
/*!50003 DROP FUNCTION IF EXISTS `calificacion_promedio_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calificacion_promedio_curso`(curso_id INT) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE calificacion_promedio DECIMAL(5, 2);
    
    SELECT AVG(Opinion_Estudiante.Calificacion) INTO calificacion_promedio
    FROM Comision
    JOIN Opinion_Estudiante ON Comision.ID_Comision = Opinion_Estudiante.ID_Comision
    WHERE Comision.ID_Curso = curso_id;
    
    RETURN calificacion_promedio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `contar_cursos_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_cursos_profesor`(profesor_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE cursos_count INT;
    
    SELECT COUNT(DISTINCT Curso.ID_Curso) INTO cursos_count
    FROM Curso
    JOIN Comision ON Curso.ID_Curso = Comision.ID_Curso
    WHERE Comision.ID_Profesor = profesor_id;
    
    RETURN cursos_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `estudiante_inscrito_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `estudiante_inscrito_curso`(estudiante_id INT, curso_id INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE is_inscrito BOOLEAN;
    DECLARE comision_id INT;
    
    SELECT ID_Comision INTO comision_id
    FROM Comision
    WHERE ID_Curso = curso_id
    LIMIT 1;
    
    IF comision_id IS NOT NULL THEN
        SELECT COUNT(*) INTO is_inscrito
        FROM Matricula
        WHERE ID_Estudiante = estudiante_id
        AND ID_Comision = comision_id;
    ELSE
        SET is_inscrito = FALSE;
    END IF;
    
    RETURN is_inscrito > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_calificacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_calificacion`(
    IN p_estudiante_id INT,
    IN p_comision_id INT,
    IN p_nueva_calificacion INT
)
BEGIN
    DECLARE calificacion_id INT;
    
    -- Verificar si la calificación existe
    SELECT ID_Opinion_Estudiante INTO calificacion_id
    FROM Opinion_Estudiante
    WHERE ID_Estudiante = p_estudiante_id
    AND ID_Comision = p_comision_id;
    
    -- Actualizar la calificación si existe, de lo contrario insertar una nueva
    IF calificacion_id IS NOT NULL THEN
        UPDATE Opinion_Estudiante
        SET Calificacion = p_nueva_calificacion,
            Fecha = NOW()
        WHERE ID_Opinion_Estudiante = calificacion_id;
        
        SELECT 'Calificación actualizada exitosamente.';
    ELSE
        INSERT INTO Opinion_Estudiante (ID_Estudiante, ID_Comision, Fecha, Calificacion, Comentario)
        VALUES (p_estudiante_id, p_comision_id, NOW(), p_nueva_calificacion, 'Calificación añadida.');
        
        SELECT 'Calificación añadida exitosamente.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_leccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_leccion`(
    IN p_curso_id INT,
    IN p_titulo VARCHAR(255),
    IN p_descripcion TEXT
)
BEGIN
    -- Insertar la nueva lección
    INSERT INTO Leccion (ID_Curso, Titulo, Descripcion, Fecha_Creacion)
    VALUES (p_curso_id, p_titulo, p_descripcion, NOW());
    
    SELECT 'Lección agregada exitosamente.';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inscribir_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscribir_estudiante`(
    IN p_estudiante_id INT,
    IN p_comision_id INT,
    IN p_metodo_pago_id INT,
    IN p_precio_pagar DECIMAL(10, 2)
)
BEGIN
    DECLARE estudiante_existe BOOLEAN;
    
    -- Verificar si el estudiante ya está inscrito en la comisión
    SELECT COUNT(*) INTO estudiante_existe
    FROM Matricula
    WHERE ID_Estudiante = p_estudiante_id
    AND ID_Comision = p_comision_id;
    
    -- Inscribir al estudiante si no está inscrito
    IF estudiante_existe = 0 THEN
        INSERT INTO Matricula (ID_Estudiante, ID_Comision, Fecha_Matricula, ID_Metodo_Pago, Precio_Pagar, Fecha_Creacion)
        VALUES (p_estudiante_id, p_comision_id, NOW(), p_metodo_pago_id, p_precio_pagar, NOW());
        
        SELECT 'Estudiante inscrito exitosamente.';
    ELSE
        SELECT 'El estudiante ya está inscrito en esta comisión.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `CalificacionesPromedioPorCurso`
--

/*!50001 DROP VIEW IF EXISTS `CalificacionesPromedioPorCurso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CalificacionesPromedioPorCurso` AS select `Curso`.`Nombre` AS `NombreCurso`,avg(`Opinion_Estudiante`.`Calificacion`) AS `CalificacionPromedio` from ((`Curso` join `Comision` on((`Curso`.`ID_Curso` = `Comision`.`ID_Curso`))) join `Opinion_Estudiante` on((`Comision`.`ID_Comision` = `Opinion_Estudiante`.`ID_Comision`))) group by `Curso`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `EstudiantesPorCurso`
--

/*!50001 DROP VIEW IF EXISTS `EstudiantesPorCurso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `EstudiantesPorCurso` AS select `Curso`.`Nombre` AS `NombreCurso`,count(`Matricula`.`ID_Estudiante`) AS `TotalEstudiantes` from ((`Curso` join `Comision` on((`Curso`.`ID_Curso` = `Comision`.`ID_Curso`))) join `Matricula` on((`Comision`.`ID_Comision` = `Matricula`.`ID_Comision`))) group by `Curso`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProgresoLeccionesPorCurso`
--

/*!50001 DROP VIEW IF EXISTS `ProgresoLeccionesPorCurso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProgresoLeccionesPorCurso` AS select `Curso`.`Nombre` AS `NombreCurso`,count(`Leccion`.`ID_Leccion`) AS `TotalLecciones`,count(`MaterialCurso`.`ID_Material`) AS `TotalMateriales` from ((`Curso` join `Leccion` on((`Curso`.`ID_Curso` = `Leccion`.`ID_Curso`))) left join `MaterialCurso` on((`Leccion`.`ID_Leccion` = `MaterialCurso`.`ID_Leccion`))) group by `Curso`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15  4:20:49
