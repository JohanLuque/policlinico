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
  PRIMARY KEY (`idAtencion`),
  KEY `fk_usuario_ate` (`idUsuario`),
  KEY `fk_fami_ate` (`idFamiliar`),
  KEY `fk_per_ate` (`idPersona`),
  CONSTRAINT `fk_fami_ate` FOREIGN KEY (`idFamiliar`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_per_ate` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_usuario_ate` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

/*Data for the table `atenciones` */

insert  into `atenciones`(`idAtencion`,`turno`,`numeroAtencion`,`fechaCreacion`,`fechaActualizacion`,`parentesco`,`idUsuario`,`ordenDoctor`,`idFamiliar`,`idPersona`,`fechaAtencion`,`estado`) values 
(1,'T','081120230001','2023-11-08 00:06:17','2023-11-08 00:06:28',NULL,1,NULL,NULL,22,'2023-11-08','1'),
(2,'T','081120230002','2023-11-08 00:35:49','2023-11-08 00:35:59',NULL,1,NULL,NULL,27,'2023-11-08','1'),
(3,'T','081120230003','2023-11-08 01:19:15','2023-11-08 01:21:03',NULL,1,NULL,NULL,28,'2023-11-08','1'),
(4,'T','081120230004','2023-11-08 01:20:51','2023-11-08 01:21:15',NULL,1,NULL,NULL,27,'2023-11-08','1'),
(5,'T','081120230005','2023-11-08 16:03:14','2023-11-08 16:03:26',NULL,1,NULL,NULL,29,'2023-11-08','1'),
(6,'T','081120230006','2023-11-08 16:09:04','2023-11-08 16:09:15',NULL,1,NULL,NULL,30,'2023-11-08','1'),
(7,'T','081120230007','2023-11-08 16:11:18','2023-11-08 16:11:43',NULL,1,NULL,NULL,31,'2023-11-08','1'),
(8,'T','081120230008','2023-11-08 16:17:30','2023-11-08 16:17:45',NULL,1,NULL,NULL,32,'2023-11-08','1'),
(9,'T','081120230009','2023-11-08 16:21:47','2023-11-08 16:22:05',NULL,1,NULL,NULL,33,'2023-11-08','1'),
(10,'T','081120230010','2023-11-08 16:32:42','2023-11-08 21:08:55',NULL,1,NULL,NULL,22,'2023-11-08','1'),
(11,'T','091120230001','2023-11-09 00:10:52','2023-11-09 00:11:10',NULL,1,NULL,NULL,22,'2023-11-09','2'),
(12,'T','091120230002','2023-11-09 00:22:58','2023-11-09 00:23:10',NULL,1,NULL,NULL,22,'2023-11-09','1'),
(13,'T','091120230003','2023-11-09 21:58:28',NULL,NULL,1,NULL,NULL,22,'2023-11-09','0'),
(14,'T','101120230001','2023-11-10 01:39:33','2023-11-10 01:39:48',NULL,1,NULL,NULL,22,'2023-11-10','1'),
(15,'T','111120230001','2023-11-11 22:31:22','2023-11-11 22:36:03',NULL,1,NULL,NULL,22,'2023-11-11','1'),
(16,'T','111120230002','2023-11-11 22:31:52','2023-11-11 22:36:11',NULL,1,NULL,NULL,29,'2023-11-11','1'),
(17,'T','111120230003','2023-11-11 22:32:44','2023-11-11 22:35:39',NULL,1,NULL,NULL,30,'2023-11-11','1'),
(18,'T','111120230004','2023-11-11 22:33:29','2023-11-11 22:35:47',NULL,1,NULL,NULL,27,'2023-11-11','1'),
(19,'T','111120230005','2023-11-11 22:35:22','2023-11-11 22:35:56',NULL,1,NULL,NULL,34,'2023-11-11','1'),
(20,'T','111120230006','2023-11-11 22:37:05','2023-11-11 22:57:32',NULL,1,NULL,NULL,22,'2023-11-11','2'),
(21,'T','121120230001','2023-11-12 00:18:16','2023-11-12 20:25:55',NULL,1,NULL,NULL,27,'2023-11-12','2'),
(22,'T','121120230002','2023-11-12 00:49:01','2023-11-12 20:26:42',NULL,1,NULL,NULL,22,'2023-11-12','1'),
(23,'T','121120230003','2023-11-12 00:52:45','2023-11-12 20:26:30',NULL,1,NULL,NULL,27,'2023-11-12','1'),
(24,'T','131120230001','2023-11-13 00:12:11','2023-11-13 00:17:44',NULL,1,NULL,NULL,35,'2023-11-13','1'),
(25,'T','131120230002','2023-11-13 00:14:40','2023-11-13 00:17:55',NULL,1,NULL,NULL,36,'2023-11-13','1'),
(26,'T','131120230003','2023-11-13 00:16:58','2023-11-13 00:17:27',NULL,1,NULL,NULL,37,'2023-11-13','1'),
(27,'T','131120230004','2023-11-13 00:18:26','2023-11-13 00:18:56',NULL,1,NULL,NULL,22,'2023-11-13','1'),
(28,'T','161120230001','2023-11-16 15:29:53','2023-11-16 15:30:05',NULL,1,NULL,NULL,22,'2023-11-16','1'),
(29,'T','171120230001','2023-11-17 00:24:16','2023-11-17 00:24:27',NULL,1,NULL,NULL,22,'2023-11-17','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_alergias` */

insert  into `detalle_alergias`(`idDetalleAlergia`,`idAlergia`,`idHistoriaClinica`) values 
(4,1,11),
(2,4,7),
(1,5,7),
(3,5,8),
(5,6,11),
(6,7,12);

/*Table structure for table `detalle_atenciones` */

DROP TABLE IF EXISTS `detalle_atenciones`;

CREATE TABLE `detalle_atenciones` (
  `idDetalleAtenciones` int(11) NOT NULL AUTO_INCREMENT,
  `peso` decimal(5,2) NOT NULL,
  `talla` decimal(4,2) NOT NULL,
  `frecuenciaCardiaca` varchar(5) NOT NULL,
  `frecuenciaRespiratoria` varchar(5) NOT NULL,
  `presionArterial` varchar(10) NOT NULL,
  `temperatura` decimal(4,2) NOT NULL,
  `saturacionOxigeno` tinyint(4) NOT NULL,
  `examenGeneral` varchar(2000) DEFAULT NULL,
  `frecuencia` char(1) DEFAULT 'p',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_atenciones` */

insert  into `detalle_atenciones`(`idDetalleAtenciones`,`peso`,`talla`,`frecuenciaCardiaca`,`frecuenciaRespiratoria`,`presionArterial`,`temperatura`,`saturacionOxigeno`,`examenGeneral`,`frecuencia`,`inicio`,`curso`,`relato`,`procedimiento`,`observaciones`,`fechaCreacion`,`fechaActualizacion`,`idHistoria`,`idAtencion`,`idUsuario`) values 
(1,40.00,1.00,'60x1','20x1','120/80',37.00,95,NULL,'p',NULL,NULL,NULL,NULL,NULL,'2023-11-08 01:23:20',NULL,5,4,1),
(2,50.00,2.00,'60x1','60x1','120/80',39.00,100,NULL,'p',NULL,NULL,NULL,NULL,NULL,'2023-11-08 01:25:01',NULL,4,3,1),
(3,48.00,2.00,'120x1','120x1','140/80',36.00,100,NULL,'p',NULL,NULL,NULL,NULL,NULL,'2023-11-13 11:15:09',NULL,12,25,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_servicios` */

insert  into `detalle_servicios`(`idDetalleServicio`,`idservicios_detalle`,`idAtencion`) values 
(1,54,1),
(2,89,1),
(3,30,2),
(4,89,2),
(5,51,2),
(6,41,2),
(7,8,2),
(8,271,3),
(9,266,4),
(10,276,5),
(11,267,6),
(12,266,7),
(13,267,8),
(14,267,9),
(15,89,10),
(16,43,10),
(17,33,10),
(18,41,10),
(19,8,10),
(20,267,11),
(21,268,12),
(22,267,12),
(23,146,13),
(24,267,14),
(25,267,15),
(26,145,16),
(27,266,17),
(28,245,18),
(29,267,19),
(30,2,20),
(31,266,21),
(32,267,22),
(33,1,23),
(34,173,24),
(35,266,25),
(36,36,26),
(37,116,26),
(38,34,26),
(39,144,27),
(40,143,27),
(41,130,28),
(42,26,28),
(43,139,28),
(44,267,29);

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
  PRIMARY KEY (`idDevolucion`),
  KEY `fk_idate_dev` (`idAtencion`),
  KEY `fk_idmep_dev` (`idMedioPago`),
  CONSTRAINT `fk_idate_dev` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idmep_dev` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `devoluciones` */

insert  into `devoluciones`(`idDevolucion`,`montoDevolucion`,`estado`,`motivoDevolucion`,`fechaHoraDevolucion`,`idAtencion`,`idMedioPago`) values 
(1,50.00,'0','Emergencia','2023-11-09 00:11:10',11,3),
(2,20.00,'0','Urgencia','2023-11-11 22:57:32',20,3),
(3,10.00,'0','Urgencia','2023-11-11 22:57:32',20,2),
(4,10.00,'0','Urgencia','2023-11-11 22:57:32',20,4),
(5,10.00,'0','Urgencia','2023-11-11 22:57:32',20,1),
(6,10.00,'0','Urgencia','2023-11-11 22:57:32',20,5),
(7,50.00,'0','','2023-11-12 20:25:55',21,3);

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
(1,'A00-B99','Ciertas enfermedades infecciosas y parasitarias','2023-11-07 23:59:19',NULL),
(2,'C00-D48','Neoplasias','2023-11-07 23:59:19',NULL),
(3,'D50-D89','Enfermedades de la sangre y de los órganos hematopoyéticos y otros trastornos que afectan el mecanismo de la inmunidad','2023-11-07 23:59:19',NULL),
(4,'E00-E90','Enfermedades endocrinas, nutricionales y metabólicas','2023-11-07 23:59:19',NULL),
(5,'F00-F99','Trastornos mentales y del comportamiento','2023-11-07 23:59:19',NULL),
(6,'F00-F100','Enfermedades del sistema nervioso','2023-11-07 23:59:19',NULL);

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
(1,'1','1',4),
(2,NULL,'1',5),
(3,'3','1',6);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `especialistas_servicios` */

insert  into `especialistas_servicios`(`idEspecialistasServicios`,`idEspecialista`,`idServicio`) values 
(1,1,1),
(2,2,2),
(3,1,3),
(4,2,9),
(5,3,10),
(6,1,11);

/*Table structure for table `gastos` */

DROP TABLE IF EXISTS `gastos`;

CREATE TABLE `gastos` (
  `idGasto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionGasto` varchar(200) NOT NULL,
  `montoGasto` decimal(6,2) NOT NULL,
  `fechaHoraGasto` datetime NOT NULL DEFAULT current_timestamp(),
  `idPersona` int(11) NOT NULL,
  `idMedioPago` int(11) NOT NULL,
  PRIMARY KEY (`idGasto`),
  KEY `fk_per_gas` (`idPersona`),
  KEY `fk_idmep_gas` (`idMedioPago`),
  CONSTRAINT `fk_idmep_gas` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`),
  CONSTRAINT `fk_per_gas` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `gastos` */

insert  into `gastos`(`idGasto`,`descripcionGasto`,`montoGasto`,`fechaHoraGasto`,`idPersona`,`idMedioPago`) values 
(1,'mascarilla',20.00,'2023-11-08 23:35:06',22,3),
(2,'inyecciones',5.00,'2023-11-08 23:36:24',28,3),
(3,'Materiales para tópico en farmacia\n',50.00,'2023-11-08 23:51:22',27,3),
(4,'mascarillas',30.00,'2023-11-09 00:16:31',28,3),
(5,'hojas',10.00,'2023-11-09 00:25:13',22,3),
(6,'auja',5.00,'2023-11-09 00:26:32',28,3),
(7,'efe',25.00,'2023-11-10 01:54:51',28,3),
(8,'mascarilla',10.00,'2023-11-12 20:43:02',28,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `historias_clinicas` */

insert  into `historias_clinicas`(`idHistoriaClinica`,`antecedentePersonal`,`antecedenteFamiliar`,`antecedenteQuirurgico`,`antecedenteOtro`,`idUsuario`,`idPersona`) values 
(1,NULL,NULL,NULL,NULL,1,22),
(2,NULL,NULL,NULL,NULL,1,23),
(3,NULL,NULL,NULL,NULL,1,24),
(4,NULL,NULL,NULL,NULL,1,28),
(5,NULL,NULL,NULL,NULL,1,27),
(6,NULL,NULL,NULL,NULL,1,29),
(7,NULL,NULL,NULL,NULL,1,30),
(8,NULL,NULL,NULL,NULL,1,31),
(10,NULL,NULL,NULL,NULL,1,32),
(11,NULL,NULL,NULL,NULL,1,33),
(12,NULL,NULL,NULL,NULL,1,36);

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
  PRIMARY KEY (`idPago`),
  KEY `fk_idate_pag` (`idAtencion`),
  KEY `fk_idmep_pag` (`idMedioPago`),
  CONSTRAINT `fk_idate_pag` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idmep_pag` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pagos` */

insert  into `pagos`(`idPago`,`monto`,`estado`,`fechaHoraPago`,`idAtencion`,`idMedioPago`) values 
(1,40.00,'0','2023-11-08 00:06:28',1,4),
(2,70.00,'0','2023-11-08 00:35:59',2,3),
(3,30.00,'0','2023-11-08 01:21:03',3,4),
(4,30.00,'0','2023-11-08 01:21:15',4,3),
(5,20.00,'0','2023-11-08 01:21:15',4,4),
(6,50.00,'0','2023-11-08 16:03:26',5,3),
(7,50.00,'0','2023-11-08 16:09:15',6,4),
(8,50.00,'0','2023-11-08 16:11:43',7,4),
(9,50.00,'0','2023-11-08 16:17:45',8,5),
(10,50.00,'0','2023-11-08 16:22:05',9,5),
(11,120.00,'0','2023-11-08 21:08:55',10,3),
(12,50.00,'0','2023-11-09 00:11:00',11,3),
(13,120.00,'0','2023-11-09 00:23:10',12,3),
(14,50.00,'0','2023-11-10 01:39:48',14,3),
(15,50.00,'0','2023-11-11 22:35:39',17,3),
(16,20.00,'0','2023-11-11 22:35:47',18,4),
(17,50.00,'0','2023-11-11 22:35:56',19,5),
(18,50.00,'0','2023-11-11 22:36:03',15,2),
(19,60.00,'0','2023-11-11 22:36:11',16,1),
(20,20.00,'0','2023-11-11 22:37:49',20,3),
(21,10.00,'0','2023-11-11 22:37:49',20,2),
(22,10.00,'0','2023-11-11 22:37:49',20,4),
(23,10.00,'0','2023-11-11 22:37:49',20,1),
(24,10.00,'0','2023-11-11 22:37:49',20,5),
(25,50.00,'0','2023-11-12 00:47:57',21,3),
(26,10.00,'0','2023-11-12 20:26:30',23,4),
(27,10.00,'0','2023-11-12 20:26:30',23,1),
(28,40.00,'0','2023-11-12 20:26:30',23,3),
(29,50.00,'0','2023-11-12 20:26:42',22,3),
(30,50.00,'0','2023-11-13 00:17:27',26,3),
(31,30.00,'0','2023-11-13 00:17:27',26,1),
(32,20.00,'0','2023-11-13 00:17:44',24,4),
(33,50.00,'0','2023-11-13 00:17:44',24,5),
(34,50.00,'0','2023-11-13 00:17:55',25,3),
(35,20.00,'0','2023-11-13 00:18:56',27,4),
(36,50.00,'0','2023-11-13 00:18:56',27,2),
(37,30.00,'0','2023-11-13 00:18:56',27,3),
(38,20.00,'0','2023-11-13 00:18:56',27,1),
(39,290.00,'0','2023-11-16 15:30:05',28,3),
(40,50.00,'0','2023-11-17 00:24:27',29,3);

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
  `fechaCreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaFin` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `uk_numeroDocumento_per` (`numeroDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idPersona`,`nombres`,`apellidoPaterno`,`apellidoMaterno`,`tipoDocumento`,`numeroDocumento`,`fechaNacimiento`,`genero`,`telefono`,`fechaCreacion`,`fechaFin`,`estado`) values 
(1,'Juan','Quispe','Acevedo','N','98745632','2003-01-01','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(2,'Ana','Carbajal','Loyola','N','12546321','2000-01-16','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(3,'Juana','Uceda','Ramos','N','32145632',NULL,'F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(4,'Francisca','Ureña','Luna','N','96336987',NULL,'F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(5,'Benito','Martinez','Alfaro','N','95115978',NULL,'M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(6,'Laura','Polo','Manrique','N','74114789',NULL,'F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(7,'Maria','Cardenas','Almeyda','N','21876187','1987-10-11','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(8,'Yenny','Roman','Meneses','N','21854071','1990-09-08','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(9,'Williams','Moriano','Peña','N','72755127','2005-02-01','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(10,'Florentina','Peña','Diaz','N','21818841','1948-04-05','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(11,'Bruce','Tasayco','Almeyda','N','21874458','1976-11-05','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(12,'Maria','Robles','Sanchez','N','80042948','1972-10-05','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(13,'Luis','Chumpitaz','Torres','N','90160962','1967-08-01','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(14,'Adolfo','Magallanes','Gonzales','N','21860263','1970-08-01','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(15,'Hilda','Napa','Pachas','N','41869880','1985-02-01','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(16,'Ramon','Apolaya','Sotelo','N','21789377','1960-05-08','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(17,'Florentina','Salcedo','Sucantaipe','N','15412063','1965-04-03','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(18,'Ysabel','Conde','Castilla','N','40516544','1960-06-08','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(19,'Maria Fernanda','Carhualloclla','Crisostomo','N','71479678','1996-03-08','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(20,'Gustavo Alonso','Carbajal','Quispe','N','76582497','1984-08-08','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(21,'Angelica','Diaz','Pachas','N','61060072','1986-02-02','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(22,'Irene','Suarez','Matias','N','76364010','2002-01-31','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(23,'Johan','Luque','Ramos','N','71789712','2003-02-24','M',NULL,'2023-11-07 23:59:18',NULL,'1'),
(24,'Anny','Cabrera','Napa','N','71788436','2003-07-16','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(25,'Carol Nichol','Canchari','Silvestre','N','21884566','1978-08-08','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(26,'Rosa Luz','Vizarreta','De Mendoza','N','21800841','1962-03-03','F',NULL,'2023-11-07 23:59:18',NULL,'1'),
(27,'KAREN GIULLIANA','SUAREZ','MATIAS','N','47671169','1990-03-24','F','','2023-11-08 00:35:06',NULL,'1'),
(28,'BRIANNA HELENA','MATTA','VALVERDE','N','76364012','2002-12-21','F','','2023-11-08 01:19:01',NULL,'1'),
(29,'ERADIO','SUAREZ','COTRINA','N','18202819','1960-10-29','M','','2023-11-08 15:57:44',NULL,'1'),
(30,'NANCY','MATIAS','ORTIZ','N','18202820','1962-03-28','F','','2023-11-08 16:08:53',NULL,'1'),
(31,'JAHAYRA ELIZABETH','SUAREZ','MATIAS','N','76364011','1999-06-02','F','','2023-11-08 16:11:08',NULL,'1'),
(32,'RAUL','CHOTA','ARIRAMA','N','18202818','2000-02-15','M','','2023-11-08 16:17:01',NULL,'1'),
(33,'JUANA','PAREDES','ANTICONA','N','18202821','1985-04-15','F','','2023-11-08 16:21:35',NULL,'1'),
(34,'WILBER','SAMATA','PACCO','N','47671170','1950-06-15','F','','2023-11-11 22:34:28',NULL,'1'),
(35,'JUANA CARMEN','ZUÑIGA','DE CASTRO','N','21865000','1952-04-05','F','','2023-11-13 00:11:30',NULL,'1'),
(36,'JUANA ROSA','HUAMANI','LEON','N','47628838','1995-04-15','F','','2023-11-13 00:14:05',NULL,'1'),
(37,'ZECARLOS ADRIAN','DONAYRE','CHAVEZ','N','71775558','2000-04-15','M','','2023-11-13 00:15:38',NULL,'1');

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `nombreServicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `uk_nombreServicio_ser` (`nombreServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicios` */

insert  into `servicios`(`idServicio`,`tipo`,`nombreServicio`) values 
(1,'S','Laboratorio clínico'),
(2,'S','Ecografía'),
(3,'S','Radiografía Digital'),
(4,'S','Tópico Inyectable'),
(5,'S','Electrocardiograma'),
(6,'S','Medida de vista'),
(7,'S','Nebulización'),
(8,'S','Anatomiía patológica'),
(9,'E','Medicina General'),
(10,'E','Medicina Interna'),
(11,'E','Pediatría'),
(12,'E','Ginecología'),
(13,'E','Cirugía general'),
(14,'E','Neurología'),
(15,'E','Traumatología'),
(16,'E','Terapia física y rehabilitación'),
(17,'E','Obstetricia'),
(18,'E','Urología'),
(19,'E','Dermatología'),
(20,'E','Reumatología'),
(21,'E','Cardiología'),
(22,'E','Terapia de lenguaje'),
(23,'E','Psicología'),
(24,'E','Otorrinolaringología'),
(25,'E','Medicina complementaria'),
(26,'E','Odontología'),
(27,'E','Odontopediatria');

/*Table structure for table `servicios_detalle` */

DROP TABLE IF EXISTS `servicios_detalle`;

CREATE TABLE `servicios_detalle` (
  `idservicios_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idservicio` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  PRIMARY KEY (`idservicios_detalle`),
  KEY `fk_idservicios_serdet` (`idservicio`),
  CONSTRAINT `fk_idservicios_serdet` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicios_detalle` */

insert  into `servicios_detalle`(`idservicios_detalle`,`idservicio`,`descripcion`,`precio`,`genero`) values 
(1,1,'ACIDO FOLICO',60.00,NULL),
(2,1,'B12 VITAMINA',60.00,NULL),
(3,1,'CONSTANTES CORPUSCULARES',20.00,NULL),
(4,1,'FENOMENO LE - LUPUS ERIMATOSO',35.00,NULL),
(5,1,'FERRITINA',80.00,NULL),
(6,1,'GRUPO SANGUINEO Y RH-TIPIFICACION SANGUINEO',10.00,NULL),
(7,1,'HEMOGLOBINA - HEMATOCRITO RECUENTO SANGUINEO',10.00,NULL),
(8,1,'HEMOGRAMA COMPLETO',30.00,NULL),
(9,1,'HIERRO SERICO',50.00,NULL),
(10,1,'LAMINA PERIFERICA',15.00,NULL),
(11,1,'RETICULOCITOS',15.00,NULL),
(12,1,'TEST DE COOMBS DIRECTO',50.00,NULL),
(13,1,'TRANSFERRINA',65.00,NULL),
(14,1,'TROPONINA I',70.00,NULL),
(15,1,'ERITROSEDIMENTACION - VSG - VELOCIDAD DE SEDIMIENTO',10.00,NULL),
(16,1,'RECUENTO DE PLAQUETAS (MANUAL)',15.00,NULL),
(17,1,'TIEMPO DE COAGULACION Y SANGRIA - TC - TS',15.00,NULL),
(18,1,'VARIANTE DU',20.00,NULL),
(19,1,'TIEMPO DE PROTOMBINA IRN(TP) - TP TROMBINA',35.00,NULL),
(20,1,'TIEMPO DE TROMBINA',35.00,NULL),
(21,1,'TIEMPO DE TROMBOPLASTINA PARCIAL ACTIVADA APTT',35.00,NULL),
(22,1,'FIBRINOGENO',40.00,NULL),
(23,1,'DIMERO D CUANTIATIVO',90.00,NULL),
(24,1,'ACIDO URICO',15.00,NULL),
(25,1,'AMILASA SERICA',30.00,NULL),
(26,1,'BILIRRUBINAS TOTAL Y FRACCIONADAS',20.00,NULL),
(27,1,'CALCIO SERICO',35.00,NULL),
(28,1,'COLESTEROL HDL',15.00,NULL),
(29,1,'COLESTEROL LDL',15.00,NULL),
(30,1,'COLESTEROL TOTAL',10.00,NULL),
(31,1,'COLESTEROL VLDL',15.00,NULL),
(32,1,'CPK MB',50.00,NULL),
(33,1,'CREATININA',10.00,NULL),
(34,1,'DESHIDROGENASA LACTICA (LDH)',50.00,NULL),
(35,1,'ELECTROLITOS SERICOS (NA - CL - K) SODIO - CLORO - SODIO',80.00,NULL),
(36,1,'FOSFATA ALCALINA',10.00,NULL),
(37,1,'FOSFATASA ACIDA PROSTATICA ( RESULTADO 3 DIAS )',90.00,NULL),
(38,1,'FOSFORO',30.00,NULL),
(39,1,'GAMMA/GLUTAMIL/TRANSFERASA(GGT)TRANSPETIDASA/GGTP',50.00,NULL),
(40,1,'GLUCOSA POSTPANDRIAL',20.00,NULL),
(41,1,'GLUCOSA',10.00,NULL),
(42,1,'TOLERANCIA A LA GLUCOSA (3 GLUCOSAS) BASAL - 60MIN - 120 MIN',30.00,NULL),
(43,1,'HEMOGLOBINA GLICOSILADA (HB)',60.00,NULL),
(44,1,'LIPASA SERICA',60.00,NULL),
(45,1,'LIPIDOS TOTALES',20.00,NULL),
(46,1,'MAGNESIO',50.00,NULL),
(47,1,'PROTEINAS T Y F + ALBUMINA + GLOBULINA',25.00,NULL),
(48,1,'TRANSAMINASA OXALACETICA TGO',15.00,NULL),
(49,1,'TRANSAMINASA PIRUVICA TGP',15.00,NULL),
(50,1,'TRIGLICERIDOS',10.00,NULL),
(51,1,'UREA',10.00,NULL),
(52,1,'INSULINA BASAL',50.00,NULL),
(53,1,'INSULINA POST PANDRIAL( BASAL + INSULINA 2HRAS)',100.00,NULL),
(54,1,'AGLUTINACIONES - PARATIFICO - (TIFOIDEA)',30.00,NULL),
(55,1,'ANA - ANT ANTINUCLEARES - LIMA',100.00,NULL),
(56,1,'ANTIESTREPTOLISINA \"O\" ASO',15.00,NULL),
(57,1,'CHAGAS',60.00,NULL),
(58,1,'FACTOR REUMATOIDEO CUANTITIVO',60.00,NULL),
(59,1,'FACTOR REUMATOIDEO CUALITATIVO',15.00,NULL),
(60,1,'H.I.V (1 + 2) PRUEBA RAPIDA',30.00,NULL),
(61,1,'HIV 4TA GENERSCION ELISA',70.00,NULL),
(62,1,'HELICOBACTER PYLORI CUALITATIVA',30.00,NULL),
(63,1,'HELICOBACTER PYLORI IGG CUALITATIVA',60.00,NULL),
(64,1,'HELICOBACTER PYLORI IGM CUALITATIVA',60.00,NULL),
(65,1,'HEPATITIS A HVA',55.00,NULL),
(66,1,'HEPATITIS B (ANTICORE TOTAL)',60.00,NULL),
(67,1,'HEPATITIS B (ANTICUERPOS HB)',80.00,NULL),
(68,1,'HEPATITIS B (HSBAG) - (ANTIGENO AUSTRALIANO) ELISA',60.00,NULL),
(69,1,'HEPATITIS B (HSBAG) - (ANTIGENO AUSTRALIANO) (P. RAPIDA)',30.00,NULL),
(70,1,'HEPATITIS C (AC TOTALES) - ELISA',60.00,NULL),
(71,1,'HTLV',60.00,NULL),
(72,1,'INMUNOGLUBULINA SERICA IGE',60.00,NULL),
(73,1,'PCR CUALITATIVA',15.00,NULL),
(74,1,'PCR CUANTITATIVA',50.00,NULL),
(75,1,'RPR',30.00,NULL),
(76,1,'DENGUE IGG/IGM/NS1',70.00,NULL),
(77,1,'PRUEBA COVID19 - HISOPADO',60.00,NULL),
(78,1,'SIFILIS POR ELISA',60.00,NULL),
(79,1,'ELISA PARA HIDATIDOSIS ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',100.00,NULL),
(80,1,'PANEL ALERGICO(36) PLANTAS Y COMIDA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',250.00,NULL),
(81,1,'ANTI CCP - PEPTIDO CLINICO ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',230.00,NULL),
(82,1,'PERFIL TESTOSTERONA LIBRE',90.00,NULL),
(83,1,'CHALMYDIA TRACHOMATIS IGG ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL),
(84,1,'CHALMYDIA TRACHOMATIS IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL),
(85,1,'TOXOPLASMA IGG( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL),
(86,1,'TOXOPLASMA IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',120.00,NULL),
(87,1,'CITOMEGALOVIRUS IGG ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL),
(88,1,'CITOMEGALOVIRUS IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL),
(89,1,'EXAMEN COMPLETO',10.00,NULL),
(90,1,'PROTEINAS (ORINA 24H)',30.00,NULL),
(91,1,'SEDIMENTO URINARIO',5.00,NULL),
(92,1,'DEPURACION DE CREATININA',30.00,NULL),
(93,1,'MICROALBUMINURIA (ORINA 24 H)',30.00,NULL),
(94,1,'UROCULTIVO - ATB - KIT COMERCIAL - CULTIVO',40.00,NULL),
(95,1,'CALCIO (ORINA 24H)',45.00,NULL),
(96,1,'PARASITOLOGICO SIMPLE X 1 MUESTRA',10.00,NULL),
(97,1,'PARASITOLOGIA SERIADA X 3 MUESTRAS',30.00,NULL),
(98,1,'COPROCULTIVO FUNCIONAL',60.00,NULL),
(99,1,'REACCION INFLAMATORIA',10.00,NULL),
(100,1,'SUDAM III',50.00,NULL),
(101,1,'SUSTANCIAS REDUCTORAS',30.00,NULL),
(102,1,'TEST DE GRAHAM',10.00,NULL),
(103,1,'THEVENON',35.00,NULL),
(104,1,'COLORACION GRAM (BACTERIAS)',20.00,NULL),
(105,1,'CULTIVO DE FARINGEA',80.00,NULL),
(106,1,'CULTIVO DE LIQUIDO (4 DIAS)',60.00,NULL),
(107,1,'CULTIVO DE SECRECION VAGINAL',60.00,NULL),
(108,1,'CULTIVO DE SEMEN',70.00,NULL),
(109,1,'CULTIVO HERIDA',60.00,NULL),
(110,1,'CULTIVO URETRAL - HOMBRE',60.00,NULL),
(111,1,'ESPUTO SERIADO X3',40.00,NULL),
(112,1,'ESPUTO SIMPLE X1',15.00,NULL),
(113,1,'KOH - RASPADO',30.00,NULL),
(114,1,'CORTISOL AM',80.00,NULL),
(115,1,'CORTISOL PM',80.00,NULL),
(116,1,'BHCG CUALITATIVO',20.00,NULL),
(117,1,'BHCG CUANTITATIVO',60.00,NULL),
(118,1,'ESTRADIOL',70.00,NULL),
(119,1,'FSH',60.00,NULL),
(120,1,'LH',60.00,NULL),
(121,1,'PROGESTERONA',70.00,NULL),
(122,1,'PROLACTINA',70.00,NULL),
(123,1,'T3 - TOTAL',60.00,NULL),
(124,1,'T3 LIBRE',60.00,NULL),
(125,1,'T4 TOTAL',60.00,NULL),
(126,1,'T4 LIBRE',60.00,NULL),
(127,1,'TESTOTERONA',70.00,NULL),
(128,1,'TSH',60.00,NULL),
(129,1,'CA 15-3 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL),
(130,1,'CA 19.9 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL),
(131,1,'CEA 125 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL),
(132,1,'CEA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL),
(133,1,'PSA TOTAL',60.00,NULL),
(134,1,'PSA LIBRE',60.00,NULL),
(135,1,'ALFA FETOPROTEINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',80.00,NULL),
(136,1,'DOSAJE PROCALCITONINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',250.00,NULL),
(137,1,'BIOPSIA PIEZA OPERATORIA <= 5MM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL),
(138,1,'BIOPSIA PIEZA OPERATORIA CHICA > 5MM <=2 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',150.00,NULL),
(139,1,'BIOPSIA PIEZA OPERATORIA MEDIANO > 2 CM Y <= 5CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',190.00,NULL),
(140,1,'BIOPSIA PIEZA OPERTORIA GRANDE > 5CM Y <= 10 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )',280.00,NULL),
(141,1,'PERFIL LIPIDICO',60.00,NULL),
(142,1,'PERFIL HEPATICO',60.00,NULL),
(143,2,'ECO ABDOMINAL INFERIOR',60.00,NULL),
(144,2,'ECO ABDOMINAL SUPERIOR',60.00,NULL),
(145,2,'ECO COMPLETA',60.00,NULL),
(146,2,'ECO DE CUELLO',60.00,NULL),
(147,2,'ECO DE PROSTATA',60.00,NULL),
(148,2,'ECO DE VEJIGA',60.00,NULL),
(149,2,'ECO DOPLER 1 MIEMBRO',120.00,NULL),
(150,2,'ECO DOPLER 2 MIEMBROS',200.00,NULL),
(151,2,'ECO DOPLER HEPÁTICA',150.00,NULL),
(152,2,'ECO DOPLER OBSTÉTRICA',120.00,NULL),
(153,2,'ECO GÉNETICA',120.00,NULL),
(154,2,'ECO HIGADO',60.00,NULL),
(155,2,'ECO INFERIOR',60.00,NULL),
(156,2,'ECO MAMARIA - UNILATERAL',60.00,NULL),
(157,2,'ECO MORFOLÓGICA',120.00,NULL),
(158,2,'ECO MUSCULOESQUELETICA',60.00,NULL),
(159,2,'ECO OBSTÉTRICA(PERFIL BIOFÍSICO)',80.00,NULL),
(160,2,'ECO PARTES BLANDAS',60.00,NULL),
(161,2,'ECO PARTES BLANDAS HERNIAS',60.00,NULL),
(162,2,'ECO PARTES BLANDAS TESTÍCULOS',60.00,NULL),
(163,2,'ECO PARTES BLANDAS TIROIDES',60.00,NULL),
(164,2,'ECO PÉLVICA',60.00,NULL),
(165,2,'ECO RENAL',60.00,NULL),
(166,2,'ECO RENAL-VESICAL',60.00,NULL),
(167,2,'ECO SUPERIOR',60.00,NULL),
(168,2,'ECO TESTICULOS',60.00,NULL),
(169,2,'ECO TIROIDES Y MASAS DEL CUELLO',60.00,NULL),
(170,2,'ECO VESICAL-PROSTÁTICA',60.00,NULL),
(171,2,'ECO VESICULAR',60.00,NULL),
(172,2,'ECO VIAS URINARIAS COMPLETAS',60.00,NULL),
(173,3,'RX PIE',70.00,NULL),
(174,3,'RX DE RODILLA',90.00,NULL),
(175,3,'RX DE COLUMNA LUMBOSACRA',90.00,NULL),
(176,3,'RX SENOS PARANASALES F-P-O',90.00,NULL),
(177,3,'RX MAXILAR INFERIOR',70.00,NULL),
(178,3,'RX MAXILAR SUPERIOR',70.00,NULL),
(179,3,'RX MASTOIDES(POR LADO)',60.00,NULL),
(180,3,'RX HUESOS NASALES',60.00,NULL),
(181,3,'RX DE AGUJEROS OPTICOS',60.00,NULL),
(182,3,'RX ORBITAS',70.00,NULL),
(183,3,'RX SILLA TURCA',70.00,NULL),
(184,3,'RX CRANEO FRONTAL Y PERFIL',70.00,NULL),
(185,3,'RX PEÑASCO CADA LADO',60.00,NULL),
(186,3,'RX TEMPORAL CADA LADO',50.00,NULL),
(187,3,'RX ARTIC TEMPOMANDIBULAR UNILATERAL(CADA LADO)',60.00,NULL),
(188,3,'RX ARTIC TEMPOMANDIBULAR COMPARATIVO',80.00,NULL),
(189,3,'RX TORAX, INCIDENCIA FRONTAL O A/P',50.00,NULL),
(190,3,'RX TORAX, FRONTAL Y LATERAL(F-P)',80.00,NULL),
(191,3,'RX CORAZON Y GRANDES VASOS - TORAX',50.00,NULL),
(192,3,'RX COSTILLAS F',50.00,NULL),
(193,3,'RX ESTERNON, MINIMO 2 INCIDENCIAS',70.00,NULL),
(194,3,'RX COLUMNA CERVICAL F-P-O',90.00,NULL),
(195,3,'RX COLUMNA CERVICAL FRONTAL LATERAL',70.00,NULL),
(196,3,'RX COLUMNA CERVICAL FUNCIONAL 2 INCIDENCIAS',70.00,NULL),
(197,3,'RX COLUMNA CERVICO DORSAL',70.00,NULL),
(198,3,'RX COLUMNA LUMBAR FRONTAL Y LATERAL',70.00,NULL),
(199,3,'RX COLUMNA DORSAL FRONTAL Y LATERAL',70.00,NULL),
(200,3,'RX COLUMNA DORSAL F-P-O',90.00,NULL),
(201,3,'RX PARRILLA COSTAL F-O',90.00,NULL),
(202,3,'RX COLUMNA DORSOLUMBAR',80.00,NULL),
(203,3,'RX COLUMNA LUMBOSACRA F-P',70.00,NULL),
(204,3,'RX COLUMNA LUMBOSACRA F-P-O',90.00,NULL),
(205,3,'RX PELVIS',70.00,NULL),
(206,3,'RX SACROLIACA CADA LADO',70.00,NULL),
(207,3,'RX SACROCOXIGEA F-P',70.00,NULL),
(208,3,'RX CLAVICULA COMPLETO',50.00,NULL),
(209,3,'RX ESCAPULA FRONTAL LATERAL',70.00,NULL),
(210,3,'RX HOMBRO F-P',50.00,NULL),
(211,3,'RX BRAZO F-P',50.00,NULL),
(212,3,'RX CODO F-P',50.00,NULL),
(213,3,'RX ANTEBRAZO CADA LADO',50.00,NULL),
(214,3,'RX MUÑECA F-P',50.00,NULL),
(215,3,'RX MANO F-P',50.00,NULL),
(216,3,'RX MANO, EDAD OSEA(FRONTAL)',50.00,NULL),
(217,3,'RX CADERA, UNILAT, UNA VISTA',70.00,NULL),
(218,3,'RX CADERA, UNILAT, COMPLETO 2 VISTAS',90.00,NULL),
(219,3,'RX PELVIS Y CADERA, LACTANTE O NIÑO',80.00,NULL),
(220,3,'RX FEMUR F-P',70.00,NULL),
(221,3,'RX RODILLA F-P',70.00,NULL),
(222,3,'RX ROTULA FRONTAL Y LATERAL',50.00,NULL),
(223,3,'RX TIBIA Y PERONE F-P',50.00,NULL),
(224,3,'RX TOBILLO F-P',50.00,NULL),
(225,3,'RX PIE F-O',50.00,NULL),
(226,3,'RX CALCANEO F-P',70.00,NULL),
(227,3,'RX MEDICIÓN DE MIEMBRO INFERIOR NIÑO',120.00,NULL),
(228,3,'RX MEDICIÓN DE MIEMBRO INFERIOR ADULTO',120.00,NULL),
(229,3,'RX ABDOMEN SIMPLE',60.00,NULL),
(230,3,'RX ABDOMEN DE PIE - DECUBITO',70.00,NULL),
(231,3,'EXAMEN RADIOLOGICO DE CAVUM',60.00,NULL),
(232,3,'EXAMEN RADIOLOGICO DE ESOFAGO',110.00,NULL),
(233,3,'UROGRAFIA EXCRETORIA',100.00,NULL),
(234,3,'RX PIERNA F-P',70.00,NULL),
(235,4,'INTRAMUSCULAR',6.00,NULL),
(236,4,'ENDOVENOSO',30.00,NULL),
(237,4,'AMPOLLA A LA VENA',20.00,NULL),
(238,4,'NEBULIZACION',10.00,NULL),
(239,4,'COLOCACION DE OXIGENO 20 MIN',50.00,NULL),
(240,4,'COLOCACION DE OXIGENO 30 MIN',80.00,NULL),
(241,4,'RETIRO DE PUNTOS',10.00,NULL),
(242,4,'COLOCACION DE ENEMA',20.00,NULL),
(243,4,'COLOCACION DE SONDA ',30.00,NULL),
(244,4,'PRUEBA DE SENSIBILIDAD',6.00,NULL),
(245,9,'CONSULTA',20.00,NULL),
(246,10,'CONSULTA',40.00,NULL),
(247,11,'CONSULTA',40.00,NULL),
(248,13,'CONSULTA',40.00,NULL),
(249,13,'EXTRACCION DE LIPOMA',150.00,NULL),
(250,14,'CONSULTA',40.00,NULL),
(251,15,'CONSULTA',40.00,NULL),
(252,15,'INFILTRACION',150.00,NULL),
(253,15,'COLOCACION DE YESO ANTEBRAZO SIN MATERIALES',150.00,NULL),
(254,15,'COLOCACION DE YESO ANTEBRAZO CON MATERIALES',250.00,NULL),
(255,15,'COLOCACION DE YESO PIERNA SIN MATERIALES',250.00,NULL),
(256,15,'COLOCACION DE YESO PIERNA CON MATERIALES',350.00,NULL),
(257,15,'RETIRO DE YESO',80.00,NULL),
(258,15,'FERULA SIN MATERIALES',150.00,NULL),
(259,15,'FERULA CON MATERIALES',250.00,NULL),
(260,16,'SESION',40.00,NULL),
(261,16,'PAQUETE DE 5 SESIONES',150.00,NULL),
(262,16,'PAQUETE DE 10 SESIONES',300.00,NULL),
(263,16,'ONDA DE CHOQUE',120.00,NULL),
(264,16,'MASAJES RELAJANTES',40.00,NULL),
(265,18,'CONSULTA',40.00,NULL),
(266,19,'CONSULTA',50.00,NULL),
(267,21,'CONSULTA',50.00,NULL),
(268,21,'EKG',70.00,NULL),
(269,21,'RIESGO QUIRURGICO',180.00,NULL),
(270,21,'INFORME CARDIOLOGICO',80.00,NULL),
(271,23,'CONSULTA',30.00,NULL),
(272,23,'TERAPIA',40.00,NULL),
(273,23,'EVALUACION',50.00,NULL),
(274,23,'TERAPIA DE LENGUAJE - CONSULTA',30.00,NULL),
(275,23,'TERAPIA DE LENGUAJE - TERAPIA',40.00,NULL),
(276,24,'CONSULTA',50.00,NULL),
(277,24,'AUDIOMETRIA TOTAL',100.00,NULL),
(278,24,'TIMPANOMETRIA',150.00,NULL),
(279,24,'ENDOSCOPIA DE OIDO',190.00,NULL),
(280,24,'CAUTERIZACION QUIMICA',140.00,NULL),
(281,24,'CURACION DE OIDO',60.00,NULL),
(282,24,'ELECTROCAUTERIZACION',100.00,NULL),
(283,24,'EXTRACCION DE CUERPO EXTRAÑO ( OIDO,NARIZ,FARINGE)',120.00,NULL),
(284,24,'INFILTRACION DE CORNETA',60.00,NULL),
(285,24,'LAVADO DE OIDO ',70.00,NULL),
(286,24,'REDUCCION DE FRACTURA',250.00,NULL),
(287,24,'RETIRO DE TAPONAMIENTO NASAL ANTERIOR UNILATERAL',100.00,NULL),
(288,24,'RETIRO DE TAPONAMIENTO NASAL ANTERIOR BILATERAL',150.00,NULL),
(289,24,'TAPONAMIENTO NASAL ANTERIOR UNILATERAL',100.00,NULL),
(290,24,'TAPONAMIENTO NASAL ANTERIOR BILATERAL',150.00,NULL),
(291,24,'CAUTERIZACION FARINGEA - UNA SESION',100.00,NULL),
(292,24,'TAPONAMENTO NASAL POSTERIOR UNILATERAL',250.00,NULL),
(293,24,'ENDOSCOPIA LARINGEA',209.00,NULL),
(294,24,'PRUEBA VESTIBULOS',100.00,NULL),
(295,24,'LARINCOSCOPIA',180.00,NULL),
(296,24,'VIDEO ENDOSCOPIA LARINGEA',190.00,NULL),
(297,24,'OTOMICROCOSPIA',100.00,NULL),
(298,26,'CONSULTA',0.00,NULL),
(299,26,'LIMPIEZA DENTAL',100.00,NULL),
(300,26,'FRENILLO',500.00,NULL),
(301,26,'BLANCAMIENTO',350.00,NULL),
(302,26,'EXTRACION DE DIENTE',80.00,NULL),
(303,26,'PULPOTOMIA',100.00,NULL),
(304,26,'VARNIZ FLORADO - FLUOR',40.00,NULL),
(305,27,'CONSULTA',40.00,NULL),
(306,27,'LIMPIEZA DENTAL',100.00,NULL),
(307,27,'FRENILLO',500.00,NULL),
(308,27,'BLANCAMIENTO',350.00,NULL),
(309,27,'EXTRACION DE DIENTE',80.00,NULL),
(310,27,'PULPOTOMIA',100.00,NULL),
(311,27,'VARNIZ FLORADO - FLUOR',40.00,NULL),
(312,2,'ECO 4D',100.00,'F'),
(313,2,'ECO 5D',100.00,'F'),
(314,2,'ECO OBSTÉTRICA',60.00,'F'),
(315,2,'ECO MAMAS',60.00,'F'),
(316,2,'ECO TRANSVAGINAL(TV)',60.00,'F'),
(317,12,'CONSULTA',40.00,'F'),
(318,12,'PAPANICOLAO',40.00,'F'),
(319,12,'CULTIVO DE SECRECION VAGINAL',60.00,'F'),
(320,12,'BIOPSIA DE CUELLO UTERINO',150.00,'F'),
(321,12,'COLCOSPIA',120.00,'F');

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
  `nivelAcceso` char(1) NOT NULL DEFAULT 'A',
  `fechaInicio` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaFin` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `uk_idpersona_usu` (`idPersona`),
  CONSTRAINT `fk_usuarios_usu` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUsuario`,`nombreUsuario`,`clave`,`nivelAcceso`,`fechaInicio`,`fechaFin`,`estado`,`idPersona`) values 
(1,'JuanQ','$2y$10$qDspv2dEA7.jvQjS5gU12OxTrlopbXEXPParkCzqtZBElDs6GATeC','A','2023-11-07 23:59:19',NULL,'1',1),
(2,'AnaC','$2y$10$Lnz.NmRU7JA4z/YKc4yrFugoZIsfPPdKTHe1btDBkD2AxN8rCUaxW','A','2023-11-07 23:59:19',NULL,'1',2),
(3,'JuanaU','$2y$10$Gz1zSVQktIt1jCJsV.pjQ.ynPGu9QFSB.rTof.7kpIFdOVb9bXcre','A','2023-11-07 23:59:19',NULL,'1',3);

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
	WHERE Servicios.idServicio = _idServicio;
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
	ORDER BY atenciones.`estado` ;
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
	IN _telefono			CHAR(9)
)
BEGIN
	INSERT INTO personas (nombres, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, fechaNacimiento, genero, telefono) VALUES
	(_nombres,_apellidoPaterno,_apellidoMaterno,_tipoDocumento,_numeroDocumento,_fechaNacimiento,_genero,_telefono);
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
	-- INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
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
    ifnull(SUM(monto),0) AS totalpagos,
    ifnull((SUM(monto) - (IFNULL((SELECT SUM(d.montoDevolucion) FROM Devoluciones d WHERE DATE(d.fechaHoraDevolucion) = CURDATE()), 0)
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
IN _idMedioPago 		INT
)
BEGIN 
	INSERT INTO Devoluciones(motivoDevolucion, montoDevolucion, idAtencion, idMedioPago) VALUES
	(_motivoDevolucion, _montoDevolucion, _idAtencion, _idMedioPago);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_registrar_gastos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_registrar_gastos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_registrar_gastos`(
IN _montoGasto		DECIMAL(6,2),
IN _descripcionGasto	VARCHAR(200),
IN _idPersona		INT, 
IN _idMedioPago 	INT
)
BEGIN
	INSERT INTO gastos(montoGasto, descripcionGasto, idPersona, idMedioPago) VALUES
	(_montoGasto, _descripcionGasto, _idPersona, _idMedioPago);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_caja_registrar_pago` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_caja_registrar_pago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_caja_registrar_pago`(
IN _idatencion 	INT,
IN _idmediopago	INT,
IN _monto			DECIMAL(7,2)
)
BEGIN 
	INSERT INTO pagos (idatencion, idMedioPago, monto) VALUES
	(_idatencion, _idmediopago, _monto);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_monto_medioPago`(in _idmedio int)
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
	upper(CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno)) AS 'Paciente',
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
IN _temperatura			DECIMAL(4,2),
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

/* Procedure structure for procedure `spu_triaje_reporte` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_triaje_reporte` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_triaje_reporte`()
BEGIN
	SELECT 
		idDetalleAtenciones,
		peso, talla, frecuenciaCardiaca, FrecuenciaRespiratoria, PresionArterial, temperatura, SaturacionOxigeno,
		Historias_Clinicas.antecedentePersonal, Historias_Clinicas.antecedenteFamiliar, Historias_Clinicas.antecedenteQuirurgico, Historias_Clinicas.antecedenteOtro,
		CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS paciente
		FROM detalle_atenciones
		INNER JOIN Historias_Clinicas ON Historias_Clinicas.idHistoriaClinica = detalle_atenciones.idHistoria
		INNER JOIN personas ON personas.idPersona = Historias_Clinicas.idPersona
		LEFT JOIN Detalle_Alergias ON Detalle_Alergias.idHistoriaClinica = Historias_Clinicas.idHistoriaClinica
		WHERE DATE(detalle_atenciones.fechaCreacion) = CURDATE();
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
