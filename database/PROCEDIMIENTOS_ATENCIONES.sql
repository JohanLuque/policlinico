-- ADMISIÓN
-- REGISTRAR ATENCIÓN spu_admision_atenciones
DELIMITER $$
CREATE PROCEDURE spu_atenciones_registrar
(
IN _turno		CHAR(1),
IN _idusuario 	INT,
IN _idpersona 	INT,
IN _idfamiliar 	INT,
IN _parentesco 	VARCHAR(100),
IN _orden 	INT,
IN _fechaAtencion DATE
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
	(turno, numeroAtencion, parentesco, OrdenDoctor, idUsuario, idFamiliar, idPersona,fechaAtencion) VALUES
	(_turno, _numAtencion, _parentesco, _orden, _idusuario, _idfamiliar, _idpersona,_fechaAtencion);
END $$

-- REGISTRAR DETALLE DE SERVICIOS(PROCEDIMIENTO + ATENCION) spu_servicios_detalles
DELIMITER $$
CREATE PROCEDURE spu_atenciones_registrar_detallesServicios
(
IN _idservicios_detalle INT
)
BEGIN
    DECLARE _idatencion INT;
    
    SELECT idAtencion INTO _idatencion FROM atenciones ORDER BY idatencion DESC LIMIT 1;
    
    INSERT INTO Detalle_Servicios (idservicios_detalle, idAtencion) VALUES
    (_idservicios_detalle, _idatencion);
END $$

-- BUSCADOR DE PACIENTES (PERSONAS) spu_buscar_personas
DELIMITER $$
CREATE PROCEDURE spu_atenciones_buscar_personas
(
IN _numeroDocumento VARCHAR(12)
)
BEGIN 
	SELECT `idPersona`, CONCAT(`apellidoPaterno`, 
		' ', `apellidoMaterno`, 
		', ' , nombres) AS 'ApellidosNombres',
		YEAR(CURDATE())-YEAR(fechaNacimiento) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad' ,
		TIMESTAMPDIFF(MONTH, fechaNacimiento, CURDATE()) AS 'meses', `genero`
	FROM personas
	WHERE `numeroDocumento` = _numeroDocumento;
END $$

-- REGISTRAR PACIENTE (PERSONAS) spu_registrar_persona
DELIMITER $$
CREATE PROCEDURE spu_atenciones_registrar_persona
(
	IN _nombres 			VARCHAR(100),
	IN _apellidoPaterno 	VARCHAR(50),
	IN _apellidoMaterno 	VARCHAR(50),
	IN _tipoDocumento		CHAR(1),
	IN _numeroDocumento	VARCHAR(12),
	IN _fechaNacimiento	DATE,
	IN _genero				CHAR(1),
	IN _telefono			CHAR(9),
	IN _distrito 		VARCHAR(100)
)
BEGIN
	IF _fechaNacimiento = "" THEN SET _fechaNacimiento = NULL; END IF;
	IF _genero = "" THEN SET _genero = NULL; END IF;
	IF _telefono = "" THEN SET _telefono = NULL; END IF;
	IF _distrito = "" THEN SET _distrito = NULL; END IF;

	INSERT INTO personas (nombres, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, fechaNacimiento, genero, telefono, distrito) VALUES
	(_nombres,_apellidoPaterno,_apellidoMaterno,_tipoDocumento,_numeroDocumento,_fechaNacimiento,_genero,_telefono, _distrito);
END$$

-- LISTADO DE DOCTORES(ACTIVOS) spu_listar_especialistas
DELIMITER $$
CREATE PROCEDURE spu_atenciones_listar_especialistas
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

-- LISTAR SERVICIOS (SOLO ESPECIALIDADES) spu_listar_especialidades
DELIMITER $$
CREATE PROCEDURE spu_atenciones_listar_especialidades()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "E";
END$$

-- FILTRA DOCTORES POR SERVICIO (DUDASSSSSS) spu_filtro_doctores
DELIMITER$$
CREATE PROCEDURE spu_atenciones_filtro_doctores
(
	IN _idServicio INT
)	
BEGIN
	SELECT idEspecialistasServicios,servicios.nombreservicio,
	CONCAT(personas.apellidoPaterno, ' ',
	personas.nombres) AS 'NombreCompleto'
	FROM especialistas_servicios
	INNER JOIN servicios ON servicios.idservicio = especialistas_servicios.`idServicio`
	INNER JOIN especialistas ON especialistas.idespecialista = especialistas_servicios.`idEspecialista`
	INNER JOIN personas ON personas.`idPersona` = especialistas.`idPersona`
	WHERE especialistas_servicios.`idServicio` =_idservicio;
END$$

-- LISTAR SERVICIOS 
DELIMITER $$
CREATE PROCEDURE spu_atenciones_listar_servicios()
BEGIN 
	SELECT *
	FROM Servicios;
END $$

-- FILTRO DE DETALLE DE SEVICIOS spu_filtro_servicios
DELIMITER $$
CREATE PROCEDURE spu_atenciones_filtro_servicios
(
	IN _idServicio INT 
)
BEGIN 
	SELECT Servicios.idServicio, servicios.nombreServicio, servicios_detalle.idservicios_detalle, servicios_detalle.descripcion, servicios_detalle.precio, servicios_detalle.genero
	FROM Servicios
	INNER JOIN servicios_detalle ON servicios_detalle.idServicio = Servicios.idServicio 
	WHERE Servicios.idServicio = _idServicio AND servicios_detalle.estado = '1';
END $$

-- LISTAR ATENCIONES spu_listar_atenciones
DELIMITER $$
CREATE PROCEDURE spu_atenciones_listar()
BEGIN 
	SELECT
		atenciones.idAtencion,
		 atenciones.fechaCreacion AS Dia,
		 PP.nombres,
		 PP.apellidoPaterno,
		 PP.apellidoMaterno,
		 servicios.idServicio,
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total,
		 atenciones.estado
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaCreacion) = CURDATE()-- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY atenciones.`fechaCreacion` ;
END $$

-- OBTENIENDO INFORMACIÓN POR ATENCIÓN 
DELIMITER $$
CREATE PROCEDURE spu_obtenerDatos_atencion
(
	IN _idatencion INT
)
BEGIN 
	SELECT Detalle_Servicios.idAtencion,
				PP.nombres,PP.apellidoPaterno, PP.apellidoMaterno, PP.numeroDocumento,
				servicios.nombreServicio,
				SUM(servicios_detalle.precio) AS 'Total', atenciones.`fechaAtencion`
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

-- LISTA DE ESPERA PARA ATENCIONES
DELIMITER $$
CREATE PROCEDURE spu_atenciones_listar_espera()
BEGIN 
	SELECT
		atenciones.idAtencion,
		 atenciones.fechaCreacion AS Dia,
		 PP.nombres,
		 PP.apellidoPaterno,
		 PP.apellidoMaterno,
		 servicios.idServicio,
		 servicios.nombreServicio,
		 SUM(servicios_detalle.precio) AS Total,
		 atenciones.estado,
		 atenciones.numeroAtencion
	FROM Detalle_Servicios
	LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
	INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
	INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
	-- LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idServicio
	INNER JOIN personas PP ON atenciones.idPersona = PP.idPersona
	WHERE DATE(atenciones.fechaAtencion) = CURDATE()-- Filtrar por la fecha actual
	GROUP BY Dia, atenciones.idAtencion
	ORDER BY atenciones.idAtencion DESC;
END $$

-- EDITAR FECHA DE ATENCION
DELIMITER$$
CREATE PROCEDURE spu_atenciones_editar_fecha
(
 IN _fechaAtencion DATE,
 IN _idatencion INT
)
BEGIN
	UPDATE atenciones 
	SET fechaAtencion = _fechaAtencion,
	    fechaActualizacion = NOW()
	WHERE idatencion = _idatencion;
END$$

-- buscar precio y genero
DELIMITER$$
CREATE PROCEDURE spu_atenciones_obtenerPrecio_genero
(
 IN _idservicios_detalle INT
)
BEGIN
	SELECT idservicios_detalle,descripcion, precio, genero
	FROM servicios_detalle
	WHERE idservicios_detalle = _idservicios_detalle;

END$$

DELIMITER $$
CREATE PROCEDURE spu_atenciones_agregar_Servicios
(
IN _tipo CHAR(1),
IN _nombreServicio VARCHAR(100)
)
BEGIN
	INSERT INTO Servicios(tipo, nombreServicio) VALUES
	(_tipo, _nombreServicio);
END $$
DELIMITER $$

DELIMITER $$
CREATE PROCEDURE spu_atenciones_agregar_Servicio_Detalle
(
IN _idServicio 	INT,
IN _descripcion VARCHAR(100),
IN _precio	DECIMAL(7,2),
IN _genero	CHAR(1)
)
BEGIN
	IF _genero = "" THEN SET _genero = NULL; END IF;
	INSERT INTO servicios_detalle(idservicio, descripcion, precio, genero) VALUES
	(_idservicio, _descripcion, _precio, _genero);
END $$

DELIMITER $$
CREATE PROCEDURE spu_atenciones_agregar_Especialista
(
IN _idPersona 	INT,
IN _codigo 	VARCHAR(10)
)
BEGIN
	IF _codigo = "" THEN SET _codigo = NULL; END IF;
	INSERT INTO Especialistas(idPersona, codigo) VALUES
	(_idPersona, _codigo);
END $$

DELIMITER $$
CREATE PROCEDURE spu_atenciones_agregar_Especialista_a_Servicios
(
IN _idEspecialidad 	INT,
IN _idServicio		INT
)
BEGIN
	INSERT INTO Especialistas_Servicios (idEspecialista, idServicio) VALUES
	(_idEspecialidad,_idServicio);
END $$

DELIMITER $$
CREATE PROCEDURE spu_atenciones_agregar_Usuarios
(
IN _idPersona		INT,
IN _nombreUsuario 	VARCHAR(200),
IN _clave 		VARCHAR(200),
IN _nivelAcceso		CHAR(1)
)
BEGIN
	INSERT INTO usuarios (idPersona, nombreUsuario, clave, nivelAcceso) VALUES
	(_idPersona, _nombreUsuario, _clave, _nivelAcceso);
END $$

DELIMITER $$
CREATE PROCEDURE spu_admision_listar_usuarios
(
IN _estado CHAR(1)
)
BEGIN 
	SELECT idusuario, nombreUsuario, nivelAcceso, fechaInicio,
		CONCAT(personas.apellidoPaterno, " ", personas.apellidoMaterno, " ", personas.nombres) AS persona
	FROM usuarios
	INNER JOIN personas ON personas.idPersona = usuarios.idPersona
	WHERE usuarios.estado = _estado
	ORDER BY idusuario DESC; 
END $$

DELIMITER $$
CREATE PROCEDURE spu_admision_eliminar_usuarios
(
IN _idusuario INT
)
BEGIN 
	UPDATE Usuarios SET
		fechaFin = NOW(),
		estado = '0'
	WHERE idUsuario = _idusuario;
END $$