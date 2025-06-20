---# Ejercicio 1: Coste de los joins

---Antes de nada, ejecuta el script **[Custom Tables Joins](./Custom%20Tables%20Joins.sql)** en tu BBDD

---1. Crea un join que empareje cada persona en **Custom.ModifiedPerson** con las otras personas de esa tabla que comparten su nombre (salvo si mismo)
	--- Devolver solo Nombre, Apellido de la persona 1 y apellido de la persona 2

set statistics time on
SELECT DISTINCT  C.FirstName, C.LastName, CMP.LastName FROM Custom.ModifiedPerson  AS C
JOIN Custom.ModifiedPerson AS CMP
ON C.FirstName = CMP.FirstName AND C.BusinessEntityID <> CMP.BusinessEntityID
GO
set statistics time oFF




---2. Compara qué ocurre cuando ejecutas la misma query usando **Person.Person** en vez de **Custom.ModifiedPerson** explica el porqué de la diferencia.

set statistics time on
SELECT DISTINCT  P.FirstName, P.LastName as LastName1, PP.LastName as LastName2 
FROM Person.Person  AS P
JOIN Person.Person AS PP 
ON P.FirstName = PP.FirstName and P.BusinessEntityID <> PP.BusinessEntityID

GO
set statistics time oFF

---La tabla Custom.ModifiedPerson agrupa las columnas con el mismo registro antes combinarlas.
--Mientras que tabla Person.Person hace la combinación de las tablas sin agrupar los mismos registros de la columna Apellidos de la segunda tabla.