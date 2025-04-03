USE recetas_para_probar

CREATE TABLE ingredientes_recetas (
    Ingrediente_receta TINYINT PRIMARY KEY IDENTITY(1,1),
    Receta_FK TINYINT NOT NULL,
    Ingrediente_FK TINYINT NOT NULL,
    Cantidad_gramos SMALLINT NOT NULL CHECK (cantidad_gramos >= 1),
    FOREIGN KEY (Receta_FK) REFERENCES recetas(Receta_PK),
    FOREIGN KEY (Ingrediente_FK) REFERENCES ingredientes(Ingrediente_PK)
);