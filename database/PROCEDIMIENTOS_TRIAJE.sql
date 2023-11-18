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
IN _talla	TINYINT,
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
END $$

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

-- triaje realizados 
-- Atrapar alergias por historia clinica
DELIMITER $$
CREATE PROCEDURE spu_triaje_atraparAlergias_xid
(
IN _idHistoria INT
)
BEGIN
	SELECT idDetalleAlergia, idHistoriaClinica,
	alergias.alergia
	FROM detalle_alergias
	INNER JOIN alergias ON alergias.idAlergia = detalle_alergias.idAlergia
	WHERE idHistoriaClinica = _idHistoria;
END $$

-- listar los triajes realizados por dias
DELIMITER $$
CREATE PROCEDURE spu_triaje_listar_hecho()
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
END $$

-- listar triaje del dia para reporte
DELIMITER $$
CREATE PROCEDURE spu_triaje_reporte
(
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
END $$