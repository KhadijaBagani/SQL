---05-¿Cuál es el apellido(Person.person) de los dos empleados (HumanResources.Employee) con el salario base más alto (HumanResources.EmployeePayHistory.Rate)?
USE AdventureWorks2022
SELECT TOP 2 P.LastName, Rate FROM Person.Person AS P
INNER JOIN HumanResources.Employee AS E
ON P.BusinessEntityID = E.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory AS EPH
ON EPH.BusinessEntityID = E.BusinessEntityID 
ORDER BY EPH.Rate DESC
