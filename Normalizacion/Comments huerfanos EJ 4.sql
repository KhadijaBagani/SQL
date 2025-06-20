/*
Recordad no modificar la tabla original, cread una copia con Select Into (entregad tambi�n esta consulta)
Para comprobar que lo hab�is hecho bien, intentad a�adir la relaci�n entre cada Comment y el usuario que lo ha creado. Si falla, es que a�n quedan hu�rfanos mal indicados.


4. Convertir la consulta de �correci�n� en una transacci�n que guarde en una tabla el Id de los hu�rfanos corregidos y el Id de usuario antes de la modificaci�n (1 Puntos)
*/


DROP TABLE IF EXISTS CommentsModified
DROP TABLE IF EXISTS Transaccion



CREATE TABLE Transaccion
(IdAntesModificar INT, IdComments INT)


SELECT * 
INTO CommentsModified
FROM Comments;
GO

DROP PROCEDURE IF EXISTS ComentariosHuerfanos2
GO

CREATE PROCEDURE ComentariosHuerfanos2
as
BEGIN 
	BEGIN TRANSACTION Correccion

	INSERT INTO Transaccion (idComments, idAntesModificar)
	Select c.Id as idComments, UserId as idAntesModificar
	From CommentsModified C
	LEFT JOIN Users U
	ON C.UserId = U.Id
	WHERE U.id IS NULL  AND USERID IS NOT NULL

	

    UPDATE CommentsModified
	SET USERID = NULL
	WHERE UserId IN 
	(
		SELECT  UserId 
		FROM CommentsModified C
		LEFT JOIN Users U
		ON C.UserId = U.Id
		WHERE U.id IS NULL  AND USERID IS NOT NULL

	)
	;
	COMMIT 
END
GO
EXEC ComentariosHuerfanos2


Select T.*, CM.UserId, C.UserId
FROM Transaccion T
join CommentsModified CM
ON T.IdComments =CM.Id
join Comments C
ON T.IdComments = C.Id
