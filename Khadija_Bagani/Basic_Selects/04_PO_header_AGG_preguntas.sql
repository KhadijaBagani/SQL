-- 00 Mostramos 10 registros de la tabla para familiarizarnos con ella
USE AdventureWorks2022;
Select top 10 * from Purchasing.PurchaseOrderHeader;

-- 01 ¿Cuál es la suma total de SubTotal para todos los registros?
SELECT SUM(SubTotal) AS TotalSubTotal
FROM Purchasing.PurchaseOrderHeader;


-- 02 ¿Cuál es el valor promedio de TaxAmt en la tabla?
SELECT AVG(TaxAmt) AS Promedio
FROM Purchasing.PurchaseOrderHeader;


-- 03 ¿Cuántos registros tienen un Status igual a 4?

SELECT Status, Count (*) as StatusGrupo
FROM Purchasing.PurchaseOrderHeader
GROUP BY Status
Having Status = 4

SELECT Status, Count (*) as StatusGrupo
FROM Purchasing.PurchaseOrderHeader
Where status = 4
GROUP BY Status


-- 04 ¿Cuál es el TotalDue más alto en la tabla?
SELECT Max(TotalDue)  as MAXTotalDue
FROM Purchasing.PurchaseOrderHeader;


-- 05 ¿Cuál es el SubTotal más bajo en la tabla?
SELECT Min(Subtotal) as MinSubtotal
FROM Purchasing.PurchaseOrderHeader;


-- 06 ¿Cuál es la cantidad de órdenes por cada EmployeeID?
SELECT EmployeeID, Count(*) as OrdenesPorEmpleado
FROM Purchasing.PurchaseOrderHeader
Group by EmployeeID


-- 07 ¿Qué ShipMethodID tiene el promedio más alto de Freight?
SELECT ShipMethodID, AVG(Freight) as Promedio, Max(Freight) as MaxFreight
FROM Purchasing.PurchaseOrderHeader
Group By ShipMethodID

-- 08 ¿Cuántos registros hay en la tabla que tengan un VendorID mayor que 1600?
SELECT VendorID  
FROM Purchasing.PurchaseOrderHeader
Group by VendorID 
Having VendorID > 1600

-- 09 ¿Cuál es la suma de TotalDue para cada ShipMethodID?
SELECT ShipMethodID, Sum(TotalDue) as SumTotalDue
FROM Purchasing.PurchaseOrderHeader
Group by ShipMethodID 


-- 10 ¿Cuál es el número total de órdenes realizadas en cada año (basándote en OrderDate)?
SELECT YEAR(OrderDate) as Year, Count (*) as OrdenesPorAño
FROM Purchasing.PurchaseOrderHeader
Group By YEAR(OrderDate)


-- 11 ¿Qué VendorID tiene la mayor cantidad de registros asociados?
SELECT VendorID, Count (*) as registros
FROM Purchasing.PurchaseOrderHeader
Group by VendorID
Order by registros Desc



-- 12 ¿Cuál es la suma total de Freight por cada Status?
SELECT Status, Sum(Freight) as SUMAFreight
FROM Purchasing.PurchaseOrderHeader
Group by Status

-- 13 ¿Cuál es la cantidad de órdenes realizadas por cada ShipDate?
SELECT ShipDate, Count(PurchaseOrderID ) as Ordenes
FROM Purchasing.PurchaseOrderHeader
group BY ShipDate 

-- 14 ¿Qué EmployeeID generó el mayor TotalDue en suma?
SELECT Top 1 EmployeeID, SUM(TotalDue) as sumtotaldue
FROM  Purchasing.PurchaseOrderHeader
Group by EmployeeID 
Order by sumtotaldue Desc


-- 15 ¿Cuál es el valor promedio de SubTotal para las órdenes con un TaxAmt superior a 50?
SELECT TaxAMT, Avg(Subtotal) as PromSubtotal
FROM Purchasing.PurchaseOrderHeader
Group by TaxAmt 
Having TaxAmt > 50  



-- 16 ¿Cuál es el valor máximo de TaxAmt para cada ShipMethodID?
SELECT ShipMethodID, Max(TaxAMT) as MAXTaxAMT
FROM Purchasing.PurchaseOrderHeader
Group by ShipMethodID 


-- 17 ¿Cuántos registros hay por cada combinación de EmployeeID y ShipMethodID?
SELECT EmployeeID, ShipMethodID, GROUPING_ID(EmployeeID, ShipMethodID) as Agrupacion
FROM Purchasing.PurchaseOrderHeader
GROUP BY GROUPING SETS ((EmployeeID), (ShipMethodID));

-- 18 ¿Cuál es el valor mínimo de Freight para los registros con un SubTotal mayor a 20,000?
SELECT TOp 1 Subtotal,  Min(Freight) as MINFreight
FROM Purchasing.PurchaseOrderHeader
Group by Subtotal
Having Subtotal > 20000
Order by MINFreight 

-- 19 ¿Cuál es el promedio de TotalDue para cada año basado en OrderDate?
SELECT Year(OrderDate) as Year, Avg(TotalDue) as PromedioTotalDue
FROM Purchasing.PurchaseOrderHeader
Group by Year(OrderDate)


-- 20 ¿Qué Purchasing.PurchaseOrderHeaderID tiene el mayor valor de Freight asociado?
SELECT Top 1 PurchaseOrderID, Max(Freight) as MaxFreight
FROM Purchasing.PurchaseOrderHeader
Group by PurchaseOrderID
Order by MaxFreight Desc

-- 21 ¿Cuál es la suma total de TaxAmt por cada combinación de Status y ShipMethodID?
SELECT Status, ShipMethodID, GROUPING_ID(Status, ShipMethodID) as Agrupacion, SUM(TaxAmt) AS SumTaxAMT
FROM Purchasing.PurchaseOrderHeader
GROUP BY GROUPING SETS ((Status), (ShipMethodID));


-- 22 ¿Cuántos registros tienen un OrderDate en cada mes del año 2011?
SELECT Year(OrderDate) as Year, Month(OrderDate) as Month, Sum(PurchaseOrderID) SumRegistros
FROM Purchasing.PurchaseOrderHeader
Group by YEAR(OrderDate), MONTH(OrderDate)
Having Year(OrderDate) = 2011


-- 23 ¿Cuál es el valor promedio de Freight para los registros donde EmployeeID es mayor que 255?
SELECT EmployeeID, AVG(Freight) as PromedioFreight
FROM Purchasing.PurchaseOrderHeader
Group by EmployeeID
Having EmployeeID > 255

-- 24 ¿Cuál es el menor SubTotal registrado por cada ShipMethodID?
SELECT ShipMethodID, MIN(SubTotal) as MINSubtotal
FROM Purchasing.PurchaseOrderHeader
Group by ShipMethodID


-- 25 ¿Cuántos registros tienen un ShipDate anterior al ModifiedDate?
Select Count (*) 
FROM Purchasing.PurchaseOrderHeader
Where ShipDate < ModifiedDate 
Select * 
FROM Purchasing.PurchaseOrderHeader
Where ShipDate < ModifiedDate 
