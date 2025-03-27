---Tabla: Estanterias

CREATE TABLE Estanterias (
    EstanteriaID INT PRIMARY KEY, -- Identificador único de la estantería
    Longitud FLOAT NOT NULL, -- Longitud de la estantería en metros
    Altura FLOAT NOT NULL -- Altura de la estantería en metros
);
---Tabla: Espacios

CREATE TABLE Espacios (
    EspacioID INT PRIMARY KEY, -- Identificador único del espacio
    EstanteriaID INT NOT NULL, -- Relación con la tabla Estanterias
    Posicion VARCHAR(50) NOT NULL, -- Posición en la estantería
    FOREIGN KEY (EstanteriaID) REFERENCES Estanterias(EstanteriaID) -- Clave externa
);
---Tabla: Objetos

CREATE TABLE Objetos (
    ObjetoID INT PRIMARY KEY, -- Identificador único del objeto
    TipoObjeto_FK VARCHAR(50) NOT NULL, -- Identificador único del tipo de objeto
    NombreObjeto VARCHAR(100) NOT NULL, -- Nombre descriptivo del objeto
    ValorCompra FLOAT NOT NULL, -- Valor de compra del objeto
    EspacioID INT NOT NULL, -- Relación con la tabla Espacios
    FOREIGN KEY (EspacioID) REFERENCES Espacios(EspacioID) -- Clave externa
);

---Tabla TipoObjetos
CREATE TABLE TipoObjetos (
    TipoObjeto_PK INT PRIMARY KEY, -- Identificador único del tipo de objeto
    TipoObjeto VARCHAR(50) NOT NULL -- Tipo de objeto (ej: alimentos, libros)