
---Tabla: Aulas

CREATE TABLE Aulas (
    Aula_PK INT PRIMARY KEY, 
    Nombre_Aula FLOAT NOT NULL
    
);

---Tabla: Paises

Create Table Paises (
	Pais_PK INT PRIMARY KEY,
	Nombre_Pais VARCHAR(50) NOT NULL
	);
---Tabla: Alumnos

CREATE TABLE Alumnos (
    Alumno_PK INT PRIMARY KEY, 
     Nombre INT NOT NULL, 
    Apellido1 VARCHAR(50) NOT NULL, 
	Apellido2 varchar(50) not null,
	Pais_FK Varchar(50)
  
);

