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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `alergias` */

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
  PRIMARY KEY (`idAtencion`),
  KEY `fk_usuario_ate` (`idUsuario`),
  KEY `fk_fami_ate` (`idFamiliar`),
  KEY `fk_per_ate` (`idPersona`),
  CONSTRAINT `fk_fami_ate` FOREIGN KEY (`idFamiliar`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_per_ate` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  CONSTRAINT `fk_usuario_ate` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `atenciones` */

insert  into `atenciones`(`idAtencion`,`turno`,`numeroAtencion`,`fechaCreacion`,`fechaActualizacion`,`parentesco`,`estado`,`idUsuario`,`ordenDoctor`,`idFamiliar`,`idPersona`) values 
(1,'T','300920230001','2023-09-30 17:12:27',NULL,NULL,'0',1,NULL,NULL,23);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_atenciones` */

insert  into `detalle_atenciones`(`idDetalleAtenciones`,`peso`,`talla`,`frecuenciaCardiaca`,`frecuenciaRespiratoria`,`presionArterial`,`temperatura`,`saturacionOxigeno`,`examemGeneral`,`frecuencia`,`fechaCreacion`,`fechaActualizacion`,`idHistoria`,`idAtencion`,`idUsuario`) values 
(5,60.00,163,'20x1','20x2','20x3',30.90,127,NULL,'p','2023-09-25 00:00:00',NULL,1,1,1),
(6,60.00,163,'20x1','20x2','20x3',30.90,127,NULL,'p','2023-09-26 00:00:00',NULL,1,1,1),
(7,66.80,163,'10x1','10x2','10x3',33.90,100,NULL,'p','2023-09-30 17:13:12',NULL,1,1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_servicios` */

insert  into `detalle_servicios`(`idDetalleServicio`,`idservicios_detalle`,`idAtencion`) values 
(1,127,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `historias_clinicas` */

insert  into `historias_clinicas`(`idHistoriaClinica`,`antecedentePersonal`,`antecedenteFamiliar`,`antecedenteQuirurgico`,`antecedenteOtro`,`idUsuario`,`idPersona`) values 
(1,NULL,NULL,NULL,NULL,1,23),
(2,NULL,NULL,NULL,NULL,1,24);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pagos` */

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idPersona`,`nombres`,`apellidoPaterno`,`apellidoMaterno`,`tipoDocumento`,`numeroDocumento`,`fechaNacimiento`,`genero`,`telefono`,`fechaCreacion`,`fechaFin`,`estado`) values 
(1,'Juan','Quispe','Acevedo','N','98745632','2003-01-01','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(2,'Ana','Carbajal','Loyola','N','12546321','2000-01-16','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(3,'Juana','Uceda','Ramos','N','32145632',NULL,'F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(4,'Francisca','Ureña','Luna','N','96336987',NULL,'F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(5,'Benito','Martinez','Alfaro','N','95115978',NULL,'M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(6,'Laura','Polo','Manrique','N','74114789',NULL,'F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(7,'Maria','Cardenas','Almeyda','N','21876187','1987-10-11','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(8,'Yenny','Roman','Meneses','N','21854071','1990-09-08','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(9,'Williams','Moriano','Peña','N','72755127','2005-02-01','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(10,'Florentina','Peña','Diaz','N','21818841','1948-04-05','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(11,'Bruce','Tasayco','Almeyda','N','21874458','1976-11-05','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(12,'Maria','Robles','Sanchez','N','80042948','1972-10-05','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(13,'Luis','Chumpitaz','Torres','N','90160962','1967-08-01','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(14,'Adolfo','Magallanes','Gonzales','N','21860263','1970-08-01','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(15,'Hilda','Napa','Pachas','N','41869880','1985-02-01','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(16,'Ramon','Apolaya','Sotelo','N','21789377','1960-05-08','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(17,'Florentina','Salcedo','Sucantaipe','N','15412063','1965-04-03','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(18,'Ysabel','Conde','Castilla','N','40516544','1960-06-08','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(19,'Maria Fernanda','Carhualloclla','Crisostomo','N','71479678','1996-03-08','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(20,'Gustavo Alonso','Carbajal','Quispe','N','76582497','1984-08-08','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(21,'Angelica','Diaz','Pachas','N','61060072','1986-02-02','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(22,'Irene','Suarez','Matias','N','76364010','2002-01-31','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(23,'Johan','Luque','Ramos','N','71789712','2003-02-24','M',NULL,'2023-09-30 17:10:52',NULL,'1'),
(24,'Anny','Cabrera','Napa','N','71788436','2003-07-16','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(25,'Carol Nichol','Canchari','Silvestre','N','21884566','1978-08-08','F',NULL,'2023-09-30 17:10:52',NULL,'1'),
(26,'Rosa Luz','Vizarreta','De Mendoza','N','21800841','1962-03-03','F',NULL,'2023-09-30 17:10:52',NULL,'1');

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
  PRIMARY KEY (`idservicios_detalle`),
  KEY `fk_idservicios_serdet` (`idservicio`),
  CONSTRAINT `fk_idservicios_serdet` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `servicios_detalle` */

insert  into `servicios_detalle`(`idservicios_detalle`,`idservicio`,`descripcion`,`precio`) values 
(127,1,'ANCA (Elisa)',100.00),
(128,1,'Aglutinaciones en lamina y en tubo',15.00),
(129,1,'ANTI ATG(Anti tiroglobulina)(tiroides autoinmune)',85.00),
(130,1,'ANTI CARDIOLIPINA lg M',100.00),
(131,1,'ANTI CARDIOLIPINA lg G',100.00),
(132,1,'ANTI-CPP(Peptido Ciclico Cirulano) lg G',230.00),
(133,1,'ANTI DNA-DS',160.00),
(134,1,'ANTIESTREPTOLISINA O (ASO)-Cualitativa',15.00),
(135,1,'ANTIESTREPTOLISINA O (ASO)-Cuantitativo',45.00),
(136,1,'ASMA (ANTI MITOCONDRIALES)',100.00),
(137,1,'ASMA (ANTI MUSCULO LISO)',100.00),
(138,1,'ANA(ANTICUERPOS ANTINUCLEARES)',240.00),
(139,1,'BETA HCG CUANTITATIVO(Semana de gestación)',35.00),
(140,1,'BETA HCG CUALITATIVO',18.00),
(141,1,'CHLAMYDIA TRACHOMATIS lg G',100.00),
(142,1,'CHLAMYDIA TRACHOMATIS lg M',100.00),
(143,1,'CITOMEGALOVIRUS lg G',60.00),
(144,1,'CITOMEGALOVIRUS lg M',60.00),
(145,1,'DESPISTAJE ALERGICO',280.00),
(146,1,'EPSTEIN BAR VIRUS (EBNA lg G)',85.00),
(147,1,'EPSTEIN BAR VIRUS (EBNA lg M)',85.00),
(148,1,'EPSTEIN BAR VIRUS (VCA lg G)',90.00),
(149,1,'FACTOR REUMATOIDEO CUALITATIVO',15.00),
(150,1,'FACTOR REUMATOIDEO CUANTITATIVO',60.00),
(151,1,'HELICOBACTER PILORI lg G',60.00),
(152,1,'HELICOBACTER PILORI lg M',60.00),
(153,1,'HEPATITIS A lg M',55.00),
(154,1,'HEPATITIS B (HBSAG CORE TOTAL)',80.00),
(155,1,'HEPATITIS B (HBSAG)',40.00),
(156,1,'HEPATITIS C',80.00),
(157,1,'HEPATITIS D',100.00),
(158,1,'HERPES I lg G',60.00),
(159,1,'HERPES I lg M',60.00),
(160,1,'HERPES II lg G',60.00),
(161,1,'HERPES II lg M',60.00),
(162,1,'HIDATIDOSIS(ELISA)',80.00),
(163,1,'HIDATIDOSIS(WETERN BLOT)',230.00),
(164,1,'HTLV I-II ANTICUERPOS',211.00),
(165,1,'VIH (ELISA)',45.00),
(166,1,'VIH PRUEBA RAPIDA',30.00),
(167,1,'VDRL',15.00),
(168,1,'VDRL CUANTITATIVO',40.00),
(169,1,'INMUNOGLOBINA SERICA IG E (alergía)',100.00),
(170,1,'PROTEÍNA C REACTIVA (PCR)- CUALITATIVO',20.00),
(171,1,'PROTEÍNA C REACTIVA (PCR)- CUANTITATIVO',60.00),
(172,1,'RUBEOLA Ig G',60.00),
(173,1,'RUBEOLA lg M',60.00),
(174,1,'SIFILIS ELISA VDRL CUANTITATIVO',60.00),
(175,1,'TOXOPLASMA lg G',60.00),
(176,1,'TOXOPLASMA lg M',60.00),
(177,1,'ACTH',100.00),
(178,1,'CORTISOL (AM o PM)',60.00),
(179,1,'DHEA-S (DEHIDROEPIANDROSTERONA)',180.00),
(180,1,'ESTRADIOL',80.00),
(181,1,'ESTRADIOL LIBRE',80.00),
(182,1,'FSH',60.00),
(183,1,'INSULINA BASAL',65.00),
(184,1,'INSULINA CURVA O TOLERANCIA',120.00),
(185,1,'LH',65.00),
(186,1,'PARATOHORMONAS (PTH)',135.00),
(187,1,'PROGESTERONA',60.00),
(188,1,'PROLACTINA',60.00),
(189,1,'PROLACTINAL POOL',100.00),
(190,1,'T3 LIBRE',60.00),
(191,1,'T3 (TRIODOTIRONINA)',60.00),
(192,1,'T4 LIBRE',60.00),
(193,1,'T4 (TIROXINA)',45.00),
(194,1,'TESTOSTERONA TOTAL',60.00),
(195,1,'TESTOSTERONA LIBRE',60.00),
(196,1,'TSH ULTRA SENSIBLE',35.00),
(197,1,'ALFA FETO PROTEINA (AFP)',80.00),
(198,1,'CEA (ANTIGENO CARCINO EMBRIONARIO)',65.00),
(199,1,'CA 125 (OVARIO)',80.00),
(200,1,'CA 15-3 (MAMA)',85.00),
(201,1,'CA 72-4',140.00),
(202,1,'CA 19-9 (PANCREAS)',125.00),
(203,1,'PSA TOTAL (PROSTATA)',60.00),
(204,1,'PSA LIBRE (PROSTATA)',60.00),
(205,1,'CALCITONINA',130.00),
(206,1,'BETA 2 MICROGLOBULINA SERICA',110.00),
(207,1,'CYFRA 21-1',130.00),
(208,1,'PAPANICOLAU',35.00),
(209,1,'BIOPSIAS (Endometrio, cuello uterino, piel)',320.00),
(210,1,'BIOPSIAS (Hepatica, Renal, Pleural)',320.00),
(211,1,'BIOPSIA PEQUEÑA (gastrica, duodenal, colonica, esofagica, rectal, anal)',240.00),
(212,1,'BIOPSIAS MEDIANA (vesicula biliar, apendice, cecal, restos endouterinos)',280.00),
(213,1,'TUMORES(Mamas,lipomas, partes blandas)',200.00),
(214,1,'UTERO SIN ANEXOS',250.00),
(215,1,'UTERO CON ANEXOS',320.00),
(216,1,'PROSTATA',200.00),
(217,1,'BLOCK CELL',100.00),
(218,1,'Hemograma completo',30.00),
(219,1,'Hematocrito',10.00),
(220,1,'Hemoglobina',10.00),
(221,1,'Grupo Sanguíneo',15.00),
(222,1,'Recuento de Plaquetas',15.00),
(223,1,'Lamina periferíca',15.00),
(224,1,'VSG (Velocidad de sedimentación globular)',10.00),
(225,1,'Gota gruesa (Malaria)',15.00),
(226,1,'Constante Corpusculares',25.00),
(227,1,'Recuento de Reticulocitos (Globulos Rojos)',15.00),
(228,1,'Celulas L.E. (Lupues eritematoso)',20.00),
(229,1,'Tiempo de coagulacion y sangría',10.00),
(230,1,'Tiempo de Protrombina-INR',40.00),
(231,1,'Tiempo Parcial y Tromboplastina (APTT)',40.00),
(232,1,'Fibrinogeno',40.00),
(233,1,'Coombs directo',50.00),
(234,1,'Coombs indirecto',50.00),
(235,2,'Abdominal',60.00),
(236,2,'Pelvica',80.00),
(237,2,'Cervical',50.00),
(238,2,'Obstetrica',70.00),
(239,3,'Abdominal',60.00),
(240,3,'Torax',50.00),
(241,3,'Mano',50.00),
(242,3,'Columna lumbosacra',80.00),
(243,4,'Curación de herida',40.00),
(244,4,'Inyectable',7.00),
(245,4,'Control de glicemia',20.00),
(246,4,'Intramuscular',30.00),
(247,9,'Consulta',30.00),
(248,10,'Consulta',40.00),
(249,11,'Consulta',40.00),
(250,12,'Consulta',50.00),
(251,13,'Consulta',40.00),
(252,13,'Revision general',50.00);

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
(1,'JuanQ','123','A','2023-09-30 17:10:52',NULL,'1',1),
(2,'AnaC','1','A','2023-09-30 17:10:52',NULL,'1',2),
(3,'JuanaU','','A','2023-09-30 17:10:52',NULL,'1',3);

/* Procedure structure for procedure `spu_admision_atenciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_admision_atenciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_admision_atenciones`(
IN _turno		CHAR(1),
IN _idusuario 	INT,
IN _idpersona 	INT,
IN _idfamiliar 	INT,
IN _parentesco 	VARCHAR(100),
IN _orden 	INT
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
	(turno, numeroAtencion, parentesco, OrdenDoctor, idUsuario, idFamiliar, idPersona) VALUES
	(_turno, _numAtencion, _parentesco, _orden, _idusuario, _idfamiliar, _idpersona);
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
		YEAR(CURDATE()) - YEAR(`fechaNacimiento`) AS 'Edad'
	FROM personas
	WHERE `numeroDocumento` = _numeroDocumento;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_detalle_pagos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_detalle_pagos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_detalle_pagos`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,
	personas.nombres,personas.`apellidoMaterno`, personas.`apellidoPaterno`,
	personas.`numeroDocumento`,YEAR(CURDATE()) - YEAR(personas.`fechaNacimiento`) AS 'Edad',
	personas.`telefono`
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE Detalle_Servicios.idAtencion = _idatencion
	GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;
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
	personas.nombres) AS 'Nombre Completo'
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
	SELECT Servicios.idServicio, servicios.nombreServicio, servicios_detalle.idservicios_detalle, servicios_detalle.descripcion, servicios_detalle.precio
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
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total,
		 atenciones.estado
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaCreacion) = CURDATE()  -- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY Dia;
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
	order by Detalle_Atenciones.`idDetalleAtenciones` desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_detalle_servicio` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_detalle_servicio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_detalle_servicio`( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion,detalle_servicios.`idDetalleServicio`, servicios.nombreServicio,servicios_detalle.`descripcion`,
	personas.`telefono`,servicios_detalle.precio AS 'total'
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE detalle_servicios.`idAtencion` = _idatencion;
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

/* Procedure structure for procedure `spu_listar_historias_clinicas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_historias_clinicas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_historias_clinicas`(
in _numeroDocumento varchar(12)
)
begin
	select *
	 from Historias_Clinicas
	inner join personas on personas.`idPersona` = Historias_Clinicas.idpersona
	where personas.`numeroDocumento` = _numeroDocumento;
end */$$
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
				SUM(servicios_detalle.precio) AS 'Total'
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
