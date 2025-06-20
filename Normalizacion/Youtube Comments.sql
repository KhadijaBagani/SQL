/*
Tenemos la siguiente tabla para representar los comentarios de los vídeos y las respuestas a otros comentarios.
*/
USE Youtube2006
CREATE TABLE Comments(
	commentId BIGINT PRIMARY KEY IDENTITY(1,1),
	videoId INT NOT NULL,
	parentCommentId BIGINT NULL,
	userId INT NOT NULL,
	content NVARCHAR(MAX) NOT NULL,
)
/*
1. Crea un stored procedure para poner un comentario en un vídeo (0,25 puntos)
*/
CREATE PROCEDURE Añadir_ComentariO
    @videoId INT,
    @userId INT,
    @content NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Comments(videoId, userId, content)
    VALUES (@videoId, @userId, @content);
END;

EXEC Añadir_ComentariO @videoId = 1, @userId = 1, @content = 'SDDDS'
/*
2.Cread otro stored procedure para poner comentarios en respuesta a otro comentario. (0,25 Puntos)

Importante: además del texto introducido por el usuario, los comentarios deben empezar por “@username ” donde username es el nombre del usuario al 
que se está respondiendo.
*/
CREATE PROCEDURE Respuesta_Comentario
	@videoId INT, 
	@parentCommentId BIGINT, 
	@userId INT, 
	@content NVARCHAR(MAX)
AS 
BEGIN
	 DECLARE @username nvarchar(30);

    -- Obtener el nombre de usuario al que se responde
    SELECT @username = u.username
    FROM Comments c
		JOIN Users u 
		ON c.userId = u.userId
    WHERE c.commentId = @parentCommentId;

    -- Insertar el comentario con el prefijo "@username "
    INSERT INTO Comments(videoId, parentCommentId, userId, content)
    VALUES (@videoId, @parentCommentId, @userId, '@' + @username + ' ' + @content);
END

EXEC Respuesta_Comentario  @videoId= 1, 
	@parentCommentId= 1, 
	@userId = 2, 
	@content= 'kkk'
/*
3.Nos hemos dado cuenta “a posteriori” de que nos iría bien que los comentarios tuvieran Fecha y commentCount, así que queremos modificar la tabla 
para que tengan esos campos. (0,5 Puntos)

Han de ser NO nullables
Las nuevas columnas han de ser retrocompatibles con los stored procedures sin necesidad de modificarlos. (Han de funcionar sin errores pese a no 
introducir esos datos)
*/
ALTER TABLE Comments
ADD Fecha DATE NOT NULL DEFAULT GETDATE()
ALTER TABLE Comments 
ADD commentCount INT NOT NULL DEFAULT 0
/*
4.Modificad el SP del apartado 2 para que además actualice el commentCount (0,5 Puntos)
*/
ALTER PROCEDURE Respuesta_Comentario
	@videoId INT, 
	@parentCommentId BIGINT, 
	@userId INT, 
	@content NVARCHAR(MAX)
AS 
BEGIN
	 DECLARE @username NVARCHAR(30);

    -- Obtener el nombre de usuario al que se responde
    SELECT @username = u.username
    FROM Comments c
		JOIN Users u 
		ON c.userId = u.userId
    WHERE c.commentId = @parentCommentId;

    -- Insertar el comentario con el prefijo "@username "
    INSERT INTO Comments(videoId, parentCommentId, userId, content)
    VALUES (@videoId, @parentCommentId, @userId, '@' + @username + ' ' + @content);

	--Actualizar commentCount
	UPDATE Comments
	SET commentCount = commentCount + 1
	WHERE parentCommentId = @parentCommentId
END

EXEC Respuesta_Comentario @videoId= 1, 
	@parentCommentId= 1, 
	@userId = 3, 
	@content= 'kkk'