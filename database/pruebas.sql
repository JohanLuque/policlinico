-- consulta para vista de doctores
SELECT detAte.`idDetalleAtenciones`,
	CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'ApellidosNombres'
FROM detalle_atenciones detAte
INNER JOIN atenciones ate ON ate.idAtencion = detAte.idAtencion
INNER JOIN personas per ON per.idPersona = ate.idPersona
LEFT JOIN detalle_servicios detSer ON detSer.idAtencion = ate.idAtencion
INNER JOIN servicios_detalle serDet ON serDet.idservicios_detalle = detSer.idservicios_detalle
INNER JOIN Servicios ser ON  ser.idServicio = serDet.idServicio
WHERE ate.estado = 1 AND ser.tipo = 'E' AND ser.idServicio = 12
ORDER BY  ate.idAtencion

-- cantidad de atenciones por dia: INGRESO TOTAL 
SELECT 
    (SELECT COUNT(p.idPago) FROM pagos p WHERE DATE(p.fechaHoraPago) = CURDATE()) AS pagados,
    (SELECT SUM(p.monto) FROM pagos p WHERE DATE(p.fechaHoraPago) = CURDATE()) AS totalPago,
    COUNT(d.idDevolucion) AS devueltos, SUM(d.montoDevolucion) AS totalDevoluciones,
    (SELECT SUM(g.`montoGasto`) FROM gastos g WHERE DATE(g.`fechaHoraGasto`) = CURDATE()) AS totalGasto,
    (SELECT SUM(p.monto) FROM pagos p WHERE DATE(p.fechaHoraPago) = CURDATE()) - SUM(d.montoDevolucion) - (SELECT SUM(g.`montoGasto`) FROM gastos g WHERE DATE(g.`fechaHoraGasto`) = CURDATE()) AS IngresoDia
FROM atenciones a
LEFT JOIN devoluciones d ON d.idAtencion = a.idAtencion
WHERE DATE(d.fechaHoraDevolucion) = CURDATE();


SELECT * FROM devoluciones

SELECT * FROM detalle_atenciones

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