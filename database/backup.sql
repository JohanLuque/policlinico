/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - sispsolidario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sispsolidario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sispsolidario`;

/*Table structure for table `alergias` */

DROP TABLE IF EXISTS `alergias`;

CREATE TABLE `alergias` (
  `idAlergia` int(11) NOT NULL AUTO_INCREMENT,
  `alergia` varchar(100) NOT NULL,
  PRIMARY KEY (`idAlergia`),
  UNIQUE KEY `uk_alergias_ale` (`alergia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `estado` char(1) NOT NULL DEFAULT '0',
  `idUsuario` int(11) NOT NULL,
  `ordenDoctor` varchar(100) DEFAULT NULL,
  `idFamiliar` int(11) DEFAULT NULL,
  `idPersona` int(11) NOT NULL,
  `fechaAtencion` date NOT NULL,
  PRIMARY KEY (`idAtencion`),
  KEY `fk_usuario_ate` (`idUsuario`),
  KEY `fk_fami_ate` (`idFamiliar`),
  KEY `fk_per_ate` (`idPersona`),
  CONSTRAINT `fk_fami_ate` FOREIGN KEY (`idFamiliar`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_per_ate` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_usuario_ate` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `atenciones` */

insert  into `atenciones`(`idAtencion`,`turno`,`numeroAtencion`,`fechaCreacion`,`fechaActualizacion`,`parentesco`,`estado`,`idUsuario`,`ordenDoctor`,`idFamiliar`,`idPersona`,`fechaAtencion`) values 
(1,'T','141020230001','2023-10-14 14:18:25','2023-10-14 14:22:22',NULL,'1',1,NULL,NULL,22,'2023-10-14'),
(2,'T','141020230002','2023-10-14 14:37:18',NULL,NULL,'0',1,NULL,NULL,24,'2023-10-14'),
(3,'T','141020230003','2023-10-14 14:49:10',NULL,NULL,'0',1,NULL,NULL,27,'2023-10-14');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_alergias` */

/*Table structure for table `detalle_atenciones` */

DROP TABLE IF EXISTS `detalle_atenciones`;

CREATE TABLE `detalle_atenciones` (
  `idDetalleAtenciones` int(11) NOT NULL AUTO_INCREMENT,
  `peso` decimal(5,2) NOT NULL,
  `talla` int(11) NOT NULL,
  `frecuenciaCardiaca` varchar(5) NOT NULL,
  `frecuenciaRespiratoria` varchar(5) NOT NULL,
  `presionArterial` varchar(10) NOT NULL,
  `temperatura` decimal(4,2) NOT NULL,
  `saturacionOxigeno` tinyint(4) NOT NULL,
  `examemGeneral` varchar(2000) DEFAULT NULL,
  `frecuencia` char(1) DEFAULT 'p',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_servicios` */

insert  into `detalle_servicios`(`idDetalleServicio`,`idservicios_detalle`,`idAtencion`) values 
(1,310,1),
(2,310,2),
(3,310,3);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `enfermedades` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `especialistas_servicios` */

insert  into `especialistas_servicios`(`idEspecialistasServicios`,`idEspecialista`,`idServicio`) values 
(1,1,1),
(2,2,2),
(3,1,3),
(4,2,9),
(5,3,10),
(6,1,11);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `historias_clinicas` */

insert  into `historias_clinicas`(`idHistoriaClinica`,`antecedentePersonal`,`antecedenteFamiliar`,`antecedenteQuirurgico`,`antecedenteOtro`,`idUsuario`,`idPersona`) values 
(1,NULL,NULL,NULL,NULL,1,22),
(2,NULL,NULL,NULL,NULL,1,23),
(3,NULL,NULL,NULL,NULL,1,24);

/*Table structure for table `medio_pagos` */

DROP TABLE IF EXISTS `medio_pagos`;

CREATE TABLE `medio_pagos` (
  `idMedioPago` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePago` varchar(100) NOT NULL,
  PRIMARY KEY (`idMedioPago`),
  UNIQUE KEY `uk_nombrePago_mps` (`nombrePago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `tipoMovimiento` char(1) NOT NULL DEFAULT 'E',
  `descripcionGasto` varchar(200) DEFAULT NULL,
  `fechaHora` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaDevolucion` datetime DEFAULT NULL,
  `idAtencion` int(11) DEFAULT NULL,
  `idMedioPago` int(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_idate_pag` (`idAtencion`),
  KEY `fk_idmep_pag` (`idMedioPago`),
  CONSTRAINT `fk_idate_pag` FOREIGN KEY (`idAtencion`) REFERENCES `atenciones` (`idAtencion`),
  CONSTRAINT `fk_idmep_pag` FOREIGN KEY (`idMedioPago`) REFERENCES `medio_pagos` (`idMedioPago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pagos` */

insert  into `pagos`(`idPago`,`monto`,`tipoMovimiento`,`descripcionGasto`,`fechaHora`,`fechaDevolucion`,`idAtencion`,`idMedioPago`) values 
(1,40.00,'D','porque no tengo money \n','2023-10-14 14:22:22','2023-10-14 14:35:23',1,4),
(2,500.00,'E','WILLIAMS\n','2023-10-14 14:26:27',NULL,NULL,3),
(3,20.00,'E','mascarillas','2023-10-14 14:39:10',NULL,NULL,3),
(4,100.00,'E','inyectables','2023-10-14 14:41:10',NULL,NULL,4),
(5,40.00,'E','aujas','2023-10-14 14:42:15',NULL,NULL,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idPersona`,`nombres`,`apellidoPaterno`,`apellidoMaterno`,`tipoDocumento`,`numeroDocumento`,`fechaNacimiento`,`genero`,`telefono`,`fechaCreacion`,`fechaFin`,`estado`) values 
(1,'Juan','Quispe','Acevedo','N','98745632','2003-01-01','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(2,'Ana','Carbajal','Loyola','N','12546321','2000-01-16','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(3,'Juana','Uceda','Ramos','N','32145632',NULL,'F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(4,'Francisca','Ureña','Luna','N','96336987',NULL,'F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(5,'Benito','Martinez','Alfaro','N','95115978',NULL,'M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(6,'Laura','Polo','Manrique','N','74114789',NULL,'F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(7,'Maria','Cardenas','Almeyda','N','21876187','1987-10-11','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(8,'Yenny','Roman','Meneses','N','21854071','1990-09-08','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(9,'Williams','Moriano','Peña','N','72755127','2005-02-01','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(10,'Florentina','Peña','Diaz','N','21818841','1948-04-05','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(11,'Bruce','Tasayco','Almeyda','N','21874458','1976-11-05','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(12,'Maria','Robles','Sanchez','N','80042948','1972-10-05','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(13,'Luis','Chumpitaz','Torres','N','90160962','1967-08-01','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(14,'Adolfo','Magallanes','Gonzales','N','21860263','1970-08-01','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(15,'Hilda','Napa','Pachas','N','41869880','1985-02-01','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(16,'Ramon','Apolaya','Sotelo','N','21789377','1960-05-08','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(17,'Florentina','Salcedo','Sucantaipe','N','15412063','1965-04-03','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(18,'Ysabel','Conde','Castilla','N','40516544','1960-06-08','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(19,'Maria Fernanda','Carhualloclla','Crisostomo','N','71479678','1996-03-08','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(20,'Gustavo Alonso','Carbajal','Quispe','N','76582497','1984-08-08','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(21,'Angelica','Diaz','Pachas','N','61060072','1986-02-02','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(22,'Irene','Suarez','Matias','N','76364010','2002-01-31','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(23,'Johan','Luque','Ramos','N','71789712','2003-02-24','M',NULL,'2023-10-14 14:14:09',NULL,'1'),
(24,'Anny','Cabrera','Napa','N','71788436','2003-07-16','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(25,'Carol Nichol','Canchari','Silvestre','N','21884566','1978-08-08','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(26,'Rosa Luz','Vizarreta','De Mendoza','N','21800841','1962-03-03','F',NULL,'2023-10-14 14:14:09',NULL,'1'),
(27,'JAHAYRA ','SUAREZ','MATIAS','N','76364011','1999-06-02','F','','2023-10-14 14:48:48',NULL,'1');

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `nombreServicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `uk_nombreServicio_ser` (`nombreServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(26,'E','Odontología');

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
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(305,2,'ECO 4D',100.00,'F'),
(306,2,'ECO 5D',100.00,'F'),
(307,2,'ECO OBSTÉTRICA',60.00,'F'),
(308,2,'ECO MAMAS',60.00,'F'),
(309,2,'ECO TRANSVAGINAL(TV)',60.00,'F'),
(310,12,'CONSULTA',40.00,'F'),
(311,12,'PAPANICOLAO',40.00,'F'),
(312,12,'CULTIVO DE SECRECION VAGINAL',60.00,'F'),
(313,12,'BIOPSIA DE CUELLO UTERINO',150.00,'F'),
(314,12,'COLCOSPIA',120.00,'F');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUsuario`,`nombreUsuario`,`clave`,`nivelAcceso`,`fechaInicio`,`fechaFin`,`estado`,`idPersona`) values 
(1,'JuanQ','123','A','2023-10-14 14:14:11',NULL,'1',1),
(2,'AnaC','1','A','2023-10-14 14:14:11',NULL,'1',2),
(3,'JuanaU','','A','2023-10-14 14:14:11',NULL,'1',3);

/* Procedure structure for procedure `spu_admision_atenciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_admision_atenciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_admision_atenciones`(
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

/* Procedure structure for procedure `spu_buscar_personas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscar_personas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_personas`(
IN _numeroDocumento VARCHAR(12)
)
BEGIN 
	SELECT `idPersona`,
		CONCAT(`apellidoPaterno`, 
		' ', `apellidoMaterno`, 
		', ' , nombres) AS 'ApellidosNombres',
		YEAR(CURDATE()) - YEAR(`fechaNacimiento`) AS 'Edad', genero
	FROM personas
	WHERE `numeroDocumento` = _numeroDocumento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_detalle_atencion` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_detalle_atencion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_detalle_atencion`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion,servicios.idServicio, servicios.nombreServicio,
	personas.nombres,personas.`apellidoMaterno`, personas.`apellidoPaterno`,
	personas.`numeroDocumento`,YEAR(CURDATE()) - YEAR(personas.`fechaNacimiento`) AS 'Edad',
	personas.`telefono`, atenciones.`fechaAtencion`
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	--  INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE Detalle_Servicios.idAtencion = _idatencion
	GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_detalle_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_detalle_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_detalle_pagos`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,
	personas.nombres,personas.apellidoMaterno, personas.apellidoPaterno,
	personas.numeroDocumento,YEAR(CURDATE()) - YEAR(personas.fechaNacimiento) AS 'Edad',
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

/* Procedure structure for procedure `spu_devolucion_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_devolucion_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_devolucion_pagos`(
IN _idAtencion INT,
IN _descripcion VARCHAR(200)
)
BEGIN 
	UPDATE pagos SET
		tipoMovimiento = 'D',
		descripcionGasto = _descripcion,
		fechaDevolucion = NOW()
	WHERE idAtencion = _idAtencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_doctor_agregar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_doctor_agregar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_doctor_agregar`(
IN _idDetalleatencion INT,
IN _examenGeneral VARCHAR(2000),
IN _frecuencia CHAR(1)
)
BEGIN
	UPDATE Detalle_Atenciones SET
		examenGeneral = _examenGeneral,
		frecuencia = _frecuencia
	WHERE idDetalleAtenciones = _idDetalleatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_doctor_agregar_enfermedad` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_doctor_agregar_enfermedad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_doctor_agregar_enfermedad`(
IN _idEnfermedad INT,
IN _idDetalleatencion INT
)
BEGIN
	INSERT INTO Enfermedad_Pacientes (idEnfermedad, idDetalleAtencion) VALUES
	(_idEnfermedad, _idDetalleatencion);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_estadoCambiar_Pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_estadoCambiar_Pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_estadoCambiar_Pagos`(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '1'
		WHERE idAtencion = _idatencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_filtro_doctores` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_doctores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_doctores`(
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

/* Procedure structure for procedure `spu_filtro_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_filtro_servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_filtro_servicios`(
	IN _idServicio INT 
)
BEGIN 
	SELECT Servicios.idServicio, servicios.nombreServicio, servicios_detalle.idservicios_detalle, servicios_detalle.descripcion, servicios_detalle.precio, servicios_detalle.genero
	FROM Servicios
	INNER JOIN servicios_detalle ON servicios_detalle.idServicio = Servicios.idServicio 
	WHERE Servicios.idServicio = _idServicio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_gastos_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_gastos_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_gastos_pagos`(
IN _medioPago		INT,
IN _descripcion	VARCHAR(200),
IN _monto			DECIMAL(7,2)
)
BEGIN
	INSERT INTO pagos(tipoMovimiento, idMedioPago, descripcionGasto, monto) VALUES
	('E', _medioPago, _descripcion, _monto);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listarDevolucion_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listarDevolucion_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listarDevolucion_pagos`()
BEGIN 
	SELECT * 
	FROM pagos
	WHERE tipoMovimiento = 'D' AND DATE(fechaDevolucion) = CURDATE();
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listarGastos_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listarGastos_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listarGastos_pagos`()
BEGIN 
	SELECT * 
	FROM pagos
	WHERE tipoMovimiento = 'E' AND DATE(fechaHora) = CURDATE();
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_alergias` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_alergias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_alergias`()
BEGIN 
	SELECT * FROM alergias;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_atenciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_atenciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_atenciones`()
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
	WHERE DATE(atenciones.fechaCreacion) = CURDATE()  -- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY Dia DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_Atenciones_triaje_dni` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_Atenciones_triaje_dni` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_Atenciones_triaje_dni`(IN _numeroDocumento VARCHAR(12))
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

/* Procedure structure for procedure `spu_listar_detalles_atenciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_detalles_atenciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_detalles_atenciones`(
IN _numeroDocumento VARCHAR(12)
)
BEGIN
	SELECT DATE(Detalle_Atenciones.fechaCreacion) AS fecha
	FROM Detalle_Atenciones
	INNER JOIN Historias_Clinicas ON Historias_Clinicas.idHistoriaClinica = Detalle_Atenciones.idHistoria
	INNER JOIN personas ON personas.idPersona = Historias_Clinicas.idPersona
	WHERE personas.numeroDocumento = _numeroDocumento
	ORDER BY Detalle_Atenciones.`idDetalleAtenciones` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_detalle_servicio` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_detalle_servicio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_detalle_servicio`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion,detalle_servicios.idDetalleServicio, servicios.nombreServicio,servicios_detalle.descripcion,
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

/* Procedure structure for procedure `spu_listar_espcialistas_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_espcialistas_servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_espcialistas_servicios`( 
IN _idservicio INT 
)
BEGIN 
	SELECT idEspecialistasServicios,
	CONCAT(servicios.nombreservicio, ' - ',
	personas.apellidoPaterno, ' ',
	personas.nombres) AS 'Nombre Completo'
	FROM especialistas_servicios
	INNER JOIN servicios ON servicios.idservicio = especialistas_servicios.`idServicio`
	INNER JOIN especialistas ON especialistas.idespecialista = especialistas_servicios.`idEspecialista`
	INNER JOIN personas ON personas.`idPersona` = especialistas.`idPersona`
	WHERE especialistas_servicios.`idServicio` = _idservicio;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_especialidades` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_especialidades` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_especialidades`()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "E";
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_especialistas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_especialistas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_especialistas`(
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

/* Procedure structure for procedure `spu_listar_historiasClinicasTodo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_historiasClinicasTodo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_historiasClinicasTodo`()
BEGIN
	SELECT historias_clinicas.`idHistoriaClinica`,personas.`numeroDocumento`, personas.`nombres`, personas.`apellidoPaterno`, personas.`apellidoMaterno`
	FROM historias_clinicas
	INNER JOIN personas ON personas.`idPersona` = historias_clinicas.`idPersona`
	ORDER BY historias_clinicas.`idHistoriaClinica` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_historias_clinicas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_historias_clinicas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_historias_clinicas`(
IN _numeroDocumento VARCHAR(12)
)
BEGIN
	SELECT *
	 FROM Historias_Clinicas
	INNER JOIN personas ON personas.`idPersona` = Historias_Clinicas.idpersona
	WHERE personas.`numeroDocumento` = _numeroDocumento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_metodospago` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_metodospago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_metodospago`()
BEGIN
	SELECT *
	FROM Medio_Pagos;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_servicios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_servicios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_servicios`()
BEGIN 
	SELECT *
	FROM Servicios;
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

/* Procedure structure for procedure `spu_obtenerDevolucion_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtenerDevolucion_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtenerDevolucion_pagos`(
IN _idAtencion INT
)
BEGIN 
	SELECT CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno) AS 'Paciente',
		per.numeroDocumento,
	       ser.nombreServicio AS 'Servicio',
	       SUM(pag.monto) AS 'MontoTotal'
	FROM Pagos pag
	INNER JOIN Atenciones ate ON pag.idAtencion = ate.idAtencion
	INNER JOIN Personas per ON ate.idPersona = per.idPersona
	INNER JOIN Detalle_Servicios det_ser ON ate.idAtencion = det_ser.idAtencion
	INNER JOIN servicios_detalle ser_det ON det_ser.idservicios_detalle = ser_det.idservicios_detalle
	INNER JOIN Servicios ser ON ser_det.idservicio = ser.idServicio
	WHERE ate.idAtencion = _idAtencion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_pagar_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_pagar_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_pagar_pagos`(
IN _idatencion 	INT,
IN _idmediopago	INT,
IN _monto			DECIMAL(7,2)
)
BEGIN 
	INSERT INTO pagos (idatencion, idMedioPago, monto, tipoMovimiento) VALUES
	(_idatencion, _idmediopago, _monto, 'I');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_persona` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_persona` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_persona`(
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

/* Procedure structure for procedure `spu_servicios_detalles` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_servicios_detalles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_servicios_detalles`(
IN _idservicios_detalle INT
)
BEGIN
    DECLARE _idatencion INT;
    
    SELECT idAtencion INTO _idatencion FROM atenciones ORDER BY idatencion DESC LIMIT 1;
    
    INSERT INTO Detalle_Servicios (idservicios_detalle, idAtencion) VALUES
    (_idservicios_detalle, _idatencion);
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
