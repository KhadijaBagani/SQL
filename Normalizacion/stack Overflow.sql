
 /*
1. Por cada columna de la tabla (en orden) indicad qué Normal Form incumple y porqué (1 Punto)

Si la columna depende de una tabla que no sea Users, indicadlo

[PostCount] ,[QuestionCount] ,[AnswerCount] ,[AcceptedAnswerCount] ,[CommentCount], [PostEdits], [LastPostDate], dependen de la tabla Posts.
[BadgeAmount],[UniqueBadgeAmount],[BadgeTitles] dependen de la tabla Badges
 

Si la columna viola varias Normal Forms por distintos motivos, indicad cada motivo

-[PostCount] 3NormalForm. Es innecesaria ya que con las columnas [QuestionCount] ,[AnswerCount] se puede sacar el valor de esa columna.

-[BadgeAmount]  La columna es innecesaria ya que con la columna [UniqueBadgeAmount] es suficiente. En la tabla Badges en lugar de relacionar los UserId en esa 
tabla, haria la columna ID y Names y vincularia cada ID de Badges en la tabla UserID. Así se obtendria Badges unicos y no se repetirian.

-[BadgeTitles] 1NormalForm. Contiene más de una valor separadas por coma. 

-[SumVotes] 3FormalNorm. La columna es innecesaria ya que con [UpVotes],[DownVotes] se puede obtener el valor de la columna.

-[LastPostDate] 1NormalForm. Accepta valores nulos y hay alguna fila que tiene NULL y no es clave foranea.


2. Debido al coste de computar la tabla solo la actualizamos cada varias horas, es decir, que la tabla siempre se encuentra ligeramente desactualizada. 
Por cada columna de Custom.UserStats, indica cómo de propensa es a quedar desactualizada. (1 Punto)
Analizad las tablas relacionadas para saber si los valores cambian a menudo
Mirad la web de Stack Overflow para ver el tipo de uso que reciben estos datos.

[UserId],[DisplayName] Es más propensa de quedar desactualizada porque no se crean muchos usuarios tan frecuentemente. 
[PostCount], [QuestionCount] Es más propensa de quedar desactualizada porque es poco probable que suba el valor de posts y preguntas por usuario. 
[AnswerCount]. Es menos propensa de quedar desactualizada porque se suelen obtener respuestas poco despues de lanzar la pregunta y puede que el usuario le sea urgente la respuesta.
[AcceptedAnswerCount]. Es menos propensa de quedar desactualizada porque se suelen obtener respuestas rapidamente y a otro usuario le podria interessar saber la resuesta correcta.  
[CommentCount]. Es menos propensa de quedar desactualizada porque se obtienen comentarios poco despues de lanzar la pregunta.
[PostEdits], [LastPostDate]. Es menos propensa de quedar desactualizada porque no se puodrá hacer un seguimiento del Post y de saber si hay alguna respuesta o modificación del propio Post.
[BadgeAmount], [UniqueBadgeAmount],[BadgeTitles]. Es más propensa de quedar desactualizada porque es poco probable que el usuario cambie estos campos una vez lanzada la pregunta.
[Reputation]. Debe ser actualizada aunque con poca frecuencia para no dar la imagen de engañar a los usuarios.
[UpVotes], [DownVotes], [SumVotes]. Es más propensa de quedar desactualizada porque poca gente suele votar despues de ver el Post.


3. Partiendo del Apartado 1, indica qué columnas pueden ser eliminadas con una pérdida negligible de velocidad (0.5 puntos)
Considera el tipo de operaciones necesarias para calcularlas y su eficiencia
Recordad los distintos factores que afectan a la eficiencia de un Join

[PostCount] es innecesaria ya que con las columnas [QuestionCount],[AnswerCount] se puede sacar el valor de esa columna.

--*/

SELECT QuestionCount + AnswerCount AS PostCount FROM [StackOverflowMini].[Custom].[UserStats]

/*
[DisplayName], [Reputation], [UpVotes],[DownVotes] ya estan en la tabla Users. Por lo que si se quiere saber estos campos con [UserId] se podria llegar a 
encontrar información de esas columnas.
--*/
 set statistics time on
SELECT U.DisplayName,  U.Reputation, U.UpVotes, U.DownVotes, C.UserId FROM Users U
 JOIN Custom.UserStats C
 ON C.UserID = U.ID
  set statistics time off
/*
[BadgeAmount] La columna es innecesaria ya que con la columna [UniqueBadgeAmount] es suficiente. En la tabla Badges en lugar de relacionar los UserId en esa tabla, haria la columna ID y Names y vincularia cada ID de Badges en la tabla UserID. Así se obtendria Badges unicos y no se repetirian.
[UniqueBadgeAmount] se podria sacar de la tabla Badges con la siguiente query.
--*/
  set statistics time on
 SELECT  COUNT (Distinct B.Name) AS UniqueBadgeAmount, C.UserId FROM Badges B
 JOIN Custom.UserStats C
 ON C.UserID = B.UserID
  GROUP BY C.UserId
set statistics time off

/*
[SumVotes] La columna es innecesaria ya que con [UpVotes],[DownVotes] se puede obtener el valor de la columna.
--*/
 set statistics time on
SELECT [UpVotes] - [DownVotes] AS SumVotes FROM [StackOverflowMini].[dbo].[Users]
 set statistics time off

--4. Como “proof of concept”, crea una Vista de Custom.UserStats que compute las columnas eliminables del Apartado 3 en vez de obtenerlas de la tabla original. (0.5 puntos)


DROP VIEW IF EXISTS Custom.U;
GO

CREATE VIEW Custom.U AS
SELECT UserId,
	U.DisplayName,
	QuestionCount + AnswerCount AS PostCount, 
	QuestionCount, 
	AnswerCount
    AcceptedAnswerCount,
    CommentCount,
    PostEdits,
    BadgeAmount,
    UniqueBadgeAmount
    BadgeTitles,
    LastPostDate,
    U.Reputation,
    U.UpVotes,
    U.DownVotes,
	U.UpVotes - U.DownVotes  AS SumVotes
FROM Custom.UserStats C
JOIN Users U
ON C.UserID = U.ID
GO


/*
--Nota: que la Vista sea significativamente más lenta no implica que vuestro Apartado 3 esté mal ya que en la práctica solo computarías las columnas que necesitas.


--5. Partiendo de los Apartados 1, 2 y 3, indica qué otras modificaciones podríamos realizar para mejorar la integridad (reducir la desincronización) de la tabla sin que nuestras consultas pierdan demasiada velocidad. (0.5 puntos)

--No queremos que tarde varios segundos
--También queremos que escale adecuadamente con el tamaño de la tabla
--Es decir, que no queremos que se vuelva exponencialmente más lenta
--Repasad cómo afectan las distintas cosas a la velocidad de los Joins
--Vigilad con la complejidad de realizar ciertos cálculos

[PostCount], [QuestionCount] ,[AnswerCount],[AcceptedAnswerCount],[CommentCount],[PostEdits] ,[BadgeAmount] ,[UniqueBadgeAmount],[BadgeTitles],[LastPostDate]
No permitir que estas columnas tengan valores nulos.

Crear indices [DisplayName] para obtenerlos ordenados alfabeticamente.

[PostCount],[QuestionCount],[AnswerCount],[AcceptedAnswerCount],[CommentCount],[PostEdits],[BadgeAmount],[UniqueBadgeAmount],[Reputation],[UpVotes],[DownVotes],[SumVotes] 
Para las columnas con valores numéricos, se pueden ir sumando al valor actual de manera automática, sin tener que sumar todos los votos de nuevo y añadirlos manualmente. (POr ejemplo si tengo 10votos y alguien a añade ahora un voto, pues que se sume este voto al numero total que tenia antes).

[BadgeTitles], [DisplayName]. Antes de crear un nuevo Badge o DisplayName, asegurar que no existen.


--6. Partiendo de la vista del Apartado 4, implementad las mejoras del Apartado 5 (0.5 puntos)

--Recordad, si no lográis/sabéis hacer algo, entregad una vista que funcione y poned en comentarios qué os ha fallado
Se ha intentado crear el indice de DsiplayName, para los demás puntos comentados anteriormente no se han podido realizar porque habria que crear triggers y 
no se aplica a las vistas.
--*/
CREATE INDEX [IX_DisplayName] ON Custom.UserStats (DisplayName ASC)

CREATE VIEW Custom.U AS
SELECT UserId,
	U.DisplayName,
	QuestionCount + AnswerCount AS PostCount, 
	QuestionCount, 
	AnswerCount
    AcceptedAnswerCount,
    CommentCount,
    PostEdits,
    BadgeAmount,
    UniqueBadgeAmount
    BadgeTitles,
    LastPostDate,
    U.Reputation,
    U.UpVotes,
    U.DownVotes,
	U.UpVotes - U.DownVotes  AS SumVotes
FROM Custom.UserStats C
JOIN Users U
ON C.UserID = U.ID
GO

