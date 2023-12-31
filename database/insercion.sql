USE sisPSolidario;

INSERT INTO Medio_Pagos (nombrePago)VALUES
('Yape'),
('Transferencia'),
('Efectivo'),
('Plin'),
('POS');

INSERT INTO servicios (tipo, nombreServicio) VALUES
-- SERVICIOS
('S', 'LABORATORIO CLÍNICO'),
('S', 'ECOGRAFÍA'),
('S', 'RAYOS X'),
('S', 'TÓPICO'),
('S', 'RESONANCIA MAGNÉTICA'),
-- ESPECIALIDADES
('E', 'MEDICINA GENERAL'),
('E', 'MEDICINA INTERNA'),
('E', 'PEDIATRÍA'),
('E', 'GINECOLOGÍA'),
('E', 'CIRUGÍA GENERAL'),
('E', 'NEUROLOGÍA'),
('E', 'TRAUMATOLOGÍA'),
('E', 'TERAPIA FÍSICA Y REHABILITACIÓN'),
('E', 'UROLOGÍA'),
('E', 'DERMATOLOGÍA'),
('E', 'CARDIOLOGÍA'),
('E', 'PSICOLOGÍA'),
('E', 'NEUMOLOGÍA'),
('E', 'OTORRINOLARINGOLOGÍA'),
('E', 'TOMOGRAFÍA'),
('E', 'ODONTOLOGÍA'),
('E', 'ODONTOPEDIATRÍA');


INSERT INTO personas (nombres, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, fechaNacimiento, genero, telefono, distrito) VALUES
('WILLIAMS JAVIER','CHUMPITAZ','GAMARRA','N','10455420','1976-07-26','M',NULL,'CHINCHA ALTA'), 	-- G
('RICHARD ANDERSON','DE LA CRUZ','CAMPOS','N','74556725','2003-03-09','M',NULL,'ALTO LARAN'),		-- G	
('MELANY NAYELI', 'AGUIRRE','FERNANDEZ', 'N', '71716027','2004-10-17','F',NULL,'CHINCHA ALTA'), -- A
('ENZO EFRAIN', 'RISCO','VÁSQUEZ', 'N', '46391849','1990-06-23','M',NULL,'FORANEO'), -- CIRUJIA
('LUIS EDUARDO', 'RIVA','CADENAS', 'N', '43406872','1952-07-15','M',NULL,'FORANEO'), 
('CARLOS ALBERTO', 'REYES','GARCIA', 'N', '46430425','1990-07-23','M',NULL,'FORANEO'),	    -- S
('PAMELA ALEJANDRA', 'LUQUE','DONAYRE', 'N', '73458545','2001-10-05','F',NULL,'CHINCHA BAJA'),
('JAZMIN JULIZA', 'CASTRO','VASQUEZ', 'N', '45397454','1988-07-21','F',NULL,'SUNAMPE'),
('AUGUSTO AMERICO', 'TORRES','MAGALLANES', 'N', '70051404','1997-03-06','M',NULL,'CHINCHA ALTA'),
('ALISSON DANIELA', 'TORRES','SARAVIA', 'N', '70758550','2006-01-21','F',NULL,'GROCIO PRADO'),
('FABIANA ANDREA', 'TASAYCO','RAMOS', 'N', '72793047','2001-08-01','F',NULL,'CHINCHA ALTA'),
('JUDITH ROSMERY', 'PACHAS','ESTEBAN', 'N', '72500480','2006-03-06','F',NULL,'CHINCHA ALTA');



INSERT INTO usuarios (nombreusuario,clave,idpersona,nivelAcceso) VALUES
('WILLIAMS_CG','$2y$10$qDspv2dEA7.jvQjS5gU12OxTrlopbXEXPParkCzqtZBElDs6GATeC',1,'G');


INSERT INTO Especialistas (codigo, idpersona) VALUES
('11088', 5), -- RIVA
('13254', 6), -- CARLOS
(NULL, 10); -- alisson

INSERT INTO Especialistas_Servicios(idEspecialista, idServicio) VALUES
(1,7),
(2,1),
(3,3);

INSERT INTO Enfermedades(codigoCie_10, descripcion)VALUES
('A00-B99','Ciertas enfermedades infecciosas y parasitarias'),
('C00-D48','Neoplasias'),
('D50-D89','Enfermedades de la sangre y de los órganos hematopoyéticos y otros trastornos que afectan el mecanismo de la inmunidad'),
('E00-E90','Enfermedades endocrinas, nutricionales y metabólicas'),
('F00-F99','Trastornos mentales y del comportamiento'),
('F00-F100','Enfermedades del sistema nervioso');

INSERT INTO servicios_detalle(idservicio,descripcion, precio) VALUES
-- 1 LABORATORIO
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
(1,'EXAMEN COMPLETO DE ORINA','10.00'),
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
(1,'CULTIVO HERIDA','60.00'),
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
(1,'ALFA FETOPROTEINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','80.00'),
(1,'DOSAJE PROCALCITONINA ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','250.00'),
(1,'BIOPSIA PIEZA OPERATORIA <= 5MM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','150.00'),
(1,'BIOPSIA PIEZA OPERATORIA CHICA > 5MM <=2 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','150.00'),
(1,'BIOPSIA PIEZA OPERATORIA MEDIANO > 2 CM Y <= 5CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','190.00'),
(1,'BIOPSIA PIEZA OPERTORIA GRANDE > 5CM Y <= 10 CM ( CONSULTAR TIEMPO DE RESULTADO EN LAB )','280.00'),
(1,'PERFIL LIPIDICO','60.00'),
(1,'PERFIL HEPATICO','60.00'),
-- 2 ECOGRAFIA
(2,'ECO ABDOMINAL INFERIOR','60.00'),
(2,'ECO ABDOMINAL SUPERIOR','60.00'),
(2,'ECO COMPLETA','60.00'),
(2,'ECO DE CUELLO','60.00'),
(2,'ECO DE VEJIGA','60.00'),
(2,'ECO DOPLER 1 MIEMBRO','120.00'),
(2,'ECO DOPLER 2 MIEMBROS','200.00'),
(2,'ECO DOPLER HEPÁTICA','150.00'),
(2,'ECO GÉNETICA','120.00'),
(2,'ECO HIGADO','60.00'),
(2,'ECO INFERIOR','60.00'),
(2,'ECO MUSCULOESQUELETICA','60.00'),
(2,'ECO PARTES BLANDAS','60.00'),
(2,'ECO PARTES BLANDAS HERNIAS','60.00'),
(2,'ECO PARTES BLANDAS TIROIDES','60.00'),
(2,'ECO PÉLVICA','60.00'),
(2,'ECO RENAL','60.00'),
(2,'ECO RENAL-VESICAL','60.00'),
(2,'ECO SUPERIOR','60.00'),
(2,'ECO TIROIDES Y MASAS DEL CUELLO','60.00'),
(2,'ECO VESICULAR','60.00'),
(2,'ECO VIAS URINARIAS COMPLETAS','60.00'),
-- 3 RAYOS X
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
-- 4 TOPICO
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
-- 5 RESONANCIA MAGNETICA
(5,'CRANEO - CRANEO ANGIORESONANCIA', '1140.00'),
(5,'CRANEO - CRANEO - AGIORESONANCIA CEREBRAL', '970.00'),
(5,'CRANEO - ESPECTROSCOPIA ALZHEIMER', '570.00'),
(5,'CRANEO - ESPECTROSCOPIA PARKINSON', '570.00'),
(5,'CRANEO - PERFUSION', '570.00'),
(5,'CRANEO - VOLUMETRIA HIPOCAMPO', '570.00'),
(5,'CRANEO - OIDO', '570.00'),
(5,'CRANEO - MACIZO FACIAL', '570.00'),
(5,'CRANEO - ORBITAS', '770.00'),
(5,'CRANEO - ANGIORESONANCIA', '570.00'),
(5,'CRANEO - REGION SELAR E HIPOFISIS', '770.00'),
(5,'COLUMNA VERTEBRAL - COLUMNA LUMBOSACRA', '570.00'),
(5,'COLUMNA VERTEBRAL - COLUMNA LUMBOSACRA MAS VISTA PANORAMICA', '850.00'),
(5,'COLUMNA VERTEBRAL - COLUMNA CERVICAL', '570.00'),
(5,'COLUMNA VERTEBRAL - COLUMNA DORSAL', '570.00'),
(5,'COLUMNA VERTEBRAL - PANORAMICA', '570.00'),
(5,'COLUMNA VERTEBRAL - SACROCOXIGEA', '570.00'),
(5,'ARTICULACIONES - TEMPORO MANDIBULAR (ATM)', '620.00'),
(5,'ARTICULACIONES - HOMBRO', '620.00'),
(5,'ARTICULACIONES - BRAZO', '620.00'),
(5,'ARTICULACIONES - CODO', '620.00'),
(5,'ARTICULACIONES - ANTEBRAZO', '620.00'),
(5,'ARTICULACIONES - MANO', '620.00'),
(5,'ARTICULACIONES - MUÑECA', '620.00'),
(5,'ARTICULACIONES - COXOFEMORAL (CADERA)', '620.00'),
(5,'ARTICULACIONES - RODILLA', '570.00'),
(5,'ARTICULACIONES - PIERNA', '620.00'),
(5,'ARTICULACIONES - TOBILLO', '620.00'),
(5,'ARTICULACIONES - PIE', '620.00'),
(5,'ARTICULACIONES - TENDON DE AQUILES', '620.00'),
(5,'RESTO DE ESTUDIOS - CUELLO', '620.00'),
(5,'RESTO DE ESTUDIOS - MEDIASTINO', '620.00'),
(5,'RESTO DE ESTUDIOS - PULMONES (TORAX)', '620.00'),
(5,'RESTO DE ESTUDIOS - ABDOMEN SUPERIOR(HIGADO,BAZO,PANCREAS,RIÑON,COLAGNIO)', '620.00'),
(5,'RESTO DE ESTUDIOS - ABDOMEN INFERIOR (PELVIS)', '620.00'),
(5,'RESTO DE ESTUDIOS - ENTERORESONANCIA', '1300.00'),
(5,'RESTO DE ESTUDIOS - PROSTATA MULTIPARAMETRICA', '1200.00'),
(5,'RESTO DE ESTUDIOS - MAMA BILATERAL', '1200.00'),
(5,'RESTO DE ESTUDIOS - MAMA', '800.00'),
(5,'RESTO DE ESTUDIOS - ANGIO MM.INFERIORES ARTERIALES', '620.00'),
(5,'RESTO DE ESTUDIOS - ANGIO CUELLO SUPRAAORTICA', '620.00'),
(5,'RESTO DE ESTUDIOS - ANGIO DE AORTA -TORAX', '620.00'),
(5,'RESTO DE ESTUDIOS - PLEXO - BRAQUIAL', '620.00'),
(5,'RESTO DE ESTUDIOS - URORESONANCIA', '970.00'),
(5,'RESTO DE ESTUDIOS - CADERA', '620.00'),
(5,'RESTO DE ESTUDIOS - SENOS PARANASALES', '820.00'),
(5,'RESTO DE ESTUDIOS - TRIFASICA', '820.00'),
(5,'RESTO DE ESTUDIOS - MUSLO', '620.00'),
(5,'RESTO DE ESTUDIOS - RENAL', '620.00'),
(5,'RESTO DE ESTUDIOS - PARRILLA COSTAL', '620.00'),
(5,'RESTO DE ESTUDIOS - ESCAPULA', '820.00'),

