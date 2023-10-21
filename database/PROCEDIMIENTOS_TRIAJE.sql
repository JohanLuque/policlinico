-- TRIAJE
-- REGISTRAR TRIAJE
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

-- REGISTRAR ALERGIAS
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

-- REGISTRAR TRIAJE
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

-- REGISTRAR DETALLE DE HISTORIA(DOCTOR)
DELIMITER $$
CREATE PROCEDURE spu_triaje_doctor_agregar
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

-- REGISTRAR ENFERMEDADES
DELIMITER $$
CREATE PROCEDURE spu_triaje_doctor_agregar_enfermedad
(
IN _idEnfermedad INT,
IN _idDetalleatencion INT
)
BEGIN
	INSERT INTO Enfermedad_Pacientes (idEnfermedad, idDetalleAtencion) VALUES
	(_idEnfermedad, _idDetalleatencion);
END$$

-- BUSCAR HISTORIAS CLINICAS
DELIMITER $$
CREATE PROCEDURE spu_triaje_buscar_historias
(
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
END $$

-- LISTAR TODAS LAS HISTORIAS CLINICAS
DELIMITER $$
CREATE PROCEDURE spu_triaje_listar_historias()
BEGIN
	SELECT historias_clinicas.`idHistoriaClinica`,personas.`numeroDocumento`, personas.`nombres`, personas.`apellidoPaterno`, personas.`apellidoMaterno`
	FROM historias_clinicas
	INNER JOIN personas ON personas.`idPersona` = historias_clinicas.`idPersona`
	ORDER BY historias_clinicas.`idHistoriaClinica` DESC;
END$$

-- LISTAR ALERGIAS
DELIMITER $$
CREATE PROCEDURE spu_triaje_listar_alergias()
BEGIN 
	SELECT * FROM alergias;
END $$


-- LISTAR ATENCIONES POR ESPECIALIDAD Y QUE YA ESTEN PAGADOS 
DELIMITER $$
CREATE PROCEDURE spu_triaje_Atenciones_dni(IN _numeroDocumento VARCHAR(12))
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

-- listar triaje en la vista solo los que tienen historia clinica
DELIMITER $$
CREATE PROCEDURE spu_triaje_historia()
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
	WHERE atenciones.estado = '1' AND servicios.tipo = 'E' AND atenciones.fechaAtencion = CURDATE() AND historias_clinicas.idHistoriaClinica IS NOT NULL
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;
END $$

-- obteniendo datos para triaje
DELIMITER $$
CREATE PROCEDURE spu_triaje_obtenerDatos(IN _idAtencion VARCHAR(12))
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
END $$

