CREATE DATABASE sisPSolidario;
USE sisPSolidario;
-- -----------------------------

CREATE TABLE Personas
(
idPersona 	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombres		VARCHAR(100)	NOT NULL,
apellidoPaterno	VARCHAR(50)	NOT NULL,
apellidoMaterno VARCHAR(50)	NOT NULL,
tipoDocumento	CHAR(1)		NOT NULL,
numeroDocumento	VARCHAR(12) 	NOT NULL,
fechaNacimiento	DATE 		NULL,
genero		CHAR(1)		NULL,
telefono	CHAR(9)		NULL,
distrito	VARCHAR(100)	NULL,
fechaCreacion	DATETIME 	NOT NULL DEFAULT NOW(),
fechaFin 	DATETIME	NULL,
estado		CHAR(1)		NULL DEFAULT '1',
CONSTRAINT uk_numeroDocumento_per UNIQUE(numeroDocumento)
)ENGINE = INNODB;

CREATE TABLE Medio_Pagos
(
idMedioPago	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombrePago	VARCHAR(100) 	NOT NULL,
CONSTRAINT uk_nombrePago_mps UNIQUE(nombrePago)
)ENGINE = INNODB;

CREATE TABLE Alergias
(
idAlergia	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
alergia		VARCHAR(100)	NOT NULL,
CONSTRAINT uk_alergias_ale UNIQUE(alergia)
)ENGINE = INNODB;

CREATE TABLE Servicios
(
idServicio	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo				CHAR(1)			NOT NULL,
nombreServicio	VARCHAR(100)	NOT NULL,
CONSTRAINT uk_nombreServicio_ser UNIQUE(nombreServicio)
)ENGINE = INNODB;

CREATE TABLE servicios_detalle
(
	idservicios_detalle	INT AUTO_INCREMENT PRIMARY KEY,
	idservicio 				INT NOT NULL,
	descripcion 			VARCHAR(100) NOT NULL,
	precio 					DECIMAL(7,2) NOT NULL,
	genero					CHAR(1) NULL DEFAULT NULL,
	CONSTRAINT fk_idservicios_serdet FOREIGN KEY (idservicio) REFERENCES Servicios(idServicio)	
)ENGINE = INNODB;
CREATE TABLE Enfermedades
(
idEnfermedad		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
codigoCie_10		VARCHAR(10) 	NOT NULL,
descripcion		VARCHAR(200)	NOT NULL,
fechaCreacion		DATETIME	NOT NULL DEFAULT NOW(),
fechaActualizacion	DATETIME 	NULL,
CONSTRAINT uk_codigoCie_enf UNIQUE(codigoCie_10)
)ENGINE = INNODB;

CREATE TABLE Usuarios
(
idUsuario		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombreUsuario		VARCHAR(200)	NOT NULL,
clave			VARCHAR(200)	NOT NULL,
nivelAcceso		CHAR(1)		NOT NULL,
fechaInicio		DATETIME 	NOT NULL DEFAULT NOW(),
fechaFin		DATETIME 	NULL,
estado			CHAR(1)		NOT NULL DEFAULT '1',
idPersona		INT 		NOT NULL,
CONSTRAINT uk_idpersona_usu UNIQUE(idPersona, nivelAcceso),
CONSTRAINT fk_usuarios_usu FOREIGN KEY usuarios(idPersona) REFERENCES Personas(idPersona) 
)ENGINE = INNODB;

CREATE TABLE Especialistas
(
idEspecialista		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
codigo				VARCHAR(10) 	NULL,
estado				CHAR(1)		NOT NULL DEFAULT '1',
idPersona			INT 		NOT NULL,
CONSTRAINT uk_idPersona_esp UNIQUE(idPersona),
CONSTRAINT fk_idPersona_esp FOREIGN KEY Especialistas (idPersona) REFERENCES Personas (idPersona)
)ENGINE = INNODB;

CREATE TABLE Especialistas_Servicios
(
idEspecialistasServicios	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idEspecialista					INT 		NOT NULL,
idServicio						INT 		NOT NULL,
CONSTRAINT uk_idfk_ees UNIQUE (idServicio, idEspecialista),
CONSTRAINT fk_idEspecialista_ees FOREIGN KEY Especialistas_Servicios (idEspecialista) REFERENCES Especialistas (idEspecialista),
CONSTRAINT fk_idServicio_ees FOREIGN KEY Especialistas_Servicios (idServicio) REFERENCES Servicios (idServicio)
)ENGINE = INNODB;

CREATE TABLE Historias_Clinicas
(
idHistoriaClinica			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
antecedentePersonal			VARCHAR(199) 	NULL,
antecedenteFamiliar			VARCHAR(199) 	NULL,
antecedenteQuirurgico 		VARCHAR(199) 	NULL,
antecedenteOtro				VARCHAR(199) 	NULL,
idUsuario					INT 				NOT NULL,
idPersona					INT 				NOT NULL,
CONSTRAINT fk_idUsuario_hcl FOREIGN KEY Historias_Clinicas (idUsuario) REFERENCES Usuarios (idUsuario),
CONSTRAINT fk_idPersona_hcl FOREIGN KEY Historias_Clinicas (idPersona) REFERENCES Personas(idPersona),
CONSTRAINT uk_historia_hcl UNIQUE(idPersona)
)ENGINE = INNODB;

CREATE TABLE Detalle_Alergias
(
idDetalleAlergia	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idAlergia		INT NOT NULL,
idHistoriaClinica	INT NOT NULL,
CONSTRAINT uk_dal_dal  UNIQUE (idAlergia, idHistoriaClinica),
CONSTRAINT fk_idAlergia_dal FOREIGN KEY Detalle_Alergias (idAlergia) REFERENCES Alergias (idAlergia),
CONSTRAINT fk_idHistoriaClinica_dal FOREIGN KEY Detalle_Alergias (idHistoriaClinica) REFERENCES Historias_Clinicas (idHistoriaClinica)
)ENGINE = INNODB;

CREATE TABLE Atenciones
(
idAtencion				INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
turno					CHAR(1) 	NOT NULL,
numeroAtencion				VARCHAR(15)	NOT NULL,
fechaCreacion				DATETIME 	NOT NULL DEFAULT NOW(),
fechaActualizacion			DATETIME 	NULL,
parentesco				VARCHAR(100) 	NULL,
idUsuario				INT 		NOT NULL,
ordenDoctor				VARCHAR(100) 		NULL,
idFamiliar				INT 		NULL,
idPersona				INT 		NOT NULL,
fechaAtencion				DATE		NOT NULL,
estado					CHAR(1)		NOT NULL DEFAULT '0',
atendido				CHAR(1)		NOT NULL DEFAULT '0',
CONSTRAINT fk_usuario_ate FOREIGN KEY Atenciones (idUsuario) REFERENCES Usuarios (idUsuario),
CONSTRAINT fk_fami_ate FOREIGN KEY Atenciones (idFamiliar) REFERENCES Personas (idPersona),
CONSTRAINT fk_per_ate FOREIGN KEY Atenciones (idPersona) REFERENCES Personas (idPersona)
)ENGINE = INNODB;

CREATE TABLE Detalle_Servicios
(
idDetalleServicio		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idservicios_detalle 	INT NOT NULL,
idAtencion				INT 	NOT NULL,
CONSTRAINT fk_idAtencion_dpr FOREIGN KEY Detalle_Servicios (idAtencion) REFERENCES Atenciones (idAtencion),
CONSTRAINT fk_idServicios_detalle_dpr FOREIGN KEY Detalle_Servicios (idservicios_detalle) REFERENCES servicios_detalle (idservicios_detalle)
)ENGINE = INNODB;

CREATE TABLE Detalle_Atenciones
(
idDetalleAtenciones 		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
peso				DECIMAL(5,2) 	NOT NULL,
talla				TINYINT	NOT NULL,
frecuenciaCardiaca		VARCHAR(5)	NOT NULL,
frecuenciaRespiratoria		VARCHAR(5) 	NOT NULL,
presionArterial			VARCHAR(10) 	NOT NULL,
temperatura			DECIMAL(4,1) 	NOT NULL,
saturacionOxigeno		TINYINT 	NOT NULL,
examenGeneral 			VARCHAR(2000) 	NULL,
frecuencia			CHAR(1) 	NULL, -- p= primera vez, d = diario, r = recurrente

inicio				VARCHAR(2000)   NULL,
curso 				VARCHAR(2000)	NULL,
relato				VARCHAR(2000)	NULL,
procedimiento			VARCHAR(2000)	NULL,
observaciones			VARCHAR(2000)	NULL,

fechaCreacion 			DATETIME	NOT NULL DEFAULT NOW(),
fechaActualizacion		DATETIME	NULL,
idHistoria			INT 		NOT NULL,
idAtencion			INT 		NOT NULL,
idUsuario			INT 		NOT NULL,
CONSTRAINT fk_idHistoria_das FOREIGN KEY Detalle_Atenciones (idHistoria) REFERENCES Historias_Clinicas (idHistoriaClinica), 
CONSTRAINT fk_idAtencion_das FOREIGN KEY Detalle_Atenciones (idAtencion) REFERENCES Atenciones (idAtencion), 
CONSTRAINT fk_idusuario_das FOREIGN KEY Detalle_Atenciones (idUsuario) REFERENCES Usuarios (idUsuario)
)ENGINE = INNODB;

