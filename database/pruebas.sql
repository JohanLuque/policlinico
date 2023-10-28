SELECT detAte.idDetalleAtenciones, 
FROM detalle_atenciones detAte
INNER JOIN atenciones ate ON ate.idAtencion = detAte.idAtencion
LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
WHERE ate.estado = 1 AND ser.tipo = 'E' AND ser.idServicio = 21
ORDER BY  ate.idAtencion


SELECT * FROM atenciones

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
	WHERE atenciones.estado = '1' AND servicios.tipo = 'E' AND atenciones.fechaAtencion = CURDATE() 
	GROUP BY Detalle_Servicios.idatencion
	ORDER BY dia DESC;