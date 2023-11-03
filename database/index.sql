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

CALL SPU_LOGIN_USUARIOS('JuanQ');

UPDATE usuarios 
SET clave = '$2y$10$qDspv2dEA7.jvQjS5gU12OxTrlopbXEXPParkCzqtZBElDs6GATeC' 
WHERE idUsuario = 1

UPDATE usuarios 
SET clave = '$2y$10$Lnz.NmRU7JA4z/YKc4yrFugoZIsfPPdKTHe1btDBkD2AxN8rCUaxW' 
WHERE idUsuario = 2

UPDATE usuarios 
SET clave = '$2y$10$Gz1zSVQktIt1jCJsV.pjQ.ynPGu9QFSB.rTof.7kpIFdOVb9bXcre' 
WHERE idUsuario = 3

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