CREATE TABLE Pagos
(
idPago						INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
monto							DECIMAL(6,2) 	NOT NULL,
estado						CHAR(1)			NOT NULL DEFAULT '0',
fechaHoraPago				DATETIME			NOT NULL DEFAULT NOW(),
idAtencion					INT 				NULL,
idMedioPago 				INT 				NOT NULL,
idUsuario				INT NOT NULL,
CONSTRAINT fk_idate_pag FOREIGN KEY Pagos (idAtencion) REFERENCES Atenciones (idAtencion),
CONSTRAINT fk_idusuario_pag FOREIGN KEY Detalle_Atenciones (idUsuario) REFERENCES Usuarios (idUsuario),
CONSTRAINT fk_idmep_pag	FOREIGN KEY Pagos	(idMedioPago) REFERENCES Medio_Pagos (idMedioPago)
)ENGINE = INNODB;

CREATE TABLE Devoluciones
(
idDevolucion				INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
montoDevolucion			DECIMAL(6,2) 	NOT NULL,
estado						CHAR(1)			NOT NULL DEFAULT '0',
motivoDevolucion		VARCHAR(100)	NOT NULL,
fechaHoraDevolucion		DATETIME			NOT NULL DEFAULT NOW(),
idAtencion					INT 				NULL,
idMedioPago 				INT 				NOT NULL,
idUsuario				INT NOT NULL,
CONSTRAINT fk_idusuario_dev FOREIGN KEY Detalle_Atenciones (idUsuario) REFERENCES Usuarios (idUsuario),
CONSTRAINT fk_idate_dev FOREIGN KEY Pagos (idAtencion) REFERENCES Atenciones (idAtencion),
CONSTRAINT fk_idmep_dev	FOREIGN KEY Pagos	(idMedioPago) REFERENCES Medio_Pagos (idMedioPago)
)ENGINE = INNODB;

CREATE TABLE Gastos
(
idGasto						INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
descripcionGasto				VARCHAR(200) NOT NULL,
montoGasto					DECIMAL(6,2) 	NOT NULL,
fechaHoraGasto				DATETIME			NOT NULL DEFAULT NOW(),
idPersona					INT 		NOT NULL,
idMedioPago 				INT 				NOT NULL,
idUsuario				INT NOT NULL,
CONSTRAINT fk_idusuario_gas FOREIGN KEY Detalle_Atenciones (idUsuario) REFERENCES Usuarios (idUsuario),
CONSTRAINT fk_per_gas FOREIGN KEY Atenciones (idPersona) REFERENCES Personas (idPersona),
CONSTRAINT fk_idmep_gas	FOREIGN KEY Pagos	(idMedioPago) REFERENCES Medio_Pagos (idMedioPago)
)ENGINE = INNODB;


CREATE TABLE Enfermedad_Pacientes
(
idEnfermedadPaciente		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idEnfermedad				INT NOT NULL,
idDetalleAtencion 		INT NOT NULL,
CONSTRAINT fk_enf_epp FOREIGN KEY Enfermedad_Pacientes (idEnfermedad) REFERENCES Enfermedades (idEnfermedad),
CONSTRAINT fk_det_epp FOREIGN KEY Enfermedad_Pacientes (idDetalleAtencion) REFERENCES Detalle_Atenciones (idDetalleAtenciones)
)ENGINE = INNODB;

CREATE TABLE Tratamiento_paciente
(
idTratamiento 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idDetalleAtencion 		INT NOT NULL,
medicamento			VARCHAR(100)	NOT NULL,
presentacion			VARCHAR(100)	NOT NULL,
cantidad			TINYINT		NOT NULL,
dosis				VARCHAR(100)	NOT NULL,
dias				VARCHAR(50)	NOT NULL,
fechaCreacion 			DATETIME	NOT NULL DEFAULT NOW(),
fechaActualizacion		DATETIME	NULL,
CONSTRAINT fk_det_tp FOREIGN KEY Enfermedad_Pacientes (idDetalleAtencion) REFERENCES Detalle_Atenciones (idDetalleAtenciones)
)ENGINE = INNODB;