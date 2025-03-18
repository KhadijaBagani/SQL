/******************************************************************
Queries para practivar el filtrado
*******************************************************************/

-- 01 �Qu� registros tienen un Status igual a 4 y un SubTotal mayor de 10,000?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where Status = 4 And SubTotal > 10000

-- 02 �Cu�les son las �rdenes con una ShipMethodID igual a 5 y un TaxAmt inferior a 50?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where  ShipMethodID = 5 And TaxAmt < 50

-- 03 �Qu� PurchaseOrderID tiene un TotalDue entre 1,000 y 2,000?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where  TotalDue like '1___.%' or TotalDue like '2000.000%'

-- 04 �Qu� registros tienen un OrderDate posterior al 2012-01-01?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where OrderDate > '2012-01-01'

-- 05 �Qu� filas tienen un VendorID diferente a 1600?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where VendorID != '16000'

-- 06 �Cu�les son las �rdenes donde Freight es mayor que el 10% de SubTotal?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where Subtotal * 0.10 < Freight

-- 07 �Cu�les son las filas en las que el EmployeeID est� en el rango de 250 a 260?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where EmployeeID like '25_' or EmployeeID like '260'

-- 08 �Qu� registros tienen un PurchaseOrderID igual a 9 o 10?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where PurchaseOrderID = 9 or PurchaseOrderID = 10

-- 09 �Qu� filas tienen un ShipDate exactamente igual a la fecha de ModifiedDate?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where ShipDate = ModifiedDate

-- 10 �Qu� filas tienen un SubTotal mayor o igual a 50,000 y un Freight menor o igual a 2,000?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where SubTotal >= 50000 and Freight <= 2000


-- 11 �Qu� filas tienen un TaxAmt superior a 10 y un TotalDue inferior a 100?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where TaxAmt > 10  and TotalDue < 100

-- 12 �Qu� filas tienen un Status que no es 4?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where status <> 4

-- 13 �Cu�les son las �rdenes donde ShipMethodID comienza por el n�mero 2 (usa LIKE)?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where ShipMethodID like '2'

-- 14 �Qu� registros tienen un OrderDate en 2011?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where OrderDate like '%2011%'

-- 15 �Qu� filas tienen un SubTotal igual a la suma de TaxAmt y Freight?
Select SubTotal, TaxAmt + Freight as suma From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where SubTotal = TaxAmt + Freight;

-- 16 �Cu�les son las �rdenes cuyo EmployeeID es mayor que 255 y cuyo ShipMethodID es igual a 5?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where EmployeeID > 255 and ShipMethodID = 5

-- 17 �Qu� �rdenes tienen un VendorID entre 1500 y 1600?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where VendorID like '15__' or VendorID like '1600'

-- 18 �Qu� registros tienen un PurchaseOrderID mayor a 50 o un TotalDue menor que 500?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where PurchaseOrderID > 50 or TotalDue < 500

-- 19 �Qu� registros tienen un TaxAmt superior a 1 y un Freight entre 10 y 20?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where TaxAmt > 1 and (Freight like '10.%' or Freight like '20.000')

-- 20 �Qu� filas tienen un Status que sea 1, 3 o 5?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where Status in (1,3,5)

-- 21 �Qu� registros tienen un ShipDate que no sea NULL?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where ShipDate is not null

-- 22 �Qu� filas tienen un ShipMethodID mayor que 3 y un OrderDate antes de 2012-01-01?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where ShipMethodID > 3 and OrderDate < '2012-01-01'

-- 23 �Qu� registros tienen un ModifiedDate igual al ShipDate y un Status de 4?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where ModifiedDate = ShipDate and  Status = 4

-- 24 �Qu� filas tienen un TotalDue superior a 25,000 y un PurchaseOrderID que finaliza en 5 (usa LIKE)?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
where TotalDue > 25000 and PurchaseOrderID like '%5'

-- 25 �Qu� registros tienen un ShipDate al menos 10 d�as despu�s del OrderDate?
Select * From [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
Where (ShipDate - OrderDate) >10