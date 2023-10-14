USE sisPSolidario;

-- Admision
DELIMITER $$
CREATE PROCEDURE spu_admision_atenciones
(
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
END $$

-- detalles de la atencion
DELIMITER $$
CREATE PROCEDURE spu_servicios_detalles
(
IN _idservicios_detalle INT
)
BEGIN
    DECLARE _idatencion INT;
    
    SELECT idAtencion INTO _idatencion FROM atenciones ORDER BY idatencion DESC LIMIT 1;
    
    INSERT INTO Detalle_Servicios (idservicios_detalle, idAtencion) VALUES
    (_idservicios_detalle, _idatencion);
END $$


DELIMITER $$
CREATE PROCEDURE spu_buscar_personas
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_especialistas
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_espcialistas_servicios
( 
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
END $$

-- LISTAR ATENCIONES
DELIMITER $$
CREATE PROCEDURE spu_listar_atenciones()
BEGIN 
	SELECT
		atenciones.idAtencion,
		 atenciones.fechaCreacion AS Dia,
		 PP.nombres,
		 PP.apellidoPaterno,
		 PP.apellidoMaterno,
		 servicios.idServicio,
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaCreacion) = CURDATE()  -- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY Dia DESC;
END $$

-- INFORMACION PARA EL MODAL DE CAJA POR ATENCIÓN
DELIMITER $$
CREATE PROCEDURE spu_obtenerDatos_atencion
(
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
END $$

-- SERVICIOS: LISTAR
DELIMITER $$
CREATE PROCEDURE spu_listar_servicios()
BEGIN 
	SELECT *
	FROM Servicios;
END $$

-- SERVICIOS DETALLE = FILTRO POR SERVICIO
DELIMITER $$
CREATE PROCEDURE spu_filtro_servicios
(
	IN _idServicio INT 
)
BEGIN 
	SELECT Servicios.idServicio, servicios.nombreServicio, servicios_detalle.idservicios_detalle, servicios_detalle.descripcion, servicios_detalle.precio, servicios_detalle.genero
	FROM Servicios
	INNER JOIN servicios_detalle ON servicios_detalle.idServicio = Servicios.idServicio 
	WHERE Servicios.idServicio = _idServicio;
END $$

-- Registrar Paciente
DELIMITER $$
CREATE PROCEDURE spu_registrar_persona
(
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
END$$

-- CAJA
DELIMITER $$
CREATE PROCEDURE spu_pagar_pagos
(
IN _idatencion 	INT,
IN _idmediopago	INT,
IN _monto			DECIMAL(7,2)
)
BEGIN 
	INSERT INTO pagos (idatencion, idMedioPago, monto, tipoMovimiento) VALUES
	(_idatencion, _idmediopago, _monto, 'I');
END $$

DELIMITER $$
CREATE PROCEDURE spu_estadoCambiar_Pagos
(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '1'
		WHERE idAtencion = _idatencion;
END $$

DELIMITER $$
CREATE PROCEDURE spu_gastos_pagos
(
IN _medioPago		INT,
IN _descripcion	VARCHAR(200),
IN _monto			DECIMAL(7,2)
)
BEGIN
	INSERT INTO pagos(tipoMovimiento, idMedioPago, descripcionGasto, monto) VALUES
	('E', _medioPago, _descripcion, _monto);
END $$

-- Triaje
DELIMITER $$
CREATE PROCEDURE spu_triaje_Nueva_historiaClinica
(
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
	
END$$
-- call spu_triaje_Nueva_historiaClinica(23,1, null, null,null, null);

DELIMITER $$
CREATE PROCEDURE spu_triaje_agregar_alergias
(
IN _idHistoriaClinica INT,
IN _idAlergia INT
)
BEGIN 
	INSERT INTO Detalle_Alergias(idHistoriaClinica, idAlergia) VALUES
	(_idHistoriaClinica, _idAlergia);
END $$

DELIMITER $$
CREATE PROCEDURE spu_triaje_agregar_triaje
(
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_doctor_agregar
(
IN _idDetalleatencion INT,
IN _examenGeneral VARCHAR(2000),
IN _frecuencia CHAR(1)
)
BEGIN
	UPDATE Detalle_Atenciones SET
		examenGeneral = _examenGeneral,
		frecuencia = _frecuencia
	WHERE idDetalleAtenciones = _idDetalleatencion;
END$$


DELIMITER $$
CREATE PROCEDURE spu_doctor_agregar_enfermedad
(
IN _idEnfermedad INT,
IN _idDetalleatencion INT
)
BEGIN
	INSERT INTO Enfermedad_Pacientes (idEnfermedad, idDetalleAtencion) VALUES
	(_idEnfermedad, _idDetalleatencion);
END$$

-- listar pagos
DELIMITER $$ 
CREATE PROCEDURE spu_listar_metodospago()
BEGIN
	SELECT *
	FROM Medio_Pagos;
END $$

-- detalle de venta
DELIMITER $$ 
CREATE PROCEDURE spu_detalle_pagos( IN _idatencion INT)
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
END $$

DELIMITER $$ 
CREATE PROCEDURE spu_listar_detalle_servicio( IN _idatencion INT)
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
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_detalles_atenciones
(
IN _numeroDocumento VARCHAR(12)
)
BEGIN
	SELECT DATE(Detalle_Atenciones.fechaCreacion) AS fecha
	FROM Detalle_Atenciones
	INNER JOIN Historias_Clinicas ON Historias_Clinicas.idHistoriaClinica = Detalle_Atenciones.idHistoria
	INNER JOIN personas ON personas.idPersona = Historias_Clinicas.idPersona
	WHERE personas.numeroDocumento = _numeroDocumento
	ORDER BY Detalle_Atenciones.`idDetalleAtenciones` DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_historias_clinicas
(
IN _numeroDocumento VARCHAR(12)
)
BEGIN
	SELECT *
	 FROM Historias_Clinicas
	INNER JOIN personas ON personas.`idPersona` = Historias_Clinicas.idpersona
	WHERE personas.`numeroDocumento` = _numeroDocumento;
END $$


DELIMITER $$
CREATE PROCEDURE spu_listar_especialidades()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "E";
END$$

-- Listar doctores por especialidad
DELIMITER$$
CREATE PROCEDURE spu_filtro_doctores
(
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
END$$

DELIMITER $$ 
CREATE PROCEDURE spu_detalle_atencion( IN _idatencion INT)
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
END $$

-- LISTAR TODAS LAS HISTORIAS CLINICAS
DELIMITER $$
CREATE PROCEDURE spu_listar_historiasClinicasTodo()
BEGIN
	SELECT historias_clinicas.`idHistoriaClinica`,personas.`numeroDocumento`, personas.`nombres`, personas.`apellidoPaterno`, personas.`apellidoMaterno`
	FROM historias_clinicas
	INNER JOIN personas ON personas.`idPersona` = historias_clinicas.`idPersona`
	ORDER BY historias_clinicas.`idHistoriaClinica` DESC;
END$$

-- LISTAR ALERGIAS
DELIMITER $$
CREATE PROCEDURE spu_listar_alergias()
BEGIN 
	SELECT * FROM alergias;
END $$

-- listar gastos 
DELIMITER $$
CREATE PROCEDURE spu_listarGastos_pagos()
BEGIN 
	SELECT * 
	FROM pagos
	WHERE tipoMovimiento = 'E' AND DATE(fechaHora) = CURDATE();
END $$

-- registrar devolucion
DELIMITER $$ 
CREATE PROCEDURE spu_devolucion_pagos
(
IN _idAtencion INT,
IN _descripcion VARCHAR(200)
)
BEGIN 
	UPDATE pagos SET
		tipoMovimiento = 'D',
		descripcionGasto = _descripcion,
		fechaDevolucion = NOW()
	WHERE idAtencion = _idAtencion;
END $$
-- listar devoluciones
DELIMITER $$
CREATE PROCEDURE spu_listarDevolucion_pagos()
BEGIN 
	SELECT * 
	FROM pagos
	WHERE tipoMovimiento = 'D' AND DATE(fechaDevolucion) = CURDATE();
END $$

-- traer datos para devolucion
DELIMITER $$
CREATE PROCEDURE spu_listarDevolucion_pagos
(
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
END $$

-- listar atenciones por dni 
DELIMITER $$
CREATE PROCEDURE spu_listar_Atenciones_triaje_dni(IN _numeroDocumento VARCHAR(12))
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
END $$
