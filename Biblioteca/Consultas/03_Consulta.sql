---3.Considerando que el plazo de préstamo es de 30 días, crea una consulta que muestre el nombre, la dirección de mail y el título del libro. 
SELECT Socios.Nombre, Socios.Direccion, Socios.Correo_Electronico, Datos_Libros.Titulo FROM Prestamos 
	INNER JOIN Socios  
	ON prestamos.Socio_FK = socios.Socio_PK
	INNER JOIN Datos_Libros
	ON prestamos.Libro_FK = Datos_Libros.Libro_PK
WHERE prestamos.Fecha_Devolucion IS NULL 
AND DATEDIFF(DAY, GETDATE(), DATEADD(DAY, 30, prestamos.Fecha_Retiro)) <= 5;