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

---Qué empleados están asignados a cada departamento?
SELECT Department.Name, Employee.BusinessEntityID
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory 
ON Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department 
ON EmployeeDepartmentHistory.DepartmentID = Department.DepartmentID;

--¿Qué empleados fueron contratados después de 2015?
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE YEAR(HireDate) > 2015

---¿Cuáles son los productos más vendidos por categoría?
SELECT SUM(SalesOrderDetail.OrderQty) total, ProductCategory.Name as category, Product.Name FROM Sales.SalesOrderDetail
INNER JOIN Production.product
ON Product.ProductID = SalesOrderDetail.ProductID
INNER JOIN Production.ProductCategory
ON ProductCategory.ProductCategoryID = Product.ProductSubcategoryID
GROUP BY ProductCategory.Name, Product.Name
ORDER BY total DESC

--¿Cuáles son los productos con inventario bajo en los almacenes?
SELECT ProductInventory.ProductID, ProductInventory.Quantity FROM Production.ProductInventory
INNER JOIN Production.Product
ON Product.ProductID = ProductInventory.ProductID
ORDER BY Quantity

---¿Qué territorios de ventas generaron más ingresos?
SELECT SalesTerritory.TerritoryID, SUM(SalesOrderHeader.TotalDue) as total FROM Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory
ON SalesOrderHeader.TerritoryID = SalesTerritory.TerritoryID
GROUP BY SalesTerritory.TerritoryID
ORDER BY total desc

---¿Cuántos clientes realizaron pedidos en 2024?
SELECT Count(DISTINCT CustomerID) FROM Sales.SalesOrderHeader
WHERE Year(OrderDate) = 2024

---Identificar empleados en múltiples departamentos: ¿Qué empleados han trabajado en más de un departamento?
SELECT Employee.BusinessEntityID, Person.FirstName, Person.LastName, COUNT(DISTINCT EmployeeDepartmentHistory.DepartmentID) AS Numero_Departamentos
FROM HumanResources.Employee 
JOIN Person.Person 
ON Employee.BusinessEntityID = Person.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory 
ON Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
GROUP BY Employee.BusinessEntityID, Person.FirstName, Person.LastName
HAVING COUNT(DISTINCT EmployeeDepartmentHistory.DepartmentID) > 1
ORDER BY Numero_Departamentos DESC;

---Historial de inventario: ¿Cuál es la cantidad promedio de inventario de cada producto durante el año pasado?
SELECT Product.Name AS Producto, AVG(ProductInventory.Quantity) AS Promedio_Inventario
FROM Production.ProductInventory 
JOIN Production.Product 
ON ProductInventory.ProductID = Product.ProductID
WHERE ProductInventory.ModifiedDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY Product.Name
ORDER BY Promedio_Inventario DESC;

---Clientes frecuentes: ¿Cuáles son los 5 clientes con más compras en términos de ingresos?
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

---Órdenes pendientes: ¿Cuántas órdenes de compra están pendientes y cuáles son sus detalles?
SELECT PurchaseOrderHeader.PurchaseOrderID, Vendor.Name AS Proveedor, PurchaseOrderHeader.OrderDate, PurchaseOrderHeader.Status
FROM Purchasing.PurchaseOrderHeader 
JOIN Purchasing.Vendor 
ON PurchaseOrderHeader.VendorID = Vendor.BusinessEntityID
WHERE PurchaseOrderHeader.Status != 4 -- 4 indica órdenes completadas
ORDER BY PurchaseOrderHeader.OrderDate DESC;

---Productos con devoluciones: ¿Qué productos tuvieron devoluciones y cuál fue la cantidad total devuelta?
SELECT Product.Name AS Producto, SUM(SalesOrderDetail.OrderQty) AS Cantidad_Devuelta
FROM Sales.SalesOrderDetail 
JOIN Production.Product 
ON SalesOrderDetail.ProductID = Product.ProductID
WHERE SalesOrderDetail.SpecialOfferID = 1 -- Supongamos que ID 1 indica devoluciones
GROUP BY Product.Name
ORDER BY Cantidad_Devuelta DESC;

---Comparar ventas y territorios: ¿Qué territorios de ventas tienen las mayores ventas promedio por cliente?
SELECT SalesTerritory.Name AS Territorio, AVG(SalesOrderDetail.LineTotal) AS Ventas_Promedio
FROM Sales.SalesOrderHeader 
JOIN Sales.SalesOrderDetail 
ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN Sales.SalesTerritory  
ON SalesOrderHeader.TerritoryID = SalesTerritory.TerritoryID
GROUP BY SalesTerritory.Name
ORDER BY Ventas_Promedio DESC;

---Relación entre categorías de productos y ventas: ¿Qué categorías de productos generan más ingresos por región?
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

---Duración del empleo: ¿Cuántos años en promedio llevan los empleados trabajando en la empresa?
SELECT AVG(DATEDIFF(YEAR, Employee.HireDate, GETDATE())) AS Promedio_Trabajo
FROM HumanResources.Employee;

