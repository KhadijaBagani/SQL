/*
Partiendo de la tabla de Comments (con la fecha y el commentCount) YA AÑADIDOS, vamos a analizar distintas formas de mejorarlas

1. Tenemos múltiples datos en la tabla que son redundantes (están ya en otro sitio) o ineficientes en su uso de la memoria. Identifícalos, 
explica porqué lo son y las mejoras que harías. (0,75 puntos)
Si hay algo que no mejorarías, explica también porqué

--La columna content, al responder a un usuario, aparece el @username lo cual no haria falta teniendo el UserId.
--La columna commentCount, se podria calcular con una query SELECT haciendo recuento de todos los comentarios con el mismo parentCommentId.
--La columna commentId y parentCommentId, el tipo de dato es super grande y almacena mucho más que al usar, por ejemplo, un Int o SmallInt.
--La columna content, el tipo de dato NVARCHAR(MAX) se podria cambiar y limitar el numero en lugar de poner MAX, sobretodo si los comentarios son cortos 
se ocupa memoria innecesaria.

2. Analiza ahora la velocidad de las posibles consultas relacionadas con los comentarios e indica las mejoras que harías. (0,75 puntos)
Considerad también las consultas resultantes de eliminar las redundancias en el apartado anterior.

--Crear indice en el cuál ordene los comentarios de cada video por orden cronológico y las agrupe por el mismo parentCommentId.
--En la columna content, eliminar la restricción de que aprezca el @username.
--Antes de añadir UserId y VideoId, asegurar de que existen.
--Eliminar columna commentCount y buscarlo con una consulta o hacer una vista.
*/
SELECT COUNT(*) CommentCount, parentCommentId
    FROM Comments 
WHERE parentCommentId IS NOT NULL
Group by parentCommentId
/*




