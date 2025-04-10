---Queries AdventureWorks 2022 
 

--01- ¿Cuántos empleados de la tabla HumanResources.Employee tienen más de 17 años trabajando en la empresa? 
SELECT COUNT(*) NºEmpleados FROM HumanResources.Employee
WHERE DATEDIFF(YEAR,HireDate, GETDATE()) > 17

--02-¿Cuál es el apellido ([Person].[Person]) del empleado de mayor edad ([HumanResources].[Employee])? 
SELECT TOP 1 P.LastName FROM Person.Person AS P
INNER JOIN HumanResources.Employee AS E
ON E.BusinessEntityID = P.BusinessEntityID
ORDER BY E.BirthDate 

--03-¿Cuál es el valor promedio del salario base (Rate) de todos los empleados de la tabla HumanResources.EmployeePayHistory?
SELECT AVG(Rate) Promedio FROM HumanResources.EmployeePayHistory


--04-¿Cuál es el número total de productos disponibles en la base de datos AdventureWorks (tabla Production.Product)?
SELECT COUNT(*) Total FROM Production.Product


--05-¿Cuál es el apellido(Person.person) de los dos empleados (HumanResources.Employee) con el salario base más alto (HumanResources.EmployeePayHistory.Rate)?
USE AdventureWorks2022
SELECT TOP 2 P.LastName, Rate FROM Person.Person AS P
INNER JOIN HumanResources.Employee AS E
ON P.BusinessEntityID = E.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory AS EPH
ON EPH.BusinessEntityID = E.BusinessEntityID 
ORDER BY EPH.Rate DESC


--06-¿Cual es el Coste total de las unidades rechazadas (RejectedQty) en todos los pedidos de compra [Purchasing].[PurchaseOrderDetail]?

USE AdventureWorks2022
SELECT SUM(RejectedQty * UnitPrice) TotalRechazadas FROM  Purchasing.PurchaseOrderDetail


--07-¿Cuál ha sido el precio promedio unitario [UnitPrice] de los productos comprados [Purchasing].[PurchaseOrderDetail] en el año 2012?
USE AdventureWorks2022
SELECT AVG(UnitPrice) PromedioUnitario FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) = 2012

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
--21-Para los pedidos (Sales.SalesOrderHeader) realizados después del 1 de enero de 2012 (OrderDate) 
--¿Qué número de cliente (CustomerID) tiene una suma de las ventas (TotalDue) en el rango 19 000 y 19 500?
USE AdventureWorks2022
SELECT CustomerID FROM Sales.SalesOrderHeader
WHERE OrderDate > '2012-01-01'
GROUP BY CustomerID
HAVING SUM(TotalDue) BETWEEN 19000 AND 19500;


--30-¿Qué categoría de produtos ([Production].[ProductCategory]) tiene una subcategoría ([Production].[ProductSubcategory]) que supone el 0,79% del total de productos ([Production].[Product] ?
USE AdventureWorks2022
SELECT PPC.Name, Count(PP.ProductID) AS ProductosTotales, (COUNT(PP.ProductID) * 100.0 / (SELECT COUNT(*) FROM [Production].[Product])) AS Porcentaje 
FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PPS
ON PPS.ProductSubcategoryID = PP.ProductSubcategoryID
INNER JOIN Production.ProductCategory  PPC
ON PPS.ProductCategoryID = PPC.ProductCategoryID
GROUP BY PPC.Name
HAVING (COUNT(PP.ProductID) * 100.0 / (SELECT COUNT(*) FROM [Production].[Product])) = 0.79


--31-Resume todos los registros de la tabla de empleados [HumanResources].[Employee] para saber cuántas personas de cada género (Gender) se contratan cada mes (HireDate) de forma que puedas aislar el mes en el que se han contratado menos mujeres para poder contestar a las pregunta: ¿En que mes se han contratado menos mujeres?
USE AdventureWorks2022
SELECT TOP 1 MONTH(HireDate) Mes, Gender, COUNT(*) TOTAL FROM HumanResources.Employee 
GROUP BY MONTH(HireDate), Gender
HAVING Gender = 'F'
ORDER BY Total

--99-¿Cual es el nombre (FirstName) más frecuente del subconjunto de los personas ([Person].[Person]) que tienen un nombre de 10 letras?
USE AdventureWorks2022
SELECT TOP 1 FirstName, COUNT(*) AS Recuento FROM Person.Person
WHERE LEN(FirstName) = 10
GROUP BY FirstName 
ORDER BY COUNT(*) DESC
