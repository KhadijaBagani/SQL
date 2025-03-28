USE Datos_Taller

CREATE TABLE Facturas (
    Factura_PK TINYINT IDENTITY(1,1) PRIMARY KEY ,
    Fecha DATE DEFAULT GETDATE(),
    NIF_Cliente VARCHAR(9),
    Matricula_FK VARCHAR(10),
    Kilometraje INT,
    Importe_SinIVA DECIMAL(10, 2) NOT NULL,
    IVA  AS (Importe_SinIVA * 0.21) PERSISTED,
    Importe_Total  AS (Importe_SinIVA + (Importe_SinIVA * 0.21)) PERSISTED,
    FOREIGN KEY (NIF_Cliente) REFERENCES Clientes(NIF),
    FOREIGN KEY (Matricula_FK) REFERENCES Vehiculos(Matricula_PK)
);