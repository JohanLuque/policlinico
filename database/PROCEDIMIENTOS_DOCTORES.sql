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

DELIMITER$$
CREATE SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA
(
IN _idDetalleatencion 	INT,
IN _procedimiento	VARCHAR(200)	NULL,
IN _observaciones	VARCHAR(200)	NULL,
)
BEGIN
	UPDATE Detalle_Atenciones SET
		procedimiento = _procedimiento,
		observaciones = _observaciones
	WHERE idDetalleAtenciones = _idDetalleatencion;
END$$
