
--02-¿Cuál es el apellido ([Person].[Person]) del empleado de mayor edad ([HumanResources].[Employee])? 
USE AdventureWorks2022
SELECT TOP 1 P.LastName FROM Person.Person AS P
INNER JOIN HumanResources.Employee AS E
ON E.BusinessEntityID = P.BusinessEntityID
ORDER BY E.BirthDate 