/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - sispsolidario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sispsolidario` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sispsolidario`;

/*Table structure for table `alergias` */

DROP TABLE IF EXISTS `alergias`;

CREATE TABLE `alergias` (
  `idAlergia` int(11) NOT NULL AUTO_INCREMENT,
  `alergia` varchar(100) NOT NULL,
  PRIMARY KEY (`idAlergia`),
  UNIQUE KEY `uk_alergias_ale` (`alergia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `alergias` */

insert  into `alergias`(`idAlergia`,`alergia`) values 
(7,'Amoxicilina'),
(1,'Ampisilina'),
(5,'Aspirina '),
(4,'Ibuprofeno'),
(3,'Paracetamol'),
(2,'Penicilina'),
(6,'Salbutamol');

/*Table structure for table `atenciones` */

DROP TABLE IF EXISTS `atenciones`;

CREATE TABLE `atenciones` (
  `idAtencion` int(11) NOT NULL AUTO_INCREMENT,
  `turno` char(1) NOT NULL,
  `numeroAtencion` varchar(15) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaActualizacion` datetime DEFAULT NULL,
  `parentesco` varchar(100) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `ordenDoctor` varchar(100) DEFAULT NULL,
  `idFamiliar` int(11) DEFAULT NULL,
  `idPersona` int(11) NOT NULL,
  `fechaAtencion` date NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '0',
  `atendido` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAtencion`),
  KEY `fk_usuario_ate` (`idUsuario`),
  KEY `fk_fami_ate` (`idFamiliar`),
  KEY `fk_per_ate` (`idPersona`),
  CONSTRAINT `fk_fami_ate` FOREIGN KEY (`idFamiliar`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_per_ate` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_usuario_ate` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Data for the table `atenciones` */

insert  into `atenciones`(`idAtencion`,`turno`,`numeroAtencion`,`fechaCreacion`,`fechaActualizacion`,`parentesco`,`idUsuario`,`ordenDoctor`,`idFamiliar`,`idPersona`,`fechaAtencion`,`estado`,`atendido`) values 
(5,'T','201120230001','2023-11-20 23:58:49',NULL,NULL,1,NULL,NULL,13,'2023-11-20','0','0'),
(6,'T','301120230001','2023-11-30 18:39:18','2023-11-30 20:16:50',NULL,2,NULL,NULL,14,'2023-11-30','1','0'),
(7,'T','301120230002','2023-11-30 18:40:54','2023-11-30 20:21:01',NULL,2,NULL,NULL,15,'2023-11-30','1','0'),
(8,'T','301120230003','2023-11-30 18:43:55','2023-11-30 20:21:31',NULL,2,NULL,NULL,16,'2023-11-30','1','0'),
(9,'T','301120230004','2023-11-30 18:52:09','2023-11-30 20:21:59',NULL,2,NULL,NULL,17,'2023-11-30','1','0'),
(10,'T','301120230005','2023-11-30 18:56:40','2023-11-30 20:22:18',NULL,2,NULL,NULL,18,'2023-11-30','1','0'),
(11,'T','301120230006','2023-11-30 18:58:35','2023-11-30 20:22:40',NULL,2,NULL,NULL,19,'2023-11-30','1','0'),
(12,'T','301120230007','2023-11-30 19:00:06','2023-11-30 20:22:53',NULL,2,NULL,NULL,20,'2023-11-30','1','0'),
(13,'T','301120230008','2023-11-30 19:12:37','2023-11-30 20:23:06',NULL,2,NULL,NULL,21,'2023-11-30','1','0'),
(14,'T','301120230009','2023-11-30 19:13:38','2023-11-30 20:23:31',NULL,2,NULL,NULL,15,'2023-11-30','1','0'),
(15,'T','301120230010','2023-11-30 19:14:38','2023-11-30 20:23:53',NULL,2,NULL,NULL,21,'2023-11-30','1','0'),
(16,'T','301120230011','2023-11-30 19:15:11','2023-11-30 20:24:07',NULL,2,NULL,NULL,21,'2023-11-30','1','0'),
(17,'T','301120230012','2023-11-30 19:16:31','2023-11-30 20:24:22',NULL,2,NULL,NULL,22,'2023-11-30','1','0'),
(18,'T','301120230013','2023-11-30 19:17:30','2023-11-30 20:24:35',NULL,2,NULL,NULL,23,'2023-11-30','1','0'),
(19,'T','301120230014','2023-11-30 19:19:22','2023-11-30 20:24:49','Tio/a',2,NULL,23,24,'2023-11-30','1','0'),
(20,'T','301120230015','2023-11-30 19:24:55','2023-11-30 20:26:19','Tio/a',2,NULL,23,24,'2023-11-30','1','0'),
(21,'T','301120230016','2023-11-30 19:26:47','2023-11-30 20:26:34',NULL,2,NULL,23,25,'2023-11-30','1','0'),
(22,'T','301120230017','2023-11-30 19:28:29','2023-11-30 20:26:51',NULL,2,NULL,23,26,'2023-11-30','1','0'),
(23,'T','301120230018','2023-11-30 19:30:08','2023-11-30 20:27:05',NULL,2,NULL,23,27,'2023-11-30','1','0'),
(24,'T','301120230019','2023-11-30 19:30:50','2023-11-30 20:27:21',NULL,2,NULL,NULL,25,'2023-11-30','1','0'),
(25,'T','301120230020','2023-11-30 19:31:29','2023-11-30 20:27:37',NULL,2,NULL,NULL,25,'2023-11-30','1','0'),
(26,'T','301120230021','2023-11-30 19:32:50','2023-11-30 20:27:57',NULL,2,NULL,NULL,28,'2023-11-30','1','0'),
(27,'T','301120230022','2023-11-30 19:37:47','2023-11-30 20:28:45',NULL,2,NULL,NULL,29,'2023-11-30','1','0'),
(28,'T','301120230023','2023-11-30 19:38:24','2023-11-30 20:29:00',NULL,2,NULL,NULL,29,'2023-11-30','1','0'),
(29,'T','301120230024','2023-11-30 19:42:15','2023-11-30 20:29:15',NULL,2,NULL,NULL,30,'2023-11-30','1','0'),
(30,'T','301120230025','2023-11-30 19:44:04','2023-11-30 20:29:48',NULL,2,NULL,NULL,31,'2023-11-30','1','0'),
(31,'T','301120230026','2023-11-30 19:44:55','2023-11-30 20:30:00',NULL,2,NULL,NULL,32,'2023-11-30','1','0'),
(32,'T','301120230027','2023-11-30 19:47:41','2023-11-30 20:30:17','Hermano/a',2,NULL,32,33,'2023-11-30','1','0'),
(33,'T','301120230028','2023-11-30 19:49:09','2023-11-30 20:30:25',NULL,2,NULL,32,34,'2023-11-30','1','0'),
(34,'T','301120230029','2023-11-30 19:51:06','2023-11-30 20:30:41',NULL,2,NULL,32,35,'2023-11-30','1','0'),
(35,'T','301120230030','2023-11-30 19:53:25','2023-11-30 20:31:06',NULL,2,NULL,32,36,'2023-11-30','1','0'),
(36,'T','301120230031','2023-11-30 19:54:40','2023-11-30 20:31:23',NULL,2,NULL,32,37,'2023-11-30','1','0'),
(37,'T','301120230032','2023-11-30 19:56:27','2023-11-30 20:31:31',NULL,2,NULL,32,38,'2023-11-30','1','0'),
(38,'T','301120230033','2023-11-30 20:00:13','2023-11-30 20:31:50',NULL,2,NULL,32,39,'2023-11-30','1','0'),
(39,'T','301120230034','2023-11-30 20:03:49','2023-11-30 20:31:59',NULL,2,NULL,32,40,'2023-11-30','1','0'),
(40,'T','301120230035','2023-11-30 20:05:35','2023-11-30 20:32:38',NULL,2,NULL,32,41,'2023-11-30','1','0'),
(41,'T','301120230036','2023-11-30 20:07:07','2023-11-30 20:32:50',NULL,2,NULL,32,42,'2023-11-30','1','0'),
(42,'T','301120230037','2023-11-30 20:08:47','2023-11-30 20:33:12',NULL,2,NULL,32,43,'2023-11-30','1','0'),
(43,'T','301120230038','2023-11-30 20:10:46','2023-11-30 20:33:30',NULL,2,NULL,32,44,'2023-11-30','1','0'),
(44,'T','301120230039','2023-11-30 20:11:53','2023-11-30 20:33:45',NULL,2,NULL,32,43,'2023-11-30','1','0'),
(45,'T','301120230040','2023-11-30 20:13:23','2023-11-30 20:34:03',NULL,2,NULL,32,45,'2023-11-30','1','0');

/*Table structure for table `detalle_alergias` */

DROP TABLE IF EXISTS `detalle_alergias`;

CREATE TABLE `detalle_alergias` (
  `idDetalleAlergia` int(11) NOT NULL AUTO_INCREMENT,
  `idAlergia` int(11) NOT NULL,
  `idHistoriaClinica` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleAlergia`),
  UNIQUE KEY `uk_dal_dal` (`idAlergia`,`idHistoriaClinica`),
  KEY `fk_idHistoriaClinica_dal` (`idHistoriaClinica`),
  CONSTRAINT `fk_idAlergia_dal` FOREIGN KEY (`idAlergia`) REFERENCES `alergias` (`idAlergia`),
  CONSTRAINT `fk_idHistoriaClinica_dal` FOREIGN KEY (`idHistoriaClinica`) REFERENCES `historias_clinicas` (`idHistoriaClinica`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_alergias` */

insert  into `detalle_alergias`(`idDetalleAlergia`,`idAlergia`,`idHistoriaClinica`) values 
(2,1,2),
(1,7,1);

/*Table structure for table `detalle_atenciones` */

DROP TABLE IF EXISTS `detalle_atenciones`;

CREATE TABLE `detalle_atenciones` (
  `idDetalleAtenciones` int(11) NOT NULL AUTO_INCREMENT,
  `peso` decimal(5,2) NOT NULL,
  `talla` int(11) NOT NULL,
  `frecuenciaCardiaca` varchar(5) NOT NULL,
  `frecuenciaRespiratoria` varchar(5) NOT NULL,
  `presionArterial` varchar(10) NOT NULL,
  `temperatura` decimal(4,1) NOT NULL,
  `saturacionOxigeno` tinyint(4) NOT NULL,
  `examenGeneral` varchar(2000) DEFAULT NULL,
  `frecuencia` char(1) DEFAULT NULL,
  `inicio` varchar(2000) DEFAULT NULL,
  `curso` varchar(2000) DEFAULT NULL,
  `relato` varchar(2000) DEFAULT NULL,
  `procedimiento` varchar(2000) DEFAULT NULL,
  `observaciones` varchar(2000) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaActualizacion` datetime DEFAULT NULL,
  `idHistoria` int(11) NOT NULL,
  `idAtencion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleAtenciones`),
  KEY `fk_idHistoria_das` (`idHistoria`),
  KEY `fk_idAtencion_das` (`idAtencion`),
  KEY `fk_idusuario_das` (`idUsuario`),
  CONSTRAINT `fk_idAtencion_das` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idHistoria_das` FOREIGN KEY (`idHistoria`) REFERENCES `historias_clinicas` (`idHistoriaClinica`),
  CONSTRAINT `fk_idusuario_das` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_atenciones` */

/*Table structure for table `detalle_servicios` */

DROP TABLE IF EXISTS `detalle_servicios`;

CREATE TABLE `detalle_servicios` (
  `idDetalleServicio` int(11) NOT NULL AUTO_INCREMENT,
  `idservicios_detalle` int(11) NOT NULL,
  `idAtencion` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleServicio`),
  KEY `fk_idAtencion_dpr` (`idAtencion`),
  KEY `fk_idServicios_detalle_dpr` (`idservicios_detalle`),
  CONSTRAINT `fk_idAtencion_dpr` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idServicios_detalle_dpr` FOREIGN KEY (`idservicios_detalle`) REFERENCES `servicios_detalle` (`idservicios_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_servicios` */

insert  into `detalle_servicios`(`idDetalleServicio`,`idservicios_detalle`,`idAtencion`) values 
(1,304,5),
(2,314,6),
(3,138,7),
(4,141,8),
(5,76,9),
(6,139,10),
(7,30,11),
(8,50,11),
(9,290,12),
(10,283,13),
(11,62,14),
(12,176,15),
(13,8,16),
(14,289,17),
(15,222,18),
(16,289,19),
(17,7,20),
(18,283,21),
(19,109,22),
(20,289,23),
(21,176,24),
(22,8,25),
(23,211,26),
(24,6,27),
(25,7,28),
(26,283,29),
(27,284,30),
(28,139,31),
(29,176,32),
(30,176,33),
(31,401,34),
(32,302,35),
(33,284,36),
(34,284,37),
(35,409,38),
(36,222,39),
(37,188,40),
(38,309,41),
(39,284,42),
(40,283,43),
(41,223,44),
(42,284,45);

/*Table structure for table `devoluciones` */

DROP TABLE IF EXISTS `devoluciones`;

CREATE TABLE `devoluciones` (
  `idDevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `montoDevolucion` decimal(6,2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '0',
  `motivoDevolucion` varchar(100) NOT NULL,
  `fechaHoraDevolucion` datetime NOT NULL DEFAULT current_timestamp(),
  `idAtencion` int(11) DEFAULT NULL,
  `idMedioPago` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idDevolucion`),
  KEY `fk_idusuario_dev` (`idUsuario`),
  KEY `fk_idate_dev` (`idAtencion`),
  KEY `fk_idmep_dev` (`idMedioPago`),
  CONSTRAINT `fk_idate_dev` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idmep_dev` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`),
  CONSTRAINT `fk_idusuario_dev` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `devoluciones` */

/*Table structure for table `enfermedad_pacientes` */

DROP TABLE IF EXISTS `enfermedad_pacientes`;

CREATE TABLE `enfermedad_pacientes` (
  `idEnfermedadPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `idEnfermedad` int(11) NOT NULL,
  `idDetalleAtencion` int(11) NOT NULL,
  PRIMARY KEY (`idEnfermedadPaciente`),
  KEY `fk_enf_epp` (`idEnfermedad`),
  KEY `fk_det_epp` (`idDetalleAtencion`),
  CONSTRAINT `fk_det_epp` FOREIGN KEY (`idDetalleAtencion`) REFERENCES `detalle_atenciones` (`idDetalleAtenciones`),
  CONSTRAINT `fk_enf_epp` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedades` (`idEnfermedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `enfermedad_pacientes` */

/*Table structure for table `enfermedades` */

DROP TABLE IF EXISTS `enfermedades`;

CREATE TABLE `enfermedades` (
  `idEnfermedad` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCie_10` varchar(10) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idEnfermedad`),
  UNIQUE KEY `uk_codigoCie_enf` (`codigoCie_10`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `enfermedades` */

insert  into `enfermedades`(`idEnfermedad`,`codigoCie_10`,`descripcion`,`fechaCreacion`,`fechaActualizacion`) values 
(1,'A00-B99','Ciertas enfermedades infecciosas y parasitarias','2023-11-20 23:41:17',NULL),
(2,'C00-D48','Neoplasias','2023-11-20 23:41:17',NULL),
(3,'D50-D89','Enfermedades de la sangre y de los órganos hematopoyéticos y otros trastornos que afectan el mecanismo de la inmunidad','2023-11-20 23:41:17',NULL),
(4,'E00-E90','Enfermedades endocrinas, nutricionales y metabólicas','2023-11-20 23:41:17',NULL),
(5,'F00-F99','Trastornos mentales y del comportamiento','2023-11-20 23:41:17',NULL),
(6,'F00-F100','Enfermedades del sistema nervioso','2023-11-20 23:41:17',NULL);

/*Table structure for table `especialistas` */

DROP TABLE IF EXISTS `especialistas`;

CREATE TABLE `especialistas` (
  `idEspecialista` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idEspecialista`),
  UNIQUE KEY `uk_idPersona_esp` (`idPersona`),
  CONSTRAINT `fk_idPersona_esp` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `especialistas` */

insert  into `especialistas`(`idEspecialista`,`codigo`,`estado`,`idPersona`) values 
(1,'11088','1',5),
(2,'13254','1',6),
(3,NULL,'1',10);

/*Table structure for table `especialistas_servicios` */

DROP TABLE IF EXISTS `especialistas_servicios`;

CREATE TABLE `especialistas_servicios` (
  `idEspecialistasServicios` int(11) NOT NULL AUTO_INCREMENT,
  `idEspecialista` int(11) NOT NULL,
  `idServicio` int(11) NOT NULL,
  PRIMARY KEY (`idEspecialistasServicios`),
  UNIQUE KEY `uk_idfk_ees` (`idServicio`,`idEspecialista`),
  KEY `fk_idEspecialista_ees` (`idEspecialista`),
  CONSTRAINT `fk_idEspecialista_ees` FOREIGN KEY (`idEspecialista`) REFERENCES `especialistas` (`idEspecialista`),
  CONSTRAINT `fk_idServicio_ees` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `especialistas_servicios` */

insert  into `especialistas_servicios`(`idEspecialistasServicios`,`idEspecialista`,`idServicio`) values 
(2,2,1),
(3,3,3),
(1,1,7);

/*Table structure for table `gastos` */

DROP TABLE IF EXISTS `gastos`;

CREATE TABLE `gastos` (
  `idGasto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionGasto` varchar(200) NOT NULL,
  `montoGasto` decimal(6,2) NOT NULL,
  `fechaHoraGasto` datetime NOT NULL DEFAULT current_timestamp(),
  `idPersona` int(11) NOT NULL,
  `idMedioPago` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idGasto`),
  KEY `fk_idusuario_gas` (`idUsuario`),
  KEY `fk_per_gas` (`idPersona`),
  KEY `fk_idmep_gas` (`idMedioPago`),
  CONSTRAINT `fk_idmep_gas` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`),
  CONSTRAINT `fk_idusuario_gas` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `fk_per_gas` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `gastos` */

/*Table structure for table `historias_clinicas` */

DROP TABLE IF EXISTS `historias_clinicas`;

CREATE TABLE `historias_clinicas` (
  `idHistoriaClinica` int(11) NOT NULL AUTO_INCREMENT,
  `antecedentePersonal` varchar(199) DEFAULT NULL,
  `antecedenteFamiliar` varchar(199) DEFAULT NULL,
  `antecedenteQuirurgico` varchar(199) DEFAULT NULL,
  `antecedenteOtro` varchar(199) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idHistoriaClinica`),
  UNIQUE KEY `uk_historia_hcl` (`idPersona`),
  KEY `fk_idUsuario_hcl` (`idUsuario`),
  CONSTRAINT `fk_idPersona_hcl` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_idUsuario_hcl` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `historias_clinicas` */

insert  into `historias_clinicas`(`idHistoriaClinica`,`antecedentePersonal`,`antecedenteFamiliar`,`antecedenteQuirurgico`,`antecedenteOtro`,`idUsuario`,`idPersona`) values 
(1,NULL,NULL,NULL,NULL,1,14),
(2,NULL,NULL,NULL,NULL,1,20),
(3,NULL,NULL,NULL,NULL,1,21),
(4,NULL,NULL,NULL,NULL,1,22),
(5,NULL,NULL,NULL,NULL,1,24),
(6,NULL,NULL,NULL,NULL,1,25),
(7,NULL,NULL,NULL,NULL,1,27),
(8,NULL,NULL,NULL,NULL,1,30),
(9,NULL,NULL,NULL,NULL,1,31),
(10,NULL,NULL,NULL,NULL,1,36),
(11,NULL,NULL,NULL,NULL,1,37),
(12,NULL,NULL,NULL,NULL,1,38),
(13,NULL,NULL,NULL,NULL,1,42),
(14,NULL,NULL,NULL,NULL,1,43),
(15,NULL,NULL,NULL,NULL,1,44),
(16,NULL,NULL,NULL,NULL,1,45);

/*Table structure for table `medio_pagos` */

DROP TABLE IF EXISTS `medio_pagos`;

CREATE TABLE `medio_pagos` (
  `idMedioPago` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePago` varchar(100) NOT NULL,
  PRIMARY KEY (`idMedioPago`),
  UNIQUE KEY `uk_nombrePago_mps` (`nombrePago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `medio_pagos` */

insert  into `medio_pagos`(`idMedioPago`,`nombrePago`) values 
(3,'Efectivo'),
(4,'Plin'),
(5,'POS'),
(2,'Transferencia'),
(1,'Yape');

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `monto` decimal(6,2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '0',
  `fechaHoraPago` datetime NOT NULL DEFAULT current_timestamp(),
  `idAtencion` int(11) DEFAULT NULL,
  `idMedioPago` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_idate_pag` (`idAtencion`),
  KEY `fk_idusuario_pag` (`idUsuario`),
  KEY `fk_idmep_pag` (`idMedioPago`),
  CONSTRAINT `fk_idate_pag` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idmep_pag` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`),
  CONSTRAINT `fk_idusuario_pag` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pagos` */

insert  into `pagos`(`idPago`,`monto`,`estado`,`fechaHoraPago`,`idAtencion`,`idMedioPago`,`idUsuario`) values 
(1,70.00,'0','2023-11-30 20:16:50',6,3,1),
(2,60.00,'0','2023-11-30 20:21:01',7,3,1),
(3,60.00,'0','2023-11-30 20:21:31',8,3,1),
(4,50.00,'0','2023-11-30 20:21:59',9,3,1),
(5,20.00,'0','2023-11-30 20:21:59',9,1,1),
(6,60.00,'0','2023-11-30 20:22:18',10,3,1),
(7,20.00,'0','2023-11-30 20:22:40',11,3,1),
(8,150.00,'0','2023-11-30 20:22:53',12,5,1),
(9,20.00,'0','2023-11-30 20:23:06',13,3,1),
(10,30.00,'0','2023-11-30 20:23:31',14,3,1),
(11,50.00,'0','2023-11-30 20:23:53',15,5,1),
(12,30.00,'0','2023-11-30 20:24:07',16,5,1),
(13,40.00,'0','2023-11-30 20:24:22',17,3,1),
(14,6.00,'0','2023-11-30 20:24:35',18,3,1),
(15,40.00,'0','2023-11-30 20:24:49',19,3,1),
(16,10.00,'0','2023-11-30 20:26:19',20,3,1),
(17,20.00,'0','2023-11-30 20:26:34',21,3,1),
(18,15.00,'0','2023-11-30 20:26:51',22,3,1),
(19,40.00,'0','2023-11-30 20:27:05',23,3,1),
(20,50.00,'0','2023-11-30 20:27:21',24,3,1),
(21,30.00,'0','2023-11-30 20:27:37',25,3,1),
(22,50.00,'0','2023-11-30 20:27:57',26,5,1),
(23,10.00,'0','2023-11-30 20:28:45',27,1,1),
(24,10.00,'0','2023-11-30 20:29:00',28,1,1),
(25,20.00,'0','2023-11-30 20:29:15',29,3,1),
(26,40.00,'0','2023-11-30 20:29:48',30,3,1),
(27,60.00,'0','2023-11-30 20:30:00',31,3,1),
(28,50.00,'0','2023-11-30 20:30:17',32,3,1),
(29,50.00,'0','2023-11-30 20:30:25',33,3,1),
(30,60.00,'0','2023-11-30 20:30:41',34,3,1),
(31,40.00,'0','2023-11-30 20:31:06',35,3,1),
(32,40.00,'0','2023-11-30 20:31:23',36,3,1),
(33,40.00,'0','2023-11-30 20:31:31',37,3,1),
(34,60.00,'0','2023-11-30 20:31:50',38,3,1),
(35,6.00,'0','2023-11-30 20:31:59',39,3,1),
(36,90.00,'0','2023-11-30 20:32:38',40,3,1),
(37,30.00,'0','2023-11-30 20:32:50',41,3,1),
(38,40.00,'0','2023-11-30 20:33:12',42,3,1),
(39,20.00,'0','2023-11-30 20:33:30',43,3,1),
(40,30.00,'0','2023-11-30 20:33:45',44,3,1),
(41,40.00,'0','2023-11-30 20:34:03',45,1,1);

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `tipoDocumento` char(1) NOT NULL,
  `numeroDocumento` varchar(12) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaFin` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `uk_numeroDocumento_per` (`numeroDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idPersona`,`nombres`,`apellidoPaterno`,`apellidoMaterno`,`tipoDocumento`,`numeroDocumento`,`fechaNacimiento`,`genero`,`telefono`,`distrito`,`fechaCreacion`,`fechaFin`,`estado`) values 
(1,'WILLIAMS JAVIER','CHUMPITAZ','GAMARRA','N','10455420','1976-07-26','M',NULL,'CHINCHA ALTA','2023-11-20 23:41:16',NULL,'1'),
(2,'RICHARD ANDERSON','DE LA CRUZ','CAMPOS','N','74556725','2003-03-09','M',NULL,'ALTO LARAN','2023-11-20 23:41:16',NULL,'1'),
(3,'MELANY NAYELI','AGUIRRE','FERNANDEZ','N','71716027','2004-10-17','F',NULL,'CHINCHA ALTA','2023-11-20 23:41:16',NULL,'1'),
(4,'ENZO EFRAIN','RISCO','VÁSQUEZ','N','46391849','1990-06-23','M',NULL,'FORANEO','2023-11-20 23:41:16',NULL,'1'),
(5,'LUIS EDUARDO','RIVA','CADENAS','N','43406872','1952-07-15','M',NULL,'FORANEO','2023-11-20 23:41:16',NULL,'1'),
(6,'CARLOS ALBERTO','REYES','GARCIA','N','46430425','1990-07-23','M',NULL,'FORANEO','2023-11-20 23:41:16',NULL,'1'),
(7,'PAMELA ALEJANDRA','LUQUE','DONAYRE','N','73458545','2001-10-05','F',NULL,'CHINCHA BAJA','2023-11-20 23:41:16',NULL,'1'),
(8,'JAZMIN JULIZA','CASTRO','VASQUEZ','N','45397454','1988-07-21','F',NULL,'SUNAMPE','2023-11-20 23:41:16',NULL,'1'),
(9,'AUGUSTO AMERICO','TORRES','MAGALLANES','N','70051404','1997-03-06','M',NULL,'CHINCHA ALTA','2023-11-20 23:41:16',NULL,'1'),
(10,'ALISSON DANIELA','TORRES','SARAVIA','N','70758550','2006-01-21','F',NULL,'GROCIO PRADO','2023-11-20 23:41:16',NULL,'1'),
(11,'FABIANA ANDREA','TASAYCO','RAMOS','N','72793047','2001-08-01','F',NULL,'CHINCHA ALTA','2023-11-20 23:41:16',NULL,'1'),
(12,'JUDITH ROSMERY','PACHAS','ESTEBAN','N','72500480','2006-03-06','F',NULL,'CHINCHA ALTA','2023-11-20 23:41:16',NULL,'1'),
(13,'IRENE ALEJANDRA','SUAREZ','MATIAS','N','76364010','2002-01-31','F','902191414','Chincha Alta','2023-11-20 23:46:38',NULL,'1'),
(14,'FELIPE CELESTINO','SALGUERO','VALENTIN','N','21782116','1953-11-12','M',NULL,'Sunampe','2023-11-30 18:37:56',NULL,'1'),
(15,'RICARDO ALEXIS','FLORES','FELIX','N','70750865','1990-02-15','M',NULL,'Sunampe','2023-11-30 18:40:11',NULL,'1'),
(16,'ALISSON DAYLIN','DE LA CRUZ','CASTILLA','N','71908869','2000-05-02','F',NULL,'Foráneo','2023-11-30 18:41:30',NULL,'1'),
(17,'VIOLETA','VASQUEZ','CONDORI','N','42037159','1963-09-18','F',NULL,'Chincha Alta','2023-11-30 18:45:31',NULL,'1'),
(18,'LUCIANA','SIGUIAS','PACHAS','N','78257684','1989-02-14','F',NULL,'Chincha Alta','2023-11-30 18:55:25',NULL,'1'),
(19,'JHONEL SEVERIANO','CASTILLA','RAMOS','N','80462483','1983-10-10','M',NULL,'Chincha Alta','2023-11-30 18:57:52',NULL,'1'),
(20,'YUBER LEONCIO','LOYLO','DIAZ','N','70347580','1990-04-17','M',NULL,'Chincha Alta','2023-11-30 18:59:14',NULL,'1'),
(21,'MICKEEL GEORGE','HUARGUA','ZEA','N','74217231','2003-05-04','M',NULL,'Chincha Alta','2023-11-30 19:12:14',NULL,'1'),
(22,'JOSE ','TASAICO','ZELADA','N','21802722','2000-06-23','M',NULL,'Chincha Alta','2023-11-30 19:16:06',NULL,'1'),
(23,'MILAGROS ALEXANDRA','TEJADA','RAMIREZ','N','62723757','1999-08-15','F',NULL,'Chincha Alta','2023-11-30 19:17:09',NULL,'1'),
(24,'GAELA','PASTOR','BENAVIDES','N','91741168','2020-10-29','F',NULL,'Chincha Alta','2023-11-30 19:18:21',NULL,'1'),
(25,'GRACE ELENA','MARCOS','HERRERA','N','75626627','1998-02-28','F',NULL,'Chincha Alta','2023-11-30 19:26:24',NULL,'1'),
(26,'SILVIA KARIN','JACOBO','PASACHE','N','40554178','1980-06-14','F',NULL,'Chincha Alta','2023-11-30 19:27:53',NULL,'1'),
(27,'ELMER','DE LA CRUZ','RAMOS','N','42023158','1980-01-01','M',NULL,'Chincha Alta','2023-11-30 19:29:42',NULL,'1'),
(28,'MARIO EDGARDO','MUCHAYPIÑA','BETANCOURT','N','70754947','1987-03-18','M',NULL,'Chincha Alta','2023-11-30 19:32:12',NULL,'1'),
(29,'LUCERO YERSHINIA','TORRES','SALVADOR DE MOQUILLAZA','N','47670475','1992-08-12','F',NULL,'Chincha Alta','2023-11-30 19:36:11',NULL,'1'),
(30,'YONATHAN BRIAN','RAMOS','FONSECA','N','49032903','1999-04-15','M',NULL,'Chincha Alta','2023-11-30 19:41:50',NULL,'1'),
(31,'ERICK','TASAYCO','ALMEYDA','N','70545671','2000-01-19','M',NULL,'Chincha Alta','2023-11-30 19:42:59',NULL,'1'),
(32,'LIDIA','RODRIGUEZ','QUIHUE','N','72028019','1982-10-25','F',NULL,'Chincha Alta','2023-11-30 19:44:35',NULL,'1'),
(33,'ALDAIR','RODRIGUEZ','QUIHUE','N','63183638','2006-01-25','M',NULL,'Chincha Alta','2023-11-30 19:46:25',NULL,'1'),
(34,'NAYDA','QUIHUE','QUISPE','N','43033778','1968-08-10','F',NULL,'Chincha Alta','2023-11-30 19:48:29',NULL,'1'),
(35,'LIZ DINA','FLORES','LUJANO','N','77498373','2000-04-17','F',NULL,'Chincha Alta','2023-11-30 19:50:46',NULL,'1'),
(36,'JEFFERSON JESUS','TASAYCO','MUÑOZ','N','75325189','1970-11-21','M',NULL,'Chincha Alta','2023-11-30 19:52:53',NULL,'1'),
(37,'RENE ANTONIETA','RAMOS','DE LLANCARI','N','21876986','1985-08-07','F',NULL,'Chincha Alta','2023-11-30 19:54:09',NULL,'1'),
(38,'BERTHA LORGIA','PEREZ','MARCOS','N','21882456','1969-04-26','F',NULL,'Chincha Baja','2023-11-30 19:55:44',NULL,'1'),
(39,'CARLOS EDUARDO','CARRASCO','LOPEZ','N','46205054','1999-07-12','M',NULL,'EL Carmen','2023-11-30 19:59:45',NULL,'1'),
(40,'MARIANA MARGARITA','QUISPE','CHOQUEZ','N','21828952','1997-04-18','F',NULL,'Chincha Alta','2023-11-30 20:01:12',NULL,'1'),
(41,'TERESA','DE LA CRUZ','NAPA','N','21794169','1989-05-20','F',NULL,'Chincha Alta','2023-11-30 20:05:04',NULL,'1'),
(42,'MELE MODESTA','ORTIZ','LLAMOCCA','N','47634164','1999-11-12','F',NULL,'Chincha Alta','2023-11-30 20:06:44',NULL,'1'),
(43,'JORGE LUIS','SIGUAS','BERNAHOLA','N','21827434','1985-04-10','M',NULL,'Chincha Alta','2023-11-30 20:08:30',NULL,'1'),
(44,'JUAN CARLOS','CHOQUE','URBINA','N','43785293','1988-10-31','M',NULL,'Chincha Alta','2023-11-30 20:10:17',NULL,'1'),
(45,'GRABIEL EDUBIGUIS','CONTRERAS','HUASASQUICHE','N','21862976','1998-10-27','M',NULL,'Chincha Alta','2023-11-30 20:12:41',NULL,'1');

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `nombreServicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `uk_nombreServicio_ser` (`nombreServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicios` */

insert  into `servicios`(`idServicio`,`tipo`,`nombreServicio`) values 
(1,'S','Laboratorio clínico'),
(2,'S','Ecografía'),
(3,'S','Rayos X'),
(4,'S','Tópico'),
(5,'S','Resonancia magnetica'),
(6,'E','Medicina General'),
(7,'E','Medicina Interna'),
(8,'E','Pediatría'),
(9,'E','Ginecología'),
(10,'E','Cirugía general'),
(11,'E','Neurología'),
(12,'E','Traumatología'),
(13,'E','Terapia física y rehabilitación'),
(14,'E','Urología'),
(15,'E','Dermatología'),
(16,'E','Cardiología'),
(17,'E','Psicología'),
(18,'E','Neumología'),
(19,'E','Otorrinolaringología'),
(20,'E','Tomografia'),
(21,'E','Odontología'),
(22,'E','Odontopediatria');

/*Table structure for table `servicios_detalle` */

DROP TABLE IF EXISTS `servicios_detalle`;

CREATE TABLE `servicios_detalle` (
  `idservicios_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idservicio` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idservicios_detalle`),
  KEY `fk_idservicios_serdet` (`idservicio`),
  CONSTRAINT `fk_idservicios_serdet` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicios_detalle` */

insert  into `servicios_detalle`(`idservicios_detalle`,`idservicio`,`descripcion`,`precio`,`genero`,`estado`) values 
(1,1,'ACIDO FOLICO',60.00,NULL,'1'),
(2,1,'B12 VITAMINA',60.00,NULL,'1'),
(3,1,'CONSTANTES CORPUSCULARES',20.00,NULL,'1'),
(4,1,'FENOMENO LE - LUPUS ERIMATOSO',35.00,NULL,'1'),
(5,1,'FERRITINA',80.00,NULL,'1'),
(6,1,'GRUPO SANGUINEO Y RH-TIPIFICACION SANGUINEO',10.00,NULL,'1'),
(7,1,'HEMOGLOBINA - HEMATOCRITO RECUENTO SANGUINEO',10.00,NULL,'1'),
(8,1,'HEMOGRAMA COMPLETO',30.00,NULL,'1'),
(9,1,'HIERRO SERICO',50.00,NULL,'1'),
(10,1,'LAMINA PERIFERICA',15.00,NULL,'1'),
(11,1,'RETICULOCITOS',15.00,NULL,'1'),
(12,1,'TEST DE COOMBS DIRECTO',50.00,NULL,'1'),
(13,1,'TRANSFERRINA',65.00,NULL,'1'),
(14,1,'TROPONINA I',70.00,NULL,'1'),
(15,1,'ERITROSEDIMENTACION - VSG - VELOCIDAD DE SEDIMIENTO',10.00,NULL,'1'),
(16,1,'RECUENTO DE PLAQUETAS (MANUAL)',15.00,NULL,'1'),
(17,1,'TIEMPO DE COAGULACION Y SANGRIA - TC - TS',15.00,NULL,'1'),
(18,1,'VARIANTE DU',20.00,NULL,'1'),
(19,1,'TIEMPO DE PROTOMBINA IRN(TP) - TP TROMBINA',35.00,NULL,'1'),
(20,1,'TIEMPO DE TROMBINA',35.00,NULL,'1'),
(21,1,'TIEMPO DE TROMBOPLASTINA PARCIAL ACTIVADA APTT',35.00,NULL,'1'),
(22,1,'FIBRINOGENO',40.00,NULL,'1'),
(23,1,'DIMERO D CUANTIATIVO',90.00,NULL,'1'),
(24,1,'ACIDO URICO',15.00,NULL,'1'),
(25,1,'AMILASA SERICA',30.00,NULL,'1'),
(26,1,'BILIRRUBINAS TOTAL Y FRACCIONADAS',20.00,NULL,'1'),
(27,1,'CALCIO SERICO',35.00,NULL,'1'),
(28,1,'COLESTEROL HDL',15.00,NULL,'1'),
(29,1,'COLESTEROL LDL',15.00,NULL,'1'),
(30,1,'COLESTEROL TOTAL',10.00,NULL,'1'),
(31,1,'COLESTEROL VLDL',15.00,NULL,'1'),
(32,1,'CPK MB',50.00,NULL,'1'),
(33,1,'CREATININA',10.00,NULL,'1'),
(34,1,'DESHIDROGENASA LACTICA (LDH)',50.00,NULL,'1'),
(35,1,'ELECTROLITOS SERICOS (NA - CL - K) SODIO - CLORO - SODIO',80.00,NULL,'1'),
(36,1,'FOSFATA ALCALINA',10.00,NULL,'1'),
(37,1,'FOSFATASA ACIDA PROSTATICA ( RESULTADO 3 DIAS )',90.00,NULL,'1'),
(38,1,'FOSFORO',30.00,NULL,'1'),
(39,1,'GAMMA/GLUTAMIL/TRANSFERASA(GGT)TRANSPETIDASA/GGTP',50.00,NULL,'1'),
(40,1,'GLUCOSA POSTPANDRIAL',20.00,NULL,'1'),
(41,1,'GLUCOSA',10.00,NULL,'1'),
(42,1,'TOLERANCIA A LA GLUCOSA (3 GLUCOSAS) BASAL - 60MIN - 120 MIN',30.00,NULL,'1'),
(43,1,'HEMOGLOBINA GLICOSILADA (HB)',60.00,NULL,'1'),
(44,1,'LIPASA SERICA',60.00,NULL,'1'),
(45,1,'LIPIDOS TOTALES',20.00,NULL,'1'),
(46,1,'MAGNESIO',50.00,NULL,'1'),
(47,1,'PROTEINAS T Y F + ALBUMINA + GLOBULINA',25.00,NULL,'1'),
(48,1,'TRANSAMINASA OXALACETICA TGO',15.00,NULL,'1'),
(49,1,'TRANSAMINASA PIRUVICA TGP',15.00,NULL,'1'),
(50,1,'TRIGLICERIDOS',10.00,NULL,'1'),
(51,1,'UREA',10.00,NULL,'1'),
(52,1,'INSULINA BASAL',50.00,NULL,'1'),
(53,1,'INSULINA POST PANDRIAL( BASAL + INSULINA 2HRAS)',100.00,NULL,'1'),
(54,1,'AGLUTINACIONES - PARATIFICO - (TIFOIDEA)',30.00,NULL,'1'),
(55,1,'ANA - ANT ANTINUCLEARES - LIMA',100.00,NULL,'1'),
(56,1,'ANTIESTREPTOLISINA \"O\" ASO',15.00,NULL,'1'),
(57,1,'CHAGAS',60.00,NULL,'1'),
(58,1,'FACTOR REUMATOIDEO CUANTITIVO',60.00,NULL,'1'),
(59,1,'FACTOR REUMATOIDEO CUALITATIVO',15.00,NULL,'1'),
(60,1,'H.I.V (1 + 2) PRUEBA RAPIDA',30.00,NULL,'1'),
(61,1,'HIV 4TA GENERSCION ELISA',70.00,NULL,'1'),
(62,1,'HELICOBACTER PYLORI CUALITATIVA',30.00,NULL,'1'),
(63,1,'HELICOBACTER PYLORI IGG CUALITATIVA',60.00,NULL,'1'),
(64,1,'HELICOBACTER PYLORI IGM CUALITATIVA',60.00,NULL,'1'),
(65,1,'HEPATITIS A HVA',55.00,NULL,'1'),
(66,1,'HEPATITIS B (ANTICORE TOTAL)',60.00,NULL,'1'),
(67,1,'HEPATITIS B (ANTICUERPOS HB)',80.00,NULL,'1'),
(68,1,'HEPATITIS B (HSBAG) - (ANTIGENO AUSTRALIANO) ELISA',60.00,NULL,'1'),
(69,1,'HEPATITIS B (HSBAG) - (ANTIGENO AUSTRALIANO) (P. RAPIDA)',30.00,NULL,'1'),
(70,1,'HEPATITIS C (AC TOTALES) - ELISA',60.00,NULL,'1'),
(71,1,'HTLV',60.00,NULL,'1'),
(72,1,'INMUNOGLUBULINA SERICA IGE',60.00,NULL,'1'),
(73,1,'PCR CUALITATIVA',15.00,NULL,'1'),
(74,1,'PCR CUANTITATIVA',50.00,NULL,'1'),
(75,1,'RPR',30.00,NULL,'1'),
(76,1,'DENGUE IGG/IGM/NS1',70.00,NULL,'1'),
(77,1,'PRUEBA COVID19 - HISOPADO',60.00,NULL,'1'),
(78,1,'SIFILIS POR ELISA',60.00,NULL,'1'),
(79,1,'ELISA PARA HIDATIDOSIS ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',100.00,NULL,'1'),
(80,1,'PANEL ALERGICO(36) PLANTAS Y COMIDA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',250.00,NULL,'1'),
(81,1,'ANTI CCP - PEPTIDO CLINICO ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',230.00,NULL,'1'),
(82,1,'PERFIL TESTOSTERONA LIBRE',90.00,NULL,'1'),
(83,1,'CHALMYDIA TRACHOMATIS IGG ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL,'1'),
(84,1,'CHALMYDIA TRACHOMATIS IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL,'1'),
(85,1,'TOXOPLASMA IGG( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL,'1'),
(86,1,'TOXOPLASMA IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL,'1'),
(87,1,'CITOMEGALOVIRUS IGG ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL,'1'),
(88,1,'CITOMEGALOVIRUS IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL,'1'),
(89,1,'EXAMEN COMPLETO DE ORINA',10.00,NULL,'1'),
(90,1,'PROTEINAS (ORINA 24H)',30.00,NULL,'1'),
(91,1,'SEDIMENTO URINARIO',5.00,NULL,'1'),
(92,1,'DEPURACION DE CREATININA',30.00,NULL,'1'),
(93,1,'MICROALBUMINURIA (ORINA 24 H)',30.00,NULL,'1'),
(94,1,'UROCULTIVO - ATB - KIT COMERCIAL - CULTIVO',40.00,NULL,'1'),
(95,1,'CALCIO (ORINA 24H)',45.00,NULL,'1'),
(96,1,'PARASITOLOGICO SIMPLE X 1 MUESTRA',10.00,NULL,'1'),
(97,1,'PARASITOLOGIA SERIADA X 3 MUESTRAS',30.00,NULL,'1'),
(98,1,'COPROCULTIVO FUNCIONAL',60.00,NULL,'1'),
(99,1,'REACCION INFLAMATORIA',10.00,NULL,'1'),
(100,1,'SUDAM III',50.00,NULL,'1'),
(101,1,'SUSTANCIAS REDUCTORAS',30.00,NULL,'1'),
(102,1,'TEST DE GRAHAM',10.00,NULL,'1'),
(103,1,'THEVENON',35.00,NULL,'1'),
(104,1,'COLORACION GRAM (BACTERIAS)',20.00,NULL,'1'),
(105,1,'CULTIVO DE FARINGEA',80.00,NULL,'1'),
(106,1,'CULTIVO DE LIQUIDO (4 DIAS)',60.00,NULL,'1'),
(107,1,'CULTIVO HERIDA',60.00,NULL,'1'),
(108,1,'ESPUTO SERIADO X3',40.00,NULL,'1'),
(109,1,'ESPUTO SIMPLE X1',15.00,NULL,'1'),
(110,1,'KOH - RASPADO',30.00,NULL,'1'),
(111,1,'CORTISOL AM',80.00,NULL,'1'),
(112,1,'CORTISOL PM',80.00,NULL,'1'),
(113,1,'BHCG CUALITATIVO',20.00,NULL,'1'),
(114,1,'BHCG CUANTITATIVO',60.00,NULL,'1'),
(115,1,'ESTRADIOL',70.00,NULL,'1'),
(116,1,'FSH',60.00,NULL,'1'),
(117,1,'LH',60.00,NULL,'1'),
(118,1,'PROGESTERONA',70.00,NULL,'1'),
(119,1,'PROLACTINA',70.00,NULL,'1'),
(120,1,'T3 - TOTAL',60.00,NULL,'1'),
(121,1,'T3 LIBRE',60.00,NULL,'1'),
(122,1,'T4 TOTAL',60.00,NULL,'1'),
(123,1,'T4 LIBRE',60.00,NULL,'1'),
(124,1,'TESTOTERONA',70.00,NULL,'1'),
(125,1,'TSH',60.00,NULL,'1'),
(126,1,'CA 15-3 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL,'1'),
(127,1,'CA 19.9 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL,'1'),
(128,1,'CEA 125 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL,'1'),
(129,1,'CEA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL,'1'),
(130,1,'ALFA FETOPROTEINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL,'1'),
(131,1,'DOSAJE PROCALCITONINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',250.00,NULL,'1'),
(132,1,'BIOPSIA PIEZA OPERATORIA <= 5MM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL,'1'),
(133,1,'BIOPSIA PIEZA OPERATORIA CHICA > 5MM <=2 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL,'1'),
(134,1,'BIOPSIA PIEZA OPERATORIA MEDIANO > 2 CM Y <= 5CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',190.00,NULL,'1'),
(135,1,'BIOPSIA PIEZA OPERTORIA GRANDE > 5CM Y <= 10 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',280.00,NULL,'1'),
(136,1,'PERFIL LIPIDICO',60.00,NULL,'1'),
(137,1,'PERFIL HEPATICO',60.00,NULL,'1'),
(138,2,'ECO ABDOMINAL INFERIOR',60.00,NULL,'1'),
(139,2,'ECO ABDOMINAL SUPERIOR',60.00,NULL,'1'),
(140,2,'ECO COMPLETA',60.00,NULL,'1'),
(141,2,'ECO DE CUELLO',60.00,NULL,'1'),
(142,2,'ECO DE VEJIGA',60.00,NULL,'1'),
(143,2,'ECO DOPLER 1 MIEMBRO',120.00,NULL,'1'),
(144,2,'ECO DOPLER 2 MIEMBROS',200.00,NULL,'1'),
(145,2,'ECO DOPLER HEPÁTICA',150.00,NULL,'1'),
(146,2,'ECO GÉNETICA',120.00,NULL,'1'),
(147,2,'ECO HIGADO',60.00,NULL,'1'),
(148,2,'ECO INFERIOR',60.00,NULL,'1'),
(149,2,'ECO MUSCULOESQUELETICA',60.00,NULL,'1'),
(150,2,'ECO PARTES BLANDAS',60.00,NULL,'1'),
(151,2,'ECO PARTES BLANDAS HERNIAS',60.00,NULL,'1'),
(152,2,'ECO PARTES BLANDAS TIROIDES',60.00,NULL,'1'),
(153,2,'ECO PÉLVICA',60.00,NULL,'1'),
(154,2,'ECO RENAL',60.00,NULL,'1'),
(155,2,'ECO RENAL-VESICAL',60.00,NULL,'1'),
(156,2,'ECO SUPERIOR',60.00,NULL,'1'),
(157,2,'ECO TIROIDES Y MASAS DEL CUELLO',60.00,NULL,'1'),
(158,2,'ECO VESICULAR',60.00,NULL,'1'),
(159,2,'ECO VIAS URINARIAS COMPLETAS',60.00,NULL,'1'),
(160,3,'RX PIE',70.00,NULL,'1'),
(161,3,'RX DE RODILLA',90.00,NULL,'1'),
(162,3,'RX DE COLUMNA LUMBOSACRA',90.00,NULL,'1'),
(163,3,'RX SENOS PARANASALES F-P-O',90.00,NULL,'1'),
(164,3,'RX MAXILAR INFERIOR',70.00,NULL,'1'),
(165,3,'RX MAXILAR SUPERIOR',70.00,NULL,'1'),
(166,3,'RX MASTOIDES(POR LADO)',60.00,NULL,'1'),
(167,3,'RX HUESOS NASALES',60.00,NULL,'1'),
(168,3,'RX DE AGUJEROS OPTICOS',60.00,NULL,'1'),
(169,3,'RX ORBITAS',70.00,NULL,'1'),
(170,3,'RX SILLA TURCA',70.00,NULL,'1'),
(171,3,'RX CRANEO FRONTAL Y PERFIL',70.00,NULL,'1'),
(172,3,'RX PEÑASCO CADA LADO',60.00,NULL,'1'),
(173,3,'RX TEMPORAL CADA LADO',50.00,NULL,'1'),
(174,3,'RX ARTIC TEMPOMANDIBULAR UNILATERAL(CADA LADO)',60.00,NULL,'1'),
(175,3,'RX ARTIC TEMPOMANDIBULAR COMPARATIVO',80.00,NULL,'1'),
(176,3,'RX TORAX, INCIDENCIA FRONTAL O A/P',50.00,NULL,'1'),
(177,3,'RX TORAX, FRONTAL Y LATERAL(F-P)',80.00,NULL,'1'),
(178,3,'RX CORAZON Y GRANDES VASOS - TORAX',50.00,NULL,'1'),
(179,3,'RX COSTILLAS F',50.00,NULL,'1'),
(180,3,'RX ESTERNON, MINIMO 2 INCIDENCIAS',70.00,NULL,'1'),
(181,3,'RX COLUMNA CERVICAL F-P-O',90.00,NULL,'1'),
(182,3,'RX COLUMNA CERVICAL FRONTAL LATERAL',70.00,NULL,'1'),
(183,3,'RX COLUMNA CERVICAL FUNCIONAL 2 INCIDENCIAS',70.00,NULL,'1'),
(184,3,'RX COLUMNA CERVICO DORSAL',70.00,NULL,'1'),
(185,3,'RX COLUMNA LUMBAR FRONTAL Y LATERAL',70.00,NULL,'1'),
(186,3,'RX COLUMNA DORSAL FRONTAL Y LATERAL',70.00,NULL,'1'),
(187,3,'RX COLUMNA DORSAL F-P-O',90.00,NULL,'1'),
(188,3,'RX PARRILLA COSTAL F-O',90.00,NULL,'1'),
(189,3,'RX COLUMNA DORSOLUMBAR',80.00,NULL,'1'),
(190,3,'RX COLUMNA LUMBOSACRA F-P',70.00,NULL,'1'),
(191,3,'RX COLUMNA LUMBOSACRA F-P-O',90.00,NULL,'1'),
(192,3,'RX PELVIS',70.00,NULL,'1'),
(193,3,'RX SACROLIACA CADA LADO',70.00,NULL,'1'),
(194,3,'RX SACROCOXIGEA F-P',70.00,NULL,'1'),
(195,3,'RX CLAVICULA COMPLETO',50.00,NULL,'1'),
(196,3,'RX ESCAPULA FRONTAL LATERAL',70.00,NULL,'1'),
(197,3,'RX HOMBRO F-P',50.00,NULL,'1'),
(198,3,'RX BRAZO F-P',50.00,NULL,'1'),
(199,3,'RX CODO F-P',50.00,NULL,'1'),
(200,3,'RX ANTEBRAZO CADA LADO',50.00,NULL,'1'),
(201,3,'RX MUÑECA F-P',50.00,NULL,'1'),
(202,3,'RX MANO F-P',50.00,NULL,'1'),
(203,3,'RX MANO, EDAD OSEA(FRONTAL)',50.00,NULL,'1'),
(204,3,'RX CADERA, UNILAT, UNA VISTA',70.00,NULL,'1'),
(205,3,'RX CADERA, UNILAT, COMPLETO 2 VISTAS',90.00,NULL,'1'),
(206,3,'RX PELVIS Y CADERA, LACTANTE O NIÑO',80.00,NULL,'1'),
(207,3,'RX FEMUR F-P',70.00,NULL,'1'),
(208,3,'RX RODILLA F-P',70.00,NULL,'1'),
(209,3,'RX ROTULA FRONTAL Y LATERAL',50.00,NULL,'1'),
(210,3,'RX TIBIA Y PERONE F-P',50.00,NULL,'1'),
(211,3,'RX TOBILLO F-P',50.00,NULL,'1'),
(212,3,'RX PIE F-O',50.00,NULL,'1'),
(213,3,'RX CALCANEO F-P',70.00,NULL,'1'),
(214,3,'RX MEDICIÓN DE MIEMBRO INFERIOR NIÑO',120.00,NULL,'1'),
(215,3,'RX MEDICIÓN DE MIEMBRO INFERIOR ADULTO',120.00,NULL,'1'),
(216,3,'RX ABDOMEN SIMPLE',60.00,NULL,'1'),
(217,3,'RX ABDOMEN DE PIE - DECUBITO',70.00,NULL,'1'),
(218,3,'EXAMEN RADIOLOGICO DE CAVUM',60.00,NULL,'1'),
(219,3,'EXAMEN RADIOLOGICO DE ESOFAGO',110.00,NULL,'1'),
(220,3,'UROGRAFIA EXCRETORIA',100.00,NULL,'1'),
(221,3,'RX PIERNA F-P',70.00,NULL,'1'),
(222,4,'INTRAMUSCULAR',6.00,NULL,'1'),
(223,4,'ENDOVENOSO',30.00,NULL,'1'),
(224,4,'AMPOLLA A LA VENA',20.00,NULL,'1'),
(225,4,'NEBULIZACION',10.00,NULL,'1'),
(226,4,'COLOCACION DE OXIGENO 20 MIN',50.00,NULL,'1'),
(227,4,'COLOCACION DE OXIGENO 30 MIN',80.00,NULL,'1'),
(228,4,'RETIRO DE PUNTOS',10.00,NULL,'1'),
(229,4,'COLOCACION DE ENEMA',20.00,NULL,'1'),
(230,4,'COLOCACION DE SONDA ',30.00,NULL,'1'),
(231,4,'PRUEBA DE SENSIBILIDAD',6.00,NULL,'1'),
(232,5,'CRANEO - CRANEO ANGIORESONANCIA',1140.00,NULL,'1'),
(233,5,'CRANEO - CRANEO - AGIORESONANCIA CEREBRAL',970.00,NULL,'1'),
(234,5,'CRANEO - ESPECTROSCOPIA ALZHEIMER',570.00,NULL,'1'),
(235,5,'CRANEO - ESPECTROSCOPIA PARKINSON',570.00,NULL,'1'),
(236,5,'CRANEO - PERFUSION',570.00,NULL,'1'),
(237,5,'CRANEO - VOLUMETRIA HIPOCAMPO',570.00,NULL,'1'),
(238,5,'CRANEO - OIDO',570.00,NULL,'1'),
(239,5,'CRANEO - MACIZO FACIAL',570.00,NULL,'1'),
(240,5,'CRANEO - ORBITAS',770.00,NULL,'1'),
(241,5,'CRANEO - ANGIORESONANCIA',570.00,NULL,'1'),
(242,5,'CRANEO - REGION SELAR E HIPOFISIS',770.00,NULL,'1'),
(243,5,'COLUMNA VERTEBRAL - COLUMNA LUMBOSACRA',570.00,NULL,'1'),
(244,5,'COLUMNA VERTEBRAL - COLUMNA LUMBOSACRA MAS VISTA PANORAMICA',850.00,NULL,'1'),
(245,5,'COLUMNA VERTEBRAL - COLUMNA CERVICAL',570.00,NULL,'1'),
(246,5,'COLUMNA VERTEBRAL - COLUMNA DORSAL',570.00,NULL,'1'),
(247,5,'COLUMNA VERTEBRAL - PANORAMICA',570.00,NULL,'1'),
(248,5,'COLUMNA VERTEBRAL - SACROCOXIGEA',570.00,NULL,'1'),
(249,5,'ARTICULACIONES - TEMPORO MANDIBULAR (ATM)',620.00,NULL,'1'),
(250,5,'ARTICULACIONES - HOMBRO',620.00,NULL,'1'),
(251,5,'ARTICULACIONES - BRAZO',620.00,NULL,'1'),
(252,5,'ARTICULACIONES - CODO',620.00,NULL,'1'),
(253,5,'ARTICULACIONES - ANTEBRAZO',620.00,NULL,'1'),
(254,5,'ARTICULACIONES - MANO',620.00,NULL,'1'),
(255,5,'ARTICULACIONES - MUÑECA',620.00,NULL,'1'),
(256,5,'ARTICULACIONES - COXOFEMORAL (CADERA)',620.00,NULL,'1'),
(257,5,'ARTICULACIONES - RODILLA',570.00,NULL,'1'),
(258,5,'ARTICULACIONES - PIERNA',620.00,NULL,'1'),
(259,5,'ARTICULACIONES - TOBILLO',620.00,NULL,'1'),
(260,5,'ARTICULACIONES - PIE',620.00,NULL,'1'),
(261,5,'ARTICULACIONES - TENDON DE AQUILES',620.00,NULL,'1'),
(262,5,'RESTO DE ESTUDIOS - CUELLO',620.00,NULL,'1'),
(263,5,'RESTO DE ESTUDIOS - MEDIASTINO',620.00,NULL,'1'),
(264,5,'RESTO DE ESTUDIOS - PULMONES (TORAX)',620.00,NULL,'1'),
(265,5,'RESTO DE ESTUDIOS - ABDOMEN SUPERIOR(HIGADO,BAZO,PANCREAS,RIÑON,COLAGNIO)',620.00,NULL,'1'),
(266,5,'RESTO DE ESTUDIOS - ABDOMEN INFERIOR (PELVIS)',620.00,NULL,'1'),
(267,5,'RESTO DE ESTUDIOS - ENTERORESONANCIA',1300.00,NULL,'1'),
(268,5,'RESTO DE ESTUDIOS - PROSTATA MULTIPARAMETRICA',1200.00,NULL,'1'),
(269,5,'RESTO DE ESTUDIOS - MAMA BILATERAL',1200.00,NULL,'1'),
(270,5,'RESTO DE ESTUDIOS - MAMA',800.00,NULL,'1'),
(271,5,'RESTO DE ESTUDIOS - ANGIO MM.INFERIORES ARTERIALES',620.00,NULL,'1'),
(272,5,'RESTO DE ESTUDIOS - ANGIO CUELLO SUPRAAORTICA',620.00,NULL,'1'),
(273,5,'RESTO DE ESTUDIOS - ANGIO DE AORTA -TORAX',620.00,NULL,'1'),
(274,5,'RESTO DE ESTUDIOS - PLEXO - BRAQUIAL',620.00,NULL,'1'),
(275,5,'RESTO DE ESTUDIOS - URORESONANCIA',970.00,NULL,'1'),
(276,5,'RESTO DE ESTUDIOS - CADERA',620.00,NULL,'1'),
(277,5,'RESTO DE ESTUDIOS - SENOS PARANASALES',820.00,NULL,'1'),
(278,5,'RESTO DE ESTUDIOS - TRIFASICA',820.00,NULL,'1'),
(279,5,'RESTO DE ESTUDIOS - MUSLO',620.00,NULL,'1'),
(280,5,'RESTO DE ESTUDIOS - RENAL',620.00,NULL,'1'),
(281,5,'RESTO DE ESTUDIOS - PARRILLA COSTAL',620.00,NULL,'1'),
(282,5,'RESTO DE ESTUDIOS - ESCAPULA',820.00,NULL,'1'),
(283,6,'CONSULTA',20.00,NULL,'1'),
(284,7,'CONSULTA',40.00,NULL,'1'),
(285,8,'CONSULTA',40.00,NULL,'1'),
(286,10,'CONSULTA',40.00,NULL,'1'),
(287,10,'EXTRACCION DE LIPOMA',150.00,NULL,'1'),
(288,11,'CONSULTA',40.00,NULL,'1'),
(289,12,'CONSULTA',40.00,NULL,'1'),
(290,12,'INFILTRACION',150.00,NULL,'1'),
(291,12,'COLOCACION DE YESO ANTEBRAZO SIN MATERIALES',150.00,NULL,'1'),
(292,12,'COLOCACION DE YESO ANTEBRAZO CON MATERIALES',250.00,NULL,'1'),
(293,12,'COLOCACION DE YESO PIERNA SIN MATERIALES',250.00,NULL,'1'),
(294,12,'COLOCACION DE YESO PIERNA CON MATERIALES',350.00,NULL,'1'),
(295,12,'RETIRO DE YESO',80.00,NULL,'1'),
(296,12,'FERULA SIN MATERIALES',150.00,NULL,'1'),
(297,12,'FERULA CON MATERIALES',250.00,NULL,'1'),
(298,13,'SESION',40.00,NULL,'1'),
(299,13,'PAQUETE DE 5 SESIONES',150.00,NULL,'1'),
(300,13,'PAQUETE DE 10 SESIONES',300.00,NULL,'1'),
(301,13,'ONDA DE CHOQUE',120.00,NULL,'1'),
(302,13,'MASAJES RELAJANTES',40.00,NULL,'1'),
(303,14,'CONSULTA',40.00,NULL,'1'),
(304,15,'CONSULTA',50.00,NULL,'1'),
(305,16,'CONSULTA',50.00,NULL,'1'),
(306,16,'EKG',70.00,NULL,'1'),
(307,16,'RIESGO QUIRURGICO',180.00,NULL,'1'),
(308,16,'INFORME CARDIOLOGICO',80.00,NULL,'1'),
(309,17,'CONSULTA',30.00,NULL,'1'),
(310,17,'TERAPIA',40.00,NULL,'1'),
(311,17,'EVALUACION',50.00,NULL,'1'),
(312,17,'TERAPIA DE LENGUAJE - CONSULTA',30.00,NULL,'1'),
(313,17,'TERAPIA DE LENGUAJE - TERAPIA',40.00,NULL,'1'),
(314,18,'CONSULTA',70.00,NULL,'1'),
(315,19,'CONSULTA',50.00,NULL,'1'),
(316,19,'AUDIOMETRIA TOTAL',100.00,NULL,'1'),
(317,19,'TIMPANOMETRIA',150.00,NULL,'1'),
(318,19,'ENDOSCOPIA DE OIDO',190.00,NULL,'1'),
(319,19,'CAUTERIZACION QUIMICA',140.00,NULL,'1'),
(320,19,'CURACION DE OIDO',60.00,NULL,'1'),
(321,19,'ELECTROCAUTERIZACION',100.00,NULL,'1'),
(322,19,'EXTRACCION DE CUERPO EXTRAÑO ( OIDO,NARIZ,FARINGE)',120.00,NULL,'1'),
(323,19,'INFILTRACION DE CORNETA',60.00,NULL,'1'),
(324,19,'LAVADO DE OIDO ',70.00,NULL,'1'),
(325,19,'REDUCCION DE FRACTURA',250.00,NULL,'1'),
(326,19,'RETIRO DE TAPONAMIENTO NASAL ANTERIOR UNILATERAL',100.00,NULL,'1'),
(327,19,'RETIRO DE TAPONAMIENTO NASAL ANTERIOR BILATERAL',150.00,NULL,'1'),
(328,19,'TAPONAMIENTO NASAL ANTERIOR UNILATERAL',100.00,NULL,'1'),
(329,19,'TAPONAMIENTO NASAL ANTERIOR BILATERAL',150.00,NULL,'1'),
(330,19,'CAUTERIZACION FARINGEA - UNA SESION',100.00,NULL,'1'),
(331,19,'TAPONAMENTO NASAL POSTERIOR UNILATERAL',250.00,NULL,'1'),
(332,19,'ENDOSCOPIA LARINGEA',209.00,NULL,'1'),
(333,19,'PRUEBA VESTIBULOS',100.00,NULL,'1'),
(334,19,'LARINCOSCOPIA',180.00,NULL,'1'),
(335,19,'VIDEO ENDOSCOPIA LARINGEA',190.00,NULL,'1'),
(336,19,'OTOMICROCOSPIA',100.00,NULL,'1'),
(337,20,'CEREBRAL TAC SIN CONTRASTE',330.00,NULL,'1'),
(338,20,'CEREBRAL TAC CON CONTRASTE',430.00,NULL,'1'),
(339,20,'CEREBRAL V.O TAC SIN CONTRASTE',380.00,NULL,'1'),
(340,20,'CEREBRAL V.O TAC CON CONTRASTE',480.00,NULL,'1'),
(341,20,'HIPOTISIS TAC SIN CONTRASTE',330.00,NULL,'1'),
(342,20,'HIPOTISIS TAC CON CONTRASTE',430.00,NULL,'1'),
(343,20,'TORAX TAC SIN CONTRASTE',330.00,NULL,'1'),
(344,20,'TORAX TAC CON CONTRASTE',430.00,NULL,'1'),
(345,20,'COLUMNA LUMBO-SACRA TAC SIN CONTRASTE',400.00,NULL,'1'),
(346,20,'COLUMNA LUMBO-SACRA TAC CON CONTRASTE',500.00,NULL,'1'),
(347,20,'COLUMNA DORSAL TAC SIN CONTRASTE',400.00,NULL,'1'),
(348,20,'COLUMNA DORSAL TAC CON CONTRASTE',500.00,NULL,'1'),
(349,20,'COLUMNA CERVICAL TAC SIN CONTRASTE',400.00,NULL,'1'),
(350,20,'COLUMNA CERVICAL TAC CON CONTRASTE',500.00,NULL,'1'),
(351,20,'ABDOMEN COMPLETO TAC SIN CONTRASTE',500.00,NULL,'1'),
(352,20,'ABDOMEN COMPLETO TAC CON CONTRASTE',600.00,NULL,'1'),
(353,20,'ABDOMEN SUPERIOR TAC SIN CONTRASTE',400.00,NULL,'1'),
(354,20,'ABDOMEN SUPERIOR TAC CON CONTRASTE',510.00,NULL,'1'),
(355,20,'ABDOMEN INFERIOR TAC SIN CONTRASTE',400.00,NULL,'1'),
(356,20,'ABDOMEN INFERIOR TAC CON CONTRASTE',510.00,NULL,'1'),
(357,20,'UTOTEM TAC SIN CONTRASTE',500.00,NULL,'1'),
(358,20,'UTOTEM TAC CON CONTRASTE',600.00,NULL,'1'),
(359,20,'MANO, MUÑECA Y PIE',400.00,NULL,'1'),
(360,20,'HOMBRO',400.00,NULL,'1'),
(361,20,'MACIZO FACIAL TAC SIN CONTRASTE',400.00,NULL,'1'),
(362,20,'MACIZO FACIAL TAC CON CONTRASTE',500.00,NULL,'1'),
(363,20,'ORBITAS TAC SIN CONTRASTE',330.00,NULL,'1'),
(364,20,'ORBITAS TAC CON CONTRASTE',430.00,NULL,'1'),
(365,20,'CUELLO TAC SIN CONTRASTE',400.00,NULL,'1'),
(366,20,'CUELLO TAC CON CONTRASTE',500.00,NULL,'1'),
(367,20,'SENOS PARANASALES TAC SIN CONTRASTE',400.00,NULL,'1'),
(368,20,'SENOS PARANASALES TAC CON CONTRASTE',500.00,NULL,'1'),
(369,20,'TOBILLO',430.00,NULL,'1'),
(370,20,'RODILLA',430.00,NULL,'1'),
(371,20,'PELVIS OSEA TAC SIN CONTRASTE',400.00,NULL,'1'),
(372,20,'PELVIS OSEA TAC CON CONTRASTE',500.00,NULL,'1'),
(373,20,'OIDO',360.00,NULL,'1'),
(374,20,'RECONSTRUCCION 3D - ADICIONAR ESA CANTIDAD',50.00,NULL,'1'),
(375,20,'INFORME URGENTE - ADICIONAR ESA CANTIDAD',15.00,NULL,'1'),
(376,20,'CD - ADICIONAR ESA CANTIDAD',10.00,NULL,'1'),
(377,20,'PLACA ADICIONAL - ADICIONAR ESA CANTIDAD',30.00,NULL,'1'),
(378,21,'CONSULTA',0.00,NULL,'1'),
(379,21,'LIMPIEZA DENTAL',100.00,NULL,'1'),
(380,21,'FRENILLO',500.00,NULL,'1'),
(381,21,'BLANCAMIENTO',350.00,NULL,'1'),
(382,21,'EXTRACION DE DIENTE',80.00,NULL,'1'),
(383,21,'PULPOTOMIA',100.00,NULL,'1'),
(384,21,'VARNIZ FLORADO - FLUOR',40.00,NULL,'1'),
(385,22,'CONSULTA',40.00,NULL,'1'),
(386,22,'LIMPIEZA DENTAL',100.00,NULL,'1'),
(387,22,'FRENILLO',500.00,NULL,'1'),
(388,22,'BLANCAMIENTO',350.00,NULL,'1'),
(389,22,'EXTRACION DE DIENTE',80.00,NULL,'1'),
(390,22,'PULPOTOMIA',100.00,NULL,'1'),
(391,22,'VARNIZ FLORADO - FLUOR',40.00,NULL,'1'),
(392,1,'CULTIVO DE SECRECION VAGINAL',60.00,'F','1'),
(393,1,'CULTIVO DE SEMEN',70.00,'M','1'),
(394,1,'CULTIVO URETRAL - HOMBRE',60.00,'M','1'),
(395,1,'PSA TOTAL',60.00,'M','1'),
(396,1,'PSA LIBRE',60.00,'M','1'),
(397,2,'ECO 4D',100.00,'F','1'),
(398,2,'ECO DE PROSTATA',60.00,'M','1'),
(399,2,'ECO 5D',100.00,'F','1'),
(400,2,'ECO OBSTÉTRICA',60.00,'F','1'),
(401,2,'ECO MAMAS',60.00,'F','1'),
(402,2,'ECO TRANSVAGINAL(TV)',60.00,'F','1'),
(403,2,'ECO DOPLER OBSTÉTRICA',120.00,'F','1'),
(404,2,'ECO MAMARIA - UNILATERAL',60.00,'F','1'),
(405,2,'ECO MORFOLÓGICA',120.00,'F','1'),
(406,2,'ECO OBSTÉTRICA(PERFIL BIOFÍSICO)',80.00,'F','1'),
(407,2,'ECO VESICAL-PROSTÁTICA',60.00,'M','1'),
(408,2,'ECO PARTES BLANDAS TESTÍCULOS',60.00,'M','1'),
(409,2,'ECO TESTICULOS',60.00,'M','1'),
(410,9,'CONSULTA',40.00,'F','1'),
(411,9,'PAPANICOLAO',40.00,'F','1'),
(412,9,'CULTIVO DE SECRECION VAGINAL',60.00,'F','1'),
(413,9,'BIOPSIA DE CUELLO UTERINO',150.00,'F','1'),
(414,9,'COLCOSPIA',120.00,'F','1');

/*Table structure for table `tratamiento_paciente` */

DROP TABLE IF EXISTS `tratamiento_paciente`;

CREATE TABLE `tratamiento_paciente` (
  `idTratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `idDetalleAtencion` int(11) NOT NULL,
  `medicamento` varchar(100) NOT NULL,
  `presentacion` varchar(100) NOT NULL,
  `cantidad` tinyint(4) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `dias` varchar(50) NOT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`),
  KEY `fk_det_tp` (`idDetalleAtencion`),
  CONSTRAINT `fk_det_tp` FOREIGN KEY (`idDetalleAtencion`) REFERENCES `detalle_atenciones` (`idDetalleAtenciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tratamiento_paciente` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `nivelAcceso` char(1) NOT NULL,
  `fechaInicio` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaFin` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `uk_idpersona_usu` (`idPersona`,`nivelAcceso`),
  CONSTRAINT `fk_usuarios_usu` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUsuario`,`nombreUsuario`,`clave`,`nivelAcceso`,`fechaInicio`,`fechaFin`,`estado`,`idPersona`) values 
(1,'WILLIAMS_CG','$2y$10$qDspv2dEA7.jvQjS5gU12OxTrlopbXEXPParkCzqtZBElDs6GATeC','G','2023-11-20 23:41:16',NULL,'1',1),
(2,'IRENE','$2y$10$itDBHo4bhm/dBjlysZ3T9O3537MXawT0A9g5P0MYgjg/twK6emV0u','A','2023-11-30 18:33:37',NULL,'1',13);

/* Procedure structure for procedure `spu_admision_eliminar_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_admision_eliminar_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_admision_eliminar_usuarios`(
IN _idusuario INT
)
BEGIN 
	UPDATE Usuarios SET
		fechaFin = NOW(),
		estado = '1'
	WHERE idUsuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_admision_listar_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_admision_listar_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_admision_listar_usuarios`(
IN _estado CHAR(1)
)
BEGIN 
	SELECT idusuario, nombreUsuario, nivelAcceso, fechaInicio,
		CONCAT(personas.apellidoPaterno, " ", personas.apellidoPaterno, " ", personas.nombres) AS persona
	FROM usuarios
	INNER JOIN personas ON personas.idPersona = usuarios.idPersona
	WHERE usuarios.estado = _estado
	ORDER BY idusuario DESC; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_agregar_Especialista` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_agregar_Especialista` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_agregar_Especialista`(
IN _idPersona 	INT,
IN _codigo 	VARCHAR(10)
)
BEGIN
	IF _codigo = "" THEN SET _codigo = NULL; END IF;
	INSERT INTO Especialistas(idPersona, codigo) VALUES
	(_idPersona, _codigo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_agregar_Especialista_a_Servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_agregar_Especialista_a_Servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_agregar_Especialista_a_Servicios`(
IN _idEspecialidad 	INT,
IN _idServicio		INT
)
BEGIN
	INSERT INTO Especialistas_Servicios (idEspecialista, idServicio) VALUES
	(_idEspecialidad,_idServicio);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_agregar_Servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_agregar_Servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_agregar_Servicios`(
IN _tipo CHAR(1),
IN _nombreServicio VARCHAR(100)
)
BEGIN
	INSERT INTO Servicios(tipo, nombreServicio) VALUES
	(_tipo, _nombreServicio);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_agregar_Servicio_Detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_agregar_Servicio_Detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_agregar_Servicio_Detalle`(
IN _idServicio 	INT,
IN _descripcion VARCHAR(100),
IN _precio	DECIMAL(7,2),
IN _genero	CHAR(1)
)
BEGIN
	IF _genero = "" THEN SET _genero = NULL; END IF;
	INSERT INTO servicios_detalle(idservicio, descripcion, precio, genero) VALUES
	(_idservicio, _descripcion, _precio, _genero);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_agregar_Usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_agregar_Usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_agregar_Usuarios`(
IN _idPersona		INT,
IN _nombreUsuario 	VARCHAR(200),
IN _clave 		VARCHAR(200),
IN _nivelAcceso		CHAR(1)
)
BEGIN
	INSERT INTO usuarios (idPersona, nombreUsuario, clave, nivelAcceso) VALUES
	(_idPersona, _nombreUsuario, _clave, _nivelAcceso);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_buscar_personas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_buscar_personas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_buscar_personas`(
IN _numeroDocumento VARCHAR(12)
)
BEGIN 
	SELECT `idPersona`, CONCAT(`apellidoPaterno`, 
		' ', `apellidoMaterno`, 
		', ' , nombres) AS 'ApellidosNombres',
		YEAR(CURDATE())-YEAR(fechaNacimiento) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
		TIMESTAMPDIFF(MONTH, fechaNacimiento, CURDATE()) AS 'meses', `genero`
	FROM personas
	WHERE `numeroDocumento` = _numeroDocumento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_cambiar_estado_procedimientos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_cambiar_estado_procedimientos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_cambiar_estado_procedimientos`(
IN _idservicios_detalle INT
)
BEGIN
	UPDATE servicios_detalle	SET
		estado = '0'
		WHERE idservicios_detalle = _idservicios_detalle;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_editar_fecha` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_editar_fecha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_editar_fecha`(
 IN _fechaAtencion DATE,
 IN _idatencion INT
)
BEGIN
	UPDATE atenciones 
	SET fechaAtencion = _fechaAtencion,
	    fechaActualizacion = NOW()
	WHERE idatencion = _idatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_filtro_doctores` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_filtro_doctores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_filtro_doctores`(
	IN _idServicio INT
)
BEGIN
	SELECT idEspecialistasServicios,servicios.nombreservicio,
	CONCAT(personas.apellidoPaterno, ' ',
	personas.nombres) AS 'NombreCompleto'
	FROM especialistas_servicios
	INNER JOIN servicios ON servicios.idservicio = especialistas_servicios.`idServicio`
	INNER JOIN especialistas ON especialistas.idespecialista = especialistas_servicios.`idEspecialista`
	INNER JOIN personas ON personas.`idPersona` = especialistas.`idPersona`
	WHERE especialistas_servicios.`idServicio` =_idservicio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_filtro_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_filtro_servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_filtro_servicios`(
	IN _idServicio INT 
)
BEGIN 
	SELECT Servicios.idServicio, servicios.nombreServicio, servicios_detalle.idservicios_detalle, servicios_detalle.descripcion, servicios_detalle.precio, servicios_detalle.genero
	FROM Servicios
	INNER JOIN servicios_detalle ON servicios_detalle.idServicio = Servicios.idServicio 
	WHERE Servicios.idServicio = _idServicio AND servicios_detalle.estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_listar`()
BEGIN 
	SELECT
		atenciones.idAtencion,
		 atenciones.fechaCreacion AS Dia,
		 PP.nombres,
		 PP.apellidoPaterno,
		 PP.apellidoMaterno,
		 servicios.idServicio,
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total,
		 atenciones.estado
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaCreacion) = CURDATE()-- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY atenciones.`fechaCreacion` ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_listar_especialidades` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_listar_especialidades` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_listar_especialidades`()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "E";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_listar_especialistas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_listar_especialistas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_listar_especialistas`(
IN _estado CHAR(1)
)
BEGIN 
	SELECT  idEspecialista,
	CONCAT(personas.apellidoPaterno, 
	' ', personas.apellidoMaterno, 
	' ' , personas.nombres) AS 'ApellidosNombres'
	FROM especialistas
	INNER JOIN personas ON personas.idPersona = especialistas.idPersona
	WHERE especialistas.estado = _estado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_listar_espera` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_listar_espera` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_listar_espera`()
BEGIN 
	SELECT
		atenciones.idAtencion,
		 atenciones.fechaCreacion AS Dia,
		 PP.nombres,
		 PP.apellidoPaterno,
		 PP.apellidoMaterno,
		 servicios.idServicio,
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total,
		 atenciones.estado,
		 atenciones.numeroAtencion
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaAtencion) = CURDATE()-- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY atenciones.idAtencion DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_listar_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_listar_servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_listar_servicios`()
BEGIN 
	SELECT *
	FROM Servicios;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_obtenerPrecio_genero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_obtenerPrecio_genero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_obtenerPrecio_genero`(
 IN _idservicios_detalle INT
)
BEGIN
	SELECT idservicios_detalle,descripcion, precio, genero
	FROM servicios_detalle
	WHERE idservicios_detalle = _idservicios_detalle;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_registrar`(
IN _turno		CHAR(1),
IN _idusuario 	INT,
IN _idpersona 	INT,
IN _idfamiliar 	INT,
IN _parentesco 	VARCHAR(100),
IN _orden 	INT,
IN _fechaAtencion DATE
)
BEGIN
	-- Para el contador
	DECLARE _fecha DATE;
	DECLARE _contador INT;
	DECLARE _numAtencion VARCHAR(15);
	-- Por si el campo es vacio
	IF _idfamiliar = 0 THEN SET _idfamiliar = NULL; END IF;
	IF _orden = 0 THEN SET _orden = NULL; END IF;
	IF _parentesco = '' THEN SET _parentesco = NULL; END IF;
	-- Autogenerado 
	SET _fecha = CURDATE();
	-- Obtener el contador actual
	SELECT IFNULL(MAX(RIGHT(numeroAtencion, 4)), 0) INTO _contador
	FROM Atenciones
	WHERE DATE(fechaCreacion) = _fecha;
	SET _contador = _contador + 1;

	-- Construir el número de atención basado en la fecha y el contador
	SET _numAtencion = CONCAT(
	DATE_FORMAT(_fecha, '%d%m%Y'),
	LPAD(_contador, 4, '0')
	);
	INSERT INTO Atenciones
	(turno, numeroAtencion, parentesco, OrdenDoctor, idUsuario, idFamiliar, idPersona,fechaAtencion) VALUES
	(_turno, _numAtencion, _parentesco, _orden, _idusuario, _idfamiliar, _idpersona,_fechaAtencion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_registrar_detallesServicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_registrar_detallesServicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_registrar_detallesServicios`(
IN _idservicios_detalle INT
)
BEGIN
    DECLARE _idatencion INT;
    
    SELECT idAtencion INTO _idatencion FROM atenciones ORDER BY idatencion DESC LIMIT 1;
    
    INSERT INTO Detalle_Servicios (idservicios_detalle, idAtencion) VALUES
    (_idservicios_detalle, _idatencion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_atenciones_registrar_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_atenciones_registrar_persona` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_atenciones_registrar_persona`(
	IN _nombres 			VARCHAR(100),
	IN _apellidoPaterno 	VARCHAR(50),
	IN _apellidoMaterno 	VARCHAR(50),
	IN _tipoDocumento		CHAR(1),
	IN _numeroDocumento	VARCHAR(12),
	IN _fechaNacimiento	DATE,
	IN _genero				CHAR(1),
	IN _telefono			CHAR(9),
	IN _distrito 		VARCHAR(100)
)
BEGIN
	IF _fechaNacimiento = "" THEN SET _fechaNacimiento = NULL; END IF;
	IF _genero = "" THEN SET _genero = NULL; END IF;
	IF _telefono = "" THEN SET _telefono = NULL; END IF;
	IF _distrito = "" THEN SET _distrito = NULL; END IF;

	INSERT INTO personas (nombres, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, fechaNacimiento, genero, telefono, distrito) VALUES
	(_nombres,_apellidoPaterno,_apellidoMaterno,_tipoDocumento,_numeroDocumento,_fechaNacimiento,_genero,_telefono, _distrito);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_cambiar_estado_Devolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_cambiar_estado_Devolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_cambiar_estado_Devolucion`(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '2'
	WHERE idAtencion = _idatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_cambiar_estado_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_cambiar_estado_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_cambiar_estado_pagos`(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '1'
		WHERE idAtencion = _idatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_detalle_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_detalle_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_detalle_pagos`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,
	personas.nombres,personas.apellidoMaterno, personas.apellidoPaterno,
	personas.numeroDocumento,
		YEAR(CURDATE())-YEAR(fechaNacimiento) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
		TIMESTAMPDIFF(MONTH, fechaNacimiento, CURDATE()) AS 'meses',
	personas.telefono, atenciones.fechaAtencion
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE Detalle_Servicios.idAtencion = _idatencion
	GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_listar_detalle_servicio` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_listar_detalle_servicio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_listar_detalle_servicio`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion,detalle_servicios.idDetalleServicio,Detalle_Servicios.idservicios_detalle,  servicios.nombreServicio,servicios_detalle.descripcion,
	personas.telefono,servicios_detalle.precio AS 'total'
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE detalle_servicios.idAtencion = _idatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_listar_gastos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_listar_gastos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_listar_gastos`()
BEGIN 
	SELECT idGasto, descripcionGasto, montoGasto, fechaHoraGasto,
	 CONCAT(personas.ApellidoPaterno, ' ', personas.Nombres) AS personas ,
	  Medio_Pagos.nombrePago
	FROM gastos
	INNER JOIN personas ON personas.idPersona = gastos.idPersona
	INNER JOIN Medio_Pagos ON Medio_Pagos.idMedioPago = gastos.idMedioPago
	WHERE DATE(fechaHoraGasto) = CURDATE();
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_listar_metodos_pago` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_listar_metodos_pago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_listar_metodos_pago`()
BEGIN
	SELECT *
	FROM Medio_Pagos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_obtener_datos_devolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_obtener_datos_devolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_obtener_datos_devolucion`(
IN _idAtencion INT
)
BEGIN 
	SELECT	    CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno) AS 'Paciente',
	    per.numeroDocumento,
	    especialidad.nombreServicio AS 'Servicio',
	    SUM(pag.monto) AS 'MontoTotal'
	FROM    pagos pag
	INNER JOIN Atenciones ate ON pag.idAtencion = ate.idAtencion
	INNER JOIN  Personas per ON per.idPersona = ate.idPersona
	LEFT JOIN (
	    SELECT ate.idAtencion,ser.nombreServicio
	    FROM   atenciones ate
	    INNER JOIN Detalle_Servicios det_ser ON ate.idAtencion = det_ser.idAtencion
	    INNER JOIN servicios_detalle ser_det ON det_ser.idservicios_detalle = ser_det.idservicios_detalle
	    INNER JOIN Servicios ser ON ser_det.idservicio = ser.idServicio
	    WHERE ate.idAtencion = _idAtencion
	    GROUP BY ser.nombreServicio   
	) AS especialidad ON ate.idAtencion = especialidad.idAtencion
	WHERE ate.idAtencion = _idAtencion
	GROUP BY ate.idAtencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_obtener_devolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_obtener_devolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_obtener_devolucion`()
BEGIN 
	SELECT SUM(montoDevolucion) AS 'MontoTotal'
	FROM devoluciones;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_obtener_ingresos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_obtener_ingresos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_obtener_ingresos`()
BEGIN 
	SELECT 
    (SELECT IFNULL(SUM(d.montoDevolucion), 0) FROM Devoluciones d WHERE DATE(d.fechaHoraDevolucion) = CURDATE()) AS totalDevo,
    (SELECT IFNULL(SUM(g.montoGasto), 0) FROM Gastos g WHERE DATE(g.fechaHoraGasto) = CURDATE()) AS totalgasto,
    IFNULL(SUM(monto),0) AS totalpagos,
    IFNULL((SUM(monto) - (IFNULL((SELECT SUM(d.montoDevolucion) FROM Devoluciones d WHERE DATE(d.fechaHoraDevolucion) = CURDATE()), 0)
	    + IFNULL((SELECT SUM(g.montoGasto) FROM Gastos g WHERE DATE(g.fechaHoraGasto) = CURDATE()), 0))),0) AS MontoTotal
	FROM Pagos
	WHERE DATE(fechaHoraPago) = CURDATE();
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_registrar_devolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_registrar_devolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_registrar_devolucion`(
IN _motivoDevolucion		VARCHAR(400),
IN _montoDevolucion		DECIMAL(6,2),
IN _idAtencion			INT,
IN _idMedioPago 		INT,
IN _idUsuario	INT
)
BEGIN 
	INSERT INTO Devoluciones(motivoDevolucion, montoDevolucion, idAtencion, idMedioPago,idUsuario) VALUES
	(_motivoDevolucion, _montoDevolucion, _idAtencion, _idMedioPago,_idUsuario);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_registrar_gastos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_registrar_gastos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_registrar_gastos`(
IN _montoGasto		DECIMAL(6,2),
IN _descripcionGasto	VARCHAR(200),
IN _idPersona		INT, 
IN _idMedioPago 	INT,
IN _idUsuario	INT
)
BEGIN
	INSERT INTO gastos(montoGasto, descripcionGasto, idPersona, idMedioPago,idUsuario) VALUES
	(_montoGasto, _descripcionGasto, _idPersona, _idMedioPago,_idUsuario);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_registrar_pago` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_registrar_pago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_registrar_pago`(
IN _idatencion 	INT,
IN _idmediopago	INT,
IN _monto			DECIMAL(7,2),
IN _idUsuario	INT
)
BEGIN 
	INSERT INTO pagos (idatencion, idMedioPago, monto,idUsuario) VALUES
	(_idatencion, _idmediopago, _monto, _idUsuario);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_contadores` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_contadores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_contadores`()
BEGIN 
	SELECT 
	    (SELECT COUNT(p.idPersona) FROM personas p ) AS pacientes,
	    (SELECT COUNT(s.idServicio) FROM Servicios s  WHERE s.tipo = 'E') AS especialidades,
	    (SELECT COUNT(s.idServicio) FROM Servicios s  WHERE s.tipo = 'S') AS servicios,
	    COUNT(e.idEspecialista) AS medicos, 
	    (SELECT COUNT(a.idAtencion) FROM atenciones a) AS atenciones  
	FROM Especialistas e;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_doctores_buscar_enfermedad` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_doctores_buscar_enfermedad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_doctores_buscar_enfermedad`(
IN _codigoCie_10 VARCHAR(10)
)
BEGIN
	SELECT idEnfermedad,codigoCie_10, descripcion FROM enfermedades
	WHERE Enfermedades.codigoCie_10 = _codigoCie_10;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_DOCTORES_CAMBIAR_ESTADO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_DOCTORES_CAMBIAR_ESTADO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_DOCTORES_CAMBIAR_ESTADO`(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		atendido = '1'
		WHERE idAtencion = _idatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_doctores_detalle_tratamiento` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_doctores_detalle_tratamiento` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_doctores_detalle_tratamiento`(
IN _idDetalleAtencion	INT,
IN _medicamento		VARCHAR(100),
IN _presentacion	VARCHAR(100),
IN _cantidad		TINYINT,
IN _dosis		VARCHAR(100),
IN _dias		VARCHAR(50)
)
BEGIN
	INSERT INTO Tratamiento_paciente (idDetalleAtencion, medicamento, presentacion, cantidad, dosis, dias)VALUES
	(_idDetalleAtencion, _medicamento, _presentacion, _cantidad, _dosis, _dias);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_DOCTORES_LISTAR` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_DOCTORES_LISTAR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_DOCTORES_LISTAR`(
)
BEGIN
	SELECT detAte.`idDetalleAtenciones`,
		 ate.numeroAtencion,
		CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'ApellidosNombres'
	FROM detalle_atenciones detAte
	INNER JOIN atenciones ate ON ate.idAtencion = detAte.idAtencion
	INNER JOIN personas per ON per.idPersona = ate.idPersona
	LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
	INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
	WHERE ate.estado = 1 AND ser.tipo = 'E'--  AND ser.idServicio = 21
	AND ate.fechaAtencion = CURDATE()
	ORDER BY  ate.idAtencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_DOCTORES_LISTAR_SERVICIOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_DOCTORES_LISTAR_SERVICIOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_DOCTORES_LISTAR_SERVICIOS`(
)
BEGIN
	SELECT  ate.idAtencion,ate.numeroAtencion,
		CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'ApellidosNombres', ate.atendido
	FROM atenciones ate
	INNER JOIN personas per ON per.idPersona = ate.idPersona
	LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
	INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
	WHERE ate.estado = 1  AND ser.tipo = 'S'
	AND ate.fechaAtencion = CURDATE()
	ORDER BY ate.`estado`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_DOCTORES_OBTENER_DATOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_DOCTORES_OBTENER_DATOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_DOCTORES_OBTENER_DATOS`(
IN _idDetalleAtenciones INT
)
BEGIN
	SELECT detAte.`idDetalleAtenciones`,
	CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'ApellidosNombres'
	FROM detalle_atenciones detAte
	INNER JOIN atenciones ate ON ate.idAtencion = detAte.idAtencion
	INNER JOIN personas per ON per.idPersona = ate.idPersona
	LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
	INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
	WHERE detAte.idDetalleAtenciones = _idDetalleAtenciones;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA`(
IN _idDetalleatencion 	INT,
IN _inicio		VARCHAR(2000),
IN _curso		VARCHAR(2000),
IN _relato		VARCHAR(2000),
IN _procedimiento 	VARCHAR(200),
IN _observaciones 	VARCHAR(200),
IN _examenGeneral 	VARCHAR(2000),
IN _frecuencia 		CHAR(1)
)
BEGIN
	UPDATE Detalle_Atenciones SET
		inicio = _inicio,
		curso = _curso,
		relato = _relato,
		procedimiento = _procedimiento,
		observaciones = _observaciones,
		examenGeneral = _examenGeneral,
		frecuencia = _frecuencia,
		fechaActualizacion = NOW()
	WHERE idDetalleAtenciones = _idDetalleatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_doctor_agregar_enfermedad` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_doctor_agregar_enfermedad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_doctor_agregar_enfermedad`(
IN _idEnfermedad INT,
IN _idDetalleAtencion INT
)
BEGIN
	INSERT INTO Enfermedad_Pacientes(idEnfermedad, idDetalleAtencion) VALUES
	(_idEnfermedad, _idDetalleAtencion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_servicios`()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "S";
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LOGIN_GetData` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LOGIN_GetData` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LOGIN_GetData`(
	IN _idUsuario INT
)
BEGIN
	SELECT 	Usuarios.idUsuario, 
		usuarios.nombreUsuario, 
		usuarios.clave, idPersona
	FROM Usuarios
	WHERE nombreUsuario = _idUsuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LOGIN_USUARIOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LOGIN_USUARIOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LOGIN_USUARIOS`(
	IN _nombreUsuario VARCHAR(50)
)
BEGIN
	SELECT 	Usuarios.idUsuario, 
		usuarios.nombreUsuario, 
		usuarios.clave,
		CONCAT(personas.apellidoPaterno,' ', personas.apellidoMaterno,' ' , personas.nombres) AS 'ApellidosNombres',
		usuarios.`nivelAcceso`
	FROM Usuarios
	INNER JOIN Personas ON personas.idPersona = usuarios.idPersona
	WHERE nombreUsuario = _nombreUsuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_monto_medioPago` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_monto_medioPago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_monto_medioPago`(IN _idmedio INT)
BEGIN 
	SELECT IFNULL(SUM(p.monto), 0) AS TotalPago, 
	(SELECT IFNULL(SUM(montoDevolucion),0) FROM devoluciones WHERE DATE(fechaHoraDevolucion) = CURDATE() AND idMedioPago = _idmedio) AS totalDevo, 
	(IFNULL(SUM(p.monto), 0))-((SELECT IFNULL(SUM(montoDevolucion),0) FROM devoluciones WHERE DATE(fechaHoraDevolucion) = CURDATE() AND idMedioPago = _idmedio) + (SELECT IFNULL(SUM(montoGasto),0) FROM gastos WHERE DATE(fechaHoraGasto) = CURDATE() AND idMedioPago = _idmedio)) AS total
	FROM pagos p 
	INNER JOIN Medio_Pagos med ON p.idMedioPago = med.idMedioPago
	WHERE DATE(p.fechaHoraPago) = CURDATE() AND p.idMedioPago = _idmedio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtenerDatos_atencion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtenerDatos_atencion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtenerDatos_atencion`(
	IN _idatencion INT
)
BEGIN 
	SELECT Detalle_Servicios.idAtencion,
				PP.nombres,PP.apellidoPaterno, PP.apellidoMaterno, PP.numeroDocumento,
				servicios.nombreServicio,
				SUM(servicios_detalle.precio) AS 'Total', atenciones.`fechaAtencion`
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas PP ON  atenciones.idPersona  = PP.idPersona
	WHERE Detalle_Servicios.idAtencion = _idatencion AND  atenciones.estado = '0'
	GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, PP.nombres,PP.numeroDocumento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_POS` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_POS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_POS`(in _fecha date)
begin
	select  date(pagos.`fechaHoraPago`) as fecha, med.nombrePago,per.numeroDocumento ,CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'nombreCompleto' , pagos.`monto`
	from pagos
	inner join atenciones ate on ate.idAtencion = pagos.`idAtencion`
	inner join personas per on per.idPersona = ate.idPersona
	inner join Detalle_Servicios det on det.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle setDet ON setDet.idservicios_detalle = det.idservicios_detalle
	INNER JOIN servicios ser ON ser.idServicio = setDet.idservicio
	INNER JOIN Medio_Pagos med ON pagos.idMedioPago = med.idMedioPago
	where med.nombrePago = "POS" and DATE(pagos.`fechaHoraPago`) = _fecha;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_servicioMensual` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_servicioMensual` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_servicioMensual`(IN _idServicio INT, IN _mes INT)
BEGIN 
	SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
	personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
	FROM Detalle_Servicios
	INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
	INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = _idServicio AND MONTH(atenciones.`fechaAtencion`) = _mes;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_servicioQuincenal` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_servicioQuincenal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_servicioQuincenal`(IN _idServicio INT)
BEGIN 
	SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
	personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
	FROM Detalle_Servicios
	INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
	INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = _idServicio AND (DAYOFMONTH(atenciones.`fechaAtencion`) BETWEEN 1 AND 15
	    OR (DAYOFMONTH(atenciones.`fechaAtencion`) BETWEEN 16 AND 31 AND DAYOFMONTH(CURDATE()) <= 15));
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_reporte_servicioSemanal` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_reporte_servicioSemanal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_reporte_servicioSemanal`(IN _idServicio INT)
BEGIN 
	SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
	personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
	FROM Detalle_Servicios
	INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
	INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = _idServicio AND WEEK(atenciones.`fechaAtencion`) = WEEK(CURDATE());
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_ticket_1` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_ticket_1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_ticket_1`(IN _idAtencion INT)
BEGIN 
	SELECT ate.numeroAtencion, pag.fechaHoraPago,
	UPPER(CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno)) AS 'Paciente',
	per.numeroDocumento,per.`telefono`, YEAR(CURDATE())-YEAR(per.fechaNacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(per.fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
	UPPER(especialidad.nombreServicio) AS 'Servicio',
	SUM(pag.monto) AS 'MontoTotal',TRUNCATE(SUM(pag.monto)*0.18,2) AS 'IGV' , TRUNCATE(SUM(pag.monto)-SUM(pag.monto)*0.18,2)   AS 'subtotal'
	FROM    pagos pag
	INNER JOIN Atenciones ate ON pag.idAtencion = ate.idAtencion
	INNER JOIN  Personas per ON per.idPersona = ate.idPersona
	LEFT JOIN (
		 SELECT ate.idAtencion,ser.nombreServicio
		 FROM   atenciones ate
		 INNER JOIN Detalle_Servicios det_ser ON ate.idAtencion = det_ser.idAtencion
		 INNER JOIN servicios_detalle ser_det ON det_ser.idservicios_detalle = ser_det.idservicios_detalle
		 INNER JOIN Servicios ser ON ser_det.idservicio = ser.idServicio
		 WHERE ate.idAtencion = _idAtencion
		 GROUP BY ser.nombreServicio   
	) AS especialidad ON ate.idAtencion = especialidad.idAtencion
	WHERE ate.idAtencion = _idAtencion
	GROUP BY ate.idAtencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_ticket_2` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_ticket_2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_ticket_2`(IN _idAtencion INT)
BEGIN 
	SELECT ate.idAtencion, pag.`idMedioPago`,med.nombrePago, pag.`monto` 
	FROM    pagos pag
	INNER JOIN Atenciones ate ON pag.idAtencion = ate.idAtencion
	INNER JOIN Medio_Pagos med ON pag.idMedioPago = med.idMedioPago
	WHERE ate.idAtencion = _idAtencion
	GROUP BY pag.`idMedioPago`;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_ticket_3` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_ticket_3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_ticket_3`(IN _idAtencion INT)
BEGIN 
	SELECT Detalle_Servicios.idAtencion,detalle_servicios.idDetalleServicio,Detalle_Servicios.idservicios_detalle,  servicios.nombreServicio,servicios_detalle.descripcion,
	personas.telefono,servicios_detalle.precio AS 'total'
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE detalle_servicios.idAtencion =_idAtencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_agregar_alergias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_agregar_alergias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_agregar_alergias`(
IN _idHistoriaClinica INT,
IN _idAlergia INT
)
BEGIN 
	INSERT INTO Detalle_Alergias(idHistoriaClinica, idAlergia) VALUES
	(_idHistoriaClinica, _idAlergia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_agregar_triaje` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_agregar_triaje` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_agregar_triaje`(
IN _idatencion 	INT,
IN _idhistoria 	INT,
IN _peso 	DECIMAL(5,2),
IN _talla	INT,
IN _frecuenciaCardiaca 		VARCHAR(5),
IN _frecuenciaRespiratoria 	VARCHAR(5),
IN _presionArterial 		VARCHAR(10),
IN _temperatura			DECIMAL(4,1),
IN _saturacionOxigeno		TINYINT,
IN _idusuario INT
)
BEGIN 
	INSERT INTO Detalle_Atenciones (idAtencion, idHistoria, peso, talla, frecuenciaCardiaca, frecuenciaRespiratoria, presionArterial, temperatura, saturacionOxigeno, idUsuario) VALUES
	(_idatencion, _idhistoria, _peso, _talla, _frecuenciaCardiaca, _frecuenciaRespiratoria, _presionArterial, _temperatura, _saturacionOxigeno, _idusuario);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_Atenciones_dni` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_Atenciones_dni` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_Atenciones_dni`(IN _numeroDocumento VARCHAR(12))
BEGIN
	SELECT atenciones.idAtencion, servicios.nombreServicio, atenciones.fechaAtencion AS 'dia'
	FROM atenciones
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE personas.numeroDocumento = _numeroDocumento AND atenciones.estado = '1' AND servicios.tipo = 'E' 
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_atraparAlergias_xid` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_atraparAlergias_xid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_atraparAlergias_xid`(
IN _idHistoria INT
)
BEGIN
	SELECT idDetalleAlergia, idHistoriaClinica,
	alergias.alergia
	FROM detalle_alergias
	INNER JOIN alergias ON alergias.idAlergia = detalle_alergias.idAlergia
	WHERE idHistoriaClinica = _idHistoria;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_buscar_historias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_buscar_historias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_buscar_historias`(
IN _numeroDocumento VARCHAR(12)
)
BEGIN
	SELECT atenciones.idAtencion, personas.numeroDocumento,atenciones.`idPersona`,
	    CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'ApellidosNombres',
	    servicios.nombreServicio, atenciones.fechaAtencion AS 'dia',
	    IF(historias_clinicas.idHistoriaClinica IS NOT NULL, 'si', 'no') AS 'historiaClinica', historias_clinicas.idHistoriaClinica
	FROM atenciones
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	LEFT JOIN historias_clinicas ON historias_clinicas.idPersona = personas.idPersona
	LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE personas.numeroDocumento = _numeroDocumento AND atenciones.estado = '1' AND servicios.tipo = 'E' AND atenciones.fechaAtencion = CURDATE()
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_historia` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_historia` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_historia`()
BEGIN
	SELECT atenciones.idAtencion, personas.numeroDocumento, atenciones.`idPersona`,
	    CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'ApellidosNombres',
	    servicios.nombreServicio, atenciones.fechaAtencion AS 'dia', historias_clinicas.idHistoriaClinica, detalle_atenciones.idDetalleAtenciones
	FROM atenciones
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	LEFT JOIN historias_clinicas ON historias_clinicas.idPersona = personas.idPersona
	LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN detalle_atenciones ON detalle_atenciones.idAtencion = atenciones.idAtencion
	WHERE atenciones.estado = '1' AND servicios.tipo = 'E' AND atenciones.fechaAtencion = CURDATE() AND historias_clinicas.idHistoriaClinica IS NOT NULL AND detalle_atenciones.idDetalleAtenciones IS NULL  
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_listar_alergias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_listar_alergias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_listar_alergias`()
BEGIN 
	SELECT * FROM alergias;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_listar_hecho` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_listar_hecho` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_listar_hecho`()
BEGIN
	SELECT 
		idDetalleAtenciones, idHistoriaClinica,
		CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS paciente,
		servicios.nombreServicio
		FROM detalle_atenciones
		INNER JOIN atenciones ON atenciones.idAtencion = detalle_atenciones.idAtencion
		INNER JOIN Historias_Clinicas ON Historias_Clinicas.idHistoriaClinica = detalle_atenciones.idHistoria
		INNER JOIN personas ON personas.idPersona = Historias_Clinicas.idPersona
		LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
		INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
		INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
		WHERE DATE(detalle_atenciones.fechaCreacion) = CURDATE() AND servicios.tipo = 'E'
		ORDER BY idDetalleAtenciones DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_listar_historias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_listar_historias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_listar_historias`()
BEGIN
	SELECT historias_clinicas.`idHistoriaClinica`,personas.`numeroDocumento`, personas.`nombres`, personas.`apellidoPaterno`, personas.`apellidoMaterno`
	FROM historias_clinicas
	INNER JOIN personas ON personas.`idPersona` = historias_clinicas.`idPersona`
	ORDER BY historias_clinicas.`idHistoriaClinica` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_nohay_historia` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_nohay_historia` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_nohay_historia`()
BEGIN
	SELECT atenciones.idAtencion, personas.numeroDocumento, atenciones.`idPersona`, personas.`numeroDocumento`,
	    CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'ApellidosNombres',
	    servicios.nombreServicio, atenciones.fechaAtencion AS 'dia', historias_clinicas.idHistoriaClinica, detalle_atenciones.idDetalleAtenciones
	FROM atenciones
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	LEFT JOIN historias_clinicas ON historias_clinicas.idPersona = personas.idPersona
	LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN detalle_atenciones ON detalle_atenciones.idAtencion = atenciones.idAtencion
	WHERE atenciones.estado = '1' AND servicios.tipo = 'E' AND atenciones.fechaAtencion = CURDATE() AND historias_clinicas.idHistoriaClinica IS NULL 
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_Nueva_historiaClinica` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_Nueva_historiaClinica` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_Nueva_historiaClinica`(
IN _idpersona 					INT,
IN _idusuario 					INT, 
IN _antecedentePersonal		VARCHAR(199),
IN _antecedenteFamiliar		VARCHAR(199),
IN _antecedenteQuirurgico 	VARCHAR(199),
IN _antecedenteOtro			VARCHAR(199)
)
BEGIN 
	IF _antecedentePersonal = "" THEN SET _antecedentePersonal = NULL; END IF;
	IF _antecedenteFamiliar = "" THEN SET _antecedenteFamiliar = NULL; END IF;
	IF _antecedenteQuirurgico = "" THEN SET _antecedenteQuirurgico = NULL; END IF;
	IF _antecedenteOtro = "" THEN SET _antecedenteOtro = NULL; END IF;
	
	INSERT INTO Historias_Clinicas (idPersona, idUsuario, antecedentePersonal, antecedenteFamiliar, antecedenteQuirurgico, antecedenteOtro)VALUES
	(_idpersona, _idusuario, _antecedentePersonal, _antecedenteFamiliar, _antecedenteQuirurgico, _antecedenteOtro);
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_obtenerDatos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_obtenerDatos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_obtenerDatos`(IN _idAtencion VARCHAR(12))
BEGIN
	SELECT atenciones.idAtencion, personas.numeroDocumento, atenciones.`idPersona`,
	    CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'ApellidosNombres',
	    servicios.nombreServicio, atenciones.fechaAtencion AS 'dia', historias_clinicas.idHistoriaClinica
	FROM atenciones
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	LEFT JOIN historias_clinicas ON historias_clinicas.idPersona = personas.idPersona
	LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE atenciones.`idAtencion` = _idAtencion AND atenciones.estado = '1' AND servicios.tipo = 'E' AND atenciones.fechaAtencion = CURDATE() AND historias_clinicas.idHistoriaClinica IS NOT NULL
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_registrar_alergia` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_registrar_alergia` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_registrar_alergia`(
IN _alergia VARCHAR(100)
)
BEGIN
	INSERT INTO alergias (alergia) VALUES
	(_alergia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_triaje_reporte` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_reporte` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_reporte`(
IN _iddetalle INT
)
BEGIN
	SELECT 
		idDetalleAtenciones,
		CONCAT(fam.apellidoPaterno, ' ', fam.apellidoMaterno, ' ', fam.nombres) AS familiar, atenciones.parentesco, fam.numeroDocumento AS dniFam,
		peso, talla, frecuenciaCardiaca, FrecuenciaRespiratoria, PresionArterial, temperatura, SaturacionOxigeno,
		Historias_Clinicas.antecedentePersonal, Historias_Clinicas.antecedenteFamiliar, Historias_Clinicas.antecedenteQuirurgico, Historias_Clinicas.antecedenteOtro,
		CONCAT(pac.apellidoPaterno, ' ', pac.apellidoMaterno, ' ', pac.nombres) AS paciente,
		pac.numeroDocumento,
		pac.genero,
		servicios.nombreServicio,
		YEAR(CURDATE())-YEAR(pac.fechaNacimiento) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(pac.fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
		TIMESTAMPDIFF(MONTH, pac.fechaNacimiento, CURDATE()) AS 'meses',
		CURDATE() AS fecha
		FROM detalle_atenciones
		INNER JOIN atenciones ON atenciones.idAtencion = detalle_atenciones.idAtencion
		INNER JOIN Historias_Clinicas ON Historias_Clinicas.idHistoriaClinica = detalle_atenciones.idHistoria
		INNER JOIN personas pac ON pac.idPersona = Historias_Clinicas.idPersona
		LEFT JOIN personas fam ON fam.idPersona = atenciones.idfamiliar
		LEFT JOIN Detalle_Alergias ON Detalle_Alergias.idHistoriaClinica = Historias_Clinicas.idHistoriaClinica
		LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
		INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
		INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
		WHERE DATE(detalle_atenciones.fechaCreacion) = CURDATE()
		AND idDetalleAtenciones = _iddetalle
		GROUP BY idDetalleAtenciones;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
