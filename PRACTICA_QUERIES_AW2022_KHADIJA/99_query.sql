--99-¿Cual es el nombre (FirstName) más frecuente del subconjunto de los personas ([Person].[Person]) que tienen un nombre de 10 letras?
USE AdventureWorks2022
SELECT TOP 1 FirstName, COUNT(*) AS Recuento FROM Person.Person
WHERE LEN(FirstName) = 10
GROUP BY FirstName 
ORDER BY COUNT(*) DESC