-- 6 MEDICINA GENERAL 
(6,'CONSULTA','20.00'),
-- 7 MEDICINA INTERNA
(7,'CONSULTA','40.00'),
-- 8 PEDIATRIA
(8,'CONSULTA','40.00'),
-- 10 CIRUGIA GENERAL
(10,'CONSULTA','40.00'),
(10,'EXTRACCION DE LIPOMA','150.00'),
-- 11 NEUROLOGIA
(11,'CONSULTA','40.00'),
-- 12 TRAUMATOLOGIA
(12,'CONSULTA','40.00'),
(12,'INFILTRACION','150.00'),
(12,'COLOCACION DE YESO ANTEBRAZO SIN MATERIALES','150.00'),
(12,'COLOCACION DE YESO ANTEBRAZO CON MATERIALES','250.00'),
(12,'COLOCACION DE YESO PIERNA SIN MATERIALES','250.00'),
(12,'COLOCACION DE YESO PIERNA CON MATERIALES','350.00'),
(12,'RETIRO DE YESO','80.00'),
(12,'FERULA SIN MATERIALES','150.00'),
(12,'FERULA CON MATERIALES','250.00'),
-- 13 TERAPIA FISICA Y REHABILITACION
(13,'SESION','40.00'),
(13,'PAQUETE DE 5 SESIONES','150.00'),
(13,'PAQUETE DE 10 SESIONES','300.00'),
(13,'ONDA DE CHOQUE','120.00'),
(13,'MASAJES RELAJANTES','40.00'),
-- 14 UROLOGIA
(14,'CONSULTA','40.00'),
-- 15 DERMATOLOGIA
(15,'CONSULTA','50.00'),
-- 16 CARDIOLOGIA
(16,'CONSULTA','50.00'),
(16,'EKG','70.00'),
(16,'RIESGO QUIRURGICO','180.00'),
(16,'INFORME CARDIOLOGICO','80.00'),
-- 17 PSICOLOGIA
(17,'CONSULTA','30.00'),
(17,'TERAPIA','40.00'),
(17,'EVALUACION','50.00'),
(17,'TERAPIA DE LENGUAJE - CONSULTA','30.00'),
(17,'TERAPIA DE LENGUAJE - TERAPIA','40.00'),
-- 18 NEUMOLOGIA 
(18,'CONSULTA','70.00'),
-- 19 OTORRINOLARINGOLOGIA
(19,'CONSULTA','50.00'),
(19,'AUDIOMETRIA TOTAL','100.00'),
(19,'TIMPANOMETRIA','150.00'),
(19,'ENDOSCOPIA DE OIDO','190.00'),
(19,'CAUTERIZACION QUIMICA','140.00'),
(19,'CURACION DE OIDO','60.00'),
(19,'ELECTROCAUTERIZACION','100.00'),
(19,'EXTRACCION DE CUERPO EXTRAÑO ( OIDO,NARIZ,FARINGE)','120.00'),
(19,'INFILTRACION DE CORNETA','60.00'),
(19,'LAVADO DE OIDO ','70.00'),
(19,'REDUCCION DE FRACTURA','250.00'),
(19,'RETIRO DE TAPONAMIENTO NASAL ANTERIOR UNILATERAL','100.00'),
(19,'RETIRO DE TAPONAMIENTO NASAL ANTERIOR BILATERAL','150.00'),
(19,'TAPONAMIENTO NASAL ANTERIOR UNILATERAL','100.00'),
(19,'TAPONAMIENTO NASAL ANTERIOR BILATERAL','150.00'),
(19,'CAUTERIZACION FARINGEA - UNA SESION','100.00'),
(19,'TAPONAMENTO NASAL POSTERIOR UNILATERAL','250.00'),
(19,'ENDOSCOPIA LARINGEA','209.00'),
(19,'PRUEBA VESTIBULOS','100.00'),
(19,'LARINCOSCOPIA','180.00'),
(19,'VIDEO ENDOSCOPIA LARINGEA','190.00'),
(19,'OTOMICROCOSPIA','100.00'),
-- 20 TOMOGRAFIAS
(20, 'CEREBRAL TAC SIN CONTRASTE','330.00'),
(20, 'CEREBRAL TAC CON CONTRASTE','430.00'),
(20, 'CEREBRAL V.O TAC SIN CONTRASTE','380.00'),
(20, 'CEREBRAL V.O TAC CON CONTRASTE','480.00'),
(20, 'HIPOTISIS TAC SIN CONTRASTE','330.00'),
(20, 'HIPOTISIS TAC CON CONTRASTE','430.00'),
(20, 'TORAX TAC SIN CONTRASTE','330.00'),
(20, 'TORAX TAC CON CONTRASTE','430.00'),
(20, 'COLUMNA LUMBO-SACRA TAC SIN CONTRASTE','400.00'),
(20, 'COLUMNA LUMBO-SACRA TAC CON CONTRASTE','500.00'),
(20, 'COLUMNA DORSAL TAC SIN CONTRASTE','400.00'),
(20, 'COLUMNA DORSAL TAC CON CONTRASTE','500.00'),
(20, 'COLUMNA CERVICAL TAC SIN CONTRASTE','400.00'),
(20, 'COLUMNA CERVICAL TAC CON CONTRASTE','500.00'),
(20, 'ABDOMEN COMPLETO TAC SIN CONTRASTE','500.00'),
(20, 'ABDOMEN COMPLETO TAC CON CONTRASTE','600.00'),
(20, 'ABDOMEN SUPERIOR TAC SIN CONTRASTE','400.00'),
(20, 'ABDOMEN SUPERIOR TAC CON CONTRASTE','510.00'),
(20, 'ABDOMEN INFERIOR TAC SIN CONTRASTE','400.00'),
(20, 'ABDOMEN INFERIOR TAC CON CONTRASTE','510.00'),
(20, 'UTOTEM TAC SIN CONTRASTE','500.00'),
(20, 'UTOTEM TAC CON CONTRASTE','600.00'),
(20, 'MANO, MUÑECA Y PIE','400.00'),
(20, 'HOMBRO','400.00'),
(20, 'MACIZO FACIAL TAC SIN CONTRASTE','400.00'),
(20, 'MACIZO FACIAL TAC CON CONTRASTE','500.00'),
(20, 'ORBITAS TAC SIN CONTRASTE','330.00'),
(20, 'ORBITAS TAC CON CONTRASTE','430.00'),
(20, 'CUELLO TAC SIN CONTRASTE','400.00'),
(20, 'CUELLO TAC CON CONTRASTE','500.00'),
(20, 'SENOS PARANASALES TAC SIN CONTRASTE','400.00'),
(20, 'SENOS PARANASALES TAC CON CONTRASTE','500.00'),
(20, 'TOBILLO','430.00'),
(20, 'RODILLA','430.00'),
(20, 'PELVIS OSEA TAC SIN CONTRASTE','400.00'),
(20, 'PELVIS OSEA TAC CON CONTRASTE','500.00'),
(20, 'OIDO','360.00'),
(20, 'RECONSTRUCCION 3D - ADICIONAR ESA CANTIDAD','50.00'),
(20, 'INFORME URGENTE - ADICIONAR ESA CANTIDAD','15.00'),
(20, 'CD - ADICIONAR ESA CANTIDAD','10.00'),
(20, 'PLACA ADICIONAL - ADICIONAR ESA CANTIDAD','30.00'),
-- 21 ODONTOLOGIA
(21, 'CONSULTA','00.00'),
(21, 'LIMPIEZA DENTAL','100.00'),
(21, 'FRENILLO','500.00'),
(21, 'BLANCAMIENTO','350.00'),
(21, 'EXTRACION DE DIENTE','80.00'),
(21, 'PULPOTOMIA','100.00'),
(21, 'VARNIZ FLORADO - FLUOR','40.00'),
-- 22 ODONTOPEDIATRIA
(22, 'CONSULTA','40.00'),
(22, 'LIMPIEZA DENTAL','100.00'),
(22, 'FRENILLO','500.00'),
(22, 'BLANCAMIENTO','350.00'),
(22, 'EXTRACION DE DIENTE','80.00'),
(22, 'PULPOTOMIA','100.00'),
(22, 'VARNIZ FLORADO - FLUOR','40.00');

-- CON GÉNERO
INSERT INTO servicios_detalle(idservicio,descripcion, precio, genero) VALUES
-- LABORATORIO
(1,'CULTIVO DE SECRECION VAGINAL','60.00','F'),
(1,'CULTIVO DE SEMEN','70.00','M'),
(1,'CULTIVO URETRAL - HOMBRE','60.00','M'),
(1,'PSA TOTAL','60.00','M'),
(1,'PSA LIBRE','60.00','M'),
-- ECOGRAFIA
(2,'ECO 4D','100.00', 'F'),
(2,'ECO DE PROSTATA','60.00','M'),
(2,'ECO 5D','100.00', 'F'),
(2,'ECO OBSTÉTRICA','60.00', 'F'),
(2,'ECO MAMAS','60.00', 'F'),
(2,'ECO TRANSVAGINAL(TV)','60.00', 'F'),
(2,'ECO DOPLER OBSTÉTRICA','120.00', 'F'),
(2,'ECO MAMARIA - UNILATERAL','60.00', 'F'),
(2,'ECO MORFOLÓGICA','120.00', 'F'),
(2,'ECO OBSTÉTRICA(PERFIL BIOFÍSICO)','80.00','F'),
(2,'ECO VESICAL-PROSTÁTICA','60.00', 'M'),
(2,'ECO PARTES BLANDAS TESTÍCULOS','60.00','M'),
(2,'ECO TESTICULOS','60.00','M'),
-- GINECOLOGIA
(9,'CONSULTA','40.00','F'),
(9,'PAPANICOLAO','40.00','F'),
(9,'CULTIVO DE SECRECION VAGINAL','60.00','F'),
(9,'BIOPSIA DE CUELLO UTERINO','150.00','F'),
(9,'COLCOSPIA','120.00','F');

INSERT INTO alergias (alergia) VALUES
('Ampisilina'),
('Penicilina'),
('Paracetamol'),
('Ibuprofeno'),
('Aspirina '),
('Salbutamol'),
('Amoxicilina');