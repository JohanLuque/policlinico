-- REPORTES- GRAFICOS- login

DELIMITER $$
CREATE PROCEDURE SPU_LOGIN_USUARIOS
(
	IN _nombreUsuario VARCHAR(50)
)
BEGIN
	SELECT 	Usuarios.idUsuario, 
		usuarios.nombreUsuario, 
		usuarios.clave,
		CONCAT(personas.apellidoPaterno,' ', personas.apellidoMaterno,' ' , personas.nombres) AS 'ApellidosNombres',
		usuarios.`nivelAcceso`
	FROM Usuarios
	INNER JOIN Personas ON personas.idPersona = usuarios.idPersona
	WHERE nombreUsuario = _nombreUsuario;
END $$

DELIMITER $$
CREATE PROCEDURE SPU_LOGIN_GetData
(
	IN _idUsuario INT
)
BEGIN
	SELECT 	Usuarios.idUsuario, 
		usuarios.nombreUsuario, 
		usuarios.clave, idPersona
	FROM Usuarios
	WHERE nombreUsuario = _idUsuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_contadores()
BEGIN 
	SELECT 
	    (SELECT COUNT(p.idPersona) FROM personas p ) AS pacientes,
	    (SELECT COUNT(s.idServicio) FROM Servicios s  WHERE s.tipo = 'E') AS especialidades,
	    (SELECT COUNT(s.idServicio) FROM Servicios s  WHERE s.tipo = 'S') AS servicios,
	    COUNT(e.idEspecialista) AS medicos, 
	    (SELECT COUNT(a.idAtencion) FROM atenciones a) AS atenciones  
	FROM Especialistas e;
END $$
-- PRUEBAS DE GRAFICO DE INGRESOS TOTALES
-- SELECT 
   -- (SELECT IFNULL
   -- (SUM(dev.montoDevolucion), 0) FROM Devoluciones dev WHERE DATE(dev.fechaHoraDevolucion) = CURDATE()) AS devolucion,
   -- (SELECT IFNULL(SUM(gas.montoGasto), 0) FROM Gastos gas WHERE DATE(gas.fechaHoraGasto) = CURDATE()) AS tgasto,
   -- IFNULL(SUM(monto),0) AS tpagos,
   -- IFNULL((SUM(monto) - (IFNULL((SELECT SUM(dev.montoDevolucion) FROM Devoluciones dev WHERE DATE(dev.fechaHoraDevolucion) = CURDATE()), 0)
	--    + IFNULL((SELECT SUM(gas.montoGasto) FROM Gastos gas WHERE DATE(gas.fechaHoraGasto) = CURDATE()), 0))),0) AS Total
	-- FROM Pagos
	-- group by date(fechaHoraPago)
	
-- SELECT 
    -- (SELECT IFNULL(SUM(d.montoDevolucion), 0) FROM Devoluciones d order by date(d.fechaHoraDevolucion)) AS totalDevo,
    -- (SELECT IFNULL(SUM(g.montoGasto), 0) FROM Gastos g ORDER BY date(g.fechaHoraGasto)) AS totalgasto,
    -- IFNULL(SUM(monto),0) AS totalpagos,
    -- IFNULL((SUM(monto) - (IFNULL((SELECT SUM(d.montoDevolucion) FROM Devoluciones d ORDER BY date(d.fechaHoraDevolucion))), 0)
	   -- + IFNULL((SELECT SUM(g.montoGasto) FROM Gastos g ORDER BY date(g.fechaHoraGasto))), 0))),0) AS MontoTotal
	-- FROM Pagos
	-- group by DATE(fechaHoraPago) ; 
	
DELIMITER $$
CREATE PROCEDURE spu_listar_servicios()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "S";
END$$