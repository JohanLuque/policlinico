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
	AND ate.fechaAtencion = CURDATE() AND (detAte.fechaActualizacion = '' OR detAte.fechaActualizacion IS NULL)
	ORDER BY  ate.idAtencion;
END $$

DELIMITER $$
CREATE PROCEDURE SPU_DOCTORES_OBTENER_DATOS
(
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
END $$

-- CALL SPU_DOCTORES_OBTENER_DATOS(2);
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
		CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'ApellidosNombres', ate.atendido
	FROM atenciones ate
	INNER JOIN personas per ON per.idPersona = ate.idPersona
	LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
	INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
	WHERE ate.estado = 1  AND ser.tipo = 'S'
	AND ate.fechaAtencion = CURDATE()
	ORDER BY ate.`estado`;
END $$
-- Cambiar estado a atendido
DELIMITER $$
CREATE PROCEDURE SPU_DOCTORES_CAMBIAR_ESTADO
(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		atendido = '1'
		WHERE idAtencion = _idatencion;
END $$
-- CALL SPU_DOCTORES_CAMBIAR_ESTADO(6);
-- CALL spu_doctor_agregar_enfermedad(6,2)
-- select * from Tratamiento_paciente
-- select * from enfermedades

-- listar detalles de un paciente
DELIMITER $$
CREATE PROCEDURE spu_doctores_listar_detalles_personas
(
IN _numeroDocumento VARCHAR(12)
)
BEGIN
	SELECT 	Detalle_Atenciones.idDetalleAtenciones, Detalle_Atenciones.fechaCreacion, Historias_clinicas.idHistoriaClinica,
		CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS paciente,
		servicios.nombreServicio
	FROM Detalle_Atenciones
	INNER JOIN Historias_clinicas ON Historias_clinicas.idHistoriaClinica = Detalle_Atenciones.idHistoria
	INNER JOIN personas ON personas.idPersona = Historias_clinicas.idPersona
	INNER JOIN atenciones ON atenciones.idAtencion = detalle_atenciones.idAtencion
	LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE personas.numeroDocumento = _numeroDocumento
	ORDER BY Detalle_Atenciones.idDetalleAtenciones DESC;
END $$

-- ver detalles de atenciones de los pacientes
DELIMITER $$
CREATE PROCEDURE spu_doctores_ver_detalles_pacientes
(
IN _idDetalleAtenciones INT
)
BEGIN
	SELECT  idDetalleAtenciones,
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
		CURDATE() AS fecha,
		inicio, curso, relato, examenGeneral,
		enfermedades.codigoCie_10, enfermedades.descripcion, frecuencia, procedimiento, observaciones
		FROM detalle_atenciones
		INNER JOIN atenciones ON atenciones.idAtencion = detalle_atenciones.idAtencion
		INNER JOIN Historias_Clinicas ON Historias_Clinicas.idHistoriaClinica = detalle_atenciones.idHistoria
		INNER JOIN personas pac ON pac.idPersona = Historias_Clinicas.idPersona
		LEFT JOIN personas fam ON fam.idPersona = atenciones.idfamiliar
		LEFT JOIN Detalle_Alergias ON Detalle_Alergias.idHistoriaClinica = Historias_Clinicas.idHistoriaClinica
		LEFT JOIN Detalle_Servicios ON Detalle_Servicios.idatencion = atenciones.idAtencion
		INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
		INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
		LEFT JOIN Enfermedad_Pacientes ON Enfermedad_Pacientes.idDetalleAtencion = detalle_atenciones.idDetalleAtenciones
		LEFT JOIN Enfermedades ON Enfermedades.idEnfermedad = Enfermedad_Pacientes.idEnfermedad
		WHERE detalle_atenciones.idDetalleAtenciones = _idDetalleAtenciones
		GROUP BY idDetalleAtenciones;
END $$

-- ver tratamientos del detalle de atencion del paciente
DELIMITER $$
CREATE PROCEDURE spu_doctores_ver_tratamientos_pacientes
(
IN _idDetalleAtenciones INT
)
BEGIN 
	SELECT idTratamiento, Tratamiento_paciente.idDetalleAtencion ,medicamento, presentacion, cantidad, dosis, dias
	FROM detalle_atenciones
	LEFT JOIN Tratamiento_paciente ON Tratamiento_paciente.idDetalleAtencion = detalle_atenciones.idDetalleAtenciones
	WHERE Detalle_Atenciones.idDetalleAtenciones = _idDetalleAtenciones
	ORDER BY Tratamiento_paciente.idDetalleAtencion DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_doctores_actualizar_fechaActualizacion
(
IN _idDetalleAtenciones INT
)
BEGIN
	UPDATE Detalle_Atenciones SET
	 fechaActualizacion = NOW()
	 WHERE idDetalleAtenciones = _idDetalleAtenciones;
END $$