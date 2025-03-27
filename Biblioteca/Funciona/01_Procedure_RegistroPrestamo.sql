Alter PROCEDURE Registro_Prestamo
    @Socio_FK TINYINT,
    @Libro_FK TINYINT,
    @Fecha_Retiro DATE
AS
BEGIN
    INSERT INTO Prestamos (Socio_FK, Libro_FK, Fecha_Retiro)
    VALUES (@Socio_FK, @Libro_FK, @Fecha_Retiro);

END;