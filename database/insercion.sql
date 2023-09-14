USE sisPSolidario;

INSERT INTO Medio_Pagos (nombrePago)VALUES
('Yape'),
('Transferencia'),
('Efectivo'),
('Plin'),
('POS');

INSERT INTO servicios (tipo, nombreServicio) VALUES
('S', 'Laboratorio clínico'),
('S', 'Ecografía'),
('S', 'Radiografía Digital'),

('S', 'Tópico Inyectable'),
('S', 'Electrocardiograma'),
('S', 'Medida de vista'),

('S', 'Nebulización'),
('S', 'Anatomiía patológica'),
('E', 'Medicina General'),
('E', 'Medicina Interna'),
('E', 'Pediatría'),
('E', 'Ginecología'),
('E', 'Cirugía general'),
('E', 'Neurología'),
('E', 'Traumatología'),
('E', 'Terapia física y rehabilitación'),
('E', 'Obstetricia'),
('E', 'Urología'),
('E', 'Dermatología'),
('E', 'Reumatología'),
('E', 'Cardiología'),
('E', 'Terapia de lenguaje'),
('E', 'Psicología'),
('E', 'Otorrinolaringología'),
('E', 'Medicina complementaria'),
('E', 'Odontología');

INSERT INTO personas (nombres, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, fechaNacimiento, genero, telefono) VALUES
('Juan', 'Quispe', 'Acevedo', 'N', '98745632', '2003-01-01', 'M', NULL),
('Ana', 'Carbajal', 'Loyola', 'N', '12546321', '2000-01-16', 'F', NULL),
('Juana', 'Uceda', 'Ramos', 'N', '32145632', NULL, 'F', NULL),
('Francisca', 'Ureña', 'Luna', 'N', '96336987', NULL, 'F', NULL),
('Benito', 'Martinez', 'Alfaro', 'N', '95115978', NULL, 'M', NULL),
('Laura', 'Polo', 'Manrique', 'N', '74114789', NULL, 'F', NULL),
('Maria', 'Cardenas', 'Almeyda', 'N','21876187','1987-10-11','F',NULL),
('Yenny', 'Roman', 'Meneses', 'N','21854071','1990-09-08','F',NULL),
('Williams', 'Moriano', 'Peña', 'N','72755127','2005-02-01','M',NULL),
('Florentina', 'Peña', 'Diaz', 'N','21818841','1948-04-05','F',NULL),
('Bruce', 'Tasayco', 'Almeyda', 'N','21874458','1976-11-05','M',NULL),
('Maria', 'Robles', 'Sanchez', 'N','80042948','1972-10-05','F',NULL),
('Luis', 'Chumpitaz', 'Torres', 'N','90160962','1967-08-01','M',NULL),
('Adolfo','Magallanes', 'Gonzales','N','21860263','1970-08-01','M',NULL),
('Hilda','Napa', 'Pachas','N','41869880','1985-02-01','F',NULL),
('Ramon','Apolaya', 'Sotelo','N','21789377','1960-05-08','M',NULL),
('Florentina','Salcedo', 'Sucantaipe','N','15412063','1965-04-03','F',NULL),
('Ysabel','Conde', 'Castilla','N','40516544','1960-06-08','F',NULL),
('Maria Fernanda','Carhualloclla', 'Crisostomo','N','71479678','1996-03-08','F',NULL),
('Gustavo Alonso','Carbajal', 'Quispe','N','76582497','1984-08-08','M',NULL),			
('Angelica','Diaz', 'Pachas','N','61060072','1986-02-02','F',NULL),
('Irene','Suarez','Matias','N','76364010','2002-01-31','F',NULL),
('Johan Ruperto','Luque','Ramos','N','71789712','2003-02-24','M',NULL),			
('Anny', 'Cabrera','Napa', 'N', '71788436','2003-07-16','F',NULL),
('Carol Nichol','Canchari', 'Silvestre','N','21884566','1978-08-08','F',NULL),			
('Rosa Luz','Vizarreta', 'De Mendoza','N','21800841','1962-03-03','F',NULL);			
			
			

INSERT INTO usuarios (nombreusuario, clave, fechaFin, idpersona) VALUES
('JuanQ','123',NULL, 1),
('AnaC','1',NULL, 2),
('JuanaU','',NULL, 3);

INSERT INTO Especialistas (codigo, idpersona) VALUES
('1', 4),
(NULL, 5),
('3', 6);

INSERT INTO Especialistas_Servicios(idEspecialista, idServicio) VALUES
(3,9),
(3,10);

INSERT INTO servicios_detalle(idservicio,descripcion, precio) VALUES 
(1, 'Hemograma completo', '30.00'),
(1, 'Examen de orina', '10.00'),
(1, 'Hemograma completo', '30.00'),
(1,'Creatinina Orina 24Hrs','13.00'),
(1,'Depuracion de Creatinina en Orina 24 Hrs','25.00'),

(1,'Proteinuria 24 Hrs','25.00'),
(1,'Proteinas de Bence Jones Orina 24 Hrs','50.00'),
(1,'Ferritina','65.00'),
(1,'Calcio en Orina 24 Hrs','50.00'),
(1,'Acido Urico en Orina 24 Hrs','40.00'),

(1,'Microalbuminuria en orina simple','35.00'),
(1,'Microalbuminuria en orina de 24Hrs','60.00'),
(1,'TGO','10.00'),
(1,'TGP','10.00'),
(9,'Consulta','30.00'), -- 15
(10,'Consulta','40.00'),
(11,'Consulta','40.00');


INSERT INTO Detalle_Servicios (idAtencion ,idservicios_detalle) VALUES 
(11,15);


-- Card de caja =Modal
SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,personas.nombres,SUM(servicios_detalle.precio)
FROM Detalle_Servicios
LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
INNER JOIN personas ON personas.idPersona = Especialistas.idPersona
WHERE Detalle_Servicios.idAtencion = 1 AND  atenciones.estado = '0'
GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;

SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,personas.nombres,SUM(servicios_detalle.precio)
FROM Detalle_Servicios
LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
INNER JOIN personas ON personas.idPersona = Especialistas.idPersona
WHERE Detalle_Servicios.idAtencion = 1
GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;

-- Lista de cards
SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,personas.nombres,SUM(servicios_detalle.precio)
FROM Detalle_Servicios
LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
INNER JOIN personas ON personas.idPersona = Especialistas.idPersona
GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;


SELECT  *
FROM Detalle_Servicios     
LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista



SELECT * FROM medio_pagos;
SELECT * FROM servicios;
SELECT * FROM personas;
SELECT * FROM Especialistas;
SELECT * FROM usuarios;
SELECT * FROM Especialistas_Servicios;
SELECT * FROM atenciones;
SELECT * FROM Detalle_Servicios;