CREATE TABLE Vehiculos (
    Matricula VARCHAR(10) PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Año_Matriculacion INT NOT NULL,
    Kilometraje INT NOT NULL,
    Tipo_Combustible VARCHAR(25) NOT NULL,
    Tipo_Cambio VARCHAR(15)  NOT NULL,
    Potencia_Motor INT NOT NULL,
    NIF_Cliente VARCHAR(9),
    FOREIGN KEY (NIF_Cliente) REFERENCES Clientes(NIF)
);  