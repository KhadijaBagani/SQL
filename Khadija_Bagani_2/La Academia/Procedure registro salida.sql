Create PROCEDURE registra_salida
(
	@alumno varchar(15),
	@aula char(10)
)
AS
	-- Verfica la existencia del alumno
	IF NOT EXISTS (SELECT TOP 1 Nombre FROM alumnos WHERE Nombre = @alumno)
	BEGIN
		PRINT 'El alumno ' + @alumno + ' no está matriculado';
		RETURN;
	END
	-- Verifica le existencia del aula
	IF NOT EXISTS (SELECT TOP 1 Aula_PK FROM aulas WHERE Nombre_Aula = @aula)
	BEGIN
		PRINT 'El Aula ' + @aula + ' no existe';
		RETURN;
	END
	-- Obtencion de la PK del aula
	DECLARE @Aula_key tinyint
	SELECT @Aula_key = Aula_PK FROM aulas WHERE Nombre_Aula = @aula

	-- Borra el aula del alumno
	UPDATE [Entradas/Salidas]
	SET aula_FK = NULL
	WHERE Alumno_FK = @alumno;