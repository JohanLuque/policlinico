SELECT COUNT(atenciones.`idAtencion`), atenciones.`turno`
FROM pagos
INNER JOIN atenciones ON atenciones.`idAtencion` = pagos.`idAtencion`	
INNER JOIN detalle_servicios ON detalle_servicios.`idAtencion` = atenciones.`idAtencion`
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
WHERE DATE(atenciones.`fechaCreacion`) = CURDATE() 
GROUP BY atenciones.`turno`
ORDER BY COUNT(atenciones.`idAtencion`) DESC

-- CANTIDAD DE ATENCIONES POR TURNO
DELIMITER $$
CREATE PROCEDURE grafico_turnos()
BEGIN
	SELECT COUNT(atenciones.`idAtencion`) AS total, atenciones.`turno`
	FROM pagos
	INNER JOIN atenciones ON atenciones.`idAtencion` = pagos.`idAtencion`	
	INNER JOIN detalle_servicios ON detalle_servicios.`idAtencion` = atenciones.`idAtencion`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE DATE(atenciones.`fechaCreacion`) = CURDATE() 
	GROUP BY atenciones.`turno`
	ORDER BY COUNT(atenciones.`idAtencion`) DESC;
END $$

-- CANTIDAD DE ATENCIONES POR ESPECIALIDAD POR DIA
DELIMITER $$
CREATE PROCEDURE grafico_servicios()
BEGIN
	SELECT servicios.`nombreServicio`,COUNT(servicios.`idServicio`) AS total
	FROM pagos
	INNER JOIN atenciones ON atenciones.`idAtencion` = pagos.`idAtencion`	
	INNER JOIN detalle_servicios ON detalle_servicios.`idAtencion` = atenciones.`idAtencion`
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	WHERE DATE(atenciones.`fechaCreacion`) = CURDATE() AND servicios.`tipo` = "E"
	GROUP BY servicios.`idServicio`
	ORDER BY COUNT(servicios.`idServicio`) DESC;
END $$

-- REPORTE DE POS
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

