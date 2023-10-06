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
-- LABORATORIO
(1,'ACIDO FOLICO','60.00'),
(1,'B12 VITAMINA','60.00'),
(1,'CONSTANTES CORPUSCULARES','20.00'),
(1,'FENOMENO LE - LUPUS ERIMATOSO','35.00'),
(1,'FERRITINA','80.00'),
(1,'GRUPO SANGUINEO Y RH-TIPIFICACION SANGUINEO','10.00'),
(1,'HEMOGLOBINA - HEMATOCRITO RECUENTO SANGUINEO','10.00'),
(1,'HEMOGRAMA COMPLETO','30.00'),
(1,'HIERRO SERICO','50.00'),
(1,'LAMINA PERIFERICA','15.00'),
(1,'RETICULOCITOS','15.00'),
(1,'TEST DE COOMBS DIRECTO','50.00'),
(1,'TRANSFERRINA','65.00'),
(1,'TROPONINA I','70.00'),
(1,'ERITROSEDIMENTACION - VSG - VELOCIDAD DE SEDIMIENTO','10.00'),
(1,'RECUENTO DE PLAQUETAS (MANUAL)','15.00'),
(1,'TIEMPO DE COAGULACION Y SANGRIA - TC - TS','15.00'),
(1,'VARIANTE DU','20.00'),
(1,'TIEMPO DE PROTOMBINA IRN(TP) - TP TROMBINA','35.00'),
(1,'TIEMPO DE TROMBINA','35.00'),
(1,'TIEMPO DE TROMBOPLASTINA PARCIAL ACTIVADA APTT','35.00'),
(1,'FIBRINOGENO','40.00'),
(1,'DIMERO D CUANTIATIVO','90.00'),
(1,'ACIDO URICO','15.00'),
(1,'AMILASA SERICA','30.00'),
(1,'BILIRRUBINAS TOTAL Y FRACCIONADAS','20.00'),
(1,'CALCIO SERICO','35.00'),
(1,'COLESTEROL HDL','15.00'),
(1,'COLESTEROL LDL','15.00'),
(1,'COLESTEROL TOTAL','10.00'),
(1,'COLESTEROL VLDL','15.00'),
(1,'CPK MB','50.00'),
(1,'CREATININA','10.00'),
(1,'DESHIDROGENASA LACTICA (LDH)','50.00'),
(1,'ELECTROLITOS SERICOS (NA - CL - K) SODIO - CLORO - SODIO','80.00'),
(1,'FOSFATA ALCALINA','10.00'),
(1,'FOSFATASA ACIDA PROSTATICA ( RESULTADO 3 DIAS )','90.00'),
(1,'FOSFORO','30.00'),
(1,'GAMMA/GLUTAMIL/TRANSFERASA(GGT)TRANSPETIDASA/GGTP','50.00'),
(1,'GLUCOSA POSTPANDRIAL','20.00'),
(1,'GLUCOSA','10.00'),
(1,'TOLERANCIA A LA GLUCOSA (3 GLUCOSAS) BASAL - 60MIN - 120 MIN','30.00'),
(1,'HEMOGLOBINA GLICOSILADA (HB)','60.00'),
(1,'LIPASA SERICA','60.00'),
(1,'LIPIDOS TOTALES','20.00'),
(1,'MAGNESIO','50.00'),
(1,'PROTEINAS T Y F + ALBUMINA + GLOBULINA','25.00'),
(1,'TRANSAMINASA OXALACETICA TGO','15.00'),
(1,'TRANSAMINASA PIRUVICA TGP','15.00'),
(1,'TRIGLICERIDOS','10.00'),
(1,'UREA','10.00'),
(1,'INSULINA BASAL','50.00'),
(1,'INSULINA POST PANDRIAL( BASAL + INSULINA 2HRAS)','100.00'),
(1,'AGLUTINACIONES - PARATIFICO - (TIFOIDEA)','30.00'),
(1,'ANA - ANT ANTINUCLEARES - LIMA','100.00'),
(1,'ANTIESTREPTOLISINA "O" ASO','15.00'),
(1,'CHAGAS','60.00'),
(1,'FACTOR REUMATOIDEO CUANTITIVO','60.00'),
(1,'FACTOR REUMATOIDEO CUALITATIVO','15.00'),
(1,'H.I.V (1 + 2) PRUEBA RAPIDA','30.00'),
(1,'HIV 4TA GENERSCION ELISA','70.00'),
(1,'HELICOBACTER PYLORI CUALITATIVA','30.00'),
(1,'HELICOBACTER PYLORI IGG CUALITATIVA','60.00'),
(1,'HELICOBACTER PYLORI IGM CUALITATIVA','60.00'),
(1,'HEPATITIS A HVA','55.00'),
(1,'HEPATITIS B (ANTICORE TOTAL)','60.00'),
(1,'HEPATITIS B (ANTICUERPOS HB)','80.00'),
(1,'HEPATITIS B (HSBAG) - (ANTIGENO AUSTRALIANO) ELISA','60.00'),
(1,'HEPATITIS B (HSBAG) - (ANTIGENO AUSTRALIANO) (P. RAPIDA)','30.00'),
(1,'HEPATITIS C (AC TOTALES) - ELISA','60.00'),
(1,'HTLV','60.00'),
(1,'INMUNOGLUBULINA SERICA IGE','60.00'),
(1,'PCR CUALITATIVA','15.00'),
(1,'PCR CUANTITATIVA','50.00'),
(1,'RPR','30.00'),
(1,'DENGUE IGG/IGM/NS1','70.00'),
(1,'PRUEBA COVID19 - HISOPADO','60.00'),
(1,'SIFILIS POR ELISA','60.00'),
(1,'ELISA PARA HIDATIDOSIS ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','100.00'),
(1,'PANEL ALERGICO(36) PLANTAS Y COMIDA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','250.00'),
(1,'ANTI CCP - PEPTIDO CLINICO ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','230.00'),
(1,'PERFIL TESTOSTERONA LIBRE','90.00'),
(1,'CHALMYDIA TRACHOMATIS IGG ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','120.00'),
(1,'CHALMYDIA TRACHOMATIS IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','120.00'),
(1,'TOXOPLASMA IGG( CONSULTAR TIEMPO DE RESULTADO EN LAB )','120.00'),
(1,'TOXOPLASMA IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','120.00'),
(1,'CITOMEGALOVIRUS IGG ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','150.00'),
(1,'CITOMEGALOVIRUS IGM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','150.00'),
(1,'EXAMEN COMPLETO','10.00'),
(1,'PROTEINAS (ORINA 24H)','30.00'),
(1,'SEDIMENTO URINARIO','5.00'),
(1,'DEPURACION DE CREATININA','30.00'),
(1,'MICROALBUMINURIA (ORINA 24 H)','30.00'),
(1,'UROCULTIVO - ATB - KIT COMERCIAL - CULTIVO','40.00'),
(1,'CALCIO (ORINA 24H)','45.00'),
(1,'PARASITOLOGICO SIMPLE X 1 MUESTRA','10.00'),
(1,'PARASITOLOGIA SERIADA X 3 MUESTRAS','30.00'),
(1,'COPROCULTIVO FUNCIONAL','60.00'),
(1,'REACCION INFLAMATORIA','10.00'),
(1,'SUDAM III','50.00'),
(1,'SUSTANCIAS REDUCTORAS','30.00'),
(1,'TEST DE GRAHAM','10.00'),
(1,'THEVENON','35.00'),
(1,'COLORACION GRAM (BACTERIAS)','20.00'),
(1,'CULTIVO DE FARINGEA','80.00'),
(1,'CULTIVO DE LIQUIDO (4 DIAS)','60.00'),
(1,'CULTIVO DE SECRECION VAGINAL','60.00'),
(1,'CULTIVO DE SEMEN','70.00'),
(1,'CULTIVO HERIDA','60.00'),
(1,'CULTIVO URETRAL - HOMBRE','60.00'),
(1,'ESPUTO SERIADO X3','40.00'),
(1,'ESPUTO SIMPLE X1','15.00'),
(1,'KOH - RASPADO','30.00'),
(1,'CORTISOL AM','80.00'),
(1,'CORTISOL PM','80.00'),
(1,'BHCG CUALITATIVO','20.00'),
(1,'BHCG CUANTITATIVO','60.00'),
(1,'ESTRADIOL','70.00'),
(1,'FSH','60.00'),
(1,'LH','60.00'),
(1,'PROGESTERONA','70.00'),
(1,'PROLACTINA','70.00'),
(1,'T3 - TOTAL','60.00'),
(1,'T3 LIBRE','60.00'),
(1,'T4 TOTAL','60.00'),
(1,'T4 LIBRE','60.00'),
(1,'TESTOTERONA','70.00'),
(1,'TSH','60.00'),
(1,'CA 15-3 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','80.00'),
(1,'CA 19.9 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','80.00'),
(1,'CEA 125 ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','80.00'),
(1,'CEA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','80.00'),
(1,'PSA TOTAL','60.00'),
(1,'PSA LIBRE','60.00'),
(1,'ALFA FETOPROTEINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','80.00'),
(1,'DOSAJE PROCALCITONINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','250.00'),
(1,'BIOPSIA PIEZA OPERATORIA <= 5MM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','150.00'),
(1,'BIOPSIA PIEZA OPERATORIA CHICA > 5MM <=2 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','150.00'),
(1,'BIOPSIA PIEZA OPERATORIA MEDIANO > 2 CM Y <= 5CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','190.00'),
(1,'BIOPSIA PIEZA OPERTORIA GRANDE > 5CM Y <= 10 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','280.00'),
(1,'PERFIL LIPIDICO','60.00'),
(1,'PERFIL HEPATICO','60.00'),
-- ECOGRAFIA
(2,'ECO ABDOMINAL INFERIOR','60.00'),
(2,'ECO ABDOMINAL SUPERIOR','60.00'),
(2,'ECO COMPLETA','60.00'),
(2,'ECO DE CUELLO','60.00'),
(2,'ECO DE PROSTATA','60.00'),
(2,'ECO DE VEJIGA','60.00'),
(2,'ECO DOPLER 1 MIEMBRO','120.00'),
(2,'ECO DOPLER 2 MIEMBROS','200.00'),
(2,'ECO DOPLER HEPÁTICA','150.00'),
(2,'ECO DOPLER OBSTÉTRICA','120.00'),
(2,'ECO GÉNETICA','120.00'),
(2,'ECO HIGADO','60.00'),
(2,'ECO INFERIOR','60.00'),
(2,'ECO MAMARIA - UNILATERAL','60.00'),
(2,'ECO MORFOLÓGICA','120.00'),
(2,'ECO MUSCULOESQUELETICA','60.00'),
(2,'ECO OBSTÉTRICA(PERFIL BIOFÍSICO)','80.00'),
(2,'ECO PARTES BLANDAS','60.00'),
(2,'ECO PARTES BLANDAS HERNIAS','60.00'),
(2,'ECO PARTES BLANDAS TESTÍCULOS','60.00'),
(2,'ECO PARTES BLANDAS TIROIDES','60.00'),
(2,'ECO PÉLVICA','60.00'),
(2,'ECO RENAL','60.00'),
(2,'ECO RENAL-VESICAL','60.00'),
(2,'ECO SUPERIOR','60.00'),
(2,'ECO TESTICULOS','60.00'),
(2,'ECO TIROIDES Y MASAS DEL CUELLO','60.00'),
(2,'ECO VESICAL-PROSTÁTICA','60.00'),
(2,'ECO VESICULAR','60.00'),
(2,'ECO VIAS URINARIAS COMPLETAS','60.00'),
-- RAYOS X
(3,'RX PIE','70.00'),
(3,'RX DE RODILLA','90.00'),
(3,'RX DE COLUMNA LUMBOSACRA','90.00'),
(3,'RX SENOS PARANASALES F-P-O','90.00'),
(3,'RX MAXILAR INFERIOR','70.00'),
(3,'RX MAXILAR SUPERIOR','70.00'),
(3,'RX MASTOIDES(POR LADO)','60.00'),
(3,'RX HUESOS NASALES','60.00'),
(3,'RX DE AGUJEROS OPTICOS','60.00'),
(3,'RX ORBITAS','70.00'),
(3,'RX SILLA TURCA','70.00'),
(3,'RX CRANEO FRONTAL Y PERFIL','70.00'),
(3,'RX PEÑASCO CADA LADO','60.00'),
(3,'RX TEMPORAL CADA LADO','50.00'),
(3,'RX ARTIC TEMPOMANDIBULAR UNILATERAL(CADA LADO)','60.00'),
(3,'RX ARTIC TEMPOMANDIBULAR COMPARATIVO','80.00'),
(3,'RX TORAX, INCIDENCIA FRONTAL O A/P','50.00'),
(3,'RX TORAX, FRONTAL Y LATERAL(F-P)','80.00'),
(3,'RX CORAZON Y GRANDES VASOS - TORAX','50.00'),
(3,'RX COSTILLAS F','50.00'),
(3,'RX ESTERNON, MINIMO 2 INCIDENCIAS','70.00'),
(3,'RX COLUMNA CERVICAL F-P-O','90.00'),
(3,'RX COLUMNA CERVICAL FRONTAL LATERAL','70.00'),
(3,'RX COLUMNA CERVICAL FUNCIONAL 2 INCIDENCIAS','70.00'),
(3,'RX COLUMNA CERVICO DORSAL','70.00'),
(3,'RX COLUMNA LUMBAR FRONTAL Y LATERAL','70.00'),
(3,'RX COLUMNA DORSAL FRONTAL Y LATERAL','70.00'),
(3,'RX COLUMNA DORSAL F-P-O','90.00'),
(3,'RX PARRILLA COSTAL F-O','90.00'),
(3,'RX COLUMNA DORSOLUMBAR','80.00'),
(3,'RX COLUMNA LUMBOSACRA F-P','70.00'),
(3,'RX COLUMNA LUMBOSACRA F-P-O','90.00'),
(3,'RX PELVIS','70.00'),
(3,'RX SACROLIACA CADA LADO','70.00'),
(3,'RX SACROCOXIGEA F-P','70.00'),
(3,'RX CLAVICULA COMPLETO','50.00'),
(3,'RX ESCAPULA FRONTAL LATERAL','70.00'),
(3,'RX HOMBRO F-P','50.00'),
(3,'RX BRAZO F-P','50.00'),
(3,'RX CODO F-P','50.00'),
(3,'RX ANTEBRAZO CADA LADO','50.00'),
(3,'RX MUÑECA F-P','50.00'),
(3,'RX MANO F-P','50.00'),
(3,'RX MANO, EDAD OSEA(FRONTAL)','50.00'),
(3,'RX CADERA, UNILAT, UNA VISTA','70.00'),
(3,'RX CADERA, UNILAT, COMPLETO 2 VISTAS','90.00'),
(3,'RX PELVIS Y CADERA, LACTANTE O NIÑO','80.00'),
(3,'RX FEMUR F-P','70.00'),
(3,'RX RODILLA F-P','70.00'),
(3,'RX ROTULA FRONTAL Y LATERAL','50.00'),
(3,'RX TIBIA Y PERONE F-P','50.00'),
(3,'RX TOBILLO F-P','50.00'),
(3,'RX PIE F-O','50.00'),
(3,'RX CALCANEO F-P','70.00'),
(3,'RX MEDICIÓN DE MIEMBRO INFERIOR NIÑO','120.00'),
(3,'RX MEDICIÓN DE MIEMBRO INFERIOR ADULTO','120.00'),
(3,'RX ABDOMEN SIMPLE','60.00'),
(3,'RX ABDOMEN DE PIE - DECUBITO','70.00'),
(3,'EXAMEN RADIOLOGICO DE CAVUM','60.00'),
(3,'EXAMEN RADIOLOGICO DE ESOFAGO','110.00'),
(3,'UROGRAFIA EXCRETORIA','100.00'),
(3,'RX PIERNA F-P','70.00'),
-- TOPICO
(4,'INTRAMUSCULAR','6.00'),
(4,'ENDOVENOSO','30.00'),
(4,'AMPOLLA A LA VENA','20.00'),
(4,'NEBULIZACION','10.00'),
(4,'COLOCACION DE OXIGENO 20 MIN','50.00'),
(4,'COLOCACION DE OXIGENO 30 MIN','80.00'),
(4,'RETIRO DE PUNTOS','10.00'),
(4,'COLOCACION DE ENEMA','20.00'),
(4,'COLOCACION DE SONDA ','30.00'),
(4,'PRUEBA DE SENSIBILIDAD','6.00'),
-- ELECTROCARDIOGRAMA ???
-- (5,'','.00'),
-- MEDIDA DE VISTA ???
-- (6,'','.00'),
-- NEBULIZACION NO ES SERVICIO ESTA ADENTRO DE TOPICO
-- ANATOMIA PATOLOGICA NO SE SABE QUE PONER

