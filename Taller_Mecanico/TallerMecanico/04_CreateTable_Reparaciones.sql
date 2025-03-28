USE Datos_Taller

CREATE TABLE Reparaciones (
    Reparacion_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
    Fecha_Reparacion DATE DEFAULT GETDATE(),
    Matricula_FK VARCHAR(10),
    Descripcion TEXT NOT NULL,
    Precio_Materiales MONEY NOT NULL,
    Horas_Reparacion DECIMAL(4, 2) DEFAULT 0.5 CHECK (Horas_Reparacion >= 0.25),
    Precio_ManoObra  AS (Horas_Reparacion * 50) PERSISTED,
    Importe_Total  AS (Precio_Materiales + (Horas_Reparacion * 50)) PERSISTED,
    Factura_FK TINYINT,
    FOREIGN KEY (Matricula_FK) REFERENCES Vehiculos(Matricula_PK),
	FOREIGN KEY (Factura_FK) REFERENCES Facturas(Factura_PK)
);