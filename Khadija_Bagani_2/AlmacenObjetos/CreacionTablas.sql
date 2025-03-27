---Tabla: Estanterias

CREATE TABLE Estanterias (
    EstanteriaID INT PRIMARY KEY, -- Identificador �nico de la estanter�a
    Longitud FLOAT NOT NULL, -- Longitud de la estanter�a en metros
    Altura FLOAT NOT NULL -- Altura de la estanter�a en metros
);
---Tabla: Espacios

CREATE TABLE Espacios (
    EspacioID INT PRIMARY KEY, -- Identificador �nico del espacio
    EstanteriaID INT NOT NULL, -- Relaci�n con la tabla Estanterias
    Posicion VARCHAR(50) NOT NULL, -- Posici�n en la estanter�a
    FOREIGN KEY (EstanteriaID) REFERENCES Estanterias(EstanteriaID) -- Clave externa
);
---Tabla: Objetos

CREATE TABLE Objetos (
    ObjetoID INT PRIMARY KEY, -- Identificador �nico del objeto
    TipoObjeto_FK VARCHAR(50) NOT NULL, -- Identificador �nico del tipo de objeto
    NombreObjeto VARCHAR(100) NOT NULL, -- Nombre descriptivo del objeto
    ValorCompra FLOAT NOT NULL, -- Valor de compra del objeto
    EspacioID INT NOT NULL, -- Relaci�n con la tabla Espacios
    FOREIGN KEY (EspacioID) REFERENCES Espacios(EspacioID) -- Clave externa
);

---Tabla TipoObjetos
CREATE TABLE TipoObjetos (
    TipoObjeto_PK INT PRIMARY KEY, -- Identificador �nico del tipo de objeto
    TipoObjeto VARCHAR(50) NOT NULL -- Tipo de objeto (ej: alimentos, libros)