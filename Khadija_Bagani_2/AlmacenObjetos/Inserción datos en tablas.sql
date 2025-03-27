---Insertar estanterías
Insert into Estanterias (EstanteriaID) values (1), (2), (3), (4), (5), (6), (7), (9), (10);

---Insertar espacios

INSERT INTO Espacios (EstanteriaID, Posicion)
VALUES (1, 'Fila 1'), (2, 'Fila 2'), (3, 'Fila 3'), (4, 'Fila 4'), (5, 'Fila 5');

--- Insertar objetos

INSERT INTO Objetos (TipoObjeto_FK, NombreObjeto, ValorCompra, EspacioID)
VALUES (1, 'Galletas de Oreo', '1,90', 3), (3, 'Chaqueta de Marta', '44,05', 2)

---Insertar tipoObjeto

Insert into TipoObjeto (TipoObjeto)
Values ('Alimentos'), ('libros'), ('ropa'), ('utensilios cocina')