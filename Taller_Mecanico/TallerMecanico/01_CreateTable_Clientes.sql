USE Datos_Taller

CREATE TABLE Clientes (
    NIF VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Poblacion VARCHAR(50) NOT NULL,
    CP FLOAT(7) NOT NULL,
    Telefono FLOAT NOT NULL,
    Correo_Electronico VARCHAR(100) NOT NULL,
    Datos_Adjuntos VARCHAR(255) NOT NULL,
	CONSTRAINT [CK_Correo_Electronico] CHECK  (([Correo_Electronico] like '%_@_%._%'))
	);