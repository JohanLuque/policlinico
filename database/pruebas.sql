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

SELECT * FROM detalle_alergias

DELETE atenciones s

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
	WHERE atenciones.estado = '1' AND servicios.tipo = 'S'
	ORDER BY dia DESC;
	

SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
FROM Detalle_Servicios
INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = 1 AND MONTH(atenciones.`fechaAtencion`) = 11

DELIMITER $$
CREATE PROCEDURE spu_reporte_POS(IN _fecha DATE)
BEGIN
	SELECT  DATE(pagos.`fechaHoraPago`) AS fecha, med.nombrePago,per.numeroDocumento ,CONCAT(per.apellidoPaterno, ' ', per.apellidoMaterno, ' ', per.nombres) AS 'nombreCompleto' , pagos.`monto`
	FROM pagos
	INNER JOIN atenciones ate ON ate.idAtencion = pagos.`idAtencion`
	INNER JOIN personas per ON per.idPersona = ate.idPersona
	INNER JOIN Detalle_Servicios det ON det.idAtencion = ate.idAtencion
	INNER JOIN servicios_detalle setDet ON setDet.idservicios_detalle = det.idservicios_detalle
	INNER JOIN servicios ser ON ser.idServicio = setDet.idservicio
	INNER JOIN Medio_Pagos med ON pagos.idMedioPago = med.idMedioPago
	WHERE med.nombrePago = "POS" AND DATE(pagos.`fechaHoraPago`) = _fecha;
END $$

DELIMITER $$
CREATE PROCEDURE spu_reporte_servicioSemanal(IN _idServicio INT)
BEGIN 
	SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
	personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
	FROM Detalle_Servicios
	INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
	INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = _idServicio AND WEEK(atenciones.`fechaAtencion`) = WEEK(CURDATE());
END $$

DELIMITER $$
CREATE PROCEDURE spu_reporte_servicioQuincenal(IN _idServicio INT)
BEGIN 
	SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
	personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
	FROM Detalle_Servicios
	INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
	INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = _idServicio AND (DAYOFMONTH(atenciones.`fechaAtencion`) BETWEEN 1 AND 15
	    OR (DAYOFMONTH(atenciones.`fechaAtencion`) BETWEEN 16 AND 31 AND DAYOFMONTH(CURDATE()) <= 15));
END $$

DELIMITER $$
CREATE PROCEDURE spu_reporte_servicioMensual(IN _idServicio INT, IN _mes INT)
BEGIN 
	SELECT atenciones.`fechaAtencion` AS fecha, CONCAT(personas.apellidoPaterno, ' ', personas.apellidoMaterno, ' ', personas.nombres) AS 'nombreCompleto',
	personas.`numeroDocumento`, servicios_detalle.`precio`, servicios_detalle.`descripcion`
	FROM Detalle_Servicios
	INNER JOIN atenciones ON atenciones.`idAtencion` = detalle_servicios.`idAtencion`
	INNER JOIN personas ON personas.`idPersona` = atenciones.`idPersona`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE servicios.`tipo` = 'S' AND servicios.`idServicio` = _idServicio AND MONTH(atenciones.`fechaAtencion`) = _mes;
END $$

 

-- DATOS DE TICKET
DELIMITER $$
CREATE PROCEDURE spu_ticket_1(IN _idAtencion INT)
BEGIN 
	SELECT ate.numeroAtencion, pag.fechaHoraPago,
	UPPER(CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno)) AS 'Paciente',
	per.numeroDocumento,per.`telefono`, YEAR(CURDATE())-YEAR(per.fechaNacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(per.fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
	UPPER(especialidad.nombreServicio) AS 'Servicio',
	SUM(pag.monto) AS 'MontoTotal',TRUNCATE(SUM(pag.monto)*0.18,2) AS 'IGV' , TRUNCATE(SUM(pag.monto)-SUM(pag.monto)*0.18,2)   AS 'subtotal'
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


-- OBTENER INGRESOS POR MEDIO DE PAGO
DELIMITER $$
CREATE PROCEDURE spu_monto_medioPago(IN _idmedio INT)
BEGIN 
	SELECT IFNULL(SUM(p.monto), 0) AS TotalPago, 
	(SELECT IFNULL(SUM(montoDevolucion),0) FROM devoluciones WHERE DATE(fechaHoraDevolucion) = CURDATE() AND idMedioPago = _idmedio) AS totalDevo, 
	(IFNULL(SUM(p.monto), 0))-((SELECT IFNULL(SUM(montoDevolucion),0) FROM devoluciones WHERE DATE(fechaHoraDevolucion) = CURDATE() AND idMedioPago = _idmedio) + (SELECT IFNULL(SUM(montoGasto),0) FROM gastos WHERE DATE(fechaHoraGasto) = CURDATE() AND idMedioPago = _idmedio)) AS total
	FROM pagos p 
	INNER JOIN Medio_Pagos med ON p.idMedioPago = med.idMedioPago
	WHERE DATE(p.fechaHoraPago) = CURDATE() AND p.idMedioPago = _idmedio;
END $$

