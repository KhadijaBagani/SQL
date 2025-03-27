
CREATE TABLE Socios (
    Socio_PK TINYINT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(70) NOT NULL,
    Fecha_Alta DATE NOT NULL,
    CONSTRAINT CK_CorreoElectronico CHECK (Correo_Electronico LIKE '%_@__%.__%')
	);