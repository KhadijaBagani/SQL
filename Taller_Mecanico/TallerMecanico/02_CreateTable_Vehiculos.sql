USE Datos_Taller

CREATE TABLE Vehiculos (
    Matricula_PK VARCHAR(10) PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    A�o_Matriculacion INT NOT NULL,
    Kilometraje INT NOT NULL,
    Tipo_Combustible VARCHAR(15) CHECK (Tipo_Combustible IN ('Gasolina', 'Diesel', 'H�brido', 'El�ctrico')) NOT NULL,
    Tipo_Cambio VARCHAR(15) CHECK (Tipo_cambio IN ('Manual', 'Autom�tico')) NOT NULL,
    Potencia_Motor INT NOT NULL,
    NIF_Cliente VARCHAR(9),
    FOREIGN KEY (NIF_Cliente) REFERENCES Clientes(NIF)
);  

