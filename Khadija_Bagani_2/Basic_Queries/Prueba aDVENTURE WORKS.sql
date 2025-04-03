---Cuantos empleados hay 
Select COUNT(*)from HumanResources.Employee

---Cuantos empleados estan en departamento ventas
SELECT * FROM HumanResources.Employee 
INNER JOIN HumanResources.EmployeeDepartmentHistory 
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department 
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
WHERE Name = 'Sales';

---Productos con precio mayor a 100
SELECT*FROM Production.Product
WHERE ListPrice > 100

---Clientes que han hecho compras en 2023
SELECT CustomerID FROM Sales.SalesOrderHeader
where Year(OrderDate) = 2023

---Qu� empleados est�n asignados a cada departamento?
SELECT Department.Name, Employee.BusinessEntityID
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory 
ON Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department 
ON EmployeeDepartmentHistory.DepartmentID = Department.DepartmentID;

--�Qu� empleados fueron contratados despu�s de 2015?
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE YEAR(HireDate) > 2015

---�Cu�les son los productos m�s vendidos por categor�a?
SELECT SUM(SalesOrderDetail.OrderQty) total, ProductCategory.Name as category, Product.Name FROM Sales.SalesOrderDetail
INNER JOIN Production.product
ON Product.ProductID = SalesOrderDetail.ProductID
INNER JOIN Production.ProductCategory
ON ProductCategory.ProductCategoryID = Product.ProductSubcategoryID
GROUP BY ProductCategory.Name, Product.Name
ORDER BY total DESC

--�Cu�les son los productos con inventario bajo en los almacenes?
SELECT ProductInventory.ProductID, ProductInventory.Quantity FROM Production.ProductInventory
INNER JOIN Production.Product
ON Product.ProductID = ProductInventory.ProductID
ORDER BY Quantity

---�Qu� territorios de ventas generaron m�s ingresos?
SELECT SalesTerritory.TerritoryID, SUM(SalesOrderHeader.TotalDue) as total FROM Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory
ON SalesOrderHeader.TerritoryID = SalesTerritory.TerritoryID
GROUP BY SalesTerritory.TerritoryID
ORDER BY total desc

---�Cu�ntos clientes realizaron pedidos en 2024?
SELECT Count(DISTINCT CustomerID) FROM Sales.SalesOrderHeader
WHERE Year(OrderDate) = 2024

---Identificar empleados en m�ltiples departamentos: �Qu� empleados han trabajado en m�s de un departamento?
SELECT Employee.BusinessEntityID, Person.FirstName, Person.LastName, COUNT(DISTINCT EmployeeDepartmentHistory.DepartmentID) AS Numero_Departamentos
FROM HumanResources.Employee 
JOIN Person.Person 
ON Employee.BusinessEntityID = Person.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory 
ON Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
GROUP BY Employee.BusinessEntityID, Person.FirstName, Person.LastName
HAVING COUNT(DISTINCT EmployeeDepartmentHistory.DepartmentID) > 1
ORDER BY Numero_Departamentos DESC;

---Historial de inventario: �Cu�l es la cantidad promedio de inventario de cada producto durante el a�o pasado?
SELECT Product.Name AS Producto, AVG(ProductInventory.Quantity) AS Promedio_Inventario
FROM Production.ProductInventory 
JOIN Production.Product 
ON ProductInventory.ProductID = Product.ProductID
WHERE ProductInventory.ModifiedDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY Product.Name
ORDER BY Promedio_Inventario DESC;

---Clientes frecuentes: �Cu�les son los 5 clientes con m�s compras en t�rminos de ingresos?
SELECT TOP 5 Customer.CustomerID, Person.FirstName, Person.LastName, SUM(SalesOrderDetail.LineTotal) AS Ingresos_Totales
FROM Sales.Customer 
JOIN Person.Person  
ON Customer.PersonID = Person.BusinessEntityID
JOIN Sales.SalesOrderHeader 
ON Customer.CustomerID = SalesOrderHeader.CustomerID
JOIN Sales.SalesOrderDetail 
ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
GROUP BY Customer.CustomerID, Person.FirstName, Person.LastName
ORDER BY Ingresos_Totales DESC;

---�rdenes pendientes: �Cu�ntas �rdenes de compra est�n pendientes y cu�les son sus detalles?
SELECT PurchaseOrderHeader.PurchaseOrderID, Vendor.Name AS Proveedor, PurchaseOrderHeader.OrderDate, PurchaseOrderHeader.Status
FROM Purchasing.PurchaseOrderHeader 
JOIN Purchasing.Vendor 
ON PurchaseOrderHeader.VendorID = Vendor.BusinessEntityID
WHERE PurchaseOrderHeader.Status != 4 -- 4 indica �rdenes completadas
ORDER BY PurchaseOrderHeader.OrderDate DESC;

---Productos con devoluciones: �Qu� productos tuvieron devoluciones y cu�l fue la cantidad total devuelta?
SELECT Product.Name AS Producto, SUM(SalesOrderDetail.OrderQty) AS Cantidad_Devuelta
FROM Sales.SalesOrderDetail 
JOIN Production.Product 
ON SalesOrderDetail.ProductID = Product.ProductID
WHERE SalesOrderDetail.SpecialOfferID = 1 -- Supongamos que ID 1 indica devoluciones
GROUP BY Product.Name
ORDER BY Cantidad_Devuelta DESC;

---Comparar ventas y territorios: �Qu� territorios de ventas tienen las mayores ventas promedio por cliente?
SELECT SalesTerritory.Name AS Territorio, AVG(SalesOrderDetail.LineTotal) AS Ventas_Promedio
FROM Sales.SalesOrderHeader 
JOIN Sales.SalesOrderDetail 
ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN Sales.SalesTerritory  
ON SalesOrderHeader.TerritoryID = SalesTerritory.TerritoryID
GROUP BY SalesTerritory.Name
ORDER BY Ventas_Promedio DESC;

---Relaci�n entre categor�as de productos y ventas: �Qu� categor�as de productos generan m�s ingresos por regi�n?
SELECT SalesTerritory.Name AS Region, ProductCategory.Name AS Categoria, SUM(SalesOrderDetail.LineTotal) AS Ingresos_Totales
FROM Sales.SalesOrderDetail 
JOIN Production.Product  
ON SalesOrderDetail.ProductID = Product.ProductID
JOIN Production.ProductSubcategory 
ON Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
JOIN Production.ProductCategory 
ON ProductSubcategory.ProductCategoryID = ProductCategory.ProductCategoryID
JOIN Sales.SalesOrderHeader 
ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
JOIN Sales.SalesTerritory 
ON SalesOrderHeader.TerritoryID = SalesTerritory.TerritoryID
GROUP BY SalesTerritory.Name, ProductCategory.Name
ORDER BY Ingresos_Totales DESC;

---Duraci�n del empleo: �Cu�ntos a�os en promedio llevan los empleados trabajando en la empresa?
SELECT AVG(DATEDIFF(YEAR, Employee.HireDate, GETDATE())) AS Promedio_Trabajo
FROM HumanResources.Employee;

