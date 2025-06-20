

---# Ejercicio 2:

--Intenta hacer las siguientes consultas de la forma más optima posible

--1. Esta consulta busca poder asociar el nombre de cada persona al nombre de su puesto en la empresa

set statistics time on

SELECT *, E.JobTitle
FROM Person.Person P
LEFT JOIN HumanResources.Employee E
ON P.BusinessEntityID = E.BusinessEntityID
WHERE E.JobTitle IS NOT NULL
GO
set statistics time off

set statistics time on
SELECT P.FirstName, P.LastName, E.JobTitle
FROM Person.Person P
INNER JOIN HumanResources.Employee E
  ON P.BusinessEntityID = E.BusinessEntityID
go
set statistics time off
---2. La siguiente busca encontrar cuantos nombres son compartidos por más de una persona y el número de veces que ocurre por nombre

set statistics time on
SELECT DISTINCT P.FirstName, 
(
	SELECT COUNT(*) 
	FROM Person.Person
	WHERE FirstName = P.FirstName
) as PeopleWithTheName
FROM Person.Person P
WHERE (
	SELECT COUNT(*) 
	FROM Person.Person
	WHERE FirstName = P.FirstName
) >1
GO
set statistics time off

set statistics time on
SELECT DISTINCT P.FirstName, COUNT(*) AS PeopleWithTheName
FROM Person.Person P
GROUP BY P.FirstName
HAVING COUNT(*) > 1;
GO
set statistics time off

---3. A diferencia de la anterior, esta busca encontrar a los que solo tienen una persona que se llama como ellos

set statistics time on
SELECT P1.FirstName, p1.LastName as LastName1, p2.LastName as LastName2
FROM Person.Person P1
JOIN Person.Person P2
ON P1.FirstName = P2.FirstName AND p1.LastName <> p2.LastName
JOIN (
	SELECT  FirstName 
	FROM Person.Person P
	GROUP BY FirstName
	HAVING COUNT(P.LastName) =2
) as N
ON N.FirstName = P1.FirstName
GO
set statistics time off


set statistics time on
SELECT FirstName, Min(lastName) AS LastName1, Max(LastName) LastName2 
From Person.Person 
Group By FirstName
HAVING COUNT(FirstName) = 2 
set statistics time off