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
('Johan','Luque','Ramos','N','71789712','2003-02-24','M',NULL),			
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
(1,1),
(2,2),
(1,3),
(2,9),
(3,10),
(1,11);

INSERT INTO Detalle_Servicios (idAtencion ,idservicios_detalle) VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(2,5),
(3,6),
(4,5),
(5,9),
(6,10),
(10,16),
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

SELECT Detalle_Servicios.idAtencion, servicios.nombreServicio,
	personas.nombres,personas.`apellidoMaterno`, personas.`apellidoPaterno`,
	personas.`numeroDocumento`,YEAR(CURDATE()) - YEAR(personas.`fechaNacimiento`) AS 'Edad',
	personas.`telefono`,SUM(servicios_detalle.precio) AS 'total'
FROM Detalle_Servicios
LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
INNER JOIN personas ON personas.idPersona = atenciones.idPersona
GROUP BY Detalle_Servicios.idAtencion, servicios.nombreServicio, personas.nombres;

SELECT Detalle_Servicios.idAtencion,detalle_servicios.`idDetalleServicio`, servicios.nombreServicio,servicios_detalle.`descripcion`,
	personas.`telefono`,servicios_detalle.precio AS 'total'
FROM Detalle_Servicios
LEFT JOIN atenciones ON atenciones.idAtencion = Detalle_Servicios.idAtencion
INNER JOIN servicios_detalle ON servicios_detalle.idservicios_detalle = Detalle_Servicios.idservicios_detalle
INNER JOIN servicios ON servicios.idServicio = servicios_detalle.idservicio
LEFT JOIN Especialistas_Servicios ON Especialistas_Servicios.idServicio = servicios.idservicio
INNER JOIN Especialistas ON Especialistas.idEspecialista = Especialistas_Servicios.idEspecialista
INNER JOIN personas ON personas.idPersona = atenciones.idPersona
WHERE detalle_servicios.`idAtencion` = 14;

-- Lista de cards
SELECT *
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

INSERT INTO servicios_detalle(idservicio,descripcion, precio) VALUES




-- Inicio de laboratorio
(1,'ANCA (Elisa)','100.00'),
(1,'Aglutinaciones en lamina y en tubo','15.00'),
(1,'ANTI ATG(Anti tiroglobulina)(tiroides autoinmune)','85.00'),
(1,'ANTI CARDIOLIPINA lg M','100.00'),
(1,'ANTI CARDIOLIPINA lg G','100.00'),
(1,'ANTI-CPP(Peptido Ciclico Cirulano) lg G','230.00'),
(1,'ANTI DNA-DS','160.00'),
(1,'ANTIESTREPTOLISINA O (ASO)-Cualitativa','15.00'),
(1,'ANTIESTREPTOLISINA O (ASO)-Cuantitativo','45.00'),
(1,'ASMA (ANTI MITOCONDRIALES)','100.00'),
(1,'ASMA (ANTI MUSCULO LISO)','100.00'),
(1,'ANA(ANTICUERPOS ANTINUCLEARES)','240.00'),
(1,'BETA HCG CUANTITATIVO(Semana de gestación)','35.00'),
(1,'BETA HCG CUALITATIVO','18.00'),
(1,'CHLAMYDIA TRACHOMATIS lg G','100.00'),
(1,'CHLAMYDIA TRACHOMATIS lg M','100.00'),
(1,'CITOMEGALOVIRUS lg G','60.00'),
(1,'CITOMEGALOVIRUS lg M','60.00'),
(1,'DESPISTAJE ALERGICO','280.00'),
(1,'EPSTEIN BAR VIRUS (EBNA lg G)','85.00'),
(1,'EPSTEIN BAR VIRUS (EBNA lg M)','85.00'),
(1,'EPSTEIN BAR VIRUS (VCA lg G)','90.00'),
(1,'FACTOR REUMATOIDEO CUALITATIVO','15.00'),
(1,'FACTOR REUMATOIDEO CUANTITATIVO','60.00'),
(1,'HELICOBACTER PILORI lg G','60.00'),
(1,'HELICOBACTER PILORI lg M','60.00'),
(1,'HEPATITIS A lg M','55.00'),
(1,'HEPATITIS B (HBSAG CORE TOTAL)','80.00'),
(1,'HEPATITIS B (HBSAG)','40.00'),
(1,'HEPATITIS C','80.00'),
(1,'HEPATITIS D','100.00'),
(1,'HERPES I lg G','60.00'),
(1,'HERPES I lg M','60.00'),
(1,'HERPES II lg G','60.00'),
(1,'HERPES II lg M','60.00'),
(1,'HIDATIDOSIS(ELISA)', '80.00'),
(1,'HIDATIDOSIS(WETERN BLOT)', '230.00'),
(1,'HTLV I-II ANTICUERPOS', '211.00'),
(1,'VIH (ELISA)','45.00'),
(1,'VIH PRUEBA RAPIDA','30.00'),
(1,'VDRL','15.00'),
(1,'VDRL CUANTITATIVO','40.00'),
(1,'INMUNOGLOBINA SERICA IG E (alergía)','100.00'),
(1,'PROTEÍNA C REACTIVA (PCR)- CUALITATIVO','20.00'),
(1,'PROTEÍNA C REACTIVA (PCR)- CUANTITATIVO','60.00'),
(1,'RUBEOLA Ig G','60.00'),
(1,'RUBEOLA lg M','60.00'),
(1,'SIFILIS ELISA VDRL CUANTITATIVO','60.00'),
(1,'TOXOPLASMA lg G','60.00'),
(1,'TOXOPLASMA lg M','60.00'),
(1,'ACTH','100.00'),
(1,'CORTISOL (AM o PM)','60.00'),
(1,'DHEA-S (DEHIDROEPIANDROSTERONA)','180.00'),
(1,'ESTRADIOL','80.00'),
(1,'ESTRADIOL LIBRE','80.00'),
(1,'FSH','60.00'),
(1,'INSULINA BASAL','65.00'),
(1,'INSULINA CURVA O TOLERANCIA','120.00'),
(1,'LH','65.00'),
(1,'PARATOHORMONAS (PTH)','135.00'),
(1,'PROGESTERONA','60.00'),
(1,'PROLACTINA','60.00'),
(1,'PROLACTINAL POOL','100.00'),
(1,'T3 LIBRE','60.00'),
(1,'T3 (TRIODOTIRONINA)','60.00'),
(1,'T4 LIBRE','60.00'),
(1,'T4 (TIROXINA)','45.00'),
(1,'TESTOSTERONA TOTAL','60.00'),
(1,'TESTOSTERONA LIBRE','60.00'),
(1,'TSH ULTRA SENSIBLE','35.00'),
(1,'ALFA FETO PROTEINA (AFP)','80.00'),
(1,'CEA (ANTIGENO CARCINO EMBRIONARIO)','65.00'),
(1,'CA 125 (OVARIO)','80.00'),
(1,'CA 15-3 (MAMA)','85.00'),
(1,'CA 72-4','140.00'),
(1,'CA 19-9 (PANCREAS)','125.00'),
(1,'PSA TOTAL (PROSTATA)','60.00'),
(1,'PSA LIBRE (PROSTATA)','60.00'),
(1,'CALCITONINA','130.00'),
(1,'BETA 2 MICROGLOBULINA SERICA','110.00'),
(1,'CYFRA 21-1','130.00'),
(1,'PAPANICOLAU','35.00'),
(1,'BIOPSIAS (Endometrio, cuello uterino, piel)','320.00'),
(1,'BIOPSIAS (Hepatica, Renal, Pleural)','320'),
(1,'BIOPSIA PEQUEÑA (gastrica, duodenal, colonica, esofagica, rectal, anal)','240.00'),
(1,'BIOPSIAS MEDIANA (vesicula biliar, apendice, cecal, restos endouterinos)','280.000'),
(1,'TUMORES(Mamas,lipomas, partes blandas)','200.00'),
(1,'UTERO SIN ANEXOS','250.00'),
(1,'UTERO CON ANEXOS','320.00'),
(1,'PROSTATA','200.00'),
(1,'BLOCK CELL','100.00'),
(1,'Hemograma completo','30.00'),
(1,'Hematocrito','10.00'),
(1,'Hemoglobina','10.00'),
(1,'Grupo Sanguíneo','15.00'),
(1,'Recuento de Plaquetas','15.00'),
(1,'Lamina periferíca','15.00'),
(1,'VSG (Velocidad de sedimentación globular)','10.00'),
(1,'Gota gruesa (Malaria)','15.00'),
(1,'Constante Corpusculares','25.00'),
(1,'Recuento de Reticulocitos (Globulos Rojos)','15.00'),
(1,'Celulas L.E. (Lupues eritematoso)','20.00'),
(1,'Tiempo de coagulacion y sangría','10.00'),
(1,'Tiempo de Protrombina-INR','40.00'),
(1,'Tiempo Parcial y Tromboplastina (APTT)','40.00'),
(1,'Fibrinogeno','40.00'),
(1,'Coombs directo','50.00'),
(1,'Coombs indirecto','50.00');

SELECT * FROM medio_pagos;
SELECT * FROM servicios;
SELECT * FROM personas;
SELECT * FROM Especialistas;
SELECT * FROM usuarios;
SELECT * FROM Especialistas_Servicios;
SELECT * FROM pagos;
SELECT * FROM atenciones ORDER BY idAtencion DESC;
SELECT * FROM Detalle_Servicios;
SELECT * FROM servicios_detalle;