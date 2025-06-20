/*
Comments Huerfanos (3.5 puntos)
Nos hemos dado cuenta de que en la Base de Datos hay muchos Comentarios huérfanos (cuyo usuario ha sido borrado) que no están marcados como tal y nos están 
dando problemas. Haz lo siguiente:

1. Explica porqué este error reduce la eficiencia de la base de datos (1 puntos)

POrque la BD gasta un tiempo que no es necesario relacionar los comentarios con los usuarios inexistentes, además de que estos usuarios ocupan un espacio en BDque se podria aprovechar.

2. Haz una consulta para encontrar todos los Comentarios que tienen este problema. (1 puntos)

*/
SELECT Text, UserId, U.Id as 'Id of User'
FROM Comments C
LEFT JOIN Users U
ON C.UserId = U.Id
WHERE U.id IS NULL  AND USERID IS NOT NULL 

/*
3. Ahora implementa un Stored Procedure que corrija todos estos valores erróneos. (1 puntos)
*/

-- Copiar tabla comments
SELECT * 
INTO CommentsModified
FROM Comments;
GO

CREATE PROCEDURE ComentariosHuerfanos
as
BEGIN
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
  
END
GO
EXEC ComentariosHuerfanos

SELECT Text, UserId, U.Id as 'Id of User'
FROM CommentsModified C
LEFT JOIN Users U
ON C.UserId = U.Id
WHERE U.id IS NULL  AND USERID IS NOT NULL 


