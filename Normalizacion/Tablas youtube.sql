

CREATE TABLE Customs.Usuarios (

	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Usuario VARCHAR(15) NOT NULL,
	Contraseña CHAR(15) NOT NULL

);
GO
CREATE TABLE Customs.Videos (

	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Descripcion Text NOT NULL,
	Usuario_FK INT NOT NULL,
	Fecha_Publicacion DATE NOT NULL,
	Cantidad_Votos INT DEFAULT 0,
	Total_Votos INT DEFAULT 0,
    FOREIGN KEY (Usuario_FK) REFERENCES Customs.Usuarios(Id) ON DELETE CASCADE
);
GO
CREATE TABLE Customs.Votos (
	PRIMARY KEY (Video_FK, Usuario_FK),
	Video_FK INT NOT NULL,
	Usuario_FK INT NOT NULL,
	Voto TINYINT CHECK (Voto BETWEEN 0 AND 10),
	FOREIGN KEY (Video_FK) REFERENCES Customs.videos(Id),
    FOREIGN KEY (Usuario_FK) REFERENCES Customs.Usuarios(Id),
    
);
GO

