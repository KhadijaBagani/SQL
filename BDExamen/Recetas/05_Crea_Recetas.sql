USE recetas_para_probar

CREATE TABLE recetas (
    Receta_PK TINYINT PRIMARY KEY IDENTITY(1,1),
    Nombre_receta VARCHAR(50) NOT NULL,
    Elaboracion TEXT NOT NULL,
    Tiempo_min TINYINT NOT NULL CHECK (tiempo_min > 0 AND tiempo_min <= 240),
    Categoria_FK VARCHAR(5) NOT NULL,
    Dificultad_FK VARCHAR(5) NOT NULL,
    FOREIGN KEY (Categoria_FK) REFERENCES categorias(Categoria_PK),
    FOREIGN KEY (Dificultad_FK) REFERENCES dificultades(Dificultad_PK)
);