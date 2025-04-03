USE recetas_para_probar

CREATE TABLE ingredientes (
    Ingrediente_PK TINYINT PRIMARY KEY IDENTITY(1,1),
    Nombre_ingrediente VARCHAR(50) NOT NULL,
    Temporada_FK TINYINT NOT NULL,
    FOREIGN KEY (Temporada_FK) REFERENCES temporadas(Temporada_PK)
);