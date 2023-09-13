USE sispsolidario;

INSERT INTO Medio_Pagos (nombrePago)VALUES
('Yape'),
('Transferencia'),
('Efectivo');

INSERT INTO servicios (tipo, nombreServicio, precio) VALUES
('s', 'terapia', 11),
('E', 'Laboratorio', 50),
('S', 'Medicina General', 99);

INSERT INTO personas (nombres, apellidoPaterno, apellidoMaterno, tipoDocumento, numeroDocumento, fechaNacimiento, genero, telefono) VALUES
('Juan', 'Quispe', 'Acevedo', 'N', '98745632', '2003-01-01', 'M', NULL),
('Ana', 'Carbajal', 'Loyola', 'N', '12546321', '2000-01-16', 'F', NULL),
('Juana', 'Uceda', 'Ramos', 'N', '32145632', NULL, 'F', NULL),
('Francisca', 'Ureña', 'Luna', 'N', '96336987', NULL, 'F', NULL),
('Benito', 'Martinez', 'Alfaro', 'N', '95115978', NULL, 'M', NULL),
('Laura', 'Polo', 'Manrique', 'N', '74114789', NULL, 'F', NULL);

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
(3,3);



-- INSERT INTO Detalle_Servicios (precio, idAtencion ,idServicio) VALUES 
-- (15, 1, 1),
-- (15, 2, 3),
-- (15, 3, 2);

SELECT * FROM medio_pagos;
SELECT * FROM servicios;
SELECT * FROM personas;
SELECT * FROM Especialistas;
SELECT * FROM usuarios;
SELECT * FROM Especialistas_Servicios;
SELECT * FROM atenciones;
SELECT * FROM Detalle_Servicios;