---2.Crea una consulta para listar los libros en la biblioteca
SELECT Datos_Libros.Titulo, Datos_Libros.Autor_FK, Datos_Libros.FechaEdicion FROM Datos_Libros
LEFT JOIN Prestamos 
ON prestamos.Libro_FK = Datos_Libros.Libro_PK
WHERE prestamos.Libro_FK IS NULL OR prestamos.Fecha_Devolucion IS NOT NULL;