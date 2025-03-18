-- 00 Mostramos 10 registros de la tabla para familiarizarnos con ella
USE AdventureWorks2022;
Select top 10 * from Purchasing.PurchaseOrderHeader;

-- 01 �Cu�l es la suma total de SubTotal para todos los registros?
SELECT SUM(SubTotal) AS TotalSubTotal
FROM Purchasing.PurchaseOrderHeader;


-- 02 �Cu�l es el valor promedio de TaxAmt en la tabla?
SELECT AVG(TaxAmt) AS Promedio
FROM Purchasing.PurchaseOrderHeader;


-- 03 �Cu�ntos registros tienen un Status igual a 4?

SELECT Status, Count (*) as StatusGrupo
FROM Purchasing.PurchaseOrderHeader
GROUP BY Status
Having Status = 4

SELECT Status, Count (*) as StatusGrupo
FROM Purchasing.PurchaseOrderHeader
Where status = 4
GROUP BY Status


-- 04 �Cu�l es el TotalDue m�s alto en la tabla?
SELECT Max(TotalDue)  as MAXTotalDue
FROM Purchasing.PurchaseOrderHeader;


-- 05 �Cu�l es el SubTotal m�s bajo en la tabla?
SELECT Min(Subtotal) as MinSubtotal
FROM Purchasing.PurchaseOrderHeader;


-- 06 �Cu�l es la cantidad de �rdenes por cada EmployeeID?
SELECT EmployeeID, Count(*) as OrdenesPorEmpleado
FROM Purchasing.PurchaseOrderHeader
Group by EmployeeID


-- 07 �Qu� ShipMethodID tiene el promedio m�s alto de Freight?
SELECT ShipMethodID, AVG(Freight) as Promedio, Max(Freight) as MaxFreight
FROM Purchasing.PurchaseOrderHeader
Group By ShipMethodID

-- 08 �Cu�ntos registros hay en la tabla que tengan un VendorID mayor que 1600?
SELECT VendorID  
FROM Purchasing.PurchaseOrderHeader
Group by VendorID 
Having VendorID > 1600

-- 09 �Cu�l es la suma de TotalDue para cada ShipMethodID?
SELECT ShipMethodID, Sum(TotalDue) as SumTotalDue
FROM Purchasing.PurchaseOrderHeader
Group by ShipMethodID 


-- 10 �Cu�l es el n�mero total de �rdenes realizadas en cada a�o (bas�ndote en OrderDate)?
SELECT YEAR(OrderDate) as Year, Count (*) as OrdenesPorA�o
FROM Purchasing.PurchaseOrderHeader
Group By YEAR(OrderDate)


-- 11 �Qu� VendorID tiene la mayor cantidad de registros asociados?
SELECT VendorID, Count (*) as registros
FROM Purchasing.PurchaseOrderHeader
Group by VendorID
Order by registros Desc



-- 12 �Cu�l es la suma total de Freight por cada Status?
SELECT Status, Sum(Freight) as SUMAFreight
FROM Purchasing.PurchaseOrderHeader
Group by Status

-- 13 �Cu�l es la cantidad de �rdenes realizadas por cada ShipDate?
SELECT ShipDate, Count(PurchaseOrderID ) as Ordenes
FROM Purchasing.PurchaseOrderHeader
group BY ShipDate 

-- 14 �Qu� EmployeeID gener� el mayor TotalDue en suma?
SELECT Top 1 EmployeeID, SUM(TotalDue) as sumtotaldue
FROM  Purchasing.PurchaseOrderHeader
Group by EmployeeID 
Order by sumtotaldue Desc


-- 15 �Cu�l es el valor promedio de SubTotal para las �rdenes con un TaxAmt superior a 50?
SELECT TaxAMT, Avg(Subtotal) as PromSubtotal
FROM Purchasing.PurchaseOrderHeader
Group by TaxAmt 
Having TaxAmt > 50  



-- 16 �Cu�l es el valor m�ximo de TaxAmt para cada ShipMethodID?
SELECT ShipMethodID, Max(TaxAMT) as MAXTaxAMT
FROM Purchasing.PurchaseOrderHeader
Group by ShipMethodID 


-- 17 �Cu�ntos registros hay por cada combinaci�n de EmployeeID y ShipMethodID?
SELECT EmployeeID, ShipMethodID, GROUPING_ID(EmployeeID, ShipMethodID) as Agrupacion
FROM Purchasing.PurchaseOrderHeader
GROUP BY GROUPING SETS ((EmployeeID), (ShipMethodID));

-- 18 �Cu�l es el valor m�nimo de Freight para los registros con un SubTotal mayor a 20,000?
SELECT TOp 1 Subtotal,  Min(Freight) as MINFreight
FROM Purchasing.PurchaseOrderHeader
Group by Subtotal
Having Subtotal > 20000
Order by MINFreight 

-- 19 �Cu�l es el promedio de TotalDue para cada a�o basado en OrderDate?
SELECT Year(OrderDate) as Year, Avg(TotalDue) as PromedioTotalDue
FROM Purchasing.PurchaseOrderHeader
Group by Year(OrderDate)


-- 20 �Qu� Purchasing.PurchaseOrderHeaderID tiene el mayor valor de Freight asociado?
SELECT Top 1 PurchaseOrderID, Max(Freight) as MaxFreight
FROM Purchasing.PurchaseOrderHeader
Group by PurchaseOrderID
Order by MaxFreight Desc

-- 21 �Cu�l es la suma total de TaxAmt por cada combinaci�n de Status y ShipMethodID?
SELECT Status, ShipMethodID, GROUPING_ID(Status, ShipMethodID) as Agrupacion, SUM(TaxAmt) AS SumTaxAMT
FROM Purchasing.PurchaseOrderHeader
GROUP BY GROUPING SETS ((Status), (ShipMethodID));


-- 22 �Cu�ntos registros tienen un OrderDate en cada mes del a�o 2011?
SELECT Year(OrderDate) as Year, Month(OrderDate) as Month, Sum(PurchaseOrderID) SumRegistros
FROM Purchasing.PurchaseOrderHeader
Group by YEAR(OrderDate), MONTH(OrderDate)
Having Year(OrderDate) = 2011


-- 23 �Cu�l es el valor promedio de Freight para los registros donde EmployeeID es mayor que 255?
SELECT EmployeeID, AVG(Freight) as PromedioFreight
FROM Purchasing.PurchaseOrderHeader
Group by EmployeeID
Having EmployeeID > 255

-- 24 �Cu�l es el menor SubTotal registrado por cada ShipMethodID?
SELECT ShipMethodID, MIN(SubTotal) as MINSubtotal
FROM Purchasing.PurchaseOrderHeader
Group by ShipMethodID


-- 25 �Cu�ntos registros tienen un ShipDate anterior al ModifiedDate?
Select Count (*) 
FROM Purchasing.PurchaseOrderHeader
Where ShipDate < ModifiedDate 
Select * 
FROM Purchasing.PurchaseOrderHeader
Where ShipDate < ModifiedDate 
