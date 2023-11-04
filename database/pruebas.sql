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
    COUNT(d.idDevolucion) AS devueltos, SUM(d.montoDevolucion) AS Devoluciones,
    (SELECT SUM(p.monto) FROM pagos p WHERE DATE(p.fechaHoraPago) = CURDATE()) AS totalPago,    
    (SELECT SUM(g.`montoGasto`) FROM gastos g WHERE DATE(g.`fechaHoraGasto`) = CURDATE()) AS totalGasto,
    (SELECT SUM(p.monto) FROM pagos p WHERE DATE(p.fechaHoraPago) = CURDATE()) - SUM(d.montoDevolucion) - (SELECT SUM(g.`montoGasto`) FROM gastos g WHERE DATE(g.`fechaHoraGasto`) = CURDATE()) AS IngresoDia
FROM atenciones a
LEFT JOIN devoluciones d ON d.idAtencion = a.idAtencion
WHERE DATE(d.fechaHoraDevolucion) = CURDATE();

-- DATOS DE INDEX
SELECT 
    (SELECT COUNT(p.idPersona) FROM personas p ) AS pacientes,
    (SELECT COUNT(s.idServicio) FROM Servicios s  WHERE s.tipo = 'E') AS especialidades,
    (SELECT COUNT(s.idServicio) FROM Servicios s  WHERE s.tipo = 'S') AS servicios,
    COUNT(e.idEspecialista) AS medicos, 
    (SELECT COUNT(a.idAtencion) FROM atenciones a) AS atenciones  
FROM Especialistas e

SELECT * FROM devoluciones

SELECT * FROM Detalle_Servicios


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
	
DELIMITER $$
CREATE PROCEDURE spu_ticket_1(IN _idAtencion INT)
BEGIN 
	SELECT ate.numeroAtencion, pag.fechaHoraPago,
    CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno) AS 'Paciente',
    per.numeroDocumento,per.`telefono`, YEAR(CURDATE())-YEAR(per.fechaNacimiento) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(per.fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
    especialidad.nombreServicio AS 'Servicio',
    SUM(pag.monto) AS 'MontoTotal'
	FROM    pagos pag
	INNER JOIN Atenciones ate ON pag.idAtencion = ate.idAtencion
	INNER JOIN  Personas per ON per.idPersona = ate.idPersona
	LEFT JOIN (
		 SELECT ate.idAtencion,ser.nombreServicio
		 FROM   atenciones ate
		 INNER JOIN Detalle_Servicios det_ser ON ate.idAtencion = det_ser.idAtencion
		 INNER JOIN servicios_detalle ser_det ON det_ser.idservicios_detalle = ser_det.idservicios_detalle
		 INNER JOIN Servicios ser ON ser_det.idservicio = ser.idServicio
		 WHERE ate.idAtencion = _idAtencion
		 GROUP BY ser.nombreServicio   
	) AS especialidad ON ate.idAtencion = especialidad.idAtencion
	WHERE ate.idAtencion = _idAtencion
	GROUP BY ate.idAtencion;
END $$

DELIMITER $$
CREATE PROCEDURE spu_ticket_2(IN _idAtencion INT)
BEGIN 
	SELECT ate.idAtencion, pag.`idMedioPago`,med.nombrePago, pag.`monto` 
	FROM    pagos pag
	INNER JOIN Atenciones ate ON pag.idAtencion = ate.idAtencion
	INNER JOIN Medio_Pagos med ON pag.idMedioPago = med.idMedioPago
	WHERE ate.idAtencion = _idAtencion
	GROUP BY pag.`idMedioPago`;

END $$

DELIMITER $$
CREATE PROCEDURE spu_ticket_3(IN _idAtencion INT)
BEGIN 
	SELECT Detalle_Servicios.idAtencion,detalle_servicios.idDetalleServicio,Detalle_Servicios.idservicios_detalle,  servicios.nombreServicio,servicios_detalle.descripcion,
	personas.telefono,servicios_detalle.precio AS 'total'
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE detalle_servicios.idAtencion =_idAtencion;
END $$




