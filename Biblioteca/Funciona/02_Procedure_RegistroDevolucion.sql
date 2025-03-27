CREATE PROCEDURE Registro_Devolucion
    @Prestamo_PK INT,
    @Fecha_Devolucion DATE
AS
BEGIN
    UPDATE Prestamos
    SET Fecha_Devolucion = @Fecha_Devolucion
    WHERE Prestamo_PK = @Prestamo_PK;
END;