--07-�Cu�l ha sido el precio promedio unitario [UnitPrice] de los productos comprados [Purchasing].[PurchaseOrderDetail] en el a�o 2012?
USE AdventureWorks2022
SELECT AVG(UnitPrice) PromedioUnitario FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) = 2012