-- MEDICINA GENERAL 
(9,'CONSULTA','20.00'),
-- MEDICINA INTERNA
(10,'CONSULTA','40.00'),
-- PEDIATRIA
(11,'CONSULTA','40.00'),
-- CIRUGIA
(13,'CONSULTA','40.00'),
(13,'EXTRACCION DE LIPOMA','150.00'),
-- NEURO Y NEUMO SON LO MISMO? ID:14
-- TRAUMATOLOGIA
(15,'CONSULTA','40.00'),
(15,'INFILTRACION','150.00'),
(15,'COLOCACION DE YESO ANTEBRAZO SIN MATERIALES','150.00'),
(15,'COLOCACION DE YESO ANTEBRAZO CON MATERIALES','250.00'),
(15,'COLOCACION DE YESO PIERNA SIN MATERIALES','250.00'),
(15,'COLOCACION DE YESO PIERNA CON MATERIALES','350.00'),
(15,'RETIRO DE YESO','80.00'),
(15,'FERULA SIN MATERIALES','150.00'),
(15,'FERULA CON MATERIALES','250.00'),

INSERT INTO servicios_detalle(idservicio,descripcion, precio, genero) VALUES
-- GINECOLOGIA
(2,'ECO 4D','100.00', 'F'),
(2,'ECO 5D','100.00', 'F'),
(2,'ECO OBSTÉTRICA','60.00', 'F'),
(2,'ECO MAMAS','60.00', 'F'),
(2,'ECO TRANSVAGINAL(TV)','60.00', 'F'),
(12,'CONSULTA','40.00','F'),
(12,'PAPANICOLAO','40.00','F'),
(12,'CULTIVO DE SECRECION VAGINAL','60.00','F'),
(12,'BIOPSIA DE CUELLO UTERINO','150.00','F'),
(12,'COLCOSPIA','120.00','F'),
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