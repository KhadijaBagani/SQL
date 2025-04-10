
--20-Crea una tabla de dos columnas. (La primera columna es el nombre del departamento (HumanResources.Department).
--La segunda consulta es la lista, separando cada empleado con una barra vertical "|", del apellido y el nombre (Person.Person), separados por una coma,  de cada empleado del departamento.
--La tabla mostrará los datos de los departamentos con menos de 4 empleados.

USE AdventureWorks2022
SELECT D.Name AS Departamento, STRING_AGG(P.LastName + ',' + P.FirstName, '|') AS Lista
FROM HumanResources.Employee E
INNER JOIN Person.Person P
ON E.BusinessEntityID = P.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory ED
ON ED.BusinessEntityID = E.BusinessEntityID
INNER JOIN HumanResources.Department D
ON D.DepartmentID = ED.DepartmentID
GROUP BY D.Name
HAVING COUNT(e.BusinessEntityID) < 4