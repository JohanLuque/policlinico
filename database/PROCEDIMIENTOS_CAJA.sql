-- CAJA
-- REGISTRAR PAGOS
DELIMITER $$
CREATE PROCEDURE spu_caja_registrar_pago
(
IN _idatencion 	INT,
IN _idmediopago	INT,
IN _monto			DECIMAL(7,2)
)
BEGIN 
	INSERT INTO pagos (idatencion, idMedioPago, monto) VALUES
	(_idatencion, _idmediopago, _monto);
END $$

-- CAMBIAR A ESTADO (PAGADO)
DELIMITER $$
CREATE PROCEDURE spu_caja_cambiar_estado_pagos
(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '1'
		WHERE idAtencion = _idatencion;
END $$

-- LISTAR METODOS DE PAGO
DELIMITER $$ 
CREATE PROCEDURE spu_caja_listar_metodos_pago()
BEGIN
	SELECT *
	FROM Medio_Pagos;
END $$

-- INFROMACION PARA EL CARD CUANDO SE VA A PAGAR (RESUMEN)
DELIMITER $$ 
CREATE PROCEDURE spu_caja_detalle_pagos( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,
	personas.nombres,personas.apellidoMaterno, personas.apellidoPaterno,
	personas.numeroDocumento,
		YEAR(CURDATE())-YEAR(fechaNacimiento) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
		TIMESTAMPDIFF(MONTH, fechaNacimiento, CURDATE()) AS 'meses',
	personas.telefono, atenciones.fechaAtencion
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	-- INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE Detalle_Servicios.idAtencion = _idatencion
	GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;
END $$

-- PARA EL RESUMEN DE QUE SE VINO A ATENDER
DELIMITER $$ 
CREATE PROCEDURE spu_caja_listar_detalle_servicio( IN _idatencion INT)
BEGIN
	SELECT Detalle_Servicios.idAtencion,detalle_servicios.idDetalleServicio,Detalle_Servicios.idservicios_detalle,  servicios.nombreServicio,servicios_detalle.descripcion,
	personas.telefono,servicios_detalle.precio AS 'total'
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN personas ON personas.idPersona = atenciones.idPersona
	WHERE detalle_servicios.idAtencion = _idatencion;
END $$

-- LISTAR GASTOS
DELIMITER $$
CREATE PROCEDURE spu_caja_listar_gastos()
BEGIN 
	SELECT idGasto, descripcionGasto, montoGasto, fechaHoraGasto,
	 CONCAT(personas.ApellidoPaterno, ' ', personas.Nombres) AS personas ,
	  Medio_Pagos.nombrePago
	FROM gastos
	INNER JOIN personas ON personas.idPersona = gastos.idPersona
	INNER JOIN Medio_Pagos ON Medio_Pagos.idMedioPago = gastos.idMedioPago
	WHERE DATE(fechaHoraGasto) = CURDATE();
END $$

-- REGISTAR GASTOS
DELIMITER $$
CREATE PROCEDURE spu_caja_registrar_gastos
(
IN _montoGasto		DECIMAL(6,2),
IN _descripcionGasto	VARCHAR(200),
IN _idPersona		INT, 
IN _idMedioPago 	INT
)
BEGIN
	INSERT INTO gastos(montoGasto, descripcionGasto, idPersona, idMedioPago) VALUES
	(_montoGasto, _descripcionGasto, _idPersona, _idMedioPago);
END $$

-- REGISTRAR DEVOLUCION
DELIMITER $$ 
CREATE PROCEDURE spu_caja_registrar_devolucion
(
IN _motivoDevolucion		VARCHAR(400),
IN _montoDevolucion		DECIMAL(6,2),
IN _idAtencion			INT,
IN _idMedioPago 		INT
)
BEGIN 
	INSERT INTO Devoluciones(motivoDevolucion, montoDevolucion, idAtencion, idMedioPago) VALUES
	(_motivoDevolucion, _montoDevolucion, _idAtencion, _idMedioPago);
END $$

-- OBTENIENDO DATOS PARA REALIZAR DEVOLUCION
DELIMITER $$
CREATE PROCEDURE spu_caja_obtener_datos_devolucion
(
IN _idAtencion INT
)
BEGIN 
	SELECT	    CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno) AS 'Paciente',
	    per.numeroDocumento,
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

SELECT
    CONCAT(per.nombres, ' ', per.apellidoPaterno, ' ', per.apellidoMaterno) AS 'Paciente',
    per.numeroDocumento,
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
    WHERE ate.idAtencion = 1
    GROUP BY ser.nombreServicio   
) AS especialidad ON ate.idAtencion = especialidad.idAtencion
WHERE ate.idAtencion = 1
GROUP BY ate.idAtencion;

-- OBTENIENDO EL INGRESO TOTAL DEL DIA
DELIMITER $$
CREATE PROCEDURE spu_caja_obtener_ingresos()
BEGIN 
	SELECT 
	(SELECT SUM(d.montoDevolucion) FROM Devoluciones d WHERE DATE(d.fechaHoraDevolucion) = CURDATE()) AS totalDevo,
	(SELECT SUM(g.montoGasto) FROM Gastos g WHERE DATE(g.fechaHoraGasto) = CURDATE()) AS totalgasto,
	SUM(monto) AS  totalpagos,
	(SUM(monto) - ((SELECT SUM(d.montoDevolucion) FROM Devoluciones d WHERE DATE(d.fechaHoraDevolucion) = CURDATE()) + (SELECT SUM(g.montoGasto) FROM Gastos g WHERE DATE(g.fechaHoraGasto) = CURDATE()) )) AS MontoTotal
	FROM Pagos
	WHERE DATE(fechaHoraPago) = CURDATE();
END $$

-- OBTENIENDO LA DEVOLUCIÓN TOTAL DEL DIA
DELIMITER $$
CREATE PROCEDURE spu_caja_obtener_devolucion()
BEGIN 
	SELECT SUM(montoDevolucion) AS 'MontoTotal'
	FROM devoluciones;
END $$

-- CAMBIAR A ESTADO (devuelto)
DELIMITER $$
CREATE PROCEDURE spu_caja_cambiar_estado_Devolucion
(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '2'
	WHERE idAtencion = _idatencion;
END $$