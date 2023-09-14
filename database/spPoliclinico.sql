USE sisPSolidario

-- Admision
DELIMITER $$
CREATE PROCEDURE spu_admision_atenciones
(
IN _turno		CHAR(1),
IN _idusuario 	INT,
IN _idpersona 	INT,
IN _idfamiliar 	INT,
IN _parentesco 	VARCHAR(100),
IN _orden 	INT
)
BEGIN

	-- Para el contador
	DECLARE _fecha DATE;
	DECLARE _contador INT;
	DECLARE _numAtencion VARCHAR(15);

	
	-- Por si el campo es vacio
	IF _idfamiliar = 0 THEN SET _idfamiliar = NULL; END IF;
	IF _orden = 0 THEN SET _orden = NULL; END IF;
	IF _parentesco = '' THEN SET _parentesco = NULL; END IF;

	-- Autogenerado 
	SET _fecha = CURDATE();

	-- Obtener el contador actual
	SELECT IFNULL(MAX(RIGHT(numeroAtencion, 4)), 0) INTO _contador
	FROM Atenciones
	WHERE DATE(fechaCreacion) = _fecha;

	SET _contador = _contador + 1;

	-- Construir el número de atención basado en la fecha y el contador
	SET _numAtencion = CONCAT(
	DATE_FORMAT(_fecha, '%d%m%Y'),
	LPAD(_contador, 4, '0')
	);

	INSERT INTO Atenciones
	(turno, numeroAtencion, parentesco, OrdenDoctor, idUsuario, idFamiliar, idPersona) VALUES
	(_turno, _numAtencion, _parentesco, _orden, _idusuario, _idfamiliar, _idpersona);
END $$

-- detalles de la atencion
DELIMITER $$
CREATE PROCEDURE spu_servicios_detalles
(
IN _idservicios_detalle INT
)
BEGIN
    DECLARE _idatencion INT;
    
    SELECT idAtencion INTO _idatencion FROM atenciones ORDER BY idatencion DESC LIMIT 1;
    
    INSERT INTO Detalle_Servicios (idservicios_detalle, idAtencion) VALUES
    (_idservicios_detalle, _idatencion);
END $$


DELIMITER $$
CREATE PROCEDURE spu_buscar_personas
(
IN _numeroDocumento VARCHAR(12)
)
BEGIN 
	SELECT `idPersona`,
		CONCAT(`apellidoPaterno`, 
		' ', `apellidoMaterno`, 
		', ' , nombres) AS 'ApellidosNombres',
		YEAR(CURDATE()) - YEAR(`fechaNacimiento`) AS 'Edad'
	FROM personas
	WHERE `numeroDocumento` = _numeroDocumento;
END $$

CALL spu_buscar_personas('76364010');

DELIMITER $$
CREATE PROCEDURE spu_listar_especialistas
(
IN _estado CHAR(1)
)
BEGIN 
	SELECT  idEspecialista,
	CONCAT(personas.apellidoPaterno, 
	' ', personas.apellidoMaterno, 
	' ' , personas.nombres) AS 'ApellidosNombres'
	FROM especialistas
	INNER JOIN personas ON personas.idPersona = especialistas.idPersona
	WHERE especialistas.estado = _estado;
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_servicios()
BEGIN 
	SELECT idServicio, nombreServicio
	FROM servicios;
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_espcialistas_servicios
( 
IN _idservicio INT 
)
BEGIN 
	SELECT idEspecialistasServicios,
	CONCAT(servicios.nombreservicio, ' - ',
	personas.apellidoPaterno, ' ',
	personas.nombres) AS 'Nombre Completo'
	FROM especialistas_servicios
	INNER JOIN servicios ON servicios.idservicio = especialistas_servicios.`idServicio`
	INNER JOIN especialistas ON especialistas.idespecialista = especialistas_servicios.`idEspecialista`
	INNER JOIN personas ON personas.`idPersona` = especialistas.`idPersona`
	WHERE especialistas_servicios.`idServicio` = _idservicio;
END $$

