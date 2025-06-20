/*
Partiendo de la tabla de Comments (con la fecha y el commentCount) YA A�ADIDOS, vamos a analizar distintas formas de mejorarlas

1. Tenemos m�ltiples datos en la tabla que son redundantes (est�n ya en otro sitio) o ineficientes en su uso de la memoria. Identif�calos, 
explica porqu� lo son y las mejoras que har�as. (0,75 puntos)
Si hay algo que no mejorar�as, explica tambi�n porqu�

--La columna content, al responder a un usuario, aparece el @username lo cual no haria falta teniendo el UserId.
--La columna commentCount, se podria calcular con una query SELECT haciendo recuento de todos los comentarios con el mismo parentCommentId.
--La columna commentId y parentCommentId, el tipo de dato es super grande y almacena mucho m�s que al usar, por ejemplo, un Int o SmallInt.
--La columna content, el tipo de dato NVARCHAR(MAX) se podria cambiar y limitar el numero en lugar de poner MAX, sobretodo si los comentarios son cortos 
se ocupa memoria innecesaria.

2. Analiza ahora la velocidad de las posibles consultas relacionadas con los comentarios e indica las mejoras que har�as. (0,75 puntos)
Considerad tambi�n las consultas resultantes de eliminar las redundancias en el apartado anterior.

--Crear indice en el cu�l ordene los comentarios de cada video por orden cronol�gico y las agrupe por el mismo parentCommentId.
--En la columna content, eliminar la restricci�n de que aprezca el @username.
--Antes de a�adir UserId y VideoId, asegurar de que existen.
--Eliminar columna commentCount y buscarlo con una consulta o hacer una vista.
*/
SELECT COUNT(*) CommentCount, parentCommentId
    FROM Comments 
WHERE parentCommentId IS NOT NULL
Group by parentCommentId
/*




