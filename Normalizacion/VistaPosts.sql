/*
1. Queremos crear una vista de Posts que nos permita ver el texto (title y body) de cada pregunta hecha en Stack Overflow y el de su respuesta aceptada
si la hubiera para hacernos una idea de lo que verán los usuarios. (1 Punto)
*/
CREATE VIEW  Posts_2  AS
SELECT P.Title, P.Body, P2.AcceptedAnswerId
FROM Posts p
LEFT JOIN Posts P2
ON p.AcceptedAnswerId = P2.Id
GO

/*
2. Ahora nos gustaría crear otra vista para que nos muestre el texto los comentarios asociados a un mismo post agregados en una sola entrada de texto. (1 Punto)

Haced un CAST a NVARCHAR(MAX) u os dará error por exceder el límite de caracteres.
Necesitareis usar STRING_AGG para combinar los comentarios
Separad los comentarios en distintas líneas (Recordadme que os explique cómo)

*/

CREATE VIEW Comments_2 
AS
	SELECT STRING_AGG(CAST(Text AS NVARCHAR(MAX)), CHAR(10)) as Text, PostId
	FROM Comments
	GROUP BY PostId
	
GO

/*
3. Mejora la vista anterior asegurando que cumple lo siguiente: (1 punto)

(No hace falta hacer este ejercicio para pasar al siguiente)
Los comentarios se agregan en el orden que se hicieron
Formatead los comentarios para que sean una lista HTML con cada comentario dentro de un <li></li>.
Mejorad la optimización de la consulta (Si vais a modificar tablas, usad copias)
*/

DROP VIEW Comments_2 
GO
CREATE VIEW Comments_2 
AS
	SELECT STRING_AGG('<li>'+CAST(Text AS NVARCHAR(MAX))+'</li>', CHAR(10))  WITHIN GROUP (ORDER BY CreationDate)  AS Text, PostId
	FROM Comments
	WHERE PostId <100
	GROUP BY PostId

GO

/*
4.Modificad la vista de Posts del apartado 1 para que muestre también los comentarios de la pregunta y de la respuesta. (1 Punto)

Mirad los comentarios de Este Post si teneis dudas de como los tendríais que colocar
*/
DROP VIEW Posts_2
GO
CREATE VIEW  Posts_2  
AS
	SELECT P.Title, P.Body, P2.AcceptedAnswerId, 
	STRING_AGG('<li>'+CAST(Text AS NVARCHAR(MAX))+'</li>', CHAR(10))  WITHIN GROUP (ORDER BY C.CreationDate)  AS Text
	FROM Posts P
	LEFT JOIN Posts P2
ON p.AcceptedAnswerId = P2.Id
	JOIN Comments_2 C
	ON C.PostId = P.Id 
	GROUP BY P.Title, P.Body, P2.AcceptedAnswerId

GO