-- LISTAR ATENCIONES
DELIMITER $$
CREATE PROCEDURE spu_listar_atenciones()
BEGIN 
	SELECT
		 DATE(atenciones.fechaCreacion) AS Dia,
		 PP.nombres,
		 PP.apellidoPaterno,
		 PP.apellidoMaterno,
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaCreacion) = CURDATE()  -- Filtrar por la fecha actual
	GROUP BY Dia, servicios.nombreServicio, PP.nombres, PP.apellidoPaterno, PP.apellidoMaterno
	ORDER BY Dia;
END $$

CALL spu_listar_atenciones();

-- INFORMACION PARA EL MODAL DE CAJA POR ATENCIÓN
DELIMITER $$
CREATE PROCEDURE spu_obtenerDatos_atencion
(
	IN _idatencion INT
)
BEGIN 
	SELECT Detalle_Servicios.idAtencion,
				PP.nombres,PP.apellidoPaterno, PP.apellidoMaterno, PP.numeroDocumento,
				servicios.nombreServicio,
				SUM(servicios_detalle.precio) AS 'Total'
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
	INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
	INNER JOIN personas PP ON  atenciones.idPersona  = PP.idPersona
	WHERE Detalle_Servicios.idAtencion = _idatencion AND  atenciones.estado = '0'
	GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, PP.nombres,PP.numeroDocumento;
END $$

CALL spu_obtenerDatos_atencion(1);

-- SERVICIOS: LISTAR
DELIMITER $$
CREATE PROCEDURE spu_listar_servicios()
BEGIN 
	SELECT *
	FROM Servicios;
END $$

CALL spu_listar_servicios();

-- SERVICIOS DETALLE = FILTRO POR SERVICIO
DELIMITER $$
CREATE PROCEDURE spu_filtro_servicios
(
	IN _idServicio INT 
)
BEGIN 
	SELECT Servicios.idServicio, servicios.nombreServicio, servicios_detalle.idservicios_detalle, servicios_detalle.descripcion, servicios_detalle.precio
	FROM Servicios
	INNER JOIN servicios_detalle ON servicios_detalle.idServicio = Servicios.idServicio 
	WHERE Servicios.idServicio = _idServicio;
END $$

CALL spu_filtro_servicios(1);

-- CAJA
DELIMITER $$
CREATE PROCEDURE spu_pagar_pagos
(
IN _idatencion 	INT,
IN _idmediopago	INT,
IN _monto			DECIMAL(7,2)
)
BEGIN 
	INSERT INTO pagos (idatencion, idMedioPago, monto, tipoMovimiento) VALUES
	(_idatencion, _idmediopago, _monto, 'I');
END $$

DELIMITER $$
CREATE PROCEDURE spu_estadoCambiar_Pagos
(
IN _idatencion INT
)
BEGIN
	UPDATE atenciones	SET
		fechaActualizacion=NOW(),
		estado = '1'
		WHERE idAtencion = _idatencion;
END $$

DELIMITER $$
CREATE PROCEDURE spu_gastos_pagos
(
IN _medioPago		INT,
IN _descripcion	VARCHAR(200),
IN _monto			DECIMAL(7,2)
)
BEGIN
	INSERT INTO pagos(tipoMovimiento, idMedioPago, descripcionGasto, monto) VALUES
	('E', _medioPago, _descripcion, _monto);
END $$

CALL spu_admision_atenciones('M',1, 2, '', '', '');
CALL spu_admision_atenciones('M',1, 3, '', '', '');
CALL spu_admision_atenciones('M',1, 4, '', '', '');
CALL spu_admision_atenciones('M',1, 5, '', '', '');
CALL spu_admision_atenciones('M',1, 6, '', '', '');
CALL spu_admision_atenciones('M',1, 7, '', '', '');
CALL spu_admision_atenciones('M',1, 9, '', '', '');
CALL spu_admision_atenciones('M',1, 10, '', '', '');
CALL spu_admision_atenciones('M',1, 11, '', '', '');
CALL spu_admision_atenciones('M',1, 12, '', '', '');
CALL spu_admision_atenciones('M',1, 13, '', '', '');
CALL spu_admision_atenciones('M',1, 14, '', '', '');

CALL spu_servicios_detalles(17);

-- call spu_buscar_personas ('98745632')
-- call spu_listar_especialistas (1) 
-- call spu_listar_servicios
-- call spu_listar_espcialistas_servicios(2)

SELECT * FROM atenciones