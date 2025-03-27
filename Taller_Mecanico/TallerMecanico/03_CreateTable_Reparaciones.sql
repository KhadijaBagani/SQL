CREATE TABLE Reparaciones (
    Reparacion_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
    FechaReparacion DATE DEFAULT CURDATE(),
    Matricula VARCHAR(10),
    Descripcion TEXT NOT NULL,
    Precio_Materiales MONEY NOT NULL,
    Horas_Reparacion DECIMAL(4, 2) DEFAULT 0.5 CHECK (HorasReparacion >= 0.25),
    Precio_ManoObra MONEY GENERATED ALWAYS AS (Horas_Reparacion * 50) STORED,
    Importe_Total MONEY GENERATED ALWAYS AS (Precio_Materiales + Precio_ManoObra) STORED,
    Facturada DEFAULT FALSE,
    FOREIGN KEY (Matricula_Vehiculo) REFERENCES Vehiculos(Matricula)
);