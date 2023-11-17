-- consulta para vista de doctores VERSION 1
DELIMITER $$
CREATE PROCEDURE SPU_DOCTORES_LISTAR
(
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
END $$

DELIMITER $$
CREATE PROCEDURE SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA
(
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
END$$

-- CALL SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA(1,'tos','dolor de cabeza','inicio esta semana', 'no se', 'no se x2','Descanso 2 dias', '')
DELIMITER $$
CREATE PROCEDURE spu_doctores_detalle_tratamiento
(
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
END$$
-- select * from Detalle_Atenciones
-- select * from Tratamiento_paciente
-- CALL spu_doctores_detalle_tratamiento(1,'Amoxicilina','Jarabe','2','5 cucharadas','2');
-- BUSCAR ENFERMEDAD
DELIMITER$$
CREATE PROCEDURE spu_doctores_buscar_enfermedad
(
IN _codigoCie_10 VARCHAR(10)
)
BEGIN
	SELECT idEnfermedad,codigoCie_10, descripcion FROM enfermedades
	WHERE Enfermedades.codigoCie_10 = _codigoCie_10;
END$$
-- CALL spu_doctores_buscar_enfermedad('C00-D48');

-- REGISTRAR ENFERMEDADES
DELIMITER $$
CREATE PROCEDURE spu_doctor_agregar_enfermedad
(
IN _idEnfermedad INT,
IN _idDetalleAtencion INT
)
BEGIN
	INSERT INTO Enfermedad_Pacientes(idEnfermedad, idDetalleAtencion) VALUES
	(_idEnfermedad, _idDetalleAtencion);
END$$

-- vista para servicios
DELIMITER $$
CREATE PROCEDURE SPU_DOCTORES_LISTAR_SERVICIOS
(
)
BEGIN
	SELECT  ate.idAtencion,ate.numeroAtencion,
		CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'ApellidosNombres'
	FROM atenciones ate
	INNER JOIN personas per ON per.idPersona = ate.idPersona
	LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
	INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
	WHERE ate.estado = 1 AND ser.tipo = 'S'
	AND ate.fechaAtencion = CURDATE()
	ORDER BY  ate.idAtencion;
END $$
-- CALL spu_doctor_agregar_enfermedad(6,2)
-- select * from Tratamiento_paciente
-- select * from enfermedades