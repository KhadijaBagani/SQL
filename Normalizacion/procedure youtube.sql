
ALTER PROCEDURE Añadir_Votos (
	@voto  TINYINT,
	@video_PK INT,
	@Usuario_PK INT
	
)
AS 

BEGIN TRANSACTION;
	BEGIN TRY	 

 -- Verificar si la calificación está dentro del rango permitido
	IF @voto < 1 OR @voto > 10 
	BEGIN
			PRINT 'La calificacion debe estar entre 0,5 y 10';
	ROLLBACK TRANSACTION;
		  RETURN;
    END

	  -- Verificar que el video exista
    IF NOT EXISTS (
        SELECT 1
        FROM Customs.Videos
        WHERE Id = @video_PK
    )
	BEGIN
	
        RAISERROR('El video con ese ID no existe.', 16, 1);
        RETURN;
   END

 -- Verificar si el usuario ya ha dejado una calificación
    IF EXISTS (
        SELECT TOP(1) 1
        FROM Customs.Votos
        WHERE Video_FK = @video_PK AND Usuario_FK = @Usuario_PK
    ) 
	BEGIN
		DECLARE @Voto_Anterior TINYINT;

	 -- Obtener voto anterior
            SELECT @Voto_Anterior = Voto
            FROM Customs.Votos
            WHERE Video_FK = @video_PK AND Usuario_FK = @Usuario_PK;

        -- Si ya existe una calificación, la actualizamos
		
	    UPDATE Customs.votos
        SET Voto = @voto
        WHERE Usuario_FK = @Usuario_PK AND video_FK = @video_PK;
 
		-- Actualizar total de votos

		 UPDATE Customs.Videos
		 SET Total_Votos = Total_Votos - @Voto_Anterior + @voto
		 WHERE Usuario_FK = @Usuario_PK AND Id = @video_PK;
	END 
	ELSE
	BEGIN

        -- Si no existe una calificación, la insertamos
        INSERT INTO Customs.Votos (Video_FK, Usuario_FK ,Voto)
        VALUES (@video_PK, @Usuario_PK, @voto);
	
	
		--Recalcular cantidad de votos
		UPDATE Customs.Videos
		SET Cantidad_Votos =  Cantidad_Votos + 1, Total_Votos = Total_Votos + @voto
		WHERE Videos.Id = @video_PK    
	END
	
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
	PRINT @@TRANCOUNT
        ROLLBACK TRANSACTION;
		THROW;
        --RAISERROR('Ocurrió un error en la operación.', 16, 1);
    END CATCH
GO	

EXEC Añadir_Votos @Usuario_PK = 1, @Video_PK = 5, @Voto = 4
GO