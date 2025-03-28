CREATE PROCEDURE  Crear_Factura
    @Reparacion_PK TINYINT

	 -- Declarar variables para almacenar los datos necesarios para la factura
AS
BEGIN
    DECLARE @Matricula_FK VARCHAR(10), @NIF_Cliente VARCHAR(9), @Kilometraje INT, @Precio_Materiales MONEY, @Horas_Reparacion DECIMAL(4,2), @Precio_ManoObra DECIMAL(10,2), @Importe_Total DECIMAL(10,4), @Factura_PK TINYINT;
    
    -- Obtener los datos de la reparación
    SELECT
        @Matricula_FK = Matricula_FK,
        @NIF_Cliente = (SELECT NIF_Cliente FROM Vehiculos WHERE Matricula_PK = Reparaciones.Matricula_FK),
        @Kilometraje = (SELECT Kilometraje FROM Vehiculos WHERE Matricula_PK = Reparaciones.Matricula_FK),
        @Precio_Materiales = Precio_Materiales,
        @Horas_Reparacion = Horas_Reparacion,
        @Precio_ManoObra = Precio_ManoObra,
        @Importe_Total = Importe_Total
		
    FROM Reparaciones
    WHERE Reparacion_PK = @Reparacion_PK;
	

    
    -- Insertar la factura
    INSERT INTO Facturas (Fecha, NIF_Cliente, Matricula_FK, Kilometraje, Importe_SinIVA)
    VALUES (GETDATE(), @NIF_Cliente, @Matricula_FK, @Kilometraje, @Precio_Materiales + @Precio_ManoObra);

   -- Obtener el número de la factura recién creada (clave primaria generada automáticamente) 
	SET @Factura_PK = SCOPE_IDENTITY();

    -- Actualizar la reparación para indicar la factura

    UPDATE Reparaciones
    SET Factura_FK = @Factura_PK
    WHERE Reparacion_PK = @Reparacion_PK

	END;