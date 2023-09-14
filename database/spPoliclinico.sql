USE sisPSolidario

-- Admision
DELIMITER $$
CREATE PROCEDURE spu_admision_atenciones
(
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
	('M', _numAtencion, _parentesco, _orden, _idusuario, _idfamiliar, _idpersona);

	
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

DELIMITER $$
CREATE PROCEDURE spu_listar_especialistas
(
IN _estado CHAR(1)
)
BEGIN 
	SELECT  idEspecialista,
	CONCAT(personas.apellidoPaterno, 
	' ', personas.apellidoMaterno, 
	' ' , personas.nombres) AS 'Apellidos y Nombres'
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

CALL spu_admision_atenciones(1, 2, '', '', '');
CALL spu_admision_atenciones(1, 3, '', '', '');
CALL spu_admision_atenciones(1, 4, '', '', '');
CALL spu_admision_atenciones(1, 5, '', '', '');
CALL spu_admision_atenciones(1, 6, '', '', '');
CALL spu_admision_atenciones(1, 7, '', '', '');

CALL spu_admision_atenciones(1, 9, '', '', '');

-- call spu_buscar_personas ('98745632')
-- call spu_listar_especialistas (1) 
-- call spu_listar_servicios
-- call spu_listar_espcialistas_servicios(2)

SELECT * FROM atenciones