-- REPORTES GRAFICOS
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