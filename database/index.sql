-- REPORTES- GRAFICOS- login

DELIMITER $$
DROP PROCEDURE SPU_LOGIN_USUARIOS
(
	IN _nombreUsuario VARCHAR(50)
)
BEGIN
	SELECT 	Usuarios.idUsuario, 
		usuarios.nombreUsuario, 
		usuarios.clave,
		CONCAT(personas.apellidoPaterno,' ', personas.apellidoMaterno,' ' , personas.nombres) AS 'ApellidosNombres',
		usuarios.`nivelAcceso`, personas.`estado`, personas.`distrito`, personas.`numeroDocumento`, personas.`telefono`,YEAR(CURDATE())-YEAR(personas.`fechaNacimiento`) + 
		IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(personas.fechaNacimiento,'%m-%d'), 0 , -1 )AS 'Edad'
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

DELIMITER $$
CREATE PROCEDURE spu_listar_servicios()
BEGIN
	SELECT * FROM Servicios
	WHERE tipo = "S";
END